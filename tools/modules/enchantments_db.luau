--!nocheck
-- =========================================================================
-- 🔮 REQUIEM ENCHANTMENTS DATABASE MODULE (308 ENCHANTMENTS)
-- Tác giả: Luna Interface Suite x Antigravity
-- =========================================================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FULL_ENCHANTMENT_LIST = {
    ["Mythic"] = {
        { name = "Anamnesis", rarity = "Mythic", desc = "Their deaths became my burden, and saving the living became my curse. I must learn more to unlock my true potential...", passive = false },
        { name = "Bane of Ymir", rarity = "Mythic", desc = "For the next 10 seconds, your damage will be increased by 50%. In exchange, for 15 seconds all damage taken is increased.", passive = false },
        { name = "Deaths Dance", rarity = "Mythic", desc = "Isn't this a league item?", passive = true },
        { name = "Echostrike", rarity = "Mythic", desc = "Your blade beckons. There is a 20% chance that your next attack will strike again.", passive = true },
        { name = "Eradicate", rarity = "Mythic", desc = "Eradicate a titan's arm.", passive = true },
        { name = "Eyes of Ymir", rarity = "Mythic", desc = "Ymir has blessed my sight with powers far beyond our understanding.", passive = false },
        { name = "Garrisons Resolve", rarity = "Mythic", desc = "Your resolve being the commander of the Stationary Guard allows you to give your team a boost.", passive = false },
        { name = "Helldiver", rarity = "Mythic", desc = "Purge the stain of this failure, with the peroxide of victory...", passive = true },
        { name = "Mark of the Hidden Blade", rarity = "Mythic", desc = "When you deal damage to a player, they will bleed for 8 seconds. Each stack of bleed deals 30% of the damage dealt.", passive = true },
        { name = "Protagonist Syndrome", rarity = "Mythic", desc = "You are the first amongst many of this new generation...", passive = true },
        { name = "The Law", rarity = "Mythic", desc = "The will of the law is upon you. Bring those to justice.", passive = false },
        { name = "Warden of Ymir", rarity = "Mythic", desc = "To hold a soul in chains, one must be willing to grasp the iron with their own hands.", passive = false },
        { name = "Wings of Freedom", rarity = "Mythic", desc = "Your courage being the commander of the Scouting Legion allows you to give your team a boost.", passive = false },
    },
    ["Unique"] = {
        { name = "2026", rarity = "Unique", desc = "Let's make the year of 2026, the year for Requiem. Emote coming soon!", passive = true },
        { name = "Artisan", rarity = "Unique", desc = "Gives a 5% bonus to overall experience.", passive = true },
        { name = "Blade of Miquella", rarity = "Unique", desc = "A sacred dance of impossible speed and unwavering grace.", passive = false },
        { name = "Burst Dash", rarity = "Unique", desc = "Burst in the direction you are looking at max gear velocity, at the cost of expending a sizeable amount of gas.", passive = false },
        { name = "Calculator", rarity = "Unique", desc = "Every point of damage you deal is tallied on your screen. The counter resets five seconds after your last hit.", passive = true },
        { name = "Call of Whispers", rarity = "Unique", desc = "???", passive = true },
        { name = "Chemical Addiction", rarity = "Unique", desc = "You can't get enough of the stuff.", passive = true },
        { name = "Dap Me Up", rarity = "Unique", desc = "Greet your bro with sum style.", passive = true },
        { name = "Desensitized", rarity = "Unique", desc = "The horrors of war no longer shake you. Where fear once clawed at your chest, there is only silence.", passive = true },
        { name = "Encroaching Melody", rarity = "Unique", desc = "You are close to achieving the melody. 10% gas conservation.", passive = true },
        { name = "Eternal Remembrance", rarity = "Unique", desc = "Beloved by all, an eternal memory even in death.", passive = true },
        { name = "Founder", rarity = "Unique", desc = "You are an original founder of the game, thank you for your support..", passive = true },
        { name = "Genetic Outlier", rarity = "Unique", desc = "For Ymir has blessed you with not only great strength, but a durable mind and body.", passive = true },
        { name = "Giant", rarity = "Unique", desc = "Increases the player's maximum health by 20 and increases the player's size.", passive = true },
        { name = "Girly Pop", rarity = "Unique", desc = "How did you get this? You are not a girl.", passive = true },
        { name = "Holiday Cheer", rarity = "Unique", desc = "Celebrate the holidays with a cheer and a snowflake.", passive = false },
        { name = "Howling Abyss", rarity = "Unique", desc = "???", passive = true },
        { name = "Mighty Mouse", rarity = "Unique", desc = "Ymir blessed you with speed and grit, and unmatched agility.", passive = true },
        { name = "Prodigy", rarity = "Unique", desc = "???", passive = true },
        { name = "Whistle", rarity = "Unique", desc = "A sharp whistle cuts through the air.", passive = false },
    },
    ["Legendary"] = {
        { name = "Adamant", rarity = "Legendary", desc = "Your unwavering determination in the face of adversity grants you the resilience to continue your legacy. Damage reduction below thirty percent health.", passive = true },
        { name = "Antagonist", rarity = "Legendary", desc = "Your Bully shove hits everyone in front of you instead of only the nearest person.", passive = true },
        { name = "Banner of Ymir", rarity = "Legendary", desc = "", passive = false },
        { name = "Bereavement", rarity = "Legendary", desc = "When a bloodline member dies, gain a buff after their death, once per PD.", passive = true },
        { name = "Bloodthirsty", rarity = "Legendary", desc = "You are satiated by titan blood, you now gain hunger and health from killing titans.", passive = true },
        { name = "Cheapskate", rarity = "Legendary", desc = "You refuse to waste a single puff - your low gas conservation now extends another ten percent further.", passive = true },
        { name = "Chef", rarity = "Legendary", desc = "You produce twice as many bowls of soup when cooking.", passive = true },
        { name = "Dead Man Walking", rarity = "Legendary", desc = "When your health is below thirty percent, deal more damage.", passive = true },
        { name = "Deep Gash", rarity = "Legendary", desc = "Your strikes seek vital vessels — critical hit chance increased by 5%.", passive = true },
        { name = "Gather Round!", rarity = "Legendary", desc = "When your area buffs reach more than five allies at once, those buffs are thirty percent stronger and last thirty percent longer.", passive = true },
        { name = "Glutton", rarity = "Legendary", desc = "You can now consume two bowls of soup.", passive = true },
        { name = "Heartseeker", rarity = "Legendary", desc = "As you close your eyes, you see the heart beats of individuals nearby.", passive = false },
        { name = "Hijack", rarity = "Legendary", desc = "Yanking now forcibly removes somebody from their horse.", passive = true },
        { name = "Hit like a Truck", rarity = "Legendary", desc = "When someone is reloading a firearm and you damage them in PD, you have a chance to de-equip it.", passive = true },
        { name = "I Help You, You Help Me", rarity = "Legendary", desc = "When you buff another player with an area effect, you receive the same buff yourself.", passive = true },
        { name = "It Was Never Luck", rarity = "Legendary", desc = "When using Quick Reflexes, successfully dodging an attack shortens its cooldown. Failing to dodge anything lengthens it.", passive = true },
        { name = "Lead by Example", rarity = "Legendary", desc = "If you kill a titan or human around others, they will get a random buff that you can provide.", passive = true },
        { name = "Light Reflex", rarity = "Legendary", desc = "In the first 0.2 seconds of Upshift and Airshift you receive Iframes. If you get attacked while iframes, green pulse plays on success.", passive = true },
        { name = "Man of Steel", rarity = "Legendary", desc = "Your body refuses to break - injuries are 20% less likely to affect you.", passive = true },
        { name = "Manhunt", rarity = "Legendary", desc = "If a player kills one of your squad members, they become marked until they get out of range, or kill you or another one of your squad members.", passive = true },
        { name = "Natural Leader", rarity = "Legendary", desc = "Through the rooted confidence that you have grown to know, you are able to rally your allies more effectively.", passive = true },
        { name = "Nightstalker", rarity = "Legendary", desc = "Your nocturnal presence dominates your life as you perform better at night.", passive = true },
        { name = "No Wasting", rarity = "Legendary", desc = "When your gas runs critically low, you stretch every last drop - twenty five percent less gas drain while below ten percent gas.", passive = true },
        { name = "Perfectionist", rarity = "Legendary", desc = "Flaws in this world bug you, as such, any imperfections about you cause you to under-perform. Gain a damage boost against titans when at full health.", passive = true },
        { name = "Quick Draw", rarity = "Legendary", desc = "You now are able to quickly draw your flintlock in order to quickly deal with threats.", passive = true },
        { name = "Running on fumes", rarity = "Legendary", desc = "Your gas reserves are refilled after refilling.", passive = true },
        { name = "Rupture", rarity = "Legendary", desc = "Your attacks ignore 5% of enemy armor resistance.", passive = true },
        { name = "Serpents Fang", rarity = "Legendary", desc = "Sap the healing capabilities away from your enemy - when you hit an enemy with your blades, apply an anti heal.", passive = true },
        { name = "Skullbound", rarity = "Legendary", desc = "When above fifty percent health, and shot by a musket in the head, you will survive the shot.", passive = true },
        { name = "Ymir's Grace", rarity = "Legendary", desc = "Ymir's favor lingers upon you - all healing you give, to yourself and others, is ten percent stronger.", passive = true },
    },
    ["Epic"] = {
        { name = "Abnormal Circumstances", rarity = "Epic", desc = "Unusual threats sharpen your edge — abnormals, shifters, and rare titan variants take fifteen percent more damage from your blades.", passive = true },
        { name = "Bomb-voyage", rarity = "Epic", desc = "You've mastered the blast - explosion damage you take is reduced by 15%.", passive = true },
        { name = "Boxer", rarity = "Epic", desc = "You can use your fists to make a mark on your opponents.", passive = false },
        { name = "Bully", rarity = "Epic", desc = "Shove the nearest person near you. The harder you push depends on your strength compared to theirs.", passive = false },
        { name = "Contract Killer", rarity = "Epic", desc = "When activated, you can see the trajectory of where your musket shot will land when aiming for ten seconds.", passive = false },
        { name = "Deduction", rarity = "Epic", desc = "Your deduction skills allow you to see all enchantments in the pack, before you open it.", passive = true },
        { name = "Equestrian", rarity = "Epic", desc = "Your horse regenerates stamina faster.", passive = true },
        { name = "Feather", rarity = "Epic", desc = "You move like a feather, gain a 7% increase on your velocity cap.", passive = true },
        { name = "Field Assessment", rarity = "Epic", desc = "Your no longer slowed when checking your injuries.", passive = true },
        { name = "Field Commander", rarity = "Epic", desc = "Leadership buffs you grant last twenty percent longer on you.", passive = true },
        { name = "Finesse", rarity = "Epic", desc = "Your unparalleled agility and mastery of evasive maneuvers have allowed you to outmaneuver the grasp of a titan unscathed.", passive = false },
        { name = "Frontbreaker", rarity = "Epic", desc = "You can now tackle a player from the front, however you will also be ragdolled.", passive = true },
        { name = "Gentle Giant", rarity = "Epic", desc = "Your size belies your resilience — take twenty-five percent less damage while grabbed by a titan.", passive = true },
        { name = "Getaway", rarity = "Epic", desc = "You can get up from a ragdoll, saving you from a potentially dangerous situation. (One time use per event). Staff-applied ragdolls cannot be escaped.", passive = false },
        { name = "Help me!", rarity = "Epic", desc = "Your cries draw sharper blades — while grabbed by a titan, it takes fifteen percent more damage.", passive = true },
        { name = "Hit Stick", rarity = "Epic", desc = "Your tackle knocks opponents down for an additional two seconds.", passive = true },
        { name = "Hitman", rarity = "Epic", desc = "After shooting a musket, you can now put it away after one second, instead of two.", passive = true },
        { name = "I Can't Die Like This", rarity = "Epic", desc = "Gain flow when your skullbound is used. If you kill your attacker, you no longer get ragdolled and your skullbound cooldown is refreshed.", passive = true },
        { name = "I need a minute", rarity = "Epic", desc = "After Skullbound saves you from a headshot, you gain three seconds of invulnerability.", passive = true },
        { name = "Indomitable", rarity = "Epic", desc = "With a will to win, you are able to take in more damage. Overall, your health is increased.", passive = true },
        { name = "Jammer", rarity = "Epic", desc = "When you attack other players, they will be silenced for a short time.", passive = true },
        { name = "Loving Boost", rarity = "Epic", desc = "Bandaging an ally grants them a brief surge of velocity gain.", passive = true },
        { name = "Make It Count", rarity = "Epic", desc = "When your blades are under fifty percent durability, your damage output is increased against titans.", passive = true },
        { name = "Marker - Purple", rarity = "Epic", desc = "Shoot a purple flare to grant comrades within 500 studs faster velocity gain and gas conservation.", passive = true },
        { name = "Marker - Yellow", rarity = "Epic", desc = "Shoot a yellow flare to grant comrades within 500 studs reduced horse stamina drain and increased horse max speed.", passive = true },
        { name = "Master Grappler", rarity = "Epic", desc = "You can now feel when you have been grappled onto and the person grappled onto you will flash red.", passive = true },
        { name = "On The Go", rarity = "Epic", desc = "You have become accustomed to wearing a gaspack, be able to refill half of your gas off your own gaspack.", passive = false },
        { name = "Overcharged", rarity = "Epic", desc = "You are able to exert your gear past the known boundaries.", passive = false },
        { name = "Precise Swing", rarity = "Epic", desc = "You have a chance to not lose blade durability when slashing someone.", passive = true },
        { name = "Reflexiveness", rarity = "Epic", desc = "After taking more than seventy-five percent of your health in five seconds, instinctively enter your flow state.", passive = true },
        { name = "Reserve Tank", rarity = "Epic", desc = "Your gaspack now stores an additonal 10 percent.", passive = true },
        { name = "Returning Opportunity", rarity = "Epic", desc = "Missing a parry then being slashed right after will remove your parry cooldown, giving you another chance to parry.", passive = true },
        { name = "Savior Complex", rarity = "Epic", desc = "Every time you save someone in your squad from a titan, gain a 2.5% stat buff, stacking up to four times.", passive = true },
        { name = "Scholar", rarity = "Epic", desc = "You can now see a rough estimation of how much experience you need to reach the next level.", passive = false },
        { name = "Sharpshooter", rarity = "Epic", desc = "With a dedication to firearms, you now deal 25% more damage per shot.", passive = true },
        { name = "Short Lived", rarity = "Epic", desc = "Gain a 15% damage reduction on clash for a short period of time.", passive = true },
        { name = "Slow and Steady", rarity = "Epic", desc = "Bandaging someone is slower, however the healing is increased.", passive = true },
        { name = "Steel Body", rarity = "Epic", desc = "Your body is made of steel, gain a 2.5% blade resistance.", passive = true },
        { name = "Taste for Blood", rarity = "Epic", desc = "While Sadomasochism is active, killing an individual refreshes Masochistic's cooldown.", passive = true },
        { name = "Timed Reaction", rarity = "Epic", desc = "The perfect block timing turns a precise shot into a life saving miracle.", passive = true },
        { name = "Trial and Error", rarity = "Epic", desc = "After grasping the amount of time while refilling your gas, you have no trouble pinpointing exactly when to stop.", passive = true },
        { name = "Vigilant", rarity = "Epic", desc = "Focus no longer darkens your screen.", passive = true },
    },
    ["Rare"] = {
        { name = "Amphibian", rarity = "Rare", desc = "You gain a minor increase in numerous stats while it is raining.", passive = true },
        { name = "Artery Visionary", rarity = "Rare", desc = "You've honed your ability to slice arteries with your blades, increasing your base critical hit chance by 2%.", passive = true },
        { name = "Avenge", rarity = "Rare", desc = "When someone in your branch dies near you, gain a small buff.", passive = true },
        { name = "Aviator", rarity = "Rare", desc = "You can now see your velocity.", passive = true },
        { name = "Blade Dancer", rarity = "Rare", desc = "Your acute perception of the melodies of the battlefield allows you to mimic the rhythm of war, dealing extra damage to titans.", passive = true },
        { name = "Brute", rarity = "Rare", desc = "You rely on your strength to push forward. You can now learn tackling and boxing.", passive = true },
        { name = "Calm Waters", rarity = "Rare", desc = "The waters seem to still around you, calming even the wariest fish so they move slower and less erratically.", passive = true },
        { name = "Chain Dash", rarity = "Rare", desc = "With swift precision, you are able to dash twice with your gear.", passive = true },
        { name = "Claim the Saddle", rarity = "Rare", desc = "If someone is riding your horse, you can now kick them off if your horse is within range.", passive = true },
        { name = "Clockwork", rarity = "Rare", desc = "Through your innate efficiency and precision with the passion for crafting, you're motivated to complete your projects with haste.", passive = true },
        { name = "Coinflip", rarity = "Rare", desc = "Flip a coin, and test your luck.", passive = false },
        { name = "Come at Me", rarity = "Rare", desc = "With a scream of confidence, you taunt the titans.", passive = false },
        { name = "Control", rarity = "Rare", desc = "Toggle your discipline protections on or off.", passive = false },
        { name = "Convict", rarity = "Rare", desc = "You are able to break out of your handcuffs with a skill check.", passive = true },
        { name = "Dare Devil", rarity = "Rare", desc = "Launch yourself into the air for a velocity gain boost.", passive = false },
        { name = "Demolitionist", rarity = "Rare", desc = "You can now see how big the explosion of your cannon will be.", passive = true },
        { name = "Distress Signal", rarity = "Rare", desc = "When your gas reaches 0%, you fire a purple flare. Toggle on or off with a hotkey.", passive = false },
        { name = "Downward Surge", rarity = "Rare", desc = "Gain a slight velocity increase when hooking downwards. ", passive = true },
        { name = "Drunken Brawler", rarity = "Rare", desc = "Your unorthodox fighting style blends unpredictable maneuvers with raw strength. Your overall non-gear based melee damage is increased.", passive = true },
        { name = "Egocentric", rarity = "Rare", desc = "When you proc flow while other players are within one hundred studs, gain additional time in flow.", passive = true },
        { name = "Emergency Gas", rarity = "Rare", desc = "When you run out of gas, gain fifteen percent of gas back as a final emergency.", passive = true },
        { name = "Emergency Locator", rarity = "Rare", desc = "When another player fires a purple flare, highlight the location of the flare.", passive = true },
        { name = "Escape Artist", rarity = "Rare", desc = "Using Finesse to escape a titan's grip will now boost you into the air and set you at your max velocity.", passive = true },
        { name = "Expert Rider", rarity = "Rare", desc = "You can now dismount your horse via grappling with ODMG.", passive = true },
        { name = "Extended Flares", rarity = "Rare", desc = "Your marker flare buffs last ten seconds longer.", passive = true },
        { name = "Extended Rally", rarity = "Rare", desc = "Squad buffs you grant reach one hundred studs further.", passive = true },
        { name = "Fast Deployment", rarity = "Rare", desc = "Your refill speed is now slightly faster.", passive = true },
        { name = "Frenzy", rarity = "Rare", desc = "Killing titans brings you into a frenzy. For each kill, deal extra damage to titans.", passive = true },
        { name = "Friend or Foe", rarity = "Rare", desc = "Hooking onto someone tells you if you recognize them.", passive = true },
        { name = "Fury", rarity = "Rare", desc = "With rage induced in your body, you deal more damage to titan limbs.", passive = true },
        { name = "Habitual Cooking", rarity = "Rare", desc = "You have a 10% chance to make an extra bowl of soup.", passive = true },
        { name = "Heavy Hitter", rarity = "Rare", desc = "Your cannon impacts with more force.", passive = true },
        { name = "Heavyweight", rarity = "Rare", desc = "The bigger the titan, the more damage you deal towards it.", passive = true },
        { name = "In a Hurry", rarity = "Rare", desc = "Checking health no longer impedes any action. You can check health while running, and it completes much faster.", passive = true },
        { name = "Indomitable Will", rarity = "Rare", desc = "Each bandage applied on you gives you a 2.5% damage reduction buff, capping at 10%.", passive = true },
        { name = "Insight", rarity = "Rare", desc = "Your intuition allows you to see the rarity of the enchantments in the pack, before you open it.", passive = true },
        { name = "Jack of All Trades", rarity = "Rare", desc = "With strategic decision-making and resource management, you're able to use your knowledge to optimize your creations.", passive = true },
        { name = "Kobold", rarity = "Rare", desc = "When you succeed at Sly Hands' lockpick minigame, Goblin's cooldown is reduced by 90%.", passive = true },
        { name = "Mariner", rarity = "Rare", desc = "A life spent on the water has made you a swift swimmer, and gear weighs less on your lungs beneath the waves.", passive = true },
        { name = "Marker - Black", rarity = "Rare", desc = "Shoot a black flare to grant nearby allies 10% increased cannon speed and explosion range.", passive = true },
        { name = "Marker - Blue", rarity = "Rare", desc = "Shoot a blue flare to highlight yourself to branch medics within 100 studs for 30 seconds. Medics buffed this way heal 15% more with bandages and have an increased injury removal chance.", passive = true },
        { name = "Marker - Green", rarity = "Rare", desc = "Shoot a green flare to grant nearby allies +2 run speed. Allies on horseback regain 10% stamina.", passive = true },
        { name = "Masochistic", rarity = "Rare", desc = "Slice yourself, giving you a damage buff for a certain amount of time.", passive = false },
        { name = "Mobile Supply Hub", rarity = "Rare", desc = "You will now be notified of how much gas is left in your gaspack.", passive = true },
        { name = "Mutual Guard", rarity = "Rare", desc = "Allied players deal reduced damage to you.", passive = true },
        { name = "Obnoxious", rarity = "Rare", desc = "Cooldowns for your MARKER flares are now 4 minutes instead of 5 minutes.", passive = true },
        { name = "Omnipotent", rarity = "Rare", desc = "You are accustomed to your gear and are able to understand your gas level better.", passive = true },
        { name = "Opportunist", rarity = "Rare", desc = "They're on their last legs, finish them quickly. Deal ten percent increased damage to a Titan that is currently injured, blinded, or missing any limbs.", passive = true },
        { name = "Pacemaker", rarity = "Rare", desc = "You now check your gas even faster.", passive = true },
        { name = "Professional Meals", rarity = "Rare", desc = "Your own soup buffs are 10% stronger.", passive = true },
        { name = "Propulsion Expert", rarity = "Rare", desc = "Your consume less gas while boosting.", passive = true },
        { name = "Quartermaster", rarity = "Rare", desc = "You deal more damage with sabres", passive = true },
        { name = "Quick Escape", rarity = "Rare", desc = "When saved from a titan's grasp, you become immune to titan grabs for a 2 seconds.", passive = true },
        { name = "Range Calculation", rarity = "Rare", desc = "Your mouse now displays your grapple range directly under your cursor. It turns red when you're out of grapple range.", passive = true },
        { name = "Razor's Edge", rarity = "Rare", desc = "Hitting a titan consecutively in quick succession exponentially makes your next hits deal more damage, caps at 3 hits (Applies to abnormals and shifters.) (Requires Flow + Rend)", passive = true },
        { name = "Rend", rarity = "Rare", desc = "You will no longer be limited to only one hit per swing on titans.", passive = true },
        { name = "Salty Meat", rarity = "Rare", desc = "You don't seem to taste as well as others, prolong the time it takes a titan to eat you when grabbed", passive = true },
        { name = "Sharpeye", rarity = "Rare", desc = "You can now visualize the path of your cannon.", passive = true },
        { name = "Slowpoke", rarity = "Rare", desc = "Self bandaging is much slower, however self bandaging heal is greatly increased.", passive = true },
        { name = "Sly Hands", rarity = "Rare", desc = "When using Goblin, you play a lockpick minigame whose difficulty depends on your Dexterity versus your target's.", passive = true },
        { name = "Squad Leader", rarity = "Rare", desc = "Buffs that you apply are five percent more effective to those in your squad.", passive = true },
        { name = "Stalwart", rarity = "Rare", desc = "It takes longer to cuff you.", passive = true },
        { name = "Teamwork makes the Dreamwork", rarity = "Rare", desc = "Anyone in your squad is highlighted for three seconds when they are hit.", passive = true },
        { name = "Thrill for the Kill", rarity = "Rare", desc = "After successfully proccing an individual's Skullbound, gain +4 run speed and 15% faster firearm reload for 30 seconds.", passive = true },
        { name = "Tracer Bullets", rarity = "Rare", desc = "After landing a shot on an enemy, they will be highlighted to you for 3 seconds.", passive = true },
        { name = "Triumphant Cry", rarity = "Rare", desc = "If someone in your squad kills an enemy while buffed by one of your buffs, buff the squad for 30 seconds.", passive = true },
        { name = "Unstoppable Force", rarity = "Rare", desc = "If you have your second hook on another surface, your yank is stronger and lowers opponents velocity by a bit after the yanking effect is over.", passive = true },
        { name = "Wide Open", rarity = "Rare", desc = "Deal five percent increased damage to enemies that missed a parry within two seconds.", passive = true },
        { name = "Wind Dancer", rarity = "Rare", desc = "Your blades flow with the wind, you swing faster.", passive = true },
    },
    ["Uncommon"] = {
        { name = "A Good Ear", rarity = "Uncommon", desc = "You can now recall your horse at any distance no matter if someone is on it.", passive = true },
        { name = "Adept Hunter", rarity = "Uncommon", desc = "When drawing your bow your Field of View will no longer change.", passive = true },
        { name = "Aerodynamics", rarity = "Uncommon", desc = "Be able to keep velocity for longer, but deal less damage to titans.", passive = true },
        { name = "Arsenal", rarity = "Uncommon", desc = "When checking your gas, you now see your blade durability.", passive = true },
        { name = "Aware", rarity = "Uncommon", desc = "You know your gas canister, display a message when you go beyond certain gas threshold.", passive = true },
        { name = "Beast Slayer", rarity = "Uncommon", desc = "Your blades cut deeper into beasts that roam the wild.", passive = true },
        { name = "Blood Runs Thick", rarity = "Uncommon", desc = "Heal your bloodline members faster and slightly more.", passive = true },
        { name = "Bond of the Steed", rarity = "Uncommon", desc = "When someone is riding your horse, highlight your horse if it's within range.", passive = true },
        { name = "Brace", rarity = "Uncommon", desc = "Pound your chest and steady your heart.", passive = false },
        { name = "Buoyant", rarity = "Uncommon", desc = "You waste even less air underwater and can stay submerged longer.", passive = true },
        { name = "Cannoneer", rarity = "Uncommon", desc = "You have a grasp of your cannons, allowing you to shoot them further.", passive = true },
        { name = "Caravan", rarity = "Uncommon", desc = "You can carry more items in your inventory.", passive = true },
        { name = "Clear Mind", rarity = "Uncommon", desc = "The visual effects from having a titan shake your hooks and slam you into the ground is heavily reduced.", passive = true },
        { name = "Colossus Slayer", rarity = "Uncommon", desc = "You have been able to excel in combat techniques against titans, and thus able to exploit the vulnerabilities of these colossal adversaries.", passive = true },
        { name = "Current Rider", rarity = "Uncommon", desc = "You move with the current and recover your breath quickly at the surface.", passive = true },
        { name = "Cycle", rarity = "Uncommon", desc = "When you break a set of blades, you will automatically take a new set out, if available.", passive = true },
        { name = "Dead Weight", rarity = "Uncommon", desc = "Play dead, and have your body fall to the ground.", passive = false },
        { name = "Deep Hooks", rarity = "Uncommon", desc = "You have a small chance to have your grapple not be hit by a titan.", passive = true },
        { name = "Dexterous", rarity = "Uncommon", desc = "You can now summon your horse with handles out.", passive = true },
        { name = "Discipline", rarity = "Uncommon", desc = "You deal reduced damage to allied players.", passive = true },
        { name = "Don't Even Flinch", rarity = "Uncommon", desc = "Your screen no longer darkens when parrying somebody.", passive = true },
        { name = "Double Time", rarity = "Uncommon", desc = "There's no time to waste with you! You excel at production and thus are able to produce more.", passive = true },
        { name = "Downshift", rarity = "Uncommon", desc = "You can now double tap 'shift' in the air to launch downwards.", passive = true },
        { name = "Earwig", rarity = "Uncommon", desc = "You can now hear others' whispers from a further distance.", passive = true },
        { name = "Effective Diaphragm", rarity = "Uncommon", desc = "You know how to effectively control your diaphragm, allowing you to yell further.", passive = true },
        { name = "Emergency Flare", rarity = "Uncommon", desc = "When grabbed by a titan, shoot a purple flare into the air.", passive = true },
        { name = "Engineer", rarity = "Uncommon", desc = "Through unparalled structure testing, you're able to fortify the structures you create more effectively.", passive = true },
        { name = "Ethereal Flow", rarity = "Uncommon", desc = "Your momentum loss is reduced.", passive = true },
        { name = "Explosive", rarity = "Uncommon", desc = "You have a grasp of your cannons, creating a bigger explosion.", passive = true },
        { name = "Ferverous", rarity = "Uncommon", desc = "Infused with an indomitable spirit, you're able to withstand partial damage that titans inflict.", passive = true },
        { name = "Field Optics", rarity = "Uncommon", desc = "You can now see slightly better in fog.", passive = true },
        { name = "Final Blow", rarity = "Uncommon", desc = "Deal more damage upon your blades breaking.", passive = true },
        { name = "Forsaker", rarity = "Uncommon", desc = "Upon forsaking an enchantment, you lose it, and gain 20% of the experience required to get a new one.", passive = true },
        { name = "Friends with Benefits", rarity = "Uncommon", desc = "When saving someone you know from a titan grab, have a short period of increased velocity gain and less gas consumption.", passive = true },
        { name = "Gas Technician", rarity = "Uncommon", desc = "You now refill gas 30% faster.", passive = true },
        { name = "Goblin", rarity = "Uncommon", desc = "You can now pickpocket others.", passive = false },
        { name = "Got Em", rarity = "Uncommon", desc = "A short line appears when you land a player grapple.", passive = true },
        { name = "Got Them", rarity = "Uncommon", desc = "Hitting a player with a firearm grants 35% faster reload speed for 3 seconds. Missing a player applies the same penalty.", passive = true },
        { name = "Got Ya", rarity = "Uncommon", desc = "Deal 10% more damage to titans that are grabbing a player.", passive = true },
        { name = "Grazing Wound", rarity = "Uncommon", desc = "You graze a target, dealing 20% more firearm damage to limbs.", passive = true },
        { name = "Gut of Steel", rarity = "Uncommon", desc = "Your stomach has no limits. You can eat raw onion and meat.", passive = true },
        { name = "Hook Momentum", rarity = "Uncommon", desc = "Your grapple range is increased based on your velocity.", passive = true },
        { name = "Ironskin", rarity = "Uncommon", desc = "Have a slight damage resistance against blades.", passive = true },
        { name = "Keeping Track", rarity = "Uncommon", desc = "Tells you how many blades you have left when checking your gas.", passive = true },
        { name = "Last Shout", rarity = "Uncommon", desc = "When grabbed, highlight the titan and play an audio cue.", passive = true },
        { name = "Lavish", rarity = "Uncommon", desc = "When holding a grapple key, it will continuously check for a valid grapple target.", passive = true },
        { name = "Marker", rarity = "Uncommon", desc = "Rally your comrades, by shooting a red flare nearby comrades will have a 10% titan damage boost.", passive = true },
        { name = "No Man Left Behind", rarity = "Uncommon", desc = "Carrying someone who is out of gas will increase your velocity and decrease your gas drain for 10 seconds.", passive = true },
        { name = "No Time To Waste", rarity = "Uncommon", desc = "When attempting to pick up a player, if they are out of gas, automatically pick them up.", passive = true },
        { name = "Pit Stop", rarity = "Uncommon", desc = "You can now check your gas while moving.", passive = true },
        { name = "Productive", rarity = "Uncommon", desc = "You're constantly productive and thus are able to produce more accurately.", passive = true },
        { name = "Quick Access", rarity = "Uncommon", desc = "You are now able to hold smaller items while handles are equipped.", passive = true },
        { name = "Quick Feet", rarity = "Uncommon", desc = "Move around slightly faster while aiming your gun.", passive = true },
        { name = "Quick Reel", rarity = "Uncommon", desc = "You reel with practiced speed, securing a hooked fish far faster than most anglers.", passive = true },
        { name = "Rabbit", rarity = "Uncommon", desc = "Bound lightly off the ground like a rabbit, jumping higher than before.", passive = true },
        { name = "Recycle", rarity = "Uncommon", desc = "Using a bandage removal recycles you another bandage, 2 minute cd.", passive = true },
        { name = "Resourceful Medic", rarity = "Uncommon", desc = "Bandaging someone who is \"currently decent\" will not take up a bandage, 5 minute CD.", passive = true },
        { name = "Rotten Meat", rarity = "Uncommon", desc = "You seem to have a foul smell, titans will now take their time while eating you.", passive = true },
        { name = "Run & Gun", rarity = "Uncommon", desc = "After shooting a player, gain a small run speed boost for three seconds.", passive = true },
        { name = "Rushed Refill", rarity = "Uncommon", desc = "You can refill your blades and gas faster.", passive = true },
        { name = "Sadomasochism", rarity = "Uncommon", desc = "Killing an individual grants minor stacking buffs, increased if killed when you are at critical HP (<10% hp). (Requires Masochistic)", passive = true },
        { name = "Satisfaction", rarity = "Uncommon", desc = "Your own meals fill you twice as much, nothing tastes better than home made food!", passive = true },
        { name = "Self Removal", rarity = "Uncommon", desc = "You can now use your removals on yourself.", passive = true },
        { name = "Sheep Mentality", rarity = "Uncommon", desc = "Buffs you receive from others are slightly stronger.", passive = true },
        { name = "Skilled Pilot", rarity = "Uncommon", desc = "No FOV/camera change when yanked, gas boosting, or going left and right by pressing A and D key.", passive = true },
        { name = "Slack Line", rarity = "Uncommon", desc = "You keep just enough tension in the line that a fighting fish slips away far more slowly.", passive = true },
        { name = "Squad Medic", rarity = "Uncommon", desc = "Bandage healing is 10% more effective for everyone in your squad.", passive = true },
        { name = "Stallion", rarity = "Uncommon", desc = "Increase the maximum speed at which your horse regains stamina.", passive = true },
        { name = "Sturdy", rarity = "Uncommon", desc = "You stand tall like a castle, and are able to take a substantial blow.", passive = true },
        { name = "Targeting", rarity = "Uncommon", desc = "During Focus, the highlighted color of the target varies on who you're targeting. Comrades will be highlighted green.", passive = true },
        { name = "Terminator", rarity = "Uncommon", desc = "Gain a slight velocity boost when hooked onto a titan from behind.", passive = true },
        { name = "Thin Lines", rarity = "Uncommon", desc = "Your grapple range is slightly increased.", passive = true },
        { name = "True Sight", rarity = "Uncommon", desc = "You can now see a rough estimate of where your arrows will land.", passive = true },
        { name = "Unbound", rarity = "Uncommon", desc = "Through the strength of Ymir, be able to leap from the ground rather than in the air.", passive = true },
        { name = "Wall Running", rarity = "Uncommon", desc = "When holding space while facing a flat surface, with gear, you will now wallrun.", passive = true },
        { name = "Warcry", rarity = "Uncommon", desc = "Jammer lasts 50% shorter.", passive = true },
        { name = "Windshot", rarity = "Uncommon", desc = "You can now jump while aiming a musket.", passive = true },
    },
    ["Common"] = {
        { name = "Angler", rarity = "Common", desc = "You've become a seasoned angler and are able to utilize your knowledge to help fish.", passive = true },
        { name = "Apprentice", rarity = "Common", desc = "Build 5% faster per level.", passive = true },
        { name = "Archer", rarity = "Common", desc = "You can reload you bow faster, and shoot arrows further.", passive = true },
        { name = "Baker", rarity = "Common", desc = "You have a 10% chance to make an extra loaf of bread.", passive = true },
        { name = "Bandit", rarity = "Common", desc = "You are handcuffed by individuals 5% slower per level.", passive = true },
        { name = "Blue Collar", rarity = "Common", desc = "After countless of work on the fields, you now swing your tools faster.", passive = true },
        { name = "Bottomless Pit", rarity = "Common", desc = "Your stomach is 35% bigger.", passive = true },
        { name = "Bowman", rarity = "Common", desc = "Your able to reload your bow faster.", passive = true },
        { name = "Charming", rarity = "Common", desc = "Your charisma reaches those around you; you find yourself able to easily influence others.", passive = false },
        { name = "Clear Barrel", rarity = "Common", desc = "Proper musket maintenance ensures a cleaner and clearer shot, reducing smoke and noise.", passive = true },
        { name = "Close Call", rarity = "Common", desc = "Your quick thinking and ability to manuever out of harms way, using airshift, leads you to gaining a small momentum boost.", passive = true },
        { name = "Cold Blooded", rarity = "Common", desc = "Your more resilient to the effects of anxiety.", passive = true },
        { name = "Conservative", rarity = "Common", desc = "You've understood the fundamentals of your gear and are able to conserve your gas more effectively", passive = true },
        { name = "Consumer", rarity = "Common", desc = "The food and water that you consume is more impactful to your stomach, but food must be cooked before consumption.", passive = true },
        { name = "Cop", rarity = "Common", desc = "You handcuff individuals 5% faster per level.", passive = true },
        { name = "Deep Breath", rarity = "Common", desc = "You've trained yourself to consume less air while underwater.", passive = true },
        { name = "Duelist", rarity = "Common", desc = "Deal more damage with sabres and more damage against players with OMDG.", passive = true },
        { name = "Dynamo", rarity = "Common", desc = "Infused with an inner warmth, you are able to resist the biting chill of cold conditions.", passive = true },
        { name = "Empathetic", rarity = "Common", desc = "You are able to heal others slightly faster.", passive = true },
        { name = "Field Technician", rarity = "Common", desc = "You've become accustomed on how to resupply yourself in the battlefield.", passive = true },
        { name = "Fit", rarity = "Common", desc = "Through training and hard work, you can now run faster.", passive = true },
        { name = "Flare Expert", rarity = "Common", desc = "You are no longer concussed when using flares.", passive = true },
        { name = "Full Inventory", rarity = "Common", desc = "When holding max bandages, your first bandage will heal 15% more.", passive = true },
        { name = "Gaping Wounds", rarity = "Common", desc = "Titans take longer to recover from your strikes.", passive = true },
        { name = "Get Off Me!", rarity = "Common", desc = "Slashing someone who is hooked on you deals 5% more damage.", passive = true },
        { name = "Handyman", rarity = "Common", desc = "You build 10% faster.", passive = true },
        { name = "Hunter", rarity = "Common", desc = "Your roots come from the land itself, killing animals grants you more experience.", passive = true },
        { name = "Huntsman", rarity = "Common", desc = "You can now shoot a bow and arrow with more power, allowing your arrows to fly further.", passive = true },
        { name = "Keep It Going", rarity = "Common", desc = "You no longer are slowed down when checking your gas.", passive = true },
        { name = "Kinfolk", rarity = "Common", desc = "You deal even more reduced damage to your bloodline members. (Requires Discipline)", passive = true },
        { name = "Lucky", rarity = "Common", desc = "You've realized that the boon of fortune is on your side.", passive = true },
        { name = "Lumberjack", rarity = "Common", desc = "You've become a seasoned woodfeller and are able to see weakpoints within the grain of wood.", passive = true },
        { name = "Mic Check", rarity = "Common", desc = "Your first gas check in a PD doesn't utilise your Musician charge, showing you your gas for free.", passive = true },
        { name = "Miner", rarity = "Common", desc = "You've become a seasoned miner and are able to see weakpoints within the rock.", passive = true },
        { name = "Muzzled", rarity = "Common", desc = "Your musket shots are quieter.", passive = true },
        { name = "Nimble", rarity = "Common", desc = "You've become accustomed to your gear and are able to utilize your gear speed more effectively, although consume more gas.", passive = true },
        { name = "One With Nature", rarity = "Common", desc = "You make small steps, slightly reducing the attraction of animals and titans.", passive = true },
        { name = "Peacekeeper", rarity = "Common", desc = "You keep the peace within the walls, and as such you deal 5% more human damage.", passive = true },
        { name = "Powder Discipline", rarity = "Common", desc = "You can reload your musket faster while standing still.", passive = true },
        { name = "Practitioner", rarity = "Common", desc = "You can now heal other players more efficiently.", passive = true },
        { name = "Preservation", rarity = "Common", desc = "Your preservation allows you to deal more damage to titans while at full health.", passive = true },
        { name = "Proficient", rarity = "Common", desc = "You can check your gas while moving faster.", passive = true },
        { name = "Quick Hands", rarity = "Common", desc = "You have a great understanding of firearms and are able to reload them with haste.", passive = true },
        { name = "Recognizable", rarity = "Common", desc = "Your flares are much more brighter and larger, and they last longer when shot.", passive = true },
        { name = "Rescuer", rarity = "Common", desc = "Deal 5% damage to titans limbs.", passive = true },
        { name = "Rider", rarity = "Common", desc = "Your horse loses less stamina while sprinting.", passive = true },
        { name = "Sentinel", rarity = "Common", desc = "You are a sentinel of the walls, and as such you deal 10% more damage to titans.", passive = true },
        { name = "Shot Supression", rarity = "Common", desc = "With careful handling, you reduce the noise of your firearm.", passive = true },
        { name = "Situational Awareness", rarity = "Common", desc = "Upon your gear breaking, you will shoot a purple flare.", passive = true },
        { name = "Snowforge", rarity = "Common", desc = "With a heart of ice, you are able to resist the hot environmental coniditions.", passive = true },
        { name = "Steady Hands", rarity = "Common", desc = "Your hands stay steady on the rod, widening the window to keep a hooked fish within reach.", passive = true },
        { name = "Strong Swimmer", rarity = "Common", desc = "Years wading rivers and coastlines have made you a faster swimmer.", passive = true },
        { name = "Successful Shot", rarity = "Common", desc = "Upon a successful shot, you will be able to briefly reload your musket faster.", passive = true },
        { name = "Tether Controller", rarity = "Common", desc = "You can now toggle your Tether Control Proficiency on and off.", passive = false },
        { name = "Undercut", rarity = "Common", desc = "You check your gas slightly faster.", passive = true },
        { name = "Unencumbered", rarity = "Common", desc = "You can run while swinging your sabre or combat knife.", passive = true },
        { name = "Weakspots", rarity = "Common", desc = "Deal 5% damage to titans eyes.", passive = true },
    },
}

