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
--              File: ReplicatedStorage.Common.Utilities.R6DirectionTracker
--                              Dumped in 0.000857 seconds
--                          Bytecode version 9  |  11 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local u12 = {}
local function captureMotor(p1) -- Line: 14 -- upvalues: u12 (val)
    if not (u12[p1]) then
        u12[p1] = p1.C0
    end
end
local function calculateGoalCFrame(p1, p2, p3) -- Line: 20
    local v1 = CFrame.lookAt(p2, p3, Vector3.yAxis)
    return p1:Inverse() * v1
end
local function clampRotation(p1, p2, p3, p4, p5, p6, p7) -- Line: 25
    local v1, v2, v3
    v1, v2, v3 = p1:ToOrientation()
    local v4 = math.clamp(v1, p2, p3)
    local v5 = math.clamp(v2, p4, p5)
    return CFrame.fromOrientation(v4, v5, (math.clamp(v3, p6, p7)))
end
local function applyRotationFromInitial(p1, p2, p3) -- Line: 42
    p1.Transform = CFrame.identity
    local v1 = p1.C0 - p2.Position
    local v2 = (p2 - p2.Position):Lerp(p3 - p3.Position, 1)
    local v3 = CFrame.new(p2.Position)
    p1.C0 = v3 * v1:Lerp(v2, 0.15)
end
local function captureR6Motors(p1) -- Line: 53 -- upvalues: captureMotor (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    local Torso = p1:FindFirstChild("Torso")
    if not HumanoidRootPart or not Torso then
        return nil, nil
    end
    local RootJoint = HumanoidRootPart:FindFirstChild("RootJoint")
    local Neck = Torso:FindFirstChild("Neck")
    if not RootJoint or not Neck or not RootJoint.Part0 or not Neck.Part0 then
        return nil, nil
    end
    captureMotor(RootJoint)
    captureMotor(Neck)
    return RootJoint, Neck
end
local function clearR6State(p1) -- Line: 72 -- upvalues: u12 (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    local Torso = p1:FindFirstChild("Torso")
    if HumanoidRootPart then
        local RootJoint = HumanoidRootPart:FindFirstChild("RootJoint")
        if RootJoint then
            u12[RootJoint] = nil
        end
    end
    if Torso then
        local Neck = Torso:FindFirstChild("Neck")
        if Neck then
            u12[Neck] = nil
        end
    end
end
local function getTorsoYaw(p1, p2, p3) -- Line: 110
    local v1 = p3 - p2
    local v2 = Vector3.new(v1.X, 0, v1.Z)
    if v2.Magnitude < 0.001 then
        return 0
    end
    local v3 = p1:VectorToObjectSpace(v2.Unit)
    local v4 = math.atan2(v3.X, -v3.Z)
    local v5 = math.rad(-25)
    return (math.clamp(v4, v5, (math.rad(25))))
end
v1 = {
    captureR6C0s = function(p1) -- Line: 160 -- upvalues: captureR6Motors (val)
        captureR6Motors(p1)
    end,
    clearR6State = clearR6State,
}
function v1.faceR6RigToVector(p1, p2) -- Line: 125 -- upvalues: captureR6Motors (val), u12 (val), getTorsoYaw (val), calculateGoalCFrame (val), clampRotation (val), applyRotationFromInitial (val)
    local v1, v2, v3, v4, v5
    v4, v5 = captureR6Motors(p2)
    if not v4 or not v5 then
        return
    end
    local Part0 = v5.Part0
    local Part0_2 = v4.Part0
    local v6 = u12[v4]
    local v7 = u12[v5]
    v4.Transform = CFrame.identity
    v5.Transform = CFrame.identity
    local v8 = getTorsoYaw(Part0_2.CFrame, (Part0_2.CFrame * v6).Position, p1)
    v1, v2, v3 = v6:ToOrientation()
    local v9 = CFrame.new(v6.Position)
    local v10 = v9 * CFrame.fromOrientation(v1, v2 + v8, v3)
    v4.C0 = v4.C0:Lerp(v10, 0.15)
    local v11 = calculateGoalCFrame(Part0.CFrame, (Part0.CFrame * v7).Position, p1)
    local v12 = math.rad(-45)
    local v13 = math.rad(45)
    local v14 = math.rad(-45)
    local v15 = math.rad(45)
    local v16 = math.rad(-45)
    local v17 = clampRotation(v11, v12, v13, v14, v15, v16, (math.rad(45)))
    applyRotationFromInitial(v5, v7, v17)
end
function v1.restoreR6C0s(p1) -- Line: 89 -- upvalues: captureR6Motors (val), clearR6State (val), u12 (val)
    local v1, v2
    v1, v2 = captureR6Motors(p1)
    if not v1 or not v2 then
        clearR6State(p1)
        return
    end
    v1.Transform = CFrame.identity
    v2.Transform = CFrame.identity
    if u12[v1] then
        v1.C0 = u12[v1]
    end
    if u12[v2] then
        v2.C0 = u12[v2]
    end
    clearR6State(p1)
end
return v1