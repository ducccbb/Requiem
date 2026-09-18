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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkLoop.new
--                               Dumped in 0.0335 seconds
--                         Bytecode version 9  |  137 functions

local flushPassiveUnmountEffects, flushWorkAndMicroTasks, u538, unstable_flushAllWithoutAsserting
local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local Set = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local u24 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local scheduler = require(script.Parent.Parent:WaitForChild("scheduler"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local skipUnmountedBoundaries = ReactFeatureFlags.skipUnmountedBoundaries
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local v2 = require(script.Parent.Parent:WaitForChild("shared"))
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v3 = v2.ReactSharedInternals
local invariant = v2.invariant
local v4 = require(script.Parent:WaitForChild("SchedulerWithReactIntegration.new"))
local scheduleCallback = v4.scheduleCallback
local cancelCallback = v4.cancelCallback
local getCurrentPriorityLevel = v4.getCurrentPriorityLevel
local runWithPriority = v4.runWithPriority
local shouldYield = v4.shouldYield
local requestPaint = v4.requestPaint
local now = v4.now
local NoPriority = v4.NoPriority
local ImmediatePriority = v4.ImmediatePriority
local UserBlockingPriority = v4.UserBlockingPriority
local NormalPriority = v4.NormalPriority
local flushSyncCallbackQueue = v4.flushSyncCallbackQueue
local scheduleSyncCallback = v4.scheduleSyncCallback
local DebugTracing = require(script.Parent:WaitForChild("DebugTracing"))
local SchedulingProfiler = require(script.Parent:WaitForChild("SchedulingProfiler"))
local v5 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing
local __interactionsRef = v5.__interactionsRef
local __subscriberRef = v5.__subscriberRef
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local u174 = require(script.Parent:WaitForChild("ReactFiber.new"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local LegacyRoot = require(script.Parent:WaitForChild("ReactRootTags")).LegacyRoot
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local SyncLane = ReactFiberLane.SyncLane
local SyncBatchedLane = ReactFiberLane.SyncBatchedLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local findUpdateLane = ReactFiberLane.findUpdateLane
local findTransitionLane = ReactFiberLane.findTransitionLane
local findRetryLane = ReactFiberLane.findRetryLane
local includesSomeLane = ReactFiberLane.includesSomeLane
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local removeLanes = ReactFiberLane.removeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane
local hasDiscreteLanes = ReactFiberLane.hasDiscreteLanes
local includesNonIdleWork = ReactFiberLane.includesNonIdleWork
local includesOnlyRetries = ReactFiberLane.includesOnlyRetries
local includesOnlyTransitions = ReactFiberLane.includesOnlyTransitions
local getNextLanes = ReactFiberLane.getNextLanes
local returnNextLanesPriority = ReactFiberLane.returnNextLanesPriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local markStarvedLanesAsExpired = ReactFiberLane.markStarvedLanesAsExpired
local getLanesToRetrySynchronouslyOnError = ReactFiberLane.getLanesToRetrySynchronouslyOnError
local getMostRecentEventTime = ReactFiberLane.getMostRecentEventTime
local markRootUpdated = ReactFiberLane.markRootUpdated
local markRootSuspended = ReactFiberLane.markRootSuspended
local markRootPinged = ReactFiberLane.markRootPinged
local markRootExpired = ReactFiberLane.markRootExpired
local markDiscreteUpdatesExpired = ReactFiberLane.markDiscreteUpdatesExpired
local markRootFinished = ReactFiberLane.markRootFinished
local schedulerPriorityToLanePriority = ReactFiberLane.schedulerPriorityToLanePriority
local lanePriorityToSchedulerPriority = ReactFiberLane.lanePriorityToSchedulerPriority
local ReactFiberTransition = require(script.Parent:WaitForChild("ReactFiberTransition"))
local v6 = require(script.Parent:WaitForChild("ReactFiberUnwindWork.new"))
local unwindWork = v6.unwindWork
local unwindInterruptedWork = v6.unwindInterruptedWork
local v7 = require(script.Parent:WaitForChild("ReactFiberThrow.new"))
local throwException = v7.throwException
local createRootErrorUpdate = v7.createRootErrorUpdate
local createClassErrorUpdate = v7.createClassErrorUpdate
local u274 = require(script.Parent:WaitForChild("ReactFiberCommitWork.new"))
local commitBeforeMutationLifeCycles = u274.commitBeforeMutationLifeCycles
local commitPlacement = u274.commitPlacement
local commitWork = u274.commitWork
local commitDeletion = u274.commitDeletion
local commitPassiveUnmount = u274.commitPassiveUnmount
local commitPassiveUnmountInsideDeletedTree = u274.commitPassiveUnmountInsideDeletedTree
local commitPassiveMount = u274.commitPassiveMount
local commitDetachRef = u274.commitDetachRef
local invokeLayoutEffectMountInDEV = u274.invokeLayoutEffectMountInDEV
local invokePassiveEffectMountInDEV = u274.invokePassiveEffectMountInDEV
local invokeLayoutEffectUnmountInDEV = u274.invokeLayoutEffectUnmountInDEV
local invokePassiveEffectUnmountInDEV = u274.invokePassiveEffectUnmountInDEV
local recursivelyCommitLayoutEffects = u274.recursivelyCommitLayoutEffects
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local enqueueUpdate = require(script.Parent:WaitForChild("ReactUpdateQueue.new")).enqueueUpdate
local resetContextDependencies = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).resetContextDependencies
local RobloxReactProfiling = require(script.Parent.RobloxReactProfiling)
local u320 = nil
local u321 = {}
local function u322(p1, p2, p3) -- Line: 240 -- upvalues: u321 (val)
    if not u321.originalBeginWorkRef then
        u321.originalBeginWorkRef = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).beginWork
    end
    return u321.originalBeginWorkRef(p1, p2, p3)
end
local function v8(p1, p2, p3) -- Line: 249 -- upvalues: u321 (val)
    if not u321.completeWorkRef then
        u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
    end
    return u321.completeWorkRef(p1, p2, p3)
end
local u324 = nil
local function initReactFiberHooks() -- Line: 259 -- upvalues: u324 (ref), u321 (val)
    u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
    u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
    u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
    u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end
local function v9() -- Line: 268 -- upvalues: u321 (val), u324 (ref)
    if not u321.resetHooksAfterThrowRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.resetHooksAfterThrowRef()
end
local function v10() -- Line: 276 -- upvalues: u321 (val), u324 (ref)
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.ContextOnlyDispatcherRef
end
local function v11() -- Line: 284 -- upvalues: u321 (val), u324 (ref)
    if not u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef()
end
local createCapturedValue = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local push = v1.push
local pop = v1.pop
local u348 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local u366 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local current = ReactCurrentFiber.current
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local v12 = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local invokeGuardedCallback = v12.invokeGuardedCallback
local hasCaughtError = v12.hasCaughtError
local clearCaughtError = v12.clearCaughtError
local onCommitRoot = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitRoot
local onCommitRoot_2 = require(script.Parent:WaitForChild("ReactTestSelectors")).onCommitRoot
local enqueueTask = require(script.Parent.Parent:WaitForChild("shared")).enqueueTask
local doesFiberContain = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).doesFiberContain
local ReactCurrentDispatcher = v3.ReactCurrentDispatcher
local ReactCurrentOwner = v3.ReactCurrentOwner
local IsSomeRendererActing = v3.IsSomeRendererActing
local u431 = nil
local u433 = {}
u24.NoContext = 0
u24.RetryAfterError = 64
local v13 = {
    Incomplete = 0,
    FatalErrored = 1,
    Errored = 2,
    Suspended = 3,
    SuspendedWithDelay = 4,
    Completed = 5,
}
local u437 = 0
local u438 = nil
local u439 = nil
local NoLanes = ReactFiberLane.NoLanes
u24.subtreeRenderLanes = ReactFiberLane.NoLanes
local u444 = v1.createCursor(ReactFiberLane.NoLanes)
local u445 = 0
local u446 = nil
local NoLanes_2 = ReactFiberLane.NoLanes
local ReactFiberWorkInProgress = require(script.Parent:WaitForChild("ReactFiberWorkInProgress"))
local workInProgressRootSkippedLanes = ReactFiberWorkInProgress.workInProgressRootSkippedLanes
local NoLanes_3 = ReactFiberLane.NoLanes
local NoLanes_4 = ReactFiberLane.NoLanes
local u459 = nil
local u460 = 0
local u461 = (1 / 0)
local u462 = nil
local function resetRenderTimer() -- Line: 419 -- upvalues: u461 (ref), now (val)
    u461 = now() + 500
end
function u24.getRenderTargetTime() -- Line: 423 -- upvalues: u461 (ref)
    return u461
end
local u465 = false
local u466 = nil
local u467 = nil
local u468 = false
local u469 = nil
local u470 = NoPriority
local NoLanes_5 = ReactFiberLane.NoLanes
local u472 = nil
local u473 = 0
local u474 = nil
local u475 = 0
local u476 = nil
local u477 = NoTimestamp
local NoLanes_6 = ReactFiberLane.NoLanes
local NoLanes_7 = ReactFiberLane.NoLanes
local u480 = nil
local u481 = false
function u24.getWorkInProgressRoot() -- Line: 463 -- upvalues: u438 (ref)
    return u438
end
function u24.requestEventTime() -- Line: 467 -- upvalues: u437 (ref), now (val), u477 (ref), NoTimestamp (val)
    if bit32.band(u437, 48) ~= 0 then
        return now()
    end
    if u477 ~= NoTimestamp then
        return u477
    end
    u477 = now()
    return u477
end
function u24.requestUpdateLane(p1) -- Line: 489 -- upvalues: ReactTypeOfMode (val), SyncLane (val), getCurrentPriorityLevel (val), ImmediatePriority (val), SyncBatchedLane (val), ReactFeatureFlags (val), u437 (ref), NoLanes (ref), ReactFiberLane (val), pickArbitraryLane (val), NoLanes_6 (ref), NoLanes_2 (ref), ReactFiberTransition (val), NoLanes_7 (ref), u459 (ref), findTransitionLane (val), UserBlockingPriority (val), findUpdateLane (val), schedulerPriorityToLanePriority (val), getCurrentUpdateLanePriority (val), __DEV__ (val), console (val)
    local mode = p1.mode
    local v1 = bit32.band(mode, ReactTypeOfMode.BlockingMode)
    if v1 == ReactTypeOfMode.NoMode then
        return SyncLane
    end
    v1 = bit32.band(mode, ReactTypeOfMode.ConcurrentMode)
    if v1 == ReactTypeOfMode.NoMode then
        if getCurrentPriorityLevel() == ImmediatePriority then
            return SyncLane
        end
        return SyncBatchedLane
    end
    if ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch then
        local v2, v3, v4
        if NoLanes_6 == ReactFiberLane.NoLanes then
            NoLanes_6 = NoLanes_2
        end
        v1 = ReactFiberTransition.requestCurrentTransition() ~= ReactFiberTransition.NoTransition
        if v1 then
            if NoLanes_7 ~= ReactFiberLane.NoLanes then
                if u459 == nil then
                    NoLanes_7 = ReactFiberLane.NoLanes
                else
                    NoLanes_7 = u459.pendingLanes
                end
            end
            return findTransitionLane(NoLanes_6, NoLanes_7)
        end
        local v5 = getCurrentPriorityLevel()
        if bit32.band(u437, 4) == 0 then
            v2 = schedulerPriorityToLanePriority(v5)
            if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
                v3 = getCurrentUpdateLanePriority()
                if v2 ~= v3 and v3 ~= ReactFiberLane.NoLanePriority and __DEV__ then
                    v4 = tostring(v2)
                    console.error("Expected current scheduler lane priority %s to match current update lane priority %s", v4, (tostring(v3)))
                end
            end
            return (findUpdateLane(v2, NoLanes_6))
        end
        if v5 == UserBlockingPriority then
            return (findUpdateLane(ReactFiberLane.InputDiscreteLanePriority, NoLanes_6))
        end
        v2 = schedulerPriorityToLanePriority(v5)
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
            v3 = getCurrentUpdateLanePriority()
            if v2 ~= v3 and v3 ~= ReactFiberLane.NoLanePriority and __DEV__ then
                v4 = tostring(v2)
                console.error("Expected current scheduler lane priority %s to match current update lane priority %s", v4, (tostring(v3)))
            end
        end
        return (findUpdateLane(v2, NoLanes_6))
    elseif bit32.band(u437, 16) ~= 0 and NoLanes ~= ReactFiberLane.NoLanes then
        return pickArbitraryLane(NoLanes)
    end
end
function requestRetryLane(p1) -- Line: 593 -- upvalues: ReactTypeOfMode (val), SyncLane (val), getCurrentPriorityLevel (val), ImmediatePriority (val), SyncBatchedLane (val), NoLanes_6 (ref), ReactFiberLane (val), NoLanes_2 (ref), findRetryLane (val)
    local mode = p1.mode
    local v1 = bit32.band(mode, ReactTypeOfMode.BlockingMode)
    if v1 == ReactTypeOfMode.NoMode then
        return SyncLane
    end
    v1 = bit32.band(mode, ReactTypeOfMode.ConcurrentMode)
    if v1 == ReactTypeOfMode.NoMode then
        if getCurrentPriorityLevel() == ImmediatePriority then
            return SyncLane
        end
        return SyncBatchedLane
    end
    if NoLanes_6 == ReactFiberLane.NoLanes then
        NoLanes_6 = NoLanes_2
    end
    return findRetryLane(NoLanes_6)
end
function u24.scheduleUpdateOnFiber(p1, p2, p3) -- Line: 615 -- upvalues: u433 (val), markRootUpdated (val), u438 (ref), ReactFeatureFlags (val), u437 (ref), NoLanes_3 (ref), mergeLanes (val), u445 (ref), NoLanes (ref), getCurrentPriorityLevel (val), SyncLane (val), u320 (ref), u461 (ref), now (val), flushSyncCallbackQueue (val), UserBlockingPriority (val), ImmediatePriority (val), u472 (ref), Set (val), u459 (ref)
    u433.checkForNestedUpdates()
    local v1 = u433.markUpdateLaneFromFiberToRoot(p1, p2)
    if v1 == nil then
        return nil
    end
    markRootUpdated(v1, p2, p3)
    if v1 == u438 then
        u433.warnAboutRenderPhaseUpdatesInDEV(p1)
        if ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch then
            NoLanes_3 = mergeLanes(NoLanes_3, p2)
        elseif bit32.band(u437, 16) ~= 0 then
        end
        if u445 == 4 then
            u433.markRootSuspended(v1, NoLanes)
        end
    end
    local v2 = getCurrentPriorityLevel()
    if p2 ~= SyncLane then
        if bit32.band(u437, 4) ~= 0 then
            if v2 == UserBlockingPriority then
                if u472 ~= nil then
                    u472:add(v1)
                else
                    u472 = Set.new({v1})
                end
            elseif v2 ~= ImmediatePriority then
            end
        end
        u320(v1, p3)
        u433.schedulePendingInteractions(v1, p2)
    elseif bit32.band(u437, 8) == 0 then
        u320(v1, p3)
        u433.schedulePendingInteractions(v1, p2)
        if u437 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
    elseif bit32.band(u437, 48) ~= 0 then
        u320(v1, p3)
        u433.schedulePendingInteractions(v1, p2)
        if u437 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
    else
        u433.schedulePendingInteractions(v1, p2)
        u433.performSyncWorkOnRoot(v1)
    end
    u459 = v1
    return v1
end
function u433.markUpdateLaneFromFiberToRoot(p1, p2) -- Line: 725 -- upvalues: mergeLanes (val), __DEV__ (val), ReactFiberFlags (val), u433 (val), ReactWorkTags (val)
    local alternate_2, v1, v2, v3, v4
    p1.lanes = mergeLanes(p1.lanes, p2)
    local alternate = p1.alternate
    if alternate ~= nil then
        alternate.lanes = mergeLanes(alternate.lanes, p2)
    end
    if __DEV__ and alternate == nil then
        v3 = bit32.band(p1.flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Hydrating)))
        if v3 ~= ReactFiberFlags.NoFlags then
            u433.warnAboutUpdateOnNotYetMountedFiberInDEV(p1)
        end
    end
    v3 = p1
    local return_ = p1.return_
    v2, v1 = p2, p1
    while return_ ~= nil do
        return_.childLanes = mergeLanes(return_.childLanes, v2)
        alternate_2 = return_.alternate
        if alternate_2 ~= nil then
            alternate_2.childLanes = mergeLanes(alternate_2.childLanes, v2)
        elseif __DEV__ then
            v4 = bit32.band(return_.flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Hydrating)))
            if v4 ~= ReactFiberFlags.NoFlags then
                u433.warnAboutUpdateOnNotYetMountedFiberInDEV(v1)
            end
        end
        v3 = return_
        return_ = return_.return_
    end
    if v3.tag == ReactWorkTags.HostRoot then
        return v3.stateNode
    end
    return nil
