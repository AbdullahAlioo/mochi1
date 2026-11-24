import 'dart:async';
import 'dart:convert';
import 'dart:ffi' hide Size;
import 'dart:io';
import 'dart:ui';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:window_manager/window_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:win32/win32.dart';

// ================= BOT NOTIFICATION EVENT MODEL =================
class BotNotificationEvent {
  final bool isQuestion;
  final String title;
  final String body;
  final String qId;
  final List<String> options;
  final bool isAngry;

  BotNotificationEvent.question({
    required this.title,
    required this.body,
    required this.qId,
    required this.options,
  })  : isQuestion = true,
        isAngry = false;

  BotNotificationEvent.status({
    required this.title,
    required this.body,
    this.isAngry = false,
  })  : isQuestion = false,
        qId = '',
        options = const [];
}

// ================= MACOS SERIAL PORT IMPLEMENTATION =================
class MacSerialPort {
  final String path;
  RandomAccessFile? _readRaf;
  RandomAccessFile? _writeRaf;
  bool _isListening = false;

  MacSerialPort(this.path);

  bool get isOpened => _readRaf != null && _writeRaf != null;

  Future<bool> open() async {
    try {
      Process.runSync('stty', ['-f', path, '115200', 'raw', '-echo', 'cs8', '-cstopb', '-parenb']);
      final file = File(path);
      _readRaf = await file.open(mode: FileMode.read);
      _writeRaf = await file.open(mode: FileMode.writeOnly);
      return true;
    } catch (e) {
      debugPrint('MacSerialPort open error: $e');
      return false;
    }
  }

  void close() {
    _isListening = false;
    try {
      _readRaf?.closeSync();
    } catch (_) {}
    try {
      _writeRaf?.closeSync();
    } catch (_) {}
    _readRaf = null;
    _writeRaf = null;
  }

  Future<void> writeString(String str) async {
    if (_writeRaf == null) return;
    try {
      await _writeRaf!.writeString(str);
      await _writeRaf!.flush();
    } catch (e) {
      debugPrint('MacSerialPort write error: $e');
    }
  }

  void startListening(Function(String) onData) {
    if (_isListening || _readRaf == null) return;
    _isListening = true;
    _readLoop(onData);
  }

  void _readLoop(Function(String) onData) async {
    while (_isListening && _readRaf != null) {
      try {
        final bytes = await _readRaf!.read(512);
        if (bytes.isNotEmpty) {
          final str = utf8.decode(bytes, allowMalformed: true);
          onData(str);
        } else {
          await Future.delayed(const Duration(milliseconds: 30));
        }
      } catch (_) {
        break;
      }
    }
  }
}

// ================= BOT BACKGROUND SERIAL & NOTIFICATION SERVICE =================
class BotService {
  static final BotService instance = BotService._();
  BotService._();

  SerialPort? _port;
  MacSerialPort? _macPort;
  bool isConnected = false;
  String activePortName = '';
  String currentMode = 'HUMOROUS'; // HUMOROUS, PRODUCTIVE, QUIET
  int questionIntervalSec = 30;    // Configurable: 30s, 120s, 300s, 600s
  bool _isListening = false;
  String _buffer = '';
  File? _logFile;
  Timer? _watchdogTimer;
  VoidCallback? onOpenSettings;
  final activeNotification = ValueNotifier<BotNotificationEvent?>(null);
  bool _isConnecting = false;

  String _lastStatusTitle = '';
  DateTime _lastStatusTime = DateTime.fromMillisecondsSinceEpoch(0);

  void log(String message) {
    try {
      final line = '[${DateTime.now().toIso8601String()}] $message\n';
      debugPrint(line);
      if (_logFile == null) {
        String logDir;
        if (Platform.isWindows) {
          final appData = Platform.environment['APPDATA'] ?? Directory.current.path;
          logDir = '$appData\\BotCompanion';
        } else {
          final home = Platform.environment['HOME'] ?? Directory.current.path;
          logDir = '$home/Library/Logs/BotCompanion';
        }
        final dir = Directory(logDir);
        if (!dir.existsSync()) {
          dir.createSync(recursive: true);
        }
        _logFile = File('${dir.path}${Platform.pathSeparator}bot_service.log');
      }
      _logFile!.writeAsStringSync(line, mode: FileMode.append);
    } catch (_) {}
  }

