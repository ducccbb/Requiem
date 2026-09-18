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
-- File: ReplicatedStorage.Common.Effects.Types.Enchantments.Skullbound.SkullboundDizzy
--                              Dumped in 0.000442 seconds
--                          Bytecode version 9  |  4 functions

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
local Universal = require(Sounds_2:WaitForChild("Universal"))
return function() -- Line: 18 -- upvalues: Players (val), Lighting (val), TweenService (val), Sounds (val), Universal (val)
    if not Players.LocalPlayer.Character then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 0
    BlurEffect.Parent = Lighting
    local v1 = TweenInfo.new(5)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -0.2, Saturation = -1, Contrast = 1}):Play()
    v1 = TweenInfo.new(5)
    TweenService:Create(BlurEffect, v1, {Size = 50}):Play()
    local v2 = NumberRange.new(1, 1.5)
    Sounds.playGlobalSoundEffect(Universal.Tinnitus, 0.3, 0.3, 5, v2, 3)
    task.delay(20, function() -- Line: 43 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), BlurEffect (val)
        local v1 = TweenInfo.new(15)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(15)
        TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
        task.delay(5, function() -- Line: 55 -- upvalues: ColorCorrectionEffect (upval), BlurEffect (upval)
            ColorCorrectionEffect:Destroy()
            BlurEffect:Destroy()
        end)
    end)
end