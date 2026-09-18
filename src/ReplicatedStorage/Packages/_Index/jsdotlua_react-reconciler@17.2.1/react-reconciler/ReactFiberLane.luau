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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLane
--                               Dumped in 0.00344 seconds
--                          Bytecode version 9  |  42 functions

local findUpdateLane
require(script.Parent:WaitForChild("ReactInternalTypes"))
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ImmediatePriority = v1.ImmediatePriority
local UserBlockingPriority = v1.UserBlockingPriority
local NormalPriority = v1.NormalPriority
local LowPriority = v1.LowPriority
local IdlePriority = v1.IdlePriority
local NoPriority = v1.NoPriority
local v2 = {
    SyncLanePriority = 15,
    SyncBatchedLanePriority = 14,
    InputDiscreteLanePriority = 12,
    InputContinuousLanePriority = 10,
    DefaultLanePriority = 8,
    TransitionPriority = 6,
    NoLanePriority = 0,
    NoLanes = 0,
    NoLane = 0,
    SyncLane = 1,
    SyncBatchedLane = 2,
    InputDiscreteHydrationLane = 4,
    DefaultHydrationLane = 256,
    DefaultLanes = 3584,
    RetryLanes = 62914560,
    SomeRetryLane = 33554432,
    SelectiveHydrationLane = 67108864,
    IdleHydrationLane = 134217728,
    OffscreenLane = 1073741824,
    NoTimestamp = -1,
}
local NoLanePriority = v2.NoLanePriority
function v2.getCurrentUpdateLanePriority() -- Line: 141 -- upvalues: NoLanePriority (ref)
    return NoLanePriority
end
function v2.setCurrentUpdateLanePriority(p1) -- Line: 145 -- upvalues: NoLanePriority (ref)
    NoLanePriority = p1
end
local DefaultLanePriority = v2.DefaultLanePriority
local function getHighestPriorityLanes(p1) -- Line: 153 -- upvalues: DefaultLanePriority (ref), console (val)
    if bit32.band(1, p1) ~= 0 then
        DefaultLanePriority = 15
        return 1
    end
    if bit32.band(2, p1) ~= 0 then
        DefaultLanePriority = 14
        return 2
    end
    if bit32.band(4, p1) ~= 0 then
        DefaultLanePriority = 13
        return 4
    end
    local v1 = bit32.band(24, p1)
    if v1 ~= 0 then
        DefaultLanePriority = 12
        return v1
    end
    if bit32.band(p1, 32) ~= 0 then
        DefaultLanePriority = 11
        return 32
    end
    local v2 = bit32.band(192, p1)
    if v2 ~= 0 then
        DefaultLanePriority = 10
        return v2
    end
    if bit32.band(p1, 256) ~= 0 then
        DefaultLanePriority = 9
        return 256
    end
    local v3 = bit32.band(3584, p1)
    if v3 ~= 0 then
        DefaultLanePriority = 8
        return v3
    end
    if bit32.band(p1, 4096) ~= 0 then
        DefaultLanePriority = 7
        return 4096
    end
    local v4 = bit32.band(4186112, p1)
    if v4 ~= 0 then
        DefaultLanePriority = 6
        return v4
    end
    local v5 = bit32.band(62914560, p1)
    if v5 ~= 0 then
        DefaultLanePriority = 5
        return v5
    end
    if bit32.band(p1, 67108864) ~= 0 then
        DefaultLanePriority = 4
        return 67108864
    end
    if bit32.band(p1, 134217728) ~= 0 then
        DefaultLanePriority = 3
        return 134217728
    end
    local v6 = bit32.band(805306368, p1)
    if v6 ~= 0 then
        DefaultLanePriority = 2
        return v6
    end
    if bit32.band(1073741824, p1) ~= 0 then
        DefaultLanePriority = 1
        return 1073741824
    end
    if _G.__DEV__ then
        console.error("Should have found matching lanes. This is a bug in React.")
    end
    DefaultLanePriority = 8
    return p1
