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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberThrow.new
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  13 functions

local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local v1 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local DidCapture = ReactFiberFlags.DidCapture
local Incomplete = ReactFiberFlags.Incomplete
local NoFlags = ReactFiberFlags.NoFlags
local ShouldCapture = ReactFiberFlags.ShouldCapture
local LifecycleEffectMask = ReactFiberFlags.LifecycleEffectMask
local ForceUpdateForLegacySuspense = ReactFiberFlags.ForceUpdateForLegacySuspense
local shouldCaptureSuspense = require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new")).shouldCaptureSuspense
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local NoMode = ReactTypeOfMode.NoMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local createCapturedValue = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local enqueueCapturedUpdate = v1.enqueueCapturedUpdate
local createUpdate = v1.createUpdate
local CaptureUpdate = v1.CaptureUpdate
local ForceUpdate = v1.ForceUpdate
local enqueueUpdate = v1.enqueueUpdate
local markFailedErrorBoundaryForHotReloading = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading
local hasSuspenseContext = v2.hasSuspenseContext
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local suspenseStackCursor = v2.suspenseStackCursor
local u160 = nil
local u161 = nil
local u162 = nil
local u163 = nil
local function u164(...) -- Line: 87 -- upvalues: u161 (ref), u160 (ref)
    if not u161 then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        u161 = u160.markLegacyErrorBoundaryAsFailed
    end
    return u161(...)
end
local function u165(...) -- Line: 102 -- upvalues: u160 (ref), u163 (ref)
    if u160 == nil then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u163 = u160.pingSuspendedRoot
    return u163(...)
end
local function u166(...) -- Line: 109 -- upvalues: u160 (ref), u162 (ref)
    if u160 == nil then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u162 = u160.isAlreadyFailedLegacyErrorBoundary
    return u162(...)
end
local logCapturedError = require(script.Parent:WaitForChild("ReactFiberErrorLogger")).logCapturedError
local logComponentSuspended = require(script.Parent:WaitForChild("DebugTracing")).logComponentSuspended
local markComponentSuspended = require(script.Parent:WaitForChild("SchedulingProfiler")).markComponentSuspended
local SyncLane = ReactFiberLane.SyncLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane
function createRootErrorUpdate(p1, p2, p3, p4) -- Line: 130 -- upvalues: createUpdate (val), NoTimestamp (val), CaptureUpdate (val), Object (val), logCapturedError (val)
    local v1 = createUpdate(NoTimestamp, p3)
    v1.tag = CaptureUpdate
    v1.payload = {element = Object.None}
    local value = p2.value
    function v1.callback() -- Line: 144 -- upvalues: p4 (val), value (val), logCapturedError (upval), p1 (val), p2 (val)
        if p4 ~= nil then
            p4(value)
        end
        logCapturedError(p1, p2)
    end
    return v1
end
function createClassErrorUpdate(p1, p2, p3) -- Line: 153 -- upvalues: createUpdate (val), NoTimestamp (val), CaptureUpdate (val), logCapturedError (val), markFailedErrorBoundaryForHotReloading (val), u164 (val), includesSomeLane (val), SyncLane (val), console (val), getComponentName (val)
    local v1 = createUpdate(NoTimestamp, p3)
    v1.tag = CaptureUpdate
    local getDerivedStateFromError = p1.type.getDerivedStateFromError
    if typeof(getDerivedStateFromError) == "function" then
        local value = p2.value
        function v1.payload() -- Line: 163 -- upvalues: logCapturedError (upval), p1 (val), p2 (val), getDerivedStateFromError (val), value (val)
            logCapturedError(p1, p2)
            return getDerivedStateFromError(value)
        end
    end
    local stateNode = p1.stateNode
    if stateNode == nil then
        if _G.__DEV__ then
            function v1.callback() -- Line: 209 -- upvalues: markFailedErrorBoundaryForHotReloading (upval), p1 (val)
                markFailedErrorBoundaryForHotReloading(p1)
            end
        end
        return v1
    end
    if typeof(stateNode.componentDidCatch) == "function" then
        function v1.callback() -- Line: 171 -- upvalues: markFailedErrorBoundaryForHotReloading (upval), p1 (val), getDerivedStateFromError (val), u164 (upval), stateNode (val), logCapturedError (upval), p2 (val), includesSomeLane (upval), SyncLane (upval), console (upval), getComponentName (upval)
            if _G.__DEV__ then
                markFailedErrorBoundaryForHotReloading(p1)
            end
            if typeof(getDerivedStateFromError) ~= "function" then
                u164(stateNode)
                logCapturedError(p1, p2)
            end
            stateNode:componentDidCatch(p2.value, {componentStack = p2.stack or ""})
            if _G.__DEV__ and typeof(getDerivedStateFromError) ~= "function" and not (includesSomeLane(p1.lanes, SyncLane)) then
                console.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", getComponentName(p1.type) or "Unknown")
            end
        end
        return v1
    end
    if _G.__DEV__ then
        function v1.callback() -- Line: 209 -- upvalues: markFailedErrorBoundaryForHotReloading (upval), p1 (val)
            markFailedErrorBoundaryForHotReloading(p1)
        end
    end
    return v1
end
local function attachPingListener(p1, p2, p3) -- Line: 216 -- upvalues: u165 (val)
    local v1, v2
    local pingCache = p1.pingCache
    if pingCache ~= nil then
        v1 = pingCache[p2]
        if v1 == nil then
            pingCache[p2] = {}
        end
    else
        v2 = {}
        v2[p2] = {}
        p1.pingCache = v2
    end
    if not (v1[p3]) then
        v1[p3] = true
        function v2() -- Line: 244 -- upvalues: u165 (upval), p1 (val), p2 (val), p3 (val)
            return u165(p1, p2, p3)
        end
        p2:andThen(v2, v2)
    end