-- Ánh xạ các bùa tiêu biểu vào 5 Nhóm Thực Chiến Cốt Lõi
local TACTICAL_CATEGORIES = {
    ["⚔️ Nhóm: Cơ động & ODMG"] = {
        "Wings of Freedom", "Deaths Dance", "Running on fumes", "Light Reflex", "Autograpple", 
        "Clear Mind", "No Superman Landing", "Feather", "Unbound", "Wall Running", "Quick Feet", 
        "Hook Momentum", "Slack Line", "Burst Dash", "Conservative", "Close Call", "Nimble"
    },
    ["🗡️ Nhóm: Sát thương Kiếm & Titan"] = {
        "Eradicate", "Bane of Ymir", "Deep Gash", "Hit like a Truck", "Adamant", "Bloodthirsty", 
        "Serpents Fang", "Echostrike", "Mark of the Hidden Blade", "Blade of Miquella", "Rupture", 
        "Abnormal Circumstances", "Perfectionist", "Duelist", "Sentinel", "Weakspots", "Gaping Wounds"
    },
    ["👁️ Nhóm: Thần Nhãn & ESP"] = {
        "Eyes of Ymir", "Heartseeker", "Insight", "Deduction", "Field Assessment", 
        "Contract Killer", "True Sight", "Marker", "Keeping Track", "Situational Awareness"
    },
    ["🎯 Nhóm: Xạ Thủ & Súng Đạn"] = {
        "Quick Draw", "Windshot", "Nightstalker", "Tracer Bullets", "Clear Barrel", 
        "Muzzled", "Powder Discipline", "Quick Hands", "Shot Supression", "Successful Shot", "Bowman", "Huntsman"
    },
    ["🛡️ Nhóm: Sinh Tồn & Hỗ Trợ"] = {
        "Warden of Ymir", "Banner of Ymir", "Ymir's Grace", "Dead Man Walking", "Gut of Steel", 
        "Gas Technician", "Helldiver", "Man of Steel", "Skullbound", "Bomb-voyage", "Finesse", 
        "Ironskin", "Rotten Meat", "Sturdy", "Fit", "Dynamo", "Cold Blooded", "Consumer"
    },
    ["🐎 Nhóm: Kỵ Binh & Chiến Mã (Horse)"] = {
        "Equestrian", "Stallion", "Rider", "A Good Ear", "Bond of the Steed", 
        "Claim the Saddle", "Dexterous", "Expert Rider", "Hijack"
    },
}

