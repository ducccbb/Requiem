-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--[[
__________                   __               __    __________              .__
\______   \_______  ____    |__| ____   _____/  |_  \______   \ ____ _____  |  |
 |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\  |       _// __ \\__  \ |  |
 |    |     |  | \(  <_> )  |  \  ___/\  \___|  |    |    |   \  ___/ / __ \|  |__
 |____|     |__|   \____/\__|  |\___  >\___  >__|    |____|_  /\___  >____  /____/
                        \______|    \/     \/               \/     \/     \/
]]
--                           Project Real  |  Luau Decompiler
--                                   Made by @zinvera
--      File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Logistician
--                               Dumped in 0.00182 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
require(script.Parent.Parent:WaitForChild("Proficiencies"))
local v2 = {}
local v3 = {
    Name = "Logistician",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {
        "Conservationist I",
        "Leadership",
        "Medic",
        "Overtuned",
        "Deep Pockets I",
    },
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Leadership",
    Label = "I",
    Description = "Unlocks the Leadership path, specifically focusing in leading and commanding.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 1),
    Blocks = {"Medic"},
}
local v5 = {
    Name = "Medic",
    Label = "I",
    Description = "Unlocks the Medic path, specifically focusing in healing and bandaging.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 1),
    Blocks = {"Leadership"},
}
local v6 = {
    Name = "Feathered Burst",
    Label = "I",
    Description = "Upon dashing with your gear, using a shift-related moved, such as airshift, you will lose sixty five percent less gas.",
    Unlocked = false,
    Unlocks = {"Sprint Burst"},
    Position = Vector2.new(0.3, 0.6),
}
local v7 = {
    Name = "Sprint Burst",
    Label = "I",
    Description = "Unleash a burst of gas while sprinting, allowing you to run faster at the expense of gas. Will cancel upon you releasing your sprint key, or grappling.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.6),
}
local v8 = {
    Name = "Conservationist I",
    Label = "I",
    Description = "You're now ten percent more efficient with you gas, and can conserve it for longer.",
    Unlocked = false,
    Unlocks = {"Conservationist II"},
    Position = Vector2.new(0.4, 0.8),
}
local v9 = {
    Name = "Conservationist II",
    Label = "II",
    Description = "You're now fifteen percent more efficient with you gas, and can conserve it for longer.",
    Unlocked = false,
    Unlocks = {"Conservationist III", "Feathered Burst", "Emergency Eject", "Musician"},
    Position = Vector2.new(0.4, 0.6),
}
local v10 = {
    Name = "Conservationist III",
    Label = "III",
    Description = "You're now twenty percent more efficient with you gas, and can conserve it for longer.",
    Unlocked = false,
    Unlocks = {"Conservationist III", "Tempo Stance"},
    Position = Vector2.new(0.4, 0.4),
}
local v11 = {
    Name = "Deep Pockets I",
    Label = "I",
    Description = "You have deeper pockets, allowing you to carry an additional 15 weight units.",
    Unlocked = false,
    Unlocks = {"Deep Pockets II"},
    Position = Vector2.new(0.5, 0.8),
}
local v12 = {
    Name = "Deep Pockets II",
    Label = "II",
    Description = "You have deeper pockets, allowing you to carry an additional 15 weight units.",
    Unlocked = false,
    Unlocks = {"Deep Pockets III"},
    Position = Vector2.new(0.5, 0.6),
}
local v13 = {
    Name = "Deep Pockets III",
    Label = "III",
    Description = "You have deeper pockets, allowing you to carry an additional 20 weight units.",
    Unlocked = false,
    Unlocks = {"Tempo Stance"},
    Position = Vector2.new(0.5, 0.4),
}
local v14 = {
    Name = "Tempo Stance",
    Label = "X",
    Description = "Upon activating, you will now change your stance to the tempo stance, human damage will be increased by seven point five percent, and titan damage by fifteen percent.\n\nRequires the entire tree to be unlocked.",
    Unlocked = false,
    RequiresEntireTree = true,
    Price = 5,
    Unlocks = {"Blood is Fuel", "Overdrive"},
    Position = Vector2.new(0.5, 0.2),
    Except = {"Medic", "Leadership"},
}
local v15 = {
    Name = "Blood is Fuel",
    Label = "I",
    Description = "Upon killing a titan, or a human, you will gain eight percent of your total gas back. \n\nAdditionally you will reduce your gas consumption by ten percent, for a duration of ten seconds. This will stack per titan kill for the duration of the rolling window, for a maximum of five stacks.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.2),
}
local v16 = {
    Name = "Overdrive",
    Label = "I",
    Description = "A quick adjustment to your gear, allows you to overdrive your gear, and it's components, giving you a major velocity boost, for a duration of twenty seconds.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.2),
}
local v17 = {
    Name = "Overtuned",
    Label = "I",
    Description = "Upon refilling your gas to max, the first twenty percent of your gas usage will result in you moving twenty percent faster.\n\nAdditionally for the next ten seconds after refilling, you will gain velocity twenty percent faster.",
    Unlocked = false,
    Unlocks = {"Tether Control"},
    Position = Vector2.new(0.6, 0.8),
}
local v18 = {
    Name = "Tether Control",
    Label = "I",
    Description = "You understand how to use your gear better then ever, accessing the vertical aspect of your gear, allowing you to shift up and down while grappling.",
    Unlocked = false,
    Unlocks = {"Perfected Slash", "Supply Seeker", "Self Aware I", "Extended Spooling"},
    Position = Vector2.new(0.6, 0.6),
}
v2[1] = v3
v2[2] = v4
v2[3] = v5
v2[4] = v6
v2[5] = v7
v2[6] = v8
v2[7] = v9
v2[8] = v10
v2[9] = v11
v2[10] = v12
v2[11] = v13
v2[12] = v14
v2[13] = v15
v2[14] = v16
v2[15] = v17
v2[16] = v18
v3 = {
    Name = "Perfected Slash",
    Label = "I",
    Description = "You understand how to perfect your blades slash, resulting in reduced blade durability loss, allowing you to use the same pair of blades for longer.",
    Unlocked = false,
    Unlocks = {"Tempo Stance"},
    Position = Vector2.new(0.6, 0.4),
}
v4 = {
    Name = "Supply Seeker",
    Label = "I",
    Description = "Seek out supplies for yourself, allowing you to see a visualization of the amount of resources in nearby containers.",
    Unlocked = false,
    Unlocks = {"Footstep Seeker"},
    Position = Vector2.new(0.7, 0.4),
}
v5 = {
    Name = "Footstep Seeker",
    Label = "I",
    Description = "Your prowness to see imperfections in the ground grows, allowing you to see footprints of your allies and enemies.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.4),
}
v6 = {
    Name = "Extended Spooling",
    Label = "I",
    Description = "Your spooling in your gear has been extended, giving you an additional thirty percent grapple range.",
    Unlocked = false,
    Unlocks = {"Squirrel"},
    Position = Vector2.new(0.7, 0.6),
}
v7 = {
    Name = "Squirrel",
    Label = "I",
    Description = "You take thirty percent less gas boosting while skydiving, allowing you to stay in the air for longer, and go further.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.6),
}
v8 = {
    Name = "Self Aware I",
    Label = "I",
    Description = "Your honed senses make you more self aware to your well being, upon checking your health, you will see more detailed information about your health.",
    Unlocked = false,
    Unlocks = {"Self Aware II"},
    Position = Vector2.new(0.7, 0.8),
}
v9 = {
    Name = "Self Aware II",
    Label = "II",
    Description = "Your honed senses make you more self aware to your well being, upon checking your health, you will see your exact health amount.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.8),
}
v10 = {
    Name = "Emergency Eject",
    Label = "I",
    Description = "In a moment of emergency, when you have less then thirty percent of your health, you can now use your gear to eject yourself from the battle, allowing you to escape the danger.",
    Unlocked = false,
    Unlocks = {"Statistician"},
    Position = Vector2.new(0.3, 0.8),
}
v11 = {
    Name = "Statistician",
    Label = "I",
    Description = "Upon checking your gas, you will now see the exact percentage of your gas, instead of a vague message.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.8),
}
v12 = {
    Name = "Musician",
    Label = "I",
    Description = "The sounds of your melody will grow, and motivate your prowess, upon checking your gas increase your conservation, and gain a velocity boost.\n\nUpon activating, it will go on a five minute cooldown.",
    Unlocked = false,
    Unlocks = {"Conductor"},
    Position = Vector2.new(0.3, 0.4),
}
v13 = {
    Name = "Conductor",
    Label = "I",
    Description = "Those all around you too will be motivated by your melody, gaining a velocity boost, and increased gas conservation.\n\nUpon activating, it will go on a five minute cooldown.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.4),
}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
v2[21] = v7
v2[22] = v8
v2[23] = v9
v2[24] = v10
v2[25] = v11
v2[26] = v12
v2[27] = v13
return v2