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
--   File: ReplicatedStorage.Client.User.Character.Actions.Types.ClientBandagingAction
--                              Dumped in 0.000405 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local Equipment = v1.Parent.Parent.Parent.Parent:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics_2 = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local v3 = {}
function v3.execute(p1) -- Line: 26 -- upvalues: useWalkSpeed (val), useJumpPower (val), ClientGearHandler (val), ClientStateHandler (val)
    local v1, v2
    _, v1 = useWalkSpeed()
    _, v2 = useJumpPower()
    local u12 = v1("bandage", 0, "set", 500)
    local u18 = v2("bandage", 0, "set", 500)
    local v3 = ClientGearHandler.getGearState()
    if v3 then
        v3.addTimeout(1)
        v3.signals.ungrapple:Fire("Left")
        v3.signals.ungrapple:Fire("Right")
    end
    ClientStateHandler.updateState(ClientStateHandler.States.BANDAGING, true)
    p1:Add(function() -- Line: 51 -- upvalues: ClientStateHandler (upval), u12 (val), u18 (val)
        ClientStateHandler.updateState(ClientStateHandler.States.BANDAGING, false)
        u12()
        u18()
    end)
end
return v3