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
--        File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Sentinel
--                              Dumped in 0.000753 seconds
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
    Name = "Sentinel",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {"Momentum I", "Strive I", "Cascade I"},
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Momentum I",
    Label = "I",
    Description = "Upon killing a titan, you will now gain a velocity boost for a duration of five seconds",
    Unlocked = false,
    Unlocks = {"Momentum II"},
    Position = Vector2.new(0.5, 0.8),
}
local v5 = {
    Name = "Momentum II",
    Label = "II",
    Description = "Upon killing a titan, you will now gain a stronger velocity boost for a duration of ten seconds",
    Unlocked = false,
    Unlocks = {"Momentum III"},
    Position = Vector2.new(0.5, 0.6),
}
local v6 = {
    Name = "Momentum III",
    Label = "III",
    Description = "Upon killing a titan, you will now gain a stronger velocity boost for a duration of fifteen seconds",
    Unlocked = false,
    Unlocks = {"Momentum IV"},
    Position = Vector2.new(0.5, 0.4),
}
local v7 = {
    Name = "Momentum IV",
    Label = "IV",
    Description = "Your momentum buffs now stack, and will continue to do so up to three times, or until the buff expires",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Position = Vector2.new(0.5, 0.2),
}
local v8 = {
    Name = "Strive I",
    Label = "I",
    Description = "Upon killing a titan, you will now reduce your gas consumption by ten percent, for a duration of three seconds",
    Unlocked = false,
    Unlocks = {"Strive II"},
    Position = Vector2.new(0.4, 0.8),
}
local v9 = {
    Name = "Strive II",
    Label = "II",
    Description = "Upon killing a titan, you will now reduce your gas consumption by fifteen percent, for a duration of four seconds",
    Unlocked = false,
    Unlocks = {"Strive III", "Double Time"},
    Position = Vector2.new(0.4, 0.6),
}
local v10 = {
    Name = "Strive III",
    Label = "III",
    Description = "Upon killing a titan, you will now reduce your gas consumption by twenty percent, for a duration of five seconds",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.4, 0.4),
}
local v11 = {
    Name = "Cascade I",
    Label = "I",
    Description = "Upon dealing damage to a titan, for the next ten seconds, you will now deal an additional ten percent damage to titans.",
    Unlocked = false,
    Unlocks = {"Cascade II"},
    Position = Vector2.new(0.6, 0.8),
}
local v12 = {
    Name = "Cascade II",
    Label = "II",
    Description = "Upon dealing damage to a titan, for the next ten seconds, you will now deal an additional fifteen percent damage to titans.",
    Unlocked = false,
    Unlocks = {"Cascade III", "Quick Recover"},
    Position = Vector2.new(0.6, 0.6),
}
local v13 = {
    Name = "Cascade III",
    Label = "III",
    Description = "Upon dealing damage to a titan, for the next ten seconds, you will now deal an additional twenty percent damage to titans.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.4),
}
local v14 = {
    Name = "Quick Recover",
    Label = "I",
    Description = "When a titan hits you, and you become ragdolled, the duration of the ragdoll is now reduced by twenty percent.",
    Unlocked = false,
    Unlocks = {"Anchor", "Precise Slash", "Burst Stance"},
    Position = Vector2.new(0.7, 0.6),
}
local v15 = {
    Name = "Precise Slash",
    Label = "I",
    Description = "With precision to your slash, your blade durability now reduces twenty percent slower.",
    Unlocked = false,
    Unlocks = {"Sundered Limbs"},
    Position = Vector2.new(0.7, 0.4),
}
local v16 = {
    Name = "Anchor",
    Label = "I",
    Description = "Your grapples now have a reduced chance to be swatted, and the duration of the swat is now reduced by thirty percent.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.7, 0.8),
}
local v17 = {
    Name = "Sundered Limbs",
    Label = "I",
    Description = "You are now ten percent more likely to hit a critical hit on a titan, additionally all limb damage is now increased by seven percent.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.6, 0.2),
}
local v18 = {
    Name = "Burst Stance",
    Label = "X",
    Description = "Upon activating, you will now change your stance to the burst stance, all damage to titans will now be increased by thirty percent.\n\nRequires the entire tree to be unlocked.",
    Unlocked = false,
    RequiresEntireTree = true,
    Price = 5,
    Unlocks = {"Starbust Stream"},
    Position = Vector2.new(0.8, 0.6),
    Except = {"Starbust Stream", "Eradicate"},
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
    Name = "Starbust Stream",
    Label = "I",
    Description = "Enter a moment of fury, unleashing a wave of slashes upon all titans in which you near.",
    Unlocked = false,
    RequiresEntireTree = true,
    Price = 5,
    Unlocks = {"Eradicate"},
    Position = Vector2.new(0.8, 0.4),
    Except = {"Eradicate"},
}
v4 = {
    Name = "Double Time",
    Label = "I",
    Description = "Double hooking two grapples near eachother will now make you gain velocity ten percent faster, and an immediate velocity increase of five percent.",
    Unlocked = false,
    Unlocks = {"Pacifist", "Toggle Tank"},
    Position = Vector2.new(0.3, 0.6),
}
v5 = {
    Name = "Pacifist",
    Label = "I",
    Description = "While you grapple without your blades out, you will now gain velocity ten percent faster, and an overall maximum velocity increase of ten percent.",
    Unlocked = false,
    Unlocks = {},
    Position = Vector2.new(0.3, 0.8),
}
v6 = {
    Name = "Toggle Tank",
    Label = "I",
    Description = "You can now toggle your emergency gas, activating it whenever you wish, rather than when you run out.\n\nRequires the Emergency Gas Enchantment to be unlocked.",
    Unlocked = false,
    Enchantment = "Emergency Gas",
    Unlocks = {},
    Position = Vector2.new(0.3, 0.4),
}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
return v2