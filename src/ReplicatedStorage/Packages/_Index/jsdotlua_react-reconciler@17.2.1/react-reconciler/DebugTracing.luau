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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.DebugTracing
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  19 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = {}
local log = nil
require(script.Parent:WaitForChild("ReactFiberLane"))
local enableDebugTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableDebugTracing
local u31 = nil
local u32 = {}
local u33 = 0
function decimalToBinaryString(p1) -- Line: 39
    local v1, v2
    local v3 = ""
    local v4 = p1
    while true do
        v1, v2 = math.modf(v4 / 2)
        v4 = v1
        v3 = math.ceil(v2) .. v3
        if v4 == 0 then
            break
        end
    end
    return string.rep("0", 31 - string.len(v3)) .. v3
end
local function formatLanes(p1) -- Line: 52
    return "0b" .. decimalToBinaryString(p1)
end
local function group(...) -- Line: 58 -- upvalues: u32 (val), u31 (ref), console (val), log (ref)
    local v1 = {...}
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        table.insert(u32, j)
    end
    if u31 == nil then
        u31 = console.log
        console.log = log
    end
end
local function groupEnd() -- Line: 68 -- upvalues: u32 (val), u33 (ref), console (val), u31 (ref)
    table.remove(u32, 1)
    while #u32 < u33 do
        console.groupEnd()
        u33 = u33 - 1
    end
    if #u32 == 0 then
        console.log = u31
        u31 = nil
    end
end
function log(...) -- Line: 80 -- upvalues: u33 (ref), u32 (val), console (val), u31 (ref)
    if u33 < #u32 then
        local v1 = u33 + 1
        local v2 = #u32
        local v3 = 1
        for i = v1, v2, v3 do
            console.group(u32[i])
        end
        u33 = #u32
    end
    if typeof(u31) == "function" then
        u31(...)
        return
    end
    console.log(...)
end
function v1.logCommitStarted(p1) -- Line: 98 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        local v1 = string.format("* commit (%s)", "0b" .. decimalToBinaryString(p1))
        group(v1, "", "", "")
    end
end
function v1.logCommitStopped() -- Line: 113 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end
function v1.logComponentSuspended(p1, p2) -- Line: 141 -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s suspended", p1))
        p2:andThen(function() -- Line: 155 -- upvalues: log (upval), p1 (val)
            log(string.format("* %s resolved", p1))
        end, function() -- Line: 164 -- upvalues: log (upval), p1 (val)
            log(string.format("* %s rejected", p1))
        end)
    end
end
function v1.logLayoutEffectsStarted(p1) -- Line: 179 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p1)))
    end
end
function v1.logLayoutEffectsStopped() -- Line: 194 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end
function v1.logPassiveEffectsStarted(p1) -- Line: 203 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p1)))
    end
end
function v1.logPassiveEffectsStopped() -- Line: 218 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end
function v1.logRenderStarted(p1) -- Line: 227 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* render (%s)", "0b" .. decimalToBinaryString(p1)))
    end
end
function v1.logRenderStopped() -- Line: 242 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end
function v1.logForceUpdateScheduled(p1, p2) -- Line: 251 -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s forced update (%s)", p1, "0b" .. decimalToBinaryString(p2)))
    end
end
function v1.logStateUpdateScheduled(p1, p2, p3) -- Line: 266 -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s updated state (%s)", p1, "0b" .. decimalToBinaryString(p2)))
    end
end
return v1