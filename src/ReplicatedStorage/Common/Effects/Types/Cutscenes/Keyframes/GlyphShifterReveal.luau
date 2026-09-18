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
--  File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.GlyphShifterReveal
--                              Dumped in 0.000873 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local function onHandleEmitKeyframe(p1, p2) -- Line: 24 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function onSwapArmForBrokenArm(p1) -- Line: 38
    local NPC1Animation = p1:FindFirstChild("NPC1Animation", true)
    if not NPC1Animation then
        return
    end
    local BrokenArm = NPC1Animation:FindFirstChild("BrokenArm")
    local v1 = NPC1Animation:FindFirstChild("Left Arm")
    if not BrokenArm or not v1 then
        return
    end
    v1.Transparency = 1
    for i, j in BrokenArm:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
end
local function onBeginHealing(p1) -- Line: 64 -- upvalues: Particles (val), TweenService (val)
    local v1
    local NPC1Animation = p1:FindFirstChild("NPC1Animation", true)
    if not NPC1Animation then
        return
    end
    local BrokenArm = NPC1Animation:FindFirstChild("BrokenArm")
    local HealingArm = NPC1Animation:FindFirstChild("HealingArm")
    local v2 = NPC1Animation:FindFirstChild("Left Arm")
    local rainbow_start = HealingArm:WaitForChild("rainbow_start")
    local heal_ending = HealingArm:WaitForChild("heal_ending")
    local Heal = HealingArm:WaitForChild("Heal")
    local AnimationController = Heal:FindFirstChildWhichIsA("AnimationController")
    local Animator = AnimationController
    if Animator then
        Animator = AnimationController:WaitForChild("Animator")
    end
    if not Animator then
        return
    end
    local Heal_2 = HealingArm:WaitForChild("Heal")
    local v3 = Animator:LoadAnimation((Heal_2:FindFirstChildWhichIsA("Animation")))
    Particles.deepEmitParticles(rainbow_start)
    task.wait(0.08)
    v3:Play()
    v2.Size = v2.Size - Vector3.new(0.2, 0.2, 0.2)
    for i, j in HealingArm:WaitForChild("Heal"):GetDescendants() do
        if j:IsA("BasePart") and j.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.25)
            TweenService:Create(j, v1, {Transparency = 0}):Play()
        end
    end
    task.wait(0.55)
    local v4 = TweenInfo.new(0.3)
    TweenService:Create(v2, v4, {Transparency = 0, Size = v2.Size}):Play()
    task.wait(0.3)
    Particles.deepEmitParticles(heal_ending)
    for k, n in HealingArm:WaitForChild("Heal"):GetDescendants() do
        if n:IsA("BasePart") and n.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.15)
            TweenService:Create(n, v1, {Transparency = 1}):Play()
        end
    end
    for m, i5 in BrokenArm:GetChildren() do
        if i5:IsA("BasePart") then
            i5.Transparency = 1
        end
    end
end
local function onSetSabreVisibile(p1) -- Line: 136
    local GroundSabre = p1:FindFirstChild("GroundSabre", true)
    if not GroundSabre then
        return
    end
    for i, j in GroundSabre:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
end
return function(p1, p2) -- Line: 151 -- upvalues: onHandleEmitKeyframe (val), onSwapArmForBrokenArm (val), onBeginHealing (val), Signals (val), onSetSabreVisibile (val)
    local v1 = string.split(p1, "_")
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
    if p1 == "Emit_UpwardSlash" then
        onSwapArmForBrokenArm(p2)
        return
    end
    if p1 == "SteamHeal" then
        onBeginHealing(p2)
        return
    end
    if p1 == "Saturation_3" then
        Signals.Anxiety:Fire(70)
        return
    end
    if p1 == "NPC1DropSabre" then
        onSetSabreVisibile(p2)
    end
end