end
function v2.schedulerPriorityToLanePriority(p1) -- Line: 228 -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), LowPriority (val), IdlePriority (val)
    if p1 == ImmediatePriority then
        return 15
    end
    if p1 == UserBlockingPriority then
        return 10
    end
    if p1 == NormalPriority or p1 == LowPriority then
        return 8
    end
    if p1 == IdlePriority then
        return 2
    end
    return 0
end
function v2.lanePriorityToSchedulerPriority(p1) -- Line: 249 -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), IdlePriority (val), NoPriority (val), invariant (val)
    if p1 == 15 or p1 == 14 then
        return ImmediatePriority
    end
    if p1 == 13 or p1 == 12 or p1 == 11 or p1 == 10 then
        return UserBlockingPriority
    end
    if p1 == 9 or p1 == 8 or p1 == 7 or p1 == 6 or p1 == 4 or p1 == 5 then
        return NormalPriority
    end
    if p1 == 3 or p1 == 2 or p1 == 1 then
        return IdlePriority
    end
    if p1 == 0 then
        return NoPriority
    end
    invariant(false, "Invalid update priority: %s. This is a bug in React.", p1)
    error("unreachable")
end
local pickArbitraryLaneIndex = nil
local getLowestPriorityLane = nil
function v2.getNextLanes(p1, p2) -- Line: 293 -- upvalues: DefaultLanePriority (ref), getHighestPriorityLanes (val), getLowestPriorityLane (ref), pickArbitraryLaneIndex (ref)
    local v1
    local pendingLanes = p1.pendingLanes
    if pendingLanes == 0 then
        DefaultLanePriority = 0
        return 0
    end
    local v2 = 0
    local v3 = 0
    local expiredLanes = p1.expiredLanes
    local suspendedLanes = p1.suspendedLanes
    local pingedLanes = p1.pingedLanes
    if expiredLanes == 0 then
        local v4
        local v5 = bit32.band(pendingLanes, 134217727)
        if v5 == 0 then
            v4 = bit32.band(pendingLanes, (bit32.bnot(suspendedLanes)))
            if v4 ~= 0 then
                v2 = getHighestPriorityLanes(v4)
                v3 = DefaultLanePriority
            elseif pingedLanes ~= 0 then
                v2 = getHighestPriorityLanes(pingedLanes)
                v3 = DefaultLanePriority
            end
        else
            v4 = bit32.band(v5, (bit32.bnot(suspendedLanes)))
            if v4 == 0 then
                v1 = bit32.band(v5, pingedLanes)
                if v1 ~= 0 then
                    v2 = getHighestPriorityLanes(v1)
                    v3 = DefaultLanePriority
                end
            else
                v2 = getHighestPriorityLanes(v4)
                v3 = DefaultLanePriority
            end
        end
    else
        v2 = expiredLanes
        DefaultLanePriority = 15
        v3 = 15
    end
    if v2 == 0 then
        return 0
    end
    local v6 = getLowestPriorityLane(v2)
    v2 = bit32.band(pendingLanes, bit32.lshift(v6, 1) - 1)
    if p2 == 0 then
        local entangledLanes = p1.entangledLanes
        if entangledLanes ~= 0 then
            local v7
            v1 = bit32.band(v2, entangledLanes)
            while 0 < v1 do
                v7 = pickArbitraryLaneIndex(v1)
                v6 = bit32.lshift(1, v7)
                v2 = bit32.bor(v2, p1.entanglements[v7])
                v1 = bit32.band(v1, (bit32.bnot(v6)))
            end
        end
        return v2
    elseif p2 ~= v2 and bit32.band(p2, suspendedLanes) == 0 then
        getHighestPriorityLanes(p2)
        if v3 <= DefaultLanePriority then
            return p2
        end
        DefaultLanePriority = v3
    end
end
function v2.getMostRecentEventTime(p1, p2) -- Line: 412 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2, v3
    local eventTimes = p1.eventTimes
    local v4 = -1
    local v5 = p2
    while 0 < v5 do
        v1 = pickArbitraryLaneIndex(v5)
        v2 = bit32.lshift(1, v1)
        v3 = eventTimes[v1]
        if v4 < v3 then
            v4 = v3
        end
        v5 = bit32.band(v5, (bit32.bnot(v2)))
    end
    return v4
