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
--  File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createReconciler
--                               Dumped in 0.00204 seconds
--                          Bytecode version 9  |  19 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Type = require(v1.Parent.Type)
local ElementKind = require(v1.Parent.ElementKind)
local ElementUtils = require(v1.Parent.ElementUtils)
local Children = require(v1.Parent.PropMarkers.Children)
local Symbol = require(v1.Parent.Symbol)
local internalAssert = require(v1.Parent.internalAssert)
local u42 = require(v1.Parent.GlobalConfig).get()
local InternalData = Symbol.named("InternalData")
return function(p1) -- Line: 31 -- upvalues: u42 (val), internalAssert (val), Type (val), ElementUtils (val), ElementKind (val), Children (val), InternalData (val)
    local u1 = nil
    local mountVirtualNode = nil
    local updateVirtualNode = nil
    local unmountVirtualNode = nil
    local function replaceVirtualNode(p1, p2) -- Line: 43 -- upvalues: unmountVirtualNode (ref), mountVirtualNode (ref)
        local originalContext = p1.originalContext
        if not originalContext then
            originalContext = p1.context
        end
        unmountVirtualNode(p1)
        local v1 = mountVirtualNode(p2, p1.hostParent, p1.hostKey, originalContext, p1.parentLegacyContext)
        if v1 ~= nil then
            v1.depth = p1.depth
        end
        return v1
    end
    local function updateChildren(p1, p2, p3) -- Line: 69 -- upvalues: u42 (upval), internalAssert (upval), Type (upval), ElementUtils (upval), updateVirtualNode (ref), mountVirtualNode (ref)
        local hostKey, v1, v2
        if u42.internalTypeChecks then
            local v3 = Type.of(p1)
            local v4 = v3 == Type.VirtualNode
            internalAssert(v4, "Expected arg #1 to be of type VirtualNode")
        end
        local v5 = {}
        for k, v in pairs(p1.children) do
            v2 = ElementUtils.getElementByKey(p3, k)
            v1 = updateVirtualNode(v, v2)
            if v1 == nil then
                v5[k] = true
            else
                p1.children[k] = v1
            end
        end
        for k2 in pairs(v5) do
            p1.children[k2] = nil
        end
        local v6 = p1
        for i, j in ElementUtils.iterateElements(p3) do
            hostKey = if i == ElementUtils.UseParentKey then v6.hostKey else i
            if v6.children[i] == nil then
                v1 = mountVirtualNode(j, v7, hostKey, v6.context, v6.legacyContext)
                if v1 ~= nil then
                    v1.depth = v6.depth + 1
                    v6.children[i] = v1
                end
            end
        end
    end
    local function updateVirtualNodeWithChildren(p1, p2, p3) -- Line: 117 -- upvalues: updateChildren (val)
        updateChildren(p1, p2, p3)
    end
    local function updateVirtualNodeWithRenderResult(p1, p2, p3) -- Line: 121 -- upvalues: Type (upval), updateChildren (val)
        local v1 = Type.of(p3)
        if v1 == Type.Element or p3 == nil or typeof(p3) == "boolean" then
            updateChildren(p1, p2, p3)
            return
        end
        local v2 = ("%s\n%s"):format("Component returned invalid children:", p1.currentElement.source or "<enable element tracebacks>")
        error(v2, 0)
    end
    function unmountVirtualNode(a1) -- Line: 138 -- upvalues: u42 (upval), internalAssert (upval), Type (upval), ElementKind (upval), p1 (val), u1 (ref), unmountVirtualNode (ref)
        if u42.internalTypeChecks then
            local v1 = Type.of(a1)
            local v2 = v1 == Type.VirtualNode
            internalAssert(v2, "Expected arg #1 to be of type VirtualNode")
        end
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
        local v4 = tostring(v3)
        error(("Unknown ElementKind %q"):format(v4, 2))
    end
    local function updateFunctionVirtualNode(p1, p2) -- Line: 166 -- upvalues: updateVirtualNodeWithRenderResult (val)
        local v1 = p2.component(p2.props)
        updateVirtualNodeWithRenderResult(p1, p1.hostParent, v1)
        return p1
    end
    local function updatePortalVirtualNode(a1, p2) -- Line: 174 -- upvalues: p1 (val), replaceVirtualNode (val), Children (upval), updateVirtualNodeWithChildren (val)
        local target = p2.props.target
        local v1 = p1.isHostObject(target)
        assert(v1, "Expected target to be host object")
        if target ~= a1.currentElement.props.target then
            return replaceVirtualNode(a1, p2)
        end
        updateVirtualNodeWithChildren(a1, target, p2.props[Children])
        return a1
    end
    local function updateFragmentVirtualNode(p1, p2) -- Line: 193 -- upvalues: updateVirtualNodeWithChildren (val)
        updateVirtualNodeWithChildren(p1, p1.hostParent, p2.elements)
        return p1
    end
    function updateVirtualNode(a1, p2, p3) -- Line: 211 -- upvalues: u42 (upval), internalAssert (upval), Type (upval), unmountVirtualNode (ref), replaceVirtualNode (val), ElementKind (upval), p1 (val), u1 (ref), updateFunctionVirtualNode (val), updatePortalVirtualNode (val), updateFragmentVirtualNode (val)
        local v1, v2
        if u42.internalTypeChecks then
            v2 = Type.of(a1)
            v1 = v2 == Type.VirtualNode
            internalAssert(v1, "Expected arg #1 to be of type VirtualNode")
        end
        if u42.typeChecks then
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
                return replaceVirtualNode(a1, p2)
            end
            local v4 = ElementKind.of(p2)
            v1 = true
            if v4 == ElementKind.Host then
                v3 = p1.updateHostNode(u1, a1, p2)
            elseif v4 == ElementKind.Function then
                v3 = updateFunctionVirtualNode(a1, p2)
            elseif v4 == ElementKind.Stateful then
                v1 = a1.instance:__update(p2, p3)
                v3 = a1
            elseif v4 == ElementKind.Portal then
                v3 = updatePortalVirtualNode(a1, p2)
            elseif v4 ~= ElementKind.Fragment then
                local v5 = tostring(v4)
                error(("Unknown ElementKind %q"):format(v5, 2))
                v3 = a1
            else
                v3 = updateFragmentVirtualNode(a1, p2)
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
    local function createVirtualNode(a1, p2, p3, p4, p5) -- Line: 268 -- upvalues: u42 (upval), internalAssert (upval), p1 (val), Type (upval)
        local v1
        if u42.internalTypeChecks then
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
        if u42.typeChecks then
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
        v3.children = {}
        v3.hostParent = p2
        v3.hostKey = p3
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
    local function mountFunctionVirtualNode(p1) -- Line: 310 -- upvalues: updateVirtualNodeWithRenderResult (val)
        local currentElement = p1.currentElement
        local v1 = currentElement.component(currentElement.props)
        updateVirtualNodeWithRenderResult(p1, p1.hostParent, v1)
    end
    local function mountPortalVirtualNode(a1) -- Line: 318 -- upvalues: Children (upval), p1 (val), updateVirtualNodeWithChildren (val)
        local currentElement = a1.currentElement
        local target = currentElement.props.target
        local v1 = currentElement.props[Children]
        local v2 = p1.isHostObject(target)
        assert(v2, "Expected target to be host object")
        updateVirtualNodeWithChildren(a1, target, v1)
    end
    local function mountFragmentVirtualNode(p1) -- Line: 329 -- upvalues: updateVirtualNodeWithChildren (val)
        updateVirtualNodeWithChildren(p1, p1.hostParent, p1.currentElement.elements)
    end
    function mountVirtualNode(a1, p2, p3, p4, p5) -- Line: 340 -- upvalues: u42 (upval), internalAssert (upval), p1 (val), Type (upval), ElementKind (upval), createVirtualNode (val), u1 (ref), mountFunctionVirtualNode (val), mountPortalVirtualNode (val), mountFragmentVirtualNode (val)
        local v1
        if u42.internalTypeChecks then
            v1 = p1.isHostObject(p2)
            if not v1 then
                v1 = p2 == nil
            end
            internalAssert(v1, "Expected arg #2 to be a host object")
            v1 = if typeof(p5) ~= "table" then p5 == nil else true
            internalAssert(v1, "Expected arg #5 to be of type table or nil")
        end
        if u42.typeChecks then
            v1 = p3 ~= nil
            assert(v1, "Expected arg #3 to be non-nil")
            v1 = true
            local v2 = Type.of(a1)
            if v2 ~= Type.Element then
                v1 = typeof(a1) == "boolean"
            end
            assert(v1, "Expected arg #1 to be of type Element or boolean")
        end
        if typeof(a1) == "boolean" then
            return nil
        end
        local v3 = ElementKind.of(a1)
        v1 = createVirtualNode(a1, p2, p3, p4, p5)
        if v3 == ElementKind.Host then
            p1.mountHostNode(u1, v1)
            return v1
        end
        if v3 == ElementKind.Function then
            mountFunctionVirtualNode(v1)
            return v1
        end
        if v3 == ElementKind.Stateful then
            a1.component:__mount(u1, v1)
            return v1
        end
        if v3 == ElementKind.Portal then
            mountPortalVirtualNode(v1)
            return v1
        end
        if v3 == ElementKind.Fragment then
            mountFragmentVirtualNode(v1)
            return v1
        end
        local v4 = tostring(v3)
        error(("Unknown ElementKind %q"):format(v4, 2))
        return v1
    end
    return {
        mountVirtualTree = function(a1, p2, p3) -- Line: 386 -- upvalues: u42 (upval), Type (upval), p1 (val), InternalData (upval), mountVirtualNode (ref)
            local v1, v2
            if u42.typeChecks then
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
        unmountVirtualTree = function(p1) -- Line: 417 -- upvalues: InternalData (upval), u42 (upval), Type (upval), unmountVirtualNode (ref)
            local v1 = p1[InternalData]
            if u42.typeChecks then
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
        updateVirtualTree = function(p1, p2) -- Line: 435 -- upvalues: InternalData (upval), u42 (upval), Type (upval), updateVirtualNode (ref)
            local v1 = p1[InternalData]
            if u42.typeChecks then
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
        updateVirtualNodeWithChildren = updateVirtualNodeWithChildren,
        updateVirtualNodeWithRenderResult = updateVirtualNodeWithRenderResult,
    }
end