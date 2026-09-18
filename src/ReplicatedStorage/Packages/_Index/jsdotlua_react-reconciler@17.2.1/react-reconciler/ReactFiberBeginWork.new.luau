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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberBeginWork.new
--                               Dumped in 0.0251 seconds
--                          Bytecode version 9  |  49 functions

local function unimplemented(p1) -- Line: 14
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(p1))
    error("FIXME (roblox): " .. p1 .. " is unimplemented", 2)
end
local __DEV__ = _G.__DEV__
local __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local __COMPAT_WARNINGS__ = _G.__COMPAT_WARNINGS__
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local inspect = v1.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FunctionComponent = ReactWorkTags.FunctionComponent
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
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local v3 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = v3.NoFlags
local StaticMask = v3.StaticMask
local PerformedWork = v3.PerformedWork
local Placement = v3.Placement
local Hydrating = v3.Hydrating
local ContentReset = v3.ContentReset
local DidCapture = v3.DidCapture
local Ref = v3.Ref
local Deletion = v3.Deletion
local ForceUpdateForLegacySuspense = v3.ForceUpdateForLegacySuspense
local v4 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = v4.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = v4.disableLegacyContext
local disableModulePatternComponents = v4.disableModulePatternComponents
local enableProfilerTimer = v4.enableProfilerTimer
local enableSchedulerTracing = v4.enableSchedulerTracing
local enableSuspenseServerRenderer = v4.enableSuspenseServerRenderer
local warnAboutDefaultPropsOnFunctionComponents = v4.warnAboutDefaultPropsOnFunctionComponents
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local shallowEqual = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v5 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_LAZY_TYPE = v5.REACT_LAZY_TYPE
local u230 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local v6 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local getCurrentFiberOwnerNameInDevOrNull = v6.getCurrentFiberOwnerNameInDevOrNull
local setIsRendering = v6.setIsRendering
local v7 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local resolveFunctionForHotReloading = v7.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = v7.resolveForwardRefForHotReloading
local resolveClassForHotReloading = v7.resolveClassForHotReloading
local v8 = require(script.Parent:WaitForChild("ReactChildFiber.new"))
local mountChildFibers = v8.mountChildFibers
local reconcileChildFibers = v8.reconcileChildFibers
local cloneChildFibers = v8.cloneChildFibers
local v9 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local processUpdateQueue = v9.processUpdateQueue
local cloneUpdateQueue = v9.cloneUpdateQueue
local initializeUpdateQueue = v9.initializeUpdateQueue
local v10 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ConcurrentMode = v10.ConcurrentMode
local NoMode = v10.NoMode
local ProfileMode = v10.ProfileMode
local StrictMode = v10.StrictMode
local BlockingMode = v10.BlockingMode
local v11 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local shouldSetTextContent = v11.shouldSetTextContent
local isSuspenseInstancePending = v11.isSuspenseInstancePending
local isSuspenseInstanceFallback = v11.isSuspenseInstanceFallback
local registerSuspenseInstanceRetry = v11.registerSuspenseInstanceRetry
local supportsHydration = v11.supportsHydration
local v12 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local pushHostContext = v12.pushHostContext
local pushHostContainer = v12.pushHostContainer
local suspenseStackCursor = v2.suspenseStackCursor
local hasSuspenseContext = v2.hasSuspenseContext
local ForceSuspenseFallback = v2.ForceSuspenseFallback
local addSubtreeSuspenseContext = v2.addSubtreeSuspenseContext
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local pushSuspenseContext = v2.pushSuspenseContext
local setDefaultShallowSuspenseContext = v2.setDefaultShallowSuspenseContext
local v13 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
local propagateContextChange = v13.propagateContextChange
local readContext = v13.readContext
local calculateChangedBits = v13.calculateChangedBits
local prepareToReadContext = v13.prepareToReadContext
local pushProvider = v13.pushProvider
local u330 = {}
local function shouldSuspend(p1) -- Line: 185 -- upvalues: u330 (val)
    if not u330.shouldSuspendRef then
        u330.shouldSuspendRef = require(script.Parent:WaitForChild("ReactFiberReconciler")).shouldSuspend
    end
    return u330.shouldSuspendRef(p1)
end
local function initReactFiberHooks() -- Line: 193 -- upvalues: u330 (val)
    local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
    u330.renderWithHooksRef = v1.renderWithHooks
    u330.bailoutHooksRef = v1.bailoutHooks
end
local function renderWithHooks(...) -- Line: 200 -- upvalues: u330 (val)
    if not u330.renderWithHooksRef then
        local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u330.renderWithHooksRef = v1.renderWithHooks
        u330.bailoutHooksRef = v1.bailoutHooks
    end
    return u330.renderWithHooksRef(...)
end
local function bailoutHooks(...) -- Line: 208 -- upvalues: u330 (val)
    if not u330.bailoutHooksRef then
        local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u330.renderWithHooksRef = v1.renderWithHooks
        u330.bailoutHooksRef = v1.bailoutHooks
    end
    return u330.bailoutHooksRef(...)
end
local stopProfilerTimerIfRunning = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).stopProfilerTimerIfRunning
local v14 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local getMaskedContext = v14.getMaskedContext
local getUnmaskedContext = v14.getUnmaskedContext
local hasContextChanged = v14.hasContextChanged
local pushContextProvider = v14.pushContextProvider
local isContextProvider = v14.isContextProvider
local pushTopLevelContextObject = v14.pushTopLevelContextObject
local invalidateContextProvider = v14.invalidateContextProvider
local v15 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local resetHydrationState = v15.resetHydrationState
local enterHydrationState = v15.enterHydrationState
local reenterHydrationStateFromDehydratedSuspenseInstance = v15.reenterHydrationStateFromDehydratedSuspenseInstance
local tryToClaimNextHydratableInstance = v15.tryToClaimNextHydratableInstance
local warnIfHydrating = v15.warnIfHydrating
local v16 = require(script.Parent:WaitForChild("ReactFiberClassComponent.new"))
local adoptClassInstance = v16.adoptClassInstance
local applyDerivedStateFromProps = v16.applyDerivedStateFromProps
local constructClassInstance = v16.constructClassInstance
local mountClassInstance = v16.mountClassInstance
local resumeMountClassInstance = v16.resumeMountClassInstance
local updateClassInstance = v16.updateClassInstance
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v17 = require(script.Parent:WaitForChild("ReactFiber.new"))
local resolveLazyComponentTag = v17.resolveLazyComponentTag
local createFiberFromFragment = v17.createFiberFromFragment
local createFiberFromOffscreen = v17.createFiberFromOffscreen
local createFiberFromTypeAndProps = v17.createFiberFromTypeAndProps
local isSimpleFunctionComponent = v17.isSimpleFunctionComponent
local createWorkInProgress = v17.createWorkInProgress
local v18 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local pushRenderLanes = v18.pushRenderLanes
local markSpawnedWork = v18.markSpawnedWork
local retryDehydratedSuspenseBoundary = v18.retryDehydratedSuspenseBoundary
local scheduleUpdateOnFiber = v18.scheduleUpdateOnFiber
local renderDidSuspendDelayIfPossible = v18.renderDidSuspendDelayIfPossible
local getWorkInProgressRoot = v18.getWorkInProgressRoot
local getExecutionContext = v18.getExecutionContext
local RetryAfterError = v18.RetryAfterError
local NoContext = v18.NoContext
local u426 = nil
local setWorkInProgressVersion = require(script.Parent:WaitForChild("ReactMutableSource.new")).setWorkInProgressVersion
local markSkippedUpdateLanes = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local v19 = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = v19.disableLogs
local reenableLogs = v19.reenableLogs
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local u458 = {}
local bailoutOnAlreadyFinishedWork = nil
local updateFunctionComponent = nil
local u461 = false
local u462 = {
    didWarnAboutBadClass = {},
    didWarnAboutModulePatternComponent = {},
    didWarnAboutContextTypeOnFunctionComponent = {},
    didWarnAboutGetDerivedStateOnFunctionComponent = {},
    didWarnAboutFunctionRefs = {},
    didWarnAboutDefaultPropsOnFunctionComponent = {},
}
local updateSimpleMemoComponent = nil
if __DEV__ then
    u462.didWarnAboutBadClass = {}
    u462.didWarnAboutModulePatternComponent = {}
    u462.didWarnAboutContextTypeOnFunctionComponent = {}
    u462.didWarnAboutGetDerivedStateOnFunctionComponent = {}
    u462.didWarnAboutFunctionRefs = {}
    u458.didWarnAboutReassigningProps = false
    u462.didWarnAboutDefaultPropsOnFunctionComponent = {}
end
local function v20(p1, p2, p3, p4) -- Line: 307 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    if p1 == nil then
        p2.child = mountChildFibers(p2, nil, p3, p4)
        return
    end
    p2.child = reconcileChildFibers(p2, p1.child, p3, p4)
end
local function forceUnmountCurrentAndReconcile(p1, p2, p3, p4) -- Line: 336 -- upvalues: reconcileChildFibers (val)
    p2.child = reconcileChildFibers(p2, p1.child, nil, p4)
    p2.child = reconcileChildFibers(p2, nil, p3, p4)
