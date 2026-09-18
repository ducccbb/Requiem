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
--File: ReplicatedStorage.Client.User.Character.Actions.Types.ClientBuildingSchematicAction
--                              Dumped in 0.000463 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Hammer = require(Tools:WaitForChild("Hammer"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local Equipment = v1.Parent.Parent.Parent.Parent:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics_2 = Common_4:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
return {
    execute = function(p1) -- Line: 24 -- upvalues: useWalkSpeed (val), useJumpPower (val), ClientGearHandler (val), ClientStateHandler (val), useAnimatorObserver (val), Hammer (val)
        local v1, v2
        _, v1 = useWalkSpeed()
        _, v2 = useJumpPower()
        local u12 = v1("building", 0, "set", 20)
        local u18 = v2("building", 0, "set", 500)
        local v3 = ClientGearHandler.getGearState()
        if v3 then
            v3.addTimeout(1)
            v3.signals.ungrapple:Fire("Left")
            v3.signals.ungrapple:Fire("Right")
        end
        ClientStateHandler.updateState(ClientStateHandler.States.BUILDING, true)
        p1:Add(function() -- Line: 40 -- upvalues: ClientStateHandler (upval), useAnimatorObserver (upval), Hammer (upval), u12 (val), u18 (val)
            ClientStateHandler.updateState(ClientStateHandler.States.BUILDING, false)
            useAnimatorObserver.stop(Hammer.HammerHitSlow, 0.1)
            u12()
            u18()
        end)
    end,
}