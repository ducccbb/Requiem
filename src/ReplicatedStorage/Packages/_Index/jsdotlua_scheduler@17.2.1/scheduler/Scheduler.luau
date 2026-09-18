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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.Scheduler
--                               Dumped in 0.00240 seconds
--                          Bytecode version 9  |  23 functions

return function(p1) -- Line: 12
    local u92, v1
    local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
    local SchedulerFeatureFlags = require(script.Parent:WaitForChild("SchedulerFeatureFlags"))
    local enableSchedulerDebugging = SchedulerFeatureFlags.enableSchedulerDebugging
    local enableProfiling = SchedulerFeatureFlags.enableProfiling
    local SchedulerHostConfig = p1
    if not SchedulerHostConfig then
        SchedulerHostConfig = require(script.Parent:WaitForChild("SchedulerHostConfig"))
    end
    local requestHostCallback = SchedulerHostConfig.requestHostCallback
    local requestHostTimeout = SchedulerHostConfig.requestHostTimeout
    local cancelHostTimeout = SchedulerHostConfig.cancelHostTimeout
    local shouldYieldToHost = SchedulerHostConfig.shouldYieldToHost
    local getCurrentTime = SchedulerHostConfig.getCurrentTime
    local u38 = nil
    local u39 = nil
    local u40 = nil
    local function v2(p1, p2) -- Line: 42 -- upvalues: u39 (ref)
        local v1 = #p1 + 1
        p1[v1] = p2
        u39(p1, p2, v1)
    end
    local function v3(p1) -- Line: 49
        return p1[1]
    end
    local function v4(p1) -- Line: 53 -- upvalues: u40 (ref)
        local v1 = p1[1]
        if v1 == nil then
            return nil
        end
        local v2 = p1[#p1]
        p1[#p1] = nil
        if v2 ~= v1 then
            p1[1] = v2
            u40(p1, v2, 1)
        end
        return v1
    end
    function u39(p1, p2, p3) -- Line: 69 -- upvalues: u38 (ref)
        local v1, v2, v3
        while true do
            v1 = math.floor(p3 / 2)
            v2 = p1[v1]
            if v2 == nil then
                break
            end
            v3 = u38(v2, p2)
            if 0 >= v3 then
                break
            end
            p1[v1] = p2
            p1[p3] = v2
        end
    end
    function u40(p1, p2, p3) -- Line: 85 -- upvalues: u38 (ref)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = #p1
        v3, v1, v2 = p3, p1, p2
        while v3 < v9 do
            v4 = v3 * 2
            v5 = v1[v4]
            v6 = v4 + 1
            v7 = v1[v6]
            if v5 ~= nil then
                v8 = u38(v5, v2)
                if v8 < 0 then
                    if v7 == nil then
                        v1[v3] = v5
                        v1[v4] = v2
                        v3 = v4
                    else
                        v8 = u38(v7, v5)
                        if v8 < 0 then
                            v1[v3] = v7
                            v1[v6] = v2
                            v3 = v6
                        end
                    end
                    continue
                end
            end
            if v7 ~= nil then
                v8 = u38(v7, v2)
                if v8 < 0 then
                    v1[v3] = v7
                    v1[v6] = v2
                    v3 = v6
                end
            end
            return
        end
    end
    function u38(p1, p2) -- Line: 115
        local v1 = p1.sortIndex - p2.sortIndex
        if v1 == 0 then
            return p1.id - p2.id
        end
        return v1
    end
    local SchedulerPriorities = require(script.Parent:WaitForChild("SchedulerPriorities"))
    local ImmediatePriority = SchedulerPriorities.ImmediatePriority
    local UserBlockingPriority = SchedulerPriorities.UserBlockingPriority
    local NormalPriority = SchedulerPriorities.NormalPriority
    local LowPriority = SchedulerPriorities.LowPriority
    local IdlePriority = SchedulerPriorities.IdlePriority
    local SchedulerProfiling = require(script.Parent:WaitForChild("SchedulerProfiling"))
    local markTaskRun = SchedulerProfiling.markTaskRun
    local markTaskYield = SchedulerProfiling.markTaskYield
    local markTaskCompleted = SchedulerProfiling.markTaskCompleted
    local markTaskCanceled = SchedulerProfiling.markTaskCanceled
    local markTaskErrored = SchedulerProfiling.markTaskErrored
    local markSchedulerSuspended = SchedulerProfiling.markSchedulerSuspended
    local markSchedulerUnsuspended = SchedulerProfiling.markSchedulerUnsuspended
    local markTaskStart = SchedulerProfiling.markTaskStart
    local u78 = {}
    local u79 = {}
    local u80 = 1
    local u81 = false
    local u82 = nil
    local u83 = NormalPriority
    local u84 = false
    local u85 = false
    local u86 = false
    local u88 = nil
    local u89 = nil
    local function advanceTimers(p1) -- Line: 182 -- upvalues: u79 (val), u40 (ref), u78 (val), u39 (ref), enableProfiling (val), markTaskStart (val)
        local v1, v2, v3
        local v4 = u79[1]
        local v5 = p1
        while v4 ~= nil do
            if v4.callback == nil then
                v1 = u79
                v2 = v1[1]
                if v2 ~= nil then
                    v3 = v1[#v1]
                    v1[#v1] = nil
                    if v3 ~= v2 then
                        v1[1] = v3
                        u40(v1, v3, 1)
                    end
                end
            elseif v4.startTime > v5 then
                return
            else
                v1 = u79
                v2 = v1[1]
                if v2 ~= nil then
                    v3 = v1[#v1]
                    v1[#v1] = nil
                    if v3 ~= v2 then
                        v1[1] = v3
                        u40(v1, v3, 1)
                    end
                end
                v4.sortIndex = v4.expirationTime
                v1 = u78
                v2 = v4
                v3 = #v1 + 1
                v1[v3] = v2
                u39(v1, v2, v3)
                if enableProfiling then
                    markTaskStart(v4, v5)
                    v4.isQueued = true
                end
                v4 = u79[1]
            end
        end
    end
    function u92(p1) -- Line: 208 -- upvalues: u86 (ref), advanceTimers (val), u85 (ref), u78 (val), requestHostCallback (val), u88 (ref), u79 (val), requestHostTimeout (val), u92 (ref)
        u86 = false
        advanceTimers(p1)
        if u85 then
            return
        end
        if u78[1] ~= nil then
            u85 = true
            requestHostCallback(u88)
            return
        end
        local v1 = u79[1]
        if v1 ~= nil then
            requestHostTimeout(u92, v1.startTime - p1)
        end
    end
    function u88(p1, p2) -- Line: 225 -- upvalues: enableProfiling (val), markSchedulerUnsuspended (val), u85 (ref), u86 (ref), cancelHostTimeout (val), u84 (ref), u83 (ref), u89 (ref), describeError (val), u82 (ref), getCurrentTime (val), markTaskErrored (val), markSchedulerSuspended (val)
        local v1, v2
        if enableProfiling then
            markSchedulerUnsuspended(p2)
        end
        u85 = false
        if u86 then
            u86 = false
            cancelHostTimeout()
        end
        u84 = true
        if _G.__YOLO__ then
            v1 = true
            v2 = u89(p1, p2)
        elseif not enableProfiling then
            v1 = true
            v2 = u89(p1, p2)
        else
            local v3, v4
            v3, v4 = xpcall(u89, describeError, p1, p2)
            v1 = v3
            v2 = v4
            if not v1 and u82 ~= nil then
                markTaskErrored(u82, (getCurrentTime()))
                u82.isQueued = false
            end
        end
        u82 = nil
        u83 = u83
        u84 = false
        if enableProfiling then
            markSchedulerSuspended((getCurrentTime()))
        end
        if not v1 then
            error(v2)
        end
        return v2
    end
    function u89(p1, p2) -- Line: 282 -- upvalues: advanceTimers (val), u82 (ref), u78 (val), enableSchedulerDebugging (val), u81 (ref), shouldYieldToHost (val), u83 (ref), markTaskRun (val), getCurrentTime (val), markTaskYield (val), enableProfiling (val), markTaskCompleted (val), u40 (ref), u79 (val), requestHostTimeout (val), u92 (ref)
        local callback, v1, v2, v3, v4, v5, v6
        local v7 = p2
        advanceTimers(v7)
        u82 = u78[1]
        while u82 ~= nil do
            if enableSchedulerDebugging and u81 then
                break
            end
            if v7 < u82.expirationTime and (not v1 or shouldYieldToHost()) then
                break
            end
            callback = u82.callback
            if typeof(callback) ~= "function" then
                v2 = u78
                v3 = v2[1]
                if v3 ~= nil then
                    v4 = v2[#v2]
                    v2[#v2] = nil
                    if v4 ~= v3 then
                        v2[1] = v4
                        u40(v2, v4, 1)
                    end
                end
            else
                u82.callback = nil
                u83 = u82.priorityLevel
                v2 = u82.expirationTime <= v7
                markTaskRun(u82, v7)
                v3 = callback(v2)
                v7 = getCurrentTime()
                if typeof(v3) ~= "function" then
                    if enableProfiling then
                        markTaskCompleted(u82, v7)
                        u82.isQueued = false
                    end
                    if u82 == u78[1] then
                        v4 = u78
                        v5 = v4[1]
                        if v5 ~= nil then
                            v6 = v4[#v4]
                            v4[#v4] = nil
                            if v6 ~= v5 then
                                v4[1] = v6
                                u40(v4, v6, 1)
                            end
                        end
                    end
                else
                    u82.callback = v3
                    markTaskYield(u82, v7)
                end
                advanceTimers(v7)
            end
            u82 = u78[1]
        end
        if u82 ~= nil then
            return true
        end
        local v8 = u79[1]
        if v8 ~= nil then
            requestHostTimeout(u92, v8.startTime - v7)
        end
        return false
    end
    local v5 = {
        unstable_ImmediatePriority = ImmediatePriority,
        unstable_UserBlockingPriority = UserBlockingPriority,
        unstable_NormalPriority = NormalPriority,
        unstable_IdlePriority = IdlePriority,
        unstable_LowPriority = LowPriority,
        unstable_runWithPriority = function(p1, p2) -- Line: 339 -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), LowPriority (val), IdlePriority (val), u83 (ref), describeError (val)
            local v1, v2, v3
            if p1 == ImmediatePriority then
                v1 = p1
            elseif p1 == UserBlockingPriority then
                v1 = p1
            elseif p1 == NormalPriority then
                v1 = p1
            elseif p1 == LowPriority then
                v1 = p1
            elseif p1 ~= IdlePriority then
                v1 = NormalPriority
            else
                v1 = p1
            end
            u83 = v1
            if _G.__YOLO__ then
                v2 = true
                v3 = p2()
            else
                local v4, v5
                v4, v5 = xpcall(p2, describeError)
                v2 = v4
                v3 = v5
            end
            u83 = u83
            if not v2 then
                error(v3)
            end
            return v3
        end,
        unstable_next = function(p1) -- Line: 374 -- upvalues: u83 (ref), ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), describeError (val)
            local v1, v2, v3
            if u83 == ImmediatePriority then
                v1 = NormalPriority
            elseif u83 ~= UserBlockingPriority and u83 ~= NormalPriority then
                v1 = u83
            end
            u83 = v1
            if _G.__YOLO__ then
                v2 = true
                v3 = p1()
            else
                local v4, v5
                v4, v5 = xpcall(p1, describeError)
                v2 = v4
                v3 = v5
            end
            u83 = u83
            if not v2 then
                error(v3)
            end
            return v3
        end,
        unstable_scheduleCallback = function(p1, p2, p3) -- Line: 438 -- upvalues: getCurrentTime (val), ImmediatePriority (val), UserBlockingPriority (val), IdlePriority (val), LowPriority (val), u80 (ref), enableProfiling (val), u79 (val), u39 (ref), u78 (val), u86 (ref), cancelHostTimeout (val), requestHostTimeout (val), u92 (ref), markTaskStart (val), u85 (ref), u84 (ref), requestHostCallback (val), u88 (ref)
            local v1, v2, v3, v4
            local v5 = getCurrentTime()
            if typeof(p3) ~= "table" then
                v1 = v5
            else
                local delay = p3.delay
                if typeof(delay) ~= "number" then
                    v1 = v5
                elseif 0 < delay then
                    v1 = v5 + delay
                end
            end
            if p1 == ImmediatePriority then
                v2 = -1
            elseif p1 == UserBlockingPriority then
                v2 = 250
            elseif p1 == IdlePriority then
                v2 = 1073741823
            elseif p1 ~= LowPriority then
                v2 = 5000
            else
                v2 = 10000
            end
            local v6 = v1 + v2
            local v7 = {
                sortIndex = -1,
                id = u80,
                callback = p2,
                priorityLevel = p1,
                startTime = v1,
                expirationTime = v6,
            }
            u80 = u80 + 1
            if enableProfiling then
                v7.isQueued = false
            end
            if v5 >= v1 then
                v7.sortIndex = v6
                v3 = u78
                v4 = #v3 + 1
                v3[v4] = v7
                u39(v3, v7, v4)
                if enableProfiling then
                    markTaskStart(v7, v5)
                    v7.isQueued = true
                end
                if not u85 and not u84 then
                    u85 = true
                    requestHostCallback(u88)
                end
                return v7
            end
            v7.sortIndex = v1
            v3 = u79
            v4 = #v3 + 1
            v3[v4] = v7
            u39(v3, v7, v4)
            if #u78 ~= 0 or v7 ~= u79[1] then
                return v7
            end
            if not u86 then
                u86 = true
            else
                cancelHostTimeout()
            end
            requestHostTimeout(u92, v1 - v5)
            return v7
        end,
        unstable_cancelCallback = function(p1) -- Line: 534 -- upvalues: enableProfiling (val), getCurrentTime (val), markTaskCanceled (val)
            if enableProfiling and p1.isQueued then
                markTaskCanceled(p1, (getCurrentTime()))
                p1.isQueued = false
            end
            p1.callback = nil
        end,
        unstable_wrapCallback = function(p1) -- Line: 410 -- upvalues: u83 (ref), describeError (val)
            local u1 = u83
            return function(...) -- Line: 413 -- upvalues: u83 (upval), u1 (val), p1 (val), describeError (upval)
                local v1, v2
                u83 = u1
                if _G.__YOLO__ then
                    v1 = true
                    v2 = p1(...)
                else
                    local v3, v4
                    v3, v4 = xpcall(p1, describeError, ...)
                    v1 = v3
                    v2 = v4
                end
                u83 = u83
                if not v1 then
                    error(v2)
                end
                return v2
            end
        end,
        unstable_getCurrentPriorityLevel = function() -- Line: 549 -- upvalues: u83 (ref)
            return u83
        end,
        unstable_shouldYield = shouldYieldToHost,
        unstable_requestPaint = SchedulerHostConfig.requestPaint,
        unstable_continueExecution = function() -- Line: 522 -- upvalues: u81 (ref), u85 (ref), u84 (ref), requestHostCallback (val), u88 (ref)
            u81 = false
            if not u85 and not u84 then
                u85 = true
                requestHostCallback(u88)
            end
        end,
        unstable_pauseExecution = function() -- Line: 518 -- upvalues: u81 (ref)
            u81 = true
        end,
        unstable_getFirstCallbackNode = function() -- Line: 530 -- upvalues: u78 (val)
            return u78[1]
        end,
        unstable_now = getCurrentTime,
        unstable_forceFrameRate = SchedulerHostConfig.forceFrameRate,
    }
    if not enableProfiling then
        v1 = nil
    else
        v1 = {startLoggingProfilingEvents = SchedulerProfiling.startLoggingProfilingEvents, stopLoggingProfilingEvents = SchedulerProfiling.stopLoggingProfilingEvents}
    end
    v5.unstable_Profiling = v1
    return v5
end