end
function u320(p1, p2) -- Line: 780 -- upvalues: markStarvedLanesAsExpired (val), u438 (ref), NoLanes (ref), ReactFiberLane (val), getNextLanes (val), returnNextLanesPriority (val), cancelCallback (val), scheduleSyncCallback (val), RobloxReactProfiling (val), u433 (val), scheduleCallback (val), ImmediatePriority (val), lanePriorityToSchedulerPriority (val)
    local NoLanes_2, v1, v2
    local callbackNode = p1.callbackNode
    markStarvedLanesAsExpired(p1, p2)
    if p1 ~= u438 then
        NoLanes_2 = ReactFiberLane.NoLanes
    else
        NoLanes_2 = NoLanes
    end
    local v3 = getNextLanes(p1, NoLanes_2)
    local v4 = returnNextLanesPriority()
    if v3 == ReactFiberLane.NoLanes then
        if callbackNode ~= nil then
            cancelCallback(callbackNode)
            p1.callbackNode = nil
            p1.callbackPriority = ReactFiberLane.NoLanePriority
        end
        return
    end
    if callbackNode == nil then
        if v4 == ReactFiberLane.SyncLanePriority then
            v1 = scheduleSyncCallback(function() -- Line: 825 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
                local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
                local v2 = u433.performSyncWorkOnRoot(p1)
                RobloxReactProfiling.profileRootAfterYielding(v1)
                return v2
            end)
        elseif v4 ~= ReactFiberLane.SyncBatchedLanePriority then
            v2 = lanePriorityToSchedulerPriority(v4)
            v1 = scheduleCallback(v2, function() -- Line: 843 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
                local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
                local v2 = u433.performConcurrentWorkOnRoot(p1)
                RobloxReactProfiling.profileRootAfterYielding(v1)
                return v2
            end)
        else
            v1 = scheduleCallback(ImmediatePriority, function() -- Line: 833 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
                local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
                local v2 = u433.performSyncWorkOnRoot(p1)
                RobloxReactProfiling.profileRootAfterYielding(v1)
                return v2
            end)
        end
        p1.callbackPriority = v4
        p1.callbackNode = v1
        return
    end
    if p1.callbackPriority == v4 then
        return
    end
    cancelCallback(callbackNode)
    if v4 == ReactFiberLane.SyncLanePriority then
        v1 = scheduleSyncCallback(function() -- Line: 825 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
            local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
            local v2 = u433.performSyncWorkOnRoot(p1)
            RobloxReactProfiling.profileRootAfterYielding(v1)
            return v2
        end)
    elseif v4 ~= ReactFiberLane.SyncBatchedLanePriority then
        v2 = lanePriorityToSchedulerPriority(v4)
        v1 = scheduleCallback(v2, function() -- Line: 843 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
            local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
            local v2 = u433.performConcurrentWorkOnRoot(p1)
            RobloxReactProfiling.profileRootAfterYielding(v1)
            return v2
        end)
    else
        v1 = scheduleCallback(ImmediatePriority, function() -- Line: 833 -- upvalues: RobloxReactProfiling (upval), p1 (val), u433 (upval)
            local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(p1)
            local v2 = u433.performSyncWorkOnRoot(p1)
            RobloxReactProfiling.profileRootAfterYielding(v1)
            return v2
        end)
    end
    p1.callbackPriority = v4
    p1.callbackNode = v1
end
function u433.performConcurrentWorkOnRoot(p1) -- Line: 859 -- upvalues: u477 (ref), NoTimestamp (val), NoLanes_6 (ref), ReactFiberLane (val), NoLanes_7 (ref), invariant (val), u437 (ref), u24 (val), getNextLanes (val), u438 (ref), NoLanes (ref), u433 (val), includesSomeLane (val), NoLanes_2 (ref), NoLanes_3 (ref), ReactFiberHostConfig (val), getLanesToRetrySynchronouslyOnError (val), u446 (ref), u320 (ref), now (val)
    u477 = NoTimestamp
    NoLanes_6 = ReactFiberLane.NoLanes
    NoLanes_7 = ReactFiberLane.NoLanes
    local v1 = bit32.band(u437, 48) == 0
    invariant(v1, "Should not already be working.")
    local callbackNode = p1.callbackNode
    if not (u24.flushPassiveEffects()) then
        local NoLanes_4
        if p1 ~= u438 then
            NoLanes_4 = ReactFiberLane.NoLanes
        else
            NoLanes_4 = NoLanes
        end
        local v2 = getNextLanes(p1, NoLanes_4)
        if v2 == ReactFiberLane.NoLanes then
            return nil
        end
        local v3 = u433.renderRootConcurrent(p1, v2)
        if includesSomeLane(NoLanes_2, NoLanes_3) then
            u433.prepareFreshStack(p1, ReactFiberLane.NoLanes)
        elseif v3 ~= 0 then
            if v3 == 2 then
                u437 = bit32.bor(u437, 64)
                if p1.hydrate then
                    p1.hydrate = false
                    ReactFiberHostConfig.clearContainer(p1.containerInfo)
                end
                v2 = getLanesToRetrySynchronouslyOnError(p1)
                if v2 ~= ReactFiberLane.NoLanes then
                    v3 = u433.renderRootSync(p1, v2)
                end
            end
            if v3 == 1 then
                u433.prepareFreshStack(p1, ReactFiberLane.NoLanes)
                u433.markRootSuspended(p1, v2)
                u320(p1, now())
                error(u446)
            end
            p1.finishedWork = p1.current.alternate
            p1.finishedLanes = v2
            u433.finishConcurrentRender(p1, v3, v2)
        end
        u320(p1, now())
        if p1.callbackNode == callbackNode then
            return function() -- Line: 954 -- upvalues: u433 (upval), p1 (val)
                return u433.performConcurrentWorkOnRoot(p1)
            end
        end
        return nil
    elseif p1.callbackNode ~= callbackNode then
        return nil
    end
end
local u490 = 0
local u491 = false
function shouldForceFlushFallbacksInDEV() -- Line: 967 -- upvalues: __DEV__ (val), u490 (ref)
    local v1 = __DEV__
    if v1 then
        v1 = 0 < u490
    end
    return v1
end
function u433.finishConcurrentRender(p1, p2, p3) -- Line: 972 -- upvalues: invariant (val), u433 (val), includesOnlyRetries (val), u460 (ref), now (val), getNextLanes (val), ReactFiberLane (val), isSubsetOfLanes (val), u24 (val), markRootPinged (val), ReactFiberHostConfig (val), includesOnlyTransitions (val), getMostRecentEventTime (val)
    local v1, v2
    if p2 == 0 or p2 == 1 then
        invariant(false, "Root did not complete. This is a bug in React.")
        return
    end
    if p2 == 2 then
        u433.commitRoot(p1)
        return
    end
    if p2 ~= 3 then
        if p2 == 4 then
            u433.markRootSuspended(p1, p3)
            if includesOnlyTransitions(p3) then
                return
            end
            if shouldForceFlushFallbacksInDEV() then
                u433.commitRoot(p1)
                return
            end
            v1 = getMostRecentEventTime(p1, p3)
            v2 = now() - v1
            local v3 = jnd(v2) - v2
            if 10 < v3 then
                p1.timeoutHandle = ReactFiberHostConfig.scheduleTimeout(function() -- Line: 1056 -- upvalues: u433 (upval), p1 (val)
                    return u433.commitRoot(p1)
                end, v3)
                return
            end
            u433.commitRoot(p1)
            return
        end
        if p2 == 5 then
            u433.commitRoot(p1)
            return
        end
        invariant(false, "Unknown root exit status.")
        return
    end
    u433.markRootSuspended(p1, p3)
    if not (includesOnlyRetries(p3)) or shouldForceFlushFallbacksInDEV() then
        u433.commitRoot(p1)
        return
    end
    v2 = u460 + 500
    v1 = v2 - now()
    if 10 >= v1 then
        u433.commitRoot(p1)
        return
    end
    v2 = getNextLanes(p1, ReactFiberLane.NoLanes)
    if v2 ~= ReactFiberLane.NoLanes then
        return
    end
    local suspendedLanes = p1.suspendedLanes
    if not (isSubsetOfLanes(suspendedLanes, p3)) then
        markRootPinged(p1, suspendedLanes, (u24.requestEventTime()))
        return
    end
    p1.timeoutHandle = ReactFiberHostConfig.scheduleTimeout(function() -- Line: 1021 -- upvalues: u433 (upval), p1 (val)
        return u433.commitRoot(p1)
    end, v1)
