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
--File: ReplicatedStorage.Packages._Index.jsdotlua_console@1.2.6.console.makeConsoleImpl
--                              Dumped in 0.000469 seconds
--                          Bytecode version 9  |  11 functions

local inspect = require(script.Parent.Parent:WaitForChild("collections")).inspect
return function() -- Line: 6 -- upvalues: inspect (val)
    local v1 = {}
    local u1 = 0
    local function indent() -- Line: 10 -- upvalues: u1 (ref)
        return string.rep("  ", u1)
    end
    function v1.log(p1, ...) -- Line: 14 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        print(string.rep("  ", u1) .. v1)
    end
    function v1.debug(p1, ...) -- Line: 24 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        print(string.rep("  ", u1) .. v1)
    end
    function v1.info(p1, ...) -- Line: 34 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        print(string.rep("  ", u1) .. v1)
    end
    function v1.warn(p1, ...) -- Line: 44 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        warn(string.rep("  ", u1) .. v1)
    end
    function v1.error(p1, ...) -- Line: 54 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        warn(string.rep("  ", u1) .. v1)
    end
    function v1.group(p1, ...) -- Line: 66 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        print(string.rep("  ", u1) .. v1)
        u1 = u1 + 1
    end
    function v1.groupCollapsed(p1, ...) -- Line: 77 -- upvalues: inspect (upval), u1 (ref)
        local v1
        if typeof(p1) ~= "string" then
            v1 = inspect(p1)
        else
            v1 = string.format(p1, ...)
        end
        print(string.rep("  ", u1) .. v1)
        u1 = u1 + 1
    end
    function v1.groupEnd() -- Line: 89 -- upvalues: u1 (ref)
        if 0 < u1 then
            u1 = u1 - 1
        end
    end
    return v1
end