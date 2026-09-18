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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Map.Map
--                               Dumped in 0.00126 seconds
--                          Bytecode version 9  |  18 functions

local __DEV__ = _G.__DEV__
local Array = script.Parent.Parent:WaitForChild("Array")
local forEach = require(Array:WaitForChild("forEach"))
local Array_2 = script.Parent.Parent:WaitForChild("Array")
local map = require(Array_2:WaitForChild("map"))
local Array_3 = script.Parent.Parent:WaitForChild("Array")
local isArray = require(Array_3:WaitForChild("isArray"))
local u50 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local u61 = {}
function u61.new(p1) -- Line: 23 -- upvalues: isArray (val), __DEV__ (val), u50 (val), u61 (val)
    local v1
    local v2 = nil
    local v3 = nil
    if p1 == nil then
        v2 = {}
        v3 = {}
    elseif isArray(p1) then
        local v4
        if __DEV__ and 0 < #p1 and typeof(p1[1]) ~= "table" then
            error("Value `" .. typeof(p1[1]) .. "` is not an entry object.\n Cannot create Map from {K, V} form, it must be { {K, V}... }")
        end
        v2 = table.create(#p1)
        v3 = {}
        local v5 = p1
        v1 = nil
        local v6 = nil
        for i, j in v5, v1, v6 do
            v4 = j[1]
            if __DEV__ and v4 == nil then
                error("cannot create Map from a table that isn't an array.")
            end
            if v3[v4] == nil then
                table.insert(v2, v4)
            end
            v3[v4] = j[2]
        end
    elseif not (u50(p1, u61)) then
        local v7 = typeof(p1)
        error(("`%s` `%s` is not iterable, cannot make Map using it"):format(v7, (tostring(p1))))
    else
        v2 = table.clone(p1._array)
        v3 = table.clone(p1._map)
    end
    v1 = {size = #v2, _map = v3, _array = v2}
    return (setmetatable(v1, u61))
end
function u61:set(p2, p3) -- Line: 72
    if self._map[p2] == nil then
        self.size = self.size + 1
        table.insert(self._array, p2)
    end
    self._map[p2] = p3
    return self
end
function u61.get(p1, p2) -- Line: 84
    return p1._map[p2]
end
function u61.clear(p1) -- Line: 88
    local v1 = table
    p1.size = 0
    v1.clear(p1._map)
    v1.clear(p1._array)
end
function u61.delete(p1, p2) -- Line: 95
    if p1._map[p2] == nil then
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
function u61.forEach(p1, p2, p3) -- Line: 111 -- upvalues: __DEV__ (val), forEach (val)
    if __DEV__ and typeof(p2) ~= "function" then
        error("callback is not a function")
    end
    forEach(p1._array, function(a1) -- Line: 118 -- upvalues: p1 (val), p3 (val), p2 (val)
        local v1 = p1._map[a1]
        if p3 ~= nil then
            p2(p3, v1, a1, p1)
            return
        end
        p2(v1, a1, p1)
    end)
end
function u61.has(p1, p2) -- Line: 129
    local v1 = p1._map[p2] ~= nil
    return v1
end
function u61.keys(p1) -- Line: 133
    return p1._array
end
function u61.values(p1) -- Line: 137 -- upvalues: map (val)
    return map(p1._array, function(a1) -- Line: 138 -- upvalues: p1 (val)
        return p1._map[a1]
    end)
end
function u61:entries() -- Line: 143 -- upvalues: map (val)
    return map(self._array, function(p1) -- Line: 144 -- upvalues: self (val)
        return {p1, self._map[p1]}
    end)
end
function u61.ipairs(p1) -- Line: 149 -- upvalues: __DEV__ (val)
    if __DEV__ then
        warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2))
    end
    return ipairs(p1:entries())
end
function u61.__iter(p1) -- Line: 161
    return next, p1:entries()
end
function u61.__index(p1, p2) -- Line: 165 -- upvalues: u61 (val), __DEV__ (val)
    local v1 = rawget(u61, p2)
    if v1 ~= nil then
        return v1
    end
    if __DEV__ then
        local v2 = rawget(p1, "_map")
        assert(v2, "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?")
    end
    return u61.get(p1, p2)
end
function u61.__newindex(p1, p2, p3) -- Line: 181
    p1:set(p2, p3)
end
return u61