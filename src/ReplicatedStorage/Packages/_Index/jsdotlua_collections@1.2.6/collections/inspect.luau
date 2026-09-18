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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.inspect
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  12 functions

local HttpService = game:GetService("HttpService")
local Array = script.Parent:WaitForChild("Array")
local isArray = require(Array:WaitForChild("isArray"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local formatObject = nil
local getObjectTag = nil
local function isIndexKey(p1, p2) -- Line: 41
    local v1 = if type(p1) == "number" then if p1 <= p2 then if 1 <= p1 then math.floor(p1) == p1 else false else false else false
    return v1
end
local function getTableLength(p1) -- Line: 48
    local v1 = 1
    local v2 = rawget(p1, v1)
    while v2 ~= nil do
        v1 = v1 + 1
        v2 = rawget(p1, v1)
    end
    return v1 - 1
end
local function sortKeysForPrinting(p1, p2) -- Line: 58
    local v1
    local v2 = type(p1)
    local v3 = type(p2)
    if v2 ~= v3 then
        v1 = v2 < v3
        return v1
    end
    if v2 == "number" or v2 == "string" then
        v1 = p1 < p2
        return v1
    end
    v1 = v2 < v3
    return v1
end
local function rawpairs(p1) -- Line: 71
    return next, p1, nil
end
local function getFragmentedKeys(p1) -- Line: 75 -- upvalues: sortKeysForPrinting (val)
    local v1
    local v2 = {}
    local v3 = 0
    local v4 = 1
    local v5 = rawget(p1, v4)
    while v5 ~= nil do
        v4 = v4 + 1
        v5 = rawget(p1, v4)
    end
    local v6 = v4 - 1
    v4 = next
    v5 = p1
    local v7 = nil
    for i, j in v4, v5, v7 do
        v1 = if type(i) == "number" then if i <= v6 then if 1 <= i then math.floor(i) == i else false else false else false
        if not v1 then
            v3 = v3 + 1
            v2[v3] = i
        end
    end
    table.sort(v2, sortKeysForPrinting)
    return v2, v3, v6
end
function formatValue(p1, p2, p3) -- Line: 89 -- upvalues: HttpService (val), formatObjectValue (ref)
    local v1 = typeof(p1)
    if v1 == "string" then
        return HttpService:JSONEncode(p1)
    end
    if v1 == "number" then
        if p1 ~= p1 then
            return "NaN"
        end
        if p1 == (1 / 0) then
            return "Infinity"
        end
        if p1 == (-1 / 0) then
            return "-Infinity"
        end
        return (tostring(p1))
    end
    if v1 ~= "function" then
        if v1 == "table" then
            return formatObjectValue(p1, p2, p3)
        end
        return (tostring(p1))
    end
    local v2 = "[function"
    local v3 = debug.info(p1, "n")
    if v3 ~= nil and v3 ~= "" then
        v2 = v2 .. " " .. v3
    end
    return v2 .. "]"
end
function formatObjectValue(p1, p2, p3) -- Line: 122 -- upvalues: formatValue (ref), isArray (val), formatArray (ref), formatObject (ref)
    local v1, v2
    if table.find(p2, p1) ~= nil then
        return "[Circular]"
    end
    local v3 = {unpack(p2)}
    table.insert(v3, p1)
    if typeof(p1.toJSON) ~= "function" then
        if isArray(p1) then
            return formatArray(p1, v3, p3)
        end
        v1, v2 = p1, p3
        return formatObject(v1, v3, v2)
    end
    local v4 = p1:toJSON(p1)
    if v4 == p1 then
        v1, v2 = p1, p3
        return formatObject(v1, v3, v2)
    end
    if typeof(v4) == "string" then
        return v4
    end
    return formatValue(v4, v3, p3)
end
function formatObject(p1, p2, p3) -- Line: 147 -- upvalues: getFragmentedKeys (val), getObjectTag (ref), formatValue (ref)
    local v1 = ""
    local v2 = getmetatable(p1)
    if not v2 then
        local v3, v4, v5
        v3, v4, v5 = getFragmentedKeys(p1)
        if v5 ~= 0 then
            local v6
            if p3.depth < #p2 then
                return v1 .. "[" .. getObjectTag(p1) .. "]"
            end
            local v7 = {}
            local v8 = v5
            local v9 = 1
            for i = 1, v8, v9 do
                v6 = formatValue(p1[i], p2, p3)
                table.insert(v7, v6)
            end
            v8 = v4
            v9 = 1
            for j = 1, v8, v9 do
                v6 = v3[j]
                table.insert(v7, v6 .. ": " .. formatValue(p1[v6], p2, p3))
            end
            return v1 .. "{ " .. table.concat(v7, ", ") .. " }"
        elseif v4 == 0 then
            return v1 .. "{}"
        end
    elseif rawget(v2, "__tostring") then
        return (tostring(p1))
    end
end
function formatArray(p1, p2, p3) -- Line: 183 -- upvalues: formatValue (ref)
    local v1 = #p1
    if v1 == 0 then
        return "[]"
    end
    if p3.depth < #p2 then
        return "[Array]"
    end
    local v2 = math.min(10, v1)
    local v3 = v1 - v2
    local v4 = {}
    local v5 = v2
    local v6 = 1
    for i = 1, v5, v6 do
        v4[i] = formatValue(p1[i], p2, p3)
    end
    if v3 == 1 then
        table.insert(v4, "... 1 more item")
    elseif 1 < v3 then
        table.insert(v4, ("... %s more items"):format((tostring(v3))))
    end
    return "[" .. table.concat(v4, ", ") .. "]"
end
function getObjectTag(p1) -- Line: 209
    return "Object"
end
return function(p1, p2) -- Line: 34 -- upvalues: formatValue (ref)
    local v1
    local v2 = p2
    if not v2 then
        v2 = {depth = 2}
    end
    local v3 = v2.depth or 2
    if 0 > v3 then
        v1 = 2
    else
        v1 = v3
    end
    v2.depth = v1
    return formatValue(p1, {}, v2)
end