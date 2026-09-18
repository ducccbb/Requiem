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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.RobloxComponentProps
--                               Dumped in 0.00156 seconds
--                          Bytecode version 9  |  15 functions

local __DEV__ = _G.__DEV__
local CollectionService = game:GetService("CollectionService")
local v1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local inspect = v1.util.inspect
local console = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).console
local react = require(script.Parent.Parent.Parent.Parent:WaitForChild("react"))
local ReactSymbols = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).ReactSymbols
local SingleEventManager = require(script.Parent:WaitForChild("SingleEventManager"))
local Type = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Type
local getDefaultInstanceProperty = require(script.Parent:WaitForChild("getDefaultInstanceProperty"))
require(script.Parent.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local Tag = require(script.Parent.Parent.Parent.Parent:WaitForChild("react")).Tag
local u105 = {}
local u106 = {}
local function identity(...) -- Line: 69
    return ...
end
local function setRobloxInstanceProperty(p1, p2, p3) -- Line: 73 -- upvalues: getDefaultInstanceProperty (val)
    local v1
    if p3 ~= nil then
        p1[p2] = p3
        return
    end
    local v2 = pcall(p1.ResetPropertyToDefault, p1, p2)
    if v2 then
        return
    end
    _, v1 = getDefaultInstanceProperty(p1.ClassName, p2)
    p1[p2] = v1
end
local function removeBinding(p1, p2) -- Line: 89 -- upvalues: u106 (val)
    local v1 = u106[p1]
    if v1 ~= nil then
        v1[p2]()
        v1[p2] = nil
    end
end
local function attachBinding(p1, p2, p3) -- Line: 98 -- upvalues: setRobloxInstanceProperty (val), identity (val), console (val), u106 (val), react (val)
    local v1
    local function updateBoundProperty(a1) -- Line: 99 -- upvalues: setRobloxInstanceProperty (upval), identity (upval), p1 (val), p2 (val), p3 (val), console (upval)
        local v1, v2
        v1, v2 = xpcall(setRobloxInstanceProperty, identity, p1, p2, a1)
        if not v1 then
            local v3 = p3._source or "<enable DEV mode for stack>"
            local v4 = tostring(a1)
            local v5 = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", p2, p1.Name, p1.ClassName, v4, v2, v3)
            console.error(v5)
            error(v5, 0)
        end
    end
    if u106[p1] == nil then
        u106[p1] = {}
    end
    v1 = u106[p1]
    v1[p2] = react.__subscribeToBinding(p3, updateBoundProperty)
    updateBoundProperty(p3:getValue())
end
local function applyTags(p1, p2, p3) -- Line: 131 -- upvalues: __DEV__ (val), console (val), inspect (val), CollectionService (val)
    if not __DEV__ then
        local v1 = {}
        for i in string.gmatch(p2 or "", "%S+") do
            v1[i] = true
        end
        local v2 = {}
        for j in string.gmatch(p3 or "", "%S+") do
            v2[j] = true
        end
        local v3 = v1
        local v4 = nil
        local v5 = nil
        for k, n in v3, v4, v5 do
            if not (v2[k]) then
                CollectionService:RemoveTag(p1, k)
            end
        end
        v3 = v2
        v4 = nil
        v5 = nil
        for m, i5 in v3, v4, v5 do
            if not (v1[m]) then
                CollectionService:AddTag(p1, m)
            end
        end
        return
    elseif p3 ~= nil and typeof(p3) ~= "string" then
        console.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", inspect(p3))
        return
    end
end
local function removeAllTags(p1) -- Line: 165 -- upvalues: CollectionService (val)
    for i, j in CollectionService:GetTags(p1) do
        CollectionService:RemoveTag(p1, j)
    end
end
local function applyProp(p1, p2, p3, p4) -- Line: 171 -- upvalues: Type (val), u105 (val), SingleEventManager (val), ReactSymbols (val), u106 (val), attachBinding (val), Tag (val), applyTags (val), getDefaultInstanceProperty (val)
    local v1
    local v2 = Type.of(p2)
    if v2 == Type.HostEvent then
        v1 = u105[p1]
        if v1 == nil then
            v1 = SingleEventManager.new(p1)
            u105[p1] = v1
        end
        local name = p2.name
        if v2 == Type.HostChangeEvent then
            v1:connectPropertyChange(name, p3)
            return
        end
        v1:connectEvent(name, p3)
        return
    elseif v2 ~= Type.HostChangeEvent then
        local v3, v4
        v1 = if typeof(p3) == "table" then p3["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE else false
        local v5 = if p4 ~= nil then if typeof(p4) == "table" then p4["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE else false else false
        if v5 then
            v4 = u106[p1]
            if v4 ~= nil then
                v4[p2]()
                v4[p2] = nil
            end
        end
        if v1 then
            attachBinding(p1, p2, p3)
            return
        end
        if p2 == Tag then
            applyTags(p1, p4, p3)
            return
        end
        v4 = p3
        if v4 ~= nil then
            p1[p2] = v4
            return
        end
        local v6 = pcall(p1.ResetPropertyToDefault, p1, p2)
        if v6 then
            return
        end
        _, v3 = getDefaultInstanceProperty(p1.ClassName, p2)
        p1[p2] = v3
        return
    end
end
local function applyProps(p1, p2) -- Line: 216 -- upvalues: applyProp (val)
    local v1 = p2
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if i ~= "ref" and i ~= "children" then
            applyProp(p1, i, j)
        end
    end
end
local function safelyApplyProperties(p1, p2, p3) -- Line: 256 -- upvalues: Object (val), applyProp (val)
    local v1, v2
    local v3 = #p2
    local v4 = 2
    local v5 = p2
    for i = 1, v3, v4 do
        v1 = v5[i]
        v2 = v5[i + 1]
        if v2 == Object.None then
            v2 = nil
        end
        if v1 ~= "ref" and v1 ~= "children" then
            applyProp(v6, v1, v2, v7[v1])
        end
    end
end
local function cleanupBindings(p1) -- Line: 309 -- upvalues: u106 (val)
    local v1 = u106[p1]
    if v1 ~= nil then
        local v2 = v1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            j()
        end
        u106[p1] = nil
    end
end
return {
    setInitialProperties = function(p1, p2, p3, p4) -- Line: 227 -- upvalues: applyProps (val), identity (val), console (val), u105 (val)
        local v1, v2
        v1, v2 = xpcall(applyProps, identity, p1, p3)
        if not v1 then
            local v3 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", p1.Name, p1.ClassName, v2)
            console.error(v3)
            error(v3, 0)
        end
        if u105[p1] ~= nil then
            u105[p1]:resume()
        end
    end,
    updateProperties = function(p1, p2, p3) -- Line: 275 -- upvalues: u105 (val), safelyApplyProperties (val), identity (val), console (val)
        local v1, v2
        if u105[p1] ~= nil then
            u105[p1]:suspend()
        end
        v1, v2 = xpcall(safelyApplyProperties, identity, p1, p2, p3)
        if not v1 then
            local v3 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", p1.Name, p1.ClassName, v2)
            console.error(v3)
            error(v3, 0)
        end
        if u105[p1] ~= nil then
            u105[p1]:resume()
        end
    end,
    cleanupHostComponent = function(p1) -- Line: 321 -- upvalues: u105 (val), u106 (val), CollectionService (val)
        local v1, v2, v3, v4, v5
        if u105[p1] ~= nil then
            u105[p1] = nil
        end
        local v6 = u106[p1]
        if v6 ~= nil then
            local v7 = v6
            local v8 = nil
            local v9 = nil
            for i, j in v7, v8, v9 do
                j()
            end
            u106[p1] = nil
        end
        if typeof(p1) ~= "Instance" then
            return
        end
        for k, n in CollectionService:GetTags(p1) do
            CollectionService:RemoveTag(p1, n)
        end
        for m, i5 in p1:GetDescendants() do
            if u105[i5] ~= nil then
                u105[i5] = nil
            end
            v2 = u106[i5]
            if v2 ~= nil then
                v3 = v2
                v4 = nil
                v5 = nil
                for i6, i7 in v3, v4, v5 do
                    i7()
                end
                u106[i5] = nil
            end
            for i8, i9 in CollectionService:GetTags(v1) do
                CollectionService:RemoveTag(v1, i9)
            end
        end
    end,
    _instanceToEventManager = u105,
    _instanceToBindings = u106,
}