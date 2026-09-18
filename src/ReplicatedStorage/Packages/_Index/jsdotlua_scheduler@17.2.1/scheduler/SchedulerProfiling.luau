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
--File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerProfiling
--                              Dumped in 0.000611 seconds
--                          Bytecode version 9  |  12 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local u10 = {}
require(script.Parent:WaitForChild("SchedulerPriorities"))
local enableProfiling = require(script.Parent:WaitForChild("SchedulerFeatureFlags")).enableProfiling
local u28 = 0
local u29 = 0
local u30 = 0
local u31 = nil
local u32 = nil
local u33 = 1
local function logEvent(p1) -- Line: 45 -- upvalues: u32 (ref), u33 (ref), u30 (ref), console (val), u10 (val), u31 (ref)
    if u32 == nil then
        return
    end
    u33 = u33 + #p1
    local v1 = u33 + 1
    if u30 >= v1 then
        table.insert(u32, p1)
        return
    end
    u30 = u30 * 2
    if 524288 < u30 then
        console.error("Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.")
        u10.stopLoggingProfilingEvents()
        return
    end
    v1 = {}
    table.insert(v1, u32)
    u31 = v1
    u32 = v1
    table.insert(u32, p1)
end
function u10.startLoggingProfilingEvents() -- Line: 69 -- upvalues: u30 (ref), u31 (ref), u32 (ref), u33 (ref)
    u30 = 131072
    u31 = {}
    u32 = u31
    u33 = 1
end
function u10.stopLoggingProfilingEvents() -- Line: 76 -- upvalues: u31 (ref), u30 (ref), u32 (ref), u33 (ref)
    u30 = 0
    u31 = nil
    u32 = nil
    u33 = 1
    return u31
end
function u10.markTaskStart(p1, p2) -- Line: 86 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({1, p2 * 1000, p1.id, p1.priorityLevel})
    end
end
function u10.markTaskCompleted(p1, p2) -- Line: 97 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({2, p2 * 1000, p1.id})
    end
end
function u10.markTaskCanceled(p1, p2) -- Line: 108 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({4, p2 * 1000, p1.id})
    end
end
function u10.markTaskErrored(p1, p2) -- Line: 116 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({3, p2 * 1000, p1.id})
    end
end
function u10.markTaskRun(p1, p2) -- Line: 124 -- upvalues: enableProfiling (val), u28 (ref), u32 (ref), logEvent (val)
    if enableProfiling then
        u28 = u28 + 1
        if u32 ~= nil then
            logEvent({5, p2 * 1000, p1.id, u28})
        end
    end
end
function u10.markTaskYield(p1, p2) -- Line: 134 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val), u28 (ref)
    if enableProfiling and u32 ~= nil then
        logEvent({6, p2 * 1000, p1.id, u28})
    end
end
function u10.markSchedulerSuspended(p1) -- Line: 142 -- upvalues: enableProfiling (val), u29 (ref), u32 (ref), logEvent (val)
    if enableProfiling then
        u29 = u29 + 1
        if u32 ~= nil then
            logEvent({7, p1 * 1000, u29})
        end
    end
end
function u10.markSchedulerUnsuspended(p1) -- Line: 152 -- upvalues: enableProfiling (val), u32 (ref), logEvent (val), u29 (ref)
    if enableProfiling and u32 ~= nil then
        logEvent({8, p1 * 1000, u29})
    end
end
return u10