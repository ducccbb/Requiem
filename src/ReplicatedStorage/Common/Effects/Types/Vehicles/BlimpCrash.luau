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
--           File: ReplicatedStorage.Common.Effects.Types.Vehicles.BlimpCrash
--                              Dumped in 0.000195 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local World = Client:WaitForChild("World")
local Vehicles = World:WaitForChild("Vehicles")
local Blimps = Vehicles:WaitForChild("Blimps")
local WorldVehicleBlimpCrashClient = require(Blimps:WaitForChild("WorldVehicleBlimpCrashClient"))
return function(p1) -- Line: 14 -- upvalues: WorldVehicleBlimpCrashClient (val)
    if typeof(p1) ~= "Instance" or not (p1:IsA("Model")) then
        return
    end
    WorldVehicleBlimpCrashClient.syncBlimpCrash(p1)
end