  static List<String> getAvailablePorts() {
    if (Platform.isWindows) {
      try {
        return SerialPort.getAvailablePorts();
      } catch (_) {
        return [];
      }
    } else if (Platform.isMacOS) {
      try {
        final dev = Directory('/dev');
        if (dev.existsSync()) {
          final list = dev
              .listSync()
              .where((e) =>
                  (e.path.contains('/dev/cu.usb') ||
                   e.path.contains('/dev/cu.SLAB') ||
                   e.path.contains('/dev/cu.wch') ||
                   e.path.startsWith('/dev/cu.')) &&
                  !e.path.contains('Bluetooth'))
              .map((e) => e.path)
              .toList();
          list.sort();
          return list;
        }
      } catch (_) {}
    }
    return [];
  }

  bool get isPortHealthy {
    if (!isConnected) return false;
    if (Platform.isWindows && _port != null) {
      try {
        return _port!.isOpened;
      } catch (_) {
        return false;
      }
    } else if (Platform.isMacOS && _macPort != null) {
      return _macPort!.isOpened;
    }
    return false;
  }

  void startWatchdog() {
    _watchdogTimer?.cancel();
    _watchdogTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        if (!isConnected && activePortName.isNotEmpty && !_isConnecting) {
          List<String> available = getAvailablePorts();

          if (available.contains(activePortName)) {
            log('Watchdog detected plugged bot on $activePortName. Auto-connecting...');
            await connect(activePortName);
          }
        }
      } catch (e) {
        log('Watchdog tick error: $e');
      }
    });
    log('Connection watchdog started.');
  }

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      activePortName = prefs.getString('bot_com_port') ?? '';
      currentMode = prefs.getString('bot_mode') ?? 'HUMOROUS';
      questionIntervalSec = prefs.getInt('bot_interval_sec') ?? 30;

      await localNotifier.setup(
        appName: 'Bot Companion',
        shortcutPolicy: ShortcutPolicy.requireCreate,
      );
      log('localNotifier setup successfully');
    } catch (e) {
      log('Init error: $e');
    }
  }

  Future<bool> connect(String portName) async {
    if (_isConnecting) return false;
    _isConnecting = true;
    try {
      if (isConnected && isPortHealthy && activePortName == portName) {
        return true;
      }

      disconnect();
      await Future.delayed(const Duration(milliseconds: 600));

      if (Platform.isWindows) {
        for (int attempt = 1; attempt <= 3; attempt++) {
          try {
            log('Opening serial port $portName at 115200 baud (attempt $attempt)...');
            final port = SerialPort(
              portName,
              BaudRate: 115200,
              openNow: false,
            );

            try {
              port.open();
            } catch (e) {
              log('port.open attempt $attempt note: $e');
            }

            if (!port.isOpened) {
              throw Exception('Port $portName is not opened');
            }

            // Clear RTS (releases ESP32 reset) and Assert DTR (activates CDC)
            try {
              port.setFlowControlSignal(SerialPort.CLRRTS);
              port.setFlowControlSignal(SerialPort.SETDTR);
            } catch (_) {}

            _port = port;
            isConnected = true;
            activePortName = portName;
            log('Serial port $portName opened successfully.');
            startListening();
            await sendMode(currentMode);
            await sendInterval(questionIntervalSec);
            return true;
          } catch (e) {
            log('Error opening port $portName (attempt $attempt): $e');
            disconnect();
            if (attempt < 3) {
              await Future.delayed(const Duration(milliseconds: 800));
            }
          }
        }
      } else if (Platform.isMacOS) {
        for (int attempt = 1; attempt <= 3; attempt++) {
          try {
            log('Opening macOS serial port $portName (attempt $attempt)...');
            final macPort = MacSerialPort(portName);
            bool opened = await macPort.open();
            if (opened) {
              _macPort = macPort;
              isConnected = true;
              activePortName = portName;
              log('macOS serial port $portName opened successfully.');
              macPort.startListening(_onSerialChunk);
              await sendMode(currentMode);
              await sendInterval(questionIntervalSec);
              return true;
            }
          } catch (e) {
            log('Error opening macOS port $portName (attempt $attempt): $e');
            disconnect();
            if (attempt < 3) {
              await Future.delayed(const Duration(milliseconds: 800));
            }
          }
        }
      }
      isConnected = false;
      return false;
    } finally {
      _isConnecting = false;
    }
  }

  void disconnect() {
    _isListening = false;
    isConnected = false;
    if (_port != null) {
      try {
        _port!.close();
      } catch (e) {
        log('Error closing port: $e');
      }
      _port = null;
    }
    if (_macPort != null) {
      try {
        _macPort!.close();
      } catch (e) {
        log('Error closing mac port: $e');
      }
      _macPort = null;
    }
    log('Serial disconnected.');
  }

  Future<void> _writeSerial(String text) async {
    if (Platform.isWindows && _port != null) {
      await _port!.writeBytesFromString(text, includeZeroTerminator: false);
    } else if (Platform.isMacOS && _macPort != null) {
      await _macPort!.writeString(text);
    }
  }

  Future<bool> ping(String portName) async {
    try {
      log('Ping requested on $portName. Connecting...');
      bool opened = await connect(portName);
      if (!opened || !isPortHealthy) {
        log('Could not connect to $portName for ping.');
        return false;
      }

      await Future.delayed(const Duration(milliseconds: 1000));

      for (int i = 0; i < 4; i++) {
        log('Sending BOT_PING on $portName (attempt ${i + 1})...');
        try {
          await _writeSerial('BOT_PING\n');
        } catch (_) {}

        for (int r = 0; r < 4; r++) {
          await Future.delayed(const Duration(milliseconds: 200));
          if (_buffer.isNotEmpty) {
            log('Data in buffer during ping: $_buffer');
            return true;
          }
        }
      }

      if (isConnected) {
        log('Port $portName opened and listening.');
        return true;
      }
      return false;
    } catch (e) {
      log('Ping exception on $portName: $e');
      return false;
    }
  }

  Future<void> sendMode(String mode) async {
    currentMode = mode;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('bot_mode', mode);
      if (isPortHealthy) {
        log('Sending BOT_SET_MODE:$mode');
        await _writeSerial('BOT_SET_MODE:$mode\n');
      }
    } catch (e) {
      log('sendMode error: $e');
    }
  }

  Future<void> sendInterval(int seconds) async {
    questionIntervalSec = seconds;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('bot_interval_sec', seconds);
      if (isPortHealthy) {
        log('Sending BOT_SET_INTERVAL:$seconds');
        await _writeSerial('BOT_SET_INTERVAL:$seconds\n');
      }
    } catch (e) {
      log('sendInterval error: $e');
    }
  }

  Future<void> sendAnswer(String qId, String answer) async {
    try {
      if (isPortHealthy) {
        log('Sending answer: $qId -> $answer');
        String payload = 'BOT_ANS:{"id":"$qId","ans":"$answer"}\n';
        await _writeSerial(payload);
      } else {
        log('Cannot send answer: port disconnected.');
      }
    } catch (e) {
      log('sendAnswer error: $e');
    }
  }

  void _onSerialChunk(String incoming) {
    _buffer += incoming;
    while (_buffer.contains('\n')) {
      int idx = _buffer.indexOf('\n');
      String line = _buffer.substring(0, idx).trim();
      _buffer = _buffer.substring(idx + 1);
      if (line.isNotEmpty) {
        log('Bot Serial In: $line');
        _processIncomingLine(line);
      }
    }
  }

  void startListening() {
    if (_isListening) return;
    _isListening = true;
    log('Started serial listener loop...');
    if (Platform.isWindows) {
      _listenLoop();
    }
  }

  void _listenLoop() async {
    final errors = calloc<DWORD>();
    final status = calloc<COMSTAT>();
    try {
      while (_isListening && isConnected && _port != null) {
        final h = _port!.handler;
        if (h == INVALID_HANDLE_VALUE) break;

        if (ClearCommError(h, errors, status) != TRUE) {
          log('ClearCommError failed (unplugged or port closed)');
          break;
        }

        final bytesInQueue = status.ref.cbInQue;
        if (bytesInQueue > 0) {
          try {
            final toRead = bytesInQueue.clamp(1, 1024);
            var bytes = await _port!.readBytes(toRead, timeout: const Duration(milliseconds: 50));
            if (bytes.isNotEmpty) {
              String incoming = utf8.decode(bytes, allowMalformed: true);
              _onSerialChunk(incoming);
            }
          } catch (e) {
            log('readBytes error: $e');
            break;
          }
        }
        await Future.delayed(const Duration(milliseconds: 50));
      }
    } catch (e) {
      log('Listener exception: $e');
    } finally {
      free(errors);
      free(status);
      disconnect();
      log('Serial listener stopped and cleaned up.');
    }
  }

  void _processIncomingLine(String line) {
    if (line.contains('BOT_Q:')) {
      int lastIdx = line.lastIndexOf('BOT_Q:');
      String jsonStr = line.substring(lastIdx + 6).trim();
      try {
        Map<String, dynamic> data = jsonDecode(jsonStr);
        String qId = data['id'] ?? '';
        String qText = data['q'] ?? '';
        List<dynamic> rawOpts = data['opts'] ?? [];
        List<String> opts = rawOpts.map((e) => e.toString()).toList();

        log('Triggering Floating Desktop Notification: id=$qId, q=$qText, opts=$opts');
        activeNotification.value = BotNotificationEvent.question(
          title: 'Action Required',
          body: qText,
          qId: qId,
          options: opts,
        );
      } catch (e) {
        log('JSON parse error: $e for $line');
      }
    } else if (line.contains('BOT_STATUS:')) {
      int lastIdx = line.lastIndexOf('BOT_STATUS:');
      String jsonStr = line.substring(lastIdx + 11).trim();
      try {
        Map<String, dynamic> data = jsonDecode(jsonStr);
        String title = data['title'] ?? 'Bot Alert';
        String body = data['body'] ?? '';
        bool isAngry = title.toLowerCase().contains('angry') || title.toLowerCase().contains('disturb');

        // Deduplicate: ignore the same status title if fired within 5 seconds
        final now = DateTime.now();
        if (title == _lastStatusTitle &&
            now.difference(_lastStatusTime).inSeconds < 5) {
          log('Skipping duplicate status: $title');
          return;
        }
        _lastStatusTitle = title;
        _lastStatusTime = now;

        log('Triggering Floating Desktop Status: $title - $body');
        activeNotification.value = BotNotificationEvent.status(
          title: title,
          body: body,
          isAngry: isAngry,
        );
      } catch (e) {
        log('JSON parse error: $e for $line');
      }
    }
  }

  void triggerTestQuestion() {
    log('Triggering test question notification...');
    activeNotification.value = BotNotificationEvent.question(
      title: 'Action Required',
      body: 'Select one of the detailed options below:',
      qId: 'test_01',
      options: [
        'Option 1: Approve this deployment request and immediately push the latest build to production servers.',
        'Option 2: Delay the deployment by 2 hours and notify the engineering team on Slack.',
        'Option 3: Reject this request and open the error log to inspect the failed test cases.',
      ],
    );
  }
}