end
local function updateForwardRef(p1, p2, p3, p4, p5) -- Line: 360 -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), prepareToReadContext (val), u458 (val), ReactCurrentOwner (val), setIsRendering (val), renderWithHooks (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), u461 (ref), bailoutHooks (val), bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), mountChildFibers (val), reconcileChildFibers (val)
    local v1, v2
    if __DEV__ then
        if p2.type ~= p2.elementType then
            local propTypes = p3.propTypes
            local validateProps = p3.validateProps
            if propTypes then
                checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
            elseif not validateProps then
            end
        end
    elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
    local render = p3.render
    local ref = p2.ref
    prepareToReadContext(p2, p5, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(p1, p2, render, p4, ref, p5)
    else
        ReactCurrentOwner.current = p2
        setIsRendering(true)
        v1 = renderWithHooks(p1, p2, render, p4, ref, p5)
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, StrictMode) ~= 0 then
            local v3
            disableLogs()
            v2, v3 = xpcall(renderWithHooks, describeError, p1, p2, render, p4, ref, p5)
            if v2 then
                v1 = v3
            end
            reenableLogs()
            if not v2 then
                error(v3)
            end
        end
        setIsRendering(false)
    end
    if p1 == nil then
        p2.flags = bit32.bor(p2.flags, PerformedWork)
        v2 = v1
        if p1 ~= nil then
            p2.child = reconcileChildFibers(p2, p1.child, v2, p5)
        else
            p2.child = mountChildFibers(p2, nil, v2, p5)
        end
        return p2.child
    end
    if not u461 then
        bailoutHooks(p1, p2, p5)
        return bailoutOnAlreadyFinishedWork(p1, p2, p5)
    end
    p2.flags = bit32.bor(p2.flags, PerformedWork)
    v2 = v1
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, v2, p5)
    else
        p2.child = mountChildFibers(p2, nil, v2, p5)
    end
    return p2.child
end
local function updateMemoComponent(p1, p2, p3, p4, p5, p6) -- Line: 447 -- upvalues: isSimpleFunctionComponent (val), __DEV__ (val), resolveFunctionForHotReloading (val), SimpleMemoComponent (val), updateSimpleMemoComponent (ref), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), createFiberFromTypeAndProps (val), ReactFiberLane (val), shallowEqual (val), bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), createWorkInProgress (val)
    local compare, type, v1
    if p1 ~= nil then
        if __DEV__ then
            local type_2 = p3.type
            local propTypes_2 = nil
            local validateProps_2 = nil
            if type(type_2) == "table" then
                propTypes_2 = type_2.propTypes
                validateProps_2 = type_2.validateProps
            end
            if propTypes_2 then
                checkPropTypes(propTypes_2, validateProps_2, p4, "prop", getComponentName(type_2))
            elseif not validateProps_2 then
            end
        elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        end
        local child = p1.child
        if ReactFiberLane.includesSomeLane(p5, p6) then
            p2.flags = bit32.bor(p2.flags, PerformedWork)
            v1 = createWorkInProgress(child, p4)
            v1.ref = p2.ref
            v1.return_ = p2
            p2.child = v1
            return v1
        end
        compare = p3.compare
        if compare == nil then
            compare = shallowEqual
        end
        if not (compare(child.memoizedProps, p4)) then
            p2.flags = bit32.bor(p2.flags, PerformedWork)
            v1 = createWorkInProgress(child, p4)
            v1.ref = p2.ref
            v1.return_ = p2
            p2.child = v1
            return v1
        end
        if p1.ref == p2.ref then
            return bailoutOnAlreadyFinishedWork(p1, p2, p6)
        end
        p2.flags = bit32.bor(p2.flags, PerformedWork)
        v1 = createWorkInProgress(child, p4)
        v1.ref = p2.ref
        v1.return_ = p2
        p2.child = v1
        return v1
    else
        type = p3.type
        if not (isSimpleFunctionComponent(type)) then
            if __DEV__ then
                local propTypes = nil
                local validateProps = nil
                if type(type) == "table" then
                    propTypes = type.propTypes
                    validateProps = type.validateProps
                end
                if propTypes then
                    checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(type))
                elseif validateProps then
                    checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(type))
                end
            elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            end
            v1 = createFiberFromTypeAndProps(p3.type, nil, p4, p2, p2.mode, p6)
            v1.ref = p2.ref
            v1.return_ = p2
            p2.child = v1
            return v1
        elseif p3.compare == nil and p3.defaultProps == nil then
            v1 = if __DEV__ then resolveFunctionForHotReloading(type) else type
            p2.tag = SimpleMemoComponent
            p2.type = v1
            if __DEV__ then
                validateFunctionComponentInDev(p2, type)
            end
            return updateSimpleMemoComponent(p1, p2, v1, p4, p5, p6)
        end
    end
end
function updateSimpleMemoComponent(p1, p2, p3, p4, p5, p6) -- Line: 568 -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), REACT_LAZY_TYPE (val), describeError (val), checkPropTypes (val), getComponentName (val), shallowEqual (val), u461 (ref), ReactFiberLane (val), bailoutOnAlreadyFinishedWork (ref), ForceUpdateForLegacySuspense (val), NoFlags (val), updateFunctionComponent (ref)
    local v1
    if __DEV__ then
        local elementType
        if p2.type ~= p2.elementType then
            elementType = p2.elementType
            if elementType["$$typeof"] == REACT_LAZY_TYPE then
                local v2, v3, v4
                v1 = elementType
                v2, v3 = xpcall(v1._init, describeError, v1._payload)
                if not v2 then
                    v4 = nil
                else
                    v4 = v3
                end
                local propTypes = nil
                local validateProps = nil
                if v4 ~= nil and type(v4) == "table" then
                    propTypes = v4.propTypes
                    validateProps = v4.validateProps
                end
                if propTypes then
                    checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(v4))
                elseif not validateProps then
                end
            end
        end
    elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
    if p1 == nil then
        return updateFunctionComponent(p1, p2, p3, p4, p6)
    end
    v1 = if __DEV__ then p2.type == p1.type else true
    if not (shallowEqual(p1.memoizedProps, p4)) or p1.ref ~= p2.ref or not v1 then
        return updateFunctionComponent(p1, p2, p3, p4, p6)
    end
    u461 = false
    if not (ReactFiberLane.includesSomeLane(p6, p5)) then
        p2.lanes = p1.lanes
        return bailoutOnAlreadyFinishedWork(p1, p2, p6)
    end
    local v5 = bit32.band(p1.flags, ForceUpdateForLegacySuspense)
    if v5 ~= NoFlags then
        u461 = true
    end
    return updateFunctionComponent(p1, p2, p3, p4, p6)
end
local function updateOffscreenComponent(p1, p2, p3) -- Line: 670 -- upvalues: ConcurrentMode (val), NoMode (val), ReactFiberLane (val), pushRenderLanes (val), enableSchedulerTracing (val), markSpawnedWork (val), mountChildFibers (val), reconcileChildFibers (val)
    local memoizedState, v1
    local pendingProps = p2.pendingProps
    local children = pendingProps.children
    memoizedState = if p1 ~= nil then p1.memoizedState else nil
    if pendingProps.mode == "hidden" then
        v1 = bit32.band(p2.mode, ConcurrentMode)
        if v1 == NoMode then
            p2.memoizedState = {baseLanes = ReactFiberLane.NoLanes}
            pushRenderLanes(p2, p3)
            if p1 ~= nil then
                p2.child = reconcileChildFibers(p2, p1.child, children, p3)
            else
                p2.child = mountChildFibers(p2, nil, children, p3)
            end
            return p2.child
        end
        if ReactFiberLane.includesSomeLane(p3, ReactFiberLane.OffscreenLane) then
            local baseLanes
            p2.memoizedState = {baseLanes = ReactFiberLane.NoLanes}
            baseLanes = if memoizedState ~= nil then memoizedState.baseLanes else p3
            pushRenderLanes(p2, baseLanes)
            if p1 ~= nil then
                p2.child = reconcileChildFibers(p2, p1.child, children, p3)
            else
                p2.child = mountChildFibers(p2, nil, children, p3)
            end
            return p2.child
        end
        if memoizedState == nil then
            v1 = p3
        else
            v1 = ReactFiberLane.mergeLanes(memoizedState.baseLanes, p3)
        end
        if enableSchedulerTracing then
            markSpawnedWork(ReactFiberLane.OffscreenLane)
        end
        p2.childLanes = ReactFiberLane.laneToLanes(ReactFiberLane.OffscreenLane)
        p2.lanes = p2.childLanes
        p2.memoizedState = {baseLanes = v1}
        pushRenderLanes(p2, v1)
        return nil
    elseif pendingProps.mode ~= "unstable-defer-without-hiding" then
        if memoizedState == nil then
            v1 = p3
        else
            v1 = ReactFiberLane.mergeLanes(memoizedState.baseLanes, p3)
            p2.memoizedState = nil
        end
        pushRenderLanes(p2, v1)
        if p1 ~= nil then
            p2.child = reconcileChildFibers(p2, p1.child, children, p3)
        else
            p2.child = mountChildFibers(p2, nil, children, p3)
        end
        return p2.child
    end
end
function updateFragment(p1, p2, p3) -- Line: 772 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local pendingProps = p2.pendingProps
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, pendingProps, p3)
    else
        p2.child = mountChildFibers(p2, nil, pendingProps, p3)
    end
    return p2.child
end
function updateMode(p1, p2, p3) -- Line: 778 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local children = p2.pendingProps.children
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, children, p3)
    else
        p2.child = mountChildFibers(p2, nil, children, p3)
    end
    return p2.child
end
function updateProfiler(p1, p2, p3) -- Line: 784 -- upvalues: enableProfilerTimer (val), mountChildFibers (val), reconcileChildFibers (val)
    if enableProfilerTimer then
        local stateNode = p2.stateNode
        stateNode.effectDuration = 0
        stateNode.passiveEffectDuration = 0
    end
    local children = p2.pendingProps.children
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, children, p3)
    else
        p2.child = mountChildFibers(p2, nil, children, p3)
    end
    return p2.child
