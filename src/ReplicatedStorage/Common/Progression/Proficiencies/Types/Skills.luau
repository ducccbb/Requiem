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
--         File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Skills
--                              Dumped in 0.000587 seconds
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
    Name = "Skills",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {"Focus", "Yank", "Block", "Airshift"},
    Position = Vector2.new(0.5, 0.5),
}
local v4 = {
    Name = "Focus",
    Label = "I",
    Description = "Gain a moment of clarity, allowing you to grapple to focusable players and objects easier.",
    Unlocked = false,
    Unlocks = {"Focus II"},
    Position = Vector2.new(0.4, 0.3),
}
local v5 = {
    Name = "Focus II",
    Label = "II",
    Description = "Gain a moment of clarity, allowing you to grapple to focusable players and objects easier, lasting an additional three seconds.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.3),
}
local v6 = {
    Name = "Yank",
    Label = "I",
    Description = "You can now yank a player or object towards you, allowing you to pull them towards you easier.",
    Unlocked = false,
    Unlocks = {"Tackle"},
    Position = Vector2.new(0.6, 0.3),
}
local v7 = {
    Name = "Tackle",
    Label = "I",
    Description = "You can now tackle a player or object, resulting in them being ragdolled upon you hitting them.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.3),
}
local v8 = {
    Name = "Block",
    Label = "I",
    Description = "You can now block and parry incoming blade attacks, resulting in the attack being negated.",
    Unlocked = false,
    Unlocks = {"Counter"},
    Position = Vector2.new(0.4, 0.7),
}
local v9 = {
    Name = "Counter",
    Label = "I",
    Description = "With perfect timing, you can now counter incoming blade attacks, dealing damage back to the attacker.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.7),
}
local v10 = {
    Name = "Airshift",
    Label = "I",
    Description = "You can now dash in the air by double pressing a movement key with gear.",
    Unlocked = false,
    Unlocks = {"Upshift"},
    Position = Vector2.new(0.6, 0.7),
}
local v11 = {
    Name = "Upshift",
    Label = "I",
    Description = "You can now double jump in the air by double pressing space with gear.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.7),
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
return v2