// ================= MAIN ENTRY POINT =================
void main(List<String> args) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    FlutterError.onError = (details) {
      BotService.instance.log('FlutterError: ${details.exceptionAsString()}');
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      BotService.instance.log('PlatformDispatcher error: $error');
      return true; // Keep service alive no matter what
    };

    final isBackground = args.contains('--background') || args.contains('--silent');

    try {
      final currentPid = pid;
      if (Platform.isWindows) {
        Process.runSync('cmd', [
          '/c',
          'taskkill /F /FI "PID ne $currentPid" /IM bot_companion.exe'
        ]);
      } else if (Platform.isMacOS) {
        Process.runSync('bash', [
          '-c',
          'pgrep -f bot_companion | grep -v "^$currentPid" | xargs kill -9 2>/dev/null || true'
        ]);
      }
    } catch (_) {}

    BotService.instance.log('App starting. args=$args');

    launchAtStartup.setup(
      appName: 'BotCompanion',
      appPath: Platform.resolvedExecutable,
      args: ['--background'],
    );

    final prefs = await SharedPreferences.getInstance();
    bool setupDone = prefs.getBool('setup_completed') ?? false;
    await BotService.instance.init();
    BotService.instance.startWatchdog();

    final runSilently = (isBackground && setupDone);

    if (!runSilently) {
      WindowOptions windowOptions = const WindowOptions(
        size: Size(660, 720),
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        title: 'Bot Companion Setup Hub',
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    } else {
      WindowOptions windowOptions = const WindowOptions(
        backgroundColor: Colors.transparent,
        skipTaskbar: true,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.hide();
      });
    }

    runApp(BotCompanionApp(startSilently: runSilently));
  }, (error, stack) {
    BotService.instance.log('Root zone error: $error');
  });
}