-- Bảng thuộc tính mặc định giả lập cho các bùa thực chiến quan trọng
local ENCHANT_PRESET_ATTRIBUTES = {
    ["Wings of Freedom"] = { GearCanDoubleJump = 1, GearCanDash = 1, GearCanDoubleDash = 1, GearCanWallrun = 1, GearMaximumVelocity = 999 },
    ["Deaths Dance"] = { GearConsumptionDrainMultiplier = 0, LowGasDrainMultiplier = 0 },
    ["Running on fumes"] = { LowGasDrainMultiplier = 0, HasGasEmergency = 1 },
    ["Light Reflex"] = { AutododgeChance = 1, AutododgeFlatAmount = 100 },
    ["Autograpple"] = { Autograpple = 1, CanCheckGasWhileMoving = 1 },
    ["Clear Mind"] = { GearGrappleShakeMultiplier = 0 },
    ["No Superman Landing"] = { NoSupermanLanding = 1 },
    ["Eradicate"] = { BladeDamageMultiplier = 2.0, TitanDamageMultiplier = 2.0, HasEradicate = 1 },
    ["Bane of Ymir"] = { CriticalHitTitanDamageMultiplier = 2.5, CriticalHitTitanSuccessChance = 1 },
    ["Deep Gash"] = { BladeDamageMultiplier = 1.5, BladeDamageResistancePenetration = 0.5 },
    ["Hit like a Truck"] = { BladeRange = 25, BladeDamageMultiplier = 1.8 },
    ["Adamant"] = { BladeIntegrityAddition = 100, BladeDurabilityPreserveChance = 1 },
    ["Bloodthirsty"] = { Bloodthirsty = 1, BladeSwingMultiplier = 2 },
    ["Serpents Fang"] = { ArmorPiercing = 1, BladeDamageResistancePenetration = 0.8 },
    ["Eyes of Ymir"] = { HasTargeting = 1 },
    ["Heartseeker"] = { HasVigilant = 1 },
    ["Insight"] = { CanSeeExperience = 1 },
    ["Field Assessment"] = { TitanVisualGrabIndicator = 1, HasFieldAssessment = 1 },
    ["Quick Draw"] = { FirearmUnequipSpeed = 0.01, HasQuickDrawFlintlock = 1 },
    ["Windshot"] = { FirearmProjectileSpeedMultiplier = 3.0 },
    ["Nightstalker"] = { FasterMusketWalkSpeed = 1, FirearmSprintAim = 1 },
    ["Warden of Ymir"] = { HealthResistanceMultiplier = 0.8, DamageReductionOnClash = 1 },
    ["Banner of Ymir"] = { SquadBuffApplyBonus = 1, SquadBuffRadiusBonus = 100 },
    ["Ymir's Grace"] = { HasGraceOfYmir = 1, Invulnerability = 1 },
    ["Dead Man Walking"] = { GrabIFrames = 1, HasTerminator = 1 },
    ["Gut of Steel"] = { CanConsumeFood = 1 },
    ["Gas Technician"] = { GasCheckNoDebuff = 1, CanGaspackRefill = 1 },
    ["Wall Running"] = { GearCanWallrun = 1 },
    ["Burst Dash"] = { GearCanDoubleDash = 1 },
    ["Feather"] = { GearMaximumVelocity = 350 },
    ["Unencumbered"] = { CanRunWhileSwingingSabre = 1 },
    ["Duelist"] = { BladeDamageMultiplier = 1.25 },
    ["Quartermaster"] = { BladeDamageMultiplier = 1.3 },
    ["Equestrian"] = { HorseStaminaRegenMultiplier = 5 },
    ["Stallion"] = { HorseStaminaRegenMaxSpeedBonus = 50 },
    ["Rider"] = { HorseStaminaDrainMultiplier = 0 },
    ["Dexterous"] = { HasDexterous = 1 },
    ["Expert Rider"] = { HasExpertRider = 1 },
    ["A Good Ear"] = { HasAGoodEar = 1 },
    ["Bond of the Steed"] = { HasBondOfTheSteed = 1 },
    ["Claim the Saddle"] = { HasClaimTheSaddle = 1 },
    ["Hijack"] = { HasHijack = 1 },
}

