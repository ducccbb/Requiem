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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.GrappleJumpShake
--                               Dumped in 0.00141 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client_2:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities_3:WaitForChild("AnimationTitanClient"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local User_3 = Client_4:WaitForChild("User")
local Equipment = User_3:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_4:WaitForChild("CooldownTitanClient"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_5 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_10:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    attempt = function(p1) -- Line: 198 -- upvalues: CooldownTitanClient (val), ClientGearHandler (val)
        local v1
        local v2 = {"GrappleJumpShakeAttempt", "GrappleJumpShake", "LeftArm", "RightArm"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        v2 = {"Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        local v3 = ClientGearHandler.getGearState()
        if not v3 then
            return false
        end
        local v4 = false
        for k, v in pairs(v3.grapples) do
            if v.hit and v.hit:IsDescendantOf(p1.model.client) and v.active and v.grappled then
                v1 = tick() - v.grappled
                if 0.3 < v1 then
                    v4 = true
                    break
                end
            end
        end
        CooldownTitanClient.addClientCooldown(p1, {"GrappleJumpShakeAttempt"}, 0.3)
        return v4
    end,
    execute = function(p1, p2, p3, p4, p5, ...) -- Line: 49 -- upvalues: AnimationTitanClient (val), Sounds (val), Titans (val), CooldownTitanClient (val), Players (val), ClientGearHandler (val), RunService (val), Character (val), CharacterRagdollHandler (val), ClientEnchantmentsHandler (val), ClientStatusHandler (val), Workspace (val), Shake (val)
        local v1 = AnimationTitanClient.getAnimationFromName(p1, "GrappleJumpShake")
        if not v1 then
            return false
        end
        Sounds.playFalloffSoundEffect(Titans.JumpingMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        local v2 = AnimationTitanClient.getAnimationLength(p1, "GrappleJumpShake")
        CooldownTitanClient.addClientCooldown(p1, "GrappleJumpShake", v2 + 10)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", v2)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", v2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", v2)
        local function applyUpwardsVelocity(a1, a2) -- Line: 79 -- upvalues: Players (upval), ClientGearHandler (upval), p1 (val), RunService (upval), Character (upval), CharacterRagdollHandler (upval), ClientEnchantmentsHandler (upval), ClientStatusHandler (upval), Workspace (upval), Shake (upval), p4 (val), p2 (val)
            local Character_2 = Players.LocalPlayer.Character
            if not Character_2 then
                return
            end
            local HumanoidRootPart = Character_2:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return
            end
            local function isPlayerGrappledOnTitan() -- Line: 93 -- upvalues: ClientGearHandler (upval), p1 (upval)
                local v1, v2
                local v3 = ClientGearHandler.getGearState()
                if not v3 then
                    return false
                end
                for k, v in pairs(v3.grapples) do
                    if v.hit and v.hit:IsDescendantOf(p1.model.client) and v.active and v.grappled then
                        v2 = tick() - v.grappled
                        v1 = 0.5 < v2
                        return v1
                    end
                end
                return false
            end
            local u10 = nil
            u10 = RunService.RenderStepped:Connect(function(p1) -- Line: 120 -- upvalues: HumanoidRootPart (val), isPlayerGrappledOnTitan (val), a1 (val), Character (upval), u10 (ref), CharacterRagdollHandler (upval), ClientEnchantmentsHandler (upval), ClientStatusHandler (upval), ClientGearHandler (upval), Workspace (upval), Shake (upval), p4 (upval)
                local v1
                if not HumanoidRootPart or not HumanoidRootPart.Parent or not (isPlayerGrappledOnTitan()) then
                    return
                end
                local v2 = HumanoidRootPart
                local v3 = a1 * p1
                v2.AssemblyLinearVelocity = v2.AssemblyLinearVelocity + Vector3.new(0, v3, 0)
                _, v1 = Character.isGrounded()
                if v1 and v1 < 5 and a1 < 0 then
                    local v4
                    u10:Disconnect()
                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    CharacterRagdollHandler.ragdoll(5, "titan")
                    local v5 = ClientEnchantmentsHandler.hasEnchantment("Clear Mind")
                    if not v5 then
                        v4 = 2
                    else
                        v4 = 0.6
                    end
                    ClientStatusHandler.addPlayerStatus("Concussed", v4)
                    local v6 = ClientGearHandler.getGearState()
                    if v6 then
                        v6.signals.ungrapple:Fire("Left")
                        v6.signals.ungrapple:Fire("Right")
                    end
                    local CurrentCamera = Workspace.CurrentCamera
                    local v7 = Shake.new()
                    v7.FadeInTime = 0.3
                    v7.FadeOutTime = 0.3
                    v7.Frequency = 0.5
                    v7.Amplitude = 5
                    v7.RotationInfluence = Vector3.new(0.2, 0.2, 0.2)
                    v7:Start()
                    v7:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 167 -- upvalues: CurrentCamera (val)
                        local v1 = CurrentCamera
                        local v2 = CFrame.new(p1)
                        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
                    end)
                    p4()
                end
            end)
            p2:Add(u10)
            task.delay(a2, function() -- Line: 176 -- upvalues: u10 (ref)
                u10:Disconnect()
            end)
        end
        p2:Add(v1.track.KeyframeReached:Connect(function(p1) -- Line: 181 -- upvalues: applyUpwardsVelocity (val)
            if p1 == "Up" then
                applyUpwardsVelocity(3000, 0.5)
                return
            end
            if p1 == "Down" then
                applyUpwardsVelocity(-10000, 0.5)
            end
        end))
        return true
    end,
}