end
function v2.computeExpirationTime(p1, p2) -- Line: 432 -- upvalues: getHighestPriorityLanes (val), DefaultLanePriority (ref)
    getHighestPriorityLanes(p1)
    local v1 = DefaultLanePriority
    if 10 <= v1 then
        return p2 + 250
    end
    if 6 <= v1 then
        return p2 + 5000
    end
    return -1
end
function v2.markStarvedLanesAsExpired(p1, p2) -- Line: 462 -- upvalues: pickArbitraryLaneIndex (ref), getHighestPriorityLanes (val), DefaultLanePriority (ref)
    local v1, v2, v3, v4, v5, v6, v7
    local suspendedLanes = p1.suspendedLanes
    local pingedLanes = p1.pingedLanes
    local expirationTimes = p1.expirationTimes
    local v8 = p1.pendingLanes
    v2, v1 = p2, p1
    while 0 < v8 do
        v5 = pickArbitraryLaneIndex(v8)
        v6 = bit32.lshift(1, v5)
        v7 = expirationTimes[v5]
        if v7 ~= -1 then
            if v7 <= v2 then
                v1.expiredLanes = bit32.bor(v1.expiredLanes, v6)
            end
        elseif bit32.band(v6, suspendedLanes) == 0 then
            getHighestPriorityLanes(v6)
            v4 = DefaultLanePriority
            if 10 <= v4 then
                v3 = v2 + 250
            elseif 6 > v4 then
                v3 = -1
            else
                v3 = v2 + 5000
            end
            expirationTimes[v5] = v3
        elseif bit32.band(v6, pingedLanes) == 0 then
        end
        v8 = bit32.band(v8, (bit32.bnot(v6)))
    end
end
function v2.getHighestPriorityPendingLanes(p1) -- Line: 504 -- upvalues: getHighestPriorityLanes (val)
    return (getHighestPriorityLanes(p1.pendingLanes))
end
function v2.getLanesToRetrySynchronouslyOnError(p1) -- Line: 509
    local v1 = bit32.band(p1.pendingLanes, 3221225471)
    if v1 ~= 0 then
        return v1
    end
    if bit32.band(v1, 1073741824) ~= 0 then
        return 1073741824
    end
    return 0
end
function v2.returnNextLanesPriority() -- Line: 522 -- upvalues: DefaultLanePriority (ref)
    return DefaultLanePriority
end
function v2.includesNonIdleWork(p1) -- Line: 527
    local v1 = bit32.band(p1, 134217727) ~= 0
    return v1
end
function v2.includesOnlyRetries(p1) -- Line: 532
    local v1 = bit32.band(p1, 62914560) == p1
    return v1
end
function v2.includesOnlyTransitions(p1) -- Line: 537
    local v1 = bit32.band(p1, 4186112) == p1
    return v1
end
local pickArbitraryLane = nil
function findUpdateLane(p1, p2) -- Line: 547 -- upvalues: pickArbitraryLane (ref), findUpdateLane (val), invariant (val)
    local v1
    if p1 == 0 then
        invariant(false, "Invalid update priority: %s. This is a bug in React.", p1)
        error("unreachable")
        return
    end
    if p1 == 15 then
        return 1
    end
    if p1 == 14 then
        return 2
    end
    if p1 == 12 then
        v1 = pickArbitraryLane((bit32.band(24, (bit32.bnot(p2)))))
        if v1 == 0 then
            return findUpdateLane(10, p2)
        end
        return v1
    end
    if p1 == 10 then
        v1 = pickArbitraryLane((bit32.band(192, (bit32.bnot(p2)))))
        if v1 == 0 then
            return findUpdateLane(8, p2)
        end
        return v1
    end
    if p1 == 8 then
        v1 = pickArbitraryLane((bit32.band(3584, (bit32.bnot(p2)))))
        if v1 == 0 then
            v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(p2)))))
            if v1 == 0 then
                v1 = pickArbitraryLane(3584)
            end
        end
        return v1
    end
    if p1 == 6 or p1 == 5 or p1 ~= 2 then
        invariant(false, "Invalid update priority: %s. This is a bug in React.", p1)
        error("unreachable")
        return
    end
    v1 = pickArbitraryLane((bit32.band(805306368, (bit32.bnot(p2)))))
    if v1 == 0 then
        v1 = pickArbitraryLane(805306368)
    end
    return v1