end
function u433.markRootSuspended(p1, p2) -- Line: 1072 -- upvalues: removeLanes (val), NoLanes_4 (ref), NoLanes_3 (ref), markRootSuspended (val)
    local v1 = removeLanes(p2, NoLanes_4)
    v1 = removeLanes(v1, NoLanes_3)
    markRootSuspended(p1, v1)
end
function u433.performSyncWorkOnRoot(p1) -- Line: 1084 -- upvalues: invariant (val), u437 (ref), u24 (val), u438 (ref), includesSomeLane (val), NoLanes (ref), u433 (val), NoLanes_2 (ref), NoLanes_3 (ref), getNextLanes (val), ReactFiberLane (val), LegacyRoot (val), ReactFiberHostConfig (val), getLanesToRetrySynchronouslyOnError (val), u446 (ref), u320 (ref), now (val)
    local v1
    local v2 = bit32.band(u437, 48) == 0
    invariant(v2, "Should not already be working.")
    u24.flushPassiveEffects()
    if p1 ~= u438 then
        v1 = getNextLanes(p1, ReactFiberLane.NoLanes)
        v2 = u433.renderRootSync(p1, v1)
    elseif includesSomeLane(p1.expiredLanes, NoLanes) then
        v1 = NoLanes
        v2 = u433.renderRootSync(p1, v1)
        if includesSomeLane(NoLanes_2, NoLanes_3) then
            v1 = getNextLanes(p1, v1)
            v2 = u433.renderRootSync(p1, v1)
        end
    end
    if p1.tag ~= LegacyRoot and v2 == 2 then
        u437 = bit32.bor(u437, 64)
        if p1.hydrate then
            p1.hydrate = false
            ReactFiberHostConfig.clearContainer(p1.containerInfo)
        end
        v1 = getLanesToRetrySynchronouslyOnError(p1)
        if v1 ~= ReactFiberLane.NoLanes then
            v2 = u433.renderRootSync(p1, v1)
        end
    end
    if v2 == 1 then
        u433.prepareFreshStack(p1, ReactFiberLane.NoLanes)
        u433.markRootSuspended(p1, v1)
        u320(p1, now())
        error(u446)
    end
    p1.finishedWork = p1.current.alternate
    p1.finishedLanes = v1
    u433.commitRoot(p1)
    u320(p1, now())
    return nil
end
function u24.flushRoot(p1, p2) -- Line: 1166 -- upvalues: markRootExpired (val), u320 (ref), now (val), u437 (ref), u461 (ref), flushSyncCallbackQueue (val)
    markRootExpired(p1, p2)
    u320(p1, now())
    if bit32.band(u437, 48) == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
end
function u24.getExecutionContext() -- Line: 1178 -- upvalues: u437 (ref)
    return u437
end
function u24.flushDiscreteUpdates() -- Line: 1182 -- upvalues: u437 (ref), __DEV__ (val), console (val), u433 (val), u24 (val)
    if bit32.band(u437, 49) == 0 then
        u433.flushPendingDiscreteUpdates()
        u24.flushPassiveEffects()
        return
    end
    if __DEV__ and bit32.band(u437, 16) ~= 0 then
        console.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
    end
end
function u24.deferredUpdates(p1) -- Line: 1212 -- upvalues: ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), __YOLO__ (val), setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val), NormalPriority (val)
    local v1, v2
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        return runWithPriority(NormalPriority, p1)
    end
    local v3 = getCurrentUpdateLanePriority()
    if __YOLO__ then
        v1 = true
        setCurrentUpdateLanePriority(ReactFiberLane.DefaultLanePriority)
        v2 = runWithPriority(NormalPriority, p1)
    else
        local v4, v5
        setCurrentUpdateLanePriority(ReactFiberLane.DefaultLanePriority)
        v4, v5 = xpcall(runWithPriority, describeError, NormalPriority, p1)
        v1 = v4
        v2 = v5
    end
    setCurrentUpdateLanePriority(v3)
    if v1 then
        return v2
    end
    error(v2)
end
function u433.flushPendingDiscreteUpdates() -- Line: 1241 -- upvalues: u472 (ref), markDiscreteUpdatesExpired (val), u320 (ref), now (val), flushSyncCallbackQueue (val)
    if u472 ~= nil then
        u472 = nil
        u472:forEach(function(p1) -- Line: 1247 -- upvalues: markDiscreteUpdatesExpired (upval), u320 (upval), now (upval)
            markDiscreteUpdatesExpired(p1)
            u320(p1, now())
        end)
    end
    flushSyncCallbackQueue()
end
function u24.batchedUpdates(p1, p2) -- Line: 1256 -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    u437 = bit32.bor(u437, 1)
    if __YOLO__ then
        v1 = true
        v2 = p1(p2)
    else
        local v3, v4
        v3, v4 = xpcall(p1, describeError, p2)
        v1 = v3
        v2 = v4
    end
    u437 = u437
    if u437 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end
function u24.batchedEventUpdates(p1, p2) -- Line: 1284 -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    u437 = bit32.bor(u437, 2)
    if __YOLO__ then
        v1 = true
        v2 = p1(p2)
    else
        local v3, v4
        v3, v4 = xpcall(p1, describeError, p2)
        v1 = v3
        v2 = v4
    end
    u437 = u437
    if u437 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end
function u24.discreteUpdates(p1, p2, p3, p4, p5) -- Line: 1313 -- upvalues: u437 (ref), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val), UserBlockingPriority (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 4)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        local v4
        v4, v1 = xpcall(runWithPriority, describeError, UserBlockingPriority, function() -- Line: 1349 -- upvalues: p1 (val), p2 (val), p3 (val), p4 (val), p5 (val)
            return p1(p2, p3, p4, p5)
        end)
        u437 = v3
        if u437 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
        if v4 then
            return v1
        end
        error(v1)
        return
    end
    setCurrentUpdateLanePriority(ReactFiberLane.InputDiscreteLanePriority)
    v1, v2 = xpcall(runWithPriority, describeError, UserBlockingPriority, function() -- Line: 1325 -- upvalues: p1 (val), p2 (val), p3 (val), p4 (val), p5 (val)
        return p1(p2, p3, p4, p5)
    end)
    setCurrentUpdateLanePriority((getCurrentUpdateLanePriority()))
    u437 = v3
    if u437 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end
function u24.unbatchedUpdates(p1, p2) -- Line: 1370 -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    u437 = bit32.band(u437, 4294967294)
    u437 = bit32.bor(u437, 8)
    if __YOLO__ then
        v1 = true
        v2 = p1(p2)
    else
        local v3, v4
        v3, v4 = xpcall(p1, describeError, p2)
        v1 = v3
        v2 = v4
    end
    u437 = u437
    if u437 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end
function u24.flushSync(p1, p2) -- Line: 1398 -- upvalues: u437 (ref), __DEV__ (val), console (val), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), ReactFiberLane (val), __YOLO__ (val), runWithPriority (val), describeError (val), ImmediatePriority (val), flushSyncCallbackQueue (val)
    local v1, v2, v3, v4
    local v5 = u437
    if bit32.band(v5, 48) ~= 0 then
        if __DEV__ then
            console.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
        end
        return p1(p2)
    end
    u437 = bit32.bor(u437, 1)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        if __YOLO__ then
            v1 = true
            if not p1 then
                v2 = nil
            else
                v2 = runWithPriority(ImmediatePriority, function() -- Line: 1483 -- upvalues: p1 (val), p2 (val)
                    return p1(p2)
                end)
            end
        elseif not p1 then
            v1 = true
            v2 = nil
        else
            v3, v4 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 1471 -- upvalues: p1 (val), p2 (val)
                return p1(p2)
            end)
            v1 = v3
            v2 = v4
        end
        u437 = v5
        flushSyncCallbackQueue()
        if not v1 then
            error(v2)
        end
        return v2
    end
    v1 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
    if __YOLO__ then
        v2 = true
        setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
        if not p1 then
            v3 = nil
        else
            v3 = runWithPriority(ImmediatePriority, function() -- Line: 1441 -- upvalues: p1 (val), p2 (val)
                return p1(p2)
            end)
        end
    elseif not p1 then
        v2 = true
        v3 = nil
    else
        local v6
        v4, v6 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 1428 -- upvalues: p1 (val), p2 (val)
            return p1(p2)
        end)
        v2 = v4
        v3 = v6
    end
    setCurrentUpdateLanePriority(v1)
    u437 = v5
    flushSyncCallbackQueue()
    if not v2 then
        error(v3)
    end
    return v3
end
function u24.flushControlled(p1) -- Line: 1504 -- upvalues: u437 (ref), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val), ImmediatePriority (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 1)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        local v4
        v4, v1 = xpcall(runWithPriority, describeError, ImmediatePriority, p1)
        u437 = v3
        if u437 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
        if not v4 then
            error(v1)
        end
        return
    end
    setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
    v1, v2 = xpcall(runWithPriority, describeError, ImmediatePriority, p1)
    setCurrentUpdateLanePriority((getCurrentUpdateLanePriority()))
    u437 = v3
    if u437 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return
    end
    error(v2)
end
function u24.pushRenderLanes(p1, p2) -- Line: 1544 -- upvalues: push (val), u444 (val), u24 (val), mergeLanes (val), NoLanes_2 (ref)
    push(u444, u24.subtreeRenderLanes, p1)
    u24.subtreeRenderLanes = mergeLanes(u24.subtreeRenderLanes, p2)
    NoLanes_2 = mergeLanes(NoLanes_2, p2)
end
function u24.popRenderLanes(p1) -- Line: 1550 -- upvalues: u24 (val), u444 (val), pop (val)
    u24.subtreeRenderLanes = u444.current
    pop(u444, p1)
end
function u433.prepareFreshStack(p1, p2) -- Line: 1555 -- upvalues: ReactFiberLane (val), ReactFiberHostConfig (val), u439 (ref), unwindInterruptedWork (val), u438 (ref), u174 (val), NoLanes (ref), u24 (val), NoLanes_2 (ref), u445 (ref), u446 (ref), workInProgressRootSkippedLanes (val), NoLanes_3 (ref), NoLanes_4 (ref), ReactFeatureFlags (val), u476 (ref), __DEV__ (val), u366 (val)
    p1.finishedWork = nil
    p1.finishedLanes = ReactFiberLane.NoLanes
    local timeoutHandle = p1.timeoutHandle
    if timeoutHandle ~= ReactFiberHostConfig.noTimeout then
        p1.timeoutHandle = ReactFiberHostConfig.noTimeout
        ReactFiberHostConfig.cancelTimeout(timeoutHandle)
    end
    if u439 ~= nil then
        local return_ = u439.return_
        while return_ ~= nil do
            unwindInterruptedWork(return_)
            return_ = return_.return_
        end
    end
    u438 = p1
    u439 = u174.createWorkInProgress(p1.current, nil)
    NoLanes = p2
    u24.subtreeRenderLanes = p2
    NoLanes_2 = p2
    u445 = 0
    u446 = nil
    workInProgressRootSkippedLanes(ReactFiberLane.NoLanes)
    NoLanes_3 = ReactFiberLane.NoLanes
    NoLanes_4 = ReactFiberLane.NoLanes
    if ReactFeatureFlags.enableSchedulerTracing then
        u476 = nil
    end
    if __DEV__ then
        u366.discardPendingWarnings()
    end
