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
--             File: ReplicatedStorage.Common.Utilities.R15DirectionTracker
--                              Dumped in 0.000634 seconds
--                          Bytecode version 9  |  6 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local TweenService = game:GetService("TweenService")
local u17 = {}
local function calculateGoalCFrame(p1, p2, p3) -- Line: 14
    local v1 = CFrame.lookAt(p1.Position, p2, p3)
    return p1:Inverse() * v1
end
local function clampRotation(p1, p2, p3, p4, p5, p6, p7) -- Line: 20
    local v1, v2, v3
    v1, v2, v3 = p1:ToOrientation()
    local v4 = math.clamp(v1, p2, p3)
    local v5 = math.clamp(v2, p4, p5)
    local v6 = math.clamp(v3, p6, p7)
    return CFrame.fromOrientation(v4, v5, v6)
end
local function applyRotation(p1, p2, p3) -- Line: 36
    local v1 = (p1.C0 - p1.C0.Position):Lerp(p2 - p2.Position, p3)
    p1.C0 = CFrame.new(p1.C0.Position) * v1
end
v1 = {}
function v1.faceR15RigToVector(p1, p2) -- Line: 68 -- upvalues: u17 (val), calculateGoalCFrame (val), clampRotation (val), applyRotation (val)
    local UpperTorso = p2:WaitForChild("UpperTorso")
    local Head = p2:WaitForChild("Head")
    local Waist = UpperTorso:WaitForChild("Waist")
    local Neck = Head:WaitForChild("Neck")
    if not Waist.Part0 or not Neck.Part0 then
        return
    end
    if not (u17[Waist]) then
        u17[Waist] = Waist.C0
    end
    if not (u17[Neck]) then
        u17[Neck] = Neck.C0
    end
    local v1 = calculateGoalCFrame(Waist.Part0.CFrame, p1, (Vector3.new(0, 1, 0)))
    local v2 = math.rad(-25)
    local v3 = math.rad(25)
    local v4 = math.rad(-25)
    local v5 = math.rad(25)
    local v6 = math.rad(-25)
    local v7 = clampRotation(v1, v2, v3, v4, v5, v6, (math.rad(25)))
    applyRotation(Waist, v7, 0.05)
    v3 = p1 + Vector3.new(0, -15, 0)
    local v8 = calculateGoalCFrame(Neck.Part0.CFrame, v3, (Vector3.new(0, 1, 0)))
    v4 = math.rad(-40)
    v5 = math.rad(40)
    v6 = math.rad(-40)
    local v9 = math.rad(40)
    local v10 = math.rad(-40)
    v2 = clampRotation(v8, v4, v5, v6, v9, v10, (math.rad(40)))
    applyRotation(Neck, v2, 0.05)
end
function v1.restoreR15C0s(p1) -- Line: 44 -- upvalues: u17 (val), TweenService (val)
    local v1
    local UpperTorso = p1:WaitForChild("UpperTorso")
    local Head = p1:WaitForChild("Head")
    local Waist = UpperTorso:FindFirstChild("Waist")
    local Neck = Head:FindFirstChild("Neck")
    if not Waist or not Neck or not Waist.Part0 or not Neck.Part0 then
        return
    end
    if u17[Waist] then
        v1 = TweenInfo.new(1.5)
        TweenService:Create(Waist, v1, {C0 = u17[Waist]}):Play()
    end
    if u17[Neck] then
        v1 = TweenInfo.new(1.5)
        TweenService:Create(Neck, v1, {C0 = u17[Neck]}):Play()
    end
end
return v1