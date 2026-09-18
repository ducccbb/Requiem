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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.Garrisons Resolve.Garrisons Resolve Proc
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  5 functions

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
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
return function() -- Line: 24 -- upvalues: Players (val), Lighting (val), Signals (val), Sounds (val), Enchantments (val), TweenService (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    task.spawn(function() -- Line: 33 -- upvalues: Signals (upval)
        Signals.Monologue:Fire("Commander Huxley, your resolve will become my might.")
        task.wait(0.2)
        Signals.Monologue:Fire("Until I draw my last breath, I shall serve by your side.")
    end)
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(0, 0, 0)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.Adornee = Character
    Highlight.Parent = Character
    Sounds.playGlobalSoundEffect(Enchantments.GarrisonsResolve1, 0.2, 2)
    Sounds.playGlobalSoundEffect(Enchantments.GarrisonsResolve2, 0.2, 3)
    local v1 = TweenInfo.new(0.075)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 1, Saturation = -0.9, Contrast = -1, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    v1 = TweenInfo.new(0.075)
    TweenService:Create(Highlight, v1, {FillTransparency = 0}):Play()
    task.wait(0.075)
    v1 = TweenInfo.new(0.075)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -1, Saturation = 0.9, Contrast = 1, TintColor = Color3.fromRGB(0, 0, 0)}):Play()
    v1 = TweenInfo.new(0.075)
    TweenService:Create(Highlight, v1, {FillTransparency = 1, FillColor = Color3.fromRGB(255, 255, 255)}):Play()
    task.wait(0.075)
    v1 = TweenInfo.new(0.1)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -0.1, Saturation = -0.5, Contrast = 0, TintColor = Color3.fromRGB(233, 66, 54)}):Play()
    v1 = TweenInfo.new(0.3)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.5, FillColor = Color3.fromRGB(255, 68, 39)}):Play()
    task.delay(0.3, function() -- Line: 90 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), Highlight (val)
        local v1 = TweenInfo.new(2)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0}):Play()
        v1 = TweenInfo.new(2)
        TweenService:Create(ColorCorrectionEffect, v1, {TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(2)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.delay(2, function() -- Line: 105 -- upvalues: ColorCorrectionEffect (upval), Highlight (upval)
            ColorCorrectionEffect:Destroy()
            Highlight:Destroy()
        end)
    end)
end