-- Dynamic Scanner: Tự động quét và bổ sung bùa từ ReplicatedStorage trong runtime
pcall(function()
    local enchFolder = ReplicatedStorage:FindFirstChild("Client")
    if enchFolder then
        enchFolder = enchFolder:FindFirstChild("Progression")
        if enchFolder then
            enchFolder = enchFolder:FindFirstChild("Enchantments")
            if enchFolder then
                enchFolder = enchFolder:FindFirstChild("Enchantments")
            end
        end
    end
    if enchFolder then
        for _, rFolder in ipairs(enchFolder:GetChildren()) do
            if rFolder:IsA("Folder") then
                local rName = rFolder.Name
                if not FULL_ENCHANTMENT_LIST[rName] then
                    FULL_ENCHANTMENT_LIST[rName] = {}
                end
                for _, mod in ipairs(rFolder:GetChildren()) do
                    if mod:IsA("ModuleScript") then
                        local found = false
                        for _, it in ipairs(FULL_ENCHANTMENT_LIST[rName]) do
                            if it.name == mod.Name then
                                found = true
                                break
                            end
                        end
                        if not found then
                            table.insert(FULL_ENCHANTMENT_LIST[rName], {
                                name = mod.Name,
                                rarity = rName,
                                desc = "Dynamic Scanned Enchantment",
                                passive = true
                            })
                        end
                    end
                end
            end
        end
    end
end)

