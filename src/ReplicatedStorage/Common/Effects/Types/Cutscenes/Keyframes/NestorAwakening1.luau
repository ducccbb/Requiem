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
--   File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.NestorAwakening1
--                               Dumped in 0.00260 seconds
--                          Bytecode version 9  |  18 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Screen = require(v1.Parent.Parent.Parent.Parent:WaitForChild("Screen"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local Titans = v1.Parent.Parent.Parent:WaitForChild("Titans")
local Lightning = require(Titans:WaitForChild("Lightning"))
local Shifter = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Shifter")
local u123 = nil
local u124 = 0
local u125 = 0
local u126 = {
    Atmosphere = {
        Density = 0,
        Offset = 0,
        Glare = 0,
        Haze = 0,
        Color = Color3.fromRGB(199, 199, 199),
        Decay = Color3.fromRGB(106, 112, 125),
    },
    Lighting = {
        Brightness = 4,
        EnvironmentDiffuseScale = 0.5,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0,
        Ambient = Color3.fromRGB(70, 70, 70),
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
        ColorShift_Top = Color3.fromRGB(0, 0, 0),
        OutdoorAmbient = Color3.fromRGB(70, 70, 70),
    },
    ColorCorrectionEffect = {Brightness = 0, Contrast = 0.06, Saturation = 0.1, TintColor = Color3.fromRGB(255, 255, 255)},
}
local u165 = {
    Atmosphere = {
        Density = 0.341,
        Offset = 1,
        Glare = 0.98,
        Haze = 1.22,
        Color = Color3.fromRGB(96, 168, 255),
        Decay = Color3.fromRGB(167, 198, 255),
    },
    Lighting = {
        Brightness = 2,
        EnvironmentDiffuseScale = 1,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0.1,
        Ambient = Color3.fromRGB(70, 137, 200),
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
        ColorShift_Top = Color3.fromRGB(0, 0, 0),
        OutdoorAmbient = Color3.fromRGB(70, 70, 70),
    },
    ColorCorrectionEffect = {Brightness = 0.1, Contrast = 0.3, Saturation = 0.2, TintColor = Color3.fromRGB(197, 215, 255)},
}
local u204 = {
    Atmosphere = {
        Density = 0.6,
        Offset = 1,
        Glare = 0.98,
        Haze = 1.22,
        Color = Color3.fromRGB(0, 0, 0),
        Decay = Color3.fromRGB(0, 0, 0),
    },
    Lighting = {
        Brightness = 0,
        EnvironmentDiffuseScale = 1,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0,
        Ambient = Color3.fromRGB(0, 0, 0),
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
        ColorShift_Top = Color3.fromRGB(0, 0, 0),
        OutdoorAmbient = Color3.fromRGB(0, 0, 0),
    },
    ColorCorrectionEffect = {Brightness = 0, Contrast = 0.3, Saturation = 0.2, TintColor = Color3.fromRGB(255, 255, 255)},
}
local function captureCurrentLightingSettings() -- Line: 142 -- upvalues: Lighting (val), u126 (ref)
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    local WorldColorCorrection = Lighting:FindFirstChild("WorldColorCorrection")
    if not WorldColorCorrection then
        WorldColorCorrection = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
    end
    u126 = {
        Atmosphere = {
            Density = WorldAtmosphere.Density,
            Offset = WorldAtmosphere.Offset,
            Color = WorldAtmosphere.Color,
            Decay = WorldAtmosphere.Decay,
            Glare = WorldAtmosphere.Glare,
            Haze = WorldAtmosphere.Haze,
        },
        Lighting = {
            Ambient = Lighting.Ambient,
            Brightness = Lighting.Brightness,
            ColorShift_Bottom = Lighting.ColorShift_Bottom,
            ColorShift_Top = Lighting.ColorShift_Top,
            EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
            EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
            OutdoorAmbient = Lighting.OutdoorAmbient,
            ExposureCompensation = Lighting.ExposureCompensation,
        },
        ColorCorrectionEffect = {Brightness = WorldColorCorrection.Brightness, Contrast = WorldColorCorrection.Contrast, Saturation = WorldColorCorrection.Saturation, TintColor = WorldColorCorrection.TintColor},
    }
end
local function setLightingSettings(p1) -- Line: 180 -- upvalues: Lighting (val)
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    local WorldColorCorrection = Lighting:FindFirstChild("WorldColorCorrection")
    if not WorldColorCorrection then
        WorldColorCorrection = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
    end
    WorldAtmosphere.Density = p1.Atmosphere.Density
    WorldAtmosphere.Offset = p1.Atmosphere.Offset
    WorldAtmosphere.Color = p1.Atmosphere.Color
    WorldAtmosphere.Decay = p1.Atmosphere.Decay
    WorldAtmosphere.Glare = p1.Atmosphere.Glare
    WorldAtmosphere.Haze = p1.Atmosphere.Haze
    WorldColorCorrection.Brightness = p1.ColorCorrectionEffect.Brightness
    WorldColorCorrection.Contrast = p1.ColorCorrectionEffect.Contrast
    WorldColorCorrection.Saturation = p1.ColorCorrectionEffect.Saturation
    WorldColorCorrection.TintColor = p1.ColorCorrectionEffect.TintColor
    Lighting.Ambient = p1.Lighting.Ambient
    Lighting.Brightness = p1.Lighting.Brightness
    Lighting.ColorShift_Bottom = p1.Lighting.ColorShift_Bottom
    Lighting.ColorShift_Top = p1.Lighting.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = p1.Lighting.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = p1.Lighting.EnvironmentSpecularScale
    Lighting.OutdoorAmbient = p1.Lighting.OutdoorAmbient
    Lighting.ExposureCompensation = p1.Lighting.ExposureCompensation
end
local function onActivateFlashback(p1) -- Line: 216 -- upvalues: u123 (ref), Lighting (val)
    if not u123 then
        u123 = Instance.new("ColorCorrectionEffect")
    end
    u123.Brightness = -0.1
    u123.Contrast = -0.1
    u123.Saturation = -1
    u123.Parent = Lighting
end
local function onDeactivateFlashback() -- Line: 230 -- upvalues: u123 (ref)
    if u123 then
        u123.Brightness = 0
        u123.Contrast = 0
        u123.Saturation = 0
    end
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 243 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function onHandleTimeEyecatcher(p1, p2) -- Line: 259 -- upvalues: Signals (val)
    Signals.Eyecatcher:Fire({variant = "Time", header = p1, body = p2})
end
local function onHandleExplosionKeyframe(p1) -- Line: 271 -- upvalues: u124 (ref), Particles (val), ClientStatusHandler (val)
    u124 = u124 + 1
    local v1 = ("Explosion%*"):format(u124)
    local v2 = p1:WaitForChild("Explosions"):FindFirstChild(v1, true)
    if not v2 then
        return
    end
    Particles.deepEmitParticles(v2, true)
    ClientStatusHandler.addPlayerStatus("Concussed", 0.15)
    if u124 == 4 then
        local Door2 = p1:FindFirstChild("Door2", true)
        if Door2 then
            local Hinge = Door2:FindFirstChild("Hinge")
            if Hinge then
                Hinge.Anchored = false
                Hinge.AssemblyLinearVelocity = Vector3.new(5, 20, 50)
                Hinge.AssemblyAngularVelocity = Vector3.new(20, 20, 20)
            end
        end
    end
end
local function onRemoveSyringe(p1) -- Line: 304
    p1:WaitForChild("Requiem_CreateCharacter_Nestor"):WaitForChild("Syringe"):Destroy()
end
local function onShowSyringe(p1) -- Line: 314
    for i, j in p1:WaitForChild("Requiem_CreateCharacter_Nestor"):WaitForChild("Syringe"):GetChildren() do
        if not (j:IsA("BasePart")) then
            if j:IsA("BasePart") and j.Name == "Meshes/tools_Cylinder.006" then
                j.Transparency = 0.45
            end
        elseif j.Name ~= "Handle" and j.Name ~= "SyrineTurnRed" and j.Name ~= "Meshes/tools_Cylinder.006" then
            j.Transparency = 0
        end
    end
end
local function onTurnSyringeRed(p1) -- Line: 339 -- upvalues: TweenService (val)
    local SyrineTurnRed = p1:WaitForChild("Requiem_CreateCharacter_Nestor"):WaitForChild("Syringe"):FindFirstChild("SyrineTurnRed")
    local v1 = TweenInfo.new(1)
    TweenService:Create(SyrineTurnRed, v1, {Transparency = 0}):Play()
end
local function onHandleSlowMoKeyframe(p1) -- Line: 353
    local Explosion4 = p1:WaitForChild("Explosions"):FindFirstChild("Explosion4")
    if Explosion4 then
        for i, j in Explosion4:GetChildren() do
            if j:IsA("ParticleEmitter") then
                local TimeScale = j.TimeScale
                j.TimeScale = j.TimeScale * 0.05
                task.delay(1.5, function() -- Line: 362 -- upvalues: j (val), TimeScale (val)
                    j.TimeScale = TimeScale
                end)
            end
        end
    end
end
local function onEmitShifterCrackle(p1) -- Line: 374 -- upvalues: Shifter (val), Screen (val)
    local v1
    local Lightning = Shifter:WaitForChild("Lightning")
    local Lightning_2 = Lightning:WaitForChild("Lightning")
    for i, j in p1:WaitForChild("Requiem_CreateCharacter_Nestor"):GetChildren() do
        if j:IsA("BasePart") then
            v1 = Lightning_2:Clone()
            v1.Enabled = true
            v1.Parent = j
        end
    end
    Screen.__createClientScreenEffect({name = "Shifter", enabled = true})
end
local function onShiftLightning(p1) -- Line: 399 -- upvalues: Screen (val), Lightning (val), Lighting (val), TweenService (val)
    local Torso = p1:WaitForChild("Requiem_CreateCharacter_Nestor"):WaitForChild("Torso")
    Screen.__removeClientScreenEffect("Shifter")
    Lightning(Torso.Position)
    Screen.__createClientScreenEffect({name = "Smoke", enabled = true, scale = 1})
    task.wait(1.75)
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    local v1 = TweenInfo.new(1)
    TweenService:Create(WorldAtmosphere, v1, {Density = 0.75}):Play()
    task.wait(1)
    v1 = TweenInfo.new(6.5)
    TweenService:Create(WorldAtmosphere, v1, {Density = 0.341}):Play()
end
local function onGlowBodyParts(p1) -- Line: 430 -- upvalues: TweenService (val)
    local v1
    for i, j in p1:WaitForChild("BodyParts"):GetChildren() do
        if j:IsA("BasePart") then
            v1 = TweenInfo.new(5)
            TweenService:Create(j, v1, {Color = Color3.fromRGB(255, 213, 106)}):Play()
        end
    end
end
return function(p1, p2) -- Line: 446 -- upvalues: onActivateFlashback (val), onDeactivateFlashback (val), onHandleTimeEyecatcher (val), onHandleExplosionKeyframe (val), onHandleSlowMoKeyframe (val), Signals (val), Screen (val), setLightingSettings (val), u126 (ref), captureCurrentLightingSettings (val), u165 (val), u125 (ref), Lighting (val), u204 (val), onGlowBodyParts (val), onShowSyringe (val), onRemoveSyringe (val), onTurnSyringeRed (val), onEmitShifterCrackle (val), onShiftLightning (val), onHandleEmitKeyframe (val)
    local v1 = string.split(p1, "_")
    if p1 == "Flashback" then
        onActivateFlashback(p2)
        return
    end
    if p1 == "Present" then
        onDeactivateFlashback()
        return
    end
    if p1 == "EyeCatcherBefore" then
        onHandleTimeEyecatcher("PRESENT DAY", "Three hours ago...")
        return
    end
    if p1 == "Explosion" then
        onHandleExplosionKeyframe(p2)
        return
    end
    if p1 == "SlowMo" then
        onHandleSlowMoKeyframe(p2)
        return
    end
    if p1 == "EyeCatcherPresent" then
        onHandleTimeEyecatcher("PRESENT DAY", "Return to present time...")
        return
    end
    if p1 == "Ending" then
        Signals.Bars:Fire(1, -2)
        Screen.__removeClientScreenEffect("Smoke")
        task.wait(0.5)
        setLightingSettings(u126)
        return
    end
    if p1 == "CrystalCatacombsLightingSwap" then
        Signals.Bars:Fire(1, -2)
        task.wait(0.3)
        captureCurrentLightingSettings()
        setLightingSettings(u165)
        task.delay(0.75, function() -- Line: 477 -- upvalues: Signals (upval)
            Signals.Bars:Fire(0.25, -2)
        end)
        return
    end
    if p1 == "InsideOfNestorStart" then
        u125 = Lighting.ClockTime
        Lighting.ClockTime = 0
        setLightingSettings(u204)
        if p1 == "InsideOfNestorStart2" then
            onGlowBodyParts(p2)
            return
        end
        return
    end
    if p1 == "InsideOfNestorStart2" then
        u125 = Lighting.ClockTime
        Lighting.ClockTime = 0
        setLightingSettings(u204)
        if p1 ~= "InsideOfNestorStart2" then
            return
        end
        onGlowBodyParts(p2)
        return
    end
    if p1 == "InsideOfNestorEnd" or p1 == "InsideOfNestorEnd2" then
        Lighting.ClockTime = u125
        setLightingSettings(u165)
        return
    end
    if p1 == "AddSyringe" then
        onShowSyringe(p2)
        return
    end
    if p1 == "SyringeDestroy" then
        onRemoveSyringe(p2)
        return
    end
    if p1 == "SyringeTurnRed" then
        onTurnSyringeRed(p2)
        return
    end
    if p1 == "Emit_ShifterCrackle" then
        onEmitShifterCrackle(p2)
        return
    end
    if p1 == "Emit_ShifterLightning" then
        onShiftLightning(p2)
        return
    end
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
end