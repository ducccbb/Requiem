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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Anger.LongRangeAttackGround
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  8 functions

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
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities_2:WaitForChild("DetectionBoxTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_3:WaitForChild("HitboxTitanClient"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_4:WaitForChild("KinematicTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
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
local Utilities_5 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u232 = {box = "LongRangeAttackGround", impactAt = 0.16180000000000003}
return {
    detection = u232,
    attempt = function(p1) -- Line: 167 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u232 (val)
        local v1 = {"LongRangeAttackGroundAttempt", "LongRangeAttackGround"}
        if CooldownTitanClient.isOnCooldown(p1, v1) or math.random() < 0.98 or not (DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u232)) then
            return false
        end
        local v2 = {"LeftArm", "RightArm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"LongRangeAttackGroundAttempt", "LeftArm", "RightArm"}, 0.5)
        return true
    end,
    execute = function(p1, p2, p3, p4) -- Line: 48 -- upvalues: Sounds (val), Titans (val), KinematicTitanClient (val), CooldownTitanClient (val), HitboxTitanClient (val), CharacterRagdollHandler (val), ClientGearHandler (val), ClientStatusHandler (val), RunService (val), Players (val), Workspace (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        Sounds.playFalloffSoundEffect(Titans.ShortRangeAttackGround1, p1.root, 500, 15)
        KinematicTitanClient.suppressLookAtFor(p1.id, {easeInSec = 0.18, holdSec = 1.35, easeOutSec = 0.38})
        CooldownTitanClient.addClientCooldown(p1, "LongRangeAttackGround", 10)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 3)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 3)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 3)
        local u55 = HitboxTitanClient.createLimbHitbox(p1, {
            side = "Both",
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u55.touched:Connect(function(a1, p2) -- Line: 88 -- upvalues: HitboxTitanClient (upval), p1 (val), p4 (val), u55 (val)
            if a1 == "Hand" then
                p4(p2)
                u55.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, p2)
            end
            p4(p2)
            u55.destroy()
        end)
        local function onPlayerCrushed(p1) -- Line: 103 -- upvalues: CharacterRagdollHandler (upval), ClientGearHandler (upval), ClientStatusHandler (upval)
            CharacterRagdollHandler.ragdoll(5, "titan")
            local v1 = ClientGearHandler.getGearState()
            if v1 then
                v1.signals.ungrapple:Fire("Left")
                v1.signals.ungrapple:Fire("Right")
            end
            ClientStatusHandler.addPlayerStatus("Concussed", 1)
        end
        local u63 = RaycastParams.new()
        u63.FilterType = Enum.RaycastFilterType.Include
        u63.FilterDescendantsInstances = {p1.model.client}
        u63.CollisionGroup = "Titans"
        local u69 = nil
        u69 = RunService.RenderStepped:Connect(function() -- Line: 124 -- upvalues: Players (upval), Workspace (upval), u63 (val), onPlayerCrushed (val), p4 (val), u69 (ref)
            local Character = Players.LocalPlayer.Character
            local PrimaryPart = Character
            if PrimaryPart then
                PrimaryPart = Character.PrimaryPart
            end
            if not PrimaryPart then
                return
            end
            local v1 = Vector3.new(0, 8, 0)
            if not (Workspace:Raycast(PrimaryPart.Position, v1, u63)) then
                return
            end
            onPlayerCrushed(Character)
            p4("crush")
            u69:Disconnect()
        end)
        p2:Add(task.delay(2, function() -- Line: 147 -- upvalues: u55 (val), u69 (ref)
            u55.destroy()
            u69:Disconnect()
        end))
        p2:Add(function() -- Line: 153 -- upvalues: u55 (val), u69 (ref)
            u55.destroy()
            u69:Disconnect()
        end)
        return true
    end,
}