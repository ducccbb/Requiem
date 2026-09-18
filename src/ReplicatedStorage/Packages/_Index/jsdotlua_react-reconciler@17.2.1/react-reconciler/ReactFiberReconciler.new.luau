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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberReconciler.new
--                               Dumped in 0.00376 seconds
--                          Bytecode version 9  |  38 functions

local __DEV__ = _G.__DEV__
require(script.Parent.Parent:WaitForChild("shared"))
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FundamentalComponent = ReactWorkTags.FundamentalComponent
require(script.Parent.Parent:WaitForChild("shared"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactFiberTreeReflection = require(script.Parent:WaitForChild("ReactFiberTreeReflection"))
local findCurrentHostFiber = ReactFiberTreeReflection.findCurrentHostFiber
local findCurrentHostFiberWithNoPortals = ReactFiberTreeReflection.findCurrentHostFiberWithNoPortals
local get = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local HostComponent = ReactWorkTags.HostComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local enableSchedulingProfiler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local ReactSharedInternals = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local getPublicInstance = require(script.Parent:WaitForChild("ReactFiberHostConfig")).getPublicInstance
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local findCurrentUnmaskedContext = v2.findCurrentUnmaskedContext
local processChildContext = v2.processChildContext
local emptyContextObject = v2.emptyContextObject
local isContextProvider = v2.isContextProvider
local createFiberRoot = require(script.Parent:WaitForChild("ReactFiberRoot.new")).createFiberRoot
local v3 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new"))
local injectInternals = v3.injectInternals
local onScheduleRoot = v3.onScheduleRoot
local v4 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local requestEventTime = v4.requestEventTime
local requestUpdateLane = v4.requestUpdateLane
local scheduleUpdateOnFiber = v4.scheduleUpdateOnFiber
local flushRoot = v4.flushRoot
local flushSync = v4.flushSync
local warnIfNotScopedWithMatchingAct = v4.warnIfNotScopedWithMatchingAct
local warnIfUnmockedScheduler = v4.warnIfUnmockedScheduler
local v5 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local createUpdate = v5.createUpdate
local enqueueUpdate = v5.enqueueUpdate
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local isRendering = ReactCurrentFiber.isRendering
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local StrictMode = ReactTypeOfMode.StrictMode
local SyncLane = ReactFiberLane.SyncLane
local InputDiscreteHydrationLane = ReactFiberLane.InputDiscreteHydrationLane
local SelectiveHydrationLane = ReactFiberLane.SelectiveHydrationLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local getHighestPriorityPendingLanes = ReactFiberLane.getHighestPriorityPendingLanes
local higherPriorityLane = ReactFiberLane.higherPriorityLane
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local markRenderScheduled = require(script.Parent:WaitForChild("SchedulingProfiler")).markRenderScheduled
local v6 = {
    ReactRootTags = ReactRootTags,
    ReactWorkTags = ReactWorkTags,
    ReactTypeOfMode = ReactTypeOfMode,
    ReactFiberFlags = ReactFiberFlags,
    getNearestMountedFiber = ReactFiberTreeReflection.getNearestMountedFiber,
    findCurrentFiberUsingSlowPath = ReactFiberTreeReflection.findCurrentFiberUsingSlowPath,
    createPortal = require(script.Parent:WaitForChild("ReactPortal")).createPortal,
}
local u300 = nil
local u301 = nil
if __DEV__ then
    u300 = false
    u301 = {}
end
local function getContextForSubtree(p1) -- Line: 176 -- upvalues: emptyContextObject (val), get (val), findCurrentUnmaskedContext (val), ClassComponent (val), isContextProvider (val), processChildContext (val)
    if not p1 then
        return emptyContextObject
    end
    local v1 = get(p1)
    local v2 = findCurrentUnmaskedContext(v1)
    if v1.tag ~= ClassComponent then
        return v2
    end
    local type = v1.type
    if isContextProvider(type) then
        return processChildContext(v1, type, v2)
    end
    return v2
end
local function findHostInstance(p1) -- Line: 194 -- upvalues: get (val), invariant (val), Object (val), findCurrentHostFiber (val)
    local v1 = get(p1)
    if v1 == nil then
        if typeof(p1.render) ~= "function" then
            invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(p1)))
        else
            invariant(false, "Unable to find node on an unmounted component.")
        end
    end
    local v2 = findCurrentHostFiber(v1)
    if v2 == nil then
        return nil
    end
    return v2.stateNode
