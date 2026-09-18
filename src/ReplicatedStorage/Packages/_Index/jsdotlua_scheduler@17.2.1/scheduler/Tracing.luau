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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.Tracing
--                               Dumped in 0.00103 seconds
--                          Bytecode version 9  |  16 functions

local Set = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local v1 = {}
local enableSchedulerTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local u22 = 0
local u23 = 0
local u29 = nil
local u31 = nil
if enableSchedulerTracing then
    u29 = {current = Set.new()}
    u31 = {}
end
v1.__interactionsRef = u29
v1.__subscriberRef = u31
function v1.unstable_clear(p1) -- Line: 91 -- upvalues: enableSchedulerTracing (val), u29 (ref), Set (val)
    local v1, v2
    if not enableSchedulerTracing then
        return p1()
    end
    u29.current = Set.new()
    v1, v2 = pcall(p1)
    u29.current = u29.current
    if not v1 then
        error(v2)
    end
    return v2
end
function v1.unstable_getCurrent() -- Line: 111 -- upvalues: enableSchedulerTracing (val), u29 (ref)
    if not enableSchedulerTracing then
        return nil
    end
    return u29.current
end
function v1.unstable_getThreadID() -- Line: 119 -- upvalues: u23 (ref)
    u23 = u23 + 1
    return u23
end
function v1.unstable_trace(p1, p2, p3, p4) -- Line: 125 -- upvalues: enableSchedulerTracing (val), u22 (ref), u29 (ref), Set (val), u31 (ref)
    local u29, u5, v1, v2, v3, v4, v5, v6, v7, v8
    if p4 == nil then
        u5 = 0
    else
        u5 = p4
    end
    if not enableSchedulerTracing then
        return p3()
    end
    local u10 = {__count = 1, id = u22, name = p1, timestamp = p2}
    u22 = u22 + 1
    local current_2 = u29.current
    local u21 = Set.new(current_2)
    u21:add(u10)
    u29.current = u21
    local current = u31.current
    u29 = nil
    v1, v2 = pcall(function() -- Line: 154 -- upvalues: current (val), u10 (val)
        if current ~= nil then
            current.onInteractionTraced(u10)
        end
    end)
    v3, v4 = pcall(function() -- Line: 161 -- upvalues: current (val), u21 (val), u5 (val)
        if current ~= nil then
            current.onWorkStarted(u21, u5)
        end
    end)
    v5, v6 = pcall(function() -- Line: 169 -- upvalues: u29 (ref), p3 (val)
        u29 = p3()
    end)
    u29.current = current_2
    v7, v8 = pcall(function() -- Line: 175 -- upvalues: current (val), u21 (val), u5 (val)
        if current ~= nil then
            current.onWorkStopped(u21, u5)
        end
    end)
    u10.__count = u10.__count - 1
    if current ~= nil and u10.__count == 0 then
        current.onInteractionScheduledWorkCompleted(u10)
    end
    if not v7 then
        error(v8)
    end
    if not v5 then
        error(v6)
    end
    if not v3 then
        error(v4)
    end
    if not v1 then
        error(v2)
    end
    return u29
end
function v1.unstable_wrap(p1, p2) -- Line: 208 -- upvalues: enableSchedulerTracing (val), u29 (ref), u31 (ref)
    local u2
    if p2 ~= nil then
        u2 = p2
    else
        u2 = 0
    end
    if not enableSchedulerTracing then
        return p1
    end
    local current = u29.current
    local current_2 = u31.current
    if current_2 ~= nil then
        current_2.onWorkScheduled(current, u2)
    end
    local v1 = current
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        j.__count = j.__count + 1
    end
    local u25 = false
    local v4 = {}
    setmetatable(v4, {
        __call = function(a1, ...) -- Line: 236 -- upvalues: u29 (upval), current (val), current_2 (ref), u31 (upval), u2 (ref), p1 (val), u25 (ref)
            local v1, v2, v3
            local current_3 = u29.current
            u29.current = current
            current_2 = u31.current
            v1, v2 = pcall(function(...) -- Line: 243 -- upvalues: current_2 (upval), current (upval), u2 (upval), p1 (upval), u29 (upval), current_3 (val)
                local u0, v1, v2, v3, v4
                v1, v2 = pcall(function() -- Line: 247 -- upvalues: current_2 (upval), current (upval), u2 (upval)
                    if current_2 ~= nil then
                        current_2.onWorkStarted(current, u2)
                    end
                end)
                v3, v4 = pcall(function(...) -- Line: 254 -- upvalues: u0 (ref), p1 (upval)
                    u0 = p1(...)
                end, ...)
                u29.current = current_3
                if current_2 ~= nil then
                    current_2.onWorkStopped(current, u2)
                end
                if not v3 then
                    error(v4)
                end
                if not v1 then
                    error(v2)
                end
                return nil
            end, ...)
            if not u25 then
                u25 = true
                v3 = current
                local v4 = nil
                local v5 = nil
                for i, j in v3, v4, v5 do
                    j.__count = j.__count - 1
                    if current_2 ~= nil and j.__count == 0 then
                        current_2.onInteractionScheduledWorkCompleted(j)
                    end
                end
            end
            if not v1 then
                error(v2)
            end
            return v2
        end,
    })
    function v4.cancel() -- Line: 301 -- upvalues: current_2 (ref), u31 (upval), current (val), u2 (ref)
        local v1, v2
        current_2 = u31.current
        v1, v2 = pcall(function() -- Line: 304 -- upvalues: current_2 (upval), current (upval), u2 (upval)
            if current_2 ~= nil then
                current_2.onWorkCanceled(current, u2)
            end
        end)
        local v3 = current
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            j.__count = j.__count - 1
            if current_2 ~= nil and j.__count == 0 then
                current_2.onInteractionScheduledWorkCompleted(j)
            end
        end
        if not v1 then
            error(v2)
        end
    end
    return v4
end
return v1