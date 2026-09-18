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
--       File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Leadership
--                              Dumped in 0.000656 seconds
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
    Name = "Leadership",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {
        "Experience Syphon I",
        "Foreman I",
        "Inspiring I",
        "Kingpin I",
        "Shot Caller I",
    },
    Position = Vector2.new(0.5, 0.9),
}
local v4 = {
    Name = "Experience Syphon I",
    Label = "I",
    Description = "Upon activating any Leadership ability, that buffs others around you, when they gain experience for the duration of the buff, you will gain five percentage of that experience.",
    Unlocked = false,
    Unlocks = {"Experience Syphon II"},
    Position = Vector2.new(0.5, 0.7),
}
local v5 = {
    Name = "Experience Syphon II",
    Label = "II",
    Description = "Upon activating any Leadership ability, that buffs others around you, when they gain experience for the duration of the buff, you will gain ten percentage of that experience.",
    Unlocked = false,
    Unlocks = {"Experience Syphon III"},
    Position = Vector2.new(0.5, 0.5),
}
local v6 = {
    Name = "Experience Syphon III",
    Label = "III",
    Description = "Upon activating any Leadership ability, that buffs others around you, when they gain experience for the duration of the buff, you will gain fifteen percentage of that experience.",
    Unlocked = false,
    Unlocks = {"Take Command"},
    Position = Vector2.new(0.5, 0.3),
}
local v7 = {
    Name = "Take Command",
    Label = "X",
    Description = "Invite nearby players to your squad.\n\nRequires a maxed skill tree.",
    Unlocked = false,
    RequiresEntireTree = true,
    Unlocks = {},
    Position = Vector2.new(0.5, 0.1),
}
local v8 = {
    Name = "Foreman I",
    Label = "I",
    Description = "With your superb ability to direct allies, you can increase their hammer and building speeds. All hammer strength is increased by ten percent, and building speed is increased by five percent.\n\nThis buff ranges over a radius of 100 studs.",
    Unlocked = false,
    Unlocks = {"Foreman II"},
    Position = Vector2.new(0.4, 0.7),
}
local v9 = {
    Name = "Foreman II",
    Label = "II",
    Description = "With your superb ability to direct allies, you can increase their hammer and building speeds. All hammer strength is increased by twenty percent, and building speed is increased by ten percent.\n\nThis buff ranges over a radius of 150 studs.",
    Unlocked = false,
    Unlocks = {"Foreman III"},
    Position = Vector2.new(0.4, 0.5),
}
local v10 = {
    Name = "Foreman III",
    Label = "III",
    Description = "With your superb ability to direct allies, you can increase their hammer and building speeds. All hammer strength is increased by thirty percent, and building speed is increased by fifteen percent.\n\nThis buff ranges over a radius of 200 studs.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 0.3),
}
local v11 = {
    Name = "Inspiring I",
    Label = "I",
    Description = "Through your exuding confidence and commanding prescence, you can reduce allies anxiety, and give small gas conversations. All allies anxiety resistance is increased by ten percent, and their gear consumption is decreased by five percent.\n\nThis buff ranges over a radius of 100 studs.",
    Unlocked = false,
    Unlocks = {"Inspiring II"},
    Position = Vector2.new(0.6, 0.7),
}
local v12 = {
    Name = "Inspiring II",
    Label = "II",
    Description = "Through your exuding confidence and commanding prescence, you can reduce allies anxiety, and give small gas conversations. All allies anxiety resistance is increased by twenty percent, and their gear consumption is decreased by ten percent.\n\nThis buff ranges over a radius of 150 studs.",
    Unlocked = false,
    Unlocks = {"Inspiring III"},
    Position = Vector2.new(0.6, 0.5),
}
local v13 = {
    Name = "Inspiring III",
    Label = "III",
    Description = "Through your exuding confidence and commanding prescence, you can reduce allies anxiety, and give small gas conversations. All allies anxiety resistance is increased by thirty percent, and their gear consumption is decreased by fifteen percent.\n\nThis buff ranges over a radius of 200 studs.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.3),
}
local v14 = {
    Name = "Kingpin I",
    Label = "I",
    Description = "Through your unwavering determination and authoritive prescence, you can provide allies titan damage multipliers. All allies titan damage multipliers are increased by ten percent.\n\nThis buff ranges over a radius of 50 studs.",
    Unlocked = false,
    Unlocks = {"Kingpin II"},
    Position = Vector2.new(0.6, 0.9),
}
local v15 = {
    Name = "Kingpin II",
    Label = "II",
    Description = "Through your unwavering determination and authoritive prescence, you can provide allies titan damage multipliers. All allies titan damage multipliers are increased by twenty percent.\n\nThis buff ranges over a radius of 75 studs.",
    Unlocked = false,
    Unlocks = {"Kingpin III"},
    Position = Vector2.new(0.7, 0.7),
}
local v16 = {
    Name = "Kingpin III",
    Label = "III",
    Description = "Through your unwavering determination and authoritive prescence, you can provide allies titan damage multipliers. All allies titan damage multipliers are increased by thirty percent.\n\nThis buff ranges over a radius of 100 studs.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.5),
}
local v17 = {
    Name = "Shot Caller I",
    Label = "I",
    Description = "You are able to rally to a cause, granting positive bonuses for your allies. Your allies move faster. Your allies now gain a three percent gear swiftness multiplier, and a ten percent faster velocity gain.\n\nThis buff ranges over a radius of 50 studs.",
    Unlocked = false,
    Unlocks = {"Shot Caller II"},
    Position = Vector2.new(0.4, 0.9),
}
local v18 = {
    Name = "Shot Caller II",
    Label = "II",
    Description = "You are able to rally to a cause, granting positive bonuses for your allies. Your allies move faster. Your allies now gain a six percent gear swiftness multiplier, and a fifteen percent faster velocity gain.\n\nThis buff ranges over a radius of 75 studs.",
    Unlocked = false,
    Unlocks = {"Shot Caller III"},
    Position = Vector2.new(0.3, 0.7),
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
v2[17] = {
    Name = "Shot Caller III",
    Label = "III",
    Description = "You are able to rally to a cause, granting positive bonuses for your allies. Your allies move faster. Your allies now gain a ten percent gear swiftness multiplier, and a twenty percent faster velocity gain.\n\nThis buff ranges over a radius of 100 studs.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.5),
}
return v2