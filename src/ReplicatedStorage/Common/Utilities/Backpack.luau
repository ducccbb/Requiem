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
--                   File: ReplicatedStorage.Common.Utilities.Backpack
--                               Dumped in 0.00140 seconds
--                          Bytecode version 9  |  26 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Backpack = require(script.Parent.Parent:WaitForChild("Constants")).Backpack
local HotbarSlots = Backpack.HotbarSlots
local function forEachProficiencyHotbar(p1, p2) -- Line: 31
    local hotbars
    local v1 = p2
    for k, v in pairs(p1) do
        if type(v.hotbar) ~= "number" then
            hotbars = v.hotbars
            if not hotbars then
                hotbars = {}
            end
            for k2, i in pairs(hotbars) do
                if type(i) == "number" then
                    v1(v, k2, i)
                end
            end
        elseif type(v.node) == "string" then
            v1(v, v.node, v.hotbar)
        end
    end
end
local function setProficiencyHotbar(p1, p2, p3) -- Line: 54
    if type(p1.hotbar) ~= "number" then
        local hotbars = p1.hotbars
        if not hotbars then
            hotbars = {}
        end
        p1.hotbars = hotbars
        p1.hotbars[p2] = p3
        local meta = p1.meta
        if meta then
            meta = p1.meta[p2]
        end
        if meta then
            meta.hotbar = p3
        end
        return
    elseif type(p1.node) == "string" then
        p1.hotbar = p3
        return
    end
end
local function isHotbarSlot(p1) -- Line: 76 -- upvalues: HotbarSlots (val)
    local v1 = if 1 <= p1 then p1 <= HotbarSlots else false
    return v1
end
local function isBackpackSlot(p1) -- Line: 85 -- upvalues: HotbarSlots (val)
    local v1 = HotbarSlots < p1
    return v1
end
local function isSlotOccupied(p1, p2, p3, p4) -- Line: 167 -- upvalues: forEachProficiencyHotbar (val)
    local u29
    for k, v in pairs(p2) do
        if v.hotbar == p1 then
            return true
        end
    end
    for k2, i in pairs(p3) do
        if i.hotbar == p1 then
            return true
        end
    end
    forEachProficiencyHotbar(p4, function(a1, p2, p3) -- Line: 186 -- upvalues: p1 (val), u29 (ref)
        if p3 == p1 then
            u29 = true
        end
    end)
    return false
end
local function getNextHotbarSlot(p1, p2, p3) -- Line: 202 -- upvalues: HotbarSlots (val), isSlotOccupied (val)
    local v1 = HotbarSlots
    local v2 = 1
    for i = 1, v1, v2 do
        if not (isSlotOccupied(i, p1, p2, p3)) then
            return i
        end
    end
    return nil
end
local function getHighestBackpackSlot(p1, p2, p3) -- Line: 223 -- upvalues: HotbarSlots (val), isBackpackSlot (val), forEachProficiencyHotbar (val)
    local u58 = HotbarSlots
    for k, v in pairs(p1) do
        if type(v.hotbar) == "number" and isBackpackSlot(v.hotbar) then
            u58 = math.max(u58, v.hotbar)
        end
    end
    for k2, i in pairs(p2) do
        if type(i.hotbar) == "number" and isBackpackSlot(i.hotbar) then
            u58 = math.max(u58, i.hotbar)
        end
    end
    forEachProficiencyHotbar(p3, function(p1, p2, p3) -- Line: 242 -- upvalues: isBackpackSlot (upval), u58 (ref)
        if isBackpackSlot(p3) then
            u58 = math.max(u58, p3)
        end
    end)
    return u58
end
local function getNextBackpackSlot(p1, p2, p3) -- Line: 258 -- upvalues: getHighestBackpackSlot (val)
    return getHighestBackpackSlot(p1, p2, p3) + 1
