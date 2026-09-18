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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.LongRangeKick
--                              Dumped in 0.000716 seconds
--                          Bytecode version 9  |  8 functions

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
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local u119 = {box = "LongRangeKick", impactAt = 0.20225}
return {
    detection = u119,
    attempt = function(p1) -- Line: 114 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u119 (val)
        local v1, v2
        local v3 = {"LongRangeKickAttempt", "LongRangeKick"}
        if CooldownTitanClient.isOnCooldown(p1, v3) or math.random() < 0.95 then
            return false
        end
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u119)
        if not v1 or not v2 then
            return false
        end
        local v4 = {v2 .. "Leg", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v4) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"LongRangeKickAttempt", v2 .. "Leg"}, 2.5)
        CooldownTitanClient.addClientCooldown(p1, "ShortRangeAttackGround", 2)
        CooldownTitanClient.addClientCooldown(p1, "LongRangeAttackGround", 2)
        return true, v2
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 37 -- upvalues: CooldownTitanClient (val), HitboxTitanClient (val), ClientStatusHandler (val), Players (val)
        CooldownTitanClient.addClientCooldown(p1, "LongRangeKick", 15)
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Leg", 1)
        CooldownTitanClient.addClientCooldown(p1, {"LeftArm", "RightArm"}, 0.5)
        local u32 = HitboxTitanClient.createLimbHitbox(p1, {
            limb = "Leg",
            debounce = 0.2,
            priority = "Foot",
            delayed = 0.2,
            side = p5,
            wires = {concuss = true, ungrapple = true, ragdoll = true, shake = true},
        })
        local function onPlayerCrushed(p1) -- Line: 72 -- upvalues: ClientStatusHandler (upval)
            local HumanoidRootPart = p1
            if HumanoidRootPart then
                HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
            end
            if not HumanoidRootPart then
                return
            end
            ClientStatusHandler.addPlayerStatus("Concussed", 1)
        end
        u32.touched:Connect(function(a1) -- Line: 81 -- upvalues: HitboxTitanClient (upval), p1 (val), p5 (val), onPlayerCrushed (val), Players (upval), p4 (val), u32 (val)
            HitboxTitanClient.onKnockbackFromLimb(p1, a1, p5, 4, function(p1, p2) -- Line: 82
                local v1 = p2.CFrame.LookVector.Unit * Vector3.new(1, 0, 1)
                p1.AssemblyLinearVelocity = (v1 + Vector3.new(0, 1, 0)) * 400
            end)
            onPlayerCrushed(Players.LocalPlayer.Character)
            p4(a1)
            u32.destroy()
        end)
        p2:Add(task.delay(1, function() -- Line: 96 -- upvalues: u32 (val)
            u32.destroy()
        end))
        p2:Add(function() -- Line: 101 -- upvalues: u32 (val)
            u32.destroy()
        end)
        return true
    end,
}