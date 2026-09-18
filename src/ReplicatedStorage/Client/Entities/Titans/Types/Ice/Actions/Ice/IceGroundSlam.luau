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
--  File: ReplicatedStorage.Client.Entities.Titans.Types.Ice.Actions.Ice.IceGroundSlam
--                              Dumped in 0.000933 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
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
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local Character = User_3:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local u169 = {box = "AngryStomp", impactAt = 0.14562}
return {
    detection = u169,
    attempt = function(p1) -- Line: 96 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u169 (val)
        local v1, v2
        local v3 = {"IceGroundSlamAttempt", "IceGroundSlam"}
        if CooldownTitanClient.isOnCooldown(p1, v3) then
            return false
        end
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u169)
        if not v1 or not v2 then
            return false
        end
        local v4 = {v2 .. "Leg", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v4) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"IceGroundSlamAttempt", v2 .. "Leg"}, 1.25)
        return true, v2
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 32 -- upvalues: CooldownTitanClient (val), HitboxTitanClient (val), CharacterRagdollHandler (val), ClientGearHandler (val), ClientStatusHandler (val), Players (val)
        CooldownTitanClient.addClientCooldown(p1, "IceGroundSlam", 3)
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Leg", 1.25)
        local u24 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Leg",
            debounce = 0.2,
            priority = "Foot",
            delayed = 0.25,
            side = p5,
            wires = {shake = true, ungrapple = true, ragdoll = true},
        })
        local function onPlayerCrushed(p1) -- Line: 55 -- upvalues: CharacterRagdollHandler (upval), ClientGearHandler (upval), ClientStatusHandler (upval)
            local HumanoidRootPart = p1
            if HumanoidRootPart then
                HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
            end
            if not HumanoidRootPart then
                return
            end
            CharacterRagdollHandler.ragdoll(2.5, "titan")
            local v1 = ClientGearHandler.getGearState()
            if v1 then
                v1.signals.ungrapple:Fire("Left")
                v1.signals.ungrapple:Fire("Right")
            end
            ClientStatusHandler.addPlayerStatus("Concussed", 1.5)
            local v2 = math.random(-220, 220)
            local v3 = Vector3.new(v2, 0, math.random(-220, 220))
            HumanoidRootPart.AssemblyLinearVelocity = v3 + Vector3.new(0, 220, 0)
        end
        u24.touched:Connect(function(p1) -- Line: 75 -- upvalues: onPlayerCrushed (val), Players (upval), p4 (val), u24 (val)
            if p1 == "Foot" then
                onPlayerCrushed(Players.LocalPlayer.Character)
                p4(p1)
                u24.destroy()
                return
            end
            if p1 ~= "LowerLeg" then
                return
            end
            onPlayerCrushed(Players.LocalPlayer.Character)
            p4(p1)
            u24.destroy()
        end)
        p2:Add(task.delay(1.25, function() -- Line: 85 -- upvalues: u24 (val)
            u24.destroy()
        end))
        p2:Add(function() -- Line: 89 -- upvalues: u24 (val)
            u24.destroy()
        end)
        return true
    end,
}