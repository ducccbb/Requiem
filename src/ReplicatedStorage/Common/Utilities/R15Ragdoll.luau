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
--                  File: ReplicatedStorage.Common.Utilities.R15Ragdoll
--                              Dumped in 0.000468 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    LeftAnkle = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 15, LowerAngle = -45},
    },
    RightAnkle = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 15, LowerAngle = -45},
    },
    LeftKnee = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = -75},
    },
    RightKnee = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = -75},
    },
    LeftHip = {"BallSocket"},
    RightHip = {"BallSocket"},
    Waist = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = 0},
    },
    LeftShoulder = {"BallSocket"},
    RightShoulder = {"BallSocket"},
    LeftElbow = {"BallSocket"},
    RightElbow = {"BallSocket"},
    LeftWrist = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = 0},
    },
    RightWrist = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = 0},
    },
    Neck = {
        "Hinge",
        Properties = {LimitsEnabled = true, UpperAngle = 0, LowerAngle = 0},
    },
}
return {
    ragdoll = function(p1) -- Line: 90 -- upvalues: u12 (val)
        local v1, v2, v3, v4
        local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            HumanoidRootPart.Anchored = true
            HumanoidRootPart.CanCollide = false
            HumanoidRootPart:BreakJoints()
        end
        for k, v in pairs(p1:GetDescendants()) do
            v2 = u12[v.Name]
            if not (v:IsA("Motor6D")) then
                if v:IsA("Attachment") then
                    v.Axis = Vector3.new(0, 1, 0)
                    v.SecondaryAxis = Vector3.new(0, 0, 1)
                    v.Rotation = Vector3.new(0, 0, 0)
                end
            elseif v2 then
                v3 = Instance.new(v2[1] .. "Constraint")
                v4 = v.Parent:FindFirstChild(v.Name .. "Attachment")
                if not v4 then
                    v4 = v.Parent:FindFirstChild(v.Name .. "RigAttachment")
                end
                v1 = v.Part0:FindFirstChild(v.Name .. "Attachment")
                if not v1 then
                    v1 = v.Part0:FindFirstChild(v.Name .. "RigAttachment")
                end
                if v2.Properties then
                    for k2, i in pairs(v2.Properties) do
                        v3[k2] = i
                    end
                end
                if v4 and v1 then
                    v3.Attachment0 = v4
                    v3.Attachment1 = v1
                    v3.Parent = v.Parent
                    v:Destroy()
                end
            end
        end
    end,
}