// ================= UNIFIED COMPANION APPLICATION =================
class BotCompanionApp extends StatefulWidget {
  final bool startSilently;
  const BotCompanionApp({super.key, required this.startSilently});

  @override
  State<BotCompanionApp> createState() => _BotCompanionAppState();
}

class _BotCompanionAppState extends State<BotCompanionApp> {
  bool _showingSetup = true;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _showingSetup = !widget.startSilently;
    BotService.instance.onOpenSettings = _openSetupHub;
    BotService.instance.activeNotification.addListener(_onNotificationChanged);

    // Always connect on startup regardless of silent mode.
    // Without this, running the app manually (no --background arg) would
    // show the setup UI but never open the serial port, so answers couldn't
    // be sent back to the ESP32.
    if (BotService.instance.activePortName.isNotEmpty) {
      BotService.instance.connect(BotService.instance.activePortName);
    }

    if (widget.startSilently) {
      windowManager.hide();
    }
  }

  @override
  void dispose() {
    BotService.instance.activeNotification.removeListener(_onNotificationChanged);
    _autoDismissTimer?.cancel();
    super.dispose();
  }

  void _onNotificationChanged() async {
    final event = BotService.instance.activeNotification.value;
    _autoDismissTimer?.cancel();

    if (event == null) {
      if (!_showingSetup) {
        await windowManager.hide();
      }
      return;
    }

    if (_showingSetup) {
      setState(() => _showingSetup = false);
    } else {
      setState(() {});
    }

    double estimatedOptionHeight = 0;
    for (final opt in event.options) {
      final lines = (opt.length / 34).ceil().clamp(1, 4);
      estimatedOptionHeight += (lines * 19.0 + 36.0);
    }
    final double cardH = event.isQuestion
        ? (140.0 + estimatedOptionHeight).clamp(260.0, 600.0)
        : 190.0;
    final windowSize = Size(420, cardH);

    await windowManager.setSize(windowSize);
    await windowManager.setAsFrameless();
    await windowManager.setAlignment(Alignment.bottomRight);
    await windowManager.setAlwaysOnTop(true);
    await windowManager.setSkipTaskbar(true);
    await windowManager.show();
    await windowManager.focus();

    final timeout = event.isQuestion ? 35 : 8;
    _autoDismissTimer = Timer(Duration(seconds: timeout), () {
      BotService.instance.activeNotification.value = null;
    });
  }

  void _openSetupHub() async {
    setState(() => _showingSetup = true);
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setSize(const Size(660, 720));
    await windowManager.center();
    await windowManager.setAlwaysOnTop(false);
    await windowManager.setSkipTaskbar(false);
    await windowManager.show();
    await windowManager.focus();
  }

  void _minimizeToBackground() async {
    setState(() => _showingSetup = false);
    await windowManager.hide();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bot Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF00E5FF),
      ),
      home: _showingSetup
          ? ModernSetupScreen(onFinished: _minimizeToBackground)
          : ValueListenableBuilder<BotNotificationEvent?>(
              valueListenable: BotService.instance.activeNotification,
              builder: (context, event, _) {
                if (event == null) return const SizedBox.shrink();
                return _buildFloatingNotificationPopup(event);
              },
            ),
    );
  }

  Widget _buildFloatingNotificationPopup(BotNotificationEvent event) {
    final isAngry = event.isAngry;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isAngry ? const Color(0xFFFF5252) : const Color(0xFF333333),
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
                spreadRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: TextStyle(
                              color: isAngry ? const Color(0xFFFF5252) : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            event.body,
                            style: const TextStyle(
                              color: Color(0xFFB0B0B0),
                              fontSize: 13,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined, size: 14, color: Colors.white24),
                      tooltip: 'Settings Hub',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: _openSetupHub,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.close, size: 14, color: Colors.white24),
                      tooltip: 'Dismiss',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        BotService.instance.activeNotification.value = null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                if (event.isQuestion) ...[
                  for (int i = 0; i < event.options.length; i++) ...[
                    _buildOptionButton(event.qId, event.options[i]),
                    if (i < event.options.length - 1) const SizedBox(height: 8),
                  ],
                ] else ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C2C2C),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                      ),
                      onPressed: () {
                        BotService.instance.activeNotification.value = null;
                      },
                      child: const Text('OK', style: TextStyle(fontSize: 13, color: Color(0xFFE6E6E6))),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String qId, String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C2C2C),
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        onPressed: () {
          debugPrint('Selected: $text');
          BotService.instance.sendAnswer(qId, text);
          BotService.instance.activeNotification.value = null;
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFE6E6E6),
            fontSize: 13,
            height: 1.35,
            fontWeight: FontWeight.w400,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}



