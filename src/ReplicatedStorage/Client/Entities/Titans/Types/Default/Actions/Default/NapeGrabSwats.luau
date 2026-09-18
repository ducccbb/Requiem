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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.NapeGrabSwats
--                              Dumped in 0.000888 seconds
--                          Bytecode version 9  |  6 functions

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
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_2:WaitForChild("HitboxTitanClient"))
return {
    attempt = function(p1) -- Line: 97 -- upvalues: CooldownTitanClient (val), Players (val), ClientGearHandler (val)
        local Magnitude, hit, v1, v2, v3, v4, v5
        local v6 = {"NapeGrabSwatsAttempt", "NapeGrabSwats"}
        if CooldownTitanClient.isOnCooldown(p1, v6) or math.random() < 0.9 then
            return false
        end
        v6 = {"Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v6) then
            return false
        end
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        local v7 = ClientGearHandler.getGearState()
        if math.random(1, 2) ~= 1 then
            v5 = "Right"
        else
            v5 = "Left"
        end
        if not PrimaryPart or not v7 then
            return false
        end
        local Head = p1.model.client:WaitForChild("Head")
        if not Head then
            return false
        end
        local v8 = false
        local UpperTorso = p1.model.client:WaitForChild("UpperTorso")
        local Nape = UpperTorso:WaitForChild("Nape")
        local v9 = p1
        for k, v in pairs(v7.grapples) do
            if v.hit and v.hit:IsDescendantOf(v9.model.client) and v.active then
                v1 = v.hit.CFrame * v.relative
                hit = v.hit
                v2 = hit.CFrame.LookVector:Dot((v1.Position - hit.Position).Unit)
                v3 = hit.CFrame.LookVector:Dot((PrimaryPart.Position - hit.Position).Unit)
                if v2 < 0 and v3 < 0 and 0 < PrimaryPart.AssemblyLinearVelocity.Magnitude and Head.Position.Y - v9.scale * 3 < v1.Position.Y then
                    Magnitude = (Nape.WorldPosition - PrimaryPart.Position).Magnitude
                    v4 = if 100 < Magnitude then Magnitude < 600 else false
                    v8 = v4
                end
            end
        end
        if not v8 then
            return false
        end
        CooldownTitanClient.addClientCooldown(v9, {"NapeGrabSwatsAttempt", "Arm"}, 0.5)
        return true, v5
    end,
    execute = function(p1, p2, p3, p4, p5, ...) -- Line: 34 -- upvalues: CooldownTitanClient (val), HitboxTitanClient (val)
        CooldownTitanClient.addClientCooldown(p1, "NapeGrabSwats", 15)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 2)
        local u34 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            side = p5,
            wires = {
                shake = true,
                ungrapple = true,
                concuss = true,
                ragdoll = true,
                threshold = 5,
            },
        })
        u34.touched:Connect(function(p1) -- Line: 67 -- upvalues: p4 (val), u34 (val)
            if p1 == "Hand" then
                p4(p1)
                u34.destroy()
                return
            end
            if p1 ~= "LowerArm" then
                return
            end
            p4(p1)
            u34.destroy()
        end)
        p2:Add(task.delay(2, function() -- Line: 79 -- upvalues: u34 (val)
            u34.destroy()
        end))
        p2:Add(function() -- Line: 84 -- upvalues: u34 (val)
            u34.destroy()
        end)
        return true
    end,
}