end
function u433.handleError(p1, p2) -- Line: 1595 -- upvalues: u439 (ref), resetContextDependencies (val), u321 (val), u324 (ref), resetCurrentFiber (val), ReactCurrentOwner (val), u445 (ref), u446 (ref), ReactFeatureFlags (val), ReactTypeOfMode (val), u348 (val), throwException (val), NoLanes (ref), u24 (val), u433 (val)
    local v1, v2
    while true do
        local return_ = u439
        v1, v2 = pcall(function() -- Line: 1599 -- upvalues: resetContextDependencies (upval), u321 (upval), u324 (upval), resetCurrentFiber (upval), ReactCurrentOwner (upval), return_ (ref), u445 (upval), u446 (upval), p2 (ref), u439 (upval), ReactFeatureFlags (upval), ReactTypeOfMode (upval), u348 (upval), throwException (upval), p1 (val), NoLanes (upval), u24 (upval), u433 (upval)
            resetContextDependencies()
            if not u321.resetHooksAfterThrowRef then
                u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
                u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
                u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            u321.resetHooksAfterThrowRef()
            resetCurrentFiber()
            ReactCurrentOwner.current = nil
            if return_ == nil or return_.return_ == nil then
                u445 = 1
                u446 = p2
                u439 = nil
                return
            end
            if ReactFeatureFlags.enableProfilerTimer and bit32.band(return_.mode, ReactTypeOfMode.ProfileMode) ~= 0 then
                u348.stopProfilerTimerIfRunningAndRecordDelta(return_, true)
            end
            throwException(p1, return_.return_, return_, p2, NoLanes, u24.onUncaughtError, u24.renderDidError)
            u433.completeUnitOfWork(return_)
        end)
        if v1 then
            break
        end
        if u439 == return_ and return_ ~= nil then
            return_ = return_.return_
            u439 = return_
        end
    end
end
function u433.pushDispatcher() -- Line: 1674 -- upvalues: ReactCurrentDispatcher (val), u321 (val), u324 (ref)
    local current = ReactCurrentDispatcher.current
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    ReactCurrentDispatcher.current = u321.ContextOnlyDispatcherRef
    if current ~= nil then
        return current
    end
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.ContextOnlyDispatcherRef
end
function u433.popDispatcher(p1) -- Line: 1691 -- upvalues: ReactCurrentDispatcher (val)
    ReactCurrentDispatcher.current = p1
end
function u433.pushInteractions(p1) -- Line: 1695 -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return nil
    end
    __interactionsRef.current = p1.memoizedInteractions
    return __interactionsRef.current
end
function u433.popInteractions(p1) -- Line: 1704 -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if ReactFeatureFlags.enableSchedulerTracing then
        __interactionsRef.current = p1
    end
end
function u24.markCommitTimeOfFallback() -- Line: 1710 -- upvalues: u460 (ref), now (val)
    u460 = now()
end
function u24.markSkippedUpdateLanes(p1) -- Line: 1714 -- upvalues: ReactFiberWorkInProgress (val)
    ReactFiberWorkInProgress.markSkippedUpdateLanes(p1)
end
function u24.renderDidSuspend() -- Line: 1718 -- upvalues: u445 (ref)
    if u445 == 0 then
        u445 = 3
    end
end
function u24.renderDidSuspendDelayIfPossible() -- Line: 1724 -- upvalues: u445 (ref), u438 (ref), includesNonIdleWork (val), workInProgressRootSkippedLanes (val), NoLanes_3 (ref), u433 (val), NoLanes (ref)
    if u445 == 0 then
        u445 = 4
    elseif u445 ~= 3 then
    end
    if u438 ~= nil then
        if includesNonIdleWork(workInProgressRootSkippedLanes()) then
            u433.markRootSuspended(u438, NoLanes)
        elseif includesNonIdleWork(NoLanes_3) then
            u433.markRootSuspended(u438, NoLanes)
        end
    end
end
function u24.renderDidError() -- Line: 1752 -- upvalues: u445 (ref)
    if u445 ~= 5 then
        u445 = 2
    end
end
function u24.renderHasNotSuspendedYet() -- Line: 1760 -- upvalues: u445 (ref)
    local v1 = u445 == 0
    return v1
end
function u433.renderRootSync(p1, p2) -- Line: 1766 -- upvalues: u437 (ref), u433 (val), u438 (ref), NoLanes (ref), __DEV__ (val), enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), __YOLO__ (val), describeError (val), resetContextDependencies (val), ReactFeatureFlags (val), u439 (ref), invariant (val), ReactFiberLane (val), u445 (ref)
    local v1, v2, v3, v4
    local v5 = u437
    u437 = bit32.bor(u437, 16)
    local v6 = u433.pushDispatcher()
    if u438 ~= p1 then
        u433.prepareFreshStack(p1, p2)
        u433.startWorkOnPendingInteractions(p1, p2)
    elseif NoLanes == p2 then
    end
    local v7 = u433.pushInteractions(p1)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStarted(p2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStarted(p2)
    end
    while true do
        v2 = nil
        if __YOLO__ then
            v1 = true
            u433.workLoopSync()
        else
            v3, v4 = xpcall(u433.workLoopSync, describeError)
            v1 = v3
            v2 = v4
        end
        if v1 then
            break
        end
        u433.handleError(v8, v2)
    end
    resetContextDependencies()
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v7)
    end
    u437 = v5
    u433.popDispatcher(v6)
    if u439 ~= nil then
        invariant(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
    end
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStopped()
    end
    u438 = nil
    NoLanes = ReactFiberLane.NoLanes
    return u445
end
function u433.workLoopSync() -- Line: 1842 -- upvalues: u439 (ref), u433 (val)
    while u439 ~= nil do
        u433.performUnitOfWork(u439)
    end
end
function u433.renderRootConcurrent(p1, p2) -- Line: 1849 -- upvalues: u437 (ref), u433 (val), u438 (ref), NoLanes (ref), u461 (ref), now (val), __DEV__ (val), enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), __YOLO__ (val), describeError (val), resetContextDependencies (val), ReactFeatureFlags (val), u439 (ref), ReactFiberLane (val), u445 (ref)
    local v1, v2, v3, v4
    local v5 = u437
    u437 = bit32.bor(u437, 16)
    local v6 = u433.pushDispatcher()
    if u438 ~= p1 then
        u461 = now() + 500
        u433.prepareFreshStack(p1, p2)
        u433.startWorkOnPendingInteractions(p1, p2)
    elseif NoLanes == p2 then
    end
    local v7 = u433.pushInteractions(p1)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStarted(p2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStarted(p2)
    end
    while true do
        if __YOLO__ then
            v1 = true
            v2 = "break"
            u433.workLoopConcurrent()
        else
            v3, v4 = xpcall(u433.workLoopConcurrent, describeError)
            v1 = v3
            v2 = if v1 then "break" else v4
        end
        if v2 == "break" then
            break
        end
        if not v1 then
            u433.handleError(v8, v2)
        end
    end
    resetContextDependencies()
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v7)
    end
    u433.popDispatcher(v6)
    u437 = v5
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStopped()
    end
    if u439 ~= nil then
        if enableSchedulingProfiler then
            SchedulingProfiler.markRenderYielded()
        end
        return 0
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStopped()
    end
    u438 = nil
    NoLanes = ReactFiberLane.NoLanes
    return u445
end
function u433.workLoopConcurrent() -- Line: 1933 -- upvalues: u439 (ref), shouldYield (val), u433 (val)
    while u439 ~= nil do
        if shouldYield() then
            break
        end
        u433.performUnitOfWork(u439)
    end
end
function u433.performUnitOfWork(p1) -- Line: 1940 -- upvalues: RobloxReactProfiling (val), setCurrentFiber (val), ReactFeatureFlags (val), ReactTypeOfMode (val), u348 (val), u433 (val), u24 (val), resetCurrentFiber (val), u439 (ref), ReactCurrentOwner (val)
    local v1
    local v2 = RobloxReactProfiling.profileUnitOfWorkBefore(p1)
    local alternate = p1.alternate
    setCurrentFiber(p1)
    if not ReactFeatureFlags.enableProfilerTimer then
        v1 = u433.beginWork(alternate, p1, u24.subtreeRenderLanes)
    else
        local v3 = bit32.band(p1.mode, ReactTypeOfMode.ProfileMode)
        if v3 == ReactTypeOfMode.NoMode then
            v1 = u433.beginWork(alternate, p1, u24.subtreeRenderLanes)
        else
            u348.startProfilerTimer(p1)
            v1 = u433.beginWork(alternate, p1, u24.subtreeRenderLanes)
            u348.stopProfilerTimerIfRunningAndRecordDelta(p1, true)
        end
    end
    resetCurrentFiber()
    p1.memoizedProps = p1.pendingProps
    if v1 ~= nil then
        u439 = v1
    else
        u433.completeUnitOfWork(p1)
    end
    ReactCurrentOwner.current = nil
    RobloxReactProfiling.profileUnitOfWorkAfter(v2)
end
function u433.completeUnitOfWork(p1) -- Line: 1978 -- upvalues: ReactFiberFlags (val), setCurrentFiber (val), ReactFeatureFlags (val), ReactTypeOfMode (val), u24 (val), u321 (val), u348 (val), resetCurrentFiber (val), u439 (ref), unwindWork (val), u445 (ref)
    local alternate, child, return_, sibling, v1, v2
    local v3 = p1
    while true do
        alternate = v3.alternate
        return_ = v3.return_
        v1 = bit32.band(v3.flags, ReactFiberFlags.Incomplete)
        if v1 ~= ReactFiberFlags.NoFlags then
            v1 = unwindWork(v3, u24.subtreeRenderLanes)
            if v1 ~= nil then
                v1.flags = bit32.band(v1.flags, ReactFiberFlags.HostEffectMask)
                u439 = v1
                return
            end
            if ReactFeatureFlags.enableProfilerTimer then
                v2 = bit32.band(v3.mode, ReactTypeOfMode.ProfileMode)
                if v2 ~= ReactTypeOfMode.NoMode then
                    u348.stopProfilerTimerIfRunningAndRecordDelta(v3, false)
                    v2 = v3.actualDuration or 0
                    child = v3.child
                    while child ~= nil do
                        v2 = v2 + (child.actualDuration or 0)
                        child = child.sibling
                    end
                    v3.actualDuration = v2
                end
            end
            if return_ ~= nil then
                return_.flags = bit32.bor(return_.flags, ReactFiberFlags.Incomplete)
                return_.subtreeFlags = ReactFiberFlags.NoFlags
                return_.deletions = nil
            end
            sibling = v3.sibling
            if sibling ~= nil then
                u439 = sibling
                return
            end
            v3 = return_
            u439 = v3
            if v3 == nil then
                break
            end
        else
            setCurrentFiber(v3)
            if not ReactFeatureFlags.enableProfilerTimer then
                if not u321.completeWorkRef then
                    u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
                end
                v1 = u321.completeWorkRef(alternate, v3, u24.subtreeRenderLanes)
            else
                v2 = bit32.band(v3.mode, ReactTypeOfMode.ProfileMode)
                if v2 ~= ReactTypeOfMode.NoMode then
                    u348.startProfilerTimer(v3)
                    if not u321.completeWorkRef then
                        u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
                    end
                    v1 = u321.completeWorkRef(alternate, v3, u24.subtreeRenderLanes)
                    u348.stopProfilerTimerIfRunningAndRecordDelta(v3, false)
                end
            end
            resetCurrentFiber()
            if v1 ~= nil then
                u439 = v1
                return
            end
        end
    end
    if u445 == 0 then
        u445 = 5
    end
end
function u433.commitRoot(p1) -- Line: 2086 -- upvalues: getCurrentPriorityLevel (val), runWithPriority (val), ImmediatePriority (val), RobloxReactProfiling (val), u433 (val)
    local u2 = getCurrentPriorityLevel()
    runWithPriority(ImmediatePriority, function() -- Line: 2088 -- upvalues: RobloxReactProfiling (upval), u433 (upval), p1 (val), u2 (val)
        RobloxReactProfiling.profileCommitBefore()
        local v1 = u433.commitRootImpl(p1, u2)
        RobloxReactProfiling.profileCommitAfter()
        return v1
    end)
    return nil
