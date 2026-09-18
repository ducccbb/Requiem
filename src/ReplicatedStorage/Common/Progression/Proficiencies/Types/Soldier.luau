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
--        File: ReplicatedStorage.Common.Progression.Proficiencies.Types.Soldier
--                               Dumped in 0.00128 seconds
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
    Name = "Soldier",
    Label = "I",
    Description = "The beginning of a new path, and the start of your journey.",
    Unlocked = false,
    Unlocks = {"Sentinel", "Peacekeeper", "Honed Blade I", "Lingering Blade"},
    Position = Vector2.new(0.5, 1),
}
local v4 = {
    Name = "Sentinel",
    Label = "I",
    Description = "Unlocks the Sentinel path, specifically focusing in titan combat.",
    Unlocked = false,
    Unlocks = {},
    Blocks = {"Peacekeeper"},
    Position = Vector2.new(0.7, 1),
}
local v5 = {
    Name = "Peacekeeper",
    Label = "I",
    Description = "Unlocks the Peacekeeper path, specifically focusing in human combat.",
    Unlocked = false,
    Unlocks = {},
    Blocks = {"Sentinel"},
    Position = Vector2.new(0.3, 1),
}
local v6 = {
    Name = "Honed Blade I",
    Label = "I",
    Description = "Your honed senses now allow you to hit critical chances two percent more often.",
    Unlocked = false,
    Unlocks = {"Honed Blade II"},
    Blocks = {},
    Position = Vector2.new(0.4, 0.8),
}
local v7 = {
    Name = "Honed Blade II",
    Label = "II",
    Description = "Your honed senses now allow you to hit critical chances three percent more often.",
    Unlocked = false,
    Unlocks = {"Honed Blade III"},
    Blocks = {},
    Position = Vector2.new(0.3, 0.8),
}
local v8 = {
    Name = "Honed Blade III",
    Label = "III",
    Description = "Your honed senses now allow you to hit critical chances five percent more often.",
    Unlocked = false,
    Price = 2,
    Unlocks = {"Honed Blade IV"},
    Blocks = {},
    Position = Vector2.new(0.2, 0.8),
}
local v9 = {
    Name = "Honed Blade IV",
    Label = "IV",
    Description = "With your honed senses, your blade strikes true. Your critical hits now do an additional ten percent more damage.",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.2, 1),
}
local v10 = {
    Name = "Lingering Blade",
    Label = "I",
    Description = "With absolute percision, your swing strikes true. Your blade hit window now lingers for an additional twenty percent.",
    Unlocked = false,
    Unlocks = {
        "Wavering Resilience I",
        "Sturdy Skin I",
        "Adrenaline I",
        "Blade Striker",
        "Quick Reflexes",
    },
    Blocks = {},
    Position = Vector2.new(0.5, 0.6),
}
local v11 = {
    Name = "Wavering Resilience I",
    Label = "I",
    Description = "Your resilience is wavering. Once every twenty minutes, upon taking damage, it will be reduced by twenty percent.",
    Unlocked = false,
    Unlocks = {"Wavering Resilience II", "Honed Blade II", "Melody"},
    Blocks = {},
    Position = Vector2.new(0.4, 0.6),
}
local v12 = {
    Name = "Wavering Resilience II",
    Label = "II",
    Description = "Your resilience is wavering. Once every ten minutes, upon taking damage, it will be reduced by twenty percent.",
    Unlocked = false,
    Unlocks = {"Wavering Resilience III"},
    Blocks = {},
    Position = Vector2.new(0.3, 0.6),
}
local v13 = {
    Name = "Wavering Resilience III",
    Label = "III",
    Description = "Your resilience is wavering. Every time you enter combat, upon taking the first hit, it will be reduced by twenty percent.\n\nThis effect can be reset by entering combat again.",
    Unlocked = false,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.2, 0.6),
}
local v14 = {
    Name = "Sturdy Skin I",
    Label = "I",
    Description = "Every time you enter combat, hits that deal over fifty damage will be reduced by twenty percent.\n\nStacks three times per combat entry, resets after exiting combat.",
    Unlocked = false,
    Unlocks = {"Sturdy Skin II"},
    Blocks = {},
    Position = Vector2.new(0.6, 0.8),
}
local v15 = {
    Name = "Sturdy Skin II",
    Label = "II",
    Description = "Every time you enter combat, hits that deal over fourty damage will be reduced by twenty five percent.\n\nStacks three times per combat entry, resets after exiting combat.",
    Unlocked = false,
    Unlocks = {"Sturdy Skin III"},
    Blocks = {},
    Position = Vector2.new(0.7, 0.8),
}
local v16 = {
    Name = "Sturdy Skin III",
    Label = "III",
    Description = "Every hit that you take over fifty damage, will be reduced by ten percent.",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.8, 0.8),
}
local v17 = {
    Name = "Adrenaline I",
    Label = "I",
    Description = "Upon taking damage amounting above thirty, your adrenaline will be triggered, resulting in five percent faster movement speed, for ten seconds.\n\nUpon completely wearing off, it will enter cooldown for fourty five seconds.",
    Unlocked = false,
    Unlocks = {"Adrenaline II"},
    Blocks = {},
    Position = Vector2.new(0.6, 0.6),
}
local v18 = {
    Name = "Adrenaline II",
    Label = "II",
    Description = "Upon taking damage amounting above twenty, your adrenaline will be triggered, resulting in ten percent faster movement speed, for twelve seconds. \n\nUpon completely wearing off, it will enter cooldown for thirty seconds.",
    Unlocked = false,
    Unlocks = {"Adrenaline III"},
    Blocks = {},
    Position = Vector2.new(0.7, 0.6),
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
    Name = "Adrenaline III",
    Label = "III",
    Description = "Upon taking damage amounting above ten, your adrenaline will be triggered, resulting in fifteen percent faster movement speed, for fifteen seconds.\n\nUpon completely wearing off, it will enter cooldown for fifteen seconds.",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.8, 0.6),
}
v4 = {
    Name = "Blade Striker",
    Label = "I",
    Description = "You can now charge your blade, resulting in gaining extra damage with each charge; alongside a velocity boost.",
    Unlocked = false,
    Unlocks = {"Blade Thrust", "Melody"},
    Blocks = {},
    Position = Vector2.new(0.4, 0.4),
}
v5 = {
    Name = "Quick Reflexes",
    Label = "I",
    Description = "Your quick reflexes allow you to dodge a single attack, should you be prepared...",
    Unlocked = false,
    Price = 2,
    Unlocks = {"Dashing Draw", "Scurry"},
    Blocks = {},
    Position = Vector2.new(0.6, 0.4),
}
v6 = {
    Name = "Scurry",
    Label = "I",
    Description = "Once every two hours, upon reaching ten health, adrenaline rushes over you.\n\nRestoring twenty of your health back, and increasing your movement speed by twenty percent for twenty seconds.",
    Unlocked = false,
    Price = 3,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.8, 0.4),
}
v7 = {
    Name = "Blade Thrust",
    Label = "I",
    Description = "Allows you to quickly thrust forward, doing a slashing attack, which gravitates towards the target.",
    Unlocked = false,
    Price = 2,
    Unlocks = {"Blade Thrust II"},
    Blocks = {},
    Position = Vector2.new(0.4, 0.2),
}
v8 = {
    Name = "Blade Thrust II",
    Label = "II",
    Description = "If you are actively grappled on to a human target, upon activating Blade Thrust, the target will be pulled towards you.\n\nIf you are grappled on a non-human target, such as a titan, you will gain a rapid velocity boost, as you pull yourself towards the target.",
    Unlocked = false,
    Price = 3,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.3, 0.2),
}
v9 = {
    Name = "Dashing Draw",
    Label = "I",
    Description = "Holding your handles key, while they are away, will now charge them, allowing you to do a quick slash forward.",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.6, 0.2),
}
v10 = {
    Name = "Melody",
    Label = "I",
    Description = "Upon checking your gas, once every five minutes, you will have increased gas conservation, alongside a velocity boost, lasting for thirty seconds.",
    Unlocked = false,
    Price = 2,
    Unlocks = {},
    Blocks = {},
    Position = Vector2.new(0.3, 0.4),
}
v2[17] = v3
v2[18] = v4
v2[19] = v5
v2[20] = v6
v2[21] = v7
v2[22] = v8
v2[23] = v9
v2[24] = v10
return v2