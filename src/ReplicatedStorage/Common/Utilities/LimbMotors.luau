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
--                  File: ReplicatedStorage.Common.Utilities.LimbMotors
--                               Dumped in 0.00107 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Ragdoll = require(script.Parent:WaitForChild("Ragdoll"))
local u19 = {}
u19["Left Arm"] = "Left Shoulder"
u19["Right Arm"] = "Right Shoulder"
u19["Left Leg"] = "Left Hip"
u19["Right Leg"] = "Right Hip"
local function getRestoredLimbCFrame(p1, p2, p3) -- Line: 76 -- upvalues: u19 (val)
    local Attribute, Part0, Part0_2
    local v1 = u19[p3]
    if not v1 then
        return p2.CFrame
    end
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return p2.CFrame
    end
    local v2 = Torso:FindFirstChild(v1)
    if not v2 then
        return p2.CFrame
    end
    if v2:IsA("Motor6D") then
        Attribute = v2:GetAttribute("DefaultMotorC1")
        if typeof(Attribute) ~= "CFrame" then
            return p2.CFrame
        end
        if v2:IsA("Motor6D") then
            Part0 = v2.Part0
            if Part0 then
                return Part0.CFrame * v2.C0 * Attribute:Inverse()
            end
            return p2.CFrame * v2.C1 * Attribute:Inverse()
        end
        Part0_2 = v2.Part0
        if Part0_2 then
            return Part0_2.CFrame * v2.C0 * Attribute:Inverse()
        end
        return p2.CFrame * v2.C1 * Attribute:Inverse()
    end
    if not (v2:IsA("Motor")) then
        return p2.CFrame
    end
    Attribute = v2:GetAttribute("DefaultMotorC1")
    if typeof(Attribute) ~= "CFrame" then
        return p2.CFrame
    end
    if v2:IsA("Motor6D") then
        Part0 = v2.Part0
        if Part0 then
            return Part0.CFrame * v2.C0 * Attribute:Inverse()
        end
        return p2.CFrame * v2.C1 * Attribute:Inverse()
    end
    Part0_2 = v2.Part0
    if Part0_2 then
        return Part0_2.CFrame * v2.C0 * Attribute:Inverse()
    end
    return p2.CFrame * v2.C1 * Attribute:Inverse()
end
local function getHalfExtentAlongUp(p1) -- Line: 120
    return p1.Y / 2
end
local function getRagdolledLimbFrame(p1) -- Line: 128
    local RagdollAttachment = p1:FindFirstChild("RagdollAttachment")
    if not RagdollAttachment or not (RagdollAttachment:IsA("Attachment")) then
        return p1.CFrame
    end
    local v1 = CFrame.new(RagdollAttachment.WorldPosition)
    return v1 * (p1.CFrame - p1.CFrame.Position)
end
local function getLimbTopWorldPosition(p1, p2, p3) -- Line: 143 -- upvalues: Ragdoll (val), getHalfExtentAlongUp (val)
    if not (Ragdoll.isRagdolled(p1)) then
        return p3.Position + p3.UpVector * getHalfExtentAlongUp(p2.Size)
    end
    local RagdollAttachment = p2:FindFirstChild("RagdollAttachment")
    if not RagdollAttachment then
        return p3.Position + p3.UpVector * getHalfExtentAlongUp(p2.Size)
    end
    if RagdollAttachment:IsA("Attachment") then
        return RagdollAttachment.WorldPosition
    end
    return p3.Position + p3.UpVector * getHalfExtentAlongUp(p2.Size)
end
local function getLimbAttachFrame(p1, p2, p3) -- Line: 160 -- upvalues: Ragdoll (val), getRagdolledLimbFrame (val), getRestoredLimbCFrame (val)
    if Ragdoll.isRagdolled(p1) then
        return getRagdolledLimbFrame(p2)
    end
    return getRestoredLimbCFrame(p1, p2, p3)
end
local function getPartCFrameWithTopFaceAt(p1, p2, p3) -- Line: 174
    local v1 = CFrame.new(p2 - p1.UpVector * p3)
    return v1 * (p1 - p1.Position)
end
return {
    snapshotDefaultMotorC1 = function(p1) -- Line: 27
        if p1:GetAttribute("DefaultMotorC1") == nil then
            p1:SetAttribute("DefaultMotorC1", p1.C1)
        end
    end,
    resetLimbMotorC1 = function(p1, p2) -- Line: 38 -- upvalues: u19 (val), Ragdoll (val)
        local v1 = u19[p2]
        if not v1 then
            return
        end
        local Torso = p1:FindFirstChild("Torso")
        if not Torso then
            return
        end
        local v2 = Torso:FindFirstChild(v1)
        if not v2 then
            return
        end
        local Attribute = v2:GetAttribute("DefaultMotorC1")
        if typeof(Attribute) ~= "CFrame" then
            return
        end
        if v2:IsA("Motor6D") then
            v2.C1 = Attribute
            v2:SetAttribute("DefaultMotorC1", nil)
            Ragdoll.syncLimbRagdollAfterMotorRestore(p1, v2)
            return
        end
        if v2:IsA("Motor") then
            v2.C1 = Attribute
            v2:SetAttribute("DefaultMotorC1", nil)
        end
    end,
    getRestoredLimbCFrame = getRestoredLimbCFrame,
    getLimbAttachFrame = getLimbAttachFrame,
    getRestoredLimbFollowOffset = function(p1, p2, p3, p4) -- Line: 224 -- upvalues: getRestoredLimbCFrame (val)
        local v1
        local v2 = getRestoredLimbCFrame(p1, p2, p3)
        if not p4 then
            v1 = v2
        else
            v1 = v2 * p4
        end
        return p2.CFrame:ToObjectSpace(v1)
    end,
    getFakeLimbFollowOffset = function(p1, p2, p3, p4, p5, p6) -- Line: 195 -- upvalues: getLimbAttachFrame (val), Ragdoll (val), getLimbTopWorldPosition (val), getHalfExtentAlongUp (val), getPartCFrameWithTopFaceAt (val)
        local CFrame
        local v1 = getLimbAttachFrame(p1, p2, p3)
        if not (Ragdoll.isRagdolled(p1)) then
            CFrame = v1
        else
            CFrame = p2.CFrame
        end
        local v2 = getLimbTopWorldPosition(p1, p2, v1)
        local Size = p5
        if not Size then
            Size = p4.Size
        end
        local v3 = getHalfExtentAlongUp(Size)
        local v4 = getPartCFrameWithTopFaceAt(CFrame, v2, v3)
        if p6 then
            v4 = v4 * p6
        end
        return p2.CFrame:ToObjectSpace(v4)
    end,
    weldToLimbWithOffset = function(p1, p2, p3) -- Line: 242
        local v1 = p3
        if not v1 then
            v1 = CFrame.new()
        end
        p2.CFrame = p1.CFrame * v1
        local Weld = Instance.new("Weld")
        Weld.Part0 = p1
        Weld.Part1 = p2
        Weld.C0 = v1
        Weld.C1 = CFrame.new()
        Weld.Parent = p2
        return Weld
    end,
    weldToRestoredLimbPose = function(p1, p2, p3) -- Line: 263
        p2.CFrame = p3
        local Weld = Instance.new("Weld")
        Weld.Part0 = p1
        Weld.Part1 = p2
        Weld.C0 = p1.CFrame:ToObjectSpace(p3)
        Weld.C1 = CFrame.new()
        Weld.Parent = p2
        return Weld
    end,
}