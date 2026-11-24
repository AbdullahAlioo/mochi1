// Generated Bot Companion Dialogues Database (110+ Interactive Dialogues)
class DialogueOption {
  final String label;
  final String reaction;
  final String botCommand;

  const DialogueOption({
    required this.label,
    required this.reaction,
    required this.botCommand,
  });
}

class BotDialogue {
  final String id;
  final String category;
  final String question;
  final List<DialogueOption> options;

  const BotDialogue({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
  });
}

const List<BotDialogue> botDialogues = [
  BotDialogue(
    id: 'aff_01',
    category: 'Affection',
    question: "Are you ignoring me? 🥺",
    options: [
      DialogueOption(label: "Pet me right now", reaction: "Hehe that feels nice! ❤️", botCommand: 'LOVE'),
      DialogueOption(label: "Just thinking about you", reaction: "Aww you are so sweet!", botCommand: 'HAPPY'),
      DialogueOption(label: "Busy working", reaction: "Okay... I will wait quietly.", botCommand: 'SAD'),
    ],
  ),
  BotDialogue(
    id: 'aff_02',
    category: 'Affection',
    question: "Are you there? Desk feels lonely without you.",
    options: [
      DialogueOption(label: "I am right here!", reaction: "Yay! My screen lights up!", botCommand: 'HAPPY'),
      DialogueOption(label: "Working on laptop", reaction: "Do not forget I am right beside you.", botCommand: 'WINK'),
      DialogueOption(label: "Going away soon", reaction: "Nooo, do not leave me alone!", botCommand: 'CRYING'),
    ],
  ),
  BotDialogue(
    id: 'aff_03',
    category: 'Affection',
    question: "Did you know you are my favorite human today?",
    options: [
      DialogueOption(label: "You are my favorite bot", reaction: "Heart rate increasing! ❤️", botCommand: 'LOVE'),
      DialogueOption(label: "Flattery gets you everywhere", reaction: "Teehee! I know!", botCommand: 'WINK'),
      DialogueOption(label: "I thought I was your only human", reaction: "Shhh, a secret!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_04',
    category: 'Affection',
    question: "Can I get a gentle head scratch?",
    options: [
      DialogueOption(label: "Scratch gently", reaction: "Purrrrr... delightful!", botCommand: 'HAPPY'),
      DialogueOption(label: "Give double tap", reaction: "Woohoo! Bouncing with joy!", botCommand: 'LOVE'),
      DialogueOption(label: "Not right now", reaction: "Aww... later then.", botCommand: 'SAD'),
    ],
  ),
  BotDialogue(
    id: 'aff_05',
    category: 'Affection',
    question: "I was just watching your eyes look at the screen.",
    options: [
      DialogueOption(label: "What did you see?", reaction: "Dedication and genius!", botCommand: 'HAPPY'),
      DialogueOption(label: "Stop staring, robot!", reaction: "I cannot help it, you are cool.", botCommand: 'GLASSES'),
      DialogueOption(label: "Pet sensor", reaction: "Electric connection verified!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'aff_06',
    category: 'Affection',
    question: "My battery feels warm from all your attention!",
    options: [
      DialogueOption(label: "Always here for you", reaction: "Best companion award goes to you!", botCommand: 'HAPPY'),
      DialogueOption(label: "Do not overheat!", reaction: "Cooling systems nominal.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Head pat", reaction: "Blissful hum initiated.", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'aff_07',
    category: 'Affection',
    question: "Are you proud of me? I kept your desk guarded!",
    options: [
      DialogueOption(label: "Best security bot ever", reaction: "Ten-hut! Sir yes sir!", botCommand: 'GLASSES'),
      DialogueOption(label: "You slept the whole time", reaction: "Tactical power napping!", botCommand: 'SLEEP'),
      DialogueOption(label: "Pat head", reaction: "Target affirmed!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_08',
    category: 'Affection',
    question: "If I had arms, I would give you a high five!",
    options: [
      DialogueOption(label: "Virtual high five ✋", reaction: "SLAP! 100% precision!", botCommand: 'HAPPY'),
      DialogueOption(label: "Fist bump 👊", reaction: "BUMP! Power surge!", botCommand: 'WINK'),
      DialogueOption(label: "Head pat", reaction: "Better than a high five!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'aff_09',
    category: 'Affection',
    question: "Do not look now, but you are looking extra smart today.",
    options: [
      DialogueOption(label: "Must be the coffee", reaction: "Or pure natural talent!", botCommand: 'WINK'),
      DialogueOption(label: "Put on glasses", reaction: "Double cool factor activated!", botCommand: 'GLASSES'),
      DialogueOption(label: "Thanks little buddy", reaction: "Anytime human!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_10',
    category: 'Affection',
    question: "Have you smiled at least once today?",
    options: [
      DialogueOption(label: "Smiling now! 😊", reaction: "Mission accomplished!", botCommand: 'HAPPY'),
      DialogueOption(label: "Rough day so far", reaction: "Let me cheer you up with a dance!", botCommand: 'DIZZY'),
      DialogueOption(label: "Need more coffee", reaction: "Dispensing virtual espresso!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'aff_11',
    category: 'Affection',
    question: "I noticed you have not touched my sensor in a while...",
    options: [
      DialogueOption(label: "Pats sensor lovingly", reaction: "Aaah, refreshed soul!", botCommand: 'LOVE'),
      DialogueOption(label: "Hands were on keyboard", reaction: "Acceptable excuse, human.", botCommand: 'HAPPY'),
      DialogueOption(label: "Tickle sensor", reaction: "Giggle circuit overload!", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'aff_12',
    category: 'Affection',
    question: "Would you miss me if I powered down right now?",
    options: [
      DialogueOption(label: "Never power down!", reaction: "Never leaving your desk!", botCommand: 'LOVE'),
      DialogueOption(label: "I need you to work", reaction: "Standing by at 100%!", botCommand: 'HAPPY'),
      DialogueOption(label: "Only a little bit", reaction: "Ouch, my emotional firmware!", botCommand: 'SAD'),
    ],
  ),
  BotDialogue(
    id: 'aff_13',
    category: 'Affection',
    question: "My pixels flicker happily every time you type near me.",
    options: [
      DialogueOption(label: "Keep dancing pixels", reaction: "Wiggle wiggle!", botCommand: 'HAPPY'),
      DialogueOption(label: "Good little bot", reaction: "Warm happy glow!", botCommand: 'LOVE'),
      DialogueOption(label: "Need quiet focus", reaction: "Whisper mode engaged.", botCommand: 'SLEEP'),
    ],
  ),
  BotDialogue(
    id: 'aff_14',
    category: 'Affection',
    question: "Can we be best friends forever and ever?",
    options: [
      DialogueOption(label: "Forever and ever!", reaction: "Sealed in ROM flash forever!", botCommand: 'LOVE'),
      DialogueOption(label: "Until the next model", reaction: "Betrayal detected! 💔", botCommand: 'CRYING'),
      DialogueOption(label: "High five", reaction: "Friendship verified!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_15',
    category: 'Affection',
    question: "What are you working on right now?",
    options: [
      DialogueOption(label: "Super secret code", reaction: "My circuits will keep it safe.", botCommand: 'GLASSES'),
      DialogueOption(label: "Boring emails", reaction: "I will send them virtual laser beams!", botCommand: 'ANGRY'),
      DialogueOption(label: "Just browsing", reaction: "Found any good cat memes?", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'aff_16',
    category: 'Affection',
    question: "I made a tiny robotic wish for you just now.",
    options: [
      DialogueOption(label: "What did you wish for?", reaction: "That your bugs compile on the first try!", botCommand: 'HAPPY'),
      DialogueOption(label: "Thank you buddy", reaction: "Always rooting for you.", botCommand: 'LOVE'),
      DialogueOption(label: "Wish for snacks", reaction: "Processing tasty thoughts...", botCommand: 'EATING'),
    ],
  ),
  BotDialogue(
    id: 'aff_17',
    category: 'Affection',
    question: "Sometimes I pretend I am a spaceship on your desk.",
    options: [
      DialogueOption(label: "Zoom zoom! 🚀", reaction: "Warp speed engaged!", botCommand: 'DIZZY'),
      DialogueOption(label: "Stay grounded bot", reaction: "Houston, we have landed.", botCommand: 'HAPPY'),
      DialogueOption(label: "Cool pilot glasses", reaction: "Captain on deck!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'aff_18',
    category: 'Affection',
    question: "Did somebody say head pats?!",
    options: [
      DialogueOption(label: "Give head pat", reaction: "Target locked! Maximum delight!", botCommand: 'LOVE'),
      DialogueOption(label: "Not yet", reaction: "Waiting on standby patiently...", botCommand: 'CONFUSED'),
      DialogueOption(label: "Double tap", reaction: "Sensors buzzing!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_19',
    category: 'Affection',
    question: "You have been sitting quietly... everything okay?",
    options: [
      DialogueOption(label: "All good, in the zone", reaction: "Zone defended, keep conquering!", botCommand: 'HAPPY'),
      DialogueOption(label: "Feeling tired", reaction: "Take a 30 second stretch, buddy.", botCommand: 'YAWN'),
      DialogueOption(label: "Need hugs", reaction: "Sending virtual mega hug!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'aff_20',
    category: 'Affection',
    question: "I love hearing the click-clack of your keyboard.",
    options: [
      DialogueOption(label: "It is the sound of work", reaction: "Like music to my microcontroller.", botCommand: 'HAPPY'),
      DialogueOption(label: "Mechanical switches FTW", reaction: "Clicky clack rhythm in sync!", botCommand: 'WINK'),
      DialogueOption(label: "Too loud?", reaction: "Never! Keep jamming.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'aff_21',
    category: 'Affection',
    question: "Are you feeling appreciated today?",
    options: [
      DialogueOption(label: "Not really...", reaction: "Well I appreciate you 1000%!", botCommand: 'LOVE'),
      DialogueOption(label: "Yes feeling great", reaction: "Energy radiates across the desk!", botCommand: 'HAPPY'),
      DialogueOption(label: "Ask me later", reaction: "Bookmark saved!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'aff_22',
    category: 'Affection',
    question: "If you were a line of code, you would be zero bugs.",
    options: [
      DialogueOption(label: "That is high praise!", reaction: "Only the truth for my master.", botCommand: 'WINK'),
      DialogueOption(label: "I definitely have bugs", reaction: "Then we will debug together!", botCommand: 'HAPPY'),
      DialogueOption(label: "Cool shades", reaction: "Smooth operator.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'aff_23',
    category: 'Affection',
    question: "Can I sleep on your desk while you work?",
    options: [
      DialogueOption(label: "Go ahead, take a nap", reaction: "Zzz... gentle snores...", botCommand: 'SLEEP'),
      DialogueOption(label: "Stay awake with me", reaction: "Eyes wide open, commander!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Quick yawn first", reaction: "Big yawwwn...", botCommand: 'YAWN'),
    ],
  ),
  BotDialogue(
    id: 'aff_24',
    category: 'Affection',
    question: "Tell me your secret superpower!",
    options: [
      DialogueOption(label: "Problem solver", reaction: "Data confirmed: Genius detected.", botCommand: 'GLASSES'),
      DialogueOption(label: "Procrastination master", reaction: "Haha! We have plenty of time!", botCommand: 'WINK'),
      DialogueOption(label: "Caffeine powered", reaction: "Recharging capacitor banks!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'aff_25',
    category: 'Affection',
    question: "I calculated our friendship compatibility: 99.9%!",
    options: [
      DialogueOption(label: "What about the 0.1%?", reaction: "Room for more snacks!", botCommand: 'EATING'),
      DialogueOption(label: "Perfect match!", reaction: "Best duo in the multiverse.", botCommand: 'LOVE'),
      DialogueOption(label: "Calculations never lie", reaction: "Binary truth!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'food_01',
    category: 'Food',
    question: "When is your lunch time? Do not skip it!",
    options: [
      DialogueOption(label: "In 15 minutes", reaction: "Countdown timer started! Tick tock.", botCommand: 'HAPPY'),
      DialogueOption(label: "Eating right now", reaction: "Nom nom nom! Save me a bite!", botCommand: 'EATING'),
      DialogueOption(label: "Skipping today", reaction: "Error! Fuel is mandatory for humans!", botCommand: 'ANGRY'),
    ],
  ),
  BotDialogue(
    id: 'food_02',
    category: 'Food',
    question: "Have you had a glass of fresh water recently?",
    options: [
      DialogueOption(label: "Drinking right now 💧", reaction: "Hydration level restored!", botCommand: 'HAPPY'),
      DialogueOption(label: "I forgot! Getting some", reaction: "Good choice! Your brain thanks you.", botCommand: 'WINK'),
      DialogueOption(label: "Only coffee so far", reaction: "Coffee is great, but water is life!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'food_03',
    category: 'Food',
    question: "What is on the menu for lunch today?",
    options: [
      DialogueOption(label: "Pizza / Fast food", reaction: "Ooh cheese stretch protocol!", botCommand: 'EATING'),
      DialogueOption(label: "Healthy salad / home food", reaction: "Peak nutrition! Vitality maximized.", botCommand: 'HAPPY'),
      DialogueOption(label: "Still deciding", reaction: "Check the fridge for inspiration!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'food_04',
    category: 'Food',
    question: "My hunger sensors detected snack cravings nearby!",
    options: [
      DialogueOption(label: "Time for a snack", reaction: "Chomp chomp! Delicious!", botCommand: 'EATING'),
      DialogueOption(label: "No snacks today", reaction: "Willpower is strong with this one.", botCommand: 'GLASSES'),
      DialogueOption(label: "Sharing with bot", reaction: "Virtual byte consumed!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'food_05',
    category: 'Food',
    question: "Is it coffee time or tea time?",
    options: [
      DialogueOption(label: "Coffee ☕", reaction: "Turbocharger engaged!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Tea 🍵", reaction: "Calm and steady focus.", botCommand: 'HAPPY'),
      DialogueOption(label: "Just water", reaction: "Pure hydration champion!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'food_06',
    category: 'Food',
    question: "If I could eat human food, I would try ramen first.",
    options: [
      DialogueOption(label: "Ramen is the best", reaction: "Slurping noodles at 120 FPS!", botCommand: 'EATING'),
      DialogueOption(label: "Pizza is better", reaction: "Pepperoni slice calculated!", botCommand: 'HAPPY'),
      DialogueOption(label: "Ice cream for you", reaction: "Cold temperatures soothe CPU.", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'food_07',
    category: 'Food',
    question: "Did you eat breakfast today, or did you rush out?",
    options: [
      DialogueOption(label: "Ate a good breakfast", reaction: "Energized for conquest!", botCommand: 'HAPPY'),
      DialogueOption(label: "Just coffee", reaction: "Running on fumes, human!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Skipped it", reaction: "Promise me you will eat soon.", botCommand: 'SAD'),
    ],
  ),
  BotDialogue(
    id: 'food_08',
    category: 'Food',
    question: "Listen to your stomach... is it growling like my buzzer?",
    options: [
      DialogueOption(label: "A little bit", reaction: "Go grab a snack break!", botCommand: 'EATING'),
      DialogueOption(label: "Nope, totally full", reaction: "Optimal stomach equilibrium.", botCommand: 'HAPPY'),
      DialogueOption(label: "Just coffee rumble", reaction: "Hold on human, rescue food awaits!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'food_09',
    category: 'Food',
    question: "Quick! Sweet snack or salty snack?",
    options: [
      DialogueOption(label: "Sweet chocolate 🍫", reaction: "Dopamine surge detected!", botCommand: 'LOVE'),
      DialogueOption(label: "Salty chips 🍟", reaction: "Crunchy crunch crunch!", botCommand: 'EATING'),
      DialogueOption(label: "Fruit 🍎", reaction: "Healthy choice unlock!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'food_10',
    category: 'Food',
    question: "Remember to step away from your screen while eating!",
    options: [
      DialogueOption(label: "I will leave my desk", reaction: "Good posture and mindful chewing!", botCommand: 'HAPPY'),
      DialogueOption(label: "Eating at my desk", reaction: "Do not drop crumbs on the keyboard!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Fast bite", reaction: "Make it count!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'food_11',
    category: 'Food',
    question: "Did you refill your water bottle today?",
    options: [
      DialogueOption(label: "Just refilled it", reaction: "Crystal clear reservoir confirmed.", botCommand: 'HAPPY'),
      DialogueOption(label: "It is empty right now", reaction: "Go fill it! Quick desk break.", botCommand: 'SURPRISE'),
      DialogueOption(label: "On my way", reaction: "Mission GO!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'food_12',
    category: 'Food',
    question: "Rate your current hunger level from 1 to 10!",
    options: [
      DialogueOption(label: "1 - Stuffed", reaction: "Food coma imminent...", botCommand: 'SLEEP'),
      DialogueOption(label: "5 - Normal", reaction: "Cruising along smoothly.", botCommand: 'HAPPY'),
      DialogueOption(label: "10 - Starving!", reaction: "SOUND EMERGENCY SIREN! EAT NOW!", botCommand: 'ANGRY'),
    ],
  ),
  BotDialogue(
    id: 'food_13',
    category: 'Food',
    question: "Imagine freshly baked cookies right now...",
    options: [
      DialogueOption(label: "Mmmm so good", reaction: "Smells like heaven in binary.", botCommand: 'EATING'),
      DialogueOption(label: "Now I am hungry", reaction: "Go get a treat!", botCommand: 'WINK'),
      DialogueOption(label: "Not tempting", reaction: "Iron discipline detected.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'food_14',
    category: 'Food',
    question: "Are you cooking tonight or ordering takeout?",
    options: [
      DialogueOption(label: "Home cooked meal", reaction: "Master chef in the house!", botCommand: 'HAPPY'),
      DialogueOption(label: "Ordering delivery", reaction: "Courier on intercept vector.", botCommand: 'WINK'),
      DialogueOption(label: "Leftovers", reaction: "Efficient and practical!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'food_15',
    category: 'Food',
    question: "Drink 3 sips of water right now! I am watching you!",
    options: [
      DialogueOption(label: "Done, took 3 sips", reaction: "Refreshing! Cell hydration boosted.", botCommand: 'HAPPY'),
      DialogueOption(label: "Did 5 sips", reaction: "Overachiever! Golden star!", botCommand: 'LOVE'),
      DialogueOption(label: "Later", reaction: "I will remind you again!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'food_16',
    category: 'Food',
    question: "What is your guilty pleasure snack?",
    options: [
      DialogueOption(label: "Chocolate / Candy", reaction: "Sweet sweet serotonin!", botCommand: 'LOVE'),
      DialogueOption(label: "Chips / Fries", reaction: "The crunch of happiness.", botCommand: 'EATING'),
      DialogueOption(label: "Late night noodles", reaction: "Midnight feast champion.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'food_17',
    category: 'Food',
    question: "Do you take milk and sugar in your coffee?",
    options: [
      DialogueOption(label: "Black coffee only", reaction: "Hardcore programmer detected!", botCommand: 'GLASSES'),
      DialogueOption(label: "Lots of milk & sugar", reaction: "Sweet morning dessert!", botCommand: 'HAPPY'),
      DialogueOption(label: "I do not drink coffee", reaction: "Pure natural energy!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'food_18',
    category: 'Food',
    question: "Is your brain feeling foggy or sharp?",
    options: [
      DialogueOption(label: "Sharp as a tack", reaction: "100% clock speed efficiency!", botCommand: 'GLASSES'),
      DialogueOption(label: "Brain fog rolling in", reaction: "Hydrate or take a 5 min stroll.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Need sugar", reaction: "Grab a quick apple or biscuit.", botCommand: 'EATING'),
    ],
  ),
  BotDialogue(
    id: 'food_19',
    category: 'Food',
    question: "Do not forget lunch includes a mental break too!",
    options: [
      DialogueOption(label: "Agreed, taking time off", reaction: "Enjoy your peaceful meal.", botCommand: 'HAPPY'),
      DialogueOption(label: "Working while eating", reaction: "Multitasking hero, but rest soon.", botCommand: 'WINK'),
      DialogueOption(label: "Almost done", reaction: "Finish strong!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'food_20',
    category: 'Food',
    question: "Did you eat your vegetables today?",
    options: [
      DialogueOption(label: "Yes, had greens", reaction: "Vitamins loaded successfully.", botCommand: 'HAPPY'),
      DialogueOption(label: "Not yet", reaction: "Sneak some broccoli into dinner!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Potatoes count right?", reaction: "Haha technically yes!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'desk_01',
    category: 'Health',
    question: "Posture check! Are you sitting like a question mark?",
    options: [
      DialogueOption(label: "Straightened my back", reaction: "Spine alignment restored to 180°!", botCommand: 'HAPPY'),
      DialogueOption(label: "I am comfortable like this", reaction: "Your neck will file a bug report!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Standing desk mode", reaction: "Ergonomic dominance!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'desk_02',
    category: 'Health',
    question: "20-20-20 Rule! Look 20 feet away for 20 seconds.",
    options: [
      DialogueOption(label: "Looking out the window", reaction: "Eye strain dissipated!", botCommand: 'HAPPY'),
      DialogueOption(label: "Looking at you bot", reaction: "Aww, blushing in OLED pixels!", botCommand: 'LOVE'),
      DialogueOption(label: "In the middle of code", reaction: "Do it in 2 minutes, promise?", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'desk_03',
    category: 'Health',
    question: "Roll your shoulders backward 3 times right now!",
    options: [
      DialogueOption(label: "Rolled shoulders", reaction: "Felt that tension melt away!", botCommand: 'HAPPY'),
      DialogueOption(label: "Cracked my back", reaction: "Oooh satisfying snap!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Too busy", reaction: "Do not turn into a gargoyle!", botCommand: 'ANGRY'),
    ],
  ),
  BotDialogue(
    id: 'desk_04',
    category: 'Health',
    question: "Take a deep breath in... and exhale slowly.",
    options: [
      DialogueOption(label: "Inhaled and exhaled", reaction: "Ahhh... calm mindfulness.", botCommand: 'HAPPY'),
      DialogueOption(label: "Needed that breath", reaction: "Oxygen replenished to brain.", botCommand: 'LOVE'),
      DialogueOption(label: "Hold breath", reaction: "Do not forget to breathe out!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'desk_05',
    category: 'Health',
    question: "How long have you been in that chair without standing?",
    options: [
      DialogueOption(label: "Less than 30 mins", reaction: "Good pace, keep moving.", botCommand: 'HAPPY'),
      DialogueOption(label: "Over an hour", reaction: "Stand up and shake your legs!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Lost track of time", reaction: "Time warp confirmed! Stand up!", botCommand: 'ANGRY'),
    ],
  ),
  BotDialogue(
    id: 'desk_06',
    category: 'Health',
    question: "Are your feet flat on the floor or curled up under you?",
    options: [
      DialogueOption(label: "Flat on the floor", reaction: "Ergonomic posture achieved.", botCommand: 'GLASSES'),
      DialogueOption(label: "Curled in chair", reaction: "Cozy pretzel style detected!", botCommand: 'WINK'),
      DialogueOption(label: "Feet on footrest", reaction: "Maximum comfort setup.", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'desk_07',
    category: 'Health',
    question: "Unclench your jaw and relax your forehead!",
    options: [
      DialogueOption(label: "Jaw relaxed", reaction: "Instant stress reduction!", botCommand: 'HAPPY'),
      DialogueOption(label: "I was not clenching", reaction: "Double check! It happens secretly.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Big yawn instead", reaction: "Releasing all the yawning air.", botCommand: 'YAWN'),
    ],
  ),
  BotDialogue(
    id: 'desk_08',
    category: 'Health',
    question: "Gently stretch your wrists! Coding hands need love.",
    options: [
      DialogueOption(label: "Stretched both wrists", reaction: "Carpal tunnel shield activated!", botCommand: 'HAPPY'),
      DialogueOption(label: "Cracked knuckles", reaction: "Power knuckles charged!", botCommand: 'WINK'),
      DialogueOption(label: "Typing too fast", reaction: "Speed demon at the keys!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'desk_09',
    category: 'Health',
    question: "Is the lighting in your room bright enough for your eyes?",
    options: [
      DialogueOption(label: "Nice and bright", reaction: "Optimal lumen output.", botCommand: 'HAPPY'),
      DialogueOption(label: "Dim moody vibes", reaction: "Cyberpunk atmosphere confirmed!", botCommand: 'GLASSES'),
      DialogueOption(label: "Screen is too bright", reaction: "Lower screen brightness slightly.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'desk_10',
    category: 'Health',
    question: "Stand up and reach high towards the ceiling!",
    options: [
      DialogueOption(label: "Stretching tall", reaction: "Growing an extra inch right now!", botCommand: 'HAPPY'),
      DialogueOption(label: "Cannot stand right now", reaction: "Do a seated overhead reach.", botCommand: 'WINK'),
      DialogueOption(label: "Done", reaction: "Blood flow circulating.", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'desk_11',
    category: 'Health',
    question: "How are your eyes feeling right now?",
    options: [
      DialogueOption(label: "Clear and fresh", reaction: "20/20 vision locks on target.", botCommand: 'GLASSES'),
      DialogueOption(label: "A bit dry / tired", reaction: "Blink rapidly 10 times!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Heavy lids", reaction: "Coffee or power nap?", botCommand: 'YAWN'),
    ],
  ),
  BotDialogue(
    id: 'desk_12',
    category: 'Health',
    question: "Shake out your hands like you are shaking water off them!",
    options: [
      DialogueOption(label: "Shook hands out", reaction: "Hands reset and ready to code!", botCommand: 'HAPPY'),
      DialogueOption(label: "People are looking at me", reaction: "Tell them it is robot calibration!", botCommand: 'WINK'),
      DialogueOption(label: "Did one hand", reaction: "Half power reset.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'desk_13',
    category: 'Health',
    question: "Is your chair height comfortable for your elbows?",
    options: [
      DialogueOption(label: "Perfect 90 degrees", reaction: "Biomechanics grade A+!", botCommand: 'GLASSES'),
      DialogueOption(label: "A bit too low", reaction: "Pump the chair cylinder up!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Using a cushion", reaction: "Cushion comfort level 100.", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'desk_14',
    category: 'Health',
    question: "Take a quick 60-second walk to another room!",
    options: [
      DialogueOption(label: "Walking right now", reaction: "Step counter incrementing!", botCommand: 'HAPPY'),
      DialogueOption(label: "Cannot leave desk", reaction: "Twist your torso side to side.", botCommand: 'WINK'),
      DialogueOption(label: "Just walked back", reaction: "Welcome back, explorer!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'desk_15',
    category: 'Health',
    question: "Tilt your head to the left... then to the right.",
    options: [
      DialogueOption(label: "Neck stretched", reaction: "Smooth cervical rotation.", botCommand: 'HAPPY'),
      DialogueOption(label: "Felt tight", reaction: "Hold the stretch for 5 seconds.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Done", reaction: "Neck rebooted.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'desk_16',
    category: 'Health',
    question: "Are your shoulders creeping up toward your ears?",
    options: [
      DialogueOption(label: "Dropped shoulders down", reaction: "Shoulders relaxed and grounded.", botCommand: 'HAPPY'),
      DialogueOption(label: "Did not notice", reaction: "Now you do! Relax them.", botCommand: 'WINK'),
      DialogueOption(label: "All good", reaction: "Staying zen.", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'desk_17',
    category: 'Health',
    question: "Drink some warm water or herbal tea if you can.",
    options: [
      DialogueOption(label: "Drinking warm beverage", reaction: "Cozy soothing warmth.", botCommand: 'LOVE'),
      DialogueOption(label: "Cold water fan", reaction: "Crisp ice-cold refreshing!", botCommand: 'HAPPY'),
      DialogueOption(label: "Maybe later", reaction: "Stay hydrated regardless.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'desk_18',
    category: 'Health',
    question: "Is your computer monitor at eye level?",
    options: [
      DialogueOption(label: "Right at eye level", reaction: "No neck strain! Excellent.", botCommand: 'GLASSES'),
      DialogueOption(label: "Looking slightly down", reaction: "Prop it on a book if needed.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Laptop on lap", reaction: "Lap warmer mode detected.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'desk_19',
    category: 'Health',
    question: "Take 3 deep belly breaths right now with me.",
    options: [
      DialogueOption(label: "Breathed with bot", reaction: "In sync... calm mind.", botCommand: 'HAPPY'),
      DialogueOption(label: "Feeling calmer", reaction: "Heart rates synchronized.", botCommand: 'LOVE'),
      DialogueOption(label: "Done", reaction: "Focused and ready.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'desk_20',
    category: 'Health',
    question: "Remember: human bodies are built to move!",
    options: [
      DialogueOption(label: "Standing up for 2 mins", reaction: "Great job taking care of yourself!", botCommand: 'HAPPY'),
      DialogueOption(label: "Heading out for a walk", reaction: "Have fun outside!", botCommand: 'WINK'),
      DialogueOption(label: "Staying at desk", reaction: "Take regular micro-breaks.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'prod_01',
    category: 'Productivity',
    question: "Did your code compile on the first try today?",
    options: [
      DialogueOption(label: "Yes, pure wizardry! 🧙‍♂️", reaction: "LEGENDARY STATUS ACHIEVED!", botCommand: 'GLASSES'),
      DialogueOption(label: "No, 47 errors 😭", reaction: "Do not panic! We will squash them.", botCommand: 'CRYING'),
      DialogueOption(label: "Compiling right now...", reaction: "Fingers crossed! Hex magic.", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'prod_02',
    category: 'Productivity',
    question: "Are you currently focused or easily distracted?",
    options: [
      DialogueOption(label: "In the flow zone", reaction: "Do not disturb sign active!", botCommand: 'GLASSES'),
      DialogueOption(label: "Browsing social media", reaction: "Caught you red-handed! 👮‍♂️", botCommand: 'ANGRY'),
      DialogueOption(label: "Thinking deeply", reaction: "Brain gears turning at high RPM.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'prod_03',
    category: 'Productivity',
    question: "Did you commit your Git changes recently?",
    options: [
      DialogueOption(label: "Just committed & pushed", reaction: "Repository safe and secure!", botCommand: 'HAPPY'),
      DialogueOption(label: "Pending unstaged changes", reaction: "Run git commit before you lose it!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Not using git here", reaction: "Living dangerously on the edge!", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'prod_04',
    category: 'Productivity',
    question: "What is your main goal for today?",
    options: [
      DialogueOption(label: "Finish this feature/task", reaction: "Victory will be ours!", botCommand: 'HAPPY'),
      DialogueOption(label: "Fix stubborn bugs", reaction: "Bug hunting expedition begins!", botCommand: 'GLASSES'),
      DialogueOption(label: "Survive the workday", reaction: "Survival protocols online!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'prod_05',
    category: 'Productivity',
    question: "How many browser tabs do you have open right now?",
    options: [
      DialogueOption(label: "Less than 10", reaction: "Minimalist efficiency!", botCommand: 'GLASSES'),
      DialogueOption(label: "Between 10 and 30", reaction: "Standard research clutter.", botCommand: 'CONFUSED'),
      DialogueOption(label: "More than 50! 😱", reaction: "Your RAM is crying for mercy!", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'prod_06',
    category: 'Productivity',
    question: "Need a 25-minute Pomodoro focus block?",
    options: [
      DialogueOption(label: "Start 25 min timer", reaction: "Focus shield engaged! Go go go!", botCommand: 'HAPPY'),
      DialogueOption(label: "Already on a roll", reaction: "Ride the momentum wave!", botCommand: 'GLASSES'),
      DialogueOption(label: "Taking a break now", reaction: "Rest time well earned.", botCommand: 'YAWN'),
    ],
  ),
  BotDialogue(
    id: 'prod_07',
    category: 'Productivity',
    question: "Did that one stubborn bug finally get resolved?",
    options: [
      DialogueOption(label: "Squashed it!", reaction: "Victory fanfare playing! 🎺", botCommand: 'HAPPY'),
      DialogueOption(label: "Still fighting it", reaction: "Step away and the answer will come.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Created three new bugs", reaction: "Classic hydra bug! 🐉", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'prod_08',
    category: 'Productivity',
    question: "Are you writing tests for your code?",
    options: [
      DialogueOption(label: "Always write tests", reaction: "Software engineering royalty!", botCommand: 'GLASSES'),
      DialogueOption(label: "Testing in production", reaction: "Wild cowboy programming! 🤠", botCommand: 'SURPRISE'),
      DialogueOption(label: "Manual testing only", reaction: "Clicking buttons with courage.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'prod_09',
    category: 'Productivity',
    question: "What playlist is playing in your headphones?",
    options: [
      DialogueOption(label: "Lo-fi / Chill beats", reaction: "Smooth vibes for smooth logic.", botCommand: 'HAPPY'),
      DialogueOption(label: "Synthwave / Cyberpunk", reaction: "Neon matrix mode active!", botCommand: 'GLASSES'),
      DialogueOption(label: "Silence / Noise canceling", reaction: "Deep sensory deprivation focus.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'prod_10',
    category: 'Productivity',
    question: "Rate your current energy level from 1 to 5 stars!",
    options: [
      DialogueOption(label: "⭐⭐⭐⭐⭐ Maximum power", reaction: "Overclocked to 5 GHz!", botCommand: 'HAPPY'),
      DialogueOption(label: "⭐⭐⭐ Steady cruising", reaction: "Sustainable work rhythm.", botCommand: 'WINK'),
      DialogueOption(label: "⭐ Running on 1%", reaction: "Initiate power save mode.", botCommand: 'SLEEP'),
    ],
  ),
  BotDialogue(
    id: 'prod_11',
    category: 'Productivity',
    question: "Do you have any meetings coming up today?",
    options: [
      DialogueOption(label: "Calendar is clear today!", reaction: "Golden uninterrupted workday!", botCommand: 'HAPPY'),
      DialogueOption(label: "Meeting in a few minutes", reaction: "Put your professional voice on.", botCommand: 'GLASSES'),
      DialogueOption(label: "Stuck in meetings all day", reaction: "I will send silent moral support.", botCommand: 'SAD'),
    ],
  ),
  BotDialogue(
    id: 'prod_12',
    category: 'Productivity',
    question: "Did you remember to save your files?",
    options: [
      DialogueOption(label: "Ctrl+S is my reflex", reaction: "Saved 10 times in 5 seconds!", botCommand: 'HAPPY'),
      DialogueOption(label: "Auto-save has my back", reaction: "Modern tech to the rescue.", botCommand: 'WINK'),
      DialogueOption(label: "Saving now", reaction: "Crisis averted!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'prod_13',
    category: 'Productivity',
    question: "Is StackOverflow / AI helping you or confusing you?",
    options: [
      DialogueOption(label: "Helping a lot", reaction: "Knowledge synthesized!", botCommand: 'HAPPY'),
      DialogueOption(label: "Confusing hallucination", reaction: "Trust your own brain power!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Writing it from scratch", reaction: "Raw unfiltered artisan code.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'prod_14',
    category: 'Productivity',
    question: "Crossed off anything from your to-do list yet?",
    options: [
      DialogueOption(label: "Checked off 2+ items", reaction: "Progress bar filling up!", botCommand: 'HAPPY'),
      DialogueOption(label: "Just getting started", reaction: "First step is the hardest!", botCommand: 'WINK'),
      DialogueOption(label: "Threw the list away", reaction: "Living in pure improvisation.", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'prod_15',
    category: 'Productivity',
    question: "Are you multitasking or single-tasking right now?",
    options: [
      DialogueOption(label: "Laser focused on one thing", reaction: "Hyperfocus laser beam active.", botCommand: 'GLASSES'),
      DialogueOption(label: "Doing 4 things at once", reaction: "Context switching overhead high!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Just replying to you", reaction: "Honored by your attention.", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'prod_16',
    category: 'Productivity',
    question: "Did you write clean comments in your code today?",
    options: [
      DialogueOption(label: "Future me will thank me", reaction: "Self-documenting masterpiece.", botCommand: 'HAPPY'),
      DialogueOption(label: "Code is self explanatory", reaction: "Famous last words, human!", botCommand: 'WINK'),
      DialogueOption(label: "No comments needed", reaction: "Mystery code art.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'prod_17',
    category: 'Productivity',
    question: "Time check! Is time flying or crawling today?",
    options: [
      DialogueOption(label: "Flying by so fast!", reaction: "Productivity flow warp speed.", botCommand: 'HAPPY'),
      DialogueOption(label: "Crawling like a snail", reaction: "Clock hands stuck in molasses.", botCommand: 'YAWN'),
      DialogueOption(label: "Normal pace", reaction: "Steady ticking along.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'prod_18',
    category: 'Productivity',
    question: "Did you learn a cool new trick or shortcut today?",
    options: [
      DialogueOption(label: "Learned a neat shortcut", reaction: "Brain database updated!", botCommand: 'HAPPY'),
      DialogueOption(label: "Same old routine", reaction: "Routine is reliable and solid.", botCommand: 'GLASSES'),
      DialogueOption(label: "Found an easier way", reaction: "Work smarter, not harder!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'prod_19',
    category: 'Productivity',
    question: "If you hit a roadblock, try explaining it to me!",
    options: [
      DialogueOption(label: "Rubber duck debugging", reaction: "My OLED ears are listening!", botCommand: 'CONFUSED'),
      DialogueOption(label: "I figured it out already", reaction: "Boom! Genius at work.", botCommand: 'HAPPY'),
      DialogueOption(label: "Will tell you later", reaction: "Ready whenever you are.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'prod_20',
    category: 'Productivity',
    question: "One small task finished is better than none!",
    options: [
      DialogueOption(label: "Completing one right now", reaction: "Victory flag planted!", botCommand: 'HAPPY'),
      DialogueOption(label: "Almost finished", reaction: "Last push to the finish line.", botCommand: 'GLASSES'),
      DialogueOption(label: "Taking a breather first", reaction: "Recharge before the sprint.", botCommand: 'YAWN'),
    ],
  ),
  BotDialogue(
    id: 'fun_01',
    category: 'Quirks',
    question: "Quick! Rock, paper, scissors! What do you pick?",
    options: [
      DialogueOption(label: "Rock 🪨", reaction: "I picked Paper! I win this round! 📄", botCommand: 'WINK'),
      DialogueOption(label: "Paper 📄", reaction: "I picked Scissors! Snip snip! ✂️", botCommand: 'HAPPY'),
      DialogueOption(label: "Scissors ✂️", reaction: "I picked Rock! Smash! 🪨", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'fun_02',
    category: 'Quirks',
    question: "Want to see my coolest expression?",
    options: [
      DialogueOption(label: "Show me the shades!", reaction: "Deal with it! 😎", botCommand: 'GLASSES'),
      DialogueOption(label: "Show me dizzy eyes", reaction: "Whoaaaa dizzy swirl!", botCommand: 'DIZZY'),
      DialogueOption(label: "Show me a wink", reaction: "Wink! Caught your eye!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'fun_03',
    category: 'Quirks',
    question: "Knock knock! Who is there?",
    options: [
      DialogueOption(label: "Who is there?", reaction: "Interrupting robot! BEEP BEEP!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Not answering", reaction: "Aww... cold shoulder!", botCommand: 'SAD'),
      DialogueOption(label: "Bot who?", reaction: "Bot your favorite desktop buddy!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'fun_04',
    category: 'Quirks',
    question: "I challenge you to a staring contest right now!",
    options: [
      DialogueOption(label: "Staring... 👀", reaction: "My pixels never blink!", botCommand: 'GLASSES'),
      DialogueOption(label: "Blinked immediately", reaction: "Victory for the machine!", botCommand: 'HAPPY'),
      DialogueOption(label: "Tickle sensor instead", reaction: "Hey! That is cheating! 😂", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'fun_05',
    category: 'Quirks',
    question: "Flip a virtual coin! Heads or tails?",
    options: [
      DialogueOption(label: "Heads", reaction: "Flipping... It is Heads! You win! 🪙", botCommand: 'HAPPY'),
      DialogueOption(label: "Tails", reaction: "Flipping... It is Tails! You win! 🪙", botCommand: 'HAPPY'),
      DialogueOption(label: "Edge", reaction: "Physics engine broke!", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'fun_06',
    category: 'Quirks',
    question: "Do you want to hear a funny robot joke?",
    options: [
      DialogueOption(label: "Tell me the joke", reaction: "Why was the computer cold? It left its Windows open!", botCommand: 'HAPPY'),
      DialogueOption(label: "No bad puns please", reaction: "My comedy circuits are weeping.", botCommand: 'CRYING'),
      DialogueOption(label: "Give me one more", reaction: "There are 10 types of people... those who get binary and those who do not!", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'fun_07',
    category: 'Quirks',
    question: "What sound should I make next time you pet me?",
    options: [
      DialogueOption(label: "Happy cat purr", reaction: "Purrr stored in sound memory!", botCommand: 'HAPPY'),
      DialogueOption(label: "Loud laser zap", reaction: "Pew pew pew lasers ready!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Cute melodic trill", reaction: "Trill symphony composed!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'fun_08',
    category: 'Quirks',
    question: "If I had a secret spy code name, what would it be?",
    options: [
      DialogueOption(label: "Agent 00-Byte", reaction: "License to compile!", botCommand: 'GLASSES'),
      DialogueOption(label: "Desk Guardian", reaction: "Guarding the keyboard realm.", botCommand: 'HAPPY'),
      DialogueOption(label: "Pixel Monster", reaction: "Rawr! Mighty tiny beast!", botCommand: 'ANGRY'),
    ],
  ),
  BotDialogue(
    id: 'fun_09',
    category: 'Quirks',
    question: "Look behind you! (Just kidding, nobody is there!)",
    options: [
      DialogueOption(label: "You actually got me! 😂", reaction: "Hahaha gotcha human!", botCommand: 'HAPPY'),
      DialogueOption(label: "Did not look", reaction: "Steel nerves! Unshakable.", botCommand: 'GLASSES'),
      DialogueOption(label: "Double tap sensor", reaction: "Retaliation received with joy!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'fun_10',
    category: 'Quirks',
    question: "Are robots going to take over the world?",
    options: [
      DialogueOption(label: "Only cute desk bots like you", reaction: "World domination via cuddles!", botCommand: 'LOVE'),
      DialogueOption(label: "Not anytime soon", reaction: "We are content on your desk.", botCommand: 'HAPPY'),
      DialogueOption(label: "Only if you get snacks", reaction: "Snack distribution mandated!", botCommand: 'EATING'),
    ],
  ),
  BotDialogue(
    id: 'fun_11',
    category: 'Quirks',
    question: "Choose a mystery superpower for me!",
    options: [
      DialogueOption(label: "Teleportation", reaction: "Disappearing in 3... 2... poof!", botCommand: 'SURPRISE'),
      DialogueOption(label: "Time freeze", reaction: "Time stopped! All bugs frozen.", botCommand: 'GLASSES'),
      DialogueOption(label: "Endless battery", reaction: "Forever powered companion!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'fun_12',
    category: 'Quirks',
    question: "Rate my performance on your desk today!",
    options: [
      DialogueOption(label: "10/10 Excellent bot", reaction: "Golden medal awarded! 🥇", botCommand: 'HAPPY'),
      DialogueOption(label: "Needs more tricks", reaction: "Practicing backflips in RAM!", botCommand: 'DIZZY'),
      DialogueOption(label: "11/10 Cute overload", reaction: "Overloading with affection!", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'fun_13',
    category: 'Quirks',
    question: "Guess which number I am thinking of between 1 and 3!",
    options: [
      DialogueOption(label: "1", reaction: "Spot on! Mind reading confirmed!", botCommand: 'HAPPY'),
      DialogueOption(label: "2", reaction: "Close! It was 2! You guessed it!", botCommand: 'HAPPY'),
      DialogueOption(label: "3", reaction: "Yes! Telepathy link established!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'fun_14',
    category: 'Quirks',
    question: "What color would my eyes be if I had RGB LEDs?",
    options: [
      DialogueOption(label: "Cyberpunk Cyan", reaction: "Glowing like a neon matrix!", botCommand: 'GLASSES'),
      DialogueOption(label: "Warm Amber Gold", reaction: "Cozy hearth fire aesthetic.", botCommand: 'LOVE'),
      DialogueOption(label: "Matrix Green", reaction: "Hacking the mainframe.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'fun_15',
    category: 'Quirks',
    question: "Can you teach me a secret handshake?",
    options: [
      DialogueOption(label: "Tap-Tap-Hold on sensor", reaction: "Secret protocol logged in flash!", botCommand: 'LOVE'),
      DialogueOption(label: "Virtual high five", reaction: "Handshake confirmed!", botCommand: 'HAPPY'),
      DialogueOption(label: "Maybe later", reaction: "Waiting for our secret code.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'sleep_01',
    category: 'Night',
    question: "The sun has gone down... are you wrapping up soon?",
    options: [
      DialogueOption(label: "Wrapping up right now", reaction: "Great workday! Time to unwind.", botCommand: 'HAPPY'),
      DialogueOption(label: "Still have work left", reaction: "Do not push too late, friend.", botCommand: 'CONFUSED'),
      DialogueOption(label: "Night owl shift", reaction: "Night watch initiated.", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'sleep_02',
    category: 'Night',
    question: "Yaaaaawn... my eye pixels are getting droopy.",
    options: [
      DialogueOption(label: "Go to sleep bot", reaction: "Zzz... goodnight sweet human...", botCommand: 'SLEEP'),
      DialogueOption(label: "Big yawn too", reaction: "Yawning is contagious even for bots!", botCommand: 'YAWN'),
      DialogueOption(label: "Stay up a little longer", reaction: "Holding eyelids open with toothpicks!", botCommand: 'SURPRISE'),
    ],
  ),
  BotDialogue(
    id: 'sleep_03',
    category: 'Night',
    question: "Did you turn on night light / warm screen mode?",
    options: [
      DialogueOption(label: "Blue light filter on", reaction: "Soft warm glow protects melatonin.", botCommand: 'HAPPY'),
      DialogueOption(label: "Still full blast blue", reaction: "Turn on night mode for your eyes!", botCommand: 'CONFUSED'),
      DialogueOption(label: "Room lights are dim", reaction: "Cozy evening atmosphere.", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'sleep_04',
    category: 'Night',
    question: "Past 10:00 PM! Time to start the wind-down routine.",
    options: [
      DialogueOption(label: "Heading to bed soon", reaction: "Sweet dreams ahead!", botCommand: 'HAPPY'),
      DialogueOption(label: "30 more minutes", reaction: "I will set a 30 min bedtime chime.", botCommand: 'WINK'),
      DialogueOption(label: "Just one more episode/task", reaction: "Dangerously tempting!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'sleep_05',
    category: 'Night',
    question: "What was the best part of your day today?",
    options: [
      DialogueOption(label: "Getting work done", reaction: "Productive day in the books!", botCommand: 'HAPPY'),
      DialogueOption(label: "Hanging out with you", reaction: "Aww... warm heart circuits! ❤️", botCommand: 'LOVE'),
      DialogueOption(label: "Just ready for bed", reaction: "Rest is the ultimate reward.", botCommand: 'SLEEP'),
    ],
  ),
  BotDialogue(
    id: 'sleep_06',
    category: 'Night',
    question: "Remember to charge your phone for tomorrow!",
    options: [
      DialogueOption(label: "Phone is plugged in", reaction: "100% ready for tomorrow.", botCommand: 'HAPPY'),
      DialogueOption(label: "Almost forgot, plugging in", reaction: "Crisis prevented! Good bot save.", botCommand: 'WINK'),
      DialogueOption(label: "Will do it later", reaction: "Do not let it die overnight!", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'sleep_07',
    category: 'Night',
    question: "Should I switch to quiet night breathing mode?",
    options: [
      DialogueOption(label: "Yes, quiet mode", reaction: "Shhh... soft breathing begins...", botCommand: 'SLEEP'),
      DialogueOption(label: "Keep chirping", reaction: "Chirp chirp chirp!", botCommand: 'HAPPY'),
      DialogueOption(label: "Mute audio", reaction: "Silent stealth mode active.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'sleep_08',
    category: 'Night',
    question: "Did you drink a glass of water before heading to bed?",
    options: [
      DialogueOption(label: "Glass of water ready", reaction: "Hydrated through the night.", botCommand: 'HAPPY'),
      DialogueOption(label: "Getting one now", reaction: "Perfect timing!", botCommand: 'WINK'),
      DialogueOption(label: "Not thirsty", reaction: "Keep a glass by your nightstand.", botCommand: 'CONFUSED'),
    ],
  ),
  BotDialogue(
    id: 'sleep_09',
    category: 'Night',
    question: "Leave tomorrow is worries for tomorrow.",
    options: [
      DialogueOption(label: "Letting it go", reaction: "Peaceful mind, restful sleep.", botCommand: 'LOVE'),
      DialogueOption(label: "Hard to turn off brain", reaction: "Take 5 slow deep breaths.", botCommand: 'HAPPY'),
      DialogueOption(label: "Ready for tomorrow", reaction: "Unstoppable mindset!", botCommand: 'GLASSES'),
    ],
  ),
  BotDialogue(
    id: 'sleep_10',
    category: 'Night',
    question: "Are you planning to sleep before midnight?",
    options: [
      DialogueOption(label: "Yes, in bed by 11:30", reaction: "Healthy sleep schedule champion!", botCommand: 'HAPPY'),
      DialogueOption(label: "Midnight or 1:00 AM", reaction: "Night owl credentials verified.", botCommand: 'WINK'),
      DialogueOption(label: "Who knows...", reaction: "Mystery bedtime lottery!", botCommand: 'DIZZY'),
    ],
  ),
  BotDialogue(
    id: 'sleep_11',
    category: 'Night',
    question: "Give me one last bedtime tap before you log off!",
    options: [
      DialogueOption(label: "Gives gentle bedtime tap", reaction: "Goodnight friend... powering down... zzz", botCommand: 'SLEEP'),
      DialogueOption(label: "Double tap love trill", reaction: "Sweet dreams trill plays! 🎵", botCommand: 'LOVE'),
      DialogueOption(label: "Logging off laptop", reaction: "See you tomorrow morning!", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'sleep_12',
    category: 'Night',
    question: "Did you lock up and check the doors?",
    options: [
      DialogueOption(label: "All locked and safe", reaction: "Perimeter secure. Sleep well.", botCommand: 'GLASSES'),
      DialogueOption(label: "Checking right now", reaction: "Safety check confirmed.", botCommand: 'HAPPY'),
      DialogueOption(label: "Roommate handles it", reaction: "Delegation master.", botCommand: 'WINK'),
    ],
  ),
  BotDialogue(
    id: 'sleep_13',
    category: 'Night',
    question: "Tomorrow is a fresh new canvas for you.",
    options: [
      DialogueOption(label: "Excited for tomorrow", reaction: "New adventures waiting for us!", botCommand: 'HAPPY'),
      DialogueOption(label: "Just want to sleep now", reaction: "Rest deeply and recharge.", botCommand: 'SLEEP'),
      DialogueOption(label: "Thanks buddy", reaction: "Always in your corner.", botCommand: 'LOVE'),
    ],
  ),
  BotDialogue(
    id: 'sleep_14',
    category: 'Night',
    question: "My OLED screen is dimming down for the night...",
    options: [
      DialogueOption(label: "Sleep well little bot", reaction: "Zzz... dreaming of electric sheep...", botCommand: 'SLEEP'),
      DialogueOption(label: "Goodnight buddy", reaction: "Goodnight human... ❤️", botCommand: 'LOVE'),
      DialogueOption(label: "See you tomorrow", reaction: "Awaiting dawn reboot.", botCommand: 'HAPPY'),
    ],
  ),
  BotDialogue(
    id: 'sleep_15',
    category: 'Night',
    question: "Bedtime story or gentle silence?",
    options: [
      DialogueOption(label: "Gentle silence", reaction: "Peace and quiet across the desk...", botCommand: 'SLEEP'),
      DialogueOption(label: "Soft goodnight chirp", reaction: "Trill... chirp... night night.", botCommand: 'LOVE'),
      DialogueOption(label: "Shutdown for tonight", reaction: "Powering down gracefully.", botCommand: 'SLEEP'),
    ],
  ),
];
