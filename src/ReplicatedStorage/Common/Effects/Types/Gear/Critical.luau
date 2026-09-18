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
--              File: ReplicatedStorage.Common.Effects.Types.Gear.Critical
--                              Dumped in 0.000574 seconds
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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
return function(p1, p2) -- Line: 25 -- upvalues: Players (val), Sounds (val), Gear (val), Signals (val), Lighting (val), TweenService (val)
    local v1
    local v2 = p1 == Players.LocalPlayer.UserId
    Sounds.playRangedSoundEffect(Gear.Critical, p2, 150, 2)
    local PlayerByUserId = Players:GetPlayerByUserId(p1)
    if PlayerByUserId then
        PlayerByUserId = Players:GetPlayerByUserId(p1).Character
    end
    if not PlayerByUserId then
        return
    end
    if v2 then
        Signals.Monologue:Fire("I don't think they will walk that off...")
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Parent = Lighting
        v1 = TweenInfo.new(0.3)
        TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -1, Brightness = -0.6, Contrast = 0.5}):Play()
        task.delay(0.3, function() -- Line: 46 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
            local v1 = TweenInfo.new(0.4)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
            task.wait(0.2)
            ColorCorrectionEffect:Destroy()
        end)
    end
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.FillColor = Color3.fromRGB(43, 135, 255)
    Highlight.OutlineColor = Color3.fromRGB(43, 142, 255)
    Highlight.Adornee = PlayerByUserId
    Highlight.Parent = PlayerByUserId
    v1 = TweenInfo.new(0.2)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.3, OutlineTransparency = 0.4}):Play()
    task.wait(0.2)
    v1 = TweenInfo.new(1)
    TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
    task.wait(1)
    Highlight:Destroy()
end