// ================= MODERN SETUP & CONTROL HUB =================
class ModernSetupScreen extends StatefulWidget {
  final VoidCallback? onFinished;
  const ModernSetupScreen({super.key, this.onFinished});

  @override
  State<ModernSetupScreen> createState() => _ModernSetupScreenState();
}

class _ModernSetupScreenState extends State<ModernSetupScreen> {
  late SharedPreferences _prefs;
  bool _startOnBoot = true;
  String _selectedMode = 'HUMOROUS';
  int _selectedInterval = 30;
  String? _selectedPort;
  List<String> _availablePorts = [];
  bool _testingConnection = false;
  bool _connectionVerified = false;
  String _statusMessage = 'Select port and test connection';

  @override
  void initState() {
    super.initState();
    _loadState();
    _scanPorts();
  }

  Future<void> _loadState() async {
    _prefs = await SharedPreferences.getInstance();
    final savedPort = _prefs.getString('bot_com_port');
    final savedMode = _prefs.getString('bot_mode');
    final savedInterval = _prefs.getInt('bot_interval_sec');
    final setupDone = _prefs.getBool('setup_completed') ?? false;

    setState(() {
      _startOnBoot = _prefs.getBool('start_on_boot') ?? true;
      if (savedMode != null) _selectedMode = savedMode;
      if (savedInterval != null) _selectedInterval = savedInterval;
      _availablePorts = BotService.getAvailablePorts();
      if (savedPort != null && _availablePorts.contains(savedPort)) {
        _selectedPort = savedPort;
      } else if (_availablePorts.isNotEmpty && _selectedPort == null) {
        _selectedPort = _availablePorts.first;
      }
      if (setupDone && _selectedPort != null) {
        _connectionVerified = true;
        _statusMessage = 'Configured on $_selectedPort ($_selectedMode)';
      }
    });
  }

