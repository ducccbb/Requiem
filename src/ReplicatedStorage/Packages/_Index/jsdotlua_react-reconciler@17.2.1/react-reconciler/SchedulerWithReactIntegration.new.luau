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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulerWithReactIntegration.new
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  15 functions

local v1
local Array = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
require(script.Parent:WaitForChild("ReactInternalTypes"))
local scheduler = require(script.Parent.Parent:WaitForChild("scheduler"))
local decoupleUpdatePriorityFromScheduler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local SyncLanePriority = ReactFiberLane.SyncLanePriority
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local unstable_runWithPriority = scheduler.unstable_runWithPriority
local unstable_scheduleCallback = scheduler.unstable_scheduleCallback
local unstable_cancelCallback = scheduler.unstable_cancelCallback
local unstable_requestPaint = scheduler.unstable_requestPaint
local unstable_now = scheduler.unstable_now
local unstable_getCurrentPriorityLevel = scheduler.unstable_getCurrentPriorityLevel
local unstable_ImmediatePriority = scheduler.unstable_ImmediatePriority
local unstable_UserBlockingPriority = scheduler.unstable_UserBlockingPriority
local unstable_NormalPriority = scheduler.unstable_NormalPriority
local unstable_LowPriority = scheduler.unstable_LowPriority
local unstable_IdlePriority = scheduler.unstable_IdlePriority
local v2 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local ImmediatePriority = v2.ImmediatePriority
local UserBlockingPriority = v2.UserBlockingPriority
local NormalPriority = v2.NormalPriority
local LowPriority = v2.LowPriority
local IdlePriority = v2.IdlePriority
local NoPriority = v2.NoPriority
local u95 = nil
local u96 = {}
if unstable_requestPaint == nil then
    function v1() end
else
    v1 = unstable_requestPaint
end
local u100 = nil
local u101 = nil
local u102 = false
local u105 = unstable_now()
function reactPriorityToSchedulerPriority(p1) -- Line: 139 -- upvalues: ImmediatePriority (val), unstable_ImmediatePriority (val), UserBlockingPriority (val), unstable_UserBlockingPriority (val), NormalPriority (val), unstable_NormalPriority (val), LowPriority (val), unstable_LowPriority (val), IdlePriority (val), unstable_IdlePriority (val), invariant (val)
    if p1 == ImmediatePriority then
        return unstable_ImmediatePriority
    end
    if p1 == UserBlockingPriority then
        return unstable_UserBlockingPriority
    end
    if p1 == NormalPriority then
        return unstable_NormalPriority
    end
    if p1 == LowPriority then
        return unstable_LowPriority
    end
    if p1 == IdlePriority then
        return unstable_IdlePriority
    end
    invariant(false, "Unknown priority level.")
    return nil
end
local function runWithPriority(p1, p2) -- Line: 158 -- upvalues: unstable_runWithPriority (val)
    local v1 = reactPriorityToSchedulerPriority(p1)
    return unstable_runWithPriority(v1, p2)
end
local function flushSyncCallbackQueue() -- Line: 200 -- upvalues: u101 (ref), unstable_cancelCallback (val), u95 (ref)
    if u101 ~= nil then
        u101 = nil
        unstable_cancelCallback(u101)
    end
    return u95()