end
v2.findUpdateLane = findUpdateLane
function v2.findTransitionLane(p1, p2) -- Line: 606 -- upvalues: pickArbitraryLane (ref)
    local v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(p2)))))
    if v1 == 0 then
        v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(p1)))))
        if v1 == 0 then
            v1 = pickArbitraryLane(4186112)
        end
    end
    return v1
end
function v2.findRetryLane(p1) -- Line: 626 -- upvalues: pickArbitraryLane (ref)
    local v1 = pickArbitraryLane((bit32.band(62914560, (bit32.bnot(p1)))))
    if v1 == 0 then
        v1 = pickArbitraryLane(62914560)
    end
    return v1
end
local function getHighestPriorityLane(p1) -- Line: 638
    return (bit32.band(p1, -p1))
end
function getLowestPriorityLane(p1) -- Line: 642
    local v1 = 31 - bit32.countlz(p1)
    if v1 < 0 then
        return 0
    end
    return (bit32.lshift(1, v1))
end
local function getEqualOrHigherPriorityLanes(p1) -- Line: 652 -- upvalues: getLowestPriorityLane (ref)
    local v1 = getLowestPriorityLane(p1)
    return bit32.lshift(v1, 1) - 1
end
function pickArbitraryLane(p1) -- Line: 656
    return (bit32.band(p1, -p1))
end
v2.pickArbitraryLane = pickArbitraryLane
function pickArbitraryLaneIndex(p1) -- Line: 665
    return 31 - bit32.countlz(p1)
end
function v2.includesSomeLane(p1, p2) -- Line: 674
    local v1 = bit32.band(p1, p2) ~= 0
    return v1
end
function v2.isSubsetOfLanes(p1, p2) -- Line: 679
    local v1 = bit32.band(p1, p2) == p2
    return v1
end
function v2.mergeLanes(p1, p2) -- Line: 684
    return (bit32.bor(p1, p2))
end
function v2.removeLanes(p1, p2) -- Line: 689
    return (bit32.band(p1, (bit32.bnot(p2))))
end
function v2.laneToLanes(p1) -- Line: 696
    return p1
end
function v2.higherPriorityLane(p1, p2) -- Line: 701
    if p1 == 0 then
        if p1 ~= 0 then
            return p1
        end
        return p2
    end
    if p2 ~= 0 then
        if p1 < p2 then
            return p1
        end
        return p2
    end
    if p1 ~= 0 then
        return p1
    end
    return p2
end
function v2.higherLanePriority(p1, p2) -- Line: 717
    if p1 == 0 then
        return p2
    end
    if p2 < p1 then
        return p1
    end
    return p2
end
function v2.createLaneMap(p1) -- Line: 728
    local v1 = {}
    v1[0] = p1
    v1[1] = p1
    v1[2] = p1
    v1[3] = p1
    v1[4] = p1
    v1[5] = p1
    v1[6] = p1
    v1[7] = p1
    v1[8] = p1
    v1[9] = p1
    v1[10] = p1
    v1[11] = p1
    v1[12] = p1
    v1[13] = p1
    v1[14] = p1
    v1[15] = p1
    v1[16] = p1
    v1[17] = p1
    v1[18] = p1
    v1[19] = p1
    v1[20] = p1
    v1[21] = p1
    v1[22] = p1
    v1[23] = p1
    v1[24] = p1
    v1[25] = p1
    v1[26] = p1
    v1[27] = p1
    v1[28] = p1
    v1[29] = p1
    v1[30] = p1
    v1[31] = p1
    return v1
end
function v2.markRootUpdated(p1, p2, p3) -- Line: 772
    p1.pendingLanes = bit32.bor(p1.pendingLanes, p2)
    local v1 = p2 - 1
    p1.suspendedLanes = bit32.band(p1.suspendedLanes, v1)
    p1.pingedLanes = bit32.band(p1.pingedLanes, v1)
    p1.eventTimes[31 - bit32.countlz(p2)] = p3