end
function u433.commitRootImpl(p1, p2) -- Line: 2099 -- upvalues: u24 (val), u469 (ref), invariant (val), u437 (ref), __DEV__ (val), enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), ReactFiberLane (val), mergeLanes (val), markRootFinished (val), u472 (ref), hasDiscreteLanes (val), u438 (ref), u439 (ref), NoLanes (ref), ReactFiberFlags (val), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), u433 (val), ReactCurrentOwner (val), u480 (ref), ReactFiberHostConfig (val), u481 (ref), u348 (val), setCurrentFiber (val), invokeGuardedCallback (val), recursivelyCommitLayoutEffects (val), hasCaughtError (val), clearCaughtError (val), u431 (ref), resetCurrentFiber (val), __YOLO__ (val), describeError (val), u468 (ref), scheduleCallback (val), NormalPriority (val), requestPaint (val), NoLanes_5 (ref), u470 (ref), u476 (ref), u467 (ref), enableDoubleInvokingEffects (val), SyncLane (val), u474 (ref), u473 (ref), onCommitRoot (val), onCommitRoot_2 (val), u320 (ref), now (val), u465 (ref), u466 (ref), flushSyncCallbackQueue (val)
    local v1, v2, v3
    while true do
        u24.flushPassiveEffects()
        if u469 == nil then
            break
        end
    end
    flushRenderPhaseStrictModeWarningsInDEV()
    local v4 = bit32.band(u437, 48) == 0
    invariant(v4, "Should not already be working.")
    local finishedWork = p1.finishedWork
    local finishedLanes = p1.finishedLanes
    if __DEV__ and enableDebugTracing then
        DebugTracing.logCommitStarted(finishedLanes)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markCommitStarted(finishedLanes)
    end
    if finishedWork == nil then
        if __DEV__ and enableDebugTracing then
            DebugTracing.logCommitStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markCommitStopped()
        end
        return nil
    end
    p1.finishedWork = nil
    p1.finishedLanes = ReactFiberLane.NoLanes
    local v5 = finishedWork ~= p1.current
    invariant(v5, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.")
    p1.callbackNode = nil
    local v6 = mergeLanes(finishedWork.lanes, finishedWork.childLanes)
    markRootFinished(p1, v6)
    if u472 ~= nil and not (hasDiscreteLanes(v6)) and u472:has(p1) then
        u472:delete(p1)
    end
    if p1 == u438 then
        u438 = nil
        u439 = nil
        NoLanes = ReactFiberLane.NoLanes
    end
    local v7 = bit32.band(finishedWork.subtreeFlags, (bit32.bor(ReactFiberFlags.BeforeMutationMask, ReactFiberFlags.MutationMask, ReactFiberFlags.LayoutMask, ReactFiberFlags.PassiveMask)))
    v5 = v7 ~= ReactFiberFlags.NoFlags
    local v8 = bit32.band(finishedWork.flags, (bit32.bor(ReactFiberFlags.BeforeMutationMask, ReactFiberFlags.MutationMask, ReactFiberFlags.LayoutMask, ReactFiberFlags.PassiveMask)))
    v7 = v8 ~= ReactFiberFlags.NoFlags
    if v5 then
        v8 = nil
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
            v8 = getCurrentUpdateLanePriority()
            setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
        end
        v2 = u437
        u437 = bit32.bor(u437, 32)
        v3 = u433.pushInteractions(p1)
        ReactCurrentOwner.current = nil
        u480 = ReactFiberHostConfig.prepareForCommit(p1.containerInfo)
        u481 = false
        u433.commitBeforeMutationEffects(finishedWork)
        u480 = nil
        if ReactFeatureFlags.enableProfilerTimer then
            u348.recordCommitTime()
        end
        u433.commitMutationEffects(finishedWork, p1, p2)
        if u481 then
            ReactFiberHostConfig.afterActiveInstanceBlur()
        end
        ReactFiberHostConfig.resetAfterCommit(p1.containerInfo)
        p1.current = finishedWork
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStarted(finishedLanes)
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStarted(finishedLanes)
        end
        if not __DEV__ then
            local v9 = nil
            if __YOLO__ then
                v1 = true
                recursivelyCommitLayoutEffects(finishedWork, p1, u24.captureCommitPhaseError, u24.schedulePassiveEffectCallback)
            else
                local v10, v11
                v10, v11 = xpcall(recursivelyCommitLayoutEffects, describeError, finishedWork, p1, u24.captureCommitPhaseError, u24.schedulePassiveEffectCallback)
                v1 = v10
                v9 = v11
            end
            if not v1 then
                u431(finishedWork, finishedWork, v9)
            end
        else
            setCurrentFiber(finishedWork)
            invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, finishedWork, p1, u24.captureCommitPhaseError, u24.schedulePassiveEffectCallback)
            if hasCaughtError() then
                u431(finishedWork, finishedWork, (clearCaughtError()))
            end
            resetCurrentFiber()
        end
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStopped()
        end
        v1 = bit32.band(finishedWork.subtreeFlags, ReactFiberFlags.PassiveMask)
        if v1 == ReactFiberFlags.NoFlags then
            v1 = bit32.band(finishedWork.flags, ReactFiberFlags.PassiveMask)
            if v1 == ReactFiberFlags.NoFlags then end
        elseif not u468 then
            u468 = true
            scheduleCallback(NormalPriority, function() -- Line: 2332 -- upvalues: u24 (upval)
                u24.flushPassiveEffects()
                return nil
            end)
        end
        requestPaint()
        if ReactFeatureFlags.enableSchedulerTracing then
            u433.popInteractions(v3)
        end
        u437 = v2
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler and v8 ~= nil then
            setCurrentUpdateLanePriority(v8)
        end
    elseif not v7 then
        p1.current = finishedWork
        if ReactFeatureFlags.enableProfilerTimer then
            u348.recordCommitTime()
        end
    end
    v8 = u468
    if u468 then
        u468 = false
        u469 = p1
        NoLanes_5 = finishedLanes
        u470 = p2
    end
    local pendingLanes = p1.pendingLanes
    if pendingLanes == ReactFiberLane.NoLanes then
        u467 = nil
    elseif ReactFeatureFlags.enableSchedulerTracing then
        if u476 ~= nil then
            v2 = u476
            u476 = nil
            v3 = #v2
            v1 = 1
            for i = 1, v3, v1 do
                scheduleInteractions(p1, v2[i], p1.memoizedInteractions)
            end
        end
        u433.schedulePendingInteractions(p1, pendingLanes)
    end
    if __DEV__ and enableDoubleInvokingEffects and not v8 then
        commitDoubleInvokeEffectsInDEV(p1.current, false)
    end
    if ReactFeatureFlags.enableSchedulerTracing and not v8 then
        u433.finishPendingInteractions(p1, finishedLanes)
    end
    if pendingLanes ~= SyncLane then
        u473 = 0
    elseif p1 ~= u474 then
        u473 = 0
        u474 = p1
    else
        u473 = u473 + 1
    end
    onCommitRoot(finishedWork.stateNode, p2)
    if __DEV__ then
        onCommitRoot_2()
    end
    u320(p1, now())
    if u465 then
        u465 = false
        u466 = nil
        error(u466)
    end
    if bit32.band(u437, 8) ~= 0 then
        if __DEV__ and enableDebugTracing then
            DebugTracing.logCommitStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markCommitStopped()
        end
        return nil
    end
    flushSyncCallbackQueue()
    if __DEV__ and enableDebugTracing then
        DebugTracing.logCommitStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markCommitStopped()
    end
    return nil
end
function u433.commitBeforeMutationEffects(p1) -- Line: 2483 -- upvalues: u433 (val), ReactFiberFlags (val), __DEV__ (val), setCurrentFiber (val), invokeGuardedCallback (val), hasCaughtError (val), clearCaughtError (val), u24 (val), resetCurrentFiber (val), __YOLO__ (val), describeError (val)
    local v1, v2, v3, v4
    local sibling = p1
    while sibling ~= nil do
        if sibling.deletions ~= nil then
            u433.commitBeforeMutationEffectsDeletions(sibling.deletions)
        end
        if sibling.child ~= nil then
            v1 = bit32.band(sibling.subtreeFlags, ReactFiberFlags.BeforeMutationMask)
            if v1 ~= ReactFiberFlags.NoFlags then
                u433.commitBeforeMutationEffects(sibling.child)
            end
        end
        if not __DEV__ then
            v2 = nil
            if __YOLO__ then
                v1 = true
                u433.commitBeforeMutationEffectsImpl(sibling)
            else
                v3, v4 = xpcall(u433.commitBeforeMutationEffectsImpl, describeError, sibling)
                v1 = v3
                v2 = v4
            end
            if not v1 then
                u24.captureCommitPhaseError(sibling, sibling.return_, v2)
            end
        else
            setCurrentFiber(sibling)
            invokeGuardedCallback(nil, u433.commitBeforeMutationEffectsImpl, nil, sibling)
            if hasCaughtError() then
                u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
            end
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end
function u433.commitBeforeMutationEffectsImpl(p1) -- Line: 2526 -- upvalues: u481 (ref), u480 (ref), ReactWorkTags (val), u274 (val), doesFiberContain (val), ReactFiberHostConfig (val), ReactFiberFlags (val), setCurrentFiber (val), commitBeforeMutationLifeCycles (val), resetCurrentFiber (val), u468 (ref), scheduleCallback (val), NormalPriority (val), u24 (val)
    local alternate = p1.alternate
    local flags = p1.flags
    if not u481 and u480 ~= nil and p1.tag == ReactWorkTags.SuspenseComponent and u274.isSuspenseBoundaryBeingHidden(alternate, p1) and doesFiberContain(p1, u480) then
        u481 = true
        ReactFiberHostConfig.beforeActiveInstanceBlur()
    end
    local v1 = bit32.band(flags, ReactFiberFlags.Snapshot)
    if v1 ~= ReactFiberFlags.NoFlags then
        setCurrentFiber(p1)
        commitBeforeMutationLifeCycles(alternate, p1)
        resetCurrentFiber()
    end
    v1 = bit32.band(flags, ReactFiberFlags.Passive)
    if v1 ~= ReactFiberFlags.NoFlags and not u468 then
        u468 = true
        scheduleCallback(NormalPriority, function() -- Line: 2554 -- upvalues: u24 (upval)
            u24.flushPassiveEffects()
            return nil
        end)
    end
end
function u433.commitBeforeMutationEffectsDeletions(p1) -- Line: 2562 -- upvalues: doesFiberContain (val), u480 (ref), u481 (ref), ReactFiberHostConfig (val)
    local v1 = #p1
    local v2 = 1
    local v3 = p1
    for i = 1, v1, v2 do
        if doesFiberContain(v3[i], u480) then
            u481 = true
            ReactFiberHostConfig.beforeActiveInstanceBlur()
        end
    end
end
function u433.commitMutationEffects(p1, p2, p3) -- Line: 2578 -- upvalues: commitDeletion (val), describeError (val), u24 (val), ReactFiberFlags (val), u433 (val), __DEV__ (val), setCurrentFiber (val), invokeGuardedCallback (val), hasCaughtError (val), clearCaughtError (val), resetCurrentFiber (val), __YOLO__ (val)
    local deletions, v1, v2, v3, v4, v5, v6, v7, v8
    local sibling = p1
    v1, v4 = p2, p3
    while sibling ~= nil do
        deletions = sibling.deletions
        if deletions ~= nil then
            v5 = deletions
            v6 = nil
            v7 = nil
            for i, j in v5, v6, v7 do
                v2, v3 = xpcall(commitDeletion, describeError, v1, j, sibling, v4)
                if not v2 then
                    u24.captureCommitPhaseError(j, sibling, v3)
                end
            end
        end
        if sibling.child ~= nil then
            v5 = bit32.band(sibling.subtreeFlags, ReactFiberFlags.MutationMask)
            if v5 ~= ReactFiberFlags.NoFlags then
                u433.commitMutationEffects(sibling.child, v1, v4)
            end
        end
        if not __DEV__ then
            v6 = nil
            if __YOLO__ then
                v5 = true
                u433.commitMutationEffectsImpl(sibling, v1, v4)
            else
                v7, v8 = xpcall(u433.commitMutationEffectsImpl, describeError, sibling, v1, v4)
                v5 = v7
                v6 = v8
            end
            if not v5 then
                u24.captureCommitPhaseError(sibling, sibling.return_, v6)
            end
        else
            setCurrentFiber(sibling)
            invokeGuardedCallback(nil, u433.commitMutationEffectsImpl, nil, sibling, v1, v4)
            if hasCaughtError() then
                u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
            end
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end
function u433.commitMutationEffectsImpl(p1, p2, p3) -- Line: 2648 -- upvalues: ReactFiberFlags (val), commitDetachRef (val), commitPlacement (val), commitWork (val)
    local flags = p1.flags
    if bit32.band(flags, ReactFiberFlags.Ref) ~= 0 then
        local alternate = p1.alternate
        if alternate ~= nil then
            commitDetachRef(alternate)
        end
    end
    local v1 = bit32.band(flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Update, ReactFiberFlags.Hydrating)))
    if v1 == ReactFiberFlags.Placement then
        commitPlacement(p1)
        p1.flags = bit32.band(p1.flags, (bit32.bnot(ReactFiberFlags.Placement)))
        return
    end
    if v1 ~= ReactFiberFlags.PlacementAndUpdate then
        if v1 == ReactFiberFlags.Update then
            commitWork(p1.alternate, p1)
        end
        return
    end
    commitPlacement(p1)
    p1.flags = bit32.band(p1.flags, (bit32.bnot(ReactFiberFlags.Placement)))
    commitWork(p1.alternate, p1)
