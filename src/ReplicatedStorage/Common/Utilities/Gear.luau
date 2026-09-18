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
--                     File: ReplicatedStorage.Common.Utilities.Gear
--                               Dumped in 0.00110 seconds
--                          Bytecode version 9  |  10 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Constants = require(v1.Parent.Parent:WaitForChild("Constants"))
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Gear"))
local String = require(v1.Parent:WaitForChild("String"))
local Table = require(v1.Parent:WaitForChild("Table"))
local Tinkers = require(v1.Parent:WaitForChild("Tinkers"))
local Types = v1.Parent.Parent:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local v3 = {
    BLADE_DURABILITY = "Blade Durability",
    VELOCITY_GAIN_SPEED = "Velocity Gain Speed",
    VELOCITY_GAIN_POWER = "Velocity Gain Power",
    BASE_TITAN_DAMAGE = "Base Titan Damage",
    GRAPPLE_DURABILITY = "Grapple Durability",
    GRAPPLE_RANGE = "Grapple Range",
    BASE_SPEED = "Base Speed",
    GAS_SPEED = "Gas Speed",
    ORBIT_SPEED = "Orbit Speed",
    ORBIT_CONTROL = "Orbit Control",
    SPEED_CONTROL = "Speed Control",
    GAS_CAPACITY = "Gas Capacity",
    GAS_EFFICIENCY = "Gas Efficiency",
}
local u70 = {}
local v4 = {}
local v5 = {Name = "Sharpness", Value = 0.5, Decreases = {}}
local v6 = {}
v6["Base Titan Damage"] = 0.5
v5.Increases = v6
v6 = {Name = "Durability", Value = 0.5, Decreases = {}}
local v7 = {}
v7["Blade Durability"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Blades = v4
v4 = {}
v5 = {Name = "Capacity", Value = 0.5, Decreases = {}}
v6 = {}
v6["Gas Capacity"] = 0.5
v5.Increases = v6
v6 = {Name = "Usage", Value = 0.5, Decreases = {}}
v7 = {}
v7["Gas Efficiency"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Canisters = v4
v4 = {}
v5 = {Name = "Length", Value = 0.5, Decreases = {}}
v6 = {}
v6["Grapple Range"] = 0.5
v5.Increases = v6
v6 = {Name = "Strength", Value = 0.5, Decreases = {}}
v7 = {}
v7["Velocity Gain Speed"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Grapples = v4
v4 = {}
v5 = {Name = "Strength", Value = 0.5, Decreases = {}}
v6 = {}
v6["Velocity Gain Speed"] = 0.5
v5.Increases = v6
v6 = {Name = "Durability", Value = 0.5, Decreases = {}}
v7 = {}
v7["Grapple Durability"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Spooling = v4
v4 = {}
v5 = {Name = "Stability", Value = 0.5, Decreases = {}}
v6 = {}
v6["Orbit Control"] = 0.5
v6["Speed Control"] = 0.5
v5.Increases = v6
v4[1] = v5
u70.Gyroscope = v4
v4 = {}
v5 = {Name = "Power", Value = 0.5, Decreases = {}}
v6 = {}
v6["Velocity Gain Speed"] = 0.5
v5.Increases = v6
v6 = {Name = "Speed", Value = 0.5, Decreases = {}}
v7 = {}
v7["Gas Speed"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Ejector = v4
v4 = {}
v5 = {Name = "Power", Value = 0.5, Decreases = {}}
v6 = {}
v6["Velocity Gain Power"] = 0.5
v5.Increases = v6
v6 = {Name = "Efficiency", Value = 0.5, Decreases = {}}
v7 = {}
v7["Gas Efficiency"] = 0.5
v6.Increases = v7
v4[1] = v5
v4[2] = v6
u70.Turbine = v4
local function getTinkersOfComponent(p1) -- Line: 250 -- upvalues: String (val), u70 (val)
    local v1 = u70[String.capitalizeAllFirstLetters(p1)]
    if not v1 then
        return {}
    end
    return v1
end
return {
    BASE_BLADE_INTEGRITY = 2,
    GEAR_REPAIR_COST = 5,
    getGearUpgradePrice = function(p1) -- Line: 378 -- upvalues: Constants (val)
        local v1 = (p1 * 1.175 + 1) * 25
        return (math.floor(v1 * (1 + Constants.Inflation.GearInflationRate) ^ p1))
    end,
    getTinkersOfComponent = getTinkersOfComponent,
    createTinkersForComponent = function(p1) -- Line: 238 -- upvalues: u70 (val), Table (val)
        local v1 = u70[p1]
        local v2 = v1
        if v2 then
            v2 = Table.map(v1, function(p1) -- Line: 242
                return {Name = p1.Name, Value = p1.Value}
            end)
        end
        return v2
    end,
    getPriceOfTinker = function(p1, p2) -- Line: 371 -- upvalues: Constants (val)
        local v1 = (math.abs(p1 - p2) * 8 + 1) * 90
        return (math.floor(v1 * (1 + Constants.Inflation.GearInflationRate)))
    end,
    createTinkerModifierMap = function(p1) -- Line: 310 -- upvalues: Tinkers (val), String (val), getTinkersOfComponent (val), Table (val)
        local v1, v2, v3, v4, v5
        if not Tinkers.TINKERING_ENABLED then
            return {}
        end
        local v6 = {}
        for k, v in pairs(p1) do
            v4 = String.capitalizeAllFirstLetters(k)
            v5 = getTinkersOfComponent(v4)
            for k2, i in pairs(v.tinkers) do
                v1 = v5[Table.find(v5, function(p1) -- Line: 322 -- upvalues: i (val)
                    local v1 = p1.Name == i.name
                    return v1
                end)]
                for k3, j in pairs(v1.Decreases) do
                    v2 = j - i.value
                    if v2 < 0 then
                        v2 = v2 * Tinkers.DRAWBACK_MULTIPLIER
                    end
                    if not (v6[k3]) then
                        v6[k3] = {value = 0, max = 0}
                    end
                    v3 = v6[k3]
                    v3.value = v3.value + (0.5 + v2)
                    v3 = v6[k3]
                    v3.max = v3.max + 1
                end
                for k4, k5 in pairs(v1.Increases) do
                    v2 = i.value - k5
                    if v2 < 0 then
                        v2 = v2 * Tinkers.DRAWBACK_MULTIPLIER
                    end
                    if not (v6[k4]) then
                        v6[k4] = {value = 0, max = 0}
                    end
                    v3 = v6[k4]
                    v3.value = v3.value + (0.5 + v2)
                    v3 = v6[k4]
                    v3.max = v3.max + 1
                end
            end
        end
        return v6
    end,
    getTinkerModifierMultiplier = function(p1, p2, p3, p4) -- Line: 260 -- upvalues: Tinkers (val)
        if not Tinkers.TINKERING_ENABLED then
            return 1
        end
        local v1 = p1.tinkers[p2]
        if not v1 then
            return 1
        end
        local v2 = math.clamp(v1.value / v1.max, 0, 1)
        local min = p3.min
        local max = p3.max
        local v3 = p3.inverse or false
        local increment = p3.increment
        if increment and p4 then
            local v4 = increment / Tinkers.getLevelBalanceDampener()
            local v5 = v4 * (p4 - 1)
            if not v3 then
                min = min + v5
                max = max + v5
            else
                min = min - v5
                max = max - v5
            end
        end
        if v3 then
            return max - (max - min) * v2
        end
        return min + (max - min) * v2
    end,
    getComponentLevel = function(p1, p2) -- Line: 306
        return p1.levels[string.upper(p2)] or 0
    end,
}