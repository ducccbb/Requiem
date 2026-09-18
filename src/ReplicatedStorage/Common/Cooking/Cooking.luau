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
--                    File: ReplicatedStorage.Common.Cooking.Cooking
--                              Dumped in 0.000185 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    Colors = {
        Tomato = Color3.fromRGB(196, 40, 28),
        Carrot = Color3.fromRGB(213, 115, 61),
        Potato = Color3.fromRGB(168, 130, 92),
        Onion = Color3.fromRGB(199, 172, 120),
        Meat = Color3.fromRGB(225, 138, 138),
    },
    Buffs = {
        Tomato = {Name = "Tomato", Attribute = "TitanDamageMultiplier", Amount = 0.1, Type = "add"},
        Carrot = {Name = "Carrot", Attribute = "BasePlayerRunMultiplier", Amount = 0.1, Type = "add"},
        Potato = {Name = "Potato", Attribute = "HealthResistanceMultiplier", Amount = 0.0167, Type = "add"},
        Onion = {Name = "Onion", Attribute = "GearSwiftnessMultiplier", Amount = 0.025, Type = "add"},
        Meat = {Name = "Meat", Attribute = "CriticalHitSuccessChance", Amount = 0.02, Type = "add"},
    },
}