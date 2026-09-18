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
--  File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.AwakeningZWaleed1
--                              Dumped in 0.000887 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Enchantments = v1.Parent.Parent.Parent:WaitForChild("Enchantments")
local Flow = require(Enchantments:WaitForChild("Flow"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Saturation = require(Universal:WaitForChild("Saturation"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local function onHandleBeamKeyframe(p1, p2, p3, p4) -- Line: 29 -- upvalues: TweenService (val)
    local v1
    if p2 ~= "Left" then
        v1 = "RightBeam"
    else
        v1 = "LeftBeam"
    end
    local v2 = p1.NPC1Animation:FindFirstChild(v1)
    if not v2 then
        return
    end
    local v3 = p1:FindFirstChild(p3, true)
    if not v3 then
        return
    end
    v2.Attachment1 = v3:FindFirstChild("Attachment")
    if p4 then
        v2.CurveSize0 = 20
        v2.CurveSize1 = -20
        local v4 = TweenInfo.new(0.3, Enum.EasingStyle.Back)
        TweenService:Create(v2, v4, {CurveSize0 = 0, CurveSize1 = 0}):Play()
    end
    v2.Enabled = p4
end
local function onHandleImpactFrame(p1, p2) -- Line: 61 -- upvalues: Lighting (val), TweenService (val)
    local NPC1Animation = p1.NPC1Animation
    local v1 = p1:FindFirstChild(p2)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight.Adornee = NPC1Animation
    Highlight.Parent = NPC1Animation
    local Highlight_2 = Instance.new("Highlight")
    Highlight_2.FillTransparency = 1
    Highlight_2.OutlineTransparency = 1
    Highlight_2.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight_2.Adornee = v1
    Highlight_2.Parent = v1
    local v2 = TweenInfo.new(0.05)
    TweenService:Create(ColorCorrectionEffect, v2, {Saturation = -1, Brightness = -1, Contrast = 1, TintColor = Color3.fromRGB(0, 0, 0)}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight, v2, {FillTransparency = 0}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight_2, v2, {FillTransparency = 0}):Play()
    task.wait(0.05)
    v2 = TweenInfo.new(0.05)
    TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 1, Brightness = 1, Contrast = -1, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight, v2, {FillTransparency = 1, FillColor = Color3.fromRGB(0, 0, 0)}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight_2, v2, {FillTransparency = 1, FillColor = Color3.fromRGB(0, 0, 0)}):Play()
    task.wait(0.05)
    v2 = TweenInfo.new(0.05)
    TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 0, Brightness = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight, v2, {FillTransparency = 1}):Play()
    v2 = TweenInfo.new(0.05)
    TweenService:Create(Highlight_2, v2, {FillTransparency = 1}):Play()
    task.wait(0.05)
    ColorCorrectionEffect:Destroy()
    Highlight:Destroy()
    Highlight_2:Destroy()
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 147 -- upvalues: Particles (val), Saturation (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
    Saturation(0.7)
end
local function onActivateFlow(p1) -- Line: 163 -- upvalues: Flow (val), Signals (val)
    Flow(p1.NPC1Animation, true)
    Signals.Bars:Fire(0.35, -2)
end
return function(p1, p2) -- Line: 172 -- upvalues: onHandleBeamKeyframe (val), onHandleEmitKeyframe (val), onHandleImpactFrame (val), onActivateFlow (val)
    local v1 = string.split(p1, "_")
    if v1[1] == "Beam" then
        local v2 = v1[4] == "on"
        onHandleBeamKeyframe(p2, v1[2], v1[3], v2)
    elseif v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    elseif v1[1] == "Impact" then
        onHandleImpactFrame(p2, v1[2])
    end
    if p1 == "Flow" then
        onActivateFlow(p2)
    end
end