  void _scanPorts() {
    setState(() {
      _availablePorts = BotService.getAvailablePorts();
      if (_availablePorts.isNotEmpty && (_selectedPort == null || !_availablePorts.contains(_selectedPort))) {
        _selectedPort = _availablePorts.first;
      }
    });
  }

  Future<void> _testPort() async {
    if (_selectedPort == null) return;
    setState(() {
      _testingConnection = true;
      _statusMessage = 'Pinging bot on $_selectedPort...';
    });

    bool ok = await BotService.instance.ping(_selectedPort!);

    if (!mounted) return;
    setState(() {
      _testingConnection = false;
      _connectionVerified = ok;
      if (ok) {
        _statusMessage = 'Connected to ESP32 Bot successfully!';
      } else {
        _statusMessage = 'No response on $_selectedPort. Ensure bot is uploaded & plugged in.';
      }
    });
  }

  Future<void> _finishSetup() async {
    if (!_connectionVerified || _selectedPort == null) return;

    await _prefs.setBool('setup_completed', true);
    await _prefs.setBool('start_on_boot', _startOnBoot);
    await _prefs.setString('bot_mode', _selectedMode);
    await _prefs.setInt('bot_interval_sec', _selectedInterval);
    await _prefs.setString('bot_com_port', _selectedPort!);

    if (_startOnBoot) {
      await launchAtStartup.enable();
      if (Platform.isWindows) {
        try {
          final exe = Platform.resolvedExecutable;
          Process.runSync('powershell', [
            '-NoProfile',
            '-Command',
            'Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run" -Name "BotCompanion" -Value \'"$exe" --background\''
          ]);
        } catch (_) {}
      }
    } else {
      await launchAtStartup.disable();
    }

    BotService.instance.startWatchdog();

    await BotService.instance.connect(_selectedPort!);
    await BotService.instance.sendMode(_selectedMode);
    await BotService.instance.sendInterval(_selectedInterval);

    BotService.instance.activeNotification.value = BotNotificationEvent.status(
      title: 'Bot Companion Online',
      body: 'Desk bot connected on $_selectedPort in $_selectedMode mode! Running quietly in background.',
    );

    if (widget.onFinished != null) {
      widget.onFinished!();
    } else {
      await windowManager.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E14),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0x2600E5FF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF00E5FF), width: 1.5),
                      ),
                      child: const Icon(Icons.smart_toy, size: 28, color: Color(0xFF00E5FF)),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bot Companion Setup',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                        ),
                        Text(
                          'Minimalist Laptop Hardware Bridge',
                          style: TextStyle(fontSize: 12, color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Step 1: Background Startup Permission
                _buildCard(
                  title: '1. Windows Startup Execution',
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Run in background on PC boot', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text(
                      'Starts backend silently with Windows. No window pops up.',
                      style: TextStyle(fontSize: 11, color: Colors.white54),
                    ),
                    value: _startOnBoot,
                    activeThumbColor: const Color(0xFF00E5FF),
                    onChanged: (val) => setState(() => _startOnBoot = val),
                  ),
                ),
                const SizedBox(height: 14),

                // Step 2: Personality Mode
                _buildCard(
                  title: '2. Select Companion Personality',
                  child: Column(
                    children: [
                      _buildModeOption(
                        id: 'HUMOROUS',
                        title: 'Humorous & Teasing (25 questions)',
                        desc: 'Sarcastic roasts, fake walking away for 3 mins, and playful banter.',
                        icon: Icons.mood,
                      ),
                      const SizedBox(height: 8),
                      _buildModeOption(
                        id: 'PRODUCTIVE',
                        title: 'Productive & Focus (25 questions)',
                        desc: 'Posture checks, deep work sprints, hydration, and Git commit alerts.',
                        icon: Icons.bolt,
                      ),
                      const SizedBox(height: 8),
                      _buildModeOption(
                        id: 'QUIET',
                        title: 'Quiet & Zen (25 questions)',
                        desc: 'Soft gentle check-ins, mindful breathing, and tranquil companionship.',
                        icon: Icons.spa,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Step 3: Question Time Interval
                _buildCard(
                  title: '3. Question Message Interval',
                  child: Row(
                    children: [
                      _buildIntervalChip('⚡ 30s (Testing)', 30),
                      const SizedBox(width: 8),
                      _buildIntervalChip('2 Mins', 120),
                      const SizedBox(width: 8),
                      _buildIntervalChip('5 Mins', 300),
                      const SizedBox(width: 8),
                      _buildIntervalChip('10 Mins', 600),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Step 4: Hardware COM Port Selection
                _buildCard(
                  title: '4. Select Bot Hardware Port (Required)',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              initialValue: _selectedPort,
                              decoration: InputDecoration(
                                labelText: 'ESP32 COM Port',
                                labelStyle: const TextStyle(fontSize: 12, color: Colors.white70),
                                filled: true,
                                fillColor: const Color(0xFF141A23),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: _availablePorts.map((p) {
                                return DropdownMenuItem(
                                  value: p,
                                  child: Text(p, style: const TextStyle(fontSize: 13, color: Colors.white)),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedPort = val;
                                  _connectionVerified = false;
                                  _statusMessage = 'Port changed. Please test connection.';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.refresh, color: Color(0xFF00E5FF)),
                            tooltip: 'Refresh Ports',
                            onPressed: _scanPorts,
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00E5FF),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: (_selectedPort == null || _testingConnection) ? null : _testPort,
                            child: _testingConnection
                                ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                                : const Text('Test Connection'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            _connectionVerified ? Icons.check_circle : Icons.info_outline,
                            size: 16,
                            color: _connectionVerified ? Colors.greenAccent : Colors.amberAccent,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _statusMessage,
                              style: TextStyle(
                                fontSize: 11,
                                color: _connectionVerified ? Colors.greenAccent : Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (!_connectionVerified && _selectedPort != null) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white60,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            ),
                            icon: const Icon(Icons.check, size: 14),
                            label: const Text('I know this is my bot (Skip test & connect)', style: TextStyle(fontSize: 11)),
                            onPressed: () {
                              setState(() {
                                _connectionVerified = true;
                                _statusMessage = 'Manually confirmed on $_selectedPort!';
                              });
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Finish Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _connectionVerified ? const Color(0xFF00E5FF) : Colors.white12,
                    foregroundColor: _connectionVerified ? Colors.black : Colors.white38,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: Icon(_connectionVerified ? Icons.check : Icons.lock_outline),
                  label: Text(
                    _connectionVerified ? 'Save & Run in Background' : 'Connect Bot to Finish Setup',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  onPressed: _connectionVerified ? _finishSetup : null,
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF00E5FF),
                    side: const BorderSide(color: Color(0xFF00E5FF), width: 1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.notifications_active_outlined, size: 18),
                  label: const Text('Send Test Notification Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  onPressed: () {
                    BotService.instance.triggerTestQuestion();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntervalChip(String label, int seconds) {
    final isSelected = _selectedInterval == seconds;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedInterval = seconds);
          BotService.instance.sendInterval(seconds);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0x2E00E5FF) : const Color(0xFF141A23),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF00E5FF) : Colors.white10,
              width: 1.2,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF00E5FF) : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121720),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF00E5FF))),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildModeOption({required String id, required String title, required String desc, required IconData icon}) {
    bool isSelected = _selectedMode == id;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedMode = id);
        BotService.instance.sendMode(id);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1F00E5FF) : const Color(0xFF141A23),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF00E5FF) : Colors.white10,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF00E5FF) : Colors.white38, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isSelected ? Colors.white : Colors.white70)),
                  Text(desc, style: const TextStyle(fontSize: 10.5, color: Colors.white38)),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF00E5FF), size: 18),
          ],
        ),
      ),
    );
  }
}
