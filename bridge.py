import sys
import time
import serial
import threading

def test_ping(port):
    try:
        s = serial.Serial(f'\\\\.\\{port}', 115200, timeout=1.5)
        time.sleep(0.5)
        # Clear buffer
        s.reset_input_buffer()
        for _ in range(3):
            s.write(b"BOT_PING\n")
            time.sleep(0.3)
            data = s.read_all()
            if b"BOT_PONG" in data or b"BOT_READY" in data:
                s.close()
                print("PONG_OK")
                return True
        s.close()
        print("PONG_FAIL")
        return False
    except Exception as e:
        print(f"PONG_ERR: {e}")
        return False

def run_bridge(port):
    try:
        s = serial.Serial(f'\\\\.\\{port}', 115200, timeout=0.1)
    except Exception as e:
        print(f"BRIDGE_ERR: {e}", flush=True)
        return

    print("BRIDGE_READY", flush=True)

    # Thread to read stdin from Flutter and forward to Serial
    def stdin_thread():
        while True:
            try:
                line = sys.stdin.readline()
                if not line:
                    break
                s.write(line.encode('utf-8'))
            except:
                break

    t = threading.Thread(target=stdin_thread, daemon=True)
    t.start()

    # Main loop: read serial and print to stdout
    while True:
        try:
            line = s.readline()
            if line:
                decoded = line.decode('utf-8', errors='ignore').strip()
                if decoded:
                    print(decoded, flush=True)
        except Exception as e:
            print(f"SERIAL_READ_ERR: {e}", flush=True)
            break

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: bridge.py [ping|run] COMx")
        sys.exit(1)

    cmd = sys.argv[1]
    port = sys.argv[2].replace(r'\\.\ ', '').replace(r'\\.\\', '').strip()

    if cmd == "ping":
        test_ping(port)
    elif cmd == "run":
        run_bridge(port)
