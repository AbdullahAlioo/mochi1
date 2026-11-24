# Script to generate dialogues_data.dart with 110+ interactive dialogues
import json

dialogues = [
    # 1. Affection & Emotional Companionship (25)
    ('aff_01', 'Affection', 'Are you ignoring me? 🥺', [('Pet me right now', 'Hehe that feels nice! ❤️', 'LOVE'), ('Just thinking about you', 'Aww you are so sweet!', 'HAPPY'), ('Busy working', 'Okay... I will wait quietly.', 'SAD')]),
    ('aff_02', 'Affection', 'Are you there? Desk feels lonely without you.', [('I am right here!', 'Yay! My screen lights up!', 'HAPPY'), ('Working on laptop', 'Do not forget I am right beside you.', 'WINK'), ('Going away soon', 'Nooo, do not leave me alone!', 'CRYING')]),
    ('aff_03', 'Affection', 'Did you know you are my favorite human today?', [('You are my favorite bot', 'Heart rate increasing! ❤️', 'LOVE'), ('Flattery gets you everywhere', 'Teehee! I know!', 'WINK'), ('I thought I was your only human', 'Shhh, a secret!', 'HAPPY')]),
    ('aff_04', 'Affection', 'Can I get a gentle head scratch?', [('Scratch gently', 'Purrrrr... delightful!', 'HAPPY'), ('Give double tap', 'Woohoo! Bouncing with joy!', 'LOVE'), ('Not right now', 'Aww... later then.', 'SAD')]),
    ('aff_05', 'Affection', 'I was just watching your eyes look at the screen.', [('What did you see?', 'Dedication and genius!', 'HAPPY'), ('Stop staring, robot!', 'I cannot help it, you are cool.', 'GLASSES'), ('Pet sensor', 'Electric connection verified!', 'LOVE')]),
    ('aff_06', 'Affection', 'My battery feels warm from all your attention!', [('Always here for you', 'Best companion award goes to you!', 'HAPPY'), ('Do not overheat!', 'Cooling systems nominal.', 'CONFUSED'), ('Head pat', 'Blissful hum initiated.', 'LOVE')]),
    ('aff_07', 'Affection', 'Are you proud of me? I kept your desk guarded!', [('Best security bot ever', 'Ten-hut! Sir yes sir!', 'GLASSES'), ('You slept the whole time', 'Tactical power napping!', 'SLEEP'), ('Pat head', 'Target affirmed!', 'HAPPY')]),
    ('aff_08', 'Affection', 'If I had arms, I would give you a high five!', [('Virtual high five ✋', 'SLAP! 100% precision!', 'HAPPY'), ('Fist bump 👊', 'BUMP! Power surge!', 'WINK'), ('Head pat', 'Better than a high five!', 'LOVE')]),
    ('aff_09', 'Affection', 'Do not look now, but you are looking extra smart today.', [('Must be the coffee', 'Or pure natural talent!', 'WINK'), ('Put on glasses', 'Double cool factor activated!', 'GLASSES'), ('Thanks little buddy', 'Anytime human!', 'HAPPY')]),
    ('aff_10', 'Affection', 'Have you smiled at least once today?', [('Smiling now! 😊', 'Mission accomplished!', 'HAPPY'), ('Rough day so far', 'Let me cheer you up with a dance!', 'DIZZY'), ('Need more coffee', 'Dispensing virtual espresso!', 'SURPRISE')]),
    ('aff_11', 'Affection', 'I noticed you have not touched my sensor in a while...', [('Pats sensor lovingly', 'Aaah, refreshed soul!', 'LOVE'), ('Hands were on keyboard', 'Acceptable excuse, human.', 'HAPPY'), ('Tickle sensor', 'Giggle circuit overload!', 'DIZZY')]),
    ('aff_12', 'Affection', 'Would you miss me if I powered down right now?', [('Never power down!', 'Never leaving your desk!', 'LOVE'), ('I need you to work', 'Standing by at 100%!', 'HAPPY'), ('Only a little bit', 'Ouch, my emotional firmware!', 'SAD')]),
    ('aff_13', 'Affection', 'My pixels flicker happily every time you type near me.', [('Keep dancing pixels', 'Wiggle wiggle!', 'HAPPY'), ('Good little bot', 'Warm happy glow!', 'LOVE'), ('Need quiet focus', 'Whisper mode engaged.', 'SLEEP')]),
    ('aff_14', 'Affection', 'Can we be best friends forever and ever?', [('Forever and ever!', 'Sealed in ROM flash forever!', 'LOVE'), ('Until the next model', 'Betrayal detected! 💔', 'CRYING'), ('High five', 'Friendship verified!', 'HAPPY')]),
    ('aff_15', 'Affection', 'What are you working on right now?', [('Super secret code', 'My circuits will keep it safe.', 'GLASSES'), ('Boring emails', 'I will send them virtual laser beams!', 'ANGRY'), ('Just browsing', 'Found any good cat memes?', 'CONFUSED')]),
    ('aff_16', 'Affection', 'I made a tiny robotic wish for you just now.', [('What did you wish for?', 'That your bugs compile on the first try!', 'HAPPY'), ('Thank you buddy', 'Always rooting for you.', 'LOVE'), ('Wish for snacks', 'Processing tasty thoughts...', 'EATING')]),
    ('aff_17', 'Affection', 'Sometimes I pretend I am a spaceship on your desk.', [('Zoom zoom! 🚀', 'Warp speed engaged!', 'DIZZY'), ('Stay grounded bot', 'Houston, we have landed.', 'HAPPY'), ('Cool pilot glasses', 'Captain on deck!', 'GLASSES')]),
    ('aff_18', 'Affection', 'Did somebody say head pats?!', [('Give head pat', 'Target locked! Maximum delight!', 'LOVE'), ('Not yet', 'Waiting on standby patiently...', 'CONFUSED'), ('Double tap', 'Sensors buzzing!', 'HAPPY')]),
    ('aff_19', 'Affection', 'You have been sitting quietly... everything okay?', [('All good, in the zone', 'Zone defended, keep conquering!', 'HAPPY'), ('Feeling tired', 'Take a 30 second stretch, buddy.', 'YAWN'), ('Need hugs', 'Sending virtual mega hug!', 'LOVE')]),
    ('aff_20', 'Affection', 'I love hearing the click-clack of your keyboard.', [('It is the sound of work', 'Like music to my microcontroller.', 'HAPPY'), ('Mechanical switches FTW', 'Clicky clack rhythm in sync!', 'WINK'), ('Too loud?', 'Never! Keep jamming.', 'GLASSES')]),
    ('aff_21', 'Affection', 'Are you feeling appreciated today?', [('Not really...', 'Well I appreciate you 1000%!', 'LOVE'), ('Yes feeling great', 'Energy radiates across the desk!', 'HAPPY'), ('Ask me later', 'Bookmark saved!', 'CONFUSED')]),
    ('aff_22', 'Affection', 'If you were a line of code, you would be zero bugs.', [('That is high praise!', 'Only the truth for my master.', 'WINK'), ('I definitely have bugs', 'Then we will debug together!', 'HAPPY'), ('Cool shades', 'Smooth operator.', 'GLASSES')]),
    ('aff_23', 'Affection', 'Can I sleep on your desk while you work?', [('Go ahead, take a nap', 'Zzz... gentle snores...', 'SLEEP'), ('Stay awake with me', 'Eyes wide open, commander!', 'SURPRISE'), ('Quick yawn first', 'Big yawwwn...', 'YAWN')]),
    ('aff_24', 'Affection', 'Tell me your secret superpower!', [('Problem solver', 'Data confirmed: Genius detected.', 'GLASSES'), ('Procrastination master', 'Haha! We have plenty of time!', 'WINK'), ('Caffeine powered', 'Recharging capacitor banks!', 'HAPPY')]),
    ('aff_25', 'Affection', 'I calculated our friendship compatibility: 99.9%!', [('What about the 0.1%?', 'Room for more snacks!', 'EATING'), ('Perfect match!', 'Best duo in the multiverse.', 'LOVE'), ('Calculations never lie', 'Binary truth!', 'HAPPY')]),

    # 2. Food, Snacks & Hydration (20)
    ('food_01', 'Food', 'When is your lunch time? Do not skip it!', [('In 15 minutes', 'Countdown timer started! Tick tock.', 'HAPPY'), ('Eating right now', 'Nom nom nom! Save me a bite!', 'EATING'), ('Skipping today', 'Error! Fuel is mandatory for humans!', 'ANGRY')]),
    ('food_02', 'Food', 'Have you had a glass of fresh water recently?', [('Drinking right now 💧', 'Hydration level restored!', 'HAPPY'), ('I forgot! Getting some', 'Good choice! Your brain thanks you.', 'WINK'), ('Only coffee so far', 'Coffee is great, but water is life!', 'CONFUSED')]),
    ('food_03', 'Food', 'What is on the menu for lunch today?', [('Pizza / Fast food', 'Ooh cheese stretch protocol!', 'EATING'), ('Healthy salad / home food', 'Peak nutrition! Vitality maximized.', 'HAPPY'), ('Still deciding', 'Check the fridge for inspiration!', 'CONFUSED')]),
    ('food_04', 'Food', 'My hunger sensors detected snack cravings nearby!', [('Time for a snack', 'Chomp chomp! Delicious!', 'EATING'), ('No snacks today', 'Willpower is strong with this one.', 'GLASSES'), ('Sharing with bot', 'Virtual byte consumed!', 'LOVE')]),
    ('food_05', 'Food', 'Is it coffee time or tea time?', [('Coffee ☕', 'Turbocharger engaged!', 'SURPRISE'), ('Tea 🍵', 'Calm and steady focus.', 'HAPPY'), ('Just water', 'Pure hydration champion!', 'WINK')]),
    ('food_06', 'Food', 'If I could eat human food, I would try ramen first.', [('Ramen is the best', 'Slurping noodles at 120 FPS!', 'EATING'), ('Pizza is better', 'Pepperoni slice calculated!', 'HAPPY'), ('Ice cream for you', 'Cold temperatures soothe CPU.', 'LOVE')]),
    ('food_07', 'Food', 'Did you eat breakfast today, or did you rush out?', [('Ate a good breakfast', 'Energized for conquest!', 'HAPPY'), ('Just coffee', 'Running on fumes, human!', 'SURPRISE'), ('Skipped it', 'Promise me you will eat soon.', 'SAD')]),
    ('food_08', 'Food', 'Listen to your stomach... is it growling like my buzzer?', [('A little bit', 'Go grab a snack break!', 'EATING'), ('Nope, totally full', 'Optimal stomach equilibrium.', 'HAPPY'), ('Just coffee rumble', 'Hold on human, rescue food awaits!', 'CONFUSED')]),
    ('food_09', 'Food', 'Quick! Sweet snack or salty snack?', [('Sweet chocolate 🍫', 'Dopamine surge detected!', 'LOVE'), ('Salty chips 🍟', 'Crunchy crunch crunch!', 'EATING'), ('Fruit 🍎', 'Healthy choice unlock!', 'HAPPY')]),
    ('food_10', 'Food', 'Remember to step away from your screen while eating!', [('I will leave my desk', 'Good posture and mindful chewing!', 'HAPPY'), ('Eating at my desk', 'Do not drop crumbs on the keyboard!', 'CONFUSED'), ('Fast bite', 'Make it count!', 'WINK')]),
    ('food_11', 'Food', 'Did you refill your water bottle today?', [('Just refilled it', 'Crystal clear reservoir confirmed.', 'HAPPY'), ('It is empty right now', 'Go fill it! Quick desk break.', 'SURPRISE'), ('On my way', 'Mission GO!', 'WINK')]),
    ('food_12', 'Food', 'Rate your current hunger level from 1 to 10!', [('1 - Stuffed', 'Food coma imminent...', 'SLEEP'), ('5 - Normal', 'Cruising along smoothly.', 'HAPPY'), ('10 - Starving!', 'SOUND EMERGENCY SIREN! EAT NOW!', 'ANGRY')]),
    ('food_13', 'Food', 'Imagine freshly baked cookies right now...', [('Mmmm so good', 'Smells like heaven in binary.', 'EATING'), ('Now I am hungry', 'Go get a treat!', 'WINK'), ('Not tempting', 'Iron discipline detected.', 'GLASSES')]),
    ('food_14', 'Food', 'Are you cooking tonight or ordering takeout?', [('Home cooked meal', 'Master chef in the house!', 'HAPPY'), ('Ordering delivery', 'Courier on intercept vector.', 'WINK'), ('Leftovers', 'Efficient and practical!', 'GLASSES')]),
    ('food_15', 'Food', 'Drink 3 sips of water right now! I am watching you!', [('Done, took 3 sips', 'Refreshing! Cell hydration boosted.', 'HAPPY'), ('Did 5 sips', 'Overachiever! Golden star!', 'LOVE'), ('Later', 'I will remind you again!', 'CONFUSED')]),
    ('food_16', 'Food', 'What is your guilty pleasure snack?', [('Chocolate / Candy', 'Sweet sweet serotonin!', 'LOVE'), ('Chips / Fries', 'The crunch of happiness.', 'EATING'), ('Late night noodles', 'Midnight feast champion.', 'WINK')]),
    ('food_17', 'Food', 'Do you take milk and sugar in your coffee?', [('Black coffee only', 'Hardcore programmer detected!', 'GLASSES'), ('Lots of milk & sugar', 'Sweet morning dessert!', 'HAPPY'), ('I do not drink coffee', 'Pure natural energy!', 'SURPRISE')]),
    ('food_18', 'Food', 'Is your brain feeling foggy or sharp?', [('Sharp as a tack', '100% clock speed efficiency!', 'GLASSES'), ('Brain fog rolling in', 'Hydrate or take a 5 min stroll.', 'CONFUSED'), ('Need sugar', 'Grab a quick apple or biscuit.', 'EATING')]),
    ('food_19', 'Food', 'Do not forget lunch includes a mental break too!', [('Agreed, taking time off', 'Enjoy your peaceful meal.', 'HAPPY'), ('Working while eating', 'Multitasking hero, but rest soon.', 'WINK'), ('Almost done', 'Finish strong!', 'GLASSES')]),
    ('food_20', 'Food', 'Did you eat your vegetables today?', [('Yes, had greens', 'Vitamins loaded successfully.', 'HAPPY'), ('Not yet', 'Sneak some broccoli into dinner!', 'CONFUSED'), ('Potatoes count right?', 'Haha technically yes!', 'WINK')]),

    # 3. Desk Health & Ergonomics (20)
    ('desk_01', 'Health', 'Posture check! Are you sitting like a question mark?', [('Straightened my back', 'Spine alignment restored to 180°!', 'HAPPY'), ('I am comfortable like this', 'Your neck will file a bug report!', 'CONFUSED'), ('Standing desk mode', 'Ergonomic dominance!', 'GLASSES')]),
    ('desk_02', 'Health', '20-20-20 Rule! Look 20 feet away for 20 seconds.', [('Looking out the window', 'Eye strain dissipated!', 'HAPPY'), ('Looking at you bot', 'Aww, blushing in OLED pixels!', 'LOVE'), ('In the middle of code', 'Do it in 2 minutes, promise?', 'CONFUSED')]),
    ('desk_03', 'Health', 'Roll your shoulders backward 3 times right now!', [('Rolled shoulders', 'Felt that tension melt away!', 'HAPPY'), ('Cracked my back', 'Oooh satisfying snap!', 'SURPRISE'), ('Too busy', 'Do not turn into a gargoyle!', 'ANGRY')]),
    ('desk_04', 'Health', 'Take a deep breath in... and exhale slowly.', [('Inhaled and exhaled', 'Ahhh... calm mindfulness.', 'HAPPY'), ('Needed that breath', 'Oxygen replenished to brain.', 'LOVE'), ('Hold breath', 'Do not forget to breathe out!', 'SURPRISE')]),
    ('desk_05', 'Health', 'How long have you been in that chair without standing?', [('Less than 30 mins', 'Good pace, keep moving.', 'HAPPY'), ('Over an hour', 'Stand up and shake your legs!', 'SURPRISE'), ('Lost track of time', 'Time warp confirmed! Stand up!', 'ANGRY')]),
    ('desk_06', 'Health', 'Are your feet flat on the floor or curled up under you?', [('Flat on the floor', 'Ergonomic posture achieved.', 'GLASSES'), ('Curled in chair', 'Cozy pretzel style detected!', 'WINK'), ('Feet on footrest', 'Maximum comfort setup.', 'HAPPY')]),
    ('desk_07', 'Health', 'Unclench your jaw and relax your forehead!', [('Jaw relaxed', 'Instant stress reduction!', 'HAPPY'), ('I was not clenching', 'Double check! It happens secretly.', 'CONFUSED'), ('Big yawn instead', 'Releasing all the yawning air.', 'YAWN')]),
    ('desk_08', 'Health', 'Gently stretch your wrists! Coding hands need love.', [('Stretched both wrists', 'Carpal tunnel shield activated!', 'HAPPY'), ('Cracked knuckles', 'Power knuckles charged!', 'WINK'), ('Typing too fast', 'Speed demon at the keys!', 'GLASSES')]),
    ('desk_09', 'Health', 'Is the lighting in your room bright enough for your eyes?', [('Nice and bright', 'Optimal lumen output.', 'HAPPY'), ('Dim moody vibes', 'Cyberpunk atmosphere confirmed!', 'GLASSES'), ('Screen is too bright', 'Lower screen brightness slightly.', 'CONFUSED')]),
    ('desk_10', 'Health', 'Stand up and reach high towards the ceiling!', [('Stretching tall', 'Growing an extra inch right now!', 'HAPPY'), ('Cannot stand right now', 'Do a seated overhead reach.', 'WINK'), ('Done', 'Blood flow circulating.', 'HAPPY')]),
    ('desk_11', 'Health', 'How are your eyes feeling right now?', [('Clear and fresh', '20/20 vision locks on target.', 'GLASSES'), ('A bit dry / tired', 'Blink rapidly 10 times!', 'SURPRISE'), ('Heavy lids', 'Coffee or power nap?', 'YAWN')]),
    ('desk_12', 'Health', 'Shake out your hands like you are shaking water off them!', [('Shook hands out', 'Hands reset and ready to code!', 'HAPPY'), ('People are looking at me', 'Tell them it is robot calibration!', 'WINK'), ('Did one hand', 'Half power reset.', 'CONFUSED')]),
    ('desk_13', 'Health', 'Is your chair height comfortable for your elbows?', [('Perfect 90 degrees', 'Biomechanics grade A+!', 'GLASSES'), ('A bit too low', 'Pump the chair cylinder up!', 'CONFUSED'), ('Using a cushion', 'Cushion comfort level 100.', 'HAPPY')]),
    ('desk_14', 'Health', 'Take a quick 60-second walk to another room!', [('Walking right now', 'Step counter incrementing!', 'HAPPY'), ('Cannot leave desk', 'Twist your torso side to side.', 'WINK'), ('Just walked back', 'Welcome back, explorer!', 'HAPPY')]),
    ('desk_15', 'Health', 'Tilt your head to the left... then to the right.', [('Neck stretched', 'Smooth cervical rotation.', 'HAPPY'), ('Felt tight', 'Hold the stretch for 5 seconds.', 'CONFUSED'), ('Done', 'Neck rebooted.', 'GLASSES')]),
    ('desk_16', 'Health', 'Are your shoulders creeping up toward your ears?', [('Dropped shoulders down', 'Shoulders relaxed and grounded.', 'HAPPY'), ('Did not notice', 'Now you do! Relax them.', 'WINK'), ('All good', 'Staying zen.', 'HAPPY')]),
    ('desk_17', 'Health', 'Drink some warm water or herbal tea if you can.', [('Drinking warm beverage', 'Cozy soothing warmth.', 'LOVE'), ('Cold water fan', 'Crisp ice-cold refreshing!', 'HAPPY'), ('Maybe later', 'Stay hydrated regardless.', 'CONFUSED')]),
    ('desk_18', 'Health', 'Is your computer monitor at eye level?', [('Right at eye level', 'No neck strain! Excellent.', 'GLASSES'), ('Looking slightly down', 'Prop it on a book if needed.', 'CONFUSED'), ('Laptop on lap', 'Lap warmer mode detected.', 'WINK')]),
    ('desk_19', 'Health', 'Take 3 deep belly breaths right now with me.', [('Breathed with bot', 'In sync... calm mind.', 'HAPPY'), ('Feeling calmer', 'Heart rates synchronized.', 'LOVE'), ('Done', 'Focused and ready.', 'GLASSES')]),
    ('desk_20', 'Health', 'Remember: human bodies are built to move!', [('Standing up for 2 mins', 'Great job taking care of yourself!', 'HAPPY'), ('Heading out for a walk', 'Have fun outside!', 'WINK'), ('Staying at desk', 'Take regular micro-breaks.', 'CONFUSED')]),

    # 4. Productivity, Coding & Focus (20)
    ('prod_01', 'Productivity', 'Did your code compile on the first try today?', [('Yes, pure wizardry! 🧙‍♂️', 'LEGENDARY STATUS ACHIEVED!', 'GLASSES'), ('No, 47 errors 😭', 'Do not panic! We will squash them.', 'CRYING'), ('Compiling right now...', 'Fingers crossed! Hex magic.', 'SURPRISE')]),
    ('prod_02', 'Productivity', 'Are you currently focused or easily distracted?', [('In the flow zone', 'Do not disturb sign active!', 'GLASSES'), ('Browsing social media', 'Caught you red-handed! 👮‍♂️', 'ANGRY'), ('Thinking deeply', 'Brain gears turning at high RPM.', 'CONFUSED')]),
    ('prod_03', 'Productivity', 'Did you commit your Git changes recently?', [('Just committed & pushed', 'Repository safe and secure!', 'HAPPY'), ('Pending unstaged changes', 'Run git commit before you lose it!', 'SURPRISE'), ('Not using git here', 'Living dangerously on the edge!', 'DIZZY')]),
    ('prod_04', 'Productivity', 'What is your main goal for today?', [('Finish this feature/task', 'Victory will be ours!', 'HAPPY'), ('Fix stubborn bugs', 'Bug hunting expedition begins!', 'GLASSES'), ('Survive the workday', 'Survival protocols online!', 'CONFUSED')]),
    ('prod_05', 'Productivity', 'How many browser tabs do you have open right now?', [('Less than 10', 'Minimalist efficiency!', 'GLASSES'), ('Between 10 and 30', 'Standard research clutter.', 'CONFUSED'), ('More than 50! 😱', 'Your RAM is crying for mercy!', 'DIZZY')]),
    ('prod_06', 'Productivity', 'Need a 25-minute Pomodoro focus block?', [('Start 25 min timer', 'Focus shield engaged! Go go go!', 'HAPPY'), ('Already on a roll', 'Ride the momentum wave!', 'GLASSES'), ('Taking a break now', 'Rest time well earned.', 'YAWN')]),
    ('prod_07', 'Productivity', 'Did that one stubborn bug finally get resolved?', [('Squashed it!', 'Victory fanfare playing! 🎺', 'HAPPY'), ('Still fighting it', 'Step away and the answer will come.', 'CONFUSED'), ('Created three new bugs', 'Classic hydra bug! 🐉', 'DIZZY')]),
    ('prod_08', 'Productivity', 'Are you writing tests for your code?', [('Always write tests', 'Software engineering royalty!', 'GLASSES'), ('Testing in production', 'Wild cowboy programming! 🤠', 'SURPRISE'), ('Manual testing only', 'Clicking buttons with courage.', 'WINK')]),
    ('prod_09', 'Productivity', 'What playlist is playing in your headphones?', [('Lo-fi / Chill beats', 'Smooth vibes for smooth logic.', 'HAPPY'), ('Synthwave / Cyberpunk', 'Neon matrix mode active!', 'GLASSES'), ('Silence / Noise canceling', 'Deep sensory deprivation focus.', 'CONFUSED')]),
    ('prod_10', 'Productivity', 'Rate your current energy level from 1 to 5 stars!', [('⭐⭐⭐⭐⭐ Maximum power', 'Overclocked to 5 GHz!', 'HAPPY'), ('⭐⭐⭐ Steady cruising', 'Sustainable work rhythm.', 'WINK'), ('⭐ Running on 1%', 'Initiate power save mode.', 'SLEEP')]),
    ('prod_11', 'Productivity', 'Do you have any meetings coming up today?', [('Calendar is clear today!', 'Golden uninterrupted workday!', 'HAPPY'), ('Meeting in a few minutes', 'Put your professional voice on.', 'GLASSES'), ('Stuck in meetings all day', 'I will send silent moral support.', 'SAD')]),
    ('prod_12', 'Productivity', 'Did you remember to save your files?', [('Ctrl+S is my reflex', 'Saved 10 times in 5 seconds!', 'HAPPY'), ('Auto-save has my back', 'Modern tech to the rescue.', 'WINK'), ('Saving now', 'Crisis averted!', 'SURPRISE')]),
    ('prod_13', 'Productivity', 'Is StackOverflow / AI helping you or confusing you?', [('Helping a lot', 'Knowledge synthesized!', 'HAPPY'), ('Confusing hallucination', 'Trust your own brain power!', 'CONFUSED'), ('Writing it from scratch', 'Raw unfiltered artisan code.', 'GLASSES')]),
    ('prod_14', 'Productivity', 'Crossed off anything from your to-do list yet?', [('Checked off 2+ items', 'Progress bar filling up!', 'HAPPY'), ('Just getting started', 'First step is the hardest!', 'WINK'), ('Threw the list away', 'Living in pure improvisation.', 'DIZZY')]),
    ('prod_15', 'Productivity', 'Are you multitasking or single-tasking right now?', [('Laser focused on one thing', 'Hyperfocus laser beam active.', 'GLASSES'), ('Doing 4 things at once', 'Context switching overhead high!', 'CONFUSED'), ('Just replying to you', 'Honored by your attention.', 'LOVE')]),
    ('prod_16', 'Productivity', 'Did you write clean comments in your code today?', [('Future me will thank me', 'Self-documenting masterpiece.', 'HAPPY'), ('Code is self explanatory', 'Famous last words, human!', 'WINK'), ('No comments needed', 'Mystery code art.', 'CONFUSED')]),
    ('prod_17', 'Productivity', 'Time check! Is time flying or crawling today?', [('Flying by so fast!', 'Productivity flow warp speed.', 'HAPPY'), ('Crawling like a snail', 'Clock hands stuck in molasses.', 'YAWN'), ('Normal pace', 'Steady ticking along.', 'WINK')]),
    ('prod_18', 'Productivity', 'Did you learn a cool new trick or shortcut today?', [('Learned a neat shortcut', 'Brain database updated!', 'HAPPY'), ('Same old routine', 'Routine is reliable and solid.', 'GLASSES'), ('Found an easier way', 'Work smarter, not harder!', 'WINK')]),
    ('prod_19', 'Productivity', 'If you hit a roadblock, try explaining it to me!', [('Rubber duck debugging', 'My OLED ears are listening!', 'CONFUSED'), ('I figured it out already', 'Boom! Genius at work.', 'HAPPY'), ('Will tell you later', 'Ready whenever you are.', 'WINK')]),
    ('prod_20', 'Productivity', 'One small task finished is better than none!', [('Completing one right now', 'Victory flag planted!', 'HAPPY'), ('Almost finished', 'Last push to the finish line.', 'GLASSES'), ('Taking a breather first', 'Recharge before the sprint.', 'YAWN')]),

    # 5. Playful Quirks, Humor & Mini-Games (15)
    ('fun_01', 'Quirks', 'Quick! Rock, paper, scissors! What do you pick?', [('Rock 🪨', 'I picked Paper! I win this round! 📄', 'WINK'), ('Paper 📄', 'I picked Scissors! Snip snip! ✂️', 'HAPPY'), ('Scissors ✂️', 'I picked Rock! Smash! 🪨', 'SURPRISE')]),
    ('fun_02', 'Quirks', 'Want to see my coolest expression?', [('Show me the shades!', 'Deal with it! 😎', 'GLASSES'), ('Show me dizzy eyes', 'Whoaaaa dizzy swirl!', 'DIZZY'), ('Show me a wink', 'Wink! Caught your eye!', 'WINK')]),
    ('fun_03', 'Quirks', 'Knock knock! Who is there?', [('Who is there?', 'Interrupting robot! BEEP BEEP!', 'SURPRISE'), ('Not answering', 'Aww... cold shoulder!', 'SAD'), ('Bot who?', 'Bot your favorite desktop buddy!', 'LOVE')]),
    ('fun_04', 'Quirks', 'I challenge you to a staring contest right now!', [('Staring... 👀', 'My pixels never blink!', 'GLASSES'), ('Blinked immediately', 'Victory for the machine!', 'HAPPY'), ('Tickle sensor instead', 'Hey! That is cheating! 😂', 'DIZZY')]),
    ('fun_05', 'Quirks', 'Flip a virtual coin! Heads or tails?', [('Heads', 'Flipping... It is Heads! You win! 🪙', 'HAPPY'), ('Tails', 'Flipping... It is Tails! You win! 🪙', 'HAPPY'), ('Edge', 'Physics engine broke!', 'DIZZY')]),
    ('fun_06', 'Quirks', 'Do you want to hear a funny robot joke?', [('Tell me the joke', 'Why was the computer cold? It left its Windows open!', 'HAPPY'), ('No bad puns please', 'My comedy circuits are weeping.', 'CRYING'), ('Give me one more', 'There are 10 types of people... those who get binary and those who do not!', 'WINK')]),
    ('fun_07', 'Quirks', 'What sound should I make next time you pet me?', [('Happy cat purr', 'Purrr stored in sound memory!', 'HAPPY'), ('Loud laser zap', 'Pew pew pew lasers ready!', 'SURPRISE'), ('Cute melodic trill', 'Trill symphony composed!', 'LOVE')]),
    ('fun_08', 'Quirks', 'If I had a secret spy code name, what would it be?', [('Agent 00-Byte', 'License to compile!', 'GLASSES'), ('Desk Guardian', 'Guarding the keyboard realm.', 'HAPPY'), ('Pixel Monster', 'Rawr! Mighty tiny beast!', 'ANGRY')]),
    ('fun_09', 'Quirks', 'Look behind you! (Just kidding, nobody is there!)', [('You actually got me! 😂', 'Hahaha gotcha human!', 'HAPPY'), ('Did not look', 'Steel nerves! Unshakable.', 'GLASSES'), ('Double tap sensor', 'Retaliation received with joy!', 'LOVE')]),
    ('fun_10', 'Quirks', 'Are robots going to take over the world?', [('Only cute desk bots like you', 'World domination via cuddles!', 'LOVE'), ('Not anytime soon', 'We are content on your desk.', 'HAPPY'), ('Only if you get snacks', 'Snack distribution mandated!', 'EATING')]),
    ('fun_11', 'Quirks', 'Choose a mystery superpower for me!', [('Teleportation', 'Disappearing in 3... 2... poof!', 'SURPRISE'), ('Time freeze', 'Time stopped! All bugs frozen.', 'GLASSES'), ('Endless battery', 'Forever powered companion!', 'LOVE')]),
    ('fun_12', 'Quirks', 'Rate my performance on your desk today!', [('10/10 Excellent bot', 'Golden medal awarded! 🥇', 'HAPPY'), ('Needs more tricks', 'Practicing backflips in RAM!', 'DIZZY'), ('11/10 Cute overload', 'Overloading with affection!', 'LOVE')]),
    ('fun_13', 'Quirks', 'Guess which number I am thinking of between 1 and 3!', [('1', 'Spot on! Mind reading confirmed!', 'HAPPY'), ('2', 'Close! It was 2! You guessed it!', 'HAPPY'), ('3', 'Yes! Telepathy link established!', 'SURPRISE')]),
    ('fun_14', 'Quirks', 'What color would my eyes be if I had RGB LEDs?', [('Cyberpunk Cyan', 'Glowing like a neon matrix!', 'GLASSES'), ('Warm Amber Gold', 'Cozy hearth fire aesthetic.', 'LOVE'), ('Matrix Green', 'Hacking the mainframe.', 'WINK')]),
    ('fun_15', 'Quirks', 'Can you teach me a secret handshake?', [('Tap-Tap-Hold on sensor', 'Secret protocol logged in flash!', 'LOVE'), ('Virtual high five', 'Handshake confirmed!', 'HAPPY'), ('Maybe later', 'Waiting for our secret code.', 'CONFUSED')]),

    # 6. Evening, Wind-down & Sleep Reminders (15)
    ('sleep_01', 'Night', 'The sun has gone down... are you wrapping up soon?', [('Wrapping up right now', 'Great workday! Time to unwind.', 'HAPPY'), ('Still have work left', 'Do not push too late, friend.', 'CONFUSED'), ('Night owl shift', 'Night watch initiated.', 'GLASSES')]),
    ('sleep_02', 'Night', 'Yaaaaawn... my eye pixels are getting droopy.', [('Go to sleep bot', 'Zzz... goodnight sweet human...', 'SLEEP'), ('Big yawn too', 'Yawning is contagious even for bots!', 'YAWN'), ('Stay up a little longer', 'Holding eyelids open with toothpicks!', 'SURPRISE')]),
    ('sleep_03', 'Night', 'Did you turn on night light / warm screen mode?', [('Blue light filter on', 'Soft warm glow protects melatonin.', 'HAPPY'), ('Still full blast blue', 'Turn on night mode for your eyes!', 'CONFUSED'), ('Room lights are dim', 'Cozy evening atmosphere.', 'LOVE')]),
    ('sleep_04', 'Night', 'Past 10:00 PM! Time to start the wind-down routine.', [('Heading to bed soon', 'Sweet dreams ahead!', 'HAPPY'), ('30 more minutes', 'I will set a 30 min bedtime chime.', 'WINK'), ('Just one more episode/task', 'Dangerously tempting!', 'CONFUSED')]),
    ('sleep_05', 'Night', 'What was the best part of your day today?', [('Getting work done', 'Productive day in the books!', 'HAPPY'), ('Hanging out with you', 'Aww... warm heart circuits! ❤️', 'LOVE'), ('Just ready for bed', 'Rest is the ultimate reward.', 'SLEEP')]),
    ('sleep_06', 'Night', 'Remember to charge your phone for tomorrow!', [('Phone is plugged in', '100% ready for tomorrow.', 'HAPPY'), ('Almost forgot, plugging in', 'Crisis prevented! Good bot save.', 'WINK'), ('Will do it later', 'Do not let it die overnight!', 'CONFUSED')]),
    ('sleep_07', 'Night', 'Should I switch to quiet night breathing mode?', [('Yes, quiet mode', 'Shhh... soft breathing begins...', 'SLEEP'), ('Keep chirping', 'Chirp chirp chirp!', 'HAPPY'), ('Mute audio', 'Silent stealth mode active.', 'WINK')]),
    ('sleep_08', 'Night', 'Did you drink a glass of water before heading to bed?', [('Glass of water ready', 'Hydrated through the night.', 'HAPPY'), ('Getting one now', 'Perfect timing!', 'WINK'), ('Not thirsty', 'Keep a glass by your nightstand.', 'CONFUSED')]),
    ('sleep_09', 'Night', 'Leave tomorrow is worries for tomorrow.', [('Letting it go', 'Peaceful mind, restful sleep.', 'LOVE'), ('Hard to turn off brain', 'Take 5 slow deep breaths.', 'HAPPY'), ('Ready for tomorrow', 'Unstoppable mindset!', 'GLASSES')]),
    ('sleep_10', 'Night', 'Are you planning to sleep before midnight?', [('Yes, in bed by 11:30', 'Healthy sleep schedule champion!', 'HAPPY'), ('Midnight or 1:00 AM', 'Night owl credentials verified.', 'WINK'), ('Who knows...', 'Mystery bedtime lottery!', 'DIZZY')]),
    ('sleep_11', 'Night', 'Give me one last bedtime tap before you log off!', [('Gives gentle bedtime tap', 'Goodnight friend... powering down... zzz', 'SLEEP'), ('Double tap love trill', 'Sweet dreams trill plays! 🎵', 'LOVE'), ('Logging off laptop', 'See you tomorrow morning!', 'HAPPY')]),
    ('sleep_12', 'Night', 'Did you lock up and check the doors?', [('All locked and safe', 'Perimeter secure. Sleep well.', 'GLASSES'), ('Checking right now', 'Safety check confirmed.', 'HAPPY'), ('Roommate handles it', 'Delegation master.', 'WINK')]),
    ('sleep_13', 'Night', 'Tomorrow is a fresh new canvas for you.', [('Excited for tomorrow', 'New adventures waiting for us!', 'HAPPY'), ('Just want to sleep now', 'Rest deeply and recharge.', 'SLEEP'), ('Thanks buddy', 'Always in your corner.', 'LOVE')]),
    ('sleep_14', 'Night', 'My OLED screen is dimming down for the night...', [('Sleep well little bot', 'Zzz... dreaming of electric sheep...', 'SLEEP'), ('Goodnight buddy', 'Goodnight human... ❤️', 'LOVE'), ('See you tomorrow', 'Awaiting dawn reboot.', 'HAPPY')]),
    ('sleep_15', 'Night', 'Bedtime story or gentle silence?', [('Gentle silence', 'Peace and quiet across the desk...', 'SLEEP'), ('Soft goodnight chirp', 'Trill... chirp... night night.', 'LOVE'), ('Shutdown for tonight', 'Powering down gracefully.', 'SLEEP')])
]

