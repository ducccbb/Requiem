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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Set
--                              Dumped in 0.000732 seconds
--                          Bytecode version 9  |  11 functions

local __DEV__ = _G.__DEV__
local inspect = require(script.Parent:WaitForChild("inspect"))
local Array = script.Parent:WaitForChild("Array")
local isArray = require(Array:WaitForChild("isArray"))
local Array_2 = script.Parent:WaitForChild("Array")
local forEach = require(Array_2:WaitForChild("forEach"))
local Array_3 = script.Parent:WaitForChild("Array")
local from = Array_3:WaitForChild("from")
local fromString = require(from:WaitForChild("fromString"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local u59 = {
    __iter = function(p1) -- Line: 23
        return next, p1._array
    end,
    __tostring = function(p1) -- Line: 26 -- upvalues: inspect (val)
        local v1 = "Set "
        local v2 = #p1._array
        if 0 < v2 then
            v1 = v1 .. "(" .. tostring(#p1._array) .. ") "
        end
        return v1 .. inspect(p1._array)
    end,
}
u59.__index = u59
function u59.new(p1) -- Line: 38 -- upvalues: isArray (val), __DEV__ (val), fromString (val), u59 (val)
    local v1, v2
    local v3 = {}
    if p1 == nil then
        v1 = {}
    else
        local v4 = nil
        if typeof(p1) ~= "table" then
            if typeof(p1) ~= "string" then
                error(("cannot create array from value of type `%s`"):format((typeof(p1))))
            else
                v4 = fromString(p1)
            end
        elseif not (isArray(p1)) then
            v2 = getmetatable(p1)
            if not v2 then
                if __DEV__ then
                    error("cannot create array from an object-like table")
                end
            elseif rawget(v2, "__iter") then
                v4 = p1
            end
        else
            v4 = table.clone(p1)
        end
        if not v4 then
            v1 = {}
        else
            v1 = table.create(#v4)
            v2 = v4
            local v5 = nil
            local v6 = nil
            for i, j in v2, v5, v6 do
                if not (v3[j]) then
                    v3[j] = true
                    table.insert(v1, j)
                end
            end
        end
    end
    v2 = {size = #v1, _map = v3, _array = v1}
    return (setmetatable(v2, u59))
end
function u59.add(p1, p2) -- Line: 84
    if not (p1._map[p2]) then
        p1.size = p1.size + 1
        p1._map[p2] = true
        table.insert(p1._array, p2)
    end
    return p1
end
function u59.clear(p1) -- Line: 94
    p1.size = 0
    table.clear(p1._map)
    table.clear(p1._array)
end
function u59.delete(p1, p2) -- Line: 100
    if not (p1._map[p2]) then
        return false
    end
    p1.size = p1.size - 1
    p1._map[p2] = nil
    local v1 = table.find(p1._array, p2)
    if v1 then
        table.remove(p1._array, v1)
    end
    return true
end
function u59.forEach(p1, p2, p3) -- Line: 116 -- upvalues: forEach (val)
    if typeof(p2) ~= "function" then
        error("callback is not a function")
    end
    forEach(p1._array, function(a1) -- Line: 122 -- upvalues: p3 (val), p2 (val), p1 (val)
        if p3 ~= nil then
            p2(p3, a1, a1, p1)
            return
        end
        p2(a1, a1, p1)
    end)
end
function u59.has(p1, p2) -- Line: 131
    local v1 = p1._map[p2] ~= nil
    return v1
end
function u59.ipairs(p1) -- Line: 135 -- upvalues: __DEV__ (val)
    if __DEV__ then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2))
    end
    return ipairs(p1._array)
end
return u59