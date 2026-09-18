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
--             File: ReplicatedStorage.Common.Effects.Types.Tools.Hitmarker
--                              Dumped in 0.000508 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Projectiles = require(Sounds_2:WaitForChild("Projectiles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Universal = script.Parent.Parent:WaitForChild("Universal")
local Saturation = require(Universal:WaitForChild("Saturation"))
return function(p1, p2, p3) -- Line: 18 -- upvalues: Sounds (val), Projectiles (val), Signals (val), Saturation (val), Lighting (val), TweenService (val)
    Sounds.playGlobalSoundEffect(Projectiles.Hitmarker, 0.1, 1.5, 5, NumberRange.new(0.9, 1.1))
    if p2 then
        Sounds.playGlobalSoundEffect(Projectiles.Success, 0.1, 2, 5, NumberRange.new(0.9, 1.1))
        Signals.Monologue:Fire("A headshot, well done.")
    end
    if p2 and not p3 then
        Saturation(1)
    end
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.FillColor = Color3.fromRGB(220, 40, 40)
    Highlight.Adornee = p1
    Highlight.Parent = p1
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local v1 = TweenInfo.new(0.1)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0.1, Contrast = 0.2}):Play()
    v1 = TweenInfo.new(0.1)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.5}):Play()
    task.delay(0.1, function() -- Line: 51 -- upvalues: TweenService (upval), Highlight (val), ColorCorrectionEffect (val)
        local v1 = TweenInfo.new(0.3)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        v1 = TweenInfo.new(0.3)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Contrast = 0}):Play()
        task.wait(0.3)
        Highlight:Destroy()
    end)
end