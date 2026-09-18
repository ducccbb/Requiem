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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactChildren
--                               Dumped in 0.00120 seconds
--                          Bytecode version 9  |  15 functions

local mapIntoArray
require(script.Parent.Parent:WaitForChild("shared"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local Array = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
local ReactElement = require(script.Parent:WaitForChild("ReactElement"))
local isValidElement = ReactElement.isValidElement
local cloneAndReplaceKey = ReactElement.cloneAndReplaceKey
local function escape(p1) -- Line: 43
    local v1 = string.gsub(p1, "=", "=0")
    return "$" .. string.gsub(v1, ":", "=2")
end
local function escapeUserProvidedKey(p1) -- Line: 58
    return p1
end
local function getElementKey(p1, p2) -- Line: 71
    if typeof(p1) ~= "table" or p1 == nil or p1.key == nil then
        return (tostring(p2))
    end
    local v1 = tostring(p1.key)
    local v2 = string.gsub(v1, "=", "=0")
    v2 = string.gsub(v2, ":", "=2")
    return "$" .. v2
end
function mapIntoArray(p1, p2, p3, p4, p5) -- Line: 84 -- upvalues: REACT_ELEMENT_TYPE (val), REACT_PORTAL_TYPE (val), Array (val), mapIntoArray (val), isValidElement (val), cloneAndReplaceKey (val), getIteratorFn (val)
    local key, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local v14 = typeof(p1)
    if v14 == "nil" then
        v1 = nil
    elseif v14 ~= "boolean" and v14 ~= "userdata" then
        v1 = p1
    end
    local v15 = false
    if v1 == nil then
        v15 = true
    elseif v14 == "string" then
        v15 = true
    elseif v14 ~= "number" and v14 == "table" then
        v12 = v1["$$typeof"]
        if v12 == REACT_ELEMENT_TYPE then
            v15 = true
        elseif v12 ~= REACT_PORTAL_TYPE then
        end
    end
    if v15 then
        v12 = v1
        local v16 = p5(v12)
        if p4 ~= "" then
            v13 = p4
        else
            if typeof(v12) ~= "table" then
                v4 = tostring(1)
            elseif v12 ~= nil and v12.key ~= nil then
                v5 = tostring(v12.key)
                v6 = string.gsub(v5, "=", "=0")
                v6 = string.gsub(v6, ":", "=2")
                v4 = "$" .. v6
            end
            v13 = "." .. v4
        end
        if Array.isArray(v16) then
            v3 = if v13 ~= nil then v13 .. "/" else ""
            mapIntoArray(v16, p2, v3, "", function(p1) -- Line: 133
                return p1
            end)
        elseif v16 ~= nil then
            if isValidElement(v16) then
                key = v16.key
                if not key then
                    v7 = ""
                elseif not v12 then
                    v7 = tostring(key) .. "/"
                elseif v12.key == key then
                    v7 = ""
                else
                    v7 = tostring(key) .. "/"
                end
                v16 = cloneAndReplaceKey(v16, p3 .. v7 .. v13)
            end
            table.insert(p2, v16)
        end
        return 1
    end
    v13 = 0
    if p4 ~= "" then
        v3 = p4 .. ":"
    else
        v3 = "."
    end
    if Array.isArray(v1) then
        local v17
        v4 = #v1
        v5 = 1
        v2, v10, v11 = p2, p3, p5
        for i = 1, v4, v5 do
            v12 = v1[i]
            v17 = v12
            if typeof(v17) ~= "table" then
                v7 = tostring(i)
            elseif v17 ~= nil and v17.key ~= nil then
                v8 = tostring(v17.key)
                v9 = string.gsub(v8, "=", "=0")
                v9 = string.gsub(v9, ":", "=2")
                v7 = "$" .. v9
            end
            v13 = v13 + mapIntoArray(v12, v2, v10, v3 .. v7, v11)
        end
        return v13
    end
    v4 = getIteratorFn(v1)
    if typeof(v4) == "function" then
        local v18, v19, value
        v6 = v4(v1)
        v7 = 1
        local v20 = v6.next()
        v2, v10, v11 = p2, p3, p5
        while not v20.done do
            value = v20.value
            v9 = value
            if typeof(v9) ~= "table" then
                v8 = tostring(v7)
            elseif v9 ~= nil and v9.key ~= nil then
                v18 = tostring(v9.key)
                v19 = string.gsub(v18, "=", "=0")
                v19 = string.gsub(v19, ":", "=2")
                v8 = "$" .. v19
            end
            v7 = v7 + 1
            v13 = v13 + mapIntoArray(value, v2, v10, v3 .. v8, v11)
            v20 = v6.next()
        end
    end
    return v13
end
local function mapChildren(p1, p2, p3) -- Line: 251 -- upvalues: mapIntoArray (val)
    if p1 == nil then
        return nil
    end
    local v1 = {}
    local u5 = 1
    mapIntoArray(p1, v1, "", "", function(p1) -- Line: 261 -- upvalues: p2 (val), u5 (ref)
        local v1 = p2(p1, u5)
        u5 = u5 + 1
        return v1
    end)
    return v1
end
return {
    forEach = function(p1, p2, p3) -- Line: 303 -- upvalues: mapChildren (val)
        mapChildren(p1, function(...) -- Line: 308 -- upvalues: p2 (val)
            p2(...)
        end, p3)
    end,
    map = mapChildren,
    count = function(p1) -- Line: 279 -- upvalues: mapChildren (val)
        local u1 = 0
        mapChildren(p1, function() -- Line: 281 -- upvalues: u1 (ref)
            u1 = u1 + 1
        end)
        return u1
    end,
    only = function(p1) -- Line: 343 -- upvalues: invariant (val), isValidElement (val)
        local v1 = isValidElement(p1)
        invariant(v1, "React.Children.only expected to receive a single React element child.")
        return p1
    end,
    toArray = function(p1) -- Line: 322 -- upvalues: mapChildren (val)
        local v1 = mapChildren(p1, function(p1) -- Line: 323
            return p1
        end)
        if not v1 then
            v1 = {}
        end
        return v1
    end,
}