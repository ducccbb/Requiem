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
--             File: ReplicatedStorage.Common.Effects.Types.Vehicles.Warhorn
--                              Dumped in 0.000724 seconds
--                          Bytecode version 9  |  9 functions

local u133, u136
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Shake = require(Utilities:WaitForChild("Shake"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Vehicles = require(Sounds_2:WaitForChild("Vehicles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics_2 = Common_6:WaitForChild("Statistics")
_, u133 = require(Statistics_2:WaitForChild("useFieldOfView"))()
_, u136 = useBlurEffect()
local function getIntensity(p1) -- Line: 49
    if 40000 < p1 then
        return 0
    end
    if p1 <= 25000 then
        return 1
    end
    return 1 - (p1 - 25000) / 15000
end
local function applyScreenShake(p1) -- Line: 66 -- upvalues: Workspace (val), Shake (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v1 = Shake.new()
    v1.Amplitude = p1 * 0.7
    v1.FadeInTime = 0.12
    v1.SustainTime = 5.5
    v1.FadeOutTime = 8
    v1.Frequency = 0.1
    v1.PositionInfluence = Vector3.one * 0.3 * p1
    v1.RotationInfluence = Vector3.one * 0.05 * p1
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 82 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
end
local function applyFieldOfViewBoost(p1) -- Line: 92 -- upvalues: u133 (val)
    local v1 = p1 * 40
    if v1 <= 0 then
        return
    end
    local u13 = u133("warhorn", v1, "add", 50, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
    task.delay(5.62, function() -- Line: 106 -- upvalues: u13 (val)
        u13(TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
    end)
end
local function applyBlur(p1) -- Line: 116 -- upvalues: u136 (val)
    local v1 = p1 * 28
    if v1 <= 0 then
        return
    end
    local u13 = u136("warhorn", v1, "add", 50, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
    task.delay(5.62, function() -- Line: 130 -- upvalues: u13 (val)
        u13(TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
    end)
end
return function(p1) -- Line: 137 -- upvalues: Character (val), Sounds (val), Vehicles (val), getIntensity (val), applyScreenShake (val), applyFieldOfViewBoost (val), applyBlur (val)
    local v1, v2
    v1, v2 = Character.getDistance(p1)
    if not v2 then
        return
    end
    Sounds.playFalloffSoundEffect(Vehicles.Warhorn, p1, 40000, 10)
    local v3 = getIntensity(v1)
    if v3 <= 0 then
        return
    end
    applyScreenShake(v3)
    applyFieldOfViewBoost(v3)
    applyBlur(v3)
end