end
local function v21(p1, p2) -- Line: 798 -- upvalues: Ref (val)
    local ref = p2.ref
    if p1 ~= nil then
        if p1 ~= nil and p1.ref ~= ref then
            p2.flags = bit32.bor(p2.flags, Ref)
        end
    elseif ref ~= nil then
        p2.flags = bit32.bor(p2.flags, Ref)
    elseif p1 ~= nil and p1.ref ~= ref then
        p2.flags = bit32.bor(p2.flags, Ref)
    end
end
function updateFunctionComponent(p1, p2, p3, p4, p5) -- Line: 809 -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val), prepareToReadContext (val), u458 (val), ReactCurrentOwner (val), setIsRendering (val), renderWithHooks (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), u461 (ref), bailoutHooks (val), bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), mountChildFibers (val), reconcileChildFibers (val)
    local v1, v2
    if __DEV__ then
        if type(p3) ~= "function" and p2.type ~= p2.elementType then
            local propTypes = nil
            local validateProps = nil
            if type(p3) == "table" then
                propTypes = p3.propTypes
                validateProps = p3.validateProps
            end
            if propTypes then
                checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
            elseif not validateProps then
            end
        end
    elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
    local v3 = nil
    if not disableLegacyContext then
        v1 = getUnmaskedContext(p2, p3, true)
        v3 = getMaskedContext(p2, v1)
    end
    prepareToReadContext(p2, p5, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(p1, p2, p3, p4, v3, p5)
    else
        ReactCurrentOwner.current = p2
        setIsRendering(true)
        v1 = renderWithHooks(p1, p2, p3, p4, v3, p5)
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, StrictMode) ~= 0 then
            local v4
            disableLogs()
            v2, v4 = xpcall(renderWithHooks, describeError, p1, p2, p3, p4, v3, p5)
            reenableLogs()
            if not v2 then
                error(v4)
            else
                v1 = v4
            end
        end
        setIsRendering(false)
    end
    if p1 == nil then
        p2.flags = bit32.bor(p2.flags, PerformedWork)
        v2 = v1
        if p1 ~= nil then
            p2.child = reconcileChildFibers(p2, p1.child, v2, p5)
        else
            p2.child = mountChildFibers(p2, nil, v2, p5)
        end
        return p2.child
    end
    if not u461 then
        bailoutHooks(p1, p2, p5)
        return bailoutOnAlreadyFinishedWork(p1, p2, p5)
    end
    p2.flags = bit32.bor(p2.flags, PerformedWork)
    v2 = v1
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, v2, p5)
    else
        p2.child = mountChildFibers(p2, nil, v2, p5)
    end
    return p2.child
end
local function updateClassComponent(p1, p2, p3, p4, p5) -- Line: 988 -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), isContextProvider (val), pushContextProvider (val), prepareToReadContext (val), u458 (val), Placement (val), constructClassInstance (val), mountClassInstance (val), resumeMountClassInstance (val), updateClassInstance (val), console (val)
    local v1, v2
    if __DEV__ then
        if p2.type ~= p2.elementType then
            local propTypes = p3.propTypes
            local validateProps = p3.validateProps
            if propTypes then
                checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
            elseif not validateProps then
            end
        end
    elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
    if not (isContextProvider(p3)) then
        v1 = false
    else
        v1 = true
        pushContextProvider(p2)
    end
    prepareToReadContext(p2, p5, u458.markWorkInProgressReceivedUpdate)
    if p2.stateNode == nil then
        if p1 ~= nil then
            p1.alternate = nil
            p2.alternate = nil
            p2.flags = bit32.bor(p2.flags, Placement)
        end
        constructClassInstance(p2, p3, p4)
        mountClassInstance(p2, p3, p4, p5)
        v2 = true
    elseif p1 ~= nil then
        v2 = updateClassInstance(p1, p2, p3, p4, p5)
    else
        v2 = resumeMountClassInstance(p2, p3, p4, p5)
    end
    local v3 = finishClassComponent(p1, p2, p3, v2, v1, p5)
    if __DEV__ and v2 and p2.stateNode.props ~= p4 then
        if not u458.didWarnAboutReassigningProps then
            console.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", getComponentName(p2.type) or "a component")
        end
        u458.didWarnAboutReassigningProps = true
    end
    return v3
end
function finishClassComponent(p1, p2, p3, p4, p5, p6) -- Line: 1085 -- upvalues: Ref (val), DidCapture (val), NoFlags (val), invalidateContextProvider (val), bailoutOnAlreadyFinishedWork (ref), ReactCurrentOwner (val), enableProfilerTimer (val), stopProfilerTimerIfRunning (val), __DEV__ (val), setIsRendering (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), PerformedWork (val), reconcileChildFibers (val), mountChildFibers (val)
    local ref = p2.ref
    if p1 ~= nil then
        if p1 ~= nil and p1.ref ~= ref then
            p2.flags = bit32.bor(p2.flags, Ref)
        end
    elseif ref ~= nil then
    end
    local v1 = bit32.band(p2.flags, DidCapture)
    local v2 = v1 ~= NoFlags
    if p4 then
        local v3, v4
        local stateNode = p2.stateNode
        ReactCurrentOwner.current = p2
        if not v2 then
            if not __DEV__ then
                v3 = stateNode:render()
            else
                setIsRendering(true)
                v3 = stateNode:render()
                if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, StrictMode) ~= 0 then
                    local v5
                    disableLogs()
                    v4, v5 = xpcall(stateNode.render, describeError, stateNode)
                    reenableLogs()
                    if not v4 then
                        error(v5)
                    end
                end
                setIsRendering(false)
            end
        elseif p3.getDerivedStateFromError == nil then
            v3 = nil
            if enableProfilerTimer then
                stopProfilerTimerIfRunning(p2)
            end
        elseif type(p3.getDerivedStateFromError) == "function" then
        end
        p2.flags = bit32.bor(p2.flags, PerformedWork)
        if p1 == nil then
            v4 = v3
            if p1 ~= nil then
                p2.child = reconcileChildFibers(p2, p1.child, v4, p6)
            else
                p2.child = mountChildFibers(p2, nil, v4, p6)
            end
        elseif v2 then
            p2.child = reconcileChildFibers(p2, p1.child, nil, p6)
            p2.child = reconcileChildFibers(p2, nil, v3, p6)
        end
        p2.memoizedState = stateNode.state
        if p5 then
            invalidateContextProvider(p2, p3, true)
        end
        return p2.child
    elseif not v2 then
        if p5 then
            invalidateContextProvider(p2, p3, false)
        end
        return bailoutOnAlreadyFinishedWork(p1, p2, p6)
    end
end
local function v22(p1) -- Line: 1183 -- upvalues: pushTopLevelContextObject (val), pushHostContainer (val)
    local stateNode = p1.stateNode
    if stateNode.pendingContext then
        local v1 = stateNode.pendingContext ~= stateNode.context
        pushTopLevelContextObject(p1, stateNode.pendingContext, v1)
    elseif stateNode.context then
        pushTopLevelContextObject(p1, stateNode.context, false)
    end
    pushHostContainer(p1, stateNode.containerInfo)
end
local function updateHostRoot(p1, p2, p3) -- Line: 1199 -- upvalues: pushTopLevelContextObject (val), pushHostContainer (val), invariant (val), cloneUpdateQueue (val), processUpdateQueue (val), resetHydrationState (val), bailoutOnAlreadyFinishedWork (ref), enterHydrationState (val), supportsHydration (val), setWorkInProgressVersion (val), mountChildFibers (val), Placement (val), Hydrating (val), reconcileChildFibers (val)
    local element, v1
    local stateNode = p2.stateNode
    if stateNode.pendingContext then
        local v2 = stateNode.pendingContext ~= stateNode.context
        pushTopLevelContextObject(p2, stateNode.pendingContext, v2)
    elseif stateNode.context then
        pushTopLevelContextObject(p2, stateNode.context, false)
    end
    pushHostContainer(p2, stateNode.containerInfo)
    local v3 = if p1 ~= nil then p2.updateQueue ~= nil else false
    invariant(v3, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
    local memoizedState = p2.memoizedState
    element = if memoizedState ~= nil then memoizedState.element else nil
    cloneUpdateQueue(p1, p2)
    processUpdateQueue(p2, p2.pendingProps, nil, p3)
    local element_2 = p2.memoizedState.element
    if element_2 == element then
        resetHydrationState()
        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
    end
    local stateNode_2 = p2.stateNode
    if not stateNode_2.hydrate then
        if p1 ~= nil then
            p2.child = reconcileChildFibers(p2, p1.child, element_2, p3)
        else
            p2.child = mountChildFibers(p2, nil, element_2, p3)
        end
        resetHydrationState()
        v1 = p2
    elseif enterHydrationState(p2) then
        local v4
        if supportsHydration then
            local mutableSourceEagerHydrationData = stateNode_2.mutableSourceEagerHydrationData
            if mutableSourceEagerHydrationData ~= nil then
                local v5 = #mutableSourceEagerHydrationData
                local v6 = 2
                for i = 1, v5, v6 do
                    setWorkInProgressVersion(mutableSourceEagerHydrationData[i], mutableSourceEagerHydrationData[i + 1])
                end
            end
        end
        local v7 = mountChildFibers(p2, nil, element_2, p3)
        p2.child = v7
        local sibling = v7
        while sibling do
            v4 = bit32.band(sibling.flags, (bit32.bnot(Placement)))
            sibling.flags = bit32.bor(v4, Hydrating)
            sibling = sibling.sibling
        end
    end
    return v1.child
end
local function updateHostComponent(p1, p2, p3) -- Line: 1276 -- upvalues: pushHostContext (val), tryToClaimNextHydratableInstance (val), shouldSetTextContent (val), ContentReset (val), PerformedWork (val), Ref (val), mountChildFibers (val), reconcileChildFibers (val)
    local memoizedProps
    pushHostContext(p2)
    if p1 == nil then
        tryToClaimNextHydratableInstance(p2)
    end
    local type = p2.type
    local pendingProps = p2.pendingProps
    memoizedProps = if p1 ~= nil then p1.memoizedProps else nil
    local children = pendingProps.children
    if shouldSetTextContent(type, pendingProps) then
        children = nil
    elseif memoizedProps ~= nil and shouldSetTextContent(type, memoizedProps) then
        p2.flags = bit32.bor(p2.flags, ContentReset)
    end
    p2.flags = bit32.bor(p2.flags, PerformedWork)
    local ref = p2.ref
    if p1 ~= nil then
        if p1 ~= nil and p1.ref ~= ref then
            p2.flags = bit32.bor(p2.flags, Ref)
        end
    elseif ref ~= nil then
        p2.flags = bit32.bor(p2.flags, Ref)
    end
    local v1 = children
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, v1, p3)
    else
        p2.child = mountChildFibers(p2, nil, v1, p3)
    end
    return p2.child