local function extractEnchantName(str)
    if not str or typeof(str) ~= "string" then return "" end
    local name = string.match(str, "%]%s*(.*)")
    if name and #name > 0 then
        return name
    end
    return str
end

local function findEnchantItem(name)
    local clean = extractEnchantName(name)
    for rName, list in pairs(FULL_ENCHANTMENT_LIST) do
        for _, it in ipairs(list) do
            if string.lower(it.name) == string.lower(clean) or string.lower(it.name) == string.lower(name) then
                return it, rName
            end
        end
    end
    return nil, nil
end

local function getCategoryOptions(filterName)
    local list = {}
    
    if filterName == "📜 Tất Cả 308 Bùa (A-Z)" then
        local allItems = {}
        for rName, items in pairs(FULL_ENCHANTMENT_LIST) do
            for _, it in ipairs(items) do
                table.insert(allItems, it)
            end
        end
        table.sort(allItems, function(a, b) return a.name < b.name end)
        for _, it in ipairs(allItems) do
            table.insert(list, string.format("[%s] %s", it.rarity, it.name))
        end
    elseif string.find(filterName, "Nhóm:") then
        local names = TACTICAL_CATEGORIES[filterName]
        if names then
            for _, n in ipairs(names) do
                local it = findEnchantItem(n)
                if it then
                    table.insert(list, string.format("[%s] %s", it.rarity, it.name))
                else
                    table.insert(list, string.format("[Enchant] %s", n))
                end
            end
        end
    else
        -- Lọc theo Rarity (tách từ tên như "🔥 Mythic (13 bùa)" -> "Mythic")
        local cleanRarity = string.match(filterName, "([%a]+)%s*%(") or filterName
        for rName, items in pairs(FULL_ENCHANTMENT_LIST) do
            if string.lower(rName) == string.lower(cleanRarity) or string.find(string.lower(filterName), string.lower(rName), 1, true) then
                table.sort(items, function(a, b) return a.name < b.name end)
                for _, it in ipairs(items) do
                    table.insert(list, string.format("[%s] %s", it.rarity, it.name))
                end
                break
            end
        end
    end
    
    if #list == 0 then
        table.insert(list, "Không tìm thấy bùa chú")
    end
    return list
end

-- Hàm thông minh thi triển kỹ năng Eradicate (tự động dò tìm Titan & trượt chém cánh tay)

local EnchantmentsDB = {
    List = FULL_ENCHANTMENT_LIST,
    Effects = ENCHANT_PRESET_ATTRIBUTES,
    ExtractName = extractEnchantName,
    Find = findEnchantItem,
    GetCategoryOptions = getCategoryOptions,
}

return EnchantmentsDB
