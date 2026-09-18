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
--File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.TracingSubscriptions
--                              Dumped in 0.000672 seconds
--                          Bytecode version 9  |  9 functions

local v1 = {}
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local Tracing = require(script.Parent:WaitForChild("Tracing"))
local enableSchedulerTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local __subscriberRef = Tracing.__subscriberRef
local u32 = if enableSchedulerTracing then {} else {}
function v1.unstable_subscribe(p1) -- Line: 29 -- upvalues: enableSchedulerTracing (val), u32 (ref), Object (val), __subscriberRef (val)
    if enableSchedulerTracing then
        u32[p1] = true
        if #Object.keys(u32) == 1 then
            __subscriberRef.current = {
                onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted,
                onInteractionTraced = onInteractionTraced,
                onWorkCanceled = onWorkCanceled,
                onWorkScheduled = onWorkScheduled,
                onWorkStarted = onWorkStarted,
                onWorkStopped = onWorkStopped,
            }
        end
    end
end
function v1.unstable_unsubscribe(p1) -- Line: 46 -- upvalues: enableSchedulerTracing (val), u32 (ref), Object (val), __subscriberRef (val)
    if enableSchedulerTracing then
        u32[p1] = nil
        if #Object.keys(u32) == 0 then
            __subscriberRef.current = nil
        end
    end
end
function onInteractionTraced(p1) -- Line: 56 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v1, v2 = pcall(i.onInteractionTraced, p1)
        if not v1 and not v3 then
            v3 = true
            v4 = v2
        end
    end
    if v3 then
        error(v4)
    end
end
function onInteractionScheduledWorkCompleted(p1) -- Line: 78 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v1, v2 = pcall(i.onInteractionScheduledWorkCompleted, p1)
        if not v1 and not v3 then
            v3 = true
            v4 = v2
        end
    end
    if v3 then
        error(v4)
    end
end
function onWorkScheduled(p1, p2) -- Line: 101 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v2, v1 = pcall(i.onWorkScheduled, p1, p2)
        if not v2 and not v3 then
            v3 = true
            v4 = v1
        end
    end
    if v3 then
        error(v4)
    end
end
function onWorkStarted(p1, p2) -- Line: 123 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v2, v1 = pcall(i.onWorkStarted, p1, p2)
        if not v2 and not v3 then
            v3 = true
            v4 = v1
        end
    end
    if v3 then
        error(v4)
    end
end
function onWorkStopped(p1, p2) -- Line: 145 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v2, v1 = pcall(i.onWorkStopped, p1, p2)
        if not v2 and not v3 then
            v3 = true
            v4 = v1
        end
    end
    if v3 then
        error(v4)
    end
end
function onWorkCanceled(p1, p2) -- Line: 167 -- upvalues: u32 (ref)
    local v1, v2
    local v3 = false
    local v4 = nil
    local v5 = u32
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v2, v1 = pcall(i.onWorkCanceled, p1, p2)
        if not v2 and not v3 then
            v3 = true
            v4 = v1
        end
    end
    if v3 then
        error(v4)
    end
end
return v1