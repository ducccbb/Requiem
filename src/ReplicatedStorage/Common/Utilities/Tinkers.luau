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
--                   File: ReplicatedStorage.Common.Utilities.Tinkers
--                              Dumped in 0.000360 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
u12["Blade Durability"] = {
    component = "Blades",
    min = 0.5,
    max = 1.5,
    inverse = false,
    increment = 0.15,
    description = "How resistant your blades are to breaking.",
    implemented = false,
}
u12["Velocity Gain Speed"] = {
    component = "Ejector",
    min = 0.85,
    max = 1.15,
    inverse = true,
    increment = 0.01,
    description = "How fast your velocity will build up.",
    implemented = true,
}
u12["Velocity Gain Power"] = {
    component = "Ejector",
    min = 0.9,
    max = 1.1,
    inverse = false,
    increment = 0.02,
    description = "The maximum amount of velocity you can gain.",
    implemented = true,
}
u12["Base Titan Damage"] = {
    component = "Blades",
    min = 0.5,
    max = 1.5,
    inverse = false,
    increment = 0.05,
    description = "The amount of damage you deal to titans.",
    implemented = false,
}
u12["Grapple Durability"] = {
    component = "Spooling",
    min = 0.5,
    max = 1.5,
    inverse = false,
    increment = 0.03,
    description = "How resistant your grapples are to smashing.",
    implemented = false,
}
u12["Grapple Range"] = {
    component = "Grapples",
    min = 0.5,
    max = 1.5,
    inverse = false,
    description = "How far your grapples can reach.",
    implemented = true,
}
u12["Base Speed"] = {
    component = "Ejector",
    min = 0.95,
    max = 1.05,
    inverse = false,
    increment = 0.0075,
    description = "Your base gear speed, without using gas.",
    implemented = true,
}
u12["Gas Speed"] = {
    component = "Ejector",
    min = 0.95,
    max = 1.05,
    inverse = false,
    increment = 0.0075,
    description = "How much faster you can move when using gas.",
    implemented = true,
}
u12["Orbit Speed"] = {
    component = "Ejector",
    min = 0.85,
    max = 1.15,
    inverse = false,
    increment = 0.03,
    description = "How fast you can orbit around grapple points",
    implemented = true,
}
u12["Orbit Control"] = {
    component = "Ejector",
    min = 0.8,
    max = 1.2,
    inverse = false,
    increment = 0.03,
    description = "How smooth your orbit control is.",
    implemented = true,
}
u12["Speed Control"] = {
    component = "Ejector",
    min = 0.9,
    max = 1.1,
    inverse = true,
    increment = 0.03,
    description = "How responsive your speed control is.",
    implemented = true,
}
u12["Gas Capacity"] = {
    component = "Canisters",
    min = 0.8,
    max = 1.2,
    inverse = true,
    increment = 0.03,
    description = "The rate in which your gas is consumed at a base level.",
    implemented = true,
}
u12["Gas Efficiency"] = {
    component = "Canisters",
    min = 0.5,
    max = 1.5,
    inverse = true,
    increment = 0.07,
    description = "Gas consumption while boosting (lower is more efficient)",
    implemented = false,
}
return {
    TINKERING_ENABLED = false,
    LEVEL_BALANCE_DAMPENER = 3,
    DRAWBACK_MULTIPLIER = 1.5,
    getModifierConfig = function(p1) -- Line: 158 -- upvalues: u12 (val)
        return u12[p1]
    end,
    getAllModifierConfigs = function() -- Line: 166 -- upvalues: u12 (val)
        return u12
    end,
    getLevelBalanceDampener = function() -- Line: 174
        return 3
    end,
    MODIFIER_CONFIGS = u12,
}