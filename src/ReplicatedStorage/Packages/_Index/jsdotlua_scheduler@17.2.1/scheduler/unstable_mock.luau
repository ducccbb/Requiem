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
--File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.unstable_mock
--                              Dumped in 0.000249 seconds
--                          Bytecode version 9  |  1 functions

local Tracing = require(script.Parent:WaitForChild("Tracing"))
local TracingSubscriptions = require(script.Parent:WaitForChild("TracingSubscriptions"))
local Scheduler = require(script.Parent:WaitForChild("Scheduler"))
local forks = script.Parent:WaitForChild("forks")
local v1 = require(forks:WaitForChild("SchedulerHostConfig.mock"))
local v2 = Scheduler(v1)
local v3 = {tracing = {}}
local v4 = v2
local v5 = nil
local v6 = nil
for i, j in v4, v5, v6 do
    v3[i] = j
end
v4 = Tracing
v5 = nil
v6 = nil
for k, n in v4, v5, v6 do
    v3.tracing[k] = n
end
v4 = TracingSubscriptions
v5 = nil
v6 = nil
for m, i5 in v4, v5, v6 do
    v3.tracing[m] = i5
end
v3.unstable_flushAllWithoutAsserting = v1.unstable_flushAllWithoutAsserting
v3.unstable_flushNumberOfYields = v1.unstable_flushNumberOfYields
v3.unstable_flushExpired = v1.unstable_flushExpired
v3.unstable_clearYields = v1.unstable_clearYields
v3.unstable_flushUntilNextPaint = v1.unstable_flushUntilNextPaint
v3.unstable_flushAll = v1.unstable_flushAll
v3.unstable_yieldValue = v1.unstable_yieldValue
v3.unstable_advanceTime = v1.unstable_advanceTime
v3.unstable_Profiling = v2.unstable_Profiling
return v3