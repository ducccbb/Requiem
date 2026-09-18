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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.consoleWithStackDev
--                              Dumped in 0.000321 seconds
--                          Bytecode version 9  |  4 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local console = v1.console
local Array = v1.Array
local ReactSharedInternals = require(script.Parent:WaitForChild("ReactSharedInternals"))
local printWarning = nil
local v2 = {
    warn = function(p1, ...) -- Line: 24 -- upvalues: printWarning (ref)
        if _G.__DEV__ then
            printWarning("warn", p1, {...})
        end
    end,
    error = function(p1, ...) -- Line: 29 -- upvalues: printWarning (ref)
        if _G.__DEV__ then
            printWarning("error", p1, {...})
        end
    end,
}
function printWarning(p1, p2, p3) -- Line: 35 -- upvalues: ReactSharedInternals (val), Array (val), console (val)
    if _G.__DEV__ then
        local v1, v2
        local v3 = ReactSharedInternals.ReactDebugCurrentFrame.getStackAddendum()
        if v3 == "" then
            v2, v1 = p3, p2
        else
            v1 = p2 .. "%s"
            v2 = Array.slice(p3, 1)
            table.insert(v2, v3)
        end
        local v4 = Array.map(v2, tostring)
        table.insert(v4, 1, "Warning: " .. v1)
        console[p1](unpack(v4))
    end
end
return v2