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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulingProfiler
--                              Dumped in 0.000817 seconds
--                          Bytecode version 9  |  19 functions

local performance
local v1 = {}
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local enableSchedulingProfiler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local u70 = _G.performance ~= nil
performance = _G.performance
if not performance then
    performance = {
        mark = function(p1) -- Line: 39
            debug.profilebegin(p1)
            debug.profileend()
        end,
    }
end
function formatLanes(p1) -- Line: 45
    return (tostring(p1))
end
if enableSchedulingProfiler and u70 then
    performance.mark("--react-init-" .. tostring(require(script.Parent.Parent:WaitForChild("shared")).ReactVersion))
end
function v1.markCommitStarted(p1) -- Line: 56 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--commit-start-" .. formatLanes(p1))
    end
end
function v1.markCommitStopped() -- Line: 64 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--commit-stop")
    end
end
local u102 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).WeakMap.new()
local u103 = 0
function getWakeableID(p1) -- Line: 78 -- upvalues: u102 (val), u103 (ref)
    if not (u102:has(p1)) then
        u102:set(p1, u103)
        u103 = u103 + 1
    end
    return u102:get(p1)
end
function v1.markComponentSuspended(p1, p2) -- Line: 86 -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        local u6 = getWakeableID(p2)
        local u10 = getComponentName(p1.type) or "Unknown"
        performance.mark("--suspense-suspend-" .. tostring(u6) .. "-" .. u10)
        p2:andThen(function() -- Line: 95 -- upvalues: performance (upval), u6 (val), u10 (val)
            performance.mark("--suspense-resolved-" .. tostring(u6) .. "-" .. u10)
        end, function() -- Line: 99 -- upvalues: performance (upval), u6 (val), u10 (val)
            performance.mark("--suspense-rejected-" .. tostring(u6) .. "-" .. u10)
        end)
    end
end
function v1.markLayoutEffectsStarted(p1) -- Line: 108 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--layout-effects-start-" .. formatLanes(p1))
    end
end
function v1.markLayoutEffectsStopped() -- Line: 116 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--layout-effects-stop")
    end
end
function v1.markPassiveEffectsStarted(p1) -- Line: 124 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--passive-effects-start-" .. formatLanes(p1))
    end
end
function v1.markPassiveEffectsStopped() -- Line: 132 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--passive-effects-stop")
    end
end
function v1.markRenderStarted(p1) -- Line: 140 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-start-" .. formatLanes(p1))
    end
end
function v1.markRenderYielded() -- Line: 148 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-yield")
    end
end
function v1.markRenderStopped() -- Line: 156 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-stop")
    end
end
function v1.markRenderScheduled(p1) -- Line: 164 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--schedule-render-" .. formatLanes(p1))
    end
end
function v1.markForceUpdateScheduled(p1, p2) -- Line: 172 -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        local v1 = getComponentName(p1.type) or "Unknown"
        performance.mark("--schedule-forced-update-" .. formatLanes(p2) .. "-" .. v1)
    end
end
function v1.markStateUpdateScheduled(p1, p2) -- Line: 184 -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        local v1 = getComponentName(p1.type) or "Unknown"
        performance.mark("--schedule-state-update-" .. formatLanes(p2) .. "-" .. v1)
    end
end
return v1