end
function throwException(p1, p2, p3, p4, p5, p6, p7) -- Line: 251 -- upvalues: Incomplete (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val), logComponentSuspended (val), enableSchedulingProfiler (val), markComponentSuspended (val), BlockingMode (val), NoMode (val), hasSuspenseContext (val), suspenseStackCursor (val), InvisibleParentSuspenseContext (val), SuspenseComponent (val), shouldCaptureSuspense (val), DidCapture (val), ForceUpdateForLegacySuspense (val), LifecycleEffectMask (val), ClassComponent (val), IncompleteClassComponent (val), createUpdate (val), NoTimestamp (val), SyncLane (val), ForceUpdate (val), enqueueUpdate (val), mergeLanes (val), attachPingListener (val), ShouldCapture (val), createCapturedValue (val), HostRoot (val), pickArbitraryLane (val), enqueueCapturedUpdate (val), NoFlags (val), u166 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    p3.flags = bit32.bor(p3.flags, Incomplete)
    if p4 == nil then
        local stateNode
        v8, v5, v4, v1, v6, v7 = p7, p4, p3, p2, p5, p6
        v8()
        v5 = createCapturedValue(v5, v4)
        local return__2 = v1
        while return__2.tag ~= HostRoot do
            if return__2.tag == ClassComponent then
                stateNode = return__2.stateNode
                v2 = bit32.band(return__2.flags, DidCapture)
                if v2 == NoFlags then
                    if typeof(return__2.type.getDerivedStateFromError) == "function" then
                        return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                        v2 = pickArbitraryLane(v6)
                        return__2.lanes = mergeLanes(return__2.lanes, v2)
                        v3 = createClassErrorUpdate(return__2, v5, v2)
                        enqueueCapturedUpdate(return__2, v3)
                        return
                    end
                    if stateNode ~= nil and typeof(stateNode.componentDidCatch) == "function" and not (u166(stateNode)) then
                        return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                        v2 = pickArbitraryLane(v6)
                        return__2.lanes = mergeLanes(return__2.lanes, v2)
                        v3 = createClassErrorUpdate(return__2, v5, v2)
                        enqueueCapturedUpdate(return__2, v3)
                        return
                    end
                    return__2 = return__2.return_
                    if return__2 == nil then
                        return
                    end
                end
            end
        end
        return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
        local v9 = pickArbitraryLane(v6)
        return__2.lanes = mergeLanes(return__2.lanes, v9)
        local v10 = createRootErrorUpdate(return__2, v5, v9, v7)
        enqueueCapturedUpdate(return__2, v10)
        return
    elseif typeof(p4) ~= "table" then
        v8, v5, v4, v1, v6, v7 = p7, p4, p3, p2, p5, p6
    elseif typeof(p4.andThen) ~= "function" then
        v8, v5, v4, v1, v6, v7 = p7, p4, p3, p2, p5, p6
    else
        local alternate, updateQueue, v11
        local v12 = p4
        if _G.__DEV__ and enableDebugTracing and bit32.band(p3.mode, DebugTracingMode) ~= 0 then
            v11 = getComponentName(p3.type) or "Unknown"
            logComponentSuspended(v11, v12)
        end
        if enableSchedulingProfiler then
            markComponentSuspended(p3, v12)
        end
        v11 = bit32.band(p3.mode, BlockingMode)
        if v11 == NoMode then
            alternate = p3.alternate
            if not alternate then
                p3.updateQueue = nil
                p3.memoizedState = nil
            else
                p3.updateQueue = alternate.updateQueue
                p3.memoizedState = alternate.memoizedState
                p3.lanes = alternate.lanes
            end
        end
        v11 = hasSuspenseContext(suspenseStackCursor.current, InvisibleParentSuspenseContext)
        local return_ = p2
        while true do
            if return_.tag ~= SuspenseComponent then
                return_ = return_.return_
                if return_ == nil then
                    v5 = (getComponentName(v4.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n\nAdd a <Suspense fallback=...> component higher in the tree to provide a loading indicator or placeholder to display."
                end
            elseif shouldCaptureSuspense(return_, v11) then
                updateQueue = return_.updateQueue
                if updateQueue ~= nil then
                    updateQueue[v12] = true
                else
                    v2 = {}
                    v2[v12] = true
                    return_.updateQueue = v2
                end
                v2 = bit32.band(return_.mode, BlockingMode)
                if v2 ~= NoMode then
                    attachPingListener(v13, v12, v6)
                    return_.flags = bit32.bor(return_.flags, ShouldCapture)
                    return_.lanes = v6
                    return
                end
                return_.flags = bit32.bor(return_.flags, DidCapture)
                v4.flags = bit32.bor(v4.flags, ForceUpdateForLegacySuspense)
                v4.flags = bit32.band(v4.flags, (bit32.bnot((bit32.bor(LifecycleEffectMask, Incomplete)))))
                if v4.tag == ClassComponent then
                    if v4.alternate ~= nil then
                        v3 = createUpdate(NoTimestamp, SyncLane)
                        v3.tag = ForceUpdate
                        enqueueUpdate(v4, v3)
                    else
                        v4.tag = IncompleteClassComponent
                    end
                end
                v4.lanes = mergeLanes(v4.lanes, SyncLane)
                return
            end
        end
    end
end
return {throwException = throwException, createRootErrorUpdate = createRootErrorUpdate, createClassErrorUpdate = createClassErrorUpdate}