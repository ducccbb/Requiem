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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.getComponentName
--                              Dumped in 0.000840 seconds
--                          Bytecode version 9  |  4 functions

local getComponentName
local console = require(script.Parent:WaitForChild("console"))
local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
require(script.Parent:WaitForChild("ReactTypes"))
local describeError = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
local function getWrappedName(p1, p2, p3) -- Line: 40
    local v1 = "<function>"
    if typeof(p2) == "table" then
        local displayName = p2.displayName
        if not displayName then
            displayName = p2.name
            if not displayName then
                displayName = ""
            end
        end
        v1 = displayName
    end
    local displayName_2 = p1.displayName
    if not displayName_2 then
        if v1 == "" then
            displayName_2 = p3
        else
            displayName_2 = string.format("%s(%s)", p3, v1)
            if not displayName_2 then
                displayName_2 = p3
            end
        end
    end
    return displayName_2
end
local function getContextName(p1) -- Line: 53
    return p1.displayName or "Context"
end
function getComponentName(p1) -- Line: 57 -- upvalues: console (val), REACT_FRAGMENT_TYPE (val), REACT_PORTAL_TYPE (val), REACT_PROFILER_TYPE (val), REACT_STRICT_MODE_TYPE (val), REACT_SUSPENSE_TYPE (val), REACT_SUSPENSE_LIST_TYPE (val), REACT_CONTEXT_TYPE (val), REACT_PROVIDER_TYPE (val), REACT_FORWARD_REF_TYPE (val), REACT_MEMO_TYPE (val), getComponentName (val), REACT_BLOCK_TYPE (val), REACT_LAZY_TYPE (val), describeError (val)
    local displayName, v1, v2, v3
    if p1 == nil then
        return nil
    end
    local v4 = typeof(p1)
    if _G.__DEV__ and v4 == "table" and typeof(p1.tag) == "number" then
        console.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
    end
    if v4 == "function" then
        v1 = debug.info(p1, "n")
        if not v1 then
            return nil
        end
        v2 = string.len(v1)
        if 0 < v2 then
            return v1
        end
        return nil
    end
    if v4 == "string" then
        return p1
    end
    if p1 == REACT_FRAGMENT_TYPE then
        return "Fragment"
    end
    if p1 == REACT_PORTAL_TYPE then
        return "Portal"
    end
    if p1 == REACT_PROFILER_TYPE then
        return "Profiler"
    end
    if p1 == REACT_STRICT_MODE_TYPE then
        return "StrictMode"
    end
    if p1 == REACT_SUSPENSE_TYPE then
        return "Suspense"
    end
    if p1 == REACT_SUSPENSE_LIST_TYPE then
        return "SuspenseList"
    end
    if v4 ~= "table" then
        return nil
    end
    v1 = p1["$$typeof"]
    if v1 == REACT_CONTEXT_TYPE then
        return (p1.displayName or "Context") .. ".Consumer"
    end
    if v1 == REACT_PROVIDER_TYPE then
        return (p1._context.displayName or "Context") .. ".Provider"
    end
    if v1 == REACT_FORWARD_REF_TYPE then
        local render = p1.render
        v3 = "<function>"
        if typeof(render) == "table" then
            displayName = render.displayName
            if not displayName then
                displayName = render.name
                if not displayName then
                    displayName = ""
                end
            end
            v3 = displayName
        end
        local displayName_2 = p1.displayName
        if not displayName_2 then
            if v3 == "" then
                displayName_2 = "ForwardRef"
            else
                displayName_2 = string.format("%s(%s)", "ForwardRef", v3)
                if not displayName_2 then
                    displayName_2 = "ForwardRef"
                end
            end
        end
        return displayName_2
    end
    if v1 == REACT_MEMO_TYPE then
        return getComponentName(p1.type)
    end
    if v1 == REACT_BLOCK_TYPE then
        return getComponentName(p1._render)
    end
    if v1 == REACT_LAZY_TYPE then
        local v5
        v3, v5 = xpcall(p1._init, describeError, p1._payload)
        if v3 then
            return getComponentName(v5)
        end
        return nil
    end
    if p1.displayName then
        return p1.displayName
    end
    if p1.name then
        return p1.name
    end
    v2 = getmetatable(p1)
    if not v2 then
        return nil
    end
    if rawget(v2, "__tostring") then
        return (tostring(p1))
    end
    return nil
end
return getComponentName