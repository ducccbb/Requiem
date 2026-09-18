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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactComponentStackFrame
--                               Dumped in 0.00174 seconds
--                          Bytecode version 9  |  12 functions

local describeUnknownElementTypeFrameInDEV
require(script.Parent:WaitForChild("ReactElementType"))
require(script.Parent:WaitForChild("flowtypes.roblox"))
local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local v1 = require(script.Parent:WaitForChild("ConsolePatchingDev.roblox"))
local disableLogs = v1.disableLogs
local reenableLogs = v1.reenableLogs
local ReactCurrentDispatcher = require(script.Parent:WaitForChild("ReactSharedInternals")).ReactCurrentDispatcher
local describeComponentFrame = nil
local function describeOwner(p1) -- Line: 57
    if type(p1) == "function" then
        return debug.info(p1, "n")
    end
    if type(p1) == "table" then
        return (tostring(p1))
    end
    return nil
end
local function describeBuiltInComponentFrame(p1, p2, p3) -- Line: 66 -- upvalues: describeComponentFrame (ref)
    local v1 = nil
    if _G.__DEV__ and p3 then
        if type(p3) == "function" then
            v1 = debug.info(p3, "n")
        elseif type(p3) ~= "table" then
            v1 = nil
        else
            v1 = tostring(p3)
        end
    end
    return describeComponentFrame(p1, p2, v1)
end
local u53 = false
local u61 = if _G.__DEV__ then setmetatable({}, {__mode = "k"}) else nil
function describeComponentFrame(p1, p2, p3) -- Line: 283
    local v1 = ""
    if not _G.__DEV__ then
        if p3 then
            v1 = " (created by " .. p3 .. ")"
        end
    elseif p2 then
        local fileName = p2.fileName
        local v2 = string.gsub(fileName, "^(.*)[\\/]", "")
        if string.match(v2, "^init%.") then
            local v3 = string.match(fileName, "^(.*)[\\/]")
            if v3 and #v3 ~= 0 then
                v2 = string.gsub(v3, "^(.*)[\\/]", "") .. "/" .. v2
            end
        end
        v1 = " (at " .. v2 .. ":" .. p2.lineNumber .. ")"
    elseif p3 then
        v1 = " (created by " .. p3 .. ")"
    end
    return "\n    in " .. (p1 or "Unknown") .. v1
end
local function describeClassComponentFrame(p1, p2, p3) -- Line: 316 -- upvalues: describeComponentFrame (ref)
    local v1 = tostring(p1)
    local v2 = nil
    if _G.__DEV__ and p3 then
        if type(p3) == "function" then
            v2 = debug.info(p3, "n")
        elseif type(p3) ~= "table" then
            v2 = nil
        else
            v2 = tostring(p3)
        end
    end
    return describeComponentFrame(v1, p2, v2)
end
local function describeFunctionComponentFrame(p1, p2, p3) -- Line: 340 -- upvalues: describeComponentFrame (ref)
    local v1
    if not p1 then
        return ""
    end
    if type(p1) ~= "function" then
        v1 = tostring(p1)
    else
        v1 = debug.info(p1, "n")
    end
    local v2 = nil
    if _G.__DEV__ and p3 then
        if type(p3) == "function" then
            v2 = debug.info(p3, "n")
        elseif type(p3) ~= "table" then
            v2 = nil
        else
            v2 = tostring(p3)
        end
    end
    return describeComponentFrame(v1, p2, v2)
end
function describeUnknownElementTypeFrameInDEV(p1, p2, p3) -- Line: 387 -- upvalues: describeClassComponentFrame (val), describeFunctionComponentFrame (ref), describeBuiltInComponentFrame (val), REACT_SUSPENSE_TYPE (val), REACT_SUSPENSE_LIST_TYPE (val), REACT_FORWARD_REF_TYPE (val), REACT_MEMO_TYPE (val), describeUnknownElementTypeFrameInDEV (val), REACT_BLOCK_TYPE (val), REACT_LAZY_TYPE (val)
    if not _G.__DEV__ or p1 == nil then
        return ""
    end
    if type(p1) ~= "table" then
        local v1, v2
        if type(p1) == "function" then
            return describeFunctionComponentFrame(p1, p2, p3)
        end
        if type(p1) == "string" then
            return describeBuiltInComponentFrame(p1, p2, p3)
        end
        if p1 == REACT_SUSPENSE_TYPE then
            return describeBuiltInComponentFrame("Suspense", p2, p3)
        end
        if p1 == REACT_SUSPENSE_LIST_TYPE then
            return describeBuiltInComponentFrame("SuspenseList", p2, p3)
        end
        if type(p1) ~= "table" then
            return ""
        end
        local v3 = p1["$$typeof"]
        if v3 == REACT_FORWARD_REF_TYPE then
            return describeFunctionComponentFrame(p1.render, p2, p3)
        end
        if v3 == REACT_MEMO_TYPE then
            return describeUnknownElementTypeFrameInDEV(p1.type, p2, p3)
        end
        if v3 == REACT_BLOCK_TYPE then
            return describeFunctionComponentFrame(p1._render, p2, p3)
        end
        if v3 ~= REACT_LAZY_TYPE then
            return ""
        end
        local _payload = p1._payload
        local _init = p1._init
        v1, v2 = pcall(function() -- Line: 446 -- upvalues: describeUnknownElementTypeFrameInDEV (upval), _init (val), _payload (val), p2 (val), p3 (val)
            local v1 = _init(_payload)
            describeUnknownElementTypeFrameInDEV(v1, p2, p3)
        end)
        if v1 then
            return v2
        end
        return ""
    elseif type(p1.__ctor) == "function" then
        return describeClassComponentFrame(p1, p2, p3)
    end
