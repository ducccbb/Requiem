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
--        File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Devotion
--                              Dumped in 0.000432 seconds
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
    Name = "Devotion",
    Label = "I",
    Description = "My loyalty to O'Ymir, is one in which I would never forsake, or allow to waver.",
    Unlocked = false,
    Unlocks = {"Devotion II"},
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Devotion II",
    Label = "II",
    Description = "The bonds between us are stronger than ever, and I will never break them.",
    Unlocked = false,
    Unlocks = {"Devotion III"},
    Position = Vector2.new(0.5, 0.8),
}
local v5 = {
    Name = "Devotion III",
    Label = "III",
    Description = "Each and every day, I am reminded of the love I share with O'Ymir, and the bond we have formed. \n\nGain five-percent more experience gain.",
    Unlocked = false,
    Unlocks = {"Devotion IV"},
    Position = Vector2.new(0.5, 0.6),
}
local v6 = {
    Name = "Devotion IV",
    Label = "IV",
    Description = "For O'Ymir, I would lay down my life. For Our Lady, I would lay down my soul. \n\nGain five-percent more experience gain.",
    Unlocked = false,
    Unlocks = {"Devotion V", "Fidelity I", "Fidelity II"},
    Position = Vector2.new(0.5, 0.4),
}
local v7 = {
    Name = "Devotion V",
    Label = "V",
    Description = "For My Lady, I am blind to all else, and my heart is only hers. \n\nGain an additional sacrament point. \nThe vows in which I hold, now are stronger than ever.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.5, 0.2),
}
local v8 = {
    Name = "Fidelity I",
    Label = "I",
    Description = "As I pledge my loyalty to O'Ymir, I am bound to her.\n\nYou are now three times as likely to roll an Epic enchantment.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 0.4),
}
local v9 = {
    Name = "Fidelity II",
    Label = "II",
    Description = "As I pledge my loyalty to O'Ymir, I am bound to her.\n\nYou are now three times as likely to roll a Rare enchantment.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.4),
}
v2[1] = v3
v2[2] = v4
v2[3] = v5
v2[4] = v6
v2[5] = v7
v2[6] = v8
v2[7] = v9
return v2