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
--                 File: ReplicatedStorage.Common.Utilities.LimbVisuals
--                              Dumped in 0.000676 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local LimbMotors = require(script.Parent:WaitForChild("LimbMotors"))
local u19 = {}
u19["Left Arm"] = Enum.BodyPart.LeftArm
u19["Right Arm"] = Enum.BodyPart.RightArm
u19["Left Leg"] = Enum.BodyPart.LeftLeg
u19["Right Leg"] = Enum.BodyPart.RightLeg
local function lostLimbAttributeName(p1) -- Line: 36
    return "LostLimb_" .. string.gsub(p1, "%s+", "_")
end
local function removeBandageVisuals(p1, p2) -- Line: 45
    local v1 = p1
    for i, j in p2:GetChildren() do
        if j:IsA("WeldConstraint") and j.Part0 and j.Part0.Name == "Bandage" then
            if j.Part0.Parent == v1 then
                j.Part0:Destroy()
            end
            j:Destroy()
        end
    end
end
local function removeCutBloodForLimb(p1, p2) -- Line: 62
    local v1 = p1
    for i, j in p2:GetChildren() do
        if j:IsA("WeldConstraint") and j.Part0 and j.Part0.Name == "CutBlood" then
            if j.Part0.Parent == v1 then
                j.Part0:Destroy()
            end
            j:Destroy()
        end
    end
end
local function removeCutMeshesForLimb(p1, p2) -- Line: 79
    for i, j in p1:GetChildren() do
        if j:GetAttribute("CutLimb") == p2 then
            j:Destroy()
        end
    end
end
return {
    LIMB_REVEAL_DELAY = 0.63,
    LIMB_HEAL_SEQUENCE_DURATION = 1.08,
    SERVER_VISUAL_DELAY = 0.2,
    restoreLimbVisuals = function(p1, p2) -- Line: 92 -- upvalues: removeBandageVisuals (val), removeCutBloodForLimb (val), removeCutMeshesForLimb (val), lostLimbAttributeName (val), u19 (val), LimbMotors (val)
        local v1 = p1:FindFirstChild(p2)
        if not v1 then
            return
        end
        removeBandageVisuals(p1, v1)
        removeCutBloodForLimb(p1, v1)
        local v2 = v1:FindFirstChild(p2)
        if v2 and v2:IsA("Model") then
            v2:Destroy()
        end
        removeCutMeshesForLimb(p1, p2)
        local v3 = lostLimbAttributeName(p2)
        p1:SetAttribute(v3, nil)
        local v4 = u19[p2]
        if v4 then
            for i, j in p1:GetChildren() do
                if j:IsA("CharacterMesh") and j.BodyPart == v4 then
                    j:Destroy()
                end
            end
            LimbMotors.resetLimbMotorC1(p1, p2)
        end
        v1.Transparency = 0
    end,
}