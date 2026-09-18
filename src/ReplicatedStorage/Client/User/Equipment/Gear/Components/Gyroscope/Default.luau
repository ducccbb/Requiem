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
--    File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Gyroscope.Default
--                              Dumped in 0.000863 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Gear = require(Common_4:WaitForChild("Logger"))("Gear")
local u109 = Config.define({BODY_GYRO_P = 10000, BODY_GYRO_D = 500})
return {
    initialized = function(p1, p2) -- Line: 36 -- upvalues: Character (val), Gear (val), u109 (val), ClientStateHandler (val), States (val)
        local trove = p2.trove
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.Name = "GearGyro"
        local u7 = nil
        local function onGoalRemoved() -- Line: 89 -- upvalues: Character (upval), Gear (upval), ClientStateHandler (upval), States (upval), BodyGyro (val), u7 (ref)
            local v1 = Character.getCharacter()
            if not v1 then
                Gear.warn("No character found while on goal removed")
                return
            end
            if not v1 then
                return
            end
            local Attribute = v1:GetAttribute("Ragdolled")
            local Humanoid = v1
            if Humanoid then
                Humanoid = v1:FindFirstChildOfClass("Humanoid")
            end
            if Humanoid and not Humanoid.AutoRotate and not (ClientStateHandler.isStateBusy(States.CLASHING)) and not (ClientStateHandler.isStateBusy(States.STUNNED)) and not Attribute then
                Humanoid.AutoRotate = true
            end
            BodyGyro.Parent = nil
            if u7 and not Attribute then
                u7.Parent = v1.HumanoidRootPart
            end
        end
        trove:Add(p2.signals.stepped:Connect(function(p1) -- Line: 44 -- upvalues: Character (upval), trove (val), Gear (upval), p2 (val), BodyGyro (val), u7 (ref), u109 (upval)
            local v1 = Character.getCharacter()
            if not v1 or trove._cleaning or not (Character.isActive()) then
                Gear.warn("No character found while on gear goal stepped")
                return
            end
            if not p2.enabled then
                return
            end
            if v1:GetAttribute("Ragdolled") or p2.no_physics then
                BodyGyro.Parent = nil
                return
            end
            local Stable = v1.HumanoidRootPart:FindFirstChild("Stable")
            if Stable then
                u7 = Stable
                Stable.Parent = nil
            end
            BodyGyro.CFrame = CFrame.new(v1.HumanoidRootPart.Position, p1)
            BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyGyro.P = u109.BODY_GYRO_P
            BodyGyro.D = u109.BODY_GYRO_D
            local SlideGearGyro = v1.HumanoidRootPart:FindFirstChild("SlideGearGyro")
            if SlideGearGyro then
                SlideGearGyro:Destroy()
            end
            BodyGyro.Parent = v1.HumanoidRootPart
        end))
        trove:Add(p2.signals.goal:Connect(function(p1) -- Line: 123 -- upvalues: Character (upval), Gear (upval), onGoalRemoved (val)
            if not (Character.getCharacter()) then
                Gear.warn("No character found while on gear goal")
                return
            end
            if not p1 then
                return onGoalRemoved()
            end
        end))
        trove:Add(function() -- Line: 135 -- upvalues: BodyGyro (val), onGoalRemoved (val), Character (upval), Gear (upval)
            if BodyGyro then
                onGoalRemoved()
            end
            local v1 = Character.getCharacter()
            if not v1 then
                Gear.warn("No character found while on gear goal removed")
                return
            end
            local Attribute = v1
            if Attribute then
                Attribute = v1:GetAttribute("Ragdolled")
            end
            if not Attribute then
                local Humanoid = v1
                if Humanoid then
                    Humanoid = v1:FindFirstChildOfClass("Humanoid")
                end
                if Humanoid then
                    Humanoid.PlatformStand = false
                end
            end
        end)
    end,
}