end
function v2.markRootSuspended(p1, p2) -- Line: 801 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    p1.suspendedLanes = bit32.bor(p1.suspendedLanes, p2)
    p1.pingedLanes = bit32.band(p1.pingedLanes, (bit32.bnot(p2)))
    local v3 = p2
    while 0 < v3 do
        v1 = pickArbitraryLaneIndex(v3)
        v2 = bit32.lshift(1, v1)
        p1.expirationTimes[v1] = -1
        v3 = bit32.band(v3, (bit32.bnot(v2)))
    end
end
function v2.markRootPinged(p1, p2, p3) -- Line: 819
    p1.pingedLanes = bit32.bor(p1.pingedLanes, (bit32.band(p1.suspendedLanes, p2)))
end
function v2.markRootExpired(p1, p2) -- Line: 825
    p1.expiredLanes = bit32.bor(p1.expiredLanes, (bit32.band(p2, p1.pendingLanes)))
end
function v2.markDiscreteUpdatesExpired(p1) -- Line: 831
    p1.expiredLanes = bit32.bor(p1.expiredLanes, (bit32.band(24, p1.pendingLanes)))
end
function v2.hasDiscreteLanes(p1) -- Line: 837
    local v1 = bit32.band(p1, 24) ~= 0
    return v1
end
function v2.markRootMutableRead(p1, p2) -- Line: 842
    p1.mutableReadLanes = bit32.bor(p1.mutableReadLanes, (bit32.band(p2, p1.pendingLanes)))
end
function v2.markRootFinished(p1, p2) -- Line: 848 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    local v3 = bit32.band(p1.pendingLanes, (bit32.bnot(p2)))
    p1.pendingLanes = p2
    p1.suspendedLanes = 0
    p1.pingedLanes = 0
    p1.expiredLanes = bit32.band(p1.expiredLanes, p2)
    p1.mutableReadLanes = bit32.band(p1.mutableReadLanes, p2)
    p1.entangledLanes = bit32.band(p1.entangledLanes, p2)
    local v4 = v3
    while 0 < v4 do
        v1 = pickArbitraryLaneIndex(v4)
        v2 = bit32.lshift(1, v1)
        p1.entanglements[v1] = 0
        p1.eventTimes[v1] = -1
        p1.expirationTimes[v1] = -1
        v4 = bit32.band(v4, (bit32.bnot(v2)))
    end
end
function v2.markRootEntangled(p1, p2) -- Line: 881 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    p1.entangledLanes = bit32.bor(p1.entangledLanes, p2)
    local entanglements = p1.entanglements
    local v3 = p2
    while 0 < v3 do
        v1 = pickArbitraryLaneIndex(v3)
        v2 = bit32.lshift(1, v1)
        entanglements[v1] = bit32.bor(entanglements[v1], p2)
        v3 = bit32.band(v3, (bit32.bnot(v2)))
    end
end
function v2.getBumpedLaneForHydration(p1, p2) -- Line: 897 -- upvalues: getHighestPriorityLanes (val), DefaultLanePriority (ref), invariant (val)
    getHighestPriorityLanes(p2)
    local v1 = DefaultLanePriority
    local v2 = nil
    if v1 == 15 then
        v2 = 0
    elseif v1 == 14 then
        v2 = 0
    elseif v1 == 13 then
        v2 = 4
    elseif v1 == 12 then
        v2 = 4
    elseif v1 == 11 then
        v2 = 32
    elseif v1 == 10 then
        v2 = 32
    elseif v1 == 9 then
        v2 = 256
    elseif v1 == 8 then
        v2 = 256
    elseif v1 == 7 then
        v2 = 4096
    elseif v1 == 6 then
        v2 = 4096
    elseif v1 == 5 then
        v2 = 4096
    elseif v1 == 4 then
        v2 = 67108864
    elseif v1 == 3 then
        v2 = 134217728
    elseif v1 == 2 then
        v2 = 134217728
    elseif v1 == 1 then
        v2 = 0
    elseif v1 ~= 0 then
        invariant(false, "Invalid lane: %s. This is a bug in React.", (tostring(v2)))
    else
        v2 = 0
    end
    if bit32.band(v2, (bit32.bor(p1.suspendedLanes, p2))) ~= 0 then
        return 0
    end
    return v2
end
return v2