end
return {
    isHotbarSlot = isHotbarSlot,
    isBackpackSlot = isBackpackSlot,
    countQuickAccessEntries = function(p1, p2, p3) -- Line: 96 -- upvalues: forEachProficiencyHotbar (val)
        local u48 = 0
        for k, v in pairs(p1) do
            if type(v.hotbar) == "number" and -1 < v.hotbar then
                u48 = u48 + 1
            end
        end
        for k2, i in pairs(p2) do
            if type(i.hotbar) == "number" and -1 < i.hotbar then
                u48 = u48 + 1
            end
        end
        forEachProficiencyHotbar(p3, function(p1, p2, p3) -- Line: 115 -- upvalues: u48 (ref)
            if -1 < p3 then
                u48 = u48 + 1
            end
        end)
        return u48
    end,
    countBackpackEntries = function(p1, p2, p3) -- Line: 131 -- upvalues: isBackpackSlot (val), forEachProficiencyHotbar (val)
        local u50 = 0
        for k, v in pairs(p1) do
            if type(v.hotbar) == "number" and isBackpackSlot(v.hotbar) then
                u50 = u50 + 1
            end
        end
        for k2, i in pairs(p2) do
            if type(i.hotbar) == "number" and isBackpackSlot(i.hotbar) then
                u50 = u50 + 1
            end
        end
        forEachProficiencyHotbar(p3, function(p1, p2, p3) -- Line: 150 -- upvalues: isBackpackSlot (upval), u50 (ref)
            if isBackpackSlot(p3) then
                u50 = u50 + 1
            end
        end)
        return u50
    end,
    isSlotOccupied = isSlotOccupied,
    getNextHotbarSlot = getNextHotbarSlot,
    getNextBackpackSlot = getNextBackpackSlot,
    getNextAvailableSlot = function(p1, p2, p3) -- Line: 273 -- upvalues: getNextHotbarSlot (val), getNextBackpackSlot (val)
        local v1 = getNextHotbarSlot(p1, p2, p3)
        if v1 then
            return v1
        end
        return getNextBackpackSlot(p1, p2, p3)
    end,
    isValidHotbarDropSlot = function(p1) -- Line: 291 -- upvalues: isHotbarSlot (val)
        return isHotbarSlot(p1)
    end,
    isValidBackpackDropSlot = function(p1, p2, p3, p4) -- Line: 303 -- upvalues: isBackpackSlot (val), getNextBackpackSlot (val), getHighestBackpackSlot (val), HotbarSlots (val)
        if not (isBackpackSlot(p1)) then
            return false
        end
        local v1 = getNextBackpackSlot(p2, p3, p4)
        local v2 = getHighestBackpackSlot(p2, p3, p4)
        if p1 == v1 then
            return true
        end
        local v3 = if HotbarSlots + 1 <= p1 then p1 <= v2 else false
        return v3
    end,
    packBackpackSlots = function(p1, p2, p3) -- Line: 330 -- upvalues: isBackpackSlot (val), forEachProficiencyHotbar (val), setProficiencyHotbar (val), HotbarSlots (val)
        local u3 = {}
        for k, v in pairs(p1) do
            if type(v.hotbar) == "number" and isBackpackSlot(v.hotbar) then
                table.insert(u3, {
                    slot = v.hotbar,
                    apply = function(p1) -- Line: 341 -- upvalues: v (val)
                        v.hotbar = p1
                    end,
                })
            end
        end
        for k2, i in pairs(p2) do
            if type(i.hotbar) == "number" and isBackpackSlot(i.hotbar) then
                table.insert(u3, {
                    slot = i.hotbar,
                    apply = function(p1) -- Line: 352 -- upvalues: i (val)
                        i.hotbar = p1
                    end,
                })
            end
        end
        forEachProficiencyHotbar(p3, function(p1, p2, p3) -- Line: 359 -- upvalues: isBackpackSlot (upval), u3 (val), setProficiencyHotbar (upval)
            if isBackpackSlot(p3) then
                table.insert(u3, {
                    slot = p3,
                    apply = function(a1) -- Line: 363 -- upvalues: setProficiencyHotbar (upval), p1 (val), p2 (val)
                        setProficiencyHotbar(p1, p2, a1)
                    end,
                })
            end
        end)
        table.sort(u3, function(p1, p2) -- Line: 370
            local v1 = p1.slot < p2.slot
            return v1
        end)
        for i2, j in ipairs(u3) do
            j.apply(HotbarSlots + i2)
        end
    end,
    slotToBackpackGrid = function(p1) -- Line: 384 -- upvalues: isBackpackSlot (val), HotbarSlots (val), Backpack (val)
        if not (isBackpackSlot(p1)) then
            return nil
        end
        local v1 = p1 - HotbarSlots - 1
        local Columns = Backpack.Columns
        return {row = math.floor(v1 / Columns), col = v1 % Columns}
    end,
    packedIndexToBackpackGrid = function(p1) -- Line: 403 -- upvalues: Backpack (val)
        local Columns = Backpack.Columns
        return {row = math.floor(p1 / Columns), col = p1 % Columns}
    end,
}