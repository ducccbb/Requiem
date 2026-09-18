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
--            File: ReplicatedStorage.Common.Effects.Types.Explosions.Impact
--                               Dumped in 0.00109 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Particles_2 = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Particles")
local Shifter = Particles_2:WaitForChild("Titans"):WaitForChild("Shifter")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local u57 = {
    Brightness = 0,
    EnvironmentDiffuseScale = 1,
    EnvironmentSpecularScale = 1,
    ExposureCompensation = -0.7,
    Ambient = Color3.new(0, 0, 0),
    ColorShift_Bottom = Color3.new(0, 0, 0),
    ColorShift_Top = Color3.new(0, 0, 0),
    OutdoorAmbient = Color3.new(0, 0, 0),
}
local v2 = Color3.fromRGB(255, 255, 255)
local u83 = {
    black = {Brightness = -20, Contrast = 50, Saturation = -1, TintColor = v2},
    blue = {Brightness = 8, Contrast = -24, Saturation = -0.65, TintColor = Color3.fromRGB(120, 190, 255)},
    white = {Brightness = 10, Contrast = -30, Saturation = -1, TintColor = v2},
    yellow = {Brightness = -20, Contrast = 50, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
}
local u98 = {
    {kind = "white", duration = 0.035},
    {kind = "yellow", duration = 0.022},
    {kind = "black", duration = 0.018},
    {kind = "white", duration = 0.028},
    {kind = "black", duration = 0.018},
    {kind = "yellow", duration = 0.022},
    {kind = "black", duration = 0.018},
    {kind = "white", duration = 0.032},
    {kind = "yellow", duration = 0.025},
    {kind = "white", duration = 0.055},
}
local function onSpawnShiftBurst(p1) -- Line: 107 -- upvalues: Shifter (val), Particles (val)
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return nil
    end
    local Shift = Shifter:FindFirstChild("Shift")
    if not Shift or not (Shift:IsA("Attachment")) then
        return nil
    end
    local v1 = Shift:Clone()
    v1.Parent = Torso
    Particles.deepEnableParticles(v1)
    Particles.deepEmitParticles(v1)
    return v1
end
local function captureLightingSnapshot() -- Line: 131 -- upvalues: Lighting (val)
    return {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
end
local function restoreLightingSnapshot(p1) -- Line: 149 -- upvalues: Lighting (val)
    Lighting.Ambient = p1.Ambient
    Lighting.Brightness = p1.Brightness
    Lighting.ColorShift_Bottom = p1.ColorShift_Bottom
    Lighting.ColorShift_Top = p1.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = p1.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = p1.EnvironmentSpecularScale
    Lighting.OutdoorAmbient = p1.OutdoorAmbient
    Lighting.ExposureCompensation = p1.ExposureCompensation
end
local function applyImpactFrameLightingProperties() -- Line: 164 -- upvalues: Lighting (val), u57 (val)
    Lighting.Ambient = u57.Ambient
    Lighting.Brightness = u57.Brightness
    Lighting.ColorShift_Bottom = u57.ColorShift_Bottom
    Lighting.ColorShift_Top = u57.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = u57.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = u57.EnvironmentSpecularScale
    Lighting.OutdoorAmbient = u57.OutdoorAmbient
    Lighting.ExposureCompensation = u57.ExposureCompensation
end
local function configureImpactFrameEffect(p1, p2) -- Line: 181 -- upvalues: u83 (val)
    local v1 = u83[p2]
    p1.Brightness = v1.Brightness
    p1.Contrast = v1.Contrast
    p1.Saturation = v1.Saturation
    p1.TintColor = v1.TintColor
end
local function setImpactFrame(p1, p2, p3) -- Line: 196 -- upvalues: restoreLightingSnapshot (val), u83 (val), captureLightingSnapshot (val), applyImpactFrameLightingProperties (val), configureImpactFrameEffect (val), Lighting (val)
    local colorCorrection
    if not p2 then
        local lightingSnapshot = p1.lightingSnapshot
        if lightingSnapshot then
            restoreLightingSnapshot(lightingSnapshot)
            p1.lightingSnapshot = nil
        end
        colorCorrection = p1.colorCorrection
        if colorCorrection then
            colorCorrection:Destroy()
            p1.colorCorrection = nil
        end
        return
    end
    if not p3 or not (u83[p3]) or p1.colorCorrection then
        return
    end
    p1.lightingSnapshot = captureLightingSnapshot()
    applyImpactFrameLightingProperties()
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "ImpactFrameColorCorrection"
    configureImpactFrameEffect(ColorCorrectionEffect, p3)
    ColorCorrectionEffect.Parent = Lighting
    p1.colorCorrection = ColorCorrectionEffect
end
local function playImpactFrameSequence(p1, p2, p3, p4) -- Line: 245 -- upvalues: setImpactFrame (val), captureLightingSnapshot (val), applyImpactFrameLightingProperties (val), Lighting (val), configureImpactFrameEffect (val)
    setImpactFrame(p1, false)
    p1.lightingSnapshot = captureLightingSnapshot()
    applyImpactFrameLightingProperties()
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "ImpactFrameColorCorrection"
    ColorCorrectionEffect.Parent = Lighting
    p1.colorCorrection = ColorCorrectionEffect
    task.spawn(function() -- Line: 261 -- upvalues: p2 (val), p3 (val), configureImpactFrameEffect (upval), ColorCorrectionEffect (val), setImpactFrame (upval), p1 (val), p4 (val)
        local v1 = p2
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if p3 and p3() then
                break
            end
            configureImpactFrameEffect(ColorCorrectionEffect, j.kind)
            task.wait(j.duration)
        end
        setImpactFrame(p1, false)
        if p4 then
            if not p3 then
                p4()
            elseif not (p3()) then
                p4()
            end
        end
    end)
end
local v3 = {
    playSequence = function(p1, p2, p3) -- Line: 289 -- upvalues: playImpactFrameSequence (val), setImpactFrame (val)
        local u3 = {}
        playImpactFrameSequence(u3, p1, p2, p3)
        return function() -- Line: 301 -- upvalues: setImpactFrame (upval), u3 (val)
            setImpactFrame(u3, false)
        end
    end,
}
local v4 = {
    __call = function(p1, p2, p3) -- Line: 306 -- upvalues: onSpawnShiftBurst (val), playImpactFrameSequence (val), u98 (val), setImpactFrame (val)
        local u3 = false
        local u4 = {}
        onSpawnShiftBurst(p2)
        playImpactFrameSequence(u4, u98, function() -- Line: 314 -- upvalues: u3 (ref)
            return u3
        end, p3)
        p2.Destroying:Once(function() -- Line: 318 -- upvalues: u3 (ref), setImpactFrame (upval), u4 (val)
            u3 = true
            setImpactFrame(u4, false)
        end)
    end,
}
return (setmetatable(v3, v4))