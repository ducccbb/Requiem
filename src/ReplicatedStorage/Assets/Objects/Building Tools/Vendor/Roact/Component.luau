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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Component
--                               Dumped in 0.00240 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local assign = require(v1.Parent.assign)
local ComponentLifecyclePhase = require(v1.Parent.ComponentLifecyclePhase)
local Type = require(v1.Parent.Type)
local Symbol = require(v1.Parent.Symbol)
local invalidSetStateMessages = require(v1.Parent.invalidSetStateMessages)
local internalAssert = require(v1.Parent.internalAssert)
local u41 = require(v1.Parent.GlobalConfig).get()
local InternalData = Symbol.named("InternalData")
local u45 = {
    __tostring = function(p1) -- Line: 36
        return p1.__componentName
    end,
}
local v3 = {}
setmetatable(v3, u45)
v3[Type] = Type.StatefulComponentClass
v3.__index = v3
v3.__componentName = "Component"
function v3.extend(p1, p2) -- Line: 52 -- upvalues: u41 (val), Type (val), u45 (val)
    if u41.typeChecks then
        local v1 = Type.of(p1)
        local v2 = v1 == Type.StatefulComponentClass
        assert(v2, "Invalid `self` argument to `extend`.")
        v2 = typeof(p2) == "string"
        assert(v2, "Component class name must be a string")
    end
    local v3 = {}
    for k, v in pairs(p1) do
        if k ~= "extend" then
            v3[k] = v
        end
    end
    v3[Type] = Type.StatefulComponentClass
    v3.__index = v3
    v3.__componentName = p2
    setmetatable(v3, u45)
    return v3
end
function v3:__getDerivedState(p2, p3) -- Line: 78 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val)
    local v1
    if u41.internalTypeChecks then
        v1 = Type.of(self)
        local v2 = v1 == Type.StatefulComponentInstance
        internalAssert(v2, "Invalid use of `__getDerivedState`")
    end
    local componentClass = self[InternalData].componentClass
    if componentClass.getDerivedStateFromProps == nil then
        return nil
    end
    v1 = componentClass.getDerivedStateFromProps(p2, p3)
    if v1 == nil then
        return nil
    end
    if u41.typeChecks then
        local v3 = typeof(v1) == "table"
        assert(v3, "getDerivedStateFromProps must return a table!")
    end
    return v1
end
function v3.setState(p1, p2) -- Line: 101 -- upvalues: u41 (val), Type (val), InternalData (val), ComponentLifecyclePhase (val), invalidSetStateMessages (val), assign (val)
    local v1, v2
    if u41.typeChecks then
        local v3 = Type.of(p1)
        local v4 = v3 == Type.StatefulComponentInstance
        assert(v4, "Invalid `self` argument to `extend`.")
    end
    local v5 = p1[InternalData]
    local lifecyclePhase = v5.lifecyclePhase
    if lifecyclePhase == ComponentLifecyclePhase.ShouldUpdate then
        v2 = invalidSetStateMessages[v5.lifecyclePhase]:format((tostring(v5.componentClass)))
        error(v2, 2)
    elseif lifecyclePhase ~= ComponentLifecyclePhase.WillUpdate and lifecyclePhase ~= ComponentLifecyclePhase.Render and lifecyclePhase ~= ComponentLifecyclePhase.WillUnmount then
    end
    local pendingState = v5.pendingState
    v2 = nil
    if typeof(p2) ~= "function" then
        local v6, v7
        if typeof(p2) ~= "table" then
            error("Invalid argument to setState, expected function or table", 2)
            v1 = p1
        else
            v2 = p2
            v1 = p1
        end
        if pendingState == nil then
            v6 = assign({}, v1.state, v2)
        else
            v6 = assign(pendingState, v2)
        end
        if lifecyclePhase == ComponentLifecyclePhase.Init then
            v7 = v1:__getDerivedState(v1.props, v6)
            v1.state = assign(v6, v7)
            return
        end
        if lifecyclePhase == ComponentLifecyclePhase.DidMount or lifecyclePhase == ComponentLifecyclePhase.DidUpdate or lifecyclePhase == ComponentLifecyclePhase.ReconcileChildren then
            v7 = v1:__getDerivedState(v1.props, v6)
            v5.pendingState = assign(v6, v7)
            return
        end
        if lifecyclePhase == ComponentLifecyclePhase.Idle then
            v1:__update(nil, v6)
            return
        end
        local v8 = invalidSetStateMessages.default:format((tostring(v5.componentClass)))
        error(v8, 2)
        return
    else
        local state = pendingState
        if not state then
            state = p1.state
        end
        v2 = p2(state, p1.props)
        if v2 == nil then
            return
        end
        v1 = p1
    end