end
local function updateHostText(p1, p2) -- Line: 1317 -- upvalues: tryToClaimNextHydratableInstance (val)
    if p1 == nil then
        tryToClaimNextHydratableInstance(p2)
    end
    return nil
end
local function mountLazyComponent(p1, p2, p3, p4, p5) -- Line: 1326 -- upvalues: Placement (val), resolveLazyComponentTag (val), resolveDefaultProps (val), FunctionComponent (val), __DEV__ (val), resolveFunctionForHotReloading (val), updateFunctionComponent (ref), ClassComponent (val), resolveClassForHotReloading (val), updateClassComponent (val), ForwardRef (val), resolveForwardRefForHotReloading (val), updateForwardRef (val), MemoComponent (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), updateMemoComponent (val), REACT_LAZY_TYPE (val), inspect (val), invariant (val)
    local v1
    if p1 ~= nil then
        p1.alternate = nil
        p2.alternate = nil
        p2.flags = bit32.bor(p2.flags, Placement)
    end
    local pendingProps = p2.pendingProps
    local v2 = p3._init(p3._payload)
    p2.type = v2
    p2.tag = resolveLazyComponentTag(v2)
    local tag = p2.tag
    local v3 = resolveDefaultProps(v2, pendingProps)
    if tag == FunctionComponent then
        if __DEV__ then
            validateFunctionComponentInDev(p2, v2)
            v2 = resolveFunctionForHotReloading(v2)
            p2.type = v2
        end
        return (updateFunctionComponent(nil, p2, v2, v3, p5))
    end
    if tag == ClassComponent then
        if __DEV__ then
            v2 = resolveClassForHotReloading(v2)
            p2.type = v2
        end
        return (updateClassComponent(nil, p2, v2, v3, p5))
    end
    if tag == ForwardRef then
        if __DEV__ then
            v2 = resolveForwardRefForHotReloading(v2)
            p2.type = v2
        end
        return (updateForwardRef(nil, p2, v2, v3, p5))
    end
    if tag == MemoComponent then
        if __DEV__ then
            if p2.type ~= p2.elementType then
                local propTypes = v2.propTypes
                local validateProps = v2.validateProps
                if propTypes then
                    checkPropTypes(propTypes, validateProps, v3, "prop", getComponentName(v2))
                elseif validateProps then
                    checkPropTypes(propTypes, validateProps, v3, "prop", getComponentName(v2))
                end
            end
        elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        end
        v1 = resolveDefaultProps(v2.type, v3)
        return (updateMemoComponent(nil, p2, v2, v1, p4, p5))
    end
    local v4 = ""
    if __DEV__ then
        if v2 == nil then
            if type(v2) == "table" and v2["$$typeof"] == nil then
                v4 = "\n" .. inspect(v2)
            end
        elseif type(v2) ~= "table" then
            if type(v2) == "table" and v2["$$typeof"] == nil then
                v4 = "\n" .. inspect(v2)
            end
        elseif v2["$$typeof"] == REACT_LAZY_TYPE then
            v4 = " Did you wrap a component in React.lazy() more than once?"
        elseif type(v2) == "table" and v2["$$typeof"] == nil then
            v4 = "\n" .. inspect(v2)
        end
    end
    v1 = tostring(v2)
    invariant(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", v1, v4)
    return nil
end
function mountIncompleteClassComponent(p1, p2, p3, p4, p5) -- Line: 1457 -- upvalues: Placement (val), ClassComponent (val), isContextProvider (val), pushContextProvider (val), prepareToReadContext (val), u458 (val), constructClassInstance (val), mountClassInstance (val)
    local v1
    if p1 ~= nil then
        p1.alternate = nil
        p2.alternate = nil
        p2.flags = bit32.bor(p2.flags, Placement)
    end
    p2.tag = ClassComponent
    if not (isContextProvider(p3)) then
        v1 = false
    else
        v1 = true
        pushContextProvider(p2)
    end
    prepareToReadContext(p2, p5, u458.markWorkInProgressReceivedUpdate)
    constructClassInstance(p2, p3, p4)
    mountClassInstance(p2, p3, p4, p5)
    return finishClassComponent(nil, p2, p3, true, v1, p5)
end
local function mountIndeterminateComponent(p1, p2, p3, p4) -- Line: 1509 -- upvalues: Placement (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val), prepareToReadContext (val), u458 (val), __DEV__ (val), getComponentName (val), u462 (val), console (val), StrictMode (val), u230 (val), setIsRendering (val), ReactCurrentOwner (val), renderWithHooks (val), PerformedWork (val), disableModulePatternComponents (val), ClassComponent (val), isContextProvider (val), pushContextProvider (val), initializeUpdateQueue (val), applyDerivedStateFromProps (val), adoptClassInstance (val), mountClassInstance (val), FunctionComponent (val), debugRenderPhaseSideEffectsForStrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), mountChildFibers (val)
    local v1, v2, v3
    if p1 ~= nil then
        p1.alternate = nil
        p2.alternate = nil
        p2.flags = bit32.bor(p2.flags, Placement)
    end
    local pendingProps = p2.pendingProps
    local v4 = nil
    if not disableLegacyContext then
        v1 = getUnmaskedContext(p2, p3, false)
        v4 = getMaskedContext(p2, v1)
    end
    prepareToReadContext(p2, p4, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(nil, p2, p3, pendingProps, v4, p4)
    else
        if type(p3) == "table" and type(p3.render) == "function" then
            v2 = getComponentName(p3) or "Unknown"
            if not (u462.didWarnAboutBadClass[v2]) then
                console.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", v2, v2)
                u462.didWarnAboutBadClass[v2] = true
            end
        end
        if bit32.band(p2.mode, StrictMode) ~= 0 then
            u230.recordLegacyContextWarning(p2)
        end
        setIsRendering(true)
        ReactCurrentOwner.current = p2
        v1 = renderWithHooks(nil, p2, p3, pendingProps, v4, p4)
        setIsRendering(false)
    end
    p2.flags = bit32.bor(p2.flags, PerformedWork)
    v2 = type(v1)
    if __DEV__ and v1 ~= nil and v2 == "table" and type(v1.render) == "function" and v1["$$typeof"] == nil then
        v3 = getComponentName(p3) or "Unknown"
        if not (u462.didWarnAboutModulePatternComponent[v3]) then
            console.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", v3, v3)
            u462.didWarnAboutModulePatternComponent[v3] = true
        end
    end
    if disableModulePatternComponents then
        p2.tag = FunctionComponent
        if __DEV__ then
            if disableLegacyContext and p3.contextTypes then
                console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", getComponentName(p3) or "Unknown")
            end
            if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, StrictMode) ~= 0 then
                local v5
                disableLogs()
                v3, v5 = xpcall(renderWithHooks, describeError, nil, p2, p3, pendingProps, v4, p4)
                reenableLogs()
                if not v3 then
                    error(v5)
                else
                    v1 = v5
                end
            end
        end
        p2.child = mountChildFibers(p2, nil, v1, p4)
        if __DEV__ then
            validateFunctionComponentInDev(p2, p3)
        end
        return p2.child
    elseif v1 ~= nil and v2 == "table" and type(v1.render) == "function" and v1["$$typeof"] == nil then
        local getDerivedStateFromProps
        if __DEV__ then
            v3 = getComponentName(p3) or "Unknown"
            if not (u462.didWarnAboutModulePatternComponent[v3]) then
                console.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v3, v3)
                u462.didWarnAboutModulePatternComponent[v3] = true
            end
        end
        p2.tag = ClassComponent
        p2.memoizedState = nil
        p2.updateQueue = nil
        if not (isContextProvider(p3)) then
            v3 = false
        else
            v3 = true
            pushContextProvider(p2)
        end
        p2.memoizedState = v1.state
        initializeUpdateQueue(p2)
        getDerivedStateFromProps = if type(p3) ~= "function" then p3.getDerivedStateFromProps else nil
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(p2, p3, getDerivedStateFromProps, pendingProps)
        end
        adoptClassInstance(p2, v1)
        mountClassInstance(p2, p3, pendingProps, p4)
        return finishClassComponent(nil, p2, p3, true, v3, p4)
    end