end
function u433.commitMutationEffectsDeletions(p1, p2, p3, p4) -- Line: 2714 -- upvalues: commitDeletion (val), describeError (val), u24 (val)
    local v1, v2
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v2, v1 = xpcall(commitDeletion, describeError, p3, j, p2, p4)
        if not v2 then
            u24.captureCommitPhaseError(j, p2, v1)
        end
    end
end
function u24.schedulePassiveEffectCallback() -- Line: 2732 -- upvalues: u468 (ref), scheduleCallback (val), NormalPriority (val), u24 (val)
    if not u468 then
        u468 = true
        scheduleCallback(NormalPriority, function() -- Line: 2735 -- upvalues: u24 (upval)
            u24.flushPassiveEffects()
            return nil
        end)
    end
end
local u536 = nil
function u24.flushPassiveEffects() -- Line: 2744 -- upvalues: u470 (ref), NoPriority (val), NormalPriority (val), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), schedulerPriorityToLanePriority (val), __YOLO__ (val), runWithPriority (val), describeError (val), u536 (ref)
    local v1, v2, v3
    if u470 == NoPriority then
        return false
    end
    if NormalPriority >= u470 then
        v1 = u470
    else
        v1 = NormalPriority
    end
    u470 = NoPriority
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        return runWithPriority(v1, u536)
    end
    local v4 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(v1))
    if __YOLO__ then
        v2 = true
        setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(v1))
        v3 = runWithPriority(v1, u536)
    else
        local v5, v6
        v5, v6 = xpcall(runWithPriority, describeError, v1, u536)
        v2 = v5
        v3 = v6
    end
    setCurrentUpdateLanePriority(v4)
    if not v2 then
        error(v3)
    end
    return v3
end
function u538(p1, p2) -- Line: 2788 -- upvalues: ReactFeatureFlags (val), ReactWorkTags (val), u462 (ref), ReactFiberFlags (val), u538 (ref), __DEV__ (val), setCurrentFiber (val), invokeGuardedCallback (val), commitPassiveMount (val), hasCaughtError (val), clearCaughtError (val), u24 (val), resetCurrentFiber (val), __YOLO__ (val), describeError (val)
    local stateNode, v1, v2, v3, v4, v5, v6, v7
    local sibling = p2
    while sibling ~= nil do
        v2 = nil
        if ReactFeatureFlags.enableProfilerTimer and ReactFeatureFlags.enableProfilerCommitHooks and sibling.tag == ReactWorkTags.Profiler then
            v2 = u462
            u462 = sibling
        end
        v3 = bit32.band(sibling.subtreeFlags, ReactFiberFlags.PassiveMask)
        if sibling.child ~= nil and v3 ~= ReactFiberFlags.NoFlags then
            u538(v1, sibling.child)
        end
        v4 = bit32.band(sibling.flags, ReactFiberFlags.Passive)
        if v4 ~= ReactFiberFlags.NoFlags then
            if not __DEV__ then
                v5 = nil
                if __YOLO__ then
                    v4 = true
                    commitPassiveMount(v1, sibling)
                else
                    v6, v7 = xpcall(commitPassiveMount, describeError, v1, sibling)
                    v4 = v6
                    v5 = v7
                end
                if not v4 then
                    u24.captureCommitPhaseError(sibling, sibling.return_, v5)
                end
            else
                setCurrentFiber(sibling)
                invokeGuardedCallback(nil, commitPassiveMount, nil, v1, sibling)
                if hasCaughtError() then
                    u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
                end
                resetCurrentFiber()
            end
        end
        if ReactFeatureFlags.enableProfilerTimer and ReactFeatureFlags.enableProfilerCommitHooks and sibling.tag == ReactWorkTags.Profiler then
            if v2 ~= nil then
                stateNode = v2.stateNode
                stateNode.passiveEffectDuration = stateNode.passiveEffectDuration + sibling.stateNode.passiveEffectDuration
            end
            u462 = v2
        end
        sibling = sibling.sibling
    end
end
function flushPassiveUnmountEffects(p1) -- Line: 2857 -- upvalues: u433 (val), ReactFiberFlags (val), flushPassiveUnmountEffects (val), setCurrentFiber (val), commitPassiveUnmount (val), resetCurrentFiber (val)
    local child, deletions, v1, v2, v3
    local sibling = p1
    while sibling ~= nil do
        deletions = sibling.deletions
        if deletions ~= nil then
            v1 = #deletions
            v2 = 1
            for i = 1, v1, v2 do
                v3 = deletions[i]
                u433.flushPassiveUnmountEffectsInsideOfDeletedTree(v3, sibling)
                u433.detachFiberAfterEffects(v3)
            end
        end
        child = sibling.child
        if child ~= nil then
            v2 = bit32.band(sibling.subtreeFlags, ReactFiberFlags.PassiveMask)
            if v2 ~= ReactFiberFlags.NoFlags then
                flushPassiveUnmountEffects(child)
            end
        end
        v2 = bit32.band(sibling.flags, ReactFiberFlags.Passive)
        if v2 ~= ReactFiberFlags.NoFlags then
            setCurrentFiber(sibling)
            commitPassiveUnmount(sibling)
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end
function u433.flushPassiveUnmountEffectsInsideOfDeletedTree(p1, p2) -- Line: 2897 -- upvalues: ReactFiberFlags (val), u433 (val), setCurrentFiber (val), commitPassiveUnmountInsideDeletedTree (val), resetCurrentFiber (val)
    local v1 = bit32.band(p1.subtreeFlags, ReactFiberFlags.PassiveStatic)
    if v1 ~= ReactFiberFlags.NoFlags then
        local child = p1.child
        while child ~= nil do
            u433.flushPassiveUnmountEffectsInsideOfDeletedTree(child, p2)
            child = child.sibling
        end
    end
    v1 = bit32.band(p1.flags, ReactFiberFlags.PassiveStatic)
    if v1 ~= ReactFiberFlags.NoFlags then
        setCurrentFiber(p1)
        commitPassiveUnmountInsideDeletedTree(p1, p2)
        resetCurrentFiber()
    end
end
function u536() -- Line: 2929 -- upvalues: u469 (ref), NoLanes_5 (ref), ReactFiberLane (val), invariant (val), u437 (ref), __DEV__ (val), enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), u433 (val), flushPassiveUnmountEffects (val), u538 (ref), enableDoubleInvokingEffects (val), ReactFeatureFlags (val), flushSyncCallbackQueue (val), u475 (ref)
    if u469 == nil then
        return false
    end
    local v1 = u469
    local v2 = NoLanes_5
    u469 = nil
    NoLanes_5 = ReactFiberLane.NoLanes
    local v3 = bit32.band(u437, 48) == 0
    invariant(v3, "Cannot flush passive effects while already rendering.")
    if __DEV__ and enableDebugTracing then
        DebugTracing.logPassiveEffectsStarted(v2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markPassiveEffectsStarted(v2)
    end
    u437 = bit32.bor(u437, 32)
    v3 = u433.pushInteractions(v1)
    flushPassiveUnmountEffects(v1.current)
    u538(v1, v1.current)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logPassiveEffectsStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markPassiveEffectsStopped()
    end
    if __DEV__ and enableDoubleInvokingEffects then
        commitDoubleInvokeEffectsInDEV(v1.current, true)
    end
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v3)
        u433.finishPendingInteractions(v1, v2)
    end
    u437 = u437
    flushSyncCallbackQueue()
    if u469 ~= nil then
        u475 = u475 + 1
    else
        u475 = 0
    end
    return true
end
function u24.isAlreadyFailedLegacyErrorBoundary(p1) -- Line: 3002 -- upvalues: u467 (ref)
    local v1 = if u467 ~= nil then u467:has(p1) else false
    return v1
end
function u24.markLegacyErrorBoundaryAsFailed(p1) -- Line: 3008 -- upvalues: u467 (ref), Set (val)
    if u467 == nil then
        u467 = Set.new({p1})
        return
    end
    u467:add(p1)
end
function u24.onUncaughtError(p1) -- Line: 3017 -- upvalues: u465 (ref), u466 (ref)
    if not u465 then
        u465 = true
        u466 = p1
    end
end
function u431(p1, p2, p3) -- Line: 3025 -- upvalues: createCapturedValue (val), createRootErrorUpdate (val), SyncLane (val), u24 (val), enqueueUpdate (val), u433 (val), markRootUpdated (val), u320 (ref)
    local v1 = createCapturedValue(p3, p2)
    local v2 = createRootErrorUpdate(p1, v1, SyncLane, u24.onUncaughtError)
    enqueueUpdate(p1, v2)
    local v3 = u24.requestEventTime()
    local v4 = u433.markUpdateLaneFromFiberToRoot(p1, SyncLane)
    if v4 ~= nil then
        markRootUpdated(v4, SyncLane, v3)
        u320(v4, v3)
        u433.schedulePendingInteractions(v4, SyncLane)
    end
end
function u24.captureCommitPhaseError(p1, p2, p3) -- Line: 3046 -- upvalues: ReactWorkTags (val), u431 (ref), skipUnmountedBoundaries (val), u24 (val), createCapturedValue (val), createClassErrorUpdate (val), SyncLane (val), enqueueUpdate (val), u433 (val), markRootUpdated (val), u320 (ref)
    local return_, stateNode, v1, v2, v3, v4, v5, v6
    if p1.tag == ReactWorkTags.HostRoot then
        u431(p1, p1, p3)
        return
    end
    if not skipUnmountedBoundaries then
        return_ = p1.return_
        v1, v2 = p1, p3
    else
        return_ = p2
        v1, v2 = p1, p3
    end
    while return_ ~= nil do
        if return_.tag == ReactWorkTags.HostRoot then
            u431(return_, v1, v2)
            return
        end
        if return_.tag == ReactWorkTags.ClassComponent then
            stateNode = return_.stateNode
            if typeof(return_.type.getDerivedStateFromError) == "function" then
                v3 = createCapturedValue(v2, v1)
                v4 = createClassErrorUpdate(return_, v3, SyncLane)
                enqueueUpdate(return_, v4)
                v5 = u24.requestEventTime()
                v6 = u433.markUpdateLaneFromFiberToRoot(return_, SyncLane)
                if v6 ~= nil then
                    markRootUpdated(v6, SyncLane, v5)
                    u320(v6, v5)
                    u433.schedulePendingInteractions(v6, SyncLane)
                end
                return
            end
            if typeof(stateNode.componentDidCatch) == "function" and not (u24.isAlreadyFailedLegacyErrorBoundary(stateNode)) then
                v3 = createCapturedValue(v2, v1)
                v4 = createClassErrorUpdate(return_, v3, SyncLane)
                enqueueUpdate(return_, v4)
                v5 = u24.requestEventTime()
                v6 = u433.markUpdateLaneFromFiberToRoot(return_, SyncLane)
                if v6 ~= nil then
                    markRootUpdated(v6, SyncLane, v5)
                    u320(v6, v5)
                    u433.schedulePendingInteractions(v6, SyncLane)
                end
                return
            end
            return_ = return_.return_
        end
    end
