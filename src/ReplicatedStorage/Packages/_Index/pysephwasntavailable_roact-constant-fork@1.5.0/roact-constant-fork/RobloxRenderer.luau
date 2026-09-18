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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.RobloxRenderer
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  18 functions

local Binding = require(script.Parent.Binding)
local Children = require(script.Parent.PropMarkers.Children)
local ElementKind = require(script.Parent.ElementKind)
local SingleEventManager = require(script.Parent.SingleEventManager)
local getDefaultInstanceProperty = require(script.Parent.getDefaultInstanceProperty)
local Ref = require(script.Parent.PropMarkers.Ref)
local Constant = require(script.Parent.PropMarkers.Constant)
local Type = require(script.Parent.Type)
local internalAssert = require(script.Parent.internalAssert)
local u54 = require(script.Parent.GlobalConfig).get()
local function identity(...) -- Line: 33
    return ...
end
local function applyRef(p1, p2) -- Line: 37 -- upvalues: Type (val), Binding (val)
    if p1 == nil then
        return
    end
    if typeof(p1) == "function" then
        p1(p2)
        return
    end
    local v1 = Type.of(p1)
    if v1 == Type.Binding then
        Binding.update(p1, p2)
        return
    end
    error(("Invalid ref: Expected type Binding but got %s"):format((typeof(p1))))
end
local function setRobloxInstanceProperty(p1, p2, p3) -- Line: 52 -- upvalues: getDefaultInstanceProperty (val)
    local v1
    if p3 ~= nil then
        v1 = p3
    else
        local v2
        _, v2 = getDefaultInstanceProperty(p1.ClassName, p2)
        v1 = v2
    end
    p1[p2] = v1
end
local function removeBinding(p1, p2) -- Line: 65
    p1.bindings[p2]()
    p1.bindings[p2] = nil
end
local function attachBinding(p1, p2, p3) -- Line: 71 -- upvalues: Constant (val), getDefaultInstanceProperty (val), identity (val), Binding (val)
    local bindings
    local function updateBoundProperty(a1) -- Line: 72 -- upvalues: Constant (upval), p1 (val), p2 (val), getDefaultInstanceProperty (upval), identity (upval)
        local v1, v2
        if a1 == Constant.SkipBindingUpdate then
            return
        end
        v1, v2 = xpcall(function() -- Line: 77 -- upvalues: p1 (upval), p2 (upval), a1 (val), getDefaultInstanceProperty (upval)
            local hostObject = p1.hostObject
            local v1 = p2
            local v2 = a1
            if v2 == nil then
                local v3
                _, v3 = getDefaultInstanceProperty(hostObject.ClassName, v1)
                v2 = v3
            end
            hostObject[v1] = v2
        end, identity)
        if not v1 then
            local source = p1.currentElement.source
            if source == nil then
                source = "<enable element tracebacks>"
            end
            local v3 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v2, source)
            error(v3, 0)
        end
    end
    if p1.bindings == nil then
        p1.bindings = {}
    end
    bindings = p1.bindings
    bindings[p2] = Binding.subscribe(p3, updateBoundProperty)
    updateBoundProperty(p3:getValue())
end
local function detachAllBindings(p1) -- Line: 102
    if p1.bindings ~= nil then
        for k, v in pairs(p1.bindings) do
            v()
        end
        p1.bindings = nil
    end
end
local function applyProp(p1, p2, p3, p4) -- Line: 111 -- upvalues: Ref (val), Children (val), Type (val), SingleEventManager (val), attachBinding (val), getDefaultInstanceProperty (val)
    if p3 == p4 then
        return
    end
    if p2 == Ref then
        return
    else
        if p2 == Children then
            return
        end
        local v1 = Type.of(p2)
        if v1 == Type.HostEvent then
            if p1.eventManager == nil then
                p1.eventManager = SingleEventManager.new(p1.hostObject)
            end
            local name = p2.name
            if v1 == Type.HostChangeEvent then
                p1.eventManager:connectPropertyChange(name, p3)
                return
            end
            p1.eventManager:connectEvent(name, p3)
            return
        elseif v1 ~= Type.HostChangeEvent then
            local v2 = Type.of(p3)
            local v3 = v2 == Type.Binding
            local v4 = Type.of(p4)
            v2 = v4 == Type.Binding
            if v2 then
                p1.bindings[p2]()
                p1.bindings[p2] = nil
            end
            if v3 then
                attachBinding(p1, p2, p3)
                return
            end
            local hostObject = p1.hostObject
            local v5 = p3
            if v5 == nil then
                local v6
                _, v6 = getDefaultInstanceProperty(hostObject.ClassName, p2)
                v5 = v6
            end
            hostObject[p2] = v5
            return
        end
    end