end
function validateFunctionComponentInDev(p1, p2) -- Line: 1726 -- upvalues: __DEV__ (val), getCurrentFiberOwnerNameInDevOrNull (val), u462 (val), console (val), warnAboutDefaultPropsOnFunctionComponents (val), getComponentName (val)
    if __DEV__ then
        local v1
        if p1.ref ~= nil then
            v1 = ""
            local v2 = getCurrentFiberOwnerNameInDevOrNull()
            if v2 then
                v1 = v1 .. "\n\nCheck the render method of `" .. v2 .. "`."
            end
            local _debugID = v2
            if not _debugID then
                _debugID = p1._debugID
                if not _debugID then
                    _debugID = ""
                end
            end
            local _debugSource = p1._debugSource
            if _debugSource then
                _debugID = _debugSource.fileName .. ":" .. _debugSource.lineNumber
            end
            if not (u462.didWarnAboutFunctionRefs[_debugID]) then
                u462.didWarnAboutFunctionRefs[_debugID] = true
                console.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", v1)
            end
        end
        if warnAboutDefaultPropsOnFunctionComponents and type(p2) ~= "function" and p2.defaultProps ~= nil then
            v1 = getComponentName(p2) or "Unknown"
            if not (u462.didWarnAboutDefaultPropsOnFunctionComponent[v1]) then
                console.error("%s: Support for defaultProps will be removed from function components in a future major release.", v1)
                u462.didWarnAboutDefaultPropsOnFunctionComponent[v1] = true
            end
        end
        if type(p2) ~= "function" and p2.getDerivedStateFromProps ~= nil and type(p2.getDerivedStateFromProps) == "function" then
            v1 = getComponentName(p2) or "Unknown"
            if not (u462.didWarnAboutGetDerivedStateOnFunctionComponent[v1]) then
                console.error("%s: Function components do not support getDerivedStateFromProps.", v1)
                u462.didWarnAboutGetDerivedStateOnFunctionComponent[v1] = true
            end
        end
        if type(p2) ~= "function" and p2.contextType ~= nil and type(p2.contextType) == "table" then
            v1 = getComponentName(p2) or "Unknown"
            if not (u462.didWarnAboutContextTypeOnFunctionComponent[v1]) then
                console.error("%s: Function components do not support contextType.", v1)
                u462.didWarnAboutContextTypeOnFunctionComponent[v1] = true
            end
        end
    end
end
local u582 = {retryLane = ReactFiberLane.NoLane}
local function v23(p1) -- Line: 1823
    return {baseLanes = p1}
end
local function updateSuspenseOffscreenState(p1, p2) -- Line: 1829 -- upvalues: ReactFiberLane (val)
    return {baseLanes = ReactFiberLane.mergeLanes(p1.baseLanes, p2)}
end
local function shouldRemainOnFallback(p1, p2, p3, p4) -- Line: 1839 -- upvalues: hasSuspenseContext (val), ForceSuspenseFallback (val)
    if p2 == nil then
        return hasSuspenseContext(p1, ForceSuspenseFallback)
    end
    if p2.memoizedState == nil then
        return false
    end
    return hasSuspenseContext(p1, ForceSuspenseFallback)
end
local function getRemainingWorkInPrimaryTree(p1, p2) -- Line: 1863 -- upvalues: ReactFiberLane (val)
    return ReactFiberLane.removeLanes(p1.childLanes, p2)
end
local updateSuspensePrimaryChildren = nil
local mountDehydratedSuspenseComponent = nil
local mountSuspensePrimaryChildren = nil
local updateSuspenseFallbackChildren = nil
local updateDehydratedSuspenseComponent = nil
local function updateSuspenseComponent(p1, p2, p3) -- Line: 1875 -- upvalues: __DEV__ (val), u330 (val), DidCapture (val), suspenseStackCursor (val), NoFlags (val), hasSuspenseContext (val), ForceSuspenseFallback (val), addSubtreeSuspenseContext (val), InvisibleParentSuspenseContext (val), setDefaultShallowSuspenseContext (val), pushSuspenseContext (val), tryToClaimNextHydratableInstance (val), enableSuspenseServerRenderer (val), mountDehydratedSuspenseComponent (ref), u582 (val), ReactFiberLane (val), enableSchedulerTracing (val), markSpawnedWork (val), mountSuspensePrimaryChildren (ref), updateDehydratedSuspenseComponent (ref), updateSuspenseFallbackChildren (ref), updateSuspensePrimaryChildren (ref)
    local children, fallback, memoizedState, v1
    local pendingProps = p2.pendingProps
    if __DEV__ then
        if not u330.shouldSuspendRef then
            u330.shouldSuspendRef = require(script.Parent:WaitForChild("ReactFiberReconciler")).shouldSuspend
        end
        if u330.shouldSuspendRef(p2) then
            p2.flags = bit32.bor(p2.flags, DidCapture)
        end
    end
    local current = suspenseStackCursor.current
    local v2 = false
    local v3 = bit32.band(p2.flags, DidCapture)
    local v4 = v3 ~= NoFlags
    if v4 then
        v2 = true
        p2.flags = bit32.band(p2.flags, (bit32.bnot(DidCapture)))
    else
        if p1 == nil then
            v3 = hasSuspenseContext(current, ForceSuspenseFallback)
        elseif p1.memoizedState == nil then
            v3 = false
        end
        if not v3 then
            if p1 == nil then
                if pendingProps.fallback ~= nil and pendingProps.unstable_avoidThisFallback ~= true then
                    current = addSubtreeSuspenseContext(current, InvisibleParentSuspenseContext)
                end
            elseif p1.memoizedState == nil then
            end
        end
    end
    local v5 = setDefaultShallowSuspenseContext(current)
    pushSuspenseContext(p2, v5)
    if p1 ~= nil then
        local v6
        local memoizedState_2 = p1.memoizedState
        if memoizedState_2 ~= nil then
            local child, memoizedState_3
            if not enableSuspenseServerRenderer then
                if v2 then
                    v6 = updateSuspenseFallbackChildren(p1, p2, pendingProps.children, pendingProps.fallback, p3)
                    child = p2.child
                    memoizedState_3 = p1.child.memoizedState
                    if memoizedState_3 ~= nil then
                        child.memoizedState = {baseLanes = ReactFiberLane.mergeLanes(memoizedState_3.baseLanes, p3)}
                    else
                        child.memoizedState = {baseLanes = p3}
                    end
                    child.childLanes = ReactFiberLane.removeLanes(p1.childLanes, p3)
                    p2.memoizedState = u582
                    return v6
                end
                v1 = updateSuspensePrimaryChildren(p1, p2, pendingProps.children, p3)
                p2.memoizedState = nil
                return v1
            end
            local dehydrated_2 = memoizedState_2.dehydrated
            if dehydrated_2 ~= nil then
                if not v4 then
                    return updateDehydratedSuspenseComponent(p1, p2, dehydrated_2, memoizedState_2, p3)
                end
                if p2.memoizedState ~= nil then
                    p2.child = p1.child
                    p2.flags = bit32.bor(p2.flags, DidCapture)
                    return nil
                end
                local v7 = mountSuspenseFallbackAfterRetryWithoutHydrating(p1, p2, pendingProps.children, pendingProps.fallback, p3)
                p2.child.memoizedState = {baseLanes = p3}
                p2.memoizedState = u582
                return v7
            end
            if not v2 then
                v1 = updateSuspensePrimaryChildren(p1, p2, pendingProps.children, p3)
                p2.memoizedState = nil
                return v1
            end
            v6 = updateSuspenseFallbackChildren(p1, p2, pendingProps.children, pendingProps.fallback, p3)
            child = p2.child
            memoizedState_3 = p1.child.memoizedState
            if memoizedState_3 ~= nil then
                child.memoizedState = {baseLanes = ReactFiberLane.mergeLanes(memoizedState_3.baseLanes, p3)}
            else
                child.memoizedState = {baseLanes = p3}
            end
            child.childLanes = ReactFiberLane.removeLanes(p1.childLanes, p3)
            p2.memoizedState = u582
            return v6
        end
        if v2 then
            v6 = updateSuspenseFallbackChildren(p1, p2, pendingProps.children, pendingProps.fallback, p3)
            local child_2 = p2.child
            local memoizedState_4 = p1.child.memoizedState
            if memoizedState_4 ~= nil then
                child_2.memoizedState = {baseLanes = ReactFiberLane.mergeLanes(memoizedState_4.baseLanes, p3)}
            else
                child_2.memoizedState = {baseLanes = p3}
            end
            child_2.childLanes = ReactFiberLane.removeLanes(p1.childLanes, p3)
            p2.memoizedState = u582
            return v6
        end
        v1 = updateSuspensePrimaryChildren(p1, p2, pendingProps.children, p3)
        p2.memoizedState = nil
        return v1
    end
    if pendingProps.fallback == nil then
        children = pendingProps.children
        fallback = pendingProps.fallback
        if v2 then
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            return v1
        end
        if pendingProps.unstable_expectedLoadTime ~= nil then
            if type(pendingProps.unstable_expectedLoadTime) ~= "number" then
                return mountSuspensePrimaryChildren(p2, children, p3)
            end
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            p2.lanes = ReactFiberLane.SomeRetryLane
            if enableSchedulerTracing then
                markSpawnedWork(ReactFiberLane.SomeRetryLane)
            end
            return v1
        end
        return mountSuspensePrimaryChildren(p2, children, p3)
    end
    tryToClaimNextHydratableInstance(p2)
    if not enableSuspenseServerRenderer then
        children = pendingProps.children
        fallback = pendingProps.fallback
        if v2 then
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            return v1
        end
        if pendingProps.unstable_expectedLoadTime ~= nil then
            if type(pendingProps.unstable_expectedLoadTime) ~= "number" then
                return mountSuspensePrimaryChildren(p2, children, p3)
            end
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            p2.lanes = ReactFiberLane.SomeRetryLane
            if enableSchedulerTracing then
                markSpawnedWork(ReactFiberLane.SomeRetryLane)
            end
            return v1
        end
        return mountSuspensePrimaryChildren(p2, children, p3)
    end
    memoizedState = p2.memoizedState
    if memoizedState == nil then
        children = pendingProps.children
        fallback = pendingProps.fallback
        if v2 then
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            return v1
        end
        if pendingProps.unstable_expectedLoadTime ~= nil then
            if type(pendingProps.unstable_expectedLoadTime) ~= "number" then
                return mountSuspensePrimaryChildren(p2, children, p3)
            end
            v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
            p2.child.memoizedState = {baseLanes = p3}
            p2.memoizedState = u582
            p2.lanes = ReactFiberLane.SomeRetryLane
            if enableSchedulerTracing then
                markSpawnedWork(ReactFiberLane.SomeRetryLane)
            end
            return v1
        end
        return mountSuspensePrimaryChildren(p2, children, p3)
    end
    local dehydrated = memoizedState.dehydrated
    if dehydrated ~= nil then
        return mountDehydratedSuspenseComponent(p2, dehydrated, p3)
    end
    children = pendingProps.children
    fallback = pendingProps.fallback
    if v2 then
        v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
        p2.child.memoizedState = {baseLanes = p3}
        p2.memoizedState = u582
        return v1
    end
    if pendingProps.unstable_expectedLoadTime == nil or type(pendingProps.unstable_expectedLoadTime) ~= "number" then
        return mountSuspensePrimaryChildren(p2, children, p3)
    end
    v1 = mountSuspenseFallbackChildren(p2, children, fallback, p3)
    p2.child.memoizedState = {baseLanes = p3}
    p2.memoizedState = u582
    p2.lanes = ReactFiberLane.SomeRetryLane
    if enableSchedulerTracing then
        markSpawnedWork(ReactFiberLane.SomeRetryLane)
    end
    return v1