end
function v3:getElementTraceback() -- Line: 185 -- upvalues: InternalData (val)
    return self[InternalData].virtualNode.currentElement.source
end
function v3:render() -- Line: 196 -- upvalues: InternalData (val)
    local v1 = self[InternalData]
    local v2 = ("The component %q is missing the `render` method.\n`render` must be defined when creating a Roact component!"):format((tostring(v1.componentClass)))
    error(v2, 0)
end
function v3.__getContext(p1, p2) -- Line: 210 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val)
    if u41.internalTypeChecks then
        local v1 = Type.of(p1)
        local v2 = v1 == Type.StatefulComponentInstance
        internalAssert(v2, "Invalid use of `__getContext`")
        v2 = p2 ~= nil
        internalAssert(v2, "Context key cannot be nil")
    end
    return p1[InternalData].virtualNode.context[p2]
end
function v3.__addContext(p1, p2, p3) -- Line: 226 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val), assign (val)
    if u41.internalTypeChecks then
        local v1 = Type.of(p1)
        local v2 = v1 == Type.StatefulComponentInstance
        internalAssert(v2, "Invalid use of `__addContext`")
    end
    local virtualNode = p1[InternalData].virtualNode
    if virtualNode.originalContext == nil then
        virtualNode.originalContext = virtualNode.context
    end
    local v3 = {}
    v3[p2] = p3
    virtualNode.context = assign({}, virtualNode.context, v3)
end
function v3:__validateProps(p2) -- Line: 253 -- upvalues: u41 (val), InternalData (val)
    local v1, v2, v3
    if not u41.propValidation then
        return
    end
    local validateProps = self[InternalData].componentClass.validateProps
    if validateProps == nil then
        return
    end
    if typeof(validateProps) ~= "function" then
        v3 = typeof(validateProps)
        error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(v3, self.__componentName))
    end
    v1, v2 = validateProps(p2)
    if not v1 then
        local __componentName = self.__componentName
        local v4 = tostring(v2 or "<Validator function did not supply a message>")
        v3 = ("Property validation failed in %s: %s\n\n%s"):format(__componentName, v4, self:getElementTraceback() or "<enable element tracebacks>")
        error(v3, 0)
    end
end
function v3.__mount(p1, p2, p3) -- Line: 287 -- upvalues: u41 (val), internalAssert (val), Type (val), ComponentLifecyclePhase (val), InternalData (val), assign (val)
    local v1
    if u41.internalTypeChecks then
        v1 = Type.of(p1)
        local v2 = v1 == Type.StatefulComponentClass
        internalAssert(v2, "Invalid use of `__mount`")
        v1 = Type.of(p3)
        v2 = v1 == Type.VirtualNode
        internalAssert(v2, "Expected arg #2 to be of type VirtualNode")
    end
    local currentElement = p3.currentElement
    v1 = {reconciler = p2, virtualNode = p3, componentClass = p1, lifecyclePhase = ComponentLifecyclePhase.Init}
    local v3 = {}
    v3[Type] = Type.StatefulComponentInstance
    v3[InternalData] = v1
    setmetatable(v3, p1)
    p3.instance = v3
    local props = currentElement.props
    if p1.defaultProps ~= nil then
        props = assign({}, p1.defaultProps, props)
    end
    v3:__validateProps(props)
    v3.props = props
    v3._context = assign({}, p3.legacyContext)
    v3.state = assign({}, v3:__getDerivedState(v3.props, {}))
    if v3.init ~= nil then
        v3:init(v3.props)
        assign(v3.state, v3:__getDerivedState(v3.props, v3.state))
    end
    p3.legacyContext = v3._context
    v1.lifecyclePhase = ComponentLifecyclePhase.Render
    local v4 = v3:render()
    v1.lifecyclePhase = ComponentLifecyclePhase.ReconcileChildren
    p2.updateVirtualNodeWithRenderResult(p3, p3.hostParent, v4)
    if v3.didMount ~= nil then
        v1.lifecyclePhase = ComponentLifecyclePhase.DidMount
        v3:didMount()
    end
    if v1.pendingState ~= nil then
        v3:__update(nil, nil)
    end
    v1.lifecyclePhase = ComponentLifecyclePhase.Idle
