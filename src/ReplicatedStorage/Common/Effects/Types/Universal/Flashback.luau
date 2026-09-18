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
--           File: ReplicatedStorage.Common.Effects.Types.Universal.Flashback
--                               Dumped in 0.00205 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Screen = require(script.Parent.Parent.Parent:WaitForChild("Screen"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u84 = {Brightness = -0.15, Contrast = -0.12, Saturation = -1, TintColor = Color3.fromRGB(152, 170, 217)}
local u90 = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}
local u96 = {Intensity = 5, Size = 15, Threshold = 0.9}
local u97 = {Intensity = 0, Size = 0, Threshold = 1}
local u98 = nil
local u99 = nil
local u100 = nil
local u101 = nil
local u102 = nil
local u103 = false
local function fadeInLoopedSound(p1, p2) -- Line: 73 -- upvalues: Sounds (val), TweenService (val)
    local v1 = Sounds.createSoundFromId(p1)
    v1.Looped = true
    v1.Volume = 0
    if not v1.IsLoaded then
        v1.Loaded:Wait()
    end
    v1:Play()
    local v2 = TweenInfo.new(0.5)
    TweenService:Create(v1, v2, {Volume = p2}):Play()
    return v1
end
local function fadeOutSound(p1) -- Line: 91 -- upvalues: TweenService (val)
    if not p1 then
        return
    end
    local v1 = TweenInfo.new(0.5)
    TweenService:Create(p1, v1, {Volume = 0}):Play()
    task.delay(0.5, function() -- Line: 102 -- upvalues: p1 (val)
        p1:Stop()
        p1:Destroy()
    end)
end
local function getOrCreateColorCorrection() -- Line: 113 -- upvalues: u98 (ref), Lighting (val)
    local ColorCorrectionEffect, FlashbackColorCorrection
    if not u98 then
        FlashbackColorCorrection = Lighting:FindFirstChild("FlashbackColorCorrection")
        if FlashbackColorCorrection then
            if FlashbackColorCorrection:IsA("ColorCorrectionEffect") then
                u98 = FlashbackColorCorrection
                return FlashbackColorCorrection
            end
            ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Name = "FlashbackColorCorrection"
            ColorCorrectionEffect.Parent = Lighting
            u98 = ColorCorrectionEffect
            return ColorCorrectionEffect
        end
        ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "FlashbackColorCorrection"
        ColorCorrectionEffect.Parent = Lighting
        u98 = ColorCorrectionEffect
        return ColorCorrectionEffect
    end
    if u98.Parent then
        return u98
    end
    FlashbackColorCorrection = Lighting:FindFirstChild("FlashbackColorCorrection")
    if not FlashbackColorCorrection then
        ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "FlashbackColorCorrection"
        ColorCorrectionEffect.Parent = Lighting
        u98 = ColorCorrectionEffect
        return ColorCorrectionEffect
    end
    if FlashbackColorCorrection:IsA("ColorCorrectionEffect") then
        u98 = FlashbackColorCorrection
        return FlashbackColorCorrection
    end
    ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "FlashbackColorCorrection"
    ColorCorrectionEffect.Parent = Lighting
    u98 = ColorCorrectionEffect
    return ColorCorrectionEffect
end
local function getOrCreateBlur() -- Line: 135 -- upvalues: u99 (ref), Lighting (val)
    local BlurEffect, FlashbackBlur
    if not u99 then
        FlashbackBlur = Lighting:FindFirstChild("FlashbackBlur")
        if FlashbackBlur then
            if FlashbackBlur:IsA("BlurEffect") then
                u99 = FlashbackBlur
                return FlashbackBlur
            end
            BlurEffect = Instance.new("BlurEffect")
            BlurEffect.Name = "FlashbackBlur"
            BlurEffect.Size = 0
            BlurEffect.Parent = Lighting
            u99 = BlurEffect
            return BlurEffect
        end
        BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "FlashbackBlur"
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        u99 = BlurEffect
        return BlurEffect
    end
    if u99.Parent then
        return u99
    end
    FlashbackBlur = Lighting:FindFirstChild("FlashbackBlur")
    if not FlashbackBlur then
        BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "FlashbackBlur"
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        u99 = BlurEffect
        return BlurEffect
    end
    if FlashbackBlur:IsA("BlurEffect") then
        u99 = FlashbackBlur
        return FlashbackBlur
    end
    BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Name = "FlashbackBlur"
    BlurEffect.Size = 0
    BlurEffect.Parent = Lighting
    u99 = BlurEffect
    return BlurEffect
end
local function getOrCreateBloom() -- Line: 158 -- upvalues: u100 (ref), Lighting (val), u97 (val)
    local BloomEffect, FlashbackBloom
    if not u100 then
        FlashbackBloom = Lighting:FindFirstChild("FlashbackBloom")
        if FlashbackBloom then
            if FlashbackBloom:IsA("BloomEffect") then
                u100 = FlashbackBloom
                return FlashbackBloom
            end
            BloomEffect = Instance.new("BloomEffect")
            BloomEffect.Name = "FlashbackBloom"
            BloomEffect.Intensity = u97.Intensity
            BloomEffect.Size = u97.Size
            BloomEffect.Threshold = u97.Threshold
            BloomEffect.Parent = Lighting
            u100 = BloomEffect
            return BloomEffect
        end
        BloomEffect = Instance.new("BloomEffect")
        BloomEffect.Name = "FlashbackBloom"
        BloomEffect.Intensity = u97.Intensity
        BloomEffect.Size = u97.Size
        BloomEffect.Threshold = u97.Threshold
        BloomEffect.Parent = Lighting
        u100 = BloomEffect
        return BloomEffect
    end
    if u100.Parent then
        return u100
    end
    FlashbackBloom = Lighting:FindFirstChild("FlashbackBloom")
    if not FlashbackBloom then
        BloomEffect = Instance.new("BloomEffect")
        BloomEffect.Name = "FlashbackBloom"
        BloomEffect.Intensity = u97.Intensity
        BloomEffect.Size = u97.Size
        BloomEffect.Threshold = u97.Threshold
        BloomEffect.Parent = Lighting
        u100 = BloomEffect
        return BloomEffect
    end
    if FlashbackBloom:IsA("BloomEffect") then
        u100 = FlashbackBloom
        return FlashbackBloom
    end
    BloomEffect = Instance.new("BloomEffect")
    BloomEffect.Name = "FlashbackBloom"
    BloomEffect.Intensity = u97.Intensity
    BloomEffect.Size = u97.Size
    BloomEffect.Threshold = u97.Threshold
    BloomEffect.Parent = Lighting
    u100 = BloomEffect
    return BloomEffect
end
local function activateFlashback() -- Line: 183 -- upvalues: u103 (ref), getOrCreateColorCorrection (val), getOrCreateBlur (val), getOrCreateBloom (val), TweenService (val), u84 (val), u96 (val), u101 (ref), fadeInLoopedSound (val), Universal (val), u102 (ref), Screen (val), Signals (val)
    if u103 then
        return
    end
    u103 = true
    local v1 = TweenInfo.new(0.6)
    TweenService:Create(getOrCreateColorCorrection(), v1, u84):Play()
    v1 = TweenInfo.new(0.6)
    TweenService:Create(getOrCreateBlur(), v1, {Size = 3}):Play()
    v1 = TweenInfo.new(0.6)
    TweenService:Create(getOrCreateBloom(), v1, u96):Play()
    task.spawn(function() -- Line: 198 -- upvalues: u101 (upval), fadeInLoopedSound (upval), Universal (upval)
        u101 = fadeInLoopedSound(Universal.Flashback, 1)
    end)
    task.spawn(function() -- Line: 202 -- upvalues: u102 (upval), fadeInLoopedSound (upval), Universal (upval)
        u102 = fadeInLoopedSound(Universal.SlowHeartbeat, 5)
    end)
    Screen.__createClientScreenEffect({name = "Normal", scale = 0.8, timescale = 0.1, color = Color3.fromRGB(255, 255, 255)})
    Signals.Flashback:Fire(true)
end
local function deactivateFlashback() -- Line: 219 -- upvalues: u103 (ref), u98 (ref), u99 (ref), u100 (ref), TweenService (val), u90 (val), u97 (val), fadeOutSound (val), u101 (ref), u102 (ref), Screen (val), Signals (val)
    local v1
    if not u103 then
        return
    end
    u103 = false
    local v2 = u98
    local v3 = u99
    local v4 = u100
    if v2 and v2.Parent then
        v1 = TweenInfo.new(0.6)
        TweenService:Create(v2, v1, u90):Play()
    end
    if v3 and v3.Parent then
        v1 = TweenInfo.new(0.6)
        TweenService:Create(v3, v1, {Size = 0}):Play()
    end
    if v4 and v4.Parent then
        v1 = TweenInfo.new(0.6)
        TweenService:Create(v4, v1, u97):Play()
    end
    fadeOutSound(u101)
    fadeOutSound(u102)
    u101 = nil
    u102 = nil
    Screen.__removeClientScreenEffect("Normal")
    Signals.Flashback:Fire(false)
end
return function(p1) -- Line: 257 -- upvalues: activateFlashback (val), deactivateFlashback (val)
    print("Flashback", p1)
    if p1 then
        activateFlashback()
        return
    end
    deactivateFlashback()
end