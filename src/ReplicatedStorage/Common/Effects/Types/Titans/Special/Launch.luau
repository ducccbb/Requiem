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
--          File: ReplicatedStorage.Common.Effects.Types.Titans.Special.Launch
--                              Dumped in 0.000932 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Special = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Special")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local State = User_3:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local Shake = require(Utilities_3:WaitForChild("Shake"))
return function(p1, p2) -- Line: 33 -- upvalues: Special (val), Players (val), ClientGearHandler (val), RunService (val), Character (val), CharacterRagdollHandler (val), ClientStatusHandler (val), Workspace (val), Shake (val), Particles (val)
    local v1 = Special:WaitForChild("Launch"):Clone()
    v1.Position = p1
    v1.Parent = workspace
    local function applyUpwardsVelocity(p1, a2) -- Line: 40 -- upvalues: Players (upval), ClientGearHandler (upval), p2 (val), RunService (upval), Character (upval), CharacterRagdollHandler (upval), ClientStatusHandler (upval), Workspace (upval), Shake (upval)
        local Character_2 = Players.LocalPlayer.Character
        if not Character_2 then
            return
        end
        local HumanoidRootPart = Character_2:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        local function isPlayerGrappledOnTitan() -- Line: 54 -- upvalues: ClientGearHandler (upval), p2 (upval)
            local v1 = ClientGearHandler.getGearState()
            if not v1 then
                return false
            end
            for k, v in pairs(v1.grapples) do
                if v.hit and v.hit:IsDescendantOf(p2) and v.active and v.grappled then
                    return true
                end
            end
            return false
        end
        local u10 = nil
        u10 = RunService.RenderStepped:Connect(function(a1) -- Line: 79 -- upvalues: HumanoidRootPart (val), isPlayerGrappledOnTitan (val), p1 (val), Character (upval), u10 (ref), CharacterRagdollHandler (upval), ClientStatusHandler (upval), ClientGearHandler (upval), Workspace (upval), Shake (upval)
            local v1
            if not HumanoidRootPart or not HumanoidRootPart.Parent or not (isPlayerGrappledOnTitan()) then
                return
            end
            local v2 = HumanoidRootPart
            local v3 = p1 * a1
            v2.AssemblyLinearVelocity = v2.AssemblyLinearVelocity + Vector3.new(0, v3, 0)
            _, v1 = Character.isGrounded()
            if v1 and v1 < 5 and p1 < 0 then
                u10:Disconnect()
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                CharacterRagdollHandler.ragdoll(5)
                ClientStatusHandler.addPlayerStatus("Concussed", 2)
                local v4 = ClientGearHandler.getGearState()
                if v4 then
                    v4.signals.ungrapple:Fire("Left")
                    v4.signals.ungrapple:Fire("Right")
                end
                local CurrentCamera = Workspace.CurrentCamera
                local v5 = Shake.new()
                v5.FadeInTime = 0.3
                v5.FadeOutTime = 0.3
                v5.Frequency = 0.5
                v5.Amplitude = 5
                v5.RotationInfluence = Vector3.new(0.2, 0.2, 0.2)
                v5:Start()
                v5:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 125 -- upvalues: CurrentCamera (val)
                    local v1 = CurrentCamera
                    local v2 = CFrame.new(p1)
                    v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
                end)
            end
        end)
        task.delay(a2, function() -- Line: 131 -- upvalues: u10 (ref)
            u10:Disconnect()
        end)
    end
    task.delay(0.2, function() -- Line: 136 -- upvalues: applyUpwardsVelocity (val)
        applyUpwardsVelocity(20000, 0.3)
        task.wait(0.3)
        applyUpwardsVelocity(-25000, 0.6)
    end)
    local Attachment = v1:WaitForChild("Attachment")
    Particles.deepEmitParticles(Attachment, true)
end