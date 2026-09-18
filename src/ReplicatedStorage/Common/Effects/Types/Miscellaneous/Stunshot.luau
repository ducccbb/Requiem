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
--          File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.Stunshot
--                              Dumped in 0.000380 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_2:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_3:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
return function() -- Line: 14 -- upvalues: ClientStatusHandler (val), ClientGearHandler (val), ClientStateHandler (val), States (val)
    ClientStatusHandler.addPlayerStatus("Concussed", 1.5)
    local v1 = ClientGearHandler.getGearState()
    if v1 then
        v1.signals.ungrapple:Fire("Left")
        v1.signals.ungrapple:Fire("Right")
    end
    ClientStateHandler.updateState(States.STUNNED, true)
    task.delay(1.5, function() -- Line: 25 -- upvalues: ClientStateHandler (upval), States (upval)
        ClientStateHandler.updateState(States.STUNNED, false)
    end)
end