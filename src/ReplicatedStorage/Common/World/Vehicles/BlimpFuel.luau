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
--                File: ReplicatedStorage.Common.World.Vehicles.BlimpFuel
--                              Dumped in 0.000666 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function clampAmount(p1, p2) -- Line: 47
    return (math.clamp(p1, 0, p2))
end
local function createState(p1, p2) -- Line: 57 -- upvalues: clampAmount (val)
    local v1, v2
    if typeof(p2) ~= "number" then
        v1 = 100
    elseif 0 >= p2 then
        v1 = 100
    else
        v1 = p2
    end
    if typeof(p1) ~= "number" then
        v2 = v1
    else
        v2 = p1
    end
    return {amount = clampAmount(v2, v1), max = v1}
end
local function isEmpty(p1) -- Line: 85
    local v1 = p1.amount <= 0.001
    return v1
end
local function getConsumptionRate(p1) -- Line: 103
    if not p1.engineRunning then
        return 0
    end
    local v1 = math.abs(p1.forwardSpeed) * 0.004 + 0.15
    return v1 + math.abs(p1.verticalSpeed) * 0.008
end
local function writeToAttributes(p1, p2) -- Line: 211
    p1:SetAttribute("Fuel", p2.amount)
    p1:SetAttribute("FuelMax", p2.max)
end
return {
    FUEL_ATTRIBUTE = "Fuel",
    FUEL_MAX_ATTRIBUTE = "FuelMax",
    DEFAULT_MAX_FUEL = 100,
    EMPTY_THRESHOLD = 0.001,
    IDLE_CONSUMPTION_PER_SECOND = 0.15,
    FORWARD_CONSUMPTION_PER_SPEED = 0.004,
    VERTICAL_CONSUMPTION_PER_SPEED = 0.008,
    createState = createState,
    getPercent = function(p1) -- Line: 72
        if p1.max <= 0 then
            return 0
        end
        return p1.amount / p1.max
    end,
    isEmpty = isEmpty,
    canRunEngine = function(p1) -- Line: 94 -- upvalues: isEmpty (val)
        return not isEmpty(p1)
    end,
    getConsumptionRate = getConsumptionRate,
    step = function(p1, p2, p3) -- Line: 120 -- upvalues: isEmpty (val), getConsumptionRate (val), clampAmount (val)
        if p3 <= 0 or isEmpty(p1) or not p2.engineRunning then
            return {consumed = 0, emptied = false, state = p1}
        end
        local v1 = getConsumptionRate(p2) * p3
        local amount = p1.amount
        local v2 = clampAmount(amount - v1, p1.max)
        local v3 = if 0.001 < amount then v2 <= 0.001 else false
        return {
            state = {amount = v2, max = p1.max},
            consumed = v1,
            emptied = v3,
        }
    end,
    addFuel = function(p1, p2) -- Line: 150 -- upvalues: clampAmount (val)
        if p2 <= 0 then
            return p1
        end
        return {amount = clampAmount(p1.amount + p2, p1.max), max = p1.max}
    end,
    setFuel = function(p1, p2) -- Line: 167 -- upvalues: clampAmount (val)
        return {amount = clampAmount(p2, p1.max), max = p1.max}
    end,
    setMaxFuel = function(p1, p2) -- Line: 180 -- upvalues: clampAmount (val)
        local v1 = math.max(p2, 0)
        return {amount = clampAmount(p1.amount, v1), max = v1}
    end,
    readFromAttributes = function(p1) -- Line: 194 -- upvalues: createState (val)
        local v1
        local Attribute = p1:GetAttribute("Fuel")
        local Attribute_2 = p1:GetAttribute("FuelMax")
        if typeof(Attribute) ~= "number" then
            return nil
        end
        if typeof(Attribute_2) ~= "number" then
            v1 = 100
        else
            v1 = Attribute_2
        end
        return createState(Attribute, v1)
    end,
    writeToAttributes = writeToAttributes,
    initializeAttributes = function(p1, p2, p3) -- Line: 223 -- upvalues: createState (val), writeToAttributes (val)
        local v1 = createState(p2, p3)
        writeToAttributes(p1, v1)
        return v1
    end,
}