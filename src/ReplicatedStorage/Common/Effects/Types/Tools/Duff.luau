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
--                File: ReplicatedStorage.Common.Effects.Types.Tools.Duff
--                              Dumped in 0.000267 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
return function(p1, p2) -- Line: 17 -- upvalues: Lighting (val), TweenService (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "__RequiemDuffEffectColor"
    ColorCorrectionEffect.Parent = Lighting
    local v1 = TweenInfo.new(1)
    TweenService:Create(ColorCorrectionEffect, v1, {Contrast = 0.1, Saturation = -0.1, Brightness = -0.1, TintColor = Color3.fromRGB(242, 255, 197)}):Play()
    v1 = TweenInfo.new(1)
    local u37 = TweenService:Create(ColorCorrectionEffect, v1, {Contrast = 0, Saturation = 0, Brightness = 0, TintColor = Color3.fromRGB(255, 255, 255)})
    task.delay(p2 or 10, function() -- Line: 38 -- upvalues: u37 (val), ColorCorrectionEffect (val)
        u37:Play()
        u37.Completed:Wait()
        ColorCorrectionEffect:Destroy()
    end)
end