end
function mountSuspensePrimaryChildren(p1, p2, p3) -- Line: 2160 -- upvalues: createFiberFromOffscreen (val)
    local v1 = createFiberFromOffscreen({mode = "visible", children = p2}, p1.mode, p3, nil)
    v1.return_ = p1
    p1.child = v1
    return v1
end
function mountSuspenseFallbackChildren(p1, p2, p3, p4) -- Line: 2173 -- upvalues: BlockingMode (val), NoMode (val), ReactFiberLane (val), enableProfilerTimer (val), ProfileMode (val), createFiberFromFragment (val), createFiberFromOffscreen (val)
    local v1, v2
    local mode = p1.mode
    local child = p1.child
    local v3 = {mode = "hidden", children = p2}
    local v4 = bit32.band(mode, BlockingMode)
    if v4 ~= NoMode then
        v1 = createFiberFromOffscreen(v3, mode, ReactFiberLane.NoLanes, nil)
        v2 = createFiberFromFragment(p3, mode, p4, nil)
    elseif child == nil then
        v1 = createFiberFromOffscreen(v3, mode, ReactFiberLane.NoLanes, nil)
        v2 = createFiberFromFragment(p3, mode, p4, nil)
    else
        v1 = child
        v1.childLanes = ReactFiberLane.NoLanes
        v1.pendingProps = v3
        if enableProfilerTimer and bit32.band(p1.mode, ProfileMode) ~= 0 then
            v1.actualDuration = 0
            v1.actualStartTime = -1
            v1.selfBaseDuration = 0
            v1.treeBaseDuration = 0
        end
        v2 = createFiberFromFragment(p3, mode, p4, nil)
    end
    v1.return_ = p1
    v2.return_ = p1
    v1.sibling = v2
    p1.child = v1
    return v2
end
local function v24(p1, p2) -- Line: 2223 -- upvalues: createWorkInProgress (val)
    return createWorkInProgress(p1, p2)
end
function updateSuspensePrimaryChildren(p1, p2, p3, p4) -- Line: 2232 -- upvalues: createWorkInProgress (val), BlockingMode (val), NoMode (val), Deletion (val)
    local child = p1.child
    local sibling = child.sibling
    local v1 = createWorkInProgress(child, {mode = "visible", children = p3})
    local v2 = bit32.band(p2.mode, BlockingMode)
    if v2 == NoMode then
        v1.lanes = p4
    end
    v1.return_ = p2
    v1.sibling = nil
    if sibling ~= nil then
        local deletions = p2.deletions
        if deletions ~= nil then
            table.insert(deletions, sibling)
        else
            p2.deletions = {sibling}
            p2.flags = bit32.bor(p2.flags, Deletion)
        end
    end
    p2.child = v1
    return v1
end
function updateSuspenseFallbackChildren(p1, p2, p3, p4, p5) -- Line: 2267 -- upvalues: BlockingMode (val), NoMode (val), ReactFiberLane (val), enableProfilerTimer (val), ProfileMode (val), createWorkInProgress (val), StaticMask (val), createFiberFromFragment (val), Placement (val)
    local v1
    local mode = p2.mode
    local child = p1.child
    local sibling = child.sibling
    local v2 = {mode = "hidden", children = p3}
    local v3 = bit32.band(mode, BlockingMode)
    if v3 ~= NoMode then
        v1 = createWorkInProgress(child, v2)
        v1.subtreeFlags = bit32.band(child.subtreeFlags, StaticMask)
    elseif p2.child == child then
        v1 = createWorkInProgress(child, v2)
        v1.subtreeFlags = bit32.band(child.subtreeFlags, StaticMask)
    else
        v1 = p2.child
        v1.childLanes = ReactFiberLane.NoLanes
        v1.pendingProps = v2
        if enableProfilerTimer and bit32.band(p2.mode, ProfileMode) ~= 0 then
            v1.actualDuration = 0
            v1.actualStartTime = -1
            v1.selfBaseDuration = child.selfBaseDuration
            v1.treeBaseDuration = child.treeBaseDuration
        end
        p2.deletions = nil
    end
    if sibling == nil then
        v3 = createFiberFromFragment(p4, mode, p5, nil)
        v3.flags = bit32.bor(v3.flags, Placement)
    else
        v3 = createWorkInProgress(sibling, p4)
    end
    v3.return_ = p2
    v1.return_ = p2
    v1.sibling = v3
    p2.child = v1
    return v3
end
local function retrySuspenseComponentWithoutHydrating(p1, p2, p3) -- Line: 2350 -- upvalues: reconcileChildFibers (val), mountSuspensePrimaryChildren (ref), Placement (val)
    reconcileChildFibers(p2, p1.child, nil, p3)
    local v1 = mountSuspensePrimaryChildren(p2, p2.pendingProps.children, p3)
    v1.flags = bit32.bor(v1.flags, Placement)
    p2.memoizedState = nil
    return v1
end
function mountSuspenseFallbackAfterRetryWithoutHydrating(p1, p2, p3, p4, p5) -- Line: 2371 -- upvalues: createFiberFromOffscreen (val), ReactFiberLane (val), createFiberFromFragment (val), Placement (val), BlockingMode (val), NoMode (val), reconcileChildFibers (val)
    local mode = p2.mode
    local v1 = createFiberFromOffscreen(p3, mode, ReactFiberLane.NoLanes, nil)
    local v2 = createFiberFromFragment(p4, mode, p5, nil)
    v2.flags = bit32.bor(v2.flags, Placement)
    v1.return_ = p2
    v2.return_ = p2
    v1.sibling = v2
    p2.child = v1
    local v3 = bit32.band(p2.mode, BlockingMode)
    if v3 ~= NoMode then
        reconcileChildFibers(p2, p1.child, nil, p5)
    end
    return v2
end
function mountDehydratedSuspenseComponent(p1, p2, p3) -- Line: 2401 -- upvalues: BlockingMode (val), NoMode (val), __DEV__ (val), console (val), ReactFiberLane (val), isSuspenseInstanceFallback (val), enableSchedulerTracing (val), markSpawnedWork (val)
    local v1 = bit32.band(p1.mode, BlockingMode)
    if v1 == NoMode then
        if __DEV__ then
            console.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
        end
        p1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.SyncLane)
    elseif not (isSuspenseInstanceFallback(p2)) then
        p1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.OffscreenLane)
        if enableSchedulerTracing then
            markSpawnedWork(ReactFiberLane.OffscreenLane)
        end
    else
        if enableSchedulerTracing then
            markSpawnedWork(ReactFiberLane.DefaultHydrationLane)
        end
        p1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.DefaultHydrationLane)
    end
    return nil