end
return {
    describeComponentFrame = describeComponentFrame,
    describeBuiltInComponentFrame = describeBuiltInComponentFrame,
    describeNativeComponentFrame = function(p1, p2) -- Line: 113 -- upvalues: u53 (ref), u61 (ref), ReactCurrentDispatcher (val), disableLogs (val), reenableLogs (val), describeComponentFrame (ref)
        if not p1 then
            return ""
        else
            if u53 then
                return ""
            end
            if not _G.__DEV__ then
                local u146, v1, v2, v3
                local u7 = nil
                u53 = true
                local current = nil
                if _G.__DEV__ then
                    current = ReactCurrentDispatcher.current
                    ReactCurrentDispatcher.current = nil
                    disableLogs()
                end
                local u18 = nil
                _, v1 = xpcall(function() -- Line: 153 -- upvalues: p2 (val), u18 (ref), u7 (ref), p1 (val)
                    local v1
                    if p2 then
                        return
                    end
                    _, v1 = pcall(function() -- Line: 159 -- upvalues: u18 (upval)
                        u18 = debug.traceback()
                        error({stack = u18})
                    end)
                    u7 = v1
                    p1()
                end, function(p1) -- Line: 169 -- upvalues: u18 (ref)
                    return {message = p1, stack = u18}
                end)
                local v4 = nil
                if v1 and u7 and type(v1.stack) == "string" then
                    local v5
                    v2 = string.split(v1.stack, "\n")
                    v3 = string.split(u7.stack, "\n")
                    local v6 = #v2 - 1
                    local v7 = #v3 - 1
                    while 2 <= v6 do
                        if 0 > v7 or v2[v6] == v3[v7] then
                            break
                        end
                        v7 = v7 - 1
                    end
                    while 3 <= v6 do
                        if 1 > v7 then
                            break
                        end
                        v6 = v6 - 1
                        v7 = v7 - 1
                        if v2[v6] ~= v3[v7] then
                            if v6 ~= 1 then
                                u146 = p1
                            else
                                if v7 == 1 then
                                    break
                                end
                                u146 = p1
                            end
                            while true do
                                v6 = v6 - 1
                                v7 = v7 - 1
                                if v7 < 0 then
                                    v5 = "\n" .. "    in " .. v2[v6]
                                    if _G.__DEV__ then
                                        u61[u146] = v5
                                    end
                                    v4 = v5
                                elseif v2[v6] == v3[v7] then
                                end
                                if 3 > v6 or 1 > v7 then
                                    break
                                end
                            end
                            break
                        end
                    end
                end
                u53 = false
                if _G.__DEV__ then
                    ReactCurrentDispatcher.current = current
                    reenableLogs()
                end
                if v4 ~= nil then
                    return v4
                end
                if type(u146) == "function" then
                    v2 = debug.info(u146, "n")
                elseif type(u146) ~= "table" then
                    v2 = ""
                else
                    v2 = tostring(u146)
                end
                v3 = if v2 ~= nil and v2 ~= "" then describeComponentFrame(v2, nil, nil) else ""
                if _G.__DEV__ then
                    u61[u146] = v3
                end
                return v3
            else
                local v8 = u61[p1]
                if v8 ~= nil then
                    return v8
                end
            end
        end
    end,
    describeClassComponentFrame = describeClassComponentFrame,
    describeFunctionComponentFrame = describeFunctionComponentFrame,
    describeUnknownElementTypeFrameInDEV = describeUnknownElementTypeFrameInDEV,
}