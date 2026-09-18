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
--File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.forks.SchedulerHostConfig.default
--                              Dumped in 0.000779 seconds
--                          Bytecode version 9  |  15 functions

local performWorkUntilDeadline
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local shared = require(script.Parent.Parent.Parent:WaitForChild("shared"))
local console = shared.console
local errorToString = shared.errorToString
local describeError = shared.describeError
local setTimeout = v1.setTimeout
local clearTimeout = v1.clearTimeout
local u27 = false
local u28 = nil
local None = Object.None
local u30 = 15
local u31 = 0
function performWorkUntilDeadline() -- Line: 69 -- upvalues: u28 (ref), u31 (ref), u30 (ref), u27 (ref), performWorkUntilDeadline (ref), describeError (val), errorToString (val)
    local v1, v2
    if u28 == nil then
        u27 = false
        return
    end
    local u3 = os.clock() * 1000
    u31 = u3 + u30
    if _G.__YOLO__ then
        if u28(true, u3) then
            task.delay(0, performWorkUntilDeadline)
        else
            u27 = false
            u28 = nil
        end
        v2 = nil
        v1 = true
    else
        local v3, v4
        v3, v4 = xpcall(function() -- Line: 79 -- upvalues: u28 (upval), u3 (val), u27 (upval), performWorkUntilDeadline (upval)
            if u28(true, u3) then
                task.delay(0, performWorkUntilDeadline)
            else
                u27 = false
                u28 = nil
            end
            return nil
        end, describeError)
        v1 = v3
        v2 = v4
    end
    if v1 then
        return
    end
    task.delay(0, performWorkUntilDeadline)
    error(errorToString(v2))
end
local function wrapPerformWorkWithCoroutine(p1) -- Line: 124
    local u3 = coroutine.create(function() -- Line: 125 -- upvalues: p1 (val)
        local v1, v2, v3
        while true do
            v1 = coroutine.wrap(p1)
            v2, v3 = pcall(v1)
            coroutine.yield(v2, v3)
        end
    end)
    return function() -- Line: 135 -- upvalues: u3 (val)
        local v1, v2
        _, v1, v2 = coroutine.resume(u3)
        if not v1 then
            error(v2)
        end
    end
end
local u37 = performWorkUntilDeadline
local u40 = coroutine.create(function() -- Line: 125 -- upvalues: u37 (val)
    local v1, v2, v3
    while true do
        v1 = coroutine.wrap(u37)
        v2, v3 = pcall(v1)
        coroutine.yield(v2, v3)
    end
end)
function performWorkUntilDeadline() -- Line: 135 -- upvalues: u40 (val)
    local v1, v2
    _, v1, v2 = coroutine.resume(u40)
    if not v1 then
        error(v2)
    end
end
return {
    requestHostCallback = function(p1) -- Line: 145 -- upvalues: u28 (ref), u27 (ref), performWorkUntilDeadline (ref)
        u28 = p1
        if not u27 then
            u27 = true
            task.delay(0, performWorkUntilDeadline)
        end
    end,
    cancelHostCallback = function() -- Line: 154 -- upvalues: u28 (ref)
        u28 = nil
    end,
    requestHostTimeout = function(p1, p2) -- Line: 158 -- upvalues: None (ref), setTimeout (val)
        None = setTimeout(function() -- Line: 159 -- upvalues: p1 (val)
            p1(os.clock() * 1000)
        end, p2)
    end,
    cancelHostTimeout = function() -- Line: 164 -- upvalues: clearTimeout (val), None (ref), Object (val)
        clearTimeout(None)
        None = Object.None
    end,
    shouldYieldToHost = function() -- Line: 46 -- upvalues: u31 (ref)
        local v1 = os.clock() * 1000
        local v2 = u31 <= v1
        return v2
    end,
    requestPaint = function() end,
    getCurrentTime = function() -- Line: 19
        return os.clock() * 1000
    end,
    forceFrameRate = function(p1) -- Line: 53 -- upvalues: console (val), u30 (ref)
        if p1 < 0 or 125 < p1 then
            console.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported")
            return
        end
        if 0 < p1 then
            u30 = math.floor(1000 / p1)
            return
        end
        u30 = 5
    end,
}