end
function v3.__unmount(p1) -- Line: 360 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val), ComponentLifecyclePhase (val)
    if u41.internalTypeChecks then
        local v1 = Type.of(p1)
        local v2 = v1 == Type.StatefulComponentInstance
        internalAssert(v2, "Invalid use of `__unmount`")
    end
    local v3 = p1[InternalData]
    if p1.willUnmount ~= nil then
        v3.lifecyclePhase = ComponentLifecyclePhase.WillUnmount
        p1:willUnmount()
    end
    for k, v in pairs(v3.virtualNode.children) do
        v3.reconciler.unmountVirtualNode(v)
    end
end
function v3:__update(p2, p3) -- Line: 385 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val), assign (val)
    local pendingState, state, v1, v2, v3, v4, v5
    if u41.internalTypeChecks then
        local v6 = Type.of(self)
        local v7 = v6 == Type.StatefulComponentInstance
        internalAssert(v7, "Invalid use of `__update`")
        v7 = true
        v6 = Type.of(p2)
        if v6 ~= Type.Element then
            v7 = p2 == nil
        end
        internalAssert(v7, "Expected arg #1 to be of type Element or nil")
        v7 = if typeof(p3) ~= "table" then p3 == nil else true
        internalAssert(v7, "Expected arg #2 to be of type table or nil")
    end
    local v8 = self[InternalData]
    local componentClass = v8.componentClass
    local props = self.props
    if p2 ~= nil then
        props = p2.props
        if componentClass.defaultProps ~= nil then
            props = assign({}, componentClass.defaultProps, props)
        end
        self:__validateProps(props)
    end
    local v9 = 0
    while true do
        pendingState = nil
        if v8.pendingState ~= nil then
            pendingState = v8.pendingState
            v8.pendingState = nil
        end
        if v3 ~= nil then
            if pendingState ~= nil then
                v4 = assign(pendingState, v3)
            else
                state = v3
                if not state then
                    state = v1.state
                end
                v4 = state
            end
            v5 = v1:__getDerivedState(props, v4)
            if v5 ~= nil then
                v4 = assign({}, v4, v5)
            end
            v3 = nil
        elseif props == v1.props then
            v4 = pendingState
        end
        if not (v1:__resolveUpdate(props, v4)) then
            return false
        end
        v9 = v9 + 1
        if 100 < v9 then
            v2 = ("The component %q has reached the setState update recursion limit.\nWhen using `setState` in `didUpdate`, make sure that it won't repeat infinitely!"):format((tostring(v8.componentClass)))
            error(v2, 3)
        end
        if v8.pendingState == nil then
            return true
        end
    end
end
function v3:__resolveUpdate(p2, p3) -- Line: 462 -- upvalues: u41 (val), internalAssert (val), Type (val), InternalData (val), ComponentLifecyclePhase (val)
    local v1, v2
    if u41.internalTypeChecks then
        local v3 = Type.of(self)
        local v4 = v3 == Type.StatefulComponentInstance
        internalAssert(v4, "Invalid use of `__resolveUpdate`")
    end
    local v5 = self[InternalData]
    local virtualNode = v5.virtualNode
    local props = self.props
    local state = self.state
    if p2 ~= nil then
        v1 = p2
    else
        v1 = props
    end
    if p3 ~= nil then
        v2 = p3
    else
        v2 = state
    end
    if self.shouldUpdate == nil then
        if self.willUpdate ~= nil then
            v5.lifecyclePhase = ComponentLifecyclePhase.WillUpdate
            self:willUpdate(v1, v2)
        end
        v5.lifecyclePhase = ComponentLifecyclePhase.Render
        self.props = v1
        self.state = v2
        local v6 = virtualNode.instance:render()
        v5.lifecyclePhase = ComponentLifecyclePhase.ReconcileChildren
        v5.reconciler.updateVirtualNodeWithRenderResult(virtualNode, virtualNode.hostParent, v6)
        if self.didUpdate ~= nil then
            v5.lifecyclePhase = ComponentLifecyclePhase.DidUpdate
            self:didUpdate(props, state)
        end
        v5.lifecyclePhase = ComponentLifecyclePhase.Idle
        return true
    else
        v5.lifecyclePhase = ComponentLifecyclePhase.ShouldUpdate
        if not (self:shouldUpdate(v1, v2)) then
            v5.lifecyclePhase = ComponentLifecyclePhase.Idle
            return false
        end
    end
end
return v3