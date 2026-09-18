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
--   File: ReplicatedStorage.Client.User.Character.Actions.Types.ClientGasRefillAction
--                              Dumped in 0.000541 seconds
--                          Bytecode version 9  |  4 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local Equipment = v1.Parent.Parent.Parent.Parent:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics_2 = Common_4:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
return {
    execute = function(p1) -- Line: 25 -- upvalues: useWalkSpeed (val), useJumpPower (val), ClientGearHandler (val), ClientStateHandler (val), useAnimatorObserver (val), Gear (val), ClientAttributesHandler (val)
        local v1, v2
        _, v1 = useWalkSpeed()
        _, v2 = useJumpPower()
        local u12 = v1("refill", 0, "set", 500)
        local u18 = v2("refill", 0, "set", 500)
        local v3 = ClientGearHandler.getGearState()
        if v3 then
            v3.addTimeout(1)
            v3.signals.ungrapple:Fire("Left")
            v3.signals.ungrapple:Fire("Right")
        end
        ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, true)
        local u49 = useAnimatorObserver.play(Gear.BladeRefill, 0.1)
        if u49 then
            u49:AdjustSpeed((ClientAttributesHandler.getAttribute("ResupplyMultiplier")))
            p1:Add(function() -- Line: 44 -- upvalues: u49 (val)
                u49:Stop(0.2)
            end)
        end
        p1:Add(function() -- Line: 49 -- upvalues: ClientStateHandler (upval), u12 (val), u18 (val)
            ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, false)
            u12()
            u18()
        end)
    end,
}