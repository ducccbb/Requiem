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
--File: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.6.luau-polyfill.Error.Error.global
--                              Dumped in 0.000607 seconds
--                          Bytecode version 9  |  9 functions

local v1
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local u10 = {}
u10.__index = u10
function u10.__tostring(p1) -- Line: 12 -- upvalues: u10 (val)
    return getmetatable(u10).__tostring(p1)
end
local function __createError(p1) -- Line: 18 -- upvalues: u10 (val)
    local v1 = setmetatable({name = "Error", message = p1 or ""}, u10)
    u10.__captureStackTrace(v1, 4)
    return v1
end
function u10.new(p1) -- Line: 27 -- upvalues: u10 (val)
    local v1 = setmetatable({name = "Error", message = p1 or ""}, u10)
    u10.__captureStackTrace(v1, 4)
    return v1
end
function u10.captureStackTrace(p1, p2) -- Line: 31 -- upvalues: u10 (val)
    u10.__captureStackTrace(p1, 3, p2)
end
function u10.__captureStackTrace(p1, p2, p3) -- Line: 35 -- upvalues: u10 (val)
    if typeof(p3) ~= "function" then
        p1.__stack = debug.traceback(nil, p2)
    else
        local v1 = debug.traceback(nil, p2)
        local v2 = debug.info(p3, "n")
        local v3 = debug.info(p3, "s")
        local v4 = string.gsub(v3, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v2
        local v5 = string.find(v1, v4)
        local v6 = nil
        if v5 ~= nil then
            local v7, v8
            v7, v8 = string.find(v1, "\n", v5 + 1)
            v6 = v8
        end
        if v6 ~= nil then
            v1 = string.sub(v1, v6 + 1)
        end
        p1.__stack = v1
    end
    u10.__recalculateStacktrace(p1)
end
function u10.__recalculateStacktrace(p1) -- Line: 59
    local __stack, v1
    local message = p1.message
    local v2 = p1.name or "Error"
    if message == nil then
        v1 = ""
    elseif message == "" then
        v1 = ""
    else
        v1 = ": " .. message
    end
    if not p1.__stack then
        __stack = ""
    else
        __stack = p1.__stack
    end
    p1.stack = (v2 .. v1) .. "\n" .. __stack
end
v1 = {
    __call = function(p1, ...) -- Line: 71 -- upvalues: u10 (val)
        local v1 = setmetatable({name = "Error", message = (...) or ""}, u10)
        u10.__captureStackTrace(v1, 4)
        return v1
    end,
    __tostring = function(p1) -- Line: 74
        if p1.name == nil then
            return (tostring("Error"))
        end
        if not p1.message or p1.message == "" then
            return (tostring(p1.name))
        end
        local v1 = tostring(p1.name)
        return string.format("%s: %s", v1, (tostring(p1.message)))
    end,
}
return (setmetatable(u10, v1))