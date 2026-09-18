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
--           File: ReplicatedStorage.Common.Utilities.Archive.archive.Default
--                               Dumped in 0.00238 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Character = require(v1.Parent.Parent:WaitForChild("Character"))
local Types = v1.Parent.Parent.Parent:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local Statistics = v1.Parent.Parent.Parent:WaitForChild("Statistics")
local useCameraTilt = require(Statistics:WaitForChild("useCameraTilt"))
local Statistics_2 = v1.Parent.Parent.Parent:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local Animations = v1.Parent.Parent.Parent:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local Observers = v1.Parent.Parent.Parent:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_2:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
return {
    initialized = function(p1, p2) -- Line: 39 -- upvalues: useFieldOfView (val), useCameraTilt (val), ClientSettingsHandler (val), ClientStateHandler (val), States (val), Character (val), useAnimatorObserver (val), Gear (val), RunService (val), Workspace (val), UserInputService (val)
        local u16, u19
        local trove = p2.trove
        local u3 = nil
        local u4 = nil
        local u5 = nil
        local u6 = nil
        local u7 = nil
        local u8 = nil
        local u9 = nil
        local u10 = nil
        local u11 = nil
        local u13 = tick()
        _, u16 = useFieldOfView()
        _, u19 = useCameraTilt()
        local u20 = nil
        local u21 = nil
        local u27 = ClientSettingsHandler.getSettingFromName("Automatic Wall Running") == 1
        local function getNeighoringWall(p1) -- Line: 64 -- upvalues: u3 (ref)
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            v1.FilterDescendantsInstances = {u3}
            return workspace:Raycast(u3.HumanoidRootPart.Position, u3.HumanoidRootPart.CFrame.RightVector * (p1 * 3), v1)
        end
        local function onWallSlideDismount(p1) -- Line: 76 -- upvalues: u4 (ref), u13 (ref), p2 (val), ClientStateHandler (upval), States (upval), u20 (ref), u21 (ref), u3 (ref), u7 (ref), Character (upval), u8 (ref), u10 (ref), u11 (ref), useAnimatorObserver (upval), Gear (upval)
            if u4 then
                u4:Disconnect()
                u4 = nil
            end
            u13 = tick()
            p2.wall_sliding = false
            ClientStateHandler.updateState(States.WALL_SLIDING, false)
            if u20 then
                u20(TweenInfo.new(1))
            end
            if u21 then
                u21(TweenInfo.new(0.5))
            end
            if not u3 or not u7 then
                return
            end
            if not (Character.isRagdolled()) then
                u3.Humanoid.AutoRotate = true
                u3.Humanoid.PlatformStand = false
            end
            u7:Destroy()
            u8:Destroy()
            if not u10 then
                return
            end
            if u11 then
                u11:Stop(0.2)
            end
            p2.animation = useAnimatorObserver.play(Gear.Walls.Release[p1], 0.2)
            local v1 = u10.Normal + u3.HumanoidRootPart.AssemblyLinearVelocity.Unit + Vector3.new(0, 1, 0)
            u3.HumanoidRootPart.AssemblyLinearVelocity = v1 * math.clamp(u3.HumanoidRootPart.AssemblyLinearVelocity.Magnitude * 1.15, 0, 180)
        end
        local function onWallSlideAttempt(p1, a2) -- Line: 131 -- upvalues: u3 (ref), u9 (ref), u10 (ref), u7 (ref), u8 (ref), p2 (val), useAnimatorObserver (upval), Gear (upval), u11 (ref), u20 (ref), u16 (val), u21 (ref), u19 (val), u4 (ref), RunService (upval), onWallSlideDismount (val), u27 (val), Workspace (upval), getNeighoringWall (val)
            local u4
            local Normal = a2.Normal
            if p1 ~= "Left" then
                u4 = 1
            else
                u4 = -1
            end
            u3.Humanoid.AutoRotate = false
            u3.Humanoid.PlatformStand = true
            u9 = p1
            u10 = a2
            local v1 = CFrame.new(a2.Position, a2.Position + Normal)
            local v2 = v1 * CFrame.new(0, 0, -3)
            local v3 = math.rad(90 * -u4)
            local u35 = v2 * CFrame.Angles(0, v3, 0)
            u3.HumanoidRootPart.CFrame = u35
            local Magnitude = u3.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
            u7 = Instance.new("BodyVelocity")
            u7.MaxForce = Vector3.new(50000, 50000, 50000)
            u7.P = 1000
            u7.Velocity = u35.LookVector * Magnitude
            u7.Parent = u3.HumanoidRootPart
            u8 = Instance.new("BodyGyro")
            u8.MaxTorque = Vector3.new(500000, 500000, 500000)
            u8.P = 2000
            u8.D = 5
            u8.CFrame = CFrame.new(u3.HumanoidRootPart.Position, u35.Position + u7.Velocity)
            u8.Parent = u3.HumanoidRootPart
            u3.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            u3.HumanoidRootPart:ApplyImpulse(u7.Velocity)
            if p2.animation then
                p2.animation:Stop(0.2)
            end
            p2.animation = useAnimatorObserver.play(Gear.Walls.Idles[p1], 0.2)
            u11 = p2.animation
            u20 = u16("wall", 20, "add", 4, TweenInfo.new(1))
            v3 = 20 * u4
            u21 = u19("wall", v3, "add", 4, TweenInfo.new(0.5))
            if u4 then
                u4:Disconnect()
            end
            u4 = RunService.RenderStepped:Connect(function(a1) -- Line: 180 -- upvalues: u7 (upval), onWallSlideDismount (upval), p1 (val), u27 (upval), u35 (ref), Workspace (upval), getNeighoringWall (upval), u4 (val), Normal (val), Magnitude (val), u8 (upval), u3 (upval)
                local v1, v2, v3, v4, v5, v6, v7
                local v8 = u7.Velocity.Magnitude < 40
                if v8 then
                    return onWallSlideDismount(p1)
                end
                if not u27 then
                    v1 = getNeighoringWall(u4 * 1.75)
                    if not v1 then
                        return onWallSlideDismount(p1)
                    end
                    v4 = CFrame.new(v1.Position, v1.Position + Normal)
                    v3 = v4 * CFrame.new(0, 0, -3)
                    v5 = math.rad(90 * -u4)
                    u35 = v3 * CFrame.Angles(0, v5, 0)
                    v3 = u35.LookVector * Vector3.new(1, 0, 1)
                    v2 = v3 * Magnitude + Vector3.new(0, 10, 0)
                    u7.Velocity = v2
                    u8.CFrame = CFrame.new(u3.HumanoidRootPart.Position, u35.Position + u7.Velocity)
                    v3 = RaycastParams.new()
                    v3.FilterType = Enum.RaycastFilterType.Exclude
                    v3.FilterDescendantsInstances = {u3}
                    v6 = Vector3.new(0, -5, 0)
                    v4 = workspace:Raycast(u35.Position, v6, v3)
                    v7 = u35.LookVector * 5
                    if not v4 then
                        if workspace:Raycast(u35.Position, v7, v3) then
                            return onWallSlideDismount(p1)
                        end
                        return
                    end
                    return onWallSlideDismount(p1)
                end
                v1 = u35.LookVector:Dot(Workspace.CurrentCamera.CFrame.LookVector)
                if v1 < 0.6 then
                    return onWallSlideDismount(p1)
                end
                v1 = getNeighoringWall(u4 * 1.75)
                if not v1 then
                    return onWallSlideDismount(p1)
                end
                v4 = CFrame.new(v1.Position, v1.Position + Normal)
                v3 = v4 * CFrame.new(0, 0, -3)
                v5 = math.rad(90 * -u4)
                u35 = v3 * CFrame.Angles(0, v5, 0)
                v3 = u35.LookVector * Vector3.new(1, 0, 1)
                v2 = v3 * Magnitude + Vector3.new(0, 10, 0)
                u7.Velocity = v2
                u8.CFrame = CFrame.new(u3.HumanoidRootPart.Position, u35.Position + u7.Velocity)
                v3 = RaycastParams.new()
                v3.FilterType = Enum.RaycastFilterType.Exclude
                v3.FilterDescendantsInstances = {u3}
                v6 = Vector3.new(0, -5, 0)
                v4 = workspace:Raycast(u35.Position, v6, v3)
                v7 = u35.LookVector * 5
                if v4 or workspace:Raycast(u35.Position, v7, v3) then
                    return onWallSlideDismount(p1)
                end
            end)
        end
        local function handleAutomaticWallRunning() -- Line: 226 -- upvalues: Character (upval), u3 (ref), u6 (ref), RunService (upval), p2 (val), u4 (ref), u13 (ref), getNeighoringWall (val), ClientStateHandler (upval), States (upval), onWallSlideAttempt (val), trove (val)
            local v1
            _, v1 = Character.getCharacterAsync():await()
            u3 = v1
            u6 = RunService.RenderStepped:Connect(function() -- Line: 231 -- upvalues: u3 (upval), p2 (upval), u4 (upval), u13 (upval), Character (upval), getNeighoringWall (upval), ClientStateHandler (upval), States (upval), onWallSlideAttempt (upval)
                local HumanoidRootPart = u3.HumanoidRootPart
                if not HumanoidRootPart then
                    return
                elseif p2.wall_sliding then
                    return
                else
                    local v1
                    if u4 then
                        return
                    end
                    local v2 = tick() - u13
                    if v2 < 1 then
                        return
                    end
                    v2, v1 = Character.isGrounded(u3)
                    if v2 then
                        return
                    elseif v1 < 20 then
                        return
                    else
                        if HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 100 then
                            return
                        end
                        local v3 = getNeighoringWall(-1)
                        local v4 = getNeighoringWall(1)
                        if v3 then
                            local v5
                            local v6 = v3 or v4
                            local v7 = HumanoidRootPart.CFrame.LookVector:Dot(v6.Normal)
                            if v7 < -0.2 then
                                return
                            end
                            if p2.grapples.left.active then
                                p2.signals.ungrapple:Fire("Left")
                            end
                            if p2.grapples.right.active then
                                p2.signals.ungrapple:Fire("Right")
                            end
                            ClientStateHandler.updateState(States.WALL_SLIDING, true)
                            p2.wall_sliding = true
                            if not v3 then
                                v5 = "Right"
                            else
                                v5 = "Left"
                            end
                            onWallSlideAttempt(v5, v6)
                            return
                        elseif not v4 then
                            return
                        end
                    end
                end
            end)
            trove:Add(u6)
        end
        local function handleManualWallRunning() -- Line: 276 -- upvalues: u6 (ref), UserInputService (upval), u13 (ref), p2 (val), Character (upval), u3 (ref), getNeighoringWall (val), ClientStateHandler (upval), States (upval), onWallSlideAttempt (val), u5 (ref), u9 (ref), onWallSlideDismount (val), trove (val)
            u6 = UserInputService.InputBegan:Connect(function(p1) -- Line: 277 -- upvalues: u13 (upval), p2 (upval), Character (upval), u3 (upval), getNeighoringWall (upval), ClientStateHandler (upval), States (upval), onWallSlideAttempt (upval)
                local v1, v2, v3, v4
                if p1.KeyCode ~= Enum.KeyCode.Space then
                    return
                end
                local v5 = tick() - u13
                if v5 < 1 then
                    return
                end
                local active = p2.grapples.left.active
                if not active then
                    active = p2.grapples.right.active
                end
                if active then
                    return
                end
                _, v2 = Character.getCharacterAsync():await()
                u3 = v2
                v3, v4 = Character.isGrounded(u3)
                if v3 or v4 < 20 then
                    return
                end
                local v6 = getNeighoringWall(-1)
                local v7 = getNeighoringWall(1)
                if v6 then
                    ClientStateHandler.updateState(States.WALL_SLIDING, true)
                    p2.wall_sliding = true
                    if not v6 then
                        v1 = "Right"
                    else
                        v1 = "Left"
                    end
                    onWallSlideAttempt(v1, v6 or v7)
                    return
                end
                if not v7 then
                    return
                end
                ClientStateHandler.updateState(States.WALL_SLIDING, true)
                p2.wall_sliding = true
                if not v6 then
                    v1 = "Right"
                else
                    v1 = "Left"
                end
                onWallSlideAttempt(v1, v6 or v7)
            end)
            u5 = UserInputService.InputEnded:Connect(function(p1) -- Line: 315 -- upvalues: p2 (upval), u9 (upval), onWallSlideDismount (upval)
                if p1.KeyCode ~= Enum.KeyCode.Space or not p2.wall_sliding or not u9 then
                    return
                end
                onWallSlideDismount(u9)
            end)
            trove:Add(u5)
            trove:Add(u6)
        end
        trove:Add(ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) end))
        trove:Add(function() -- Line: 358 -- upvalues: u4 (ref), u20 (ref), u21 (ref), u7 (ref), u8 (ref)
            if u4 then
                u4:Disconnect()
                u4 = nil
            end
            if u20 then
                u20(TweenInfo.new(1))
            end
            if u21 then
                u21(TweenInfo.new(0.5))
            end
            if u7 then
                u7:Destroy()
            end
            if u8 then
                u8:Destroy()
            end
        end)
    end,
}