end
function u24.pingSuspendedRoot(p1, p2, p3) -- Line: 3095 -- upvalues: u24 (val), markRootPinged (val), u438 (ref), isSubsetOfLanes (val), NoLanes (ref), u445 (ref), includesOnlyRetries (val), now (val), u460 (ref), u433 (val), ReactFiberLane (val), NoLanes_4 (ref), mergeLanes (val), u320 (ref)
    local pingCache = p1.pingCache
    if pingCache ~= nil then
        pingCache[p2] = nil
    end
    local v1 = u24.requestEventTime()
    markRootPinged(p1, p3, v1)
    if u438 == p1 and isSubsetOfLanes(NoLanes, p3) then
        if u445 == 4 then
            u433.prepareFreshStack(p1, ReactFiberLane.NoLanes)
        elseif u445 ~= 3 then
            NoLanes_4 = mergeLanes(NoLanes_4, p3)
        elseif not (includesOnlyRetries(NoLanes)) then
            NoLanes_4 = mergeLanes(NoLanes_4, p3)
        else
            local v2 = now() - u460
            if v2 >= 500 then
                NoLanes_4 = mergeLanes(NoLanes_4, p3)
            else
                u433.prepareFreshStack(p1, ReactFiberLane.NoLanes)
            end
        end
    end
    u320(p1, v1)
    u433.schedulePendingInteractions(p1, p3)
end
function retryTimedOutBoundary(p1, p2) -- Line: 3139 -- upvalues: ReactFiberLane (val), u24 (val), u433 (val), markRootUpdated (val), u320 (ref)
    local v1
    if p2 ~= ReactFiberLane.NoLane then
        v1 = p2
    else
        v1 = requestRetryLane(p1)
    end
    local v2 = u24.requestEventTime()
    local v3 = u433.markUpdateLaneFromFiberToRoot(p1, v1)
    if v3 ~= nil then
        markRootUpdated(v3, v1, v2)
        u320(v3, v2)
        u433.schedulePendingInteractions(v3, v1)
    end
end
function u24.resolveRetryWakeable(p1, p2) -- Line: 3166 -- upvalues: ReactFiberLane (val)
    local stateNode = p1.stateNode
    if stateNode ~= nil then
        stateNode:delete(p2)
    end
    retryTimedOutBoundary(p1, ReactFiberLane.NoLane)
end
function jnd(p1) -- Line: 3210
    if p1 < 120 then
        return 120
    end
    if p1 < 480 then
        return 480
    end
    if p1 < 1080 then
        return 1080
    end
    if p1 < 1920 then
        return 1920
    end
    if p1 < 3000 then
        return 3000
    end
    if p1 < 4320 then
        return 4320
    end
    return math.ceil(p1 / 1960) * 1960
end
function u433.checkForNestedUpdates() -- Line: 3228 -- upvalues: u473 (ref), u474 (ref), invariant (val), __DEV__ (val), u475 (ref), console (val)
    if 50 < u473 then
        u473 = 0
        u474 = nil
        invariant(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.")
    end
    if __DEV__ and 50 < u475 then
        u475 = 0
        console.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.")
    end
end
function flushRenderPhaseStrictModeWarningsInDEV() -- Line: 3254 -- upvalues: __DEV__ (val), u366 (val), ReactFeatureFlags (val)
    if __DEV__ then
        u366.flushLegacyContextWarning()
        if ReactFeatureFlags.warnAboutDeprecatedLifecycles then
            u366.flushPendingUnsafeLifecycleWarnings()
        end
    end
end
function commitDoubleInvokeEffectsInDEV(p1, p2) -- Line: 3264 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), setCurrentFiber (val), ReactFiberFlags (val), invokeLayoutEffectUnmountInDEV (val), invokePassiveEffectUnmountInDEV (val), invokeLayoutEffectMountInDEV (val), invokePassiveEffectMountInDEV (val), resetCurrentFiber (val)
    if __DEV__ and enableDoubleInvokingEffects then
        setCurrentFiber(p1)
        invokeEffectsInDev(p1, ReactFiberFlags.MountLayoutDev, invokeLayoutEffectUnmountInDEV)
        if p2 then
            invokeEffectsInDev(p1, ReactFiberFlags.MountPassiveDev, invokePassiveEffectUnmountInDEV)
        end
        invokeEffectsInDev(p1, ReactFiberFlags.MountLayoutDev, invokeLayoutEffectMountInDEV)
        if p2 then
            invokeEffectsInDev(p1, ReactFiberFlags.MountPassiveDev, invokePassiveEffectMountInDEV)
        end
        resetCurrentFiber()
    end
end
function invokeEffectsInDev(p1, p2, p3) -- Line: 3296 -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), ReactFiberFlags (val)
    if __DEV__ and enableDoubleInvokingEffects then
        local v1, v2, v3
        local sibling = p1
        v1, v2 = p2, p3
        while sibling ~= nil do
            if sibling.child ~= nil then
                v3 = bit32.band(sibling.subtreeFlags, v1)
                if v3 ~= ReactFiberFlags.NoFlags then
                    invokeEffectsInDev(sibling.child, v1, v2)
                end
            end
            v3 = bit32.band(sibling.flags, v1)
            if v3 ~= ReactFiberFlags.NoFlags then
                v2(sibling)
            end
            sibling = sibling.sibling
        end
    end
end
local u555 = nil
function u433.warnAboutUpdateOnNotYetMountedFiberInDEV(p1) -- Line: 3322 -- upvalues: __DEV__ (val), u437 (ref), ReactTypeOfMode (val), ReactWorkTags (val), getComponentName (val), u555 (ref), ReactCurrentFiber (val), setCurrentFiber (val), console (val), resetCurrentFiber (val)
    if not __DEV__ then
        return
    else
        if bit32.band(u437, 16) ~= 0 then
            return
        end
        local mode = p1.mode
        if bit32.band(mode, (bit32.bor(ReactTypeOfMode.BlockingMode, ReactTypeOfMode.ConcurrentMode))) == 0 then
            return
        end
        local tag = p1.tag
        if tag == ReactWorkTags.IndeterminateComponent then
            local v1 = getComponentName(p1.type) or "ReactComponent"
            if u555 == nil then
                local v2, v3
                local v4 = {}
                v4[v1] = true
                u555 = v4
                v2, v3 = pcall(function() -- Line: 3367 -- upvalues: setCurrentFiber (upval), p1 (val), console (upval)
                    setCurrentFiber(p1)
                    console.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
                end)
                if not ReactCurrentFiber.current then
                    resetCurrentFiber()
                else
                    setCurrentFiber(p1)
                end
                if not v2 then
                    error(v3)
                end
                return
            else
                if u555[v1] then
                    return
                end
                u555[v1] = true
            end
        elseif tag ~= ReactWorkTags.HostRoot and tag ~= ReactWorkTags.ClassComponent and tag ~= ReactWorkTags.FunctionComponent and tag ~= ReactWorkTags.ForwardRef and tag ~= ReactWorkTags.MemoComponent and tag ~= ReactWorkTags.SimpleMemoComponent and tag ~= ReactWorkTags.Block then
            return
        end
    end
end
if not __DEV__ then
    u433.beginWork = u322
elseif ReactFeatureFlags.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    function u433.beginWork(p1, p2, p3) -- Line: 3393 -- upvalues: u174 (val), u322 (val), describeError (val), resetContextDependencies (val), u321 (val), u324 (ref), unwindInterruptedWork (val), ReactFeatureFlags (val), ReactTypeOfMode (val), u348 (val), invokeGuardedCallback (val), hasCaughtError (val), clearCaughtError (val)
        local v1, v2
        local v3 = u174.assignFiberPropertiesInDEV(nil, p2)
        v1, v2 = xpcall(u322, describeError, p1, p2, p3)
        if v1 then
            return v2
        end
        if v2 ~= nil and typeof(v2) == "table" and typeof(v2.andThen) == "function" then
            error(v2)
        end
        resetContextDependencies()
        if not u321.resetHooksAfterThrowRef then
            u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
            u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
            u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
            u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
        end
        u321.resetHooksAfterThrowRef()
        unwindInterruptedWork(p2)
        u174.assignFiberPropertiesInDEV(p2, v3)
        if ReactFeatureFlags.enableProfilerTimer and bit32.band(p2.mode, ReactTypeOfMode.ProfileMode) ~= 0 then
            u348.startProfilerTimer(p2)
        end
        invokeGuardedCallback(nil, u322, nil, p1, p2, p3)
        if hasCaughtError() then
            error((clearCaughtError()))
            return v2
        end
        error(v2)
        return v2
    end
end
local u561 = false
local u565 = if __DEV__ then {} else nil
function u433.warnAboutRenderPhaseUpdatesInDEV(p1) -- Line: 3463 -- upvalues: __DEV__ (val), ReactCurrentFiber (val), u437 (ref), u321 (val), u324 (ref), ReactWorkTags (val), u439 (ref), getComponentName (val), u565 (ref), console (val), u561 (ref)
    if not __DEV__ then
        return
    elseif not ReactCurrentFiber.isRendering then
        return
    elseif bit32.band(u437, 16) == 0 then
        return
    else
        if not u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
            u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
            u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
            u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
        end
        if u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            return
        elseif p1.tag == ReactWorkTags.FunctionComponent then
            local v1
            if u439 == nil then
                v1 = "Unknown"
            else
                v1 = getComponentName(u439.type)
            end
            if u565[v1] ~= nil then
                return
            end
            u565[v1] = true
            local v2 = getComponentName(p1.type) or "Unknown"
            console.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v2, v1, v1)
            return
        elseif p1.tag ~= ReactWorkTags.ForwardRef and p1.tag ~= ReactWorkTags.SimpleMemoComponent then
            if p1.tag == ReactWorkTags.ClassComponent and not u561 then
                console.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
                u561 = true
            end
            return
        end
    end
end
u24.IsThisRendererActing = {current = false}
function u24.warnIfNotScopedWithMatchingAct(p1) -- Line: 3515 -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), IsSomeRendererActing (val), u24 (val), ReactCurrentFiber (val), setCurrentFiber (val), console (val), resetCurrentFiber (val)
    if __DEV__ and ReactFiberHostConfig.warnsIfNotActing == true and IsSomeRendererActing.current == true and u24.IsThisRendererActing.current ~= true then
        local v1, v2
        v1, v2 = pcall(function() -- Line: 3523 -- upvalues: setCurrentFiber (upval), p1 (val), console (upval)
            setCurrentFiber(p1)
            console.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
        end)
        if not ReactCurrentFiber.current then
            resetCurrentFiber()
        else
            setCurrentFiber(p1)
        end
        if not v1 then
            error(v2)
        end
    end
end
function u24.warnIfNotCurrentlyActingEffectsInDEV(p1) -- Line: 3559 -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), ReactTypeOfMode (val), IsSomeRendererActing (val), u24 (val), console (val), getComponentName (val)
    if __DEV__ and ReactFiberHostConfig.warnsIfNotActing == true then
        local v1 = bit32.band(p1.mode, ReactTypeOfMode.StrictMode)
        if v1 ~= ReactTypeOfMode.NoMode and IsSomeRendererActing.current == false and u24.IsThisRendererActing.current == false then
            console.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p1.type))
        end
    end
end
function u24.warnIfNotCurrentlyActingUpdatesInDEV(p1) -- Line: 3585 -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), u437 (ref), IsSomeRendererActing (val), u24 (val), current (val), setCurrentFiber (val), console (val), getComponentName (val), resetCurrentFiber (val)
    local v1, v2
    if not __DEV__ or ReactFiberHostConfig.warnsIfNotActing ~= true or u437 ~= 0 or IsSomeRendererActing.current ~= false or u24.IsThisRendererActing.current ~= false then
        return
    end
    v1, v2 = pcall(function() -- Line: 3594 -- upvalues: setCurrentFiber (upval), p1 (val), console (upval), getComponentName (upval)
        setCurrentFiber(p1)
        console.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p1.type))
    end)
    if not current then
        resetCurrentFiber()
    else
        setCurrentFiber(p1)
    end
    if v1 then
        return v2
    end