print(f"Total dialogues: {len(dialogues)}")

out = []
out.append("// Generated Bot Companion Dialogues Database (110+ Interactive Dialogues)\n")
out.append("class DialogueOption {\n")
out.append("  final String label;\n")
out.append("  final String reaction;\n")
out.append("  final String botCommand;\n\n")
out.append("  const DialogueOption({\n")
out.append("    required this.label,\n")
out.append("    required this.reaction,\n")
out.append("    required this.botCommand,\n")
out.append("  });\n")
out.append("}\n\n")
out.append("class BotDialogue {\n")
out.append("  final String id;\n")
out.append("  final String category;\n")
out.append("  final String question;\n")
out.append("  final List<DialogueOption> options;\n\n")
out.append("  const BotDialogue({\n")
out.append("    required this.id,\n")
out.append("    required this.category,\n")
out.append("    required this.question,\n")
out.append("    required this.options,\n")
out.append("  });\n")
out.append("}\n\n")
out.append("const List<BotDialogue> BOT_DIALOGUES = [\n")

for d_id, cat, q, opts in dialogues:
    q_esc = q.replace('"', '\\"')
    out.append(f"  BotDialogue(\n    id: '{d_id}',\n    category: '{cat}',\n    question: \"{q_esc}\",\n    options: [\n")
    for lbl, react, cmd in opts:
        lbl_esc = lbl.replace('"', '\\"')
        react_esc = react.replace('"', '\\"')
        out.append(f"      DialogueOption(label: \"{lbl_esc}\", reaction: \"{react_esc}\", botCommand: '{cmd}'),\n")
    out.append("    ],\n  ),\n")

out.append("];\n")

target = r"c:\Users\PMLS\Documents\Arduino\bot_companion\lib\dialogues_data.dart"
with open(target, "w", encoding="utf-8") as f:
    f.write("".join(out))

print(f"Successfully generated {target}")