end
function u95() -- Line: 209 -- upvalues: u102 (ref), u100 (ref), decoupleUpdatePriorityFromScheduler (val), getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), SyncLanePriority (val), runWithPriority (val), describeError (val), ImmediatePriority (val), unstable_runWithPriority (val), Array (val), unstable_scheduleCallback (val), unstable_ImmediatePriority (val), flushSyncCallbackQueue (val)
    local v1, v2, v3, v4
    if u102 or u100 == nil then
        return false
    end
    u102 = true
    local u3 = 1
    if not decoupleUpdatePriorityFromScheduler then
        v2 = nil
        if _G.__YOLO__ then
            v1 = true
            local u78 = u100
            v4 = reactPriorityToSchedulerPriority(ImmediatePriority)
            unstable_runWithPriority(v4, function() -- Line: 306 -- upvalues: u78 (val), u3 (ref)
                local v1 = u78
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    u3 = i
                    while true do
                        j = j(true)
                        if j == nil then
                            break
                        end
                    end
                end
            end)
            u100 = nil
        else
            local v5
            local u66 = u100
            v5, v3 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 290 -- upvalues: u66 (val), u3 (ref)
                local v1 = u66
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    u3 = i
                    while true do
                        j = j(true)
                        if j == nil then
                            break
                        end
                    end
                end
            end)
            v1 = v5
            v2 = v3
            u100 = nil
        end
        u102 = false
        if not v1 then
            if u100 ~= nil then
                u100 = Array.slice(u100, u3 + 1)
            end
            unstable_scheduleCallback(unstable_ImmediatePriority, flushSyncCallbackQueue)
            error(v2)
        end
    else
        v1 = getCurrentUpdateLanePriority()
        local v6 = nil
        if _G.__YOLO__ then
            v2 = true
            local u26 = u100
            setCurrentUpdateLanePriority(SyncLanePriority)
            local v7 = reactPriorityToSchedulerPriority(ImmediatePriority)
            unstable_runWithPriority(v7, function() -- Line: 248 -- upvalues: u26 (val), u3 (ref)
                local v1 = u26
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    u3 = i
                    while true do
                        j = j(true)
                        if j == nil then
                            break
                        end
                    end
                    u3 = u3 + 1
                end
            end)
            u100 = nil
        else
            local u11 = u100
            setCurrentUpdateLanePriority(SyncLanePriority)
            v3, v4 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 230 -- upvalues: u11 (val), u3 (ref)
                local v1 = u11
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    u3 = i
                    while true do
                        j = j(true)
                        if j == nil then
                            break
                        end
                    end
                end
            end)
            v2 = v3
            v6 = v4
            u100 = nil
        end
        setCurrentUpdateLanePriority(v1)
        u102 = false
        if not v2 then
            if u100 ~= nil then
                u100 = Array.slice(u100, u3 + 1)
            end
            unstable_scheduleCallback(unstable_ImmediatePriority, flushSyncCallbackQueue)
            error(v6)
        end
    end
    return true
end
return {
    ImmediatePriority = ImmediatePriority,
    UserBlockingPriority = UserBlockingPriority,
    NormalPriority = NormalPriority,
    LowPriority = LowPriority,
    IdlePriority = IdlePriority,
    NoPriority = NoPriority,
    getCurrentPriorityLevel = function() -- Line: 120 -- upvalues: unstable_getCurrentPriorityLevel (val), unstable_ImmediatePriority (val), ImmediatePriority (val), unstable_UserBlockingPriority (val), UserBlockingPriority (val), unstable_NormalPriority (val), NormalPriority (val), unstable_LowPriority (val), LowPriority (val), unstable_IdlePriority (val), IdlePriority (val), invariant (val), NoPriority (val)
        local v1 = unstable_getCurrentPriorityLevel()
        if v1 == unstable_ImmediatePriority then
            return ImmediatePriority
        end
        if v1 == unstable_UserBlockingPriority then
            return UserBlockingPriority
        end
        if v1 == unstable_NormalPriority then
            return NormalPriority
        end
        if v1 == unstable_LowPriority then
            return LowPriority
        end
        if v1 == unstable_IdlePriority then
            return IdlePriority
        end
        invariant(false, "Unknown priority level.")
        return NoPriority
    end,
    flushSyncCallbackQueue = flushSyncCallbackQueue,
    runWithPriority = runWithPriority,
    scheduleCallback = function(p1, p2, p3) -- Line: 166 -- upvalues: unstable_scheduleCallback (val)
        local v1 = reactPriorityToSchedulerPriority(p1)
        return unstable_scheduleCallback(v1, p2, p3)
    end,
    scheduleSyncCallback = function(p1) -- Line: 175 -- upvalues: u100 (ref), u101 (ref), unstable_scheduleCallback (val), unstable_ImmediatePriority (val), u95 (ref), u96 (val)
        if u100 ~= nil then
            table.insert(u100, p1)
        else
            u100 = {p1}
            u101 = unstable_scheduleCallback(unstable_ImmediatePriority, u95)
        end
        return u96
    end,
    cancelCallback = function(p1) -- Line: 194 -- upvalues: u96 (val), unstable_cancelCallback (val)
        if p1 ~= u96 then
            unstable_cancelCallback(p1)
        end
    end,
    now = function() -- Line: 116 -- upvalues: unstable_now (val), u105 (val)
        return unstable_now() - u105
    end,
    requestPaint = v1,
    shouldYield = scheduler.unstable_shouldYield,
}