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
--          File: ReplicatedStorage.Common.Effects.Types.Universal.ScreenShake
--                              Dumped in 0.000497 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ScreenShakePresets = require(script.Parent.Parent.Parent:WaitForChild("ScreenShakePresets"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Shake = require(Utilities:WaitForChild("Shake"))
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common_2:WaitForChild("Alive"))
return function(p1) -- Line: 18 -- upvalues: Alive (val), Workspace (val), ScreenShakePresets (val), Shake (val)
    local amplitude, fadeOutTime, frequency, rotationInfluence, sustainTime
    if not Alive.LocalPlayer then
        return
    end
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v1 = ScreenShakePresets.getPreset(p1.preset)
    if not p1.amplitude then
        amplitude = v1.amplitude
    elseif p1.amplitude ~= 0 then
        amplitude = math.clamp(p1.amplitude, 0, 10)
    end
    p1.amplitude = amplitude
    if not p1.sustainTime then
        sustainTime = v1.sustainTime
    elseif p1.sustainTime ~= 0 then
        sustainTime = math.clamp(p1.sustainTime, 0, 10)
    end
    p1.sustainTime = sustainTime
    if not p1.fadeOutTime then
        fadeOutTime = v1.fadeOutTime
    elseif p1.fadeOutTime ~= 0 then
        fadeOutTime = math.clamp(p1.fadeOutTime, 0, 1)
    end
    p1.fadeOutTime = fadeOutTime
    if not p1.frequency then
        frequency = v1.frequency
    elseif p1.frequency ~= 0 then
        frequency = math.clamp(p1.frequency, 0, 1)
    end
    p1.frequency = frequency
    if not p1.rotationInfluence then
        rotationInfluence = v1.rotationInfluence
    elseif p1.rotationInfluence == 0 then
        rotationInfluence = v1.rotationInfluence
    else
        rotationInfluence = math.clamp(p1.rotationInfluence, 0, 0.5)
        if not rotationInfluence then
            rotationInfluence = v1.rotationInfluence
        end
    end
    p1.rotationInfluence = rotationInfluence
    local v2 = Shake.new()
    v2.Amplitude = p1.amplitude
    v2.FadeInTime = 0.03
    v2.SustainTime = p1.sustainTime
    v2.FadeOutTime = p1.fadeOutTime
    v2.Frequency = p1.frequency
    v2.RotationInfluence = Vector3.new(p1.rotationInfluence, p1.rotationInfluence, p1.rotationInfluence)
    v2:Start()
    v2:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 58 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
end