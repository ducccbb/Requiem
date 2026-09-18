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
--                    File: ReplicatedStorage.Common.Utilities.Table
--                               Dumped in 0.00181 seconds
--                          Bytecode version 9  |  25 functions

local copy, deepEqual, normalizeTableKeys
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
function deepEqual(p1, p2) -- Line: 47 -- upvalues: deepEqual (val)
    local v1 = type(p1)
    if v1 ~= type(p2) then
        return false
    end
    if type(p1) ~= "table" then
        v1 = p1 == p2
        return v1
    end
    for k, v in pairs(p1) do
        if not (deepEqual(v, p2[k])) then
            return false
        end
    end
    for k2, i in pairs(p2) do
        if p1[k2] == nil then
            return false
        end
    end
    return true
end
function copy(p1) -- Line: 179 -- upvalues: copy (val)
    local v1 = {}
    for k, v in pairs(p1) do
        if type(v) ~= "table" then
            v1[k] = v
        else
            v1[k] = copy(v)
        end
    end
    return v1
end
local function normalizeKey(p1) -- Line: 285
    if type(p1) ~= "string" then
        return p1
    end
    local v1 = tonumber(p1)
    if not v1 then
        return p1
    end
    if math.floor(v1) == v1 then
        return v1
    end
    return p1
end
local function isArrayLike(p1) -- Line: 298
    local v1 = if p1[1] == nil then p1["1"] ~= nil else true
    return v1
end
function normalizeTableKeys(p1, p2) -- Line: 304 -- upvalues: isArrayLike (val), normalizeKey (val), normalizeTableKeys (val)
    local v1
    if type(p1) ~= "table" then
        return p1
    end
    local v2 = p2
    if not v2 then
        v2 = isArrayLike(p1)
    end
    local v3 = {}
    local v4 = p2
    for k, v in pairs(p1) do
        if not v2 then
            v1 = k
        else
            v1 = normalizeKey(k)
        end
        v3[v1] = normalizeTableKeys(v, v4)
    end
    return v3
