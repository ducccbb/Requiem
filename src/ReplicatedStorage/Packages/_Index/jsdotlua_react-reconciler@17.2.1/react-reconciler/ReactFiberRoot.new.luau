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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberRoot.new
--                              Dumped in 0.000639 seconds
--                          Bytecode version 9  |  3 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Set = v1.Set
local Map = v1.Map
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local noTimeout = ReactFiberHostConfig.noTimeout
local supportsHydration = ReactFiberHostConfig.supportsHydration
local createHostRootFiber = require(script.Parent:WaitForChild("ReactFiber.new")).createHostRootFiber
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLanes = ReactFiberLane.NoLanes
local NoLanePriority = ReactFiberLane.NoLanePriority
local NoTimestamp = ReactFiberLane.NoTimestamp
local createLaneMap = ReactFiberLane.createLaneMap
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local unstable_getThreadID = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_getThreadID
local initializeUpdateQueue = require(script.Parent:WaitForChild("ReactUpdateQueue.new")).initializeUpdateQueue
local LegacyRoot = ReactRootTags.LegacyRoot
local BlockingRoot = ReactRootTags.BlockingRoot
local ConcurrentRoot = ReactRootTags.ConcurrentRoot
local v2 = {}
local function FiberRootNode(p1, p2, p3) -- Line: 47 -- upvalues: noTimeout (val), NoLanePriority (val), createLaneMap (val), NoLanes (val), NoTimestamp (val), supportsHydration (val), enableSchedulerTracing (val), unstable_getThreadID (val), Set (val), Map (val), enableSuspenseCallback (val), BlockingRoot (val), ConcurrentRoot (val), LegacyRoot (val)
    local v1 = {
        tag = p2,
        containerInfo = p1,
        timeoutHandle = noTimeout,
        hydrate = p3,
        callbackPriority = NoLanePriority,
        eventTimes = createLaneMap(NoLanes),
        expirationTimes = createLaneMap(NoTimestamp),
        pendingLanes = NoLanes,
        suspendedLanes = NoLanes,
        pingedLanes = NoLanes,
        expiredLanes = NoLanes,
        mutableReadLanes = NoLanes,
        finishedLanes = NoLanes,
        entangledLanes = NoLanes,
        entanglements = createLaneMap(NoLanes),
    }
    if supportsHydration then
        v1.mutableSourceEagerHydrationData = nil
    end
    if enableSchedulerTracing then
        v1.interactionThreadID = unstable_getThreadID()
        v1.memoizedInteractions = Set.new()
        v1.pendingInteractionMap = Map.new()
    end
    if enableSuspenseCallback then
        v1.hydrationCallbacks = nil
    end
    if not _G.__DEV__ then
        return v1
    end
    if p2 == BlockingRoot then
        v1._debugRootType = "createBlockingRoot()"
        return v1
    end
    if p2 == ConcurrentRoot then
        v1._debugRootType = "createRoot()"
        return v1
    end
    if p2 == LegacyRoot then
        v1._debugRootType = "createLegacyRoot()"
    end
    return v1
end
function v2.createFiberRoot(p1, p2, p3, p4) -- Line: 103 -- upvalues: FiberRootNode (val), enableSuspenseCallback (val), createHostRootFiber (val), initializeUpdateQueue (val)
    local v1 = FiberRootNode(p1, p2, p3)
    if enableSuspenseCallback then
        v1.hydrationCallbacks = p4
    end
    local v2 = createHostRootFiber(p2)
    v1.current = v2
    v2.stateNode = v1
    initializeUpdateQueue(v2)
    return v1
end
return v2