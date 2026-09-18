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
--                    File: ReplicatedStorage.Common.Utilities.Buffs
--                               Dumped in 0.00106 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ServerScriptService = game:GetService("ServerScriptService")
local User = ServerScriptService:WaitForChild("User")
local Progression = User:WaitForChild("Progression")
local Attributes = Progression:WaitForChild("Attributes")
local UserAttributesHandler = require(Attributes:WaitForChild("UserAttributesHandler"))
local Nearby = require(v1.Parent:WaitForChild("Nearby"))
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local u58 = {}
local u59 = {
    "I",
    "II",
    "III",
    "IV",
    "V",
}
local function getSoupBuffSlotId(p1, p2) -- Line: 17 -- upvalues: u59 (val)
    if p2 <= 1 then
        return "Nourished"
    end
    local v1 = u59[p1]
    if not v1 then
        v1 = tostring(p1)
    end
    return (("Nourished %*"):format(v1))
end
local function isSoupBuffId(p1) -- Line: 25
    if p1 == "Nourished" then
        return true
    end
    local v1 = string.sub(p1, 1, 10) == "Nourished "
    return v1
end
local function getActiveSoupBuffCount(p1) -- Line: 33 -- upvalues: isSoupBuffId (val)
    local v1 = 0
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i in v2, v3, v4 do
        if isSoupBuffId(i) then
            v1 = v1 + 1
        end
    end
    return v1
end
local function getNextSoupBuffId(p1) -- Line: 45 -- upvalues: u58 (val), UserAttributesHandler (val), getSoupBuffSlotId (val)
    local v1
    local v2 = u58[p1]
    if not v2 then
        v2 = {}
    end
    local v3 = math.floor((UserAttributesHandler.getAttribute(p1, "MaxSoupsActive")))
    local v4 = v3
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = getSoupBuffSlotId(i, v3)
        if not (v2[v1]) then
            return v1
        end
    end
    return nil
end
local function normalizeBuffs(p1) -- Line: 63
    local v1 = {}
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        table.insert(v1, {attribute = j.attribute, operation = string.lower(j.operation), value = j.value})
    end
    return v1
end
local function removeBuffs(p1) -- Line: 79
    local v1, v2
    local v3 = {}
    local v4 = p1
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v2 = {attribute = j.attribute}
        if string.lower(j.operation) ~= "add" then
            v1 = "add"
        else
            v1 = "subtract"
        end
        v2.operation = v1
        v2.value = j.value
        table.insert(v3, v2)
    end
    return v3
end
local function addBuff(p1, p2, p3) -- Line: 95 -- upvalues: Vitality (val), UserAttributesHandler (val), Nearby (val), normalizeBuffs (val), removeBuffs (val)
    Vitality.Buff.send(p1, {id = p2.id, length = p2.length})
    print("Buffs BEFORE ADDITION: ")
    print(UserAttributesHandler.getAttribute(p1, "TitanDamageMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "BasePlayerRunMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "HealthResistanceMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "GearSwiftnessMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "CriticalHitSuccessChance"))
    Nearby.attributes(p1, normalizeBuffs(p3))
    print("Buffs AFTER ADDITION: ")
    print(UserAttributesHandler.getAttribute(p1, "TitanDamageMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "BasePlayerRunMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "HealthResistanceMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "GearSwiftnessMultiplier"))
    print(UserAttributesHandler.getAttribute(p1, "CriticalHitSuccessChance"))
    return function() -- Line: 118 -- upvalues: Nearby (upval), p1 (val), removeBuffs (upval), p3 (val), UserAttributesHandler (upval)
        Nearby.attributes(p1, removeBuffs(p3))
        print("Buffs AFTER REMOVAL: ")
        print(UserAttributesHandler.getAttribute(p1, "TitanDamageMultiplier"))
        print(UserAttributesHandler.getAttribute(p1, "BasePlayerRunMultiplier"))
        print(UserAttributesHandler.getAttribute(p1, "HealthResistanceMultiplier"))
        print(UserAttributesHandler.getAttribute(p1, "GearSwiftnessMultiplier"))
        print(UserAttributesHandler.getAttribute(p1, "CriticalHitSuccessChance"))
    end
end
return {
    attemptToBuff = function(p1, p2, p3) -- Line: 129 -- upvalues: u58 (val), isSoupBuffId (val), UserAttributesHandler (val), getActiveSoupBuffCount (val), addBuff (val)
        local id, u40
        local u5 = u58[p1]
        if not u5 then
            u5 = {}
        end
        if u5[p2.id] then
            return "You already have this buff active!"
        end
        if not (isSoupBuffId(p2.id)) then
            u5[p2.id] = {data = p2, expiresAt = os.clock() + p2.length}
            u58[p1] = u5
            u40 = addBuff(p1, p2, p3)
            task.delay(p2.length, function() -- Line: 156 -- upvalues: u40 (val), u5 (val), p2 (val), u58 (upval), p1 (val)
                u40()
                u5[p2.id] = nil
                u58[p1] = u5
            end)
            return "Success"
        end
        local v1 = UserAttributesHandler.getAttribute(p1, "MaxSoupsActive")
        if v1 <= getActiveSoupBuffCount(u5) then
            return "Max soup buffs active"
        end
        u5[p2.id] = {data = p2, expiresAt = os.clock() + p2.length}
        u58[p1] = u5
        u40 = addBuff(p1, p2, p3)
        task.delay(p2.length, function() -- Line: 156 -- upvalues: u40 (val), u5 (val), p2 (val), u58 (upval), p1 (val)
            u40()
            u5[p2.id] = nil
            u58[p1] = u5
        end)
        return "Success"
    end,
    canApplySoupBuff = function(p1) -- Line: 59 -- upvalues: getNextSoupBuffId (val)
        local v1 = getNextSoupBuffId(p1) ~= nil
        return v1
    end,
    getNextSoupBuffId = getNextSoupBuffId,
}