end
local function applyProps(p1, p2) -- Line: 153 -- upvalues: applyProp (val)
    for k, v in pairs(p2) do
        applyProp(p1, k, v, nil)
    end
end
local function updateProps(p1, p2, p3) -- Line: 159 -- upvalues: applyProp (val)
    for k, v in pairs(p3) do
        applyProp(p1, k, v, p2[k])
    end
    for k2, i in pairs(p2) do
        if p3[k2] == nil then
            applyProp(p1, k2, nil, i)
        end
    end
end
return {
    isHostObject = function(p1) -- Line: 179
        local v1 = typeof(p1) == "Instance"
        return v1
    end,
    mountHostNode = function(p1, p2) -- Line: 183 -- upvalues: u54 (val), internalAssert (val), ElementKind (val), applyProps (val), identity (val), Children (val), applyRef (val), Ref (val)
        local v1, v2
        local currentElement = p2.currentElement
        local hostParent = p2.hostParent
        local hostKey = p2.hostKey
        if u54.internalTypeChecks then
            v2 = ElementKind.of(currentElement)
            v1 = v2 == ElementKind.Host
            internalAssert(v1, "Element at given node is not a host Element")
        end
        if u54.typeChecks then
            v1 = currentElement.props.Name == nil
            assert(v1, "Name can not be specified as a prop to a host component in Roact.")
            v1 = currentElement.props.Parent == nil
            assert(v1, "Parent can not be specified as a prop to a host component in Roact.")
        end
        local v3 = Instance.new(currentElement.component)
        p2.hostObject = v3
        v1, v2 = xpcall(function() -- Line: 199 -- upvalues: applyProps (upval), p2 (val), currentElement (val)
            applyProps(p2, currentElement.props)
        end, identity)
        if not v1 then
            local source = currentElement.source
            if source == nil then
                source = "<enable element tracebacks>"
            end
            local v4 = ("Error applying props:\n\t%s\nIn element:\n%s\n"):format(v2, source)
            error(v4, 0)
        end
        v3.Name = tostring(hostKey)
        local v5 = currentElement.props[Children]
        if v5 ~= nil then
            p1.updateVirtualNodeWithChildren(p2, p2.hostObject, v5)
        end
        v3.Parent = hostParent
        p2.hostObject = v3
        applyRef(currentElement.props[Ref], v3)
        if p2.eventManager ~= nil then
            p2.eventManager:resume()
        end
    end,
    unmountHostNode = function(p1, p2) -- Line: 232 -- upvalues: applyRef (val), Ref (val)
        applyRef(p2.currentElement.props[Ref], nil)
        for k, v in pairs(p2.children) do
            p1.unmountVirtualNode(v)
        end
        if p2.bindings ~= nil then
            for k2, i in pairs(p2.bindings) do
                i()
            end
            p2.bindings = nil
        end
        p2.hostObject:Destroy()
    end,
    updateHostNode = function(p1, p2, p3) -- Line: 246 -- upvalues: Ref (val), applyRef (val), updateProps (val), identity (val), Children (val)
        local v1
        local props = p2.currentElement.props
        local props_2 = p3.props
        if p2.eventManager ~= nil then
            p2.eventManager:suspend()
        end
        local v2 = props[Ref]
        if v2 ~= props_2[Ref] then
            applyRef(props[Ref], nil)
            applyRef(props_2[Ref], p2.hostObject)
        end
        v2, v1 = xpcall(function() -- Line: 260 -- upvalues: updateProps (upval), p2 (val), props (val), props_2 (val)
            updateProps(p2, props, props_2)
        end, identity)
        if not v2 then
            local source = p3.source
            if source == nil then
                source = "<enable element tracebacks>"
            end
            local v3 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v1, source)
            error(v3, 0)
        end
        local v4 = p3.props[Children]
        if v4 ~= nil then
            p1.updateVirtualNodeWithChildren(p2, p2.hostObject, v4)
        elseif props[Children] ~= nil then
            p1.updateVirtualNodeWithChildren(p2, p2.hostObject, v4)
        end
        if p2.eventManager ~= nil then
            p2.eventManager:resume()
        end
        return p2
    end,
}