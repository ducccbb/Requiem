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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberDevToolsHook.new
--                              Dumped in 0.000906 seconds
--                          Bytecode version 9  |  9 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v1 = {}
local function isCallable(p1) -- Line: 27
    if typeof(p1) == "function" then
        return true
    end
    if typeof(p1) ~= "table" then
        return false
    end
    local v1 = getmetatable(p1)
    if not v1 then
        if p1._isMockFunction then
            return true
        end
        return false
    end
    if rawget(v1, "__call") or p1._isMockFunction then
        return true
    end
    return false
end
local enableProfilerTimer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local DidCapture = require(script.Parent:WaitForChild("ReactFiberFlags")).DidCapture
local u58 = nil
local u59 = nil
local u60 = false
function v1.isDevToolsPresent() -- Line: 63
    local v1 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
    return v1
end
function v1.injectInternals(p1) -- Line: 67 -- upvalues: console (val), u58 (ref), u59 (ref)
    local __REACT_DEVTOOLS_GLOBAL_HOOK__, v1, v2
    if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false
    end
    __REACT_DEVTOOLS_GLOBAL_HOOK__ = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__
    if __REACT_DEVTOOLS_GLOBAL_HOOK__.isDisabled then
        return true
    end
    if not __REACT_DEVTOOLS_GLOBAL_HOOK__.supportsFiber then
        if _G.__DEV__ then
            console.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools")
        end
        return true
    end
    v1, v2 = pcall(function() -- Line: 90 -- upvalues: u58 (upval), __REACT_DEVTOOLS_GLOBAL_HOOK__ (val), p1 (val), u59 (upval)
        u58 = __REACT_DEVTOOLS_GLOBAL_HOOK__.inject(p1)
        u59 = __REACT_DEVTOOLS_GLOBAL_HOOK__
    end)
    if not v1 and _G.__DEV__ then
        console.error("React instrumentation encountered an error: %s.", v2)
    end
    return true
end
function v1.onScheduleRoot(p1, p2) -- Line: 106 -- upvalues: u59 (ref), u58 (ref), u60 (ref), console (val)
    if _G.__DEV__ and u59 then
        local v1
        local onScheduleFiberRoot = u59.onScheduleFiberRoot
        if typeof(onScheduleFiberRoot) == "function" then
            v1 = true
        elseif typeof(onScheduleFiberRoot) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onScheduleFiberRoot)
            if not v2 then
                if onScheduleFiberRoot._isMockFunction then
                    v1 = true
                end
            elseif rawget(v2, "__call") then
                v1 = true
            end
        end
        if v1 then
            local v3
            v1, v3 = pcall(u59.onScheduleFiberRoot, u58, p1, p2)
            if not v1 and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", v3)
            end
        end
    end
end
function v1.onCommitRoot(p1, p2) -- Line: 126 -- upvalues: u59 (ref), DidCapture (val), enableProfilerTimer (val), u58 (ref), u60 (ref), console (val)
    if u59 then
        local v1
        local onCommitFiberRoot = u59.onCommitFiberRoot
        if typeof(onCommitFiberRoot) == "function" then
            v1 = true
        elseif typeof(onCommitFiberRoot) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onCommitFiberRoot)
            if not v2 then
                if onCommitFiberRoot._isMockFunction then
                    v1 = true
                end
            elseif rawget(v2, "__call") then
                v1 = true
            end
        end
        if v1 then
            local v3
            v1, v3 = pcall(function() -- Line: 132 -- upvalues: p1 (val), DidCapture (upval), enableProfilerTimer (upval), u59 (upval), u58 (upval), p2 (val)
                local v1 = bit32.band(p1.current.flags, DidCapture)
                local v2 = v1 == DidCapture
                if enableProfilerTimer then
                    u59.onCommitFiberRoot(u58, p1, p2, v2)
                    return
                end
                u59.onCommitFiberRoot(u58, p1, nil, v2)
            end)
            if not v1 and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", v3)
            end
        end
    end
end
function v1.onCommitUnmount(p1) -- Line: 151 -- upvalues: u59 (ref), u58 (ref), u60 (ref), console (val)
    if u59 then
        local v1
        local onCommitFiberUnmount = u59.onCommitFiberUnmount
        if typeof(onCommitFiberUnmount) == "function" then
            v1 = true
        elseif typeof(onCommitFiberUnmount) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onCommitFiberUnmount)
            if not v2 then
                if onCommitFiberUnmount._isMockFunction then
                    v1 = true
                end
            elseif rawget(v2, "__call") then
                v1 = true
            end
        end
        if v1 then
            local v3
            v1, v3 = pcall(u59.onCommitFiberUnmount, u58, p1)
            if not v1 and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", v3)
            end
        end
    end
end
return v1