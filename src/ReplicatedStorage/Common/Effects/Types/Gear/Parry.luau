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
--                File: ReplicatedStorage.Common.Effects.Types.Gear.Parry
--                              Dumped in 0.000244 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local u26 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u31 = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
return function() -- Line: 14 -- upvalues: Lighting (val), TweenService (val), u26 (val), u31 (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    TweenService:Create(ColorCorrectionEffect, u26, {Brightness = -0.1, Saturation = 0.3, Contrast = 0.5}):Play()
    task.wait(u26.Time)
    TweenService:Create(ColorCorrectionEffect, u31, {Brightness = 0, Saturation = 0, Contrast = 0}):Play()
    task.wait(u31.Time)
    ColorCorrectionEffect:Destroy()
end