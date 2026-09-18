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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanDead
--                              Dumped in 0.000450 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities:WaitForChild("AnimationTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_3:WaitForChild("KinematicTitanClient"))
return {
    attempt = function(p1) -- Line: 89
        return false
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 33 -- upvalues: AnimationTitanClient (val), KinematicTitanClient (val), CooldownTitanClient (val), TweenService (val)
        if not (AnimationTitanClient.getAnimationFromName(p1, "DefaultTitanDead")) then
            return false
        end
        KinematicTitanClient.snapLookAtMotorsToBindPose(p1)
        p1.inactive = true
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 100)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 100)
        CooldownTitanClient.addClientCooldown(p1, "LeftLeg", 100)
        CooldownTitanClient.addClientCooldown(p1, "RightLeg", 100)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 100)
        CooldownTitanClient.addClientCooldown(p1, "dying", 100)
        p1.signals.destroy:Fire()
        task.spawn(function() -- Line: 64 -- upvalues: p1 (val), TweenService (upval)
            local v1
            task.wait(2)
            for i, j in p1.model.client:GetDescendants() do
                if j:IsA("BasePart") then
                    v1 = TweenInfo.new(5)
                    TweenService:Create(j, v1, {Transparency = 1}):Play()
                    j.CollisionGroup = "Uninteractable"
                end
            end
        end)
        return true
    end,
}