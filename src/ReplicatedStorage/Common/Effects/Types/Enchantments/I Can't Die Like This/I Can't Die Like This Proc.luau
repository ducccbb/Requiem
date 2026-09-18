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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.I Can't Die Like This.I Can't Die Like This Proc
--                              Dumped in 0.000581 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
return function() -- Line: 16 -- upvalues: Players (val), Lighting (val), TweenService (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.Adornee = Character
    Highlight.Parent = Character
    local function pulseWhite(p1, p2, p3, p4) -- Line: 32 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), Highlight (val)
        local v1 = TweenInfo.new(p1)
        TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -1, Contrast = 0, Brightness = p3, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(p1)
        TweenService:Create(Highlight, v1, {FillTransparency = p4, FillColor = Color3.fromRGB(255, 255, 255)}):Play()
        task.wait(p1)
        v1 = TweenInfo.new(p2)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(p2)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.wait(p2)
    end
    pulseWhite(0.08, 0.08, 1, 0.35)
    pulseWhite(0.06, 0.12, 0.65, 0.55)
    ColorCorrectionEffect:Destroy()
    Highlight:Destroy()
end