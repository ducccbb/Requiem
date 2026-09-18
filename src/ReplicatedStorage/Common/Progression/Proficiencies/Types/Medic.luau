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
--         File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Medic
--                              Dumped in 0.000828 seconds
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
    Name = "Medic",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {"Bandage Removal I"},
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Bandage Removal I",
    Label = "I",
    Description = "You can now remove a single bandage from a person, every thirty minutes.",
    Unlocked = false,
    Unlocks = {"Bandage Removal II", "Postmortem I", "Field Bandaging I"},
    Position = Vector2.new(0.5, 0.8),
}
local v5 = {
    Name = "Bandage Removal II",
    Label = "II",
    Description = "You can now remove a total of three bandages across everyone, every fourty minutes.",
    Unlocked = false,
    Unlocks = {"Bandage Removal III", "Stablizer I", "Expanded Kit I", "Resurrection Gambit I"},
    Position = Vector2.new(0.5, 0.6),
}
local v6 = {
    Name = "Bandage Removal III",
    Label = "III",
    Description = "You can now remove a total of six bandages across everyone, every hour.",
    Unlocked = false,
    Unlocks = {"Grace of Ymir", "Refined Treatment I", "Careful Unwrapping I"},
    Blocks = {},
    Position = Vector2.new(0.5, 0.4),
}
local v7 = {
    Name = "Grace of Ymir",
    Label = "X",
    Description = "You can now attempt to return the fallen to life, through the power of Ymir, with guaranteed success. This act carries a two week cooldown.",
    Unlocked = false,
    Price = 6,
    RequiresEntireTree = true,
    Unlocks = {"Vital Sight", "Guiding Light"},
    Blocks = {},
    Position = Vector2.new(0.5, 0.2),
}
local v8 = {
    Name = "Postmortem I",
    Label = "I",
    Description = "You can check a ragdolled body for signs of life, determining whether it still lives.",
    Unlocked = false,
    Unlocks = {"Postmortem II"},
    Position = Vector2.new(0.4, 0.75),
}
local v9 = {
    Name = "Postmortem II",
    Label = "II",
    Description = "You can examine a dead body and, through anatomical knowledge, determine the cause of death.",
    Unlocked = false,
    Unlocks = {"Postmortem III"},
    Position = Vector2.new(0.3, 0.7),
}
local v10 = {
    Name = "Postmortem III",
    Label = "III",
    Description = "Your understanding of the human body allows you to determine how long a body has been dead.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.65),
}
local v11 = {
    Name = "Field Bandaging I",
    Label = "I",
    Description = "Your handling of wounds improves, allowing you to fully restore your health when bandaging yourself.",
    Unlocked = false,
    Unlocks = {"Field Bandaging II"},
    Position = Vector2.new(0.6, 0.75),
}
local v12 = {
    Name = "Field Bandaging II",
    Label = "II",
    Description = "Your technique sharpens, increasing the effectiveness of your bandages by twenty percent.",
    Unlocked = false,
    Unlocks = {"Field Bandaging III"},
    Position = Vector2.new(0.7, 0.7),
}
local v13 = {
    Name = "Field Bandaging III",
    Label = "III",
    Description = "Your mastery of field treatment allows your bandages to perform fifty percent better.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.65),
}
local v14 = {
    Name = "Resurrection Gambit I",
    Label = "I",
    Description = "You may attempt to return the fallen to life, with a five percent chance of success. This act carries a three week cooldown.",
    Unlocked = false,
    Unlocks = {"Resurrection Gambit II"},
    Position = Vector2.new(0.4, 0.55),
}
local v15 = {
    Name = "Resurrection Gambit II",
    Label = "II",
    Description = "Your gamble grows steadier, granting a ten percent chance to resurrect the fallen. This act carries a two week cooldown.",
    Unlocked = false,
    Unlocks = {"Resurrection Gambit III"},
    Position = Vector2.new(0.3, 0.5),
}
local v16 = {
    Name = "Resurrection Gambit III",
    Label = "III",
    Description = "You defy death with precision, granting a twenty percent chance to resurrect the fallen. This act carries a one week cooldown.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.2, 0.45),
}
local v17 = {
    Name = "Expanded Kit I",
    Label = "I",
    Description = "You pack your kit tighter, allowing you to carry two additional bandages.",
    Unlocked = false,
    Unlocks = {"Expanded Kit II"},
    Position = Vector2.new(0.6, 0.55),
}
local v18 = {
    Name = "Expanded Kit II",
    Label = "II",
    Description = "Your loadout is better managed, allowing you to carry four additional bandages.",
    Unlocked = false,
    Unlocks = {"Expanded Kit III"},
    Position = Vector2.new(0.7, 0.5),
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
    Name = "Expanded Kit III",
    Label = "III",
    Description = "Your kit is fully optimized, allowing you to carry six additional bandages.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.8, 0.45),
}
v4 = {
    Name = "Refined Treatment I",
    Label = "I",
    Description = "Your hands grow more deliberate; when bandaging another, you have an additional twenty percent chance to remove their most severe injury.",
    Unlocked = false,
    Unlocks = {"Refined Treatment II"},
    Position = Vector2.new(0.4, 0.35),
}
v5 = {
    Name = "Refined Treatment II",
    Label = "II",
    Description = "Your precision deepens; when bandaging another, you have an additional thirty percent chance to remove their most severe injury.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.3),
}
v6 = {
    Name = "Careful Unwrapping I",
    Label = "I",
    Description = "You handle removal with care; when unwrapping a bandage, you have an additional twenty percent chance to restore some of the wound.",
    Unlocked = false,
    Unlocks = {"Careful Unwrapping II"},
    Position = Vector2.new(0.6, 0.35),
}
v7 = {
    Name = "Careful Unwrapping II",
    Label = "II",
    Description = "Your touch grows more precise; when unwrapping a bandage, you have an additional forty percent chance to restore some of the wound.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.3),
}
v8 = {
    Name = "Vital Sight",
    Label = "I",
    Description = "You can now see the vital signs of people around you, getting an estimate of their health.\nUsing this upon hovering over a person will show you exact information about their health.\n\nAdditionally, upon activating, for a duration of thirty seconds your bandages will be twenty percent faster.",
    Unlocked = false,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.6, 0.15),
}
v9 = {
    Name = "Guiding Light",
    Label = "I",
    Description = "Upon a final stand, such as Skullbound, ragdolling another person, you may now immediately get them up, and restore fifty percent of their missing health.",
    Unlocked = false,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.4, 0.15),
}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
v2[21] = v7
v2[22] = v8
v2[23] = v9
return v2