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
--         File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.LimbRegen
--                               Dumped in 0.00165 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local LimbMotors = require(Utilities:WaitForChild("LimbMotors"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local LimbVisuals = require(Utilities_2:WaitForChild("LimbVisuals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local Particles = require(Utilities_3:WaitForChild("Particles"))
local u79 = {"Assets", "Objects", "HealingArm"}
local u83 = {"Assets", "Objects", "Limbs"}
local u87 = {}
u87["Left Leg"] = true
u87["Right Leg"] = true
local function createFakeDecoratedLimb(p1, p2, p3) -- Line: 38 -- upvalues: ReplicatedStorage (val), u83 (val), u87 (val), LimbMotors (val)
    local v1
    local v2 = ReplicatedStorage:WaitForChild(u83[1]):WaitForChild(u83[2]):WaitForChild(u83[3]):FindFirstChild(p3)
    if not v2 or not (v2:IsA("BasePart")) then
        warn((("[LimbRegen] Missing BasePart at Objects.Limbs.%*"):format(p3)))
        return nil, {}
    end
    local Model = Instance.new("Model")
    Model.Name = "FakeLimbRegen"
    Instance.new("Humanoid").Parent = Model
    if not (u87[p3]) then
        local Shirt = Instance.new("Shirt")
        local Shirt_2 = p1:FindFirstChildWhichIsA("Shirt")
        if Shirt_2 then
            Shirt.ShirtTemplate = Shirt_2.ShirtTemplate
        end
        Shirt.Parent = Model
    else
        local Pants = Instance.new("Pants")
        local Pants_2 = p1:FindFirstChildWhichIsA("Pants")
        if Pants_2 then
            Pants.PantsTemplate = Pants_2.PantsTemplate
        end
        Pants.Parent = Model
    end
    local v3 = v2:Clone()
    v3.Name = p3
    v3.Parent = Model
    Model.PrimaryPart = v3
    v3.Color = p2.Color
    for i, j in v3:GetDescendants() do
        if j:IsA("BasePart") then
            j.Color = p2.Color
        end
    end
    local Scale = p1:GetScale()
    if Scale ~= 1 then
        v3.Size = v3.Size * Scale
    end
    Model.Parent = p1
    local Size = v3.Size
    local Attribute = v2:GetAttribute("offset")
    if not Attribute then
        Attribute = v2:GetAttribute("Offset")
    end
    if typeof(Attribute) ~= "CFrame" then
        v1 = nil
    else
        v1 = Attribute
    end
    local v4 = LimbMotors.getFakeLimbFollowOffset(p1, p2, p3, v3, Size, v1)
    v3.Anchored = false
    LimbMotors.weldToLimbWithOffset(p2, v3, v4)
    local v5 = {}
    v5[v3] = {transparency = 0, size = Size}
    v3.Size = v3.Size - Vector3.new(0.2, 0.2, 0.2)
    v3.Transparency = 1
    return Model, v5
end
local function tweenFakeLimbReveal(p1) -- Line: 124 -- upvalues: TweenService (val)
    local v1
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if i.Parent then
            v1 = TweenInfo.new(0.3)
            TweenService:Create(i, v1, {Transparency = j.transparency, Size = j.size}):Play()
        end
    end
end
local function attachHealingArmToLimb(p1, p2, p3, p4) -- Line: 142 -- upvalues: LimbMotors (val)
    local Reference = p1:FindFirstChild("Reference")
    if not Reference or not (Reference:IsA("BasePart")) or not (p1:FindFirstChild("Heal")) then
        return nil
    end
    local v1 = p1:Clone()
    local Scale = p2:GetScale()
    if Scale ~= 1 then
        v1:ScaleTo(Scale)
    end
    v1.Parent = p2
    local v2 = LimbMotors.getLimbAttachFrame(p2, p3, p4)
    local Attribute = v1:GetAttribute("offset")
    if not Attribute then
        Attribute = v1:GetAttribute("Offset")
    end
    if typeof(Attribute) == "CFrame" then
        v2 = v2 * Attribute
    end
    for i, j in v1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = false
        end
    end
    LimbMotors.weldToRestoredLimbPose(p3, v1:WaitForChild("Reference"), v2)
    return v1
end
local function playHealingSequence(p1, p2, p3) -- Line: 187 -- upvalues: Particles (val), TweenService (val), LimbVisuals (val), tweenFakeLimbReveal (val)
    local v1
    local Heal = p1:WaitForChild("Heal")
    local rainbow_start = p1:WaitForChild("rainbow_start")
    local heal_ending = p1:WaitForChild("heal_ending")
    Particles.deepEmitParticles(rainbow_start)
    task.wait(0.08)
    local AnimationController = Heal:FindFirstChildWhichIsA("AnimationController")
    local Animator = AnimationController
    if Animator then
        Animator = AnimationController:FindFirstChildWhichIsA("Animator")
    end
    local Animation = Heal:FindFirstChildWhichIsA("Animation")
    local v2 = Animator
    if v2 then
        v2 = Animation
        if v2 then
            v2 = Animator:LoadAnimation(Animation)
        end
    end
    if v2 then
        v2:Play()
    end
    for i, j in Heal:GetDescendants() do
        if j:IsA("BasePart") and j.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.25)
            TweenService:Create(j, v1, {Transparency = 0}):Play()
        end
    end
    task.wait(LimbVisuals.LIMB_REVEAL_DELAY - 0.08)
    if p2 and next(p3) then
        tweenFakeLimbReveal(p3)
    end
    task.wait(0.3)
    Particles.deepEmitParticles(heal_ending)
    for k, n in Heal:GetDescendants() do
        if n:IsA("BasePart") and n.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.15)
            TweenService:Create(n, v1, {Transparency = 1}):Play()
        end
    end
    task.wait(0.15)
    task.wait(LimbVisuals.SERVER_VISUAL_DELAY)
    if p2 then
        p2:Destroy()
    end
end
return function(p1, p2) -- Line: 247 -- upvalues: ReplicatedStorage (val), u79 (val), attachHealingArmToLimb (val), createFakeDecoratedLimb (val), playHealingSequence (val)
    local u40, u41
    if not p1 or not p2 then
        return
    end
    local v1 = p1:FindFirstChild(p2)
    if not v1 or not (v1:IsA("BasePart")) then
        return
    end
    local v2 = ReplicatedStorage:WaitForChild(u79[1]):WaitForChild(u79[2]):WaitForChild(u79[3])
    if not (v2:IsA("Model")) then
        return
    end
    local u35 = attachHealingArmToLimb(v2, p1, v1, p2)
    if not u35 then
        return
    end
    u40, u41 = createFakeDecoratedLimb(p1, v1, p2)
    task.spawn(function() -- Line: 271 -- upvalues: playHealingSequence (upval), u35 (val), u40 (val), u41 (val)
        playHealingSequence(u35, u40, u41)
        u35:Destroy()
    end)
end