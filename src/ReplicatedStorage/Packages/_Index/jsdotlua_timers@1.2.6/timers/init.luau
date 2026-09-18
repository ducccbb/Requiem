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
--         File: ReplicatedStorage.Packages._Index.jsdotlua_timers@1.2.6.timers
--                              Dumped in 0.000118 seconds
--                          Bytecode version 9  |  1 functions

local makeTimerImpl = require(script:WaitForChild("makeTimerImpl"))
local makeIntervalImpl = require(script:WaitForChild("makeIntervalImpl"))
local v1 = makeTimerImpl(task.delay)
return require(script.Parent:WaitForChild("collections")).Object.assign({}, v1, makeIntervalImpl(task.delay))