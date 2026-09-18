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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createReconciler
--                               Dumped in 0.00260 seconds
--                          Bytecode version 9  |  19 functions

local Type = require(script.Parent.Type)
local ElementKind = require(script.Parent.ElementKind)
local ElementUtils = require(script.Parent.ElementUtils)
local Children = require(script.Parent.PropMarkers.Children)
local Symbol = require(script.Parent.Symbol)
local internalAssert = require(script.Parent.internalAssert)
local u37 = require(script.Parent.GlobalConfig).get()
local InternalData = Symbol.named("InternalData")
return function(p1) -- Line: 25 -- upvalues: u37 (val), internalAssert (val), Type (val), ElementUtils (val), ElementKind (val), Children (val), InternalData (val)
    local u1 = nil
    local mountVirtualNode = nil
    local updateVirtualNode = nil
    local unmountVirtualNode = nil
    local function replaceVirtualNode(p1, p2) -- Line: 37 -- upvalues: unmountVirtualNode (ref), mountVirtualNode (ref)
        local originalContext = p1.originalContext
        if not originalContext then
            originalContext = p1.context
        end
        if not p1.wasUnmounted then
            unmountVirtualNode(p1)
        end
        local v1 = mountVirtualNode(p2, p1.hostParent, p1.hostKey, originalContext, p1.parentLegacyContext)
        if v1 ~= nil then
            v1.depth = p1.depth
            v1.parent = p1.parent
        end
        return v1
    end
    local function updateChildren(p1, p2, p3) -- Line: 70 -- upvalues: u37 (upval), internalAssert (upval), Type (upval), ElementUtils (upval), updateVirtualNode (ref), unmountVirtualNode (ref), mountVirtualNode (ref)
        local hostKey, v1, v2, v3
        if u37.internalTypeChecks then
            local v4 = Type.of(p1)
            v3 = v4 == Type.VirtualNode
            internalAssert(v3, "Expected arg #1 to be of type VirtualNode")
        end
        p1.updateChildrenCount = p1.updateChildrenCount + 1
        local updateChildrenCount = p1.updateChildrenCount
        v3 = {}
        for k, v in pairs(p1.children) do
            v1 = ElementUtils.getElementByKey(p3, k)
            v2 = updateVirtualNode(v, v1)
            if p1.updateChildrenCount ~= updateChildrenCount then
                if v2 and v2 ~= p1.children[k] then
                    unmountVirtualNode(v2)
                end
                return
            end
            if v2 == nil then
                v3[k] = true
            else
                p1.children[k] = v2
            end
        end
        for k2 in pairs(v3) do
            p1.children[k2] = nil
        end
        local v5 = p1
        for i, j in ElementUtils.iterateElements(p3) do
            hostKey = if i == ElementUtils.UseParentKey then v5.hostKey else i
            if v5.children[i] == nil then
                v2 = mountVirtualNode(j, v6, hostKey, v5.context, v5.legacyContext)
                if v5.updateChildrenCount ~= updateChildrenCount then
                    if v2 then
                        unmountVirtualNode(v2)
                    end
                    return
                end
                if v2 ~= nil then
                    v2.depth = v5.depth + 1
                    v2.parent = v5
                    v5.children[i] = v2
                end
            end
        end
    end
    local function updateVirtualNodeWithRenderResult(p1, p2, p3) -- Line: 147 -- upvalues: Type (upval), updateChildren (val)
        local v1 = Type.of(p3)
        if v1 == Type.Element or p3 == nil or typeof(p3) == "boolean" then
            updateChildren(p1, p2, p3)
            return
        end
        local v2 = ("%s\n%s"):format("Component returned invalid children:", p1.currentElement.source or "<enable element tracebacks>")
        error(v2, 0)
    end
    function unmountVirtualNode(a1) -- Line: 164 -- upvalues: u37 (upval), internalAssert (upval), Type (upval), ElementKind (upval), p1 (val), u1 (ref), unmountVirtualNode (ref)
        local v1
        if u37.internalTypeChecks then
            v1 = Type.of(a1)
            local v2 = v1 == Type.VirtualNode
            internalAssert(v2, "Expected arg #1 to be of type VirtualNode")
        end
        a1.wasUnmounted = true
        local v3 = ElementKind.of(a1.currentElement)
        if v3 == ElementKind.Host then
            p1.unmountHostNode(u1, a1)
            return
        end
        if v3 == ElementKind.Function then
            for k3, j in pairs(a1.children) do
                unmountVirtualNode(j)
            end
            return
        end
        if v3 == ElementKind.Stateful then
            a1.instance:__unmount()
            return
        end
        if v3 == ElementKind.Portal then
            for k2, i in pairs(a1.children) do
                unmountVirtualNode(i)
            end
            return
        end
        if v3 == ElementKind.Fragment then
            for k, v in pairs(a1.children) do
                unmountVirtualNode(v)
            end
            return
        end
        v1 = ("Unknown ElementKind %q"):format((tostring(v3)))
        error(v1, 2)
    end
    local function updateFunctionVirtualNode(p1, p2) -- Line: 195 -- upvalues: updateVirtualNodeWithRenderResult (val)
        local v1 = p2.component(p2.props)
        updateVirtualNodeWithRenderResult(p1, p1.hostParent, v1)
        return p1
    end
    local function updatePortalVirtualNode(a1, p2) -- Line: 203 -- upvalues: p1 (val), unmountVirtualNode (ref), mountVirtualNode (ref), Children (upval), updateChildren (val)
        local target = p2.props.target
        local v1 = p1.isHostObject(target)
        assert(v1, "Expected target to be host object")
        if target == a1.currentElement.props.target then
            updateChildren(a1, target, p2.props[Children])
            return a1
        end
        local originalContext = a1.originalContext
        if not originalContext then
            originalContext = a1.context
        end
        if not a1.wasUnmounted then
            unmountVirtualNode(a1)
        end
        local v2 = mountVirtualNode(p2, a1.hostParent, a1.hostKey, originalContext, a1.parentLegacyContext)
        if v2 ~= nil then
            v2.depth = a1.depth
            v2.parent = a1.parent
        end
        return v2
    end
    local function updateFragmentVirtualNode(p1, p2) -- Line: 222 -- upvalues: updateChildren (val)
        updateChildren(p1, p1.hostParent, p2.elements)
        return p1
    end
    function updateVirtualNode(a1, p2, p3) -- Line: 240 -- upvalues: u37 (upval), internalAssert (upval), Type (upval), unmountVirtualNode (ref), mountVirtualNode (ref), ElementKind (upval), p1 (val), u1 (ref), updateVirtualNodeWithRenderResult (val), Children (upval), updateChildren (val)
        local v1, v2
        if u37.internalTypeChecks then
            v2 = Type.of(a1)
            v1 = v2 == Type.VirtualNode
            internalAssert(v1, "Expected arg #1 to be of type VirtualNode")
        end
        if u37.typeChecks then
            v1 = true
            v2 = Type.of(p2)
            if v2 ~= Type.Element then
                v1 = if typeof(p2) ~= "boolean" then p2 == nil else true
            end
            assert(v1, "Expected arg #2 to be of type Element, boolean, or nil")
        end
        if a1.currentElement ~= p2 then
            local v3
            if typeof(p2) == "boolean" or p2 == nil then
                unmountVirtualNode(a1)
                return nil
            end
            if a1.currentElement.component ~= p2.component then
                v1 = a1
                local originalContext = v1.originalContext
                if not originalContext then
                    originalContext = v1.context
                end
                if not v1.wasUnmounted then
                    unmountVirtualNode(v1)
                end
                local v4 = mountVirtualNode(p2, v1.hostParent, v1.hostKey, originalContext, v1.parentLegacyContext)
                if v4 ~= nil then
                    v4.depth = v1.depth
                    v4.parent = v1.parent
                end
                return v4
            end
            local v5 = ElementKind.of(p2)
            v1 = true
            if v5 == ElementKind.Host then
                v3 = p1.updateHostNode(u1, a1, p2)
            else
                local v6
                if v5 == ElementKind.Function then
                    v2 = a1
                    v6 = p2.component(p2.props)
                    updateVirtualNodeWithRenderResult(v2, v2.hostParent, v6)
                    v3 = v2
                elseif v5 == ElementKind.Stateful then
                    v1 = a1.instance:__update(p2, p3)
                    v3 = a1
                elseif v5 == ElementKind.Portal then
                    v2 = a1
                    local target = p2.props.target
                    local v7 = p1.isHostObject(target)
                    assert(v7, "Expected target to be host object")
                    if target == v2.currentElement.props.target then
                        updateChildren(v2, target, p2.props[Children])
                        v3 = v2
                    else
                        local originalContext_2 = v2.originalContext
                        if not originalContext_2 then
                            originalContext_2 = v2.context
                        end
                        if not v2.wasUnmounted then
                            unmountVirtualNode(v2)
                        end
                        local v8 = mountVirtualNode(p2, v2.hostParent, v2.hostKey, originalContext_2, v2.parentLegacyContext)
                        if v8 ~= nil then
                            v8.depth = v2.depth
                            v8.parent = v2.parent
                        end
                        v3 = v8
                    end
                elseif v5 ~= ElementKind.Fragment then
                    v6 = ("Unknown ElementKind %q"):format((tostring(v5)))
                    error(v6, 2)
                    v3 = a1
                else
                    v2 = a1
                    updateChildren(v2, v2.hostParent, p2.elements)
                    v3 = v2
                end
            end
            if not v1 then
                return v3
            end
            v3.currentElement = p2
            return v3
        elseif p3 == nil then
            return a1
        end
    end
    local function createVirtualNode(a1, p2, p3, p4, p5) -- Line: 297 -- upvalues: u37 (upval), internalAssert (upval), p1 (val), Type (upval)
        local v1
        if u37.internalTypeChecks then
            v1 = p1.isHostObject(p2)
            if not v1 then
                v1 = p2 == nil
            end
            internalAssert(v1, "Expected arg #2 to be a host object")
            v1 = if typeof(p4) ~= "table" then p4 == nil else true
            internalAssert(v1, "Expected arg #4 to be of type table or nil")
            v1 = if typeof(p5) ~= "table" then p5 == nil else true
            internalAssert(v1, "Expected arg #5 to be of type table or nil")
        end
        if u37.typeChecks then
            v1 = p3 ~= nil
            assert(v1, "Expected arg #3 to be non-nil")
            v1 = true
            local v2 = Type.of(a1)
            if v2 ~= Type.Element then
                v1 = typeof(a1) == "boolean"
            end
            assert(v1, "Expected arg #1 to be of type Element or boolean")
        end
        local v3 = {}
        v3[Type] = Type.VirtualNode
        v3.currentElement = a1
        v3.depth = 1
        v3.parent = nil
        v3.children = {}
        v3.hostParent = p2
        v3.hostKey = p3
        v3.updateChildrenCount = 0
        v3.wasUnmounted = false
        v3.legacyContext = p5
        v3.parentLegacyContext = p5
        v1 = p4
        if not v1 then
            v1 = {}
        end
        v3.context = v1
        v3.originalContext = nil
        return v3
    end
    local function mountFunctionVirtualNode(p1) -- Line: 345 -- upvalues: updateVirtualNodeWithRenderResult (val)
        local currentElement = p1.currentElement
        local v1 = currentElement.component(currentElement.props)
        updateVirtualNodeWithRenderResult(p1, p1.hostParent, v1)
    end
    local function mountPortalVirtualNode(a1) -- Line: 353 -- upvalues: Children (upval), p1 (val), updateChildren (val)
        local currentElement = a1.currentElement
        local target = currentElement.props.target
        local v1 = currentElement.props[Children]
        local v2 = p1.isHostObject(target)
        assert(v2, "Expected target to be host object")
        updateChildren(a1, target, v1)
    end
    local function mountFragmentVirtualNode(p1) -- Line: 364 -- upvalues: updateChildren (val)
        updateChildren(p1, p1.hostParent, p1.currentElement.elements)
    end
    function mountVirtualNode(a1, p2, p3, p4, p5) -- Line: 375 -- upvalues: u37 (upval), internalAssert (upval), p1 (val), Type (upval), ElementKind (upval), createVirtualNode (val), u1 (ref), updateVirtualNodeWithRenderResult (val), Children (upval), updateChildren (val)
        local v1, v2
        if u37.internalTypeChecks then
            v1 = p1.isHostObject(p2)
            if not v1 then
                v1 = p2 == nil
            end
            internalAssert(v1, "Expected arg #2 to be a host object")
            v1 = if typeof(p5) ~= "table" then p5 == nil else true
            internalAssert(v1, "Expected arg #5 to be of type table or nil")
        end
        if u37.typeChecks then
            v1 = p3 ~= nil
            assert(v1, "Expected arg #3 to be non-nil")
            v1 = true
            local v3 = Type.of(a1)
            if v3 ~= Type.Element then
                v1 = typeof(a1) == "boolean"
            end
            assert(v1, "Expected arg #1 to be of type Element or boolean")
        end
        if typeof(a1) == "boolean" then
            return nil
        end
        local v4 = ElementKind.of(a1)
        v1 = createVirtualNode(a1, p2, p3, p4, p5)
        if v4 == ElementKind.Host then
            p1.mountHostNode(u1, v1)
            return v1
        end
        if v4 == ElementKind.Function then
            local currentElement = v1.currentElement
            v2 = currentElement.component(currentElement.props)
            updateVirtualNodeWithRenderResult(v1, v1.hostParent, v2)
            return v1
        end
        if v4 == ElementKind.Stateful then
            a1.component:__mount(u1, v1)
            return v1
        end
        if v4 ~= ElementKind.Portal then
            if v4 == ElementKind.Fragment then
                updateChildren(v1, v1.hostParent, v1.currentElement.elements)
                return v1
            end
            v2 = ("Unknown ElementKind %q"):format((tostring(v4)))
            error(v2, 2)
            return v1
        end
        local currentElement_2 = v1.currentElement
        local target = currentElement_2.props.target
        local v5 = currentElement_2.props[Children]
        local v6 = p1.isHostObject(target)
        assert(v6, "Expected target to be host object")
        updateChildren(v1, target, v5)
        return v1
    end
    return {
        mountVirtualTree = function(a1, p2, p3) -- Line: 424 -- upvalues: u37 (upval), Type (upval), p1 (val), InternalData (upval), mountVirtualNode (ref)
            local v1, v2
            if u37.typeChecks then
                local v3 = Type.of(a1)
                v2 = v3 == Type.Element
                assert(v2, "Expected arg #1 to be of type Element")
                v2 = p1.isHostObject(p2)
                if not v2 then
                    v2 = p2 == nil
                end
                assert(v2, "Expected arg #2 to be a host object")
            end
            if p3 ~= nil then
                v1 = p3
            else
                v1 = "RoactTree"
            end
            local v4 = {}
            v4[Type] = Type.VirtualTree
            v4[InternalData] = {mounted = true}
            v2 = v4[InternalData]
            v2.rootNode = mountVirtualNode(a1, p2, v1)
            return v4
        end,
        unmountVirtualTree = function(p1) -- Line: 455 -- upvalues: InternalData (upval), u37 (upval), Type (upval), unmountVirtualNode (ref)
            local v1 = p1[InternalData]
            if u37.typeChecks then
                local v2 = Type.of(p1)
                local v3 = v2 == Type.VirtualTree
                assert(v3, "Expected arg #1 to be a Roact handle")
                assert(v1.mounted, "Cannot unmounted a Roact tree that has already been unmounted")
            end
            v1.mounted = false
            if v1.rootNode ~= nil then
                unmountVirtualNode(v1.rootNode)
            end
        end,
        updateVirtualTree = function(p1, p2) -- Line: 473 -- upvalues: InternalData (upval), u37 (upval), Type (upval), updateVirtualNode (ref)
            local v1 = p1[InternalData]
            if u37.typeChecks then
                local v2 = Type.of(p1)
                local v3 = v2 == Type.VirtualTree
                assert(v3, "Expected arg #1 to be a Roact handle")
                v2 = Type.of(p2)
                v3 = v2 == Type.Element
                assert(v3, "Expected arg #2 to be a Roact Element")
            end
            v1.rootNode = updateVirtualNode(v1.rootNode, p2)
            return p1
        end,
        createVirtualNode = createVirtualNode,
        mountVirtualNode = mountVirtualNode,
        unmountVirtualNode = unmountVirtualNode,
        updateVirtualNode = updateVirtualNode,
        updateVirtualNodeWithChildren = function(p1, p2, p3) -- Line: 143 -- upvalues: updateChildren (val)
            updateChildren(p1, p2, p3)
        end,
        updateVirtualNodeWithRenderResult = updateVirtualNodeWithRenderResult,
    }
end