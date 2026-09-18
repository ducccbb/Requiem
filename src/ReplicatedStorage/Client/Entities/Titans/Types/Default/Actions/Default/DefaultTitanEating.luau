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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanEating
--                              Dumped in 0.000676 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities:WaitForChild("AnimationTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local GrabTitanClient = require(Utilities_3:WaitForChild("GrabTitanClient"))
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_4:WaitForChild("KinematicTitanClient"))
local LocalPlayer = Players.LocalPlayer
return {
    attempt = function(p1) -- Line: 124
        return false
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 40 -- upvalues: AnimationTitanClient (val), CooldownTitanClient (val), Alive (val), KinematicTitanClient (val), RunService (val), Players (val), GrabTitanClient (val), LocalPlayer (val)
        if not (AnimationTitanClient.getAnimationFromName(p1, "DefaultTitanEating")) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Arm", 5)
        local v1 = Alive.getAliveCharacter(p3)
        local HumanoidRootPart = v1
        if HumanoidRootPart then
            HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return false
        end
        task.defer(function() -- Line: 68 -- upvalues: AnimationTitanClient (upval), p1 (val), CooldownTitanClient (upval), KinematicTitanClient (upval)
            local v1 = AnimationTitanClient.getAnimationLength(p1, "DefaultTitanEating")
            CooldownTitanClient.addClientCooldown(p1, "eating", v1)
            local v2 = math.max(0.05, v1 - 0.2 - 0.35)
            KinematicTitanClient.suppressLookAtFor(p1.id, {easeInSec = 0.2, easeOutSec = 0.35, holdSec = v2})
        end)
        local u34 = nil
        u34 = RunService.PostSimulation:Connect(function() -- Line: 81 -- upvalues: p1 (val), p5 (val), u34 (ref), Players (upval), GrabTitanClient (upval), HumanoidRootPart (val)
            local v1 = p1.model.client:FindFirstChild(p5 .. "Hand")
            if not v1 then
                u34:Disconnect()
                return
            end
            if not (Players.LocalPlayer:GetAttribute("Grabbed")) then
                u34:Disconnect()
                GrabTitanClient.onClientUngrabbed(p1)
                return
            end
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            HumanoidRootPart.CFrame = v1.CFrame
        end)
        if p3 == LocalPlayer then
            GrabTitanClient.onClientGrabbed(p1)
            p2:Add(function() -- Line: 104 -- upvalues: GrabTitanClient (upval), p1 (val)
                GrabTitanClient.onClientUngrabbed(p1)
            end)
        end
        p2:Add(u34)
        p2:Add(function() -- Line: 111 -- upvalues: KinematicTitanClient (upval), p1 (val)
            KinematicTitanClient.cancelLookAtSuppression(p1.id)
        end)
        return true
    end,
}