end
function v6.createContainer(p1, p2, p3, p4) -- Line: 288 -- upvalues: createFiberRoot (val)
    return createFiberRoot(p1, p2, p3, p4)
end
function v6.updateContainer(p1, p2, p3, p4) -- Line: 297 -- upvalues: __DEV__ (val), onScheduleRoot (val), requestEventTime (val), warnIfUnmockedScheduler (val), warnIfNotScopedWithMatchingAct (val), requestUpdateLane (val), enableSchedulingProfiler (val), markRenderScheduled (val), emptyContextObject (val), get (val), findCurrentUnmaskedContext (val), ClassComponent (val), isContextProvider (val), processChildContext (val), isRendering (val), ReactCurrentFiber (val), u300 (ref), console (val), getComponentName (val), createUpdate (val), Object (val), enqueueUpdate (val), scheduleUpdateOnFiber (val)
    local None, v1, v2
    if __DEV__ then
        onScheduleRoot(p2, p1)
    end
    local current = p2.current
    local v3 = requestEventTime()
    if __DEV__ and _G.__TESTEZ_RUNNING_TEST__ then
        warnIfUnmockedScheduler(current)
        warnIfNotScopedWithMatchingAct(current)
    end
    local v4 = requestUpdateLane(current)
    if enableSchedulingProfiler then
        markRenderScheduled(v4)
    end
    if p3 then
        v2 = get(p3)
        local v5 = findCurrentUnmaskedContext(v2)
        if v2.tag ~= ClassComponent then
            v1 = v5
        else
            local type = v2.type
            if isContextProvider(type) then
                v1 = processChildContext(v2, type, v5)
            end
        end
    else
        v1 = emptyContextObject
    end
    if p2.context ~= nil then
        p2.pendingContext = v1
    else
        p2.context = v1
    end
    if __DEV__ and isRendering and ReactCurrentFiber.current ~= nil and not u300 then
        u300 = true
        console.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", getComponentName(ReactCurrentFiber.current.type) or "Unknown")
    end
    v2 = createUpdate(v3, v4)
    if p1 ~= nil then
        None = p1
    else
        None = Object.None
    end
    v2.payload = {element = None}
    if p4 ~= nil then
        if __DEV__ and typeof(p4) ~= "function" then
            console.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", (tostring(p4)))
        end
        v2.callback = p4
    end
    enqueueUpdate(current, v2)
    scheduleUpdateOnFiber(current, v4, v3)
    return v4
end
v6.batchedEventUpdates = v4.batchedEventUpdates
v6.batchedUpdates = v4.batchedUpdates
v6.unbatchedUpdates = v4.unbatchedUpdates
v6.deferredUpdates = v4.deferredUpdates
v6.discreteUpdates = v4.discreteUpdates
v6.flushDiscreteUpdates = v4.flushDiscreteUpdates
v6.flushControlled = v4.flushControlled
v6.flushSync = flushSync
v6.flushPassiveEffects = v4.flushPassiveEffects
v6.IsThisRendererActing = v4.IsThisRendererActing
v6.act = v4.act
function v6.getPublicRootInstance(p1) -- Line: 393 -- upvalues: HostComponent (val), getPublicInstance (val)
    local current = p1.current
    if not current.child then
        return nil
    end
    if current.child.tag == HostComponent then
        return getPublicInstance(current.child.stateNode)
    end
    return current.child.stateNode
end
local u353 = nil
function v6.attemptSynchronousHydration(p1) -- Line: 408 -- upvalues: HostRoot (val), getHighestPriorityPendingLanes (val), flushRoot (val), SuspenseComponent (val), requestEventTime (val), flushSync (val), scheduleUpdateOnFiber (val), SyncLane (val), InputDiscreteHydrationLane (val), u353 (ref)
    if p1.tag ~= HostRoot then
        if p1.tag == SuspenseComponent then
            local u15 = requestEventTime()
            flushSync(function() -- Line: 418 -- upvalues: scheduleUpdateOnFiber (upval), p1 (val), SyncLane (upval), u15 (val)
                return scheduleUpdateOnFiber(p1, SyncLane, u15)
            end)
            u353(p1, InputDiscreteHydrationLane)
        end
        return
    end
    local stateNode = p1.stateNode
    if not stateNode.hydrate then
        return
    end
    local v1 = getHighestPriorityPendingLanes(stateNode)
    flushRoot(stateNode, v1)
