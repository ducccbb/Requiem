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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactProfilerTimer.new
--                              Dumped in 0.000638 seconds
--                          Bytecode version 9  |  11 functions

require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local Profiler = require(script.Parent:WaitForChild("ReactWorkTags")).Profiler
local unstable_now = require(script.Parent.Parent:WaitForChild("scheduler")).unstable_now
local u39 = 0
local u40 = -1
local u41 = -1
local u42 = -1
function getCommitTime() -- Line: 41 -- upvalues: u39 (ref)
    return u39
end
function recordCommitTime() -- Line: 45 -- upvalues: enableProfilerTimer (val), u39 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    u39 = unstable_now()
end
function startProfilerTimer(p1) -- Line: 52 -- upvalues: enableProfilerTimer (val), u41 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    u41 = unstable_now()
    if p1.actualStartTime ~= nil and p1.actualStartTime < 0 then
        p1.actualStartTime = unstable_now()
    end
end
function stopProfilerTimerIfRunning(p1) -- Line: 65 -- upvalues: enableProfilerTimer (val), u41 (ref)
    if not enableProfilerTimer then
        return
    end
    u41 = -1
end
function stopProfilerTimerIfRunningAndRecordDelta(p1, p2) -- Line: 72 -- upvalues: enableProfilerTimer (val), u41 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    if 0 <= u41 then
        local v1 = unstable_now() - u41
        p1.actualDuration = p1.actualDuration + v1
        if p2 then
            p1.selfBaseDuration = v1
        end
        u41 = -1
    end
end
function recordLayoutEffectDuration(p1) -- Line: 90 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u40 (ref), unstable_now (val), Profiler (val)
    local stateNode
    if not enableProfilerTimer or not enableProfilerCommitHooks or 0 > u40 then
        return
    end
    u40 = -1
    local return_ = p1.return_
    while return_ ~= nil do
        if return_.tag == Profiler then
            stateNode = return_.stateNode
            stateNode.effectDuration = stateNode.effectDuration + (unstable_now() - u40)
            return
        end
        return_ = return_.return_
    end
end
function recordPassiveEffectDuration(p1) -- Line: 113 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u42 (ref), unstable_now (val), Profiler (val)
    local stateNode
    if not enableProfilerTimer or not enableProfilerCommitHooks or 0 > u42 then
        return
    end
    u42 = -1
    local return_ = p1.return_
    while return_ ~= nil do
        if return_.tag == Profiler then
            stateNode = return_.stateNode
            if stateNode == nil then
                break
            end
            stateNode.passiveEffectDuration = stateNode.passiveEffectDuration + (unstable_now() - u42)
            return
        end
        return_ = return_.return_
    end
end
function startLayoutEffectTimer() -- Line: 141 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u40 (ref), unstable_now (val)
    if not enableProfilerTimer or not enableProfilerCommitHooks then
        return
    end
    u40 = unstable_now()
end
function startPassiveEffectTimer() -- Line: 148 -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u42 (ref), unstable_now (val)
    if not enableProfilerTimer or not enableProfilerCommitHooks then
        return
    end
    u42 = unstable_now()
end
function transferActualDuration(p1) -- Line: 155
    local child = p1.child
    while child do
        p1.actualDuration = p1.actualDuration + child.actualDuration
        child = child.sibling
    end
end
return {
    getCommitTime = getCommitTime,
    recordCommitTime = recordCommitTime,
    recordLayoutEffectDuration = recordLayoutEffectDuration,
    recordPassiveEffectDuration = recordPassiveEffectDuration,
    startLayoutEffectTimer = startLayoutEffectTimer,
    startPassiveEffectTimer = startPassiveEffectTimer,
    startProfilerTimer = startProfilerTimer,
    stopProfilerTimerIfRunning = stopProfilerTimerIfRunning,
    stopProfilerTimerIfRunningAndRecordDelta = stopProfilerTimerIfRunningAndRecordDelta,
    transferActualDuration = transferActualDuration,
}