end
return {
    merge = function(p1, p2, p3) -- Line: 8
        local v1
        if not p3 then
            v1 = table.clone(p1)
        else
            v1 = p1
        end
        for k, v in pairs(p2) do
            v1[k] = v
        end
        return v1
    end,
    deepMerge = function(p1, p2) -- Line: 193
        local merge
        local function isArray(p1) -- Line: 194
            local v1 = if type(p1) == "table" then p1[1] ~= nil else false
            return v1
        end
        function merge(p1, p2) -- Line: 198 -- upvalues: merge (val), isArray (val)
            local v1 = {}
            for k, v in pairs(p1) do
                if type(v) ~= "table" then
                    v1[k] = v
                else
                    v1[k] = merge(v, {})
                end
            end
            for k2, i in pairs(p2) do
                if type(i) ~= "table" then
                    v1[k2] = i
                elseif isArray(i) then
                    v1[k2] = merge(i, {})
                elseif type(v1[k2]) ~= "table" then
                    v1[k2] = merge(i, {})
                elseif not (isArray(v1[k2])) then
                    v1[k2] = merge(v1[k2], i)
                end
            end
            return v1
        end
        return (merge(p1, p2))
    end,
    equals = deepEqual,
    keys = function(p1) -- Line: 67
        local v1 = {}
        for k in pairs(p1) do
            table.insert(v1, k)
        end
        return v1
    end,
    values = function(p1) -- Line: 77
        local v1 = {}
        for k, v in pairs(p1) do
            table.insert(v1, v)
        end
        return v1
    end,
    filter = function(p1, p2) -- Line: 19
        local v1 = {}
        for k, v in pairs(p1) do
            if p2(v, k) then
                if typeof(k) ~= "number" then
                    v1[k] = v
                else
                    table.insert(v1, v)
                end
            end
        end
        return v1
    end,
    map = function(p1, p2) -- Line: 100
        local v1 = {}
        for k, v in pairs(p1) do
            v1[k] = p2(v, k)
        end
        return v1
    end,
    mapKV = function(p1, p2) -- Line: 89
        local v1, v2
        local v3 = {}
        for k, v in pairs(p1) do
            v1, v2 = p2(v, k)
            v3[v1] = v2
        end
        return v3
    end,
    inverse = function(p1) -- Line: 110
        local v1 = {}
        for k, v in pairs(p1) do
            v1[v] = k
        end
        return v1
    end,
    join = function(p1, p2) -- Line: 120
        local v1 = {}
        for i, v in ipairs(p1) do
            table.insert(v1, v)
        end
        for i2, i3 in ipairs(p2) do
            table.insert(v1, i3)
        end
        return v1
    end,
    find = function(p1, p2) -- Line: 134
        for i, v in ipairs(p1) do
            if p2(v, i) then
                return i
            end
        end
        return nil
    end,
    diff = function(p1, p2) -- Line: 146
        local v1 = {}
        local v2 = {}
        local v3 = {}
        for k in pairs(p2) do
            v3[k] = true
        end
        for k2, v in pairs(p1) do
            if not (v3[k2]) then
                table.insert(v1, v)
            end
        end
        local v4 = {}
        for k3 in pairs(p1) do
            v4[k3] = true
        end
        for k4, i in pairs(p2) do
            if not (v4[k4]) then
                table.insert(v2, i)
            end
        end
        return v1, v2
    end,
    copy = copy,
    highest = function(p1) -- Line: 229
        local v1 = 0
        for k, v in pairs(p1) do
            if v1 < v then
                v1 = v
            end
        end
        return v1
    end,
    reverse = function(p1) -- Line: 241
        local v1 = {}
        for i, v in ipairs(p1) do
            v1[#p1 - i + 1] = v
        end
        return v1
    end,
    compact = function(p1) -- Line: 344
        local v1 = {}
        for i, v in ipairs(p1) do
            if v ~= nil then
                table.insert(v1, v)
            end
        end
        return v1
    end,
    unique = function(p1) -- Line: 35
        local v1 = {}
        for k, v in pairs(p1) do
            if not (table.find(v1, v)) then
                table.insert(v1, v)
            end
        end
        return v1
    end,
    computeObjectDiff = function(p1, p2) -- Line: 256 -- upvalues: deepEqual (val), copy (val)
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        local v2 = p2
        if not v2 then
            v2 = {}
        end
        local v3 = {}
        local v4 = {}
        for k, v in pairs(v2) do
            if v1[k] == nil then
                table.insert(v4, k)
            end
        end
        for k2, i in pairs(v1) do
            if not (deepEqual(i, v2[k2])) then
                if type(i) ~= "table" then
                    v3[k2] = i
                else
                    v3[k2] = copy(i)
                end
            end
        end
        return v3, v4
    end,
    applyObjectPatch = function(p1, p2, p3) -- Line: 320 -- upvalues: isArrayLike (val), normalizeKey (val), normalizeTableKeys (val)
        local v1, v2
        local v3 = p2
        if not v3 then
            v3 = {}
        end
        local v4 = p3
        if not v4 then
            v4 = {}
        end
        local v5 = isArrayLike(p1)
        if not v5 then
            v5 = isArrayLike(v3)
        end
        local v6 = p1
        for i, v in ipairs(v4) do
            if not v5 then
                v1 = v
            else
                v1 = normalizeKey(v)
            end
            v6[v1] = nil
            if v5 and type(v) == "string" and v1 ~= v then
                v6[v] = nil
            end
        end
        for k, i2 in pairs(v3) do
            if not v5 then
                v1 = k
            else
                v1 = normalizeKey(k)
            end
            if type(i2) ~= "table" then
                v2 = i2
            else
                v2 = normalizeTableKeys(i2, false)
            end
            v6[v1] = v2
            if v5 and type(k) == "string" and v1 ~= k then
                v6[k] = nil
            end
        end
    end,
    normalizeTableKeys = normalizeTableKeys,
}