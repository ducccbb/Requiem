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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.console
--                              Dumped in 0.000194 seconds
--                          Bytecode version 9  |  1 functions

local console = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console
local consoleWithStackDev = require(script.Parent:WaitForChild("consoleWithStackDev"))
if not _G.__DEV__ then
    return console
end
local v1 = {warn = consoleWithStackDev.warn, error = consoleWithStackDev.error}
local v2 = {__index = console}
return (setmetatable(v1, v2))