end
local function markRetryLaneImpl(p1, p2) -- Line: 429 -- upvalues: higherPriorityLane (val)
    local memoizedState = p1.memoizedState
    if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
        memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p2)
    end
end
function u353(p1, p2) -- Line: 440 -- upvalues: higherPriorityLane (val)
    local memoizedState = p1.memoizedState
    if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
        memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p2)
    end
    local alternate = p1.alternate
    if alternate then
        local memoizedState_2 = alternate.memoizedState
        if memoizedState_2 and memoizedState_2 ~= nil and memoizedState_2.dehydrated ~= nil then
            memoizedState_2.retryLane = higherPriorityLane(memoizedState_2.retryLane, p2)
        end
    end
end
function v6.attemptUserBlockingHydration(p1) -- Line: 449 -- upvalues: SuspenseComponent (val), requestEventTime (val), InputDiscreteHydrationLane (val), scheduleUpdateOnFiber (val), u353 (ref)
    if p1.tag ~= SuspenseComponent then
        return
    end
    local v1 = InputDiscreteHydrationLane
    scheduleUpdateOnFiber(p1, v1, (requestEventTime()))
    u353(p1, v1)
end
function v6.attemptContinuousHydration(p1) -- Line: 463 -- upvalues: SuspenseComponent (val), requestEventTime (val), SelectiveHydrationLane (val), scheduleUpdateOnFiber (val), u353 (ref)
    if p1.tag ~= SuspenseComponent then
        return
    end
    local v1 = SelectiveHydrationLane
    scheduleUpdateOnFiber(p1, v1, (requestEventTime()))
    u353(p1, v1)
end
function v6.attemptHydrationAtCurrentPriority(p1) -- Line: 477 -- upvalues: SuspenseComponent (val), requestEventTime (val), requestUpdateLane (val), scheduleUpdateOnFiber (val), u353 (ref)
    if p1.tag ~= SuspenseComponent then
        return
    end
    local v1 = requestUpdateLane(p1)
    scheduleUpdateOnFiber(p1, v1, (requestEventTime()))
    u353(p1, v1)
end
function v6.runWithPriority(p1, p2) -- Line: 489 -- upvalues: getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), describeError (val)
    local v1, v2
    setCurrentUpdateLanePriority(p1)
    v1, v2 = xpcall(p2, describeError)
    setCurrentUpdateLanePriority((getCurrentUpdateLanePriority()))
    if not v1 then
        error(v2)
    end
    return v2
end
v6.getCurrentUpdateLanePriority = getCurrentUpdateLanePriority
v6.findHostInstance = findHostInstance
function v6.findHostInstanceWithWarning(p1, p2) -- Line: 215 -- upvalues: __DEV__ (val), get (val), invariant (val), Object (val), findCurrentHostFiber (val), StrictMode (val), getComponentName (val), u301 (ref), ReactCurrentFiber (val), setCurrentFiber (val), console (val), describeError (val), resetCurrentFiber (val), findHostInstance (val)
    if not __DEV__ then
        return (findHostInstance(p1))
    end
    local u5 = get(p1)
    if u5 == nil then
        if typeof(p1.render) ~= "function" then
            invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(p1)))
        else
            invariant(false, "Unable to find node on an unmounted component.")
        end
    end
    local u26 = findCurrentHostFiber(u5)
    if u26 == nil then
        return nil
    end
    if bit32.band(u26.mode, StrictMode) ~= 0 then
        local u35 = getComponentName(u5.type) or "Component"
        if not (u301[u35]) then
            local v1, v2
            u301[u35] = true
            local current = ReactCurrentFiber.current
            v1, v2 = xpcall(function() -- Line: 243 -- upvalues: setCurrentFiber (upval), u26 (val), u5 (val), StrictMode (upval), console (upval), p2 (val), u35 (val)
                setCurrentFiber(u26)
                if bit32.band(u5.mode, StrictMode) ~= 0 then
                    console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, u35)
                    return
                end
                console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, u35)
            end, describeError)
            if not current then
                resetCurrentFiber()
            else
                setCurrentFiber(current)
            end
            if not v1 then
                error(v2)
            end
        end
    end
    return u26.stateNode