end
function updateDehydratedSuspenseComponent(p1, p2, p3, p4, p5) -- Line: 2448 -- upvalues: warnIfHydrating (val), getExecutionContext (val), RetryAfterError (val), NoContext (val), reconcileChildFibers (val), mountSuspensePrimaryChildren (ref), Placement (val), BlockingMode (val), NoMode (val), isSuspenseInstanceFallback (val), ReactFiberLane (val), u461 (ref), getWorkInProgressRoot (val), scheduleUpdateOnFiber (val), renderDidSuspendDelayIfPossible (val), isSuspenseInstancePending (val), DidCapture (val), retryDehydratedSuspenseBoundary (val), enableSchedulerTracing (val), u426 (ref), registerSuspenseInstanceRetry (val), reenterHydrationStateFromDehydratedSuspenseInstance (val), Hydrating (val)
    local v1, v2
    warnIfHydrating()
    local v3 = bit32.band(getExecutionContext(), RetryAfterError)
    if v3 ~= NoContext then
        reconcileChildFibers(p2, p1.child, nil, p5)
        v2 = mountSuspensePrimaryChildren(p2, p2.pendingProps.children, p5)
        v2.flags = bit32.bor(v2.flags, Placement)
        p2.memoizedState = nil
        return v2
    end
    v3 = bit32.band(p2.mode, BlockingMode)
    if v3 == NoMode or isSuspenseInstanceFallback(p3) then
        reconcileChildFibers(p2, p1.child, nil, p5)
        v2 = mountSuspensePrimaryChildren(p2, p2.pendingProps.children, p5)
        v2.flags = bit32.bor(v2.flags, Placement)
        p2.memoizedState = nil
        return v2
    end
    v3 = ReactFiberLane.includesSomeLane(p5, p1.childLanes)
    if u461 or v3 then
        v1 = getWorkInProgressRoot()
        if v1 ~= nil then
            local v4 = ReactFiberLane.getBumpedLaneForHydration(v1, p5)
            if v4 ~= ReactFiberLane.NoLane and v4 ~= p4.retryLane then
                p4.retryLane = v4
                scheduleUpdateOnFiber(p1, v4, ReactFiberLane.NoTimestamp)
            end
        end
        renderDidSuspendDelayIfPossible()
        reconcileChildFibers(p2, p1.child, nil, p5)
        local v5 = mountSuspensePrimaryChildren(p2, p2.pendingProps.children, p5)
        v5.flags = bit32.bor(v5.flags, Placement)
        p2.memoizedState = nil
        return v5
    end
    if not (isSuspenseInstancePending(p3)) then
        reenterHydrationStateFromDehydratedSuspenseInstance(p2, p3)
        v2 = mountSuspensePrimaryChildren(p2, p2.pendingProps.children, p5)
        v2.flags = bit32.bor(v2.flags, Hydrating)
        return v2
    end
    p2.flags = bit32.bor(p2.flags, DidCapture)
    p2.child = p1.child
    function v1() -- Line: 2544 -- upvalues: retryDehydratedSuspenseBoundary (upval), p1 (val)
        return retryDehydratedSuspenseBoundary(p1)
    end
    if enableSchedulerTracing then
        if u426 == nil then
            u426 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
        end
        v1 = u426(v1)
    end
    registerSuspenseInstanceRetry(p3, v1)
    return nil
end
function updatePortalComponent(p1, p2, p3) -- Line: 2958 -- upvalues: pushHostContainer (val), reconcileChildFibers (val), mountChildFibers (val)
    pushHostContainer(p2, p2.stateNode.containerInfo)
    local pendingProps = p2.pendingProps
    if p1 == nil then
        p2.child = reconcileChildFibers(p2, nil, pendingProps, p3)
    elseif p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, pendingProps, p3)
    else
        p2.child = mountChildFibers(p2, nil, pendingProps, p3)
    end
    return p2.child
end
local u632 = false
local function updateContextProvider(p1, p2, p3) -- Line: 2981 -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), Array (val), Object (val), u632 (ref), console (val), checkPropTypes (val), pushProvider (val), calculateChangedBits (val), hasContextChanged (val), bailoutOnAlreadyFinishedWork (ref), propagateContextChange (val), mountChildFibers (val), reconcileChildFibers (val)
    local children, v1, v2, v3, v4
    local _context = p2.type._context
    local pendingProps = p2.pendingProps
    local memoizedProps = p2.memoizedProps
    local value = pendingProps.value
    if __DEV__ then
        v4 = Object.keys(pendingProps)
        local v5 = Array.indexOf(v4, "value")
        if v5 < 1 and not u632 then
            u632 = true
            console.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
        end
        local propTypes = p2.type.propTypes
        local validateProps = p2.type.validateProps
        if propTypes then
            checkPropTypes(propTypes, validateProps, pendingProps, "prop", "Context.Provider")
        elseif not validateProps then
        end
    elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
    pushProvider(p2, value)
    if memoizedProps == nil then
        v1, v2, v3 = p1, p2, p3
        children = pendingProps.children
        if v1 ~= nil then
            v2.child = reconcileChildFibers(v2, v1.child, children, v3)
        else
            v2.child = mountChildFibers(v2, nil, children, v3)
        end
        return v2.child
    end
    v4 = calculateChangedBits(_context, value, memoizedProps.value)
    if v4 ~= 0 then
        propagateContextChange(p2, _context, v4, p3)
        v1, v2, v3 = p1, p2, p3
        children = pendingProps.children
        if v1 ~= nil then
            v2.child = reconcileChildFibers(v2, v1.child, children, v3)
        else
            v2.child = mountChildFibers(v2, nil, children, v3)
        end
        return v2.child
    end
    if memoizedProps.children ~= pendingProps.children then
        v1, v2, v3 = p1, p2, p3
        children = pendingProps.children
        if v1 ~= nil then
            v2.child = reconcileChildFibers(v2, v1.child, children, v3)
        else
            v2.child = mountChildFibers(v2, nil, children, v3)
        end
        return v2.child
    end
    if not (hasContextChanged()) then
        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
    end
    v1, v2, v3 = p1, p2, p3
    children = pendingProps.children
    if v1 ~= nil then
        v2.child = reconcileChildFibers(v2, v1.child, children, v3)
    else
        v2.child = mountChildFibers(v2, nil, children, v3)
    end
    return v2.child
