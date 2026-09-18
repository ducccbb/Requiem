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
--             File: ReplicatedStorage.Common.Effects.Types.Universal.Eating
--                              Dumped in 0.000323 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 0
return function(p1, p2) -- Line: 26 -- upvalues: TweenService (val), ColorCorrectionEffect (val), BlurEffect (val), Lighting (val), Signals (val)
    local v1
    if p1 ~= 0 then
        v1 = p2
    else
        v1 = 0
    end
    local v2 = TweenInfo.new(0.1)
    local v3 = {Saturation = math.lerp(0, -1, p1), Brightness = math.lerp(0, -0.3, p1)}
    local v4 = Color3.fromRGB(255, 255, 255)
    local v5 = Color3.fromRGB(219, 101, 101)
    v3.TintColor = v4:Lerp(v5, p1)
    TweenService:Create(ColorCorrectionEffect, v2, v3):Play()
    v2 = TweenInfo.new(0.1)
    TweenService:Create(BlurEffect, v2, {Size = math.lerp(0, 40, p1)}):Play()
    ColorCorrectionEffect.Parent = Lighting
    BlurEffect.Parent = Lighting
    Signals.Bars:Fire(p1, v1)
end