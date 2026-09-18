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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Soldier.Blade Thrust
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  6 functions

local u146
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
_, u146 = require(Statistics:WaitForChild("useFieldOfView"))()
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_3:WaitForChild("useNumberEasing"))
return {
    settings = {
        blades = true,
        blocked_states = {
            States.GEAR_SWING,
            States.CLASHING,
            States.STUNNED,
            States.PARRYING,
            States.WALL_HANGING,
        },
    },
    requested = function(p1, p2) -- Line: 54 -- upvalues: Character (val), ClientGearHandler (val), ClientStateHandler (val), States (val), useNumberEasing (val), u146 (val), Sounds (val), Proficiencies (val), RunService (val)
        local u19, u21, v1
        local u4 = Character.getCharacter()
        if not u4 then
            return
        end
        local u7 = ClientGearHandler.getGearState()
        if not u7 then
            return
        end
        ClientStateHandler.updateState(States.GEAR_SWING, true)
        local Magnitude = u4.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        u19, v1, u21 = useNumberEasing(1)
        v1(100, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
        local u35 = 0.4 - (workspace:GetServerTimeNow() - p1)
        local u46 = u146("thrust", 140, "set", 10, TweenInfo.new(u35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        if u7.stance == "Crossguard" then
            task.delay(0.2, function() -- Line: 89 -- upvalues: Sounds (upval), Proficiencies (upval)
                Sounds.playGlobalSoundEffect(Proficiencies.Thrust, 0.1, 1, 8)
            end)
        end
        u7.signals.clearMomentum:Fire()
        local u58 = 0
        local u59 = false
        local u70 = RunService.RenderStepped:Connect(function(p1) -- Line: 100 -- upvalues: u58 (ref), ClientGearHandler (upval), u35 (val), u59 (ref), u46 (val), u4 (val), Magnitude (val), u19 (val)
            u58 = u58 + p1
            local v1 = ClientGearHandler.getGearState()
            if not v1 then
                return
            end
            if u35 <= u58 and not u59 then
                u59 = true
                v1.signals.simulateBladeSwing:Fire(0.4)
                u46(TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out))
            end
            local function onApplyVelocityToVector(p1) -- Line: 118 -- upvalues: u4 (upval), Magnitude (upval), u19 (upval)
                u4.HumanoidRootPart.AssemblyLinearVelocity = (p1 - u4.HumanoidRootPart.Position).Unit * (Magnitude + u19())
            end
            local left = v1.grapples.left
            local right = v1.grapples.right
            local active = left
            if active then
                active = left.active
            end
            local active_2 = right
            if active_2 then
                active_2 = right.active
            end
            if active then
                local WorldPosition, WorldPosition_2, v2
                if not left.attachment then
                    WorldPosition = left.goal
                else
                    WorldPosition = left.attachment.WorldPosition
                end
                if not right.attachment then
                    WorldPosition_2 = right.goal
                else
                    WorldPosition_2 = right.attachment.WorldPosition
                end
                local goal = active
                if goal then
                    goal = not left.busy
                    if goal then
                        goal = left.goal
                    end
                end
                local goal_2 = active_2
                if goal_2 then
                    goal_2 = not right.busy
                    if goal_2 then
                        goal_2 = right.goal
                    end
                end
                if not goal then
                    if goal then
                        v2 = WorldPosition
                    elseif not goal_2 then
                        v2 = nil
                    else
                        v2 = WorldPosition_2
                        if not v2 then
                            v2 = nil
                        end
                    end
                elseif goal_2 then
                    v2 = (WorldPosition + WorldPosition_2) / 2
                end
                if v2 then
                    onApplyVelocityToVector(v2)
                    return
                end
                onApplyVelocityToVector(u4.HumanoidRootPart.Position + u4.HumanoidRootPart.CFrame.LookVector * 100)
                return
            elseif not active_2 then
                onApplyVelocityToVector(u4.HumanoidRootPart.Position + u4.HumanoidRootPart.CFrame.LookVector * 100)
                return
            end
        end)
        task.delay(1, function() -- Line: 154 -- upvalues: u70 (val), u21 (val), ClientStateHandler (upval), States (upval), u7 (val)
            u70:Disconnect()
            u21()
            task.wait(1)
            ClientStateHandler.updateState(States.GEAR_SWING, false)
            u7.signals.beginSimulatedMomentum:Fire()
        end)
    end,
}