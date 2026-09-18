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
--      File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler
--                              Dumped in 0.000888 seconds
--                          Bytecode version 9  |  3 functions

local Scheduler = require(script:WaitForChild("Scheduler"))
local function onlyInTestError(p1) -- Line: 14
    return function() -- Line: 15 -- upvalues: p1 (val)
        error(p1 .. " is only available in tests, not in production")
    end
end
local v1 = Scheduler(nil)
local Tracing = require(script:WaitForChild("Tracing"))
local TracingSubscriptions = require(script:WaitForChild("TracingSubscriptions"))
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    return require(script:WaitForChild("unstable_mock"))
end
local v2 = {
    unstable_ImmediatePriority = v1.unstable_ImmediatePriority,
    unstable_UserBlockingPriority = v1.unstable_UserBlockingPriority,
    unstable_NormalPriority = v1.unstable_NormalPriority,
    unstable_IdlePriority = v1.unstable_IdlePriority,
    unstable_LowPriority = v1.unstable_LowPriority,
    unstable_runWithPriority = v1.unstable_runWithPriority,
    unstable_next = v1.unstable_next,
    unstable_scheduleCallback = v1.unstable_scheduleCallback,
    unstable_cancelCallback = v1.unstable_cancelCallback,
    unstable_wrapCallback = v1.unstable_wrapCallback,
    unstable_getCurrentPriorityLevel = v1.unstable_getCurrentPriorityLevel,
    unstable_shouldYield = v1.unstable_shouldYield,
    unstable_requestPaint = v1.unstable_requestPaint,
    unstable_continueExecution = v1.unstable_continueExecution,
    unstable_pauseExecution = v1.unstable_pauseExecution,
    unstable_getFirstCallbackNode = v1.unstable_getFirstCallbackNode,
    unstable_now = v1.unstable_now,
    unstable_forceFrameRate = v1.unstable_forceFrameRate,
}
local u53 = "unstable_flushAllWithoutAsserting"
function v2.unstable_flushAllWithoutAsserting() -- Line: 15 -- upvalues: u53 (val)
    error(u53 .. " is only available in tests, not in production")
end
local u55 = "unstable_flushAll"
function v2.unstable_flushAll() -- Line: 15 -- upvalues: u55 (val)
    error(u55 .. " is only available in tests, not in production")
end
local u57 = "unstable_flushNumberOfYields"
function v2.unstable_flushNumberOfYields() -- Line: 15 -- upvalues: u57 (val)
    error(u57 .. " is only available in tests, not in production")
end
local u59 = "unstable_clearYields"
function v2.unstable_clearYields() -- Line: 15 -- upvalues: u59 (val)
    error(u59 .. " is only available in tests, not in production")
end
local u61 = "unstable_clearYields"
function v2.unstable_flushUntilNextPaint() -- Line: 15 -- upvalues: u61 (val)
    error(u61 .. " is only available in tests, not in production")
end
local u63 = "unstable_advanceTime"
function v2.unstable_advanceTime() -- Line: 15 -- upvalues: u63 (val)
    error(u63 .. " is only available in tests, not in production")
end
local u65 = "unstable_flushExpired"
function v2.unstable_flushExpired() -- Line: 15 -- upvalues: u65 (val)
    error(u65 .. " is only available in tests, not in production")
end
local u67 = "unstable_yieldValue"
function v2.unstable_yieldValue() -- Line: 15 -- upvalues: u67 (val)
    error(u67 .. " is only available in tests, not in production")
end
local v3 = {}
local u70 = "unstable_wrap"
function v3.unstable_wrap() -- Line: 15 -- upvalues: u70 (val)
    error(u70 .. " is only available in tests, not in production")
end
v3.__interactionsRef = {}
v3.__subscriberRef = {}
v2.tracing = v3
v3 = Tracing
local v4 = nil
local v5 = nil
for i, j in v3, v4, v5 do
    v2.tracing[i] = j
end
v3 = TracingSubscriptions
v4 = nil
v5 = nil
for k, n in v3, v4, v5 do
    v2.tracing[k] = n
end
return v2