end
local u621 = false
function u24.warnIfUnmockedScheduler(p1) -- Line: 3635 -- upvalues: __DEV__ (val), u621 (ref), scheduler (val), ReactTypeOfMode (val), console (val), ReactFeatureFlags (val)
    if not __DEV__ or u621 ~= false or scheduler.unstable_flushAllWithoutAsserting ~= nil then
        return
    end
    if bit32.band(p1.mode, ReactTypeOfMode.BlockingMode) ~= 0 or bit32.band(p1.mode, ReactTypeOfMode.ConcurrentMode) ~= 0 then
        u621 = true
        console.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
        return
    end
    if ReactFeatureFlags.warnAboutUnmockedScheduler == true then
        u621 = true
        console.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
    end
end
function computeThreadID(p1, p2) -- Line: 3678
    return p2 * 1000 + p1.interactionThreadID
end
function u24.markSpawnedWork(p1) -- Line: 3686 -- upvalues: ReactFeatureFlags (val), u476 (ref)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    if u476 == nil then
        u476 = {p1}
        return
    end
    table.insert(u476, p1)
end
function scheduleInteractions(p1, p2, p3) -- Line: 3698 -- upvalues: ReactFeatureFlags (val), Set (val), __subscriberRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    if 0 < p3.size then
        local v1
        local pendingInteractionMap = p1.pendingInteractionMap
        local u11 = pendingInteractionMap:get(p2)
        if u11 == nil then
            pendingInteractionMap:set(p2, Set.new(p3))
            local v2 = p3
            v1 = nil
            local v3 = nil
            for i, j in v2, v1, v3 do
                j.__count = j.__count + 1
            end
        else
            p3:forEach(function(p1) -- Line: 3711 -- upvalues: u11 (val)
                if not (u11:has(p1)) then
                    p1.__count = p1.__count + 1
                end
                u11:add(p1)
            end)
        end
        local current = __subscriberRef.current
        if current ~= nil then
            v1 = computeThreadID(p1, p2)
            current.onWorkScheduled(p3, v1)
        end
    end
end
function u433.schedulePendingInteractions(p1, p2) -- Line: 3736 -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    scheduleInteractions(p1, p2, __interactionsRef.current)
end
function u433.startWorkOnPendingInteractions(p1, p2) -- Line: 3747 -- upvalues: ReactFeatureFlags (val), Set (val), includesSomeLane (val), __subscriberRef (val), describeError (val), scheduleCallback (val), ImmediatePriority (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    local u6 = Set.new()
    p1.pendingInteractionMap:forEach(function(p1, a2) -- Line: 3757 -- upvalues: includesSomeLane (upval), p2 (val), u6 (val)
        if includesSomeLane(p2, a2) then
            p1:forEach(function(p1) -- Line: 3759 -- upvalues: u6 (upval)
                u6:add(p1)
            end)
        end
    end)
    p1.memoizedInteractions = u6
    if 0 < u6.size then
        local current = __subscriberRef.current
        if current ~= nil then
            local u26, v1
            local v2 = computeThreadID(p1, p2)
            v1, u26 = xpcall(current.onWorkStarted, describeError, u6, v2)
            if not v1 then
                scheduleCallback(ImmediatePriority, function() -- Line: 3781 -- upvalues: u26 (val)
                    error(u26)
                end)
            end
        end
    end
end
function u433.finishPendingInteractions(p1, p2) -- Line: 3789 -- upvalues: ReactFeatureFlags (val), __subscriberRef (val), describeError (val), includesSomeLane (val), scheduleCallback (val), ImmediatePriority (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    local pendingLanes = p1.pendingLanes
    local current = nil
    local v1 = true
    local u25 = nil
    if current ~= nil and 0 < p1.memoizedInteractions.size then
        local v2, v3
        local v4 = computeThreadID(p1, p2)
        v2, v3 = xpcall(__subscriberRef.current.onWorkStopped, describeError, p1.memoizedInteractions, v4)
        v1 = v2
        u25 = v3
    end
    local pendingInteractionMap = p1.pendingInteractionMap
    pendingInteractionMap:forEach(function(p1, p2) -- Line: 3820 -- upvalues: includesSomeLane (upval), pendingLanes (val), pendingInteractionMap (val), current (ref), describeError (upval), scheduleCallback (upval), ImmediatePriority (upval)
        if not (includesSomeLane(pendingLanes, p2)) then
            pendingInteractionMap:delete(p2)
            p1:forEach(function(p1) -- Line: 3826 -- upvalues: current (upval), describeError (upval), scheduleCallback (upval), ImmediatePriority (upval)
                p1.__count = p1.__count - 1
                if current ~= nil and p1.__count == 0 then
                    local u11, v1
                    v1, u11 = xpcall(current.onInteractionScheduledWorkCompleted, describeError, p1)
                    if not v1 then
                        scheduleCallback(ImmediatePriority, function() -- Line: 3837 -- upvalues: u11 (val)
                            error(u11)
                        end)
                    end
                end
            end)
        end
    end)
    if not v1 then
        scheduleCallback(ImmediatePriority, function() -- Line: 3849 -- upvalues: u25 (ref)
            error(u25)
        end)
    end
end
local u659 = false
local u660 = false
unstable_flushAllWithoutAsserting = scheduler.unstable_flushAllWithoutAsserting
local u666 = typeof(unstable_flushAllWithoutAsserting) == "function"
local function flushActWork() -- Line: 3868 -- upvalues: unstable_flushAllWithoutAsserting (val), u659 (ref), describeError (val), u24 (val)
    local v1, v2
    if unstable_flushAllWithoutAsserting ~= nil then
        u659 = true
        v1, v2 = xpcall(unstable_flushAllWithoutAsserting, describeError)
        u659 = u659
        if v1 then
            return v2
        end
        error(v2)
        return
    end
    u659 = true
    v1, v2 = xpcall(function() -- Line: 3888 -- upvalues: u24 (upval)
        local v1 = false
        while u24.flushPassiveEffects() do
            v1 = true
        end
        return v1
    end, describeError)
    u659 = u659
    if v1 then
        return v2
    end
    error(v2)
end
function flushWorkAndMicroTasks(p1) -- Line: 3907 -- upvalues: flushActWork (val), describeError (val), enqueueTask (val), flushWorkAndMicroTasks (val)
    local v1, v2
    v1, v2 = xpcall(flushActWork, describeError)
    if v1 then
        local v3, v4
        v3, v4 = xpcall(enqueueTask, describeError, function() -- Line: 3911 -- upvalues: flushActWork (upval), flushWorkAndMicroTasks (upval), p1 (val)
            if flushActWork() then
                flushWorkAndMicroTasks(p1)
                return
            end
            p1()
        end)
        v1 = v3
        v2 = v4
    end
    if not v1 then
        p1(v2)
    end
end
function u24.act(p1) -- Line: 3925 -- upvalues: __DEV__ (val), u491 (ref), console (val), u490 (ref), IsSomeRendererActing (val), u24 (val), u660 (ref), describeError (val), promise (val), u666 (val), flushWorkAndMicroTasks (val), flushActWork (val)
    local error, u131, v1, v2
    if not __DEV__ and not _G.__ROACT_17_MOCK_SCHEDULER__ and u491 == false then
        u491 = true
        console.error("act(...) is not supported in production builds of React, and might not behave as expected.")
    end
    local u127 = u490
    u490 = u490 + 1
    local current = IsSomeRendererActing.current
    local current_2 = u24.IsThisRendererActing.current
    local u130 = u660
    IsSomeRendererActing.current = true
    u24.IsThisRendererActing.current = true
    u660 = true
    local function onDone() -- Line: 3950 -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (val), u24 (upval), current_2 (val), u660 (upval), u130 (val), __DEV__ (upval), u127 (val), console (upval)
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u130
        if __DEV__ and u127 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
    end
    v1, u131 = xpcall(u24.batchedUpdates, describeError, p1)
    if not v1 then
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u130
        if __DEV__ and u127 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
        error(u131)
    end
    if u131 == nil then
        error = __DEV__
        if error and u131 ~= nil then
            console.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", (tostring(u131)))
        end
        error, v2 = xpcall(function() -- Line: 4045 -- upvalues: u490 (upval), u666 (upval), current (val), flushActWork (upval), IsSomeRendererActing (upval), u24 (upval), current_2 (val), u660 (upval), u130 (val), __DEV__ (upval), u127 (val), console (upval)
            if u490 == 1 then
                if u666 == false then
                    flushActWork()
                elseif current == false then
                    flushActWork()
                end
            end
            u490 = u490 - 1
            IsSomeRendererActing.current = current
            u24.IsThisRendererActing.current = current_2
            u660 = u130
            if __DEV__ and u127 < u490 then
                console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
            end
        end, describeError)
        if not error then
            u490 = u490 - 1
            IsSomeRendererActing.current = current
            u24.IsThisRendererActing.current = current_2
            u660 = u130
            if __DEV__ and u127 < u490 then
                console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
            end
            error(v2)
        end
        return {
            andThen = function(p1, p2, p3) -- Line: 4065 -- upvalues: __DEV__ (upval), console (upval)
                if __DEV__ then
                    console.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
                end
                p2()
            end,
        }
    elseif typeof(u131) == "table" and typeof(u131.andThen) == "function" then
        error = false
        if __DEV__ and typeof(promise) ~= nil then
            v2 = promise.resolve():andThen(function() end)
            v2:andThen(function() -- Line: 3983 -- upvalues: error (ref), console (upval)
                if error == false then
                    console.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);")
                end
            end)
        end
        return {
            andThen = function(p1, p2, p3) -- Line: 4002 -- upvalues: error (ref), u131 (val), u490 (upval), u666 (upval), current (val), IsSomeRendererActing (upval), u24 (upval), current_2 (val), u660 (upval), u130 (val), __DEV__ (upval), u127 (val), console (upval), flushWorkAndMicroTasks (upval)
                error = true
                return u131:andThen(function() -- Line: 4004 -- upvalues: u490 (upval), u666 (upval), current (upval), IsSomeRendererActing (upval), u24 (upval), current_2 (upval), u660 (upval), u130 (upval), __DEV__ (upval), u127 (upval), console (upval), p2 (val), flushWorkAndMicroTasks (upval), p3 (val)
                    if 1 < u490 then
                        u490 = u490 - 1
                        IsSomeRendererActing.current = current
                        u24.IsThisRendererActing.current = current_2
                        u660 = u130
                        if __DEV__ and u127 < u490 then
                            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                        end
                        p2()
                        return
                    end
                    if u666 ~= true or current ~= true then
                        flushWorkAndMicroTasks(function(p1) -- Line: 4018 -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (upval), u24 (upval), current_2 (upval), u660 (upval), u130 (upval), __DEV__ (upval), u127 (upval), console (upval), p3 (upval), p2 (upval)
                            u490 = u490 - 1
                            IsSomeRendererActing.current = current
                            u24.IsThisRendererActing.current = current_2
                            u660 = u130
                            if __DEV__ and u127 < u490 then
                                console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                            end
                            if p1 then
                                p3(p1)
                                return
                            end
                            p2()
                        end)
                        return
                    end
                    u490 = u490 - 1
                    IsSomeRendererActing.current = current
                    u24.IsThisRendererActing.current = current_2
                    u660 = u130
                    if __DEV__ and u127 < u490 then
                        console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                    end
                    p2()
                end, function(p1) -- Line: 4026 -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (upval), u24 (upval), current_2 (upval), u660 (upval), u130 (upval), __DEV__ (upval), u127 (upval), console (upval), p3 (val)
                    u490 = u490 - 1
                    IsSomeRendererActing.current = current
                    u24.IsThisRendererActing.current = current_2
                    u660 = u130
                    if __DEV__ and u127 < u490 then
                        console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                    end
                    p3(p1)
                end)
            end,
        }
    end
end
function u433.detachFiberAfterEffects(p1) -- Line: 4077 -- upvalues: __DEV__ (val)
    p1.child = nil
    p1.deletions = nil
    p1.dependencies = nil
    p1.memoizedProps = nil
    p1.memoizedState = nil
    p1.pendingProps = nil
    p1.sibling = nil
    p1.stateNode = nil
    p1.updateQueue = nil
    if __DEV__ then
        p1._debugOwner = nil
    end
end
return u24