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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ErrorHandling.roblox
--                              Dumped in 0.000333 seconds
--                          Bytecode version 9  |  4 functions

local u8 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = u8.Error
local inspect = u8.util.inspect
return {
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n",
    describeError = function(p1) -- Line: 33 -- upvalues: u8 (val)
        local v1, v2
        if typeof(p1) ~= "string" then
            return p1
        end
        _, v1 = string.find(p1, ":[%d]+: ")
        if not v1 then
            v2 = p1
        else
            v2 = string.sub(p1, v1 + 1)
        end
        local v3 = u8.Error.new(v2)
        v3.stack = debug.traceback(nil, 2)
        return v3
    end,
    errorToString = function(p1) -- Line: 53 -- upvalues: inspect (val)
        if typeof(p1) ~= "table" or not p1.message then
            return (inspect(p1))
        end
        if p1.stack then
            return "\n------ Error caught by React ------\n" .. p1.message .. "\n------ Error caught by React ------\n" .. tostring(p1.stack)
        end
        return (inspect(p1))
    end,
    parseReactError = function(p1) -- Line: 79 -- upvalues: Error (val)
        local v1, v2, v3
        local v4 = string.split(p1, "\n------ Error caught by React ------\n")
        if #v4 ~= 3 then
            v1 = Error.new(p1)
            v1.stack = nil
            return v1, ""
        end
        v1, v2, v3 = table.unpack(v4)
        local v5 = Error.new(v2)
        v5.stack = v3
        return v5, v1
    end,
}