end
local u640 = {usingContextAsConsumer = false, usingLegacyConsumer = false}
function updateContextConsumer(p1, p2, p3) -- Line: 3049 -- upvalues: __DEV__ (val), u640 (val), console (val), __COMPAT_WARNINGS__ (val), prepareToReadContext (val), u458 (val), readContext (val), ReactCurrentOwner (val), setIsRendering (val), PerformedWork (val), mountChildFibers (val), reconcileChildFibers (val)
    local render, v1
    local type = p2.type
    if __DEV__ then
        if type._context ~= nil then
            type = type._context
        elseif type ~= type.Consumer and not u640.usingContextAsConsumer then
            u640.usingContextAsConsumer = true
            console.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
        end
    end
    local pendingProps = p2.pendingProps
    if not pendingProps.render then
        render = pendingProps.children
    else
        if __DEV__ and __COMPAT_WARNINGS__ and not u640.usingLegacyConsumer then
            u640.usingLegacyConsumer = true
            console.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \nPlease provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
        end
        render = pendingProps.render
    end
    if __DEV__ and type(render) ~= "function" then
        console.error("A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
    end
    prepareToReadContext(p2, p3, u458.markWorkInProgressReceivedUpdate)
    local v2 = readContext(type, pendingProps.unstable_observedBits)
    if not __DEV__ then
        v1 = render(v2)
    else
        ReactCurrentOwner.current = p2
        setIsRendering(true)
        v1 = render(v2)
        setIsRendering(false)
    end
    p2.flags = bit32.bor(p2.flags, PerformedWork)
    local v3 = v1
    if p1 ~= nil then
        p2.child = reconcileChildFibers(p2, p1.child, v3, p3)
    else
        p2.child = mountChildFibers(p2, nil, v3, p3)
    end
    return p2.child
end
function u458.markWorkInProgressReceivedUpdate() -- Line: 3159 -- upvalues: u461 (ref)
    u461 = true
end
function bailoutOnAlreadyFinishedWork(p1, p2, p3) -- Line: 3163 -- upvalues: enableProfilerTimer (val), stopProfilerTimerIfRunning (val), markSkippedUpdateLanes (val), ReactFiberLane (val), cloneChildFibers (val)
    if p1 then
        p2.dependencies = p1.dependencies
    end
    if enableProfilerTimer then
        stopProfilerTimerIfRunning(p2)
    end
    markSkippedUpdateLanes(p2.lanes)
    if not (ReactFiberLane.includesSomeLane(p3, p2.childLanes)) then
        return nil
    end
    cloneChildFibers(p1, p2)
    return p2.child
end
function remountFiber(p1, p2, p3) -- Line: 3194 -- upvalues: __DEV__ (val), Deletion (val), Placement (val)
    local child, v1, v2
    if not __DEV__ then
        error("Did not expect this call in production. This is a bug in React. Please file an issue.")
        return
    end
    local return_ = p2.return_
    if return_ == nil then
        error("Cannot swap the root fiber.")
    end
    local v3 = return_ ~= nil
    assert(v3, "returnFiber was nil in remountFiber")
    p1.alternate = nil
    p2.alternate = nil
    p3.index = p2.index
    p3.sibling = p2.sibling
    p3.return_ = p2.return_
    p3.ref = p2.ref
    if p2 ~= return_.child then
        local v4
        child = return_.child
        if child == nil then
            error("Expected parent to have a child.")
        end
        local v5 = child ~= nil
        assert(v5, "prevSibling was nil in remountFiber")
        v4, v2, v1 = p2, p3, p1
        while child.sibling ~= v4 do
            child = child.sibling
            if child == nil then
                error("Expected to find the previous sibling.")
            end
        end
        child.sibling = v2
    else
        return_.child = p3
        v1 = p1
    end
    local deletions = return_.deletions
    if deletions ~= nil then
        table.insert(deletions, v1)
    else
        return_.deletions = {v1}
        return_.flags = bit32.bor(return_.flags, Deletion)
    end
    v2.flags = bit32.bor(v2.flags, Placement)
    return v2
end
function u458.beginWork(p1, p2, p3) -- Line: 3263 -- upvalues: __DEV__ (val), createFiberFromTypeAndProps (val), hasContextChanged (val), u461 (ref), ReactFiberLane (val), HostRoot (val), pushTopLevelContextObject (val), pushHostContainer (val), resetHydrationState (val), HostComponent (val), pushHostContext (val), ClassComponent (val), isContextProvider (val), pushContextProvider (val), HostPortal (val), ContextProvider (val), pushProvider (val), Profiler (val), enableProfilerTimer (val), SuspenseComponent (val), enableSuspenseServerRenderer (val), pushSuspenseContext (val), setDefaultShallowSuspenseContext (val), suspenseStackCursor (val), DidCapture (val), updateSuspenseComponent (val), bailoutOnAlreadyFinishedWork (ref), SuspenseListComponent (val), OffscreenComponent (val), LegacyHiddenComponent (val), updateOffscreenComponent (val), ForceUpdateForLegacySuspense (val), NoFlags (val), ReactWorkTags (val), mountIndeterminateComponent (val), LazyComponent (val), mountLazyComponent (val), FunctionComponent (val), resolveDefaultProps (val), updateFunctionComponent (ref), updateClassComponent (val), updateHostRoot (val), updateHostComponent (val), HostText (val), tryToClaimNextHydratableInstance (val), ForwardRef (val), updateForwardRef (val), Fragment (val), Mode (val), updateContextProvider (val), ContextConsumer (val), MemoComponent (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val), updateMemoComponent (val), SimpleMemoComponent (val), updateSimpleMemoComponent (ref), IncompleteClassComponent (val), updateOffscreenComponent (val), invariant (val)
    local lanes = p2.lanes
    if not __DEV__ then
        local pendingProps, type, v1
        if p1 == nil then
            u461 = false
            p2.lanes = ReactFiberLane.NoLanes
            if p2.tag == ReactWorkTags.IndeterminateComponent then
                return mountIndeterminateComponent(p1, p2, p2.type, p3)
            end
            if p2.tag == LazyComponent then
                return (mountLazyComponent(p1, p2, p2.elementType, lanes, p3))
            end
            if p2.tag == FunctionComponent then
                type = p2.type
                pendingProps = p2.pendingProps
                if p2.elementType ~= type then
                    v1 = resolveDefaultProps(type, pendingProps)
                else
                    v1 = pendingProps
                end
                return updateFunctionComponent(p1, p2, type, v1, p3)
            end
            if p2.tag == ClassComponent then
                local type_2 = p2.type
                local pendingProps_2 = p2.pendingProps
                if p2.elementType ~= type_2 then
                    v1 = resolveDefaultProps(type_2, pendingProps_2)
                else
                    v1 = pendingProps_2
                    if not v1 then
                        v1 = resolveDefaultProps(type_2, pendingProps_2)
                    end
                end
                return (updateClassComponent(p1, p2, type_2, v1, p3))
            end
            if p2.tag == HostRoot then
                return updateHostRoot(p1, p2, p3)
            end
            if p2.tag == HostComponent then
                return (updateHostComponent(p1, p2, p3))
            end
            if p2.tag == HostText then
                if p1 == nil then
                    tryToClaimNextHydratableInstance(p2)
                end
                return nil
            end
            if p2.tag == SuspenseComponent then
                return updateSuspenseComponent(p1, p2, p3)
            end
            if p2.tag == HostPortal then
                return updatePortalComponent(p1, p2, p3)
            end
            if p2.tag == ForwardRef then
                local type_3 = p2.type
                local pendingProps_3 = p2.pendingProps
                v1 = if p2.elementType ~= type_3 then resolveDefaultProps(type_3, pendingProps_3) else pendingProps_3
                return updateForwardRef(p1, p2, type_3, v1, p3)
            end
            if p2.tag == Fragment then
                return updateFragment(p1, p2, p3)
            end
            if p2.tag == Mode then
                return updateMode(p1, p2, p3)
            end
            if p2.tag == Profiler then
                return updateProfiler(p1, p2, p3)
            end
            if p2.tag == ContextProvider then
                return updateContextProvider(p1, p2, p3)
            end
            if p2.tag == ContextConsumer then
                return updateContextConsumer(p1, p2, p3)
            end
            if p2.tag == MemoComponent then
                local type_4 = p2.type
                v1 = resolveDefaultProps(type_4, p2.pendingProps)
                if __DEV__ then
                    if p2.type ~= p2.elementType then
                        local propTypes = nil
                        local validateProps = nil
                        if type(type_4) == "table" then
                            propTypes = type_4.propTypes
                            validateProps = type_4.validateProps
                        end
                        if propTypes then
                            checkPropTypes(propTypes, validateProps, v1, "prop", getComponentName(type_4))
                        elseif validateProps then
                            checkPropTypes(propTypes, validateProps, v1, "prop", getComponentName(type_4))
                        end
                    end
                elseif not __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
                end
                v1 = resolveDefaultProps(type_4.type, v1)
                return updateMemoComponent(p1, p2, type_4, v1, lanes, p3)
            end
            if p2.tag == SimpleMemoComponent then
                return updateSimpleMemoComponent(p1, p2, p2.type, p2.pendingProps, lanes, p3)
            end
            if p2.tag ~= IncompleteClassComponent then
                if p2.tag == OffscreenComponent or p2.tag == LegacyHiddenComponent then
                    return (updateOffscreenComponent(p1, p2, p3))
                end
                invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(p2.tag)))
                return nil
            end
            local type_5 = p2.type
            local pendingProps_4 = p2.pendingProps
            if p2.elementType ~= type_5 then
                v1 = resolveDefaultProps(type_5, pendingProps_4)
            else
                v1 = pendingProps_4
                if not v1 then
                    v1 = resolveDefaultProps(type_5, pendingProps_4)
                end
            end
            return mountIncompleteClassComponent(p1, p2, type_5, v1, p3)
        elseif p1.memoizedProps ~= p2.pendingProps then
            u461 = true
        elseif not (hasContextChanged()) then
            if not __DEV__ then
                v1 = false
            else
                v1 = p2.type ~= p1.type
            end
            if not v1 then
                if not (ReactFiberLane.includesSomeLane(p3, lanes)) then
                    local v2
                    u461 = false
                    if p2.tag == HostRoot then
                        local stateNode = p2.stateNode
                        if stateNode.pendingContext then
                            local v3 = stateNode.pendingContext ~= stateNode.context
                            pushTopLevelContextObject(p2, stateNode.pendingContext, v3)
                        elseif stateNode.context then
                            pushTopLevelContextObject(p2, stateNode.context, false)
                        end
                        pushHostContainer(p2, stateNode.containerInfo)
                        resetHydrationState()
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag == HostComponent then
                        pushHostContext(p2)
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag == ClassComponent then
                        if isContextProvider(p2.type) then
                            pushContextProvider(p2)
                        end
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag == HostPortal then
                        pushHostContainer(p2, p2.stateNode.containerInfo)
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag == ContextProvider then
                        pushProvider(p2, p2.memoizedProps.value)
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag == Profiler then
                        if enableProfilerTimer then
                            local stateNode_2 = p2.stateNode
                            stateNode_2.effectDuration = 0
                            stateNode_2.passiveEffectDuration = 0
                        end
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if p2.tag ~= SuspenseComponent then
                        if p2.tag == SuspenseListComponent then
                            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                            print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
                            error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
                            return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                        end
                        if p2.tag ~= OffscreenComponent then
                            if p2.tag ~= LegacyHiddenComponent then
                                return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                            end
                            p2.lanes = ReactFiberLane.NoLanes
                            return (updateOffscreenComponent(p1, p2, p3))
                        end
                        p2.lanes = ReactFiberLane.NoLanes
                        return (updateOffscreenComponent(p1, p2, p3))
                    end
                    local memoizedState = p2.memoizedState
                    if memoizedState == nil then
                        pushSuspenseContext(p2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                        return bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    end
                    if not enableSuspenseServerRenderer then
                        if ReactFiberLane.includesSomeLane(p3, p2.child.childLanes) then
                            return updateSuspenseComponent(p1, p2, p3)
                        end
                        pushSuspenseContext(p2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                        v2 = bailoutOnAlreadyFinishedWork(p1, p2, p3)
                        if v2 ~= nil then
                            return v2.sibling
                        end
                        return nil
                    end
                    if memoizedState.dehydrated ~= nil then
                        pushSuspenseContext(p2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                        p2.flags = bit32.bor(p2.flags, DidCapture)
                        return nil
                    end
                    if ReactFiberLane.includesSomeLane(p3, p2.child.childLanes) then
                        return updateSuspenseComponent(p1, p2, p3)
                    end
                    pushSuspenseContext(p2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                    v2 = bailoutOnAlreadyFinishedWork(p1, p2, p3)
                    if v2 ~= nil then
                        return v2.sibling
                    end
                    return nil
                end
                v1 = bit32.band(p1.flags, ForceUpdateForLegacySuspense)
                u461 = not (v1 == NoFlags)
            end
        end
    elseif p2._debugNeedsRemount and p1 ~= nil then
        return remountFiber(p1, p2, createFiberFromTypeAndProps(p2.type, p2.key, p2.pendingProps, p2._debugOwner or nil, p2.mode, p2.lanes))
    end
end
return u458