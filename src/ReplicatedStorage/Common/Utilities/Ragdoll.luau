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
--                   File: ReplicatedStorage.Common.Utilities.Ragdoll
--                               Dumped in 0.00215 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Profiling = require(ReplicatedFirst:WaitForChild("Profiling"))
local u33 = {}
local v2 = {}
local v3 = CFrame.new(0, 1, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1)
v2[1] = v3
v2[2] = CFrame.new(0, -0.5, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1)
u33.Neck = v2
v2 = {}
v3 = CFrame.new(-1.3, 0.75, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)
v2[1] = v3
v2[2] = CFrame.new(0.2, 0.75, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)
u33["Left Shoulder"] = v2
v2 = {}
v3 = CFrame.new(1.3, 0.75, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
v2[1] = v3
v2[2] = CFrame.new(-0.2, 0.75, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
u33["Right Shoulder"] = v2
v2 = {}
v3 = CFrame.new(-0.5, -1, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1)
v2[1] = v3
v2[2] = CFrame.new(0, 1, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1)
u33["Left Hip"] = v2
v2 = {}
v3 = CFrame.new(0.5, -1, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1)
v2[1] = v3
v2[2] = CFrame.new(0, 1, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1)
u33["Right Hip"] = v2
local u179 = {RagdollAttachment = true, RagdollConstraint = true, ColliderPart = true}
local u183 = {}
local v4 = {}
local v5 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
v4[1] = v5
v4[2] = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
u183.Neck = v4
v4 = {}
v5 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
v4[1] = v5
v4[2] = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
u183["Left Shoulder"] = v4
v4 = {}
v5 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
v4[1] = v5
v4[2] = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
u183["Right Shoulder"] = v4
v4 = {}
v5 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
v4[1] = v5
v4[2] = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
u183["Left Hip"] = v4
v4 = {}
v5 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
v4[1] = v5
v4[2] = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
u183["Right Hip"] = v4
v4 = {}
v5 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
v4[1] = v5
v4[2] = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
u183.RootJoint = v4
local u358 = {}
local function scaleCFrame(p1, p2) -- Line: 91
    local v1 = CFrame.new(p1.Position * p2)
    return v1 * (p1 - p1.Position)
end
local function getLimbStumpDelta(p1, p2) -- Line: 108 -- upvalues: u183 (val), scaleCFrame (val)
    local v1 = u183[p1.Name]
    if not v1 then
        return CFrame.identity
    end
    local v2 = scaleCFrame(v1[2], p2)
    return p1.C1 * v2:Inverse()
end
local function getCharacterScale(p1) -- Line: 123
    local v1, v2, v3
    v1, v2 = pcall(function() -- Line: 124 -- upvalues: p1 (val)
        return p1:GetScale()
    end)
    if not v1 then
        v3 = 1
    elseif type(v2) ~= "number" then
        v3 = 1
    else
        v3 = v2
        if not v3 then
            v3 = 1
        end
    end
    return v3
end
local function createColliderPart(p1) -- Line: 131
    if not p1 then
        return
    end
    local Part = Instance.new("Part")
    Part.Name = "ColliderPart"
    Part.Size = p1.Size / 1.7
    Part.Massless = true
    Part.CFrame = p1.CFrame
    Part.Transparency = 1
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = Part
    WeldConstraint.Part1 = p1
    WeldConstraint.Parent = Part
    Part.Parent = p1
end
local function replaceJoints(p1, p2, p3) -- Line: 151 -- upvalues: getCharacterScale (val), u33 (val), getLimbStumpDelta (val), scaleCFrame (val), createColliderPart (val)
    local Attachment, BallSocketConstraint, v1, v2
    local v3 = getCharacterScale(p1)
    for k, v in pairs(p1:GetDescendants()) do
        if v:IsA("Motor6D") and not (v:GetAttribute("Ignore")) and u33[v.Name] then
            v:SetAttribute("RagdollSavedC0", v.C0)
            v:SetAttribute("RagdollSavedC1", v.C1)
            v.Enabled = false
            v2 = getLimbStumpDelta(v, v3)
            v1 = Instance.new("Attachment")
            Attachment = Instance.new("Attachment")
            v1.CFrame = scaleCFrame(u33[v.Name][1], v3)
            Attachment.CFrame = v2 * scaleCFrame(u33[v.Name][2], v3)
            v1.Name = "RagdollAttachment"
            Attachment.Name = "RagdollAttachment"
            createColliderPart(v.Part1)
            BallSocketConstraint = Instance.new("BallSocketConstraint")
            BallSocketConstraint.Attachment0 = v1
            BallSocketConstraint.Attachment1 = Attachment
            BallSocketConstraint.Name = "RagdollConstraint"
            BallSocketConstraint.Radius = v3 * 0.15
            BallSocketConstraint.LimitsEnabled = true
            BallSocketConstraint.TwistLimitsEnabled = false
            BallSocketConstraint.MaxFrictionTorque = 0
            BallSocketConstraint.Restitution = 0
            BallSocketConstraint.UpperAngle = 90
            BallSocketConstraint.TwistLowerAngle = -45
            BallSocketConstraint.TwistUpperAngle = 45
            if v.Name == "Neck" then
                BallSocketConstraint.TwistLimitsEnabled = true
                BallSocketConstraint.UpperAngle = 45
                BallSocketConstraint.TwistLowerAngle = -70
                BallSocketConstraint.TwistUpperAngle = 70
            end
            v1.Parent = v.Part0
            Attachment.Parent = v.Part1
            BallSocketConstraint.Parent = v.Parent
        end
    end
end
local function resetJoints(p1, p2, p3) -- Line: 215 -- upvalues: u179 (val), getCharacterScale (val), scaleCFrame (val), u183 (val)
    local Attribute, Attribute_2, v1
    if p3.Health < 1 then
        return
    end
    for k, v in pairs(p1:GetDescendants()) do
        if u179[v.Name] then
            v:Destroy()
        end
        if v:IsA("Motor6D") then
            v.Enabled = true
            if v.Name ~= "RootJoint" then
                Attribute = v:GetAttribute("RagdollSavedC0")
                Attribute_2 = v:GetAttribute("RagdollSavedC1")
                if typeof(Attribute) == "CFrame" and typeof(Attribute_2) == "CFrame" then
                    v.C0 = Attribute
                    v.C1 = Attribute_2
                    v:SetAttribute("RagdollSavedC0", nil)
                    v:SetAttribute("RagdollSavedC1", nil)
                end
            else
                v1 = getCharacterScale(v2)
                v.C0 = scaleCFrame(u183.RootJoint[1], v1)
                v.C1 = scaleCFrame(u183.RootJoint[2], v1)
            end
        end
    end
end
local function _onClientRagdollAdded(p1) -- Line: 261 -- upvalues: RunService (val), Players (val), replaceJoints (val)
    if not (p1:HasTag("Ragdolled")) or p1:HasTag("Ragdolled_cloned") then
        return
    end
    local v1 = RunService:IsClient()
    if v1 then
        v1 = p1 == Players.LocalPlayer.Character
    end
    local Humanoid = p1:FindFirstChildOfClass("Humanoid")
    local Torso = p1:FindFirstChild("Torso")
    if v1 then
        Humanoid.PlatformStand = true
        Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        replaceJoints(p1, Torso, Humanoid)
    end
end
local function onRagdollEnabled(p1, p2, p3) -- Line: 288 -- upvalues: u358 (val), Profiling (val), replaceJoints (val)
    local u57, v1, v2
    if p3.Sit then
        p3.Sit = false
        p3.Jump = true
        task.defer(function() -- Line: 295 -- upvalues: p3 (val)
            local SeatPart = p3.SeatPart
            if SeatPart and SeatPart:IsA("Seat") and SeatPart.Occupant == p3 then
                p3.Sit = false
                p3:ChangeState(Enum.HumanoidStateType.Freefall)
            end
        end)
    elseif p3.SeatPart == nil then
    end
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        u57, v1, v2 = p3, p1, p2
    else
        local v3
        v1, u57, v2 = p1, p3, p2
        for k, v in pairs(HumanoidRootPart:GetChildren()) do
            if v:IsA("BodyMover") then
                v.Parent = nil
                v3 = u358[v1]
                if not v3 then
                    v3 = {}
                end
                u358[v1] = v3
                table.insert(u358[v1], v)
            end
        end
    end
    u57.AutoRotate = false
    u57:ChangeState(Enum.HumanoidStateType.Physics)
    if not Profiling.IS_USING_CUSTOM_REPLICATION then
        replaceJoints(v1, v2, u57)
    end
    u57.PlatformStand = true
end
local function onRagdollDisabled(p1, p2, p3) -- Line: 343 -- upvalues: resetJoints (val), u183 (val), getCharacterScale (val), scaleCFrame (val), u358 (val)
    p3.AutoRotate = true
    resetJoints(p1, p2, p3)
    p3.PlatformStand = false
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    HumanoidRootPart.Orientation = Vector3.new(0, HumanoidRootPart.Orientation.Y, 0)
    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
    resetJoints(p1, p2, p3)
    local RootJoint = HumanoidRootPart:FindFirstChild("RootJoint")
    if RootJoint and RootJoint:IsA("Motor6D") then
        local RootJoint_2 = u183.RootJoint
        if RootJoint_2 then
            local v1 = getCharacterScale(p1)
            RootJoint.Transform = CFrame.identity
            RootJoint.C0 = scaleCFrame(RootJoint_2[1], v1)
            RootJoint.C1 = scaleCFrame(RootJoint_2[2], v1)
        end
    end
    p3:ChangeState(Enum.HumanoidStateType.GettingUp)
    if u358[p1] then
        for k, v in pairs(u358[p1]) do
            if v and v.Parent and p1 and p1.Parent then
                v.Parent = p1:FindFirstChild("HumanoidRootPart")
            end
        end
    end
end
local function setRagdollEnabled(p1, p2, p3, p4) -- Line: 398 -- upvalues: onRagdollEnabled (val), onRagdollDisabled (val)
    if p1:GetAttribute("Ragdolled") == p4 then
        return
    end
    if not p4 then
        p1:RemoveTag("Ragdolled")
    else
        p1:AddTag("Ragdolled")
    end
    p1:SetAttribute("Ragdolled", p4)
    p1.Humanoid.BreakJointsOnDeath = false
    p1.Humanoid.RequiresNeck = false
    if p4 then
        onRagdollEnabled(p1, p2, p3)
        return
    end
    onRagdollDisabled(p1, p2, p3)
end
local function ragdoll(p1, p2) -- Line: 437 -- upvalues: setRagdollEnabled (val)
    local Torso = p1:FindFirstChild("Torso")
    local Humanoid = p1:FindFirstChildOfClass("Humanoid")
    if not Humanoid or not Torso then
        return
    end
    setRagdollEnabled(p1, Torso, Humanoid, p2)
end
local function isRagdolled(p1) -- Line: 491
    local v1 = p1:GetAttribute("Ragdolled") == true
    return v1
end
return {
    ragdoll = ragdoll,
    clone = function(p1) -- Line: 452 -- upvalues: ragdoll (val)
        p1.Archivable = true
        local v1 = p1:Clone()
        v1:RemoveTag("Alive")
        v1:RemoveTag("Character")
        v1:SetAttribute("network_id", nil)
        p1.Archivable = false
        v1.Parent = p1.Parent
        v1.Name = p1.Name .. "_ragdoll"
        ragdoll(v1, true)
        return v1
    end,
    isRagdolled = isRagdolled,
    syncLimbRagdollAfterMotorRestore = function(p1, p2) -- Line: 502 -- upvalues: isRagdolled (val), u33 (val), getCharacterScale (val), getLimbStumpDelta (val), scaleCFrame (val)
        if not (isRagdolled(p1)) then
            return
        end
        local Part1 = p2.Part1
        local v1 = u33[p2.Name]
        if not Part1 or not v1 then
            return
        end
        local v2 = getCharacterScale(p1)
        local v3 = getLimbStumpDelta(p2, v2)
        if typeof((p2:GetAttribute("RagdollSavedC1"))) == "CFrame" then
            p2:SetAttribute("RagdollSavedC1", p2.C1)
        end
        local RagdollAttachment = Part1:FindFirstChild("RagdollAttachment")
        if RagdollAttachment and RagdollAttachment:IsA("Attachment") then
            RagdollAttachment.CFrame = v3 * scaleCFrame(v1[2], v2)
        end
    end,
}