end
function v6.findHostInstanceWithNoPortals(p1) -- Line: 507 -- upvalues: findCurrentHostFiberWithNoPortals (val), FundamentalComponent (val)
    local v1 = findCurrentHostFiberWithNoPortals(p1)
    if v1 == nil then
        return nil
    end
    if v1.tag == FundamentalComponent then
        return v1.stateNode.instance
    end
    return v1.stateNode
end
local function shouldSuspendImpl(p1) -- Line: 518
    return false
end
function v6.shouldSuspend(p1) -- Line: 522 -- upvalues: shouldSuspendImpl (ref)
    return shouldSuspendImpl(p1)
end
local u392 = nil
local u394 = nil
local u395 = nil
local u396 = nil
local u397 = nil
local u398 = nil
local u399 = nil
local u400 = nil
if __DEV__ then
    local copyWithDeleteImpl, copyWithRenameImpl, copyWithSetImpl
    function copyWithDeleteImpl(p1, p2, p3) -- Line: 537 -- upvalues: Array (val), copyWithDeleteImpl (val)
        local v1
        local v2 = p2[p3]
        if not (Array.isArray(p1)) then
            v1 = table.clone(p1)
        else
            v1 = Array.slice(p1)
        end
        if p3 + 1 ~= #p2 then
            v1[v2] = copyWithDeleteImpl(p1[v2], p2, p3 + 1)
            return v1
        end
        if Array.isArray(v1) then
            Array.splice(v1, v2, 1)
            return v1
        end
        v1[v2] = nil
        return v1
    end
    local function copyWithDelete(p1, p2) -- Line: 565 -- upvalues: copyWithDeleteImpl (val)
        return (copyWithDeleteImpl(p1, p2, 0))
    end
    function copyWithRenameImpl(p1, p2, p3, p4) -- Line: 573 -- upvalues: Array (val), copyWithRenameImpl (val)
        local v1
        local v2 = p2[p4]
        if not (Array.isArray(p1)) then
            v1 = table.clone(p1)
        else
            v1 = Array.slice(p1)
        end
        if p4 + 1 ~= #p2 then
            v1[v2] = copyWithRenameImpl(p1[v2], p2, p3, p4 + 1)
            return v1
        end
        v1[p3[p4]] = v1[v2]
        if Array.isArray(v1) then
            Array.splice(v1, v2, 1)
            return v1
        end
        v1[v2] = nil
        return v1
    end
    local function copyWithRename(p1, p2, p3) -- Line: 609 -- upvalues: console (val), copyWithRenameImpl (val)
        if #p2 ~= #p3 then
            console.warn("copyWithRename() expects paths of the same length")
            return nil
        end
        local v1 = #p3
        local v2 = 1
        for i = 1, v1, v2 do
            if p2[i] ~= p3[i] then
                console.warn("copyWithRename() expects paths to be the same except for the deepest key")
                return nil
            end
        end
        return (copyWithRenameImpl(p1, p2, p3, 0))
    end
    function copyWithSetImpl(p1, p2, p3, p4) -- Line: 631 -- upvalues: Array (val), copyWithSetImpl (val)
        local v1
        if #p2 + 1 <= p3 then
            return p4
        end
        local v2 = p2[p3]
        if not (Array.isArray(p1)) then
            v1 = table.clone(p1)
        else
            v1 = Array.slice(p1)
        end
        v1[v2] = copyWithSetImpl(p1[v2], p2, p3 + 2, p4)
        return v1
    end
    local function copyWithSet(p1, p2, p3) -- Line: 653 -- upvalues: copyWithSetImpl (val)
        return (copyWithSetImpl(p1, p2, 1, p3))
    end
    local function findHook(p1, p2) -- Line: 661
        local memoizedState = p1.memoizedState
        local v1 = p2
        while memoizedState ~= nil do
            if 1 >= v1 then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        return memoizedState
    end
    function u392(p1, p2, p3, p4) -- Line: 674 -- upvalues: copyWithSetImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = p2
        local memoizedState = p1.memoizedState
        while memoizedState ~= nil do
            if 1 >= v1 then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        local v2 = memoizedState
        if v2 ~= nil then
            v1 = copyWithSetImpl(v2.memoizedState, p3, 1, p4)
            v2.memoizedState = v1
            v2.baseState = v1
            p1.memoizedProps = table.clone(p1.memoizedProps)
            scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
        end
    end
    function u394(p1, p2, p3) -- Line: 692 -- upvalues: copyWithDeleteImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = p2
        local memoizedState = p1.memoizedState
        while memoizedState ~= nil do
            if 1 >= v1 then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        local v2 = memoizedState
        if v2 ~= nil then
            v1 = copyWithDeleteImpl(v2.memoizedState, p3, 0)
            v2.memoizedState = v1
            v2.baseState = v1
            p1.memoizedProps = table.clone(p1.memoizedProps)
            scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
        end
    end
    function u395(p1, p2, p3, p4) -- Line: 709 -- upvalues: copyWithRename (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = p2
        local memoizedState = p1.memoizedState
        while memoizedState ~= nil do
            if 1 >= v1 then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        local v2 = memoizedState
        if v2 ~= nil then
            v1 = copyWithRename(v2.memoizedState, p3, p4)
            v2.memoizedState = v1
            v2.baseState = v1
            p1.memoizedProps = table.clone(p1.memoizedProps)
            scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
        end
    end
    function u396(p1, p2, p3) -- Line: 733 -- upvalues: copyWithSetImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        p1.pendingProps = copyWithSetImpl(p1.memoizedProps, p2, 1, p3)
        local alternate = p1.alternate
        if alternate then
            alternate.pendingProps = p1.pendingProps
        end
        scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
    end
    function u397(p1, p2) -- Line: 742 -- upvalues: copyWithDeleteImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        p1.pendingProps = copyWithDeleteImpl(p1.memoizedProps, p2, 0)
        local alternate = p1.alternate
        if alternate then
            alternate.pendingProps = p1.pendingProps
        end
        scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
    end
    function u398(p1, p2, p3) -- Line: 751 -- upvalues: copyWithRename (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        p1.pendingProps = copyWithRename(p1.memoizedProps, p2, p3)
        local alternate = p1.alternate
        if alternate then
            alternate.pendingProps = p1.pendingProps
        end
        scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
    end
    function u399(p1) -- Line: 765 -- upvalues: scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        scheduleUpdateOnFiber(p1, SyncLane, NoTimestamp)
    end
    function u400(p1) -- Line: 769 -- upvalues: shouldSuspendImpl (ref)
        shouldSuspendImpl = p1
    end
end
function findHostInstanceByFiber(p1) -- Line: 774 -- upvalues: findCurrentHostFiber (val)
    local v1 = findCurrentHostFiber(p1)
    if v1 == nil then
        return nil
    end
    return v1.stateNode
end
function emptyFindFiberByHostInstance(p1) -- Line: 782
    return nil
end
function getCurrentFiberForDevTools() -- Line: 786 -- upvalues: ReactCurrentFiber (val)
    return ReactCurrentFiber.current
end
function v6.injectIntoDevTools(p1) -- Line: 790 -- upvalues: ReactSharedInternals (val), __DEV__ (val), injectInternals (val), u392 (ref), u394 (ref), u395 (ref), u396 (ref), u397 (ref), u398 (ref), u400 (ref), u399 (ref)
    local v1 = if __DEV__ then getCurrentFiberForDevTools else nil
    local v2 = {
        bundleType = p1.bundleType,
        version = p1.version,
        rendererPackageName = p1.rendererPackageName,
        rendererConfig = p1.rendererConfig,
        overrideHookState = u392,
        overrideHookStateDeletePath = u394,
        overrideHookStateRenamePath = u395,
        overrideProps = u396,
        overridePropsDeletePath = u397,
        overridePropsRenamePath = u398,
        setSuspenseHandler = u400,
        scheduleUpdate = u399,
        currentDispatcherRef = ReactSharedInternals.ReactCurrentDispatcher,
        findHostInstanceByFiber = findHostInstanceByFiber,
    }
    local v3 = p1.findFiberByHostInstance
    if not v3 then
        v3 = emptyFindFiberByHostInstance
    end
    v2.findFiberByHostInstance = v3
    v2.getCurrentFiber = v1
    return injectInternals(v2)
end
v6.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)
return v6