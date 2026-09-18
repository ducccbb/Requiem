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
--            File: ReplicatedStorage.Common.Utilities.ChronoRagdoll.RigTypes
--                              Dumped in 0.000622 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local u13 = {UpperAngle = 30, TwistLowerAngle = -60, TwistUpperAngle = 60}
local u14 = {UpperAngle = 90, TwistLowerAngle = -30, TwistUpperAngle = 175}
local u15 = {UpperAngle = 60, TwistLowerAngle = -5, TwistUpperAngle = 120}
local function attachment(p1, p2, p3) -- Line: 35
    return function(a1, a2) -- Line: 36 -- upvalues: p2 (val), p1 (val), p3 (val)
        local v1 = a1:FindFirstChild(p2)
        if not v1 then
            return
        end
        local v2 = v1:FindFirstChild(p1)
        if v2 then
            assert(v2:IsA("Attachment"))
            if p3 then
                v2.Position = p3 * a2
            end
            return v2
        end
        local Attachment = Instance.new("Attachment")
        if p3 then
            Attachment.Position = p3 * a2
        end
        Attachment.Name = p1
        Attachment.Parent = v1
        return Attachment
    end
end
local u17 = {
    rightLeg = attachment("RagdollRightLegAttachment", "Right Leg", (Vector3.new(0, 1, 0))),
    leftLeg = attachment("RagdollLeftLegAttachment", "Left Leg", (Vector3.new(0, 1, 0))),
    torsoLeft = attachment("RagdollTorsoLeftAttachment", "Torso", (Vector3.new(-0.5, -1, 0))),
    torsoRight = attachment("RagdollTorsoRightAttachment", "Torso", (Vector3.new(0.5, -1, 0))),
    head = attachment("RagdollHeadAttachment", "Head", (Vector3.new(0, -0.5, 0))),
    leftArm = attachment("RagdollLeftArmAttachment", "Left Arm", (Vector3.new(0.5, 1, 0))),
    rightArm = attachment("RagdollRightArmAttachment", "Right Arm", (Vector3.new(-0.5, 1, 0))),
    neck = attachment("NeckAttachment", "Torso"),
    leftCollar = attachment("LeftCollarAttachment", "Torso"),
    rightCollar = attachment("RightCollarAttachment", "Torso"),
}
function v1.GetAttachments(p1, p2) -- Line: 75 -- upvalues: u17 (val), u13 (val), u14 (val), u15 (val)
    local function ballSocket(p1, p2, p3) -- Line: 76
        if not p1 then
            return nil
        end
        if p2 then
            return {a0 = p1, a1 = p2, limits = p3}
        end
        return nil
    end
    local v1 = {}
    local v2 = u17.neck(p1, p2)
    local v3 = u17.head(p1, p2)
    v1.Head = ballSocket(v2, v3, u13)
    v2 = u17.leftCollar(p1, p2)
    v3 = u17.leftArm(p1, p2)
    v1["Left Arm"] = ballSocket(v2, v3, u14)
    v2 = u17.rightCollar(p1, p2)
    v3 = u17.rightArm(p1, p2)
    v1["Right Arm"] = ballSocket(v2, v3, u14)
    v2 = u17.torsoLeft(p1, p2)
    v3 = u17.leftLeg(p1, p2)
    v1["Left Leg"] = ballSocket(v2, v3, u15)
    v2 = u17.torsoRight(p1, p2)
    v3 = u17.rightLeg(p1, p2)
    v1["Right Leg"] = ballSocket(v2, v3, u15)
    return v1
end
function v1.GetNoCollisions(p1) -- Line: 117
    local u1 = {}
    local function addPair(a1, p2) -- Line: 120 -- upvalues: p1 (val), u1 (val)
        local v1 = p1:FindFirstChild(a1)
        local v2 = p1:FindFirstChild(p2)
        if v1 and v2 and v1:IsA("BasePart") and v2:IsA("BasePart") then
            table.insert(u1, {part1 = v1, part2 = v2})
        end
    end
    addPair("Head", "Torso")
    addPair("Left Arm", "Torso")
    addPair("Right Arm", "Torso")
    addPair("Left Leg", "Torso")
    addPair("Right Leg", "Torso")
    addPair("Left Leg", "Right Leg")
    return u1
end
return v1