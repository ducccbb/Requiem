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
--    File: ReplicatedStorage.Common.Effects.Types.Enchantments.Skullbound.Skullbound
--                              Dumped in 0.000860 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Enchantments = require(Sounds_2:WaitForChild("Enchantments"))
local u65 = nil
local u66 = 0
local function clearActiveEffect() -- Line: 27 -- upvalues: u65 (ref), u66 (ref), TweenService (val)
    local v1
    if not u65 then
        return
    end
    u66 = u66 + 1
    local v2 = u65
    u65 = nil
    local colorCorrection = v2.colorCorrection
    local highlight = v2.highlight
    if colorCorrection.Parent then
        v1 = TweenInfo.new(0.5)
        TweenService:Create(colorCorrection, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    end
    if highlight.Parent then
        v1 = TweenInfo.new(0.5)
        TweenService:Create(highlight, v1, {FillTransparency = 1}):Play()
    end
    task.delay(0.5, function() -- Line: 55 -- upvalues: colorCorrection (val), highlight (val)
        colorCorrection:Destroy()
        highlight:Destroy()
    end)
end
return function(p1) -- Line: 63 -- upvalues: clearActiveEffect (val), Players (val), u66 (ref), Lighting (val), u65 (ref), Sounds (val), Enchantments (val), TweenService (val)
    if p1 == false then
        clearActiveEffect()
        return
    end
    clearActiveEffect()
    local Character = Players.LocalPlayer.Character
    if not Character then
        return
    end
    u66 = u66 + 1
    local u10 = u66
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(0, 0, 0)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.Adornee = Character
    Highlight.Parent = Character
    u65 = {colorCorrection = ColorCorrectionEffect, highlight = Highlight, generation = u10}
    Sounds.playGlobalSoundEffect(Enchantments.Skullbound, 0.2, 3)
    local v1 = TweenInfo.new(0.075)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 1, Saturation = -0.9, Contrast = -1, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    v1 = TweenInfo.new(0.075)
    TweenService:Create(Highlight, v1, {FillTransparency = 0}):Play()
    task.wait(0.075)
    if u66 ~= u10 then
        return
    end
    v1 = TweenInfo.new(0.075)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -1, Saturation = 0.9, Contrast = 1, TintColor = Color3.fromRGB(0, 0, 0)}):Play()
    v1 = TweenInfo.new(0.075)
    TweenService:Create(Highlight, v1, {FillTransparency = 1, FillColor = Color3.fromRGB(255, 255, 255)}):Play()
    task.wait(0.075)
    if u66 ~= u10 then
        return
    end
    v1 = TweenInfo.new(0.1)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -0.1, Saturation = -0.5, Contrast = 0, TintColor = Color3.fromRGB(249, 56, 56)}):Play()
    v1 = TweenInfo.new(0.3)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.5, FillColor = Color3.fromRGB(249, 56, 56)}):Play()
    task.delay(3, function() -- Line: 144 -- upvalues: u66 (upval), u10 (val), TweenService (upval), ColorCorrectionEffect (val), Highlight (val), u65 (upval)
        if u66 ~= u10 then
            return
        end
        local v1 = TweenInfo.new(35)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0}):Play()
        v1 = TweenInfo.new(35)
        TweenService:Create(ColorCorrectionEffect, v1, {TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(35)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.delay(30, function() -- Line: 163 -- upvalues: u66 (upval), u10 (upval), u65 (upval), ColorCorrectionEffect (upval), Highlight (upval)
            if u66 ~= u10 then
                return
            end
            if u65 and u65.generation == u10 then
                u65 = nil
            end
            ColorCorrectionEffect:Destroy()
            Highlight:Destroy()
        end)
    end)
end