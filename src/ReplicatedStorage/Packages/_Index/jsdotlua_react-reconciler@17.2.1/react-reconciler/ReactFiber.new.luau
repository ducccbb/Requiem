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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiber.new
--                               Dumped in 0.00339 seconds
--                          Bytecode version 9  |  23 functions

local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Array = v1.Array
local inspect = v1.util.inspect
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local enableProfilerTimer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local Placement = ReactFiberFlags.Placement
local StaticMask = ReactFiberFlags.StaticMask
local ConcurrentRoot = ReactRootTags.ConcurrentRoot
local BlockingRoot = ReactRootTags.BlockingRoot
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local ForwardRef = ReactWorkTags.ForwardRef
local Fragment = ReactWorkTags.Fragment
local Mode = ReactWorkTags.Mode
local ContextProvider = ReactWorkTags.ContextProvider
local ContextConsumer = ReactWorkTags.ContextConsumer
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local DehydratedFragment = ReactWorkTags.DehydratedFragment
local FunctionComponent = ReactWorkTags.FunctionComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local isDevToolsPresent = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).isDevToolsPresent
local v2 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local resolveClassForHotReloading = v2.resolveClassForHotReloading
local resolveFunctionForHotReloading = v2.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = v2.resolveForwardRefForHotReloading
local NoLanes = ReactFiberLane.NoLanes
local NoMode = ReactTypeOfMode.NoMode
local ConcurrentMode = ReactTypeOfMode.ConcurrentMode
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local ProfileMode = ReactTypeOfMode.ProfileMode
local StrictMode = ReactTypeOfMode.StrictMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_OFFSCREEN_TYPE = ReactSymbols.REACT_OFFSCREEN_TYPE
local REACT_LEGACY_HIDDEN_TYPE = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE
local createFiberFromProfiler = nil
local createFiberFromFragment = nil
local createFiberFromSuspense = nil
local createFiberFromOffscreen = nil
local createFiberFromLegacyHidden = nil
local u216 = 1
local function createFiber(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 164 -- upvalues: NoFlags (val), NoLanes (val), enableProfilerTimer (val), __DEV__ (val), u216 (ref)
    local v1
    local v2 = {
        index = 1,
        tag = p1,
        key = p3,
        elementType = p5,
        type = p6,
        stateNode = p7,
        pendingProps = p2,
        mode = p4,
        flags = NoFlags,
        subtreeFlags = NoFlags,
    }
    if not p8 then
        v1 = NoLanes
    else
        v1 = p8
    end
    v2.lanes = v1
    v2.childLanes = NoLanes
    if enableProfilerTimer then
        v2.actualDuration = 0
        v2.actualStartTime = -1
        v2.selfBaseDuration = 0
        v2.treeBaseDuration = 0
    end
    if __DEV__ then
        v2._debugID = u216
        u216 = u216 + 1
        v2._debugSource = nil
        v2._debugOwner = nil
        v2._debugNeedsRemount = false
        v2._debugHookTypes = nil
    end
    return v2
end
function _shouldConstruct(p1) -- Line: 264
    local v1 = if type(p1) ~= "function" then not not p1.isReactComponent else false
    return v1
end
local function createFiberFromTypeAndProps(p1, p2, p3, p4, p5, p6) -- Line: 502 -- upvalues: IndeterminateComponent (val), __DEV__ (val), resolveFunctionForHotReloading (val), ClassComponent (val), resolveClassForHotReloading (val), HostComponent (val), REACT_FRAGMENT_TYPE (val), createFiberFromFragment (ref), REACT_DEBUG_TRACING_MODE_TYPE (val), Mode (val), DebugTracingMode (val), REACT_STRICT_MODE_TYPE (val), StrictMode (val), REACT_PROFILER_TYPE (val), createFiberFromProfiler (ref), REACT_SUSPENSE_TYPE (val), createFiberFromSuspense (ref), REACT_OFFSCREEN_TYPE (val), createFiberFromOffscreen (ref), REACT_LEGACY_HIDDEN_TYPE (val), createFiberFromLegacyHidden (ref), REACT_PROVIDER_TYPE (val), ContextProvider (val), REACT_CONTEXT_TYPE (val), ContextConsumer (val), REACT_FORWARD_REF_TYPE (val), ForwardRef (val), resolveForwardRefForHotReloading (val), REACT_MEMO_TYPE (val), MemoComponent (val), REACT_LAZY_TYPE (val), LazyComponent (val), Object (val), inspect (val), getComponentName (val), Array (val), REACT_ELEMENT_TYPE (val), invariant (val), createFiber (val)
    local v1, v2
    local v3 = IndeterminateComponent
    local v4 = p1
    local v5 = type(p1)
    if v5 == "function" then
        if not __DEV__ then
            v1 = p5
        else
            v4 = resolveFunctionForHotReloading(v4)
            v1 = p5
        end
        v2 = createFiber(v3, p3, p2, v1, p1, v4, nil, p6)
        if __DEV__ then
            v2._debugOwner = p4
        end
        return v2
    end
    if v5 ~= "table" then
        if v5 == "string" then
            v2 = createFiber(HostComponent, p3, p2, p5, p1, v4, nil, p6)
            if __DEV__ then
                v2._debugOwner = p4
            end
            return v2
        end
        if p1 == REACT_FRAGMENT_TYPE then
            return createFiberFromFragment(p3.children, p5, p6, p2)
        end
        if p1 == REACT_DEBUG_TRACING_MODE_TYPE then
            v1 = bit32.bor(p5, DebugTracingMode)
            v2 = createFiber(Mode, p3, p2, v1, p1, v4, nil, p6)
            if __DEV__ then
                v2._debugOwner = p4
            end
            return v2
        end
        if p1 == REACT_STRICT_MODE_TYPE then
            v1 = bit32.bor(p5, StrictMode)
            v2 = createFiber(Mode, p3, p2, v1, p1, v4, nil, p6)
            if __DEV__ then
                v2._debugOwner = p4
            end
            return v2
        end
        if p1 == REACT_PROFILER_TYPE then
            return createFiberFromProfiler(p3, p5, p6, p2)
        end
        if p1 == REACT_SUSPENSE_TYPE then
            return createFiberFromSuspense(p3, p5, p6, p2)
        end
        if p1 == REACT_OFFSCREEN_TYPE then
            return createFiberFromOffscreen(p3, p5, p6, p2)
        end
        if p1 == REACT_LEGACY_HIDDEN_TYPE then
            return createFiberFromLegacyHidden(p3, p5, p6, p2)
        end
        v2 = false
        local v6 = nil
        if v5 == "table" then
            v6 = p1["$$typeof"]
            if v6 == REACT_PROVIDER_TYPE then
                v3 = ContextProvider
                v2 = true
            elseif v6 == REACT_CONTEXT_TYPE then
                v3 = ContextConsumer
                v2 = true
            elseif v6 == REACT_FORWARD_REF_TYPE then
                v3 = ForwardRef
                if __DEV__ then
                    v4 = resolveForwardRefForHotReloading(v4)
                end
                v2 = true
            elseif v6 == REACT_MEMO_TYPE then
                v3 = MemoComponent
                v2 = true
            elseif v6 == REACT_LAZY_TYPE then
                v3 = LazyComponent
                v4 = nil
                v2 = true
            end
        end
        if v2 then
            v1 = p5
        else
            local v7
            local v8 = ""
            if __DEV__ then
                if p1 == nil then
                    v8 = v8 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
                elseif v5 ~= "table" then
                    if p1 ~= nil and v5 == "table" then
                        v8 = v8 .. "\n" .. inspect(p1)
                    end
                elseif #Object.keys(p1) ~= 0 then
                end
                v7 = if p4 then getComponentName(p4.type) else nil
                if v7 == nil then
                    if p4 then
                        v8 = v8 .. "\n" .. inspect(p4)
                    end
                elseif v7 ~= "" then
                    v8 = v8 .. "\n\nCheck the render method of `" .. v7 .. "`."
                end
            end
            if p1 == nil then
                v7 = "nil"
            elseif Array.isArray(p1) then
                v7 = "array"
            elseif v5 ~= "table" then
                v7 = v5
            elseif v6 ~= REACT_ELEMENT_TYPE then
                v7 = v5
            else
                v7 = string.format("<%s />", getComponentName(p1.type) or "Unknown")
                v8 = " Did you accidentally export a JSX literal or Element instead of a component?"
            end
            invariant(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v7, v8)
            v1 = p5
        end
        v2 = createFiber(v3, p3, p2, v1, p1, v4, nil, p6)
        if __DEV__ then
            v2._debugOwner = p4
        end
        return v2
    elseif p1.isReactComponent then
        if not __DEV__ then
            v1 = p5
        else
            v4 = resolveClassForHotReloading(v4)
            v1 = p5
        end
        v2 = createFiber(ClassComponent, p3, p2, v1, p1, v4, nil, p6)
        if __DEV__ then
            v2._debugOwner = p4
        end
        return v2
    end
end
function createFiberFromFragment(p1, p2, p3, p4) -- Line: 684 -- upvalues: createFiber (val), Fragment (val)
    return (createFiber(Fragment, p1, p4, p2, nil, nil, nil, p3))
end
local function createFiberFromScope(p1, p2, p3, p4, p5) -- Line: 722 -- upvalues: createFiber (val), ScopeComponent (val)
    return (createFiber(ScopeComponent, p2, p5, p3, p1, p1, nil, p4))
end
function createFiberFromProfiler(p1, p2, p3, p4) -- Line: 739 -- upvalues: __DEV__ (val), console (val), createFiber (val), Profiler (val), ProfileMode (val), REACT_PROFILER_TYPE (val), enableProfilerTimer (val)
    local v1
    if __DEV__ and typeof(p1.id) ~= "string" then
        console.error("Profiler must specify an \"id\" as a prop")
    end
    local v2 = bit32.bor(p2, ProfileMode)
    if not enableProfilerTimer then
        v1 = nil
    else
        v1 = {effectDuration = 0, passiveEffectDuration = 0}
    end
    return (createFiber(Profiler, p1, p4, v2, REACT_PROFILER_TYPE, REACT_PROFILER_TYPE, v1, p3))
end
function createFiberFromSuspense(p1, p2, p3, p4) -- Line: 783 -- upvalues: createFiber (val), SuspenseComponent (val), REACT_SUSPENSE_TYPE (val)
    return (createFiber(SuspenseComponent, p1, p4, p2, REACT_SUSPENSE_TYPE, REACT_SUSPENSE_TYPE, nil, p3))
end
function createFiberFromOffscreen(p1, p2, p3, p4) -- Line: 841 -- upvalues: createFiber (val), OffscreenComponent (val), REACT_OFFSCREEN_TYPE (val), __DEV__ (val)
    local v1
    if not __DEV__ then
        v1 = nil
    else
        v1 = REACT_OFFSCREEN_TYPE
    end
    return (createFiber(OffscreenComponent, p1, p4, p2, REACT_OFFSCREEN_TYPE, v1, nil, p3))
end
function createFiberFromLegacyHidden(p1, p2, p3, p4) -- Line: 870 -- upvalues: createFiber (val), LegacyHiddenComponent (val), REACT_LEGACY_HIDDEN_TYPE (val), __DEV__ (val)
    local v1
    if not __DEV__ then
        v1 = nil
    else
        v1 = REACT_LEGACY_HIDDEN_TYPE
    end
    return (createFiber(LegacyHiddenComponent, p1, p4, p2, REACT_LEGACY_HIDDEN_TYPE, v1, nil, p3))
end
return {
    isSimpleFunctionComponent = function(p1) -- Line: 271
        local v1 = type(p1) == "function"
        return v1
    end,
    resolveLazyComponentTag = function(p1) -- Line: 279 -- upvalues: FunctionComponent (val), ClassComponent (val), REACT_FORWARD_REF_TYPE (val), ForwardRef (val), REACT_MEMO_TYPE (val), MemoComponent (val), IndeterminateComponent (val)
        local v1 = typeof(p1)
        if v1 == "function" then
            return FunctionComponent
        end
        if v1 ~= "table" then
            return IndeterminateComponent
        end
        if p1.isReactComponent then
            return ClassComponent
        end
        local v2 = p1["$$typeof"]
        if v2 == REACT_FORWARD_REF_TYPE then
            return ForwardRef
        end
        if v2 == REACT_MEMO_TYPE then
            return MemoComponent
        end
        return IndeterminateComponent
    end,
    createWorkInProgress = function(p1, p2) -- Line: 302 -- upvalues: createFiber (val), __DEV__ (val), NoFlags (val), enableProfilerTimer (val), StaticMask (val), IndeterminateComponent (val), FunctionComponent (val), SimpleMemoComponent (val), resolveFunctionForHotReloading (val), ClassComponent (val), resolveClassForHotReloading (val), ForwardRef (val), resolveForwardRefForHotReloading (val)
        local alternate = p1.alternate
        if alternate ~= nil then
            alternate.pendingProps = p2
            alternate.type = p1.type
            alternate.flags = NoFlags
            alternate.subtreeFlags = NoFlags
            alternate.deletions = nil
            if enableProfilerTimer then
                alternate.actualDuration = 0
                alternate.actualStartTime = -1
            end
        else
            alternate = createFiber(p1.tag, p2, p1.key, p1.mode, p1.elementType, p1.type, p1.stateNode)
            if __DEV__ then
                alternate._debugID = p1._debugID
                alternate._debugSource = p1._debugSource
                alternate._debugOwner = p1._debugOwner
                alternate._debugHookTypes = p1._debugHookTypes
            end
            alternate.alternate = p1
            p1.alternate = alternate
        end
        alternate.flags = bit32.band(p1.flags, StaticMask)
        alternate.childLanes = p1.childLanes
        alternate.lanes = p1.lanes
        alternate.child = p1.child
        alternate.memoizedProps = p1.memoizedProps
        alternate.memoizedState = p1.memoizedState
        alternate.updateQueue = p1.updateQueue
        local dependencies = p1.dependencies
        if dependencies ~= nil then
            alternate.dependencies = {lanes = dependencies.lanes, firstContext = dependencies.firstContext}
        else
            alternate.dependencies = nil
        end
        alternate.sibling = p1.sibling
        alternate.index = p1.index
        alternate.ref = p1.ref
        if enableProfilerTimer then
            alternate.selfBaseDuration = p1.selfBaseDuration
            alternate.treeBaseDuration = p1.treeBaseDuration
        end
        if not __DEV__ then
            return alternate
        end
        alternate._debugNeedsRemount = p1._debugNeedsRemount
        if alternate.tag == IndeterminateComponent or alternate.tag == FunctionComponent or alternate.tag == SimpleMemoComponent then
            alternate.type = resolveFunctionForHotReloading(p1.type)
            return alternate
        end
        if alternate.tag == ClassComponent then
            alternate.type = resolveClassForHotReloading(p1.type)
            return alternate
        end
        if alternate.tag == ForwardRef then
            alternate.type = resolveForwardRefForHotReloading(p1.type)
        end
        return alternate
    end,
    resetWorkInProgress = function(p1, p2) -- Line: 406 -- upvalues: StaticMask (val), Placement (val), NoLanes (val), NoFlags (val), enableProfilerTimer (val)
        p1.flags = bit32.band(p1.flags, (bit32.bor(StaticMask, Placement)))
        local alternate = p1.alternate
        if alternate == nil then
            p1.childLanes = NoLanes
            p1.lanes = p2
            p1.child = nil
            p1.subtreeFlags = NoFlags
            p1.memoizedProps = nil
            p1.memoizedState = nil
            p1.updateQueue = nil
            p1.dependencies = nil
            p1.stateNode = nil
            if not enableProfilerTimer then
                return p1
            end
            p1.selfBaseDuration = 0
            p1.treeBaseDuration = 0
            return p1
        end
        p1.childLanes = alternate.childLanes
        p1.lanes = alternate.lanes
        p1.child = alternate.child
        p1.subtreeFlags = alternate.subtreeFlags
        p1.deletions = nil
        p1.memoizedProps = alternate.memoizedProps
        p1.memoizedState = alternate.memoizedState
        p1.updateQueue = alternate.updateQueue
        p1.type = alternate.type
        local dependencies = alternate.dependencies
        if dependencies ~= nil then
            p1.dependencies = {lanes = dependencies.lanes, firstContext = dependencies.firstContext}
        else
            p1.dependencies = nil
        end
        if enableProfilerTimer then
            p1.selfBaseDuration = alternate.selfBaseDuration
            p1.treeBaseDuration = alternate.treeBaseDuration
        end
        return p1
    end,
    createHostRootFiber = function(p1) -- Line: 481 -- upvalues: ConcurrentRoot (val), ConcurrentMode (val), BlockingMode (val), StrictMode (val), BlockingRoot (val), NoMode (val), enableProfilerTimer (val), isDevToolsPresent (val), ProfileMode (val), createFiber (val), HostRoot (val)
        local v1
        if p1 == ConcurrentRoot then
            v1 = bit32.bor(ConcurrentMode, BlockingMode, StrictMode)
        elseif p1 ~= BlockingRoot then
            v1 = NoMode
        else
            v1 = bit32.bor(BlockingMode, StrictMode)
        end
        if enableProfilerTimer and isDevToolsPresent() then
            v1 = bit32.bor(v1, ProfileMode)
        end
        return (createFiber(HostRoot, nil, nil, v1))
    end,
    createFiberFromTypeAndProps = createFiberFromTypeAndProps,
    createFiberFromElement = function(p1, p2, p3) -- Line: 656 -- upvalues: __DEV__ (val), createFiberFromTypeAndProps (val)
        local _owner
        _owner = if __DEV__ then p1._owner else nil
        local v1 = createFiberFromTypeAndProps(p1.type, p1.key, p1.props, _owner, p2, p3)
        if __DEV__ then
            v1._debugSource = p1._source
            v1._debugOwner = p1._owner
        end
        return v1
    end,
    createFiberFromFragment = createFiberFromFragment,
    createFiberFromFundamental = function(p1, p2, p3, p4, p5) -- Line: 697 -- upvalues: createFiber (val), FundamentalComponent (val)
        return (createFiber(FundamentalComponent, p2, p5, p3, p1, p1, nil, p4))
    end,
    createFiberFromSuspense = createFiberFromSuspense,
    createFiberFromSuspenseList = function(p1, p2, p3, p4) -- Line: 812 -- upvalues: createFiber (val), SuspenseListComponent (val), REACT_SUSPENSE_LIST_TYPE (val), __DEV__ (val)
        local v1
        if not __DEV__ then
            v1 = nil
        else
            v1 = REACT_SUSPENSE_LIST_TYPE
        end
        return (createFiber(SuspenseListComponent, p1, p4, p2, REACT_SUSPENSE_LIST_TYPE, v1, nil, p3))
    end,
    createFiberFromOffscreen = createFiberFromOffscreen,
    createFiberFromLegacyHidden = createFiberFromLegacyHidden,
    createFiberFromText = function(p1, p2, p3) -- Line: 899 -- upvalues: createFiber (val), HostText (val)
        return (createFiber(HostText, p1, nil, p2, nil, nil, nil, p3))
    end,
    createFiberFromHostInstanceForDeletion = function() -- Line: 907 -- upvalues: createFiber (val), HostComponent (val), NoMode (val)
        return (createFiber(HostComponent, nil, nil, NoMode, "DELETED", "DELETED"))
    end,
    createFiberFromDehydratedFragment = function(p1) -- Line: 917 -- upvalues: createFiber (val), DehydratedFragment (val), NoMode (val)
        return (createFiber(DehydratedFragment, nil, nil, NoMode, nil, nil, p1))
    end,
    createFiberFromPortal = function(p1, p2, p3) -- Line: 926 -- upvalues: createFiber (val), HostPortal (val)
        local children
        if p1.children == nil then
            children = {}
        else
            children = p1.children
        end
        local v1 = {containerInfo = p1.containerInfo, implementation = p1.implementation}
        return (createFiber(HostPortal, children, p1.key, p2, nil, nil, v1, p3))
    end,
    assignFiberPropertiesInDEV = function(p1, p2) -- Line: 950 -- upvalues: createFiber (val), IndeterminateComponent (val), NoMode (val), enableProfilerTimer (val)
        local v1
        if p1 ~= nil then
            v1 = p1
        else
            v1 = createFiber(IndeterminateComponent, nil, nil, NoMode)
        end
        v1.tag = p2.tag
        v1.key = p2.key
        v1.elementType = p2.elementType
        v1.type = p2.type
        v1.stateNode = p2.stateNode
        v1.return_ = p2.return_
        v1.child = p2.child
        v1.sibling = p2.sibling
        v1.index = p2.index
        v1.ref = p2.ref
        v1.pendingProps = p2.pendingProps
        v1.memoizedProps = p2.memoizedProps
        v1.updateQueue = p2.updateQueue
        v1.memoizedState = p2.memoizedState
        v1.dependencies = p2.dependencies
        v1.mode = p2.mode
        v1.flags = p2.flags
        v1.subtreeFlags = p2.subtreeFlags
        v1.deletions = p2.deletions
        v1.lanes = p2.lanes
        v1.childLanes = p2.childLanes
        v1.alternate = p2.alternate
        if enableProfilerTimer then
            v1.actualDuration = p2.actualDuration
            v1.actualStartTime = p2.actualStartTime
            v1.selfBaseDuration = p2.selfBaseDuration
            v1.treeBaseDuration = p2.treeBaseDuration
        end
        v1._debugID = p2._debugID
        v1._debugSource = p2._debugSource
        v1._debugOwner = p2._debugOwner
        v1._debugNeedsRemount = p2._debugNeedsRemount
        v1._debugHookTypes = p2._debugHookTypes
        return v1
    end,
}