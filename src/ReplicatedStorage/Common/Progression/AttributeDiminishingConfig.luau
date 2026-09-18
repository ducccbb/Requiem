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
--         File: ReplicatedStorage.Common.Progression.AttributeDiminishingConfig
--                              Dumped in 0.000157 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {Hyperbolic = "hyperbolic"}
return {
    MusketResistanceMultiplier = {model = "hyperbolic", cap = 0.7, k = 0.35},
    BladeResistanceMultiplier = {model = "hyperbolic", cap = 0.7, k = 0.15},
    FirearmReloadMultiplier = {model = "hyperbolic", cap = 0.75, k = 0.15},
    GearConsumptionDrainMultiplier = {model = "hyperbolic", cap = 0.25, inverted = true, k = 0.15},
}