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
--  File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Skills.Yank
--                              Dumped in 0.000517 seconds
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
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
return {
    activated = function() -- Line: 35 -- upvalues: ClientStateHandler (val), States (val), useAnimatorObserver (val), Gear (val)
        ClientStateHandler.updateState(States.GEAR_SWING, true)
        useAnimatorObserver.play(Gear.Yank, 0.1)
        task.wait(0.2)
        ClientStateHandler.updateState(States.GEAR_SWING, false)
    end,
    verify = function() -- Line: 50 -- upvalues: ClientGearHandler (val)
        local v1 = ClientGearHandler.getGearState()
        if not v1 then
            return false
        end
        local v2 = v1.getGrappleServerData()
        if not v2 then
            return false, 0
        elseif #v2.grappled_to.Left ~= 0 then
            local v3 = v2.grappled_to.Left[1]
            if not v3 then
                v3 = v2.grappled_to.Right[1]
            end
            if not v3 then
                return false, 0
            end
            local character = v3.character
            local HumanoidRootPart = character
            if HumanoidRootPart then
                HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            end
            if not HumanoidRootPart or HumanoidRootPart:HasTag("Titan") or HumanoidRootPart:HasTag("Shifter") then
                return false, 0
            end
            if not character then
                return true
            end
            if character:HasTag("Shifter") then
                return false, 0
            end
            return true
        elseif #v2.grappled_to.Right == 0 then
            return false, 0
        end
    end,
    settings = {
        blocked_states = {States.GEAR_SWING},
    },
}