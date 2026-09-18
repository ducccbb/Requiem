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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanChewing
--                              Dumped in 0.000679 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
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
local GrabTitanClient = require(Utilities_3:WaitForChild("GrabTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
return {
    attempt = function(p1) -- Line: 110
        return false
    end,
    execute = function(p1, p2, p3, p4) -- Line: 38 -- upvalues: AnimationTitanClient (val), CooldownTitanClient (val), LocalPlayer (val), GrabTitanClient (val), useAnimatorObserver (val), Default (val), RunService (val)
        if not (AnimationTitanClient.getAnimationFromName(p1, "DefaultTitanChewing")) then
            return false
        end
        task.spawn(function() -- Line: 51 -- upvalues: AnimationTitanClient (upval), p1 (val), CooldownTitanClient (upval)
            local v1 = AnimationTitanClient.getAnimationLength(p1, "DefaultTitanChewing")
            CooldownTitanClient.addClientCooldown(p1, "eating", v1)
        end)
        if p3 ~= LocalPlayer then
            return true
        end
        local Character = LocalPlayer.Character
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return false
        end
        GrabTitanClient.onClientGrabbed(p1)
        local u33 = useAnimatorObserver.play(Default.Eaten, 0.3)
        local u34 = nil
        u34 = RunService.PostSimulation:Connect(function() -- Line: 74 -- upvalues: p1 (val), u34 (ref), HumanoidRootPart (val)
            local Head = p1.model.client:FindFirstChild("Head")
            if not Head then
                u34:Disconnect()
                return
            end
            local scale = p1.scale
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            local v1 = Head.CFrame * CFrame.new(0, -scale * 0.25, -scale * 0.55)
            local v2 = math.rad(-90)
            local v3 = math.rad(180)
            HumanoidRootPart.CFrame = v1 * CFrame.Angles(v2, v3, 0)
        end)
        p2:Add(function() -- Line: 89 -- upvalues: GrabTitanClient (upval), p1 (val), u33 (val)
            GrabTitanClient.onClientUngrabbed(p1)
            if u33 then
                u33:Stop(0.2)
            end
        end)
        p2:Add(u34)
        return true
    end,
}