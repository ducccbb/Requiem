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
--    File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Wavering Resilience
--                              Dumped in 0.000290 seconds
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
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
return function() -- Line: 20 -- upvalues: Lighting (val), TweenService (val), Sounds (val), Proficiencies (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "Wavering Resilience"
    ColorCorrectionEffect.Parent = Lighting
    local v1 = TweenInfo.new(0.2)
    TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 1}):Play()
    Sounds.playGlobalSoundEffect(Proficiencies.WaveringResilience, 0.2, 0.3, 4)
    task.wait(0.2)
    v1 = TweenInfo.new(1)
    TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0}):Play()
    task.wait(1)
    ColorCorrectionEffect:Destroy()
end