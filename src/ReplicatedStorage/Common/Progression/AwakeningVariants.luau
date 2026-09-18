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
--             File: ReplicatedStorage.Common.Progression.AwakeningVariants
--                              Dumped in 0.000259 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    MightyMouse = {
        id = "MightyMouse",
        duration = 90,
        cutsceneLeadTime = 12.5,
        flowColor = Color3.fromRGB(23, 111, 212),
        modifiers = {
            {attribute = "GearSwiftnessMultiplier", operation = "add", amount = 0.3},
            {attribute = "TitanDamageMultiplier", operation = "add", amount = 0.15},
            {attribute = "GearConsumptionDrainMultiplier", operation = "subtract", amount = 0.2},
        },
    },
    GeneticOutlier = {
        id = "GeneticOutlier",
        duration = 90,
        cutsceneLeadTime = 12.5,
        flowColor = Color3.fromRGB(255, 47, 32),
        modifiers = {
            {attribute = "HealthResistanceMultiplier", operation = "add", amount = 0.25},
            {attribute = "BladeDamageMultiplier", operation = "add", amount = 0.2},
            {attribute = "CombatDamageMultiplier", operation = "add", amount = 0.2},
            {attribute = "ProjectileDamageMultiplier", operation = "add", amount = 0.2},
        },
    },
    Ackerman = {
        id = "Ackerman",
        duration = 6000,
        cutsceneLeadTime = 1,
        flowColor = Color3.fromRGB(0, 0, 0),
        modifiers = {},
    },
}