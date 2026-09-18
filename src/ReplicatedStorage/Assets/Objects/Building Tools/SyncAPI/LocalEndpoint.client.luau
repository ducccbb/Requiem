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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.SyncAPI.LocalEndpoint
--                              Dumped in 0.000176 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent
local ServerEndpoint = Parent:WaitForChild("ServerEndpoint")
local RunService = game:GetService("RunService")
function Parent.OnInvoke(...) -- Line: 14 -- upvalues: RunService (val), ServerEndpoint (val), Parent (val)
    if not (RunService:IsServer()) then
        return ServerEndpoint:InvokeServer(...)
    end
    SyncModule = require(Parent:WaitForChild("SyncModule"))
    return SyncModule.PerformAction(game.Players.LocalPlayer, ...)
end