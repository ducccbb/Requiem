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
--             File: ReplicatedStorage.Common.Effects.Types.Explosions.Tease
--                               Dumped in 0.0122 seconds
--                         Bytecode version 9  |  105 functions

local Tease
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Particles_2 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles")
local Titans = Particles_2:WaitForChild("Titans")
local Special = Titans:WaitForChild("Special")
local Shifter = Titans:WaitForChild("Shifter")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Lightning_2 = Utilities:WaitForChild("Lightning")
local Lightning = require(Lightning_2:WaitForChild("Lightning"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local NumberSequence = require(Utilities_3:WaitForChild("NumberSequence"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_4 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_4:WaitForChild("Shake"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_5 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Alive = require(Common_6:WaitForChild("Alive"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_6 = Common_7:WaitForChild("Utilities")
local Character = require(Utilities_6:WaitForChild("Character"))
local u190 = {Brightness = -0.2, Contrast = 0.2, Saturation = 0.2, TintColor = Color3.fromRGB(247, 212, 132)}
local u196 = {
    Brightness = 1.35,
    ExposureCompensation = -0.12,
    Ambient = Color3.fromRGB(118, 92, 68),
    ColorShift_Bottom = Color3.fromRGB(175, 118, 78),
    ColorShift_Top = Color3.fromRGB(255, 204, 118),
}
local u212 = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}
local u218 = {
    rockVisible = true,
    rockCount = 48,
    rockSpawnRadius = 16,
    rockSpawnMinRadius = 8,
    rockMinSpacing = 2.5,
    orbitExpandScaleMax = 1.3,
    lightningSizeScaleMax = 5,
    lightningMaxActiveMin = 1,
    lightningMaxActiveMax = 10,
    lightningSpawnIntervalMin = 0.08,
    lightningSpawnIntervalMax = 0.4,
    lightningMaxDistance = 14,
    lightningPartCount = 10,
    lightningThickness = 0.12,
    lightningCurveFactor = 0.35,
    lightningBoltRadius = 0.55,
    powerfulBolts = false,
    bodyLightningSizeScale = 0.42,
    bodyLightningRateScale = 0.4,
    bodyLightningBrightnessScale = 0.5,
    enableKickRocks = true,
    lightningSpawnLoops = 1,
    useDomeLayout = false,
    domeRadius = 0,
    domeBaseHeight = 0,
    domeHeightScale = 1,
    spawnYOffsetMin = -5,
    spawnYOffsetMax = 4,
    riseHeightMin = 4,
    riseHeightMax = 14,
    lightningOrbitStep = math.rad(28),
}
local u222 = {
    rockVisible = false,
    rockCount = 48,
    rockSpawnRadius = 26,
    rockSpawnMinRadius = 5,
    rockMinSpacing = 1.5,
    orbitExpandScaleMax = 3.4,
    lightningSizeScaleMax = 16,
    lightningMaxActiveMin = 3,
    lightningMaxActiveMax = 12,
    lightningSpawnIntervalMin = 0.12,
    lightningSpawnIntervalMax = 0.35,
    lightningMaxDistance = 32,
    lightningPartCount = 12,
    lightningThickness = 0.52,
    lightningCurveFactor = 0.58,
    lightningBoltRadius = 1.5,
    powerfulBolts = true,
    bodyLightningSizeScale = 1,
    bodyLightningRateScale = 1,
    bodyLightningBrightnessScale = 1,
    enableKickRocks = false,
    lightningSpawnLoops = 1,
    useDomeLayout = false,
    domeRadius = 0,
    domeBaseHeight = 0,
    domeHeightScale = 1,
    spawnYOffsetMin = -5,
    spawnYOffsetMax = 4,
    riseHeightMin = 4,
    riseHeightMax = 14,
    lightningOrbitStep = math.rad(16),
}
local u226 = {
    rockVisible = false,
    rockCount = 64,
    rockSpawnRadius = 54,
    rockSpawnMinRadius = 16,
    rockMinSpacing = 2.8,
    orbitExpandScaleMax = 1.35,
    lightningSizeScaleMax = 18,
    lightningMaxActiveMin = 4,
    lightningMaxActiveMax = 14,
    lightningSpawnIntervalMin = 0.18,
    lightningSpawnIntervalMax = 0.55,
    lightningMaxDistance = 52,
    lightningPartCount = 12,
    lightningThickness = 0.68,
    lightningCurveFactor = 0.95,
    lightningBoltRadius = 1.85,
    powerfulBolts = true,
    bodyLightningSizeScale = 1,
    bodyLightningRateScale = 1,
    bodyLightningBrightnessScale = 1,
    enableKickRocks = false,
    lightningSpawnLoops = 1,
    useDomeLayout = true,
    domeRadius = 58,
    domeBaseHeight = 6,
    domeHeightScale = 1,
    spawnYOffsetMin = -8,
    spawnYOffsetMax = -2,
    riseHeightMin = 12,
    riseHeightMax = 32,
    lightningOrbitStep = math.rad(10),
}
local function resolveTeaseSound(p1) -- Line: 275
    if not p1 or not p1.sound then
        return nil
    end
    if typeof(p1.sound) == "string" then
        return {volume = 3, id = p1.sound}
    end
    return p1.sound
end
local function resolveTeaseIntensity(p1) -- Line: 290 -- upvalues: u226 (val), u222 (val), u218 (val)
    if not p1 then
        if p1 then
            if p1.intense then
                return u222
            end
            return u218
        end
        return u218
    end
    if p1.dome then
        return u226
    end
    if not p1 then
        return u218
    end
    if p1.intense then
        return u222
    end
    return u218
end
local function createTeaseContext(p1, p2) -- Line: 300 -- upvalues: resolveTeaseIntensity (val)
    local startSizeScale, u4, v1
    if not p1 then
        u4 = 1.5
    elseif 0 < p1 then
        u4 = p1
    end
    local v2 = p2
    if v2 then
        v2 = if p2.intense ~= true then p2.dome == true else true
    end
    if not p2 then
        startSizeScale = 0.1
    elseif p2.startSizeScale ~= nil then
        startSizeScale = p2.startSizeScale
    end
    local v3 = resolveTeaseIntensity(p2)
    local function duration(p1) -- Line: 307 -- upvalues: u4 (val)
        return p1 / u4
    end
    local v4 = duration(4.5)
    local v5 = {
        speed = u4,
        startSizeScale = startSizeScale,
        intensity = v3,
        growDuration = v4,
        growTweenInfo = TweenInfo.new(v4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    }
    if not v2 then
        v1 = 7
    else
        v1 = 4
    end
    v5.rockRiseDuration = duration(v1)
    if not v2 then
        v1 = 1.25
    else
        v1 = 0.5
    end
    v5.rockRiseDelayMax = duration(v1)
    if not v2 then
        v1 = 3
    else
        v1 = 1.5
    end
    v5.rockSpawnStaggerSpan = duration(v1)
    if not v2 then
        v1 = 3
    else
        v1 = 2
    end
    v5.rockFadeDelay = duration(v1)
    if not v2 then
        v1 = 0.35
    else
        v1 = 0.65
    end
    v5.rockOrbitAngularSpeedMin = v1 * u4
    if not v2 then
        v1 = 1.1
    else
        v1 = 1.8
    end
    v5.rockOrbitAngularSpeedMax = v1 * u4
    v5.rockSpinSpeedMin = 2 * u4
    v5.rockSpinSpeedMax = 6 * u4
    if not v2 then
        v1 = 4
    else
        v1 = 0.75
    end
    v5.rockLightningSwirlDuration = duration(v1)
    if not v2 then
        v1 = 6
    else
        v1 = 3.5
    end
    v5.rockOrbitExpandDuration = duration(v1)
    if not v2 then
        v1 = 6
    else
        v1 = 3.5
    end
    v5.rockLightningExpandBuildupDuration = duration(v1)
    if not v2 then
        v1 = 0.035
    else
        v1 = 0.02
    end
    v5.rockLightningJumpMin = duration(v1)
    if not v2 then
        v1 = 0.075
    else
        v1 = 0.045
    end
    v5.rockLightningJumpMax = duration(v1)
    if not v2 then
        v1 = 1.25
    else
        v1 = 0.1
    end
    v5.rockLightningStartDelay = duration(v1)
    v5.kickRockWaveDelay = duration(0.2)
    v5.kickUpwardSpeedMin = 50 * u4
    v5.kickUpwardSpeedMax = 90 * u4
    v5.kickOutwardSpeedMin = 16 * u4
    v5.kickOutwardSpeedMax = 38 * u4
    return v5
end
local u234 = {"Torso", "Left Arm", "Right Arm"}
local u242 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local u247 = Vector3.new(0, -220, 0)
local v2 = {}
local v3 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 165, 47))
local v4 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 168, 87))
v2[1] = v3
v2[2] = v4
v2[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(252, 170, 78))
local u274 = ColorSequence.new(v2)
local u275 = {}
local u276 = {}
local u277 = {}
local function scaleSize(p1, p2) -- Line: 465
    local v1 = {}
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        table.insert(v1, NumberSequenceKeypoint.new(j.Time, j.Value * p2, j.Envelope * p2))
    end
    return NumberSequence.new(v1)
end
local function registerParticleGrowth(p1, p2, p3) -- Line: 482 -- upvalues: scaleSize (val), NumberSequence (val)
    local Size = p2.Size
    local v1 = scaleSize(Size, p3.startSizeScale)
    local v2 = NumberSequence.tweenNumberSequence(v1, Size, p3.growTweenInfo)
    p2.Size = v1
    table.insert(p1, {emitter = p2, goalSize = Size, get = v2.get, destroy = v2.destroy})
end
local function registerInstanceGrowth(p1, p2, p3) -- Line: 503 -- upvalues: registerParticleGrowth (val)
    if p2:IsA("ParticleEmitter") then
        registerParticleGrowth(p1, p2, p3)
    end
    for i, j in p2:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            registerParticleGrowth(p1, j, p3)
        end
    end
end
local function sampleCirclePositions(p1, p2, p3, p4) -- Line: 523
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = {}
    local v11 = p4 * p4
    local v12 = p3 * p3
    local v13 = p2 - p3
    local v14 = p1
    local v15 = 1
    local v16 = p3
    for i = 1, v14, v15 do
        v1 = 40
        v2 = 1
        for j = 1, v1, v2 do
            v3 = math.random() * math.pi * 2
            v4 = v16 + math.sqrt((math.random())) * v13
            v6 = math.cos(v3) * v4
            v5 = Vector2.new(v6, math.sin(v3) * v4)
            if v5.Magnitude ^ 2 >= v12 then
                v6 = true
                v7 = v10
                v8 = nil
                v9 = nil
                for k, n in v7, v8, v9 do
                    if (n - v5).Magnitude ^ 2 < v11 then
                        v6 = false
                        break
                    end
                end
                if v6 then
                    table.insert(v10, v5)
                    break
                end
            end
        end
    end
    return v10
end
local function getDomeHeightOffset(p1, p2) -- Line: 568
    local domeRadius = p1.domeRadius
    local v1 = math.clamp(p2, 0, domeRadius)
    local v2 = domeRadius * domeRadius - v1 * v1
    return p1.domeBaseHeight + math.sqrt((math.max(v2, 0))) * p1.domeHeightScale
end
local function prepareRock(p1) -- Line: 580
    if p1:IsA("BasePart") then
        p1.Anchored = true
        p1.CanCollide = false
        p1.CanQuery = false
        p1.CanTouch = false
        p1.Massless = true
        return p1
    end
    if not (p1:IsA("Model")) then
        return nil
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.Massless = true
        end
    end
    local PrimaryPart = p1.PrimaryPart
    if not PrimaryPart then
        PrimaryPart = p1:FindFirstChildWhichIsA("BasePart", true)
    end
    return PrimaryPart
end
local function setRockCFrame(p1, p2, p3) -- Line: 614
    if p1:IsA("Model") then
        p1:PivotTo(p3)
        return
    end
    p2.CFrame = p3
end
local function createRockSpinSpeed(p1) -- Line: 626
    local function randomSpinAxis() -- Line: 627 -- upvalues: p1 (val)
        local v1
        if math.random(0, 1) ~= 0 then
            v1 = -1
        else
            v1 = 1
        end
        return v1 * math.random(p1.rockSpinSpeedMin * 100, p1.rockSpinSpeedMax * 100) / 100
    end
    return (Vector3.new(randomSpinAxis(), randomSpinAxis(), randomSpinAxis()))
end
local function createOrbitPoint(p1) -- Line: 640
    local Part = Instance.new("Part")
    Part.Name = "OrbitPoint"
    Part.Shape = Enum.PartType.Ball
    Part.Size = Vector3.new(0.2, 0.2, 0.2)
    Part.Transparency = 1
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Massless = true
    Part.CastShadow = false
    Part.Parent = p1
    return Part
end
local function getRockFadeParts(p1, p2) -- Line: 662
    if not (p1:IsA("Model")) then
        return {p2}
    end
    local v1 = {}
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            table.insert(v1, j)
        end
    end
    return v1
end
local function startRockFade(p1) -- Line: 681 -- upvalues: TweenService (val), u242 (val)
    if p1.fadeStarted then
        return
    end
    p1.fadeStarted = true
    local fadeParts = p1.fadeParts
    local v1 = nil
    local v2 = nil
    for i, j in fadeParts, v1, v2 do
        if j.Parent then
            TweenService:Create(j, u242, {Transparency = 1}):Play()
        end
    end
end
local function createKickRockSpinSpeed(p1) -- Line: 700 -- upvalues: createRockSpinSpeed (val)
    return createRockSpinSpeed(p1) * 1.75
end
local function spawnKickRockBurst(p1, p2, p3, p4) -- Line: 713 -- upvalues: Special (val), prepareRock (val), createKickRockSpinSpeed (val), getRockFadeParts (val)
    local BoundingBox, BoundingBox_2, Unit, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    if not p3.intensity.rockVisible then
        return
    end
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return
    end
    local Rock = Special:FindFirstChild("Rock")
    if not Rock then
        return
    end
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    local v19 = Vector3.new(Torso.Position.X, BoundingBox.Position.Y - BoundingBox_2.Y / 2 + -1.5, Torso.Position.Z)
    local v20 = math.max(8, 22 - (p4 - 1) * 6)
    local v21 = 1
    v1, v9, v2 = p1, p3, p2
    for i = 1, v20, v21 do
        v3 = math.random() * math.pi * 2
        v4 = math.sqrt((math.random())) * 9 + 3
        v6 = math.cos(v3) * v4
        v5 = Vector2.new(v6, math.sin(v3) * v4)
        v6 = v19 + Vector3.new(v5.X, 0, v5.Y)
        v8 = math.rad((math.random(-50, 50)))
        v10 = math.rad((math.random(0, 360)))
        v7 = CFrame.Angles(v8, v10, (math.rad((math.random(-50, 50)))))
        v8 = Rock:Clone()
        v10 = prepareRock(v8)
        if v10 then
            v11 = math.random(45, 95) / 100
            v12 = CFrame.new(v6) * v7
            if not (v8:IsA("Model")) then
                v10.Size = v10.Size * v11
                v10.CFrame = v12
            else
                v8:ScaleTo(v8:GetScale() * v11)
                v8:PivotTo(v12)
            end
            v8.Parent = v1
            v13 = Vector3.new(v5.X, 0, v5.Y)
            if 0.05 >= v13.Magnitude then
                Unit = Vector3.xAxis
            else
                Unit = v13.Unit
            end
            v14 = math.random(v9.kickUpwardSpeedMin * 100, v9.kickUpwardSpeedMax * 100) / 100
            v15 = v9.kickOutwardSpeedMin * 100
            v16 = Vector3.new(0, v14, 0)
            v15 = v16 + Unit * (math.random(v15, v9.kickOutwardSpeedMax * 100) / 100)
            v17 = math.random(-10, 10)
            v18 = math.random(-6, 12)
            v17 = {
                fadeStarted = false,
                elapsed = 0,
                point = v10,
                rock = v8,
                rotationOffset = v7,
                spinSpeed = createKickRockSpinSpeed(v9),
            }
            v17.velocity = v15 + Vector3.new(v17, v18, math.random(-10, 10))
            v17.fadeParts = getRockFadeParts(v8, v10)
            v17.lifetime = math.random(160, 260) / 100
            table.insert(v2, v17)
        else
            v8:Destroy()
        end
    end
end
local function startKickRockWaves(p1, p2, p3) -- Line: 791 -- upvalues: u275 (val), spawnKickRockBurst (val)
    local v1 = 3
    local v2 = 1
    for i = 1, v1, v2 do
        task.delay((i - 1) * p3.kickRockWaveDelay, function() -- Line: 793 -- upvalues: u275 (upval), p1 (val), spawnKickRockBurst (upval), p2 (val), p3 (val), i (val)
            local v1 = u275[p1]
            if not v1 or v1.cancelled or not p1.Parent then
                return
            end
            spawnKickRockBurst(p1, p2, p3, i)
        end)
    end
end
local function updateKickRocks(p1, p2) -- Line: 810 -- upvalues: u247 (val), setRockCFrame (val), startRockFade (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = 1
    local v8 = -1
    v1, v2 = p1, p2
    for i = #p1, v7, v8 do
        v3 = v1[i]
        if v3.point.Parent then
            v3.elapsed = v3.elapsed + v2
            v3.velocity = v3.velocity + u247 * v2
            v4 = v3.point.Position + v3.velocity * v2
            v3.rotationOffset = v3.rotationOffset * CFrame.Angles(v3.spinSpeed.X * v2, v3.spinSpeed.Y * v2, v3.spinSpeed.Z * v2)
            v6 = CFrame.new(v4)
            v5 = v6 * v3.rotationOffset
            if not v3.rock then
                v3.point.CFrame = v5
            else
                setRockCFrame(v3.rock, v3.point, v5)
            end
            if not v3.fadeStarted and v3.lifetime <= v3.elapsed then
                startRockFade(v3)
            end
        else
            table.remove(v1, i)
        end
    end
end
local function onSpawnRisingRocks(p1, p2, p3) -- Line: 843 -- upvalues: Special (val), sampleCirclePositions (val), prepareRock (val), createRockSpinSpeed (val), createOrbitPoint (val), getRockFadeParts (val), u275 (val), getDomeHeightOffset (val)
    local BoundingBox, BoundingBox_2, Rock, u1, u196, u232, v1, v2, v3, v4, v5, v6, v7, v8
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return
    end
    local intensity = p3.intensity
    if not intensity.rockVisible then
        Rock = nil
    else
        Rock = Special:WaitForChild("Rock")
    end
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    local v9 = BoundingBox.Position.Y - BoundingBox_2.Y / 2
    if not intensity.useDomeLayout then
        v8 = Vector3.new(Torso.Position.X, v9 - 3 - 1, Torso.Position.Z)
    else
        v8 = Vector3.new(Torso.Position.X, Torso.Position.Y - 6, Torso.Position.Z)
    end
    local v10 = sampleCirclePositions(intensity.rockCount, intensity.rockSpawnRadius, intensity.rockSpawnMinRadius, intensity.rockMinSpacing)
    local v11 = #v10
    local v12 = v10
    local v13 = nil
    local v14 = nil
    u232, u196, u1 = p1, p3, p2
    for i, j in v12, v13, v14 do
        local u77 = v8 + Vector3.new(j.X, math.random(intensity.spawnYOffsetMin * 100, intensity.spawnYOffsetMax * 100) / 100, j.Y)
        v2 = math.rad((math.random(-35, 35)))
        v3 = math.rad((math.random(0, 360)))
        v1 = CFrame.Angles(v2, v3, (math.rad((math.random(-35, 35)))))
        local u104 = math.random(intensity.riseHeightMin * 100, intensity.riseHeightMax * 100) / 100
        local u105 = nil
        if not intensity.rockVisible then
            u164 = createOrbitPoint(u232)
            u164.CFrame = CFrame.new(u77)
            identity = CFrame.identity
            zero = Vector3.zero
            if not u105 then
                u178 = {}
            elseif u164 then
                local u178 = getRockFadeParts(u105, u164)
            end
            if 1 >= v11 then
                v5 = math.random() * u196.rockRiseDelayMax
            else
                v5 = (i - 1) / (v11 - 1) * u196.rockSpawnStaggerSpan + math.random() * u196.rockRiseDelayMax
            end
            local u216 = u196.rockRiseDuration * (math.random(90, 120) / 100)
            if math.random(0, 1) ~= 0 then
                u222 = -1
            else
                local u222 = 1
            end
            task.delay(v5, function() -- Line: 919 -- upvalues: u275 (upval), u232 (val), u164 (ref), u77 (val), j (val), intensity (val), getDomeHeightOffset (upval), u104 (val), u1 (val), u105 (ref), identity (ref), zero (ref), u196 (val), u222 (val), u216 (val), u178 (val)
                local v1
                local v2 = u275[u232]
                if not v2 or v2.cancelled or not u164.Parent then
                    return
                end
                local Torso = u232:FindFirstChild("Torso")
                if not Torso then
                    return
                end
                local v3 = u77.Y - Torso.Position.Y
                local v4 = math.max(j.Magnitude, intensity.rockSpawnMinRadius)
                if not intensity.useDomeLayout then
                    v1 = v3 + u104
                else
                    v1 = getDomeHeightOffset(intensity, v4)
                end
                local v5 = {
                    riseElapsed = 0,
                    fadeStarted = false,
                    point = u164,
                    rock = u105,
                    rotationOffset = identity,
                    spinSpeed = zero,
                    startRadius = v4,
                    radius = v4,
                    angle = math.atan2(j.Y, j.X),
                }
                local v6 = math.random(u196.rockOrbitAngularSpeedMin * 100, u196.rockOrbitAngularSpeedMax * 100) / 100
                v5.angularSpeed = v6 * u222
                v5.startHeightOffset = v3
                v5.targetHeightOffset = v1
                v5.riseDuration = u216
                v5.fadeParts = u178
                table.insert(u1, v5)
            end)
        elseif Rock then
            v4 = Rock:Clone()
            v5 = prepareRock(v4)
            if v5 then
                v6 = math.random(80, 130) / 100
                v7 = CFrame.new(u77) * v1
                if not (v4:IsA("Model")) then
                    v5.Size = v5.Size * v6
                    v5.CFrame = v7
                else
                    v4:ScaleTo(v4:GetScale() * v6)
                    v4:PivotTo(v7)
                end
                v4.Parent = u232
                u105 = v4
                local u164 = v5
                local identity = v1
                local zero = createRockSpinSpeed(u196)
            else
                v4:Destroy()
            end
        end
    end
end
local function getRockLightningExpandAlpha(p1, p2) -- Line: 963
    local v1 = os.clock() - p1
    local v2 = v1 - p2.rockLightningSwirlDuration
    if v2 <= 0 then
        return 0
    end
    v1 = math.clamp(v2 / p2.rockOrbitExpandDuration, 0, 1)
    return v1 * v1
end
local function getRockLightningSizeMultiplier(p1, p2) -- Line: 978 -- upvalues: getRockLightningExpandAlpha (val)
    return (p2.intensity.lightningSizeScaleMax - 1) * getRockLightningExpandAlpha(p1, p2) + 1
end
local function getRockOrbitRadiusMultiplier(p1, p2) -- Line: 988 -- upvalues: getRockLightningExpandAlpha (val)
    return (p2.intensity.orbitExpandScaleMax - 1) * getRockLightningExpandAlpha(p1, p2) + 1
end
local function updateOrbitingRocks(p1, p2, p3, p4, p5) -- Line: 1001 -- upvalues: getRockOrbitRadiusMultiplier (val), getDomeHeightOffset (val), startRockFade (val), setRockCFrame (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return
    end
    local Position = Torso.Position
    local v13 = getRockOrbitRadiusMultiplier(p4, p5)
    local intensity = p5.intensity
    local v14 = 1
    local v15 = -1
    v1, v9, v11, v12 = p2, p3, p4, p5
    for i = #p2, v14, v15 do
        v2 = v1[i]
        if v2.point.Parent then
            v2.riseElapsed = v2.riseElapsed + v9
            v4 = v2.riseElapsed / v2.riseDuration
            v3 = math.clamp(v4, 0, 1)
            v3 = 1 - (1 - v3) * (1 - v3)
            v2.angle = v2.angle + v2.angularSpeed * v9
            v2.radius = v2.startRadius * v13
            if not intensity.useDomeLayout then
                v4 = v2.startHeightOffset + (v2.targetHeightOffset - v2.startHeightOffset) * v3
            else
                v5 = getDomeHeightOffset(intensity, v2.radius)
                v4 = v2.startHeightOffset + (v5 - v2.startHeightOffset) * v3
            end
            if v2.rock then
                v2.rotationOffset = v2.rotationOffset * CFrame.Angles(v2.spinSpeed.X * v9, v2.spinSpeed.Y * v9, v2.spinSpeed.Z * v9)
            end
            if intensity.rockVisible and v2.rock and not v2.fadeStarted then
                v5 = os.clock() - v11
                if v12.rockFadeDelay <= v5 then
                    startRockFade(v2)
                end
            end
            v8 = math.cos(v2.angle)
            v7 = v8 * v2.radius
            v10 = math.sin(v2.angle)
            v7 = CFrame.new(Position + Vector3.new(v7, v4, v10 * v2.radius))
            v6 = v7 * v2.rotationOffset
            if not v2.rock then
                v2.point.CFrame = v6
            else
                setRockCFrame(v2.rock, v2.point, v6)
            end
        else
            table.remove(v1, i)
        end
    end
end
local function createFakeAttachment(p1, p2) -- Line: 1074
    return {WorldPosition = p1, WorldAxis = p2}
end
local function getBoltCurveAxis(p1) -- Line: 1086
    local v1 = p1:Cross(Vector3.yAxis)
    if v1.Magnitude < 0.05 then
        v1 = p1:Cross(Vector3.xAxis)
    end
    return v1.Unit
end
local function syncRockBoltAttachments(p1, p2, p3, p4) -- Line: 1103 -- upvalues: getBoltCurveAxis (val)
    local Unit
    local v1 = p4 - p3
    if v1.Magnitude >= 0.001 then
        Unit = v1.Unit
    else
        Unit = Vector3.new(0, 1, 0)
    end
    local v2 = getBoltCurveAxis(Unit)
    p1.WorldPosition = p3
    p1.WorldAxis = v2
    p2.WorldPosition = p4
    p2.WorldAxis = -v2
end
local function updateRockBoltCurve(p1, p2, p3, p4) -- Line: 1127
    local v1 = (p3 - p2).Magnitude * p4.lightningCurveFactor * p1.curveSign
    p1.bolt.CurveSize0 = v1
    p1.bolt.CurveSize1 = v1
end
local function createRockLightningBolt(p1, p2, p3, p4) -- Line: 1146 -- upvalues: Lightning (val), u274 (val)
    local v1
    local v2 = Lightning.new(p1, p2, p4.lightningPartCount)
    v2.Color = u274
    v2.Thickness = p3
    v2.MinRadius = 0
    v2.MaxRadius = p4.lightningBoltRadius
    if not p4.powerfulBolts then
        v1 = 2.25
    else
        v1 = 3.75
    end
    v2.Frequency = v1
    if not p4.powerfulBolts then
        v1 = 18
    else
        v1 = 30
    end
    v2.AnimationSpeed = v1
    if not p4.powerfulBolts then
        v1 = 14
    else
        v1 = 22
    end
    v2.PulseSpeed = v1
    v2.PulseLength = 1000000
    if not p4.powerfulBolts then
        v1 = 0.08
    else
        v1 = 0.04
    end
    v2.FadeLength = v1
    v2.MinTransparency = 0
    v2.MaxTransparency = 0
    v2.ColorOffsetSpeed = 0
    if not p4.powerfulBolts then
        v1 = 0.2
    else
        v1 = 0.45
    end
    v2.MinThicknessMultiplier = v1
    if not p4.powerfulBolts then
        v1 = 0.65
    else
        v1 = 1.15
    end
    v2.MaxThicknessMultiplier = v1
    if not p4.powerfulBolts then
        v1 = 1.1
    else
        v1 = 1.35
    end
    v2.ContractFrom = v1
    return v2
end
local function releaseRockBolt(p1, p2) -- Line: 1177
    if p1.released then
        return
    end
    p1.released = true
    p1.bolt.Enabled = false
    if not p2 or 0 >= p2 then
        pcall(function() -- Line: 1188 -- upvalues: p1 (val)
            p1.bolt:Destroy()
        end)
        return
    end
    p1.bolt.Enabled = true
    p1.bolt:DestroyDissipate(p2, 0.5)
end
local function pickNearbyRockEntry(p1, p2, p3, p4) -- Line: 1201
    local v1 = {}
    local v2 = p2
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j ~= p1 and j ~= p3 and j.point.Parent and (j.point.Position - p1.point.Position).Magnitude <= p4.lightningMaxDistance then
            table.insert(v1, j)
        end
    end
    if #v1 == 0 then
        return nil
    end
    return v1[math.random(1, #v1)]
end
local function normalizeAngleDelta(p1) -- Line: 1232
    local v1
    while p1 < 0 do end
    while math.pi * 2 <= v1 do
        v1 = v1 - math.pi * 2
    end
    return v1
end
local function pickNextRockInOrbit(p1, p2, p3, p4, p5) -- Line: 1252 -- upvalues: normalizeAngleDelta (val), pickNearbyRockEntry (val)
    local Magnitude, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = nil
    local huge = math.huge
    local v10 = p2
    local v11 = nil
    local v12 = nil
    v1, v2, v6, v8, v7 = p1, p2, p3, p5, p4
    for i, j in v10, v11, v12 do
        if j ~= v1 and j ~= v6 and j.point.Parent then
            Magnitude = (j.point.Position - v1.point.Position).Magnitude
            if v8.lightningMaxDistance >= Magnitude then
                v3 = normalizeAngleDelta((j.angle - v1.angle) * v7)
                v5 = math.abs(v3 - v8.lightningOrbitStep)
                v4 = v5 + Magnitude * 0.04
                if v8.useDomeLayout then
                    v4 = v4 + math.abs(j.radius - v1.radius) * 0.12
                end
                if math.rad(140) < v3 then
                    v4 = v4 + 100
                end
                if v4 < huge then
                    huge = v4
                    v9 = j
                end
            end
        end
    end
    if v9 then
        return v9
    end
    return pickNearbyRockEntry(v1, v2, v6, v8)
end
local function getRockBoltJumpDelay(p1) -- Line: 1300
    return math.random(p1.rockLightningJumpMin * 100, p1.rockLightningJumpMax * 100) / 100
end
local function createRockBoltEntry(p1, p2, p3, p4, p5) -- Line: 1311 -- upvalues: createFakeAttachment (val), syncRockBoltAttachments (val), createRockLightningBolt (val), getRockBoltJumpDelay (val), updateRockBoltCurve (val)
    local v1
    local Position = p1.point.Position
    local Position_2 = p2.point.Position
    local v2 = createFakeAttachment(Position, (Vector3.new(0, 1, 0)))
    local v3 = createFakeAttachment(Position_2, (Vector3.new(0, -1, 0)))
    syncRockBoltAttachments(v2, v3, Position, Position_2)
    local intensity = p5.intensity
    if math.random(0, 1) ~= 0 then
        v1 = -1
    else
        v1 = 1
    end
    local v4 = {
        released = false,
        bolt = createRockLightningBolt(v2, v3, p4, intensity),
        attachment0 = v2,
        attachment1 = v3,
        sourceEntry = p1,
        targetEntry = p2,
        nextJumpAt = os.clock() + getRockBoltJumpDelay(p5),
        orbitDirection = p3,
        curveSign = v1,
    }
    updateRockBoltCurve(v4, Position, Position_2, intensity)
    return v4
end
local function jumpRockBolt(p1, p2, p3) -- Line: 1348 -- upvalues: pickNextRockInOrbit (val), getRockBoltJumpDelay (val)
    local intensity = p3.intensity
    local targetEntry = p1.targetEntry
    local v1 = pickNextRockInOrbit(targetEntry, p2, p1.sourceEntry, p1.orbitDirection, intensity)
    if not v1 then
        v1 = pickNextRockInOrbit(p1.sourceEntry, p2, p1.targetEntry, p1.orbitDirection, intensity)
    end
    if not v1 then
        p1.nextJumpAt = os.clock() + getRockBoltJumpDelay(p3)
        return
    end
    p1.sourceEntry = targetEntry
    p1.targetEntry = v1
    p1.nextJumpAt = os.clock() + getRockBoltJumpDelay(p3)
end
local function updateRockLightning(p1, p2, p3, p4) -- Line: 1380 -- upvalues: getRockLightningSizeMultiplier (val), releaseRockBolt (val), syncRockBoltAttachments (val), updateRockBoltCurve (val), jumpRockBolt (val)
    local Position, Position_2, Position_3, Position_4, sourceEntry, targetEntry, v1, v2, v3, v4
    local intensity = p4.intensity
    local v5 = os.clock()
    local v6 = getRockLightningSizeMultiplier(p3, p4)
    local v7 = intensity.lightningThickness * v6
    local v8 = intensity.lightningBoltRadius * v6
    local v9 = 1
    local v10 = -1
    v2, v1, v4 = p2, p1, p4
    for i = #p2, v9, v10 do
        v3 = v2[i]
        sourceEntry = v3.sourceEntry
        targetEntry = v3.targetEntry
        if not sourceEntry.point.Parent then
            releaseRockBolt(v3)
            table.remove(v2, i)
        elseif targetEntry.point.Parent then
            Position = sourceEntry.point.Position
            Position_2 = targetEntry.point.Position
            v3.bolt.Thickness = v7
            v3.bolt.MaxRadius = v8
            syncRockBoltAttachments(v3.attachment0, v3.attachment1, Position, Position_2)
            updateRockBoltCurve(v3, Position, Position_2, intensity)
            if v3.nextJumpAt <= v5 then
                jumpRockBolt(v3, v1, v4)
                Position_3 = v3.sourceEntry.point.Position
                Position_4 = v3.targetEntry.point.Position
                syncRockBoltAttachments(v3.attachment0, v3.attachment1, Position_3, Position_4)
                updateRockBoltCurve(v3, Position_3, Position_4, intensity)
            end
        end
    end
end
local function getLightningBuildupAlpha(p1, p2) -- Line: 1427
    local v1 = os.clock() - p1
    local v2 = v1 - p2.rockLightningSwirlDuration
    if v2 <= 0 then
        return 0
    end
    v1 = math.clamp(v2 / p2.rockLightningExpandBuildupDuration, 0, 1)
    return v1 * v1
end
local function getMaxActiveLightning(p1, p2) -- Line: 1442 -- upvalues: getLightningBuildupAlpha (val)
    local v1 = getLightningBuildupAlpha(p1, p2)
    local intensity = p2.intensity
    return (math.floor(intensity.lightningMaxActiveMin + (intensity.lightningMaxActiveMax - intensity.lightningMaxActiveMin) * v1))
end
local function getLightningSpawnInterval(p1, p2) -- Line: 1455 -- upvalues: getLightningBuildupAlpha (val)
    local v1 = getLightningBuildupAlpha(p1, p2)
    local intensity = p2.intensity
    return intensity.lightningSpawnIntervalMax + (intensity.lightningSpawnIntervalMin - intensity.lightningSpawnIntervalMax) * v1
end
local function tryCreateRockChain(p1, p2, p3, p4, p5, p6) -- Line: 1469 -- upvalues: u275 (val), pickNextRockInOrbit (val), pickNearbyRockEntry (val), createRockBoltEntry (val), getRockLightningSizeMultiplier (val), releaseRockBolt (val)
    local v1
    local v2 = u275[p1]
    if not v2 or v2.cancelled or v2.lightningDisabled or #p2 < 2 or p4 <= #p3 then
        return false
    end
    local intensity = p6.intensity
    local v3 = p2[math.random(1, #p2)]
    if not v3.point.Parent then
        return false
    end
    if 0 > v3.angularSpeed then
        v1 = -1
    else
        v1 = 1
    end
    local v4 = pickNextRockInOrbit(v3, p2, nil, v1, intensity)
    if not v4 then
        v4 = pickNearbyRockEntry(v3, p2, nil, intensity)
    end
    if not v4 then
        return false
    end
    v2 = u275[p1]
    if not v2 or v2.cancelled or v2.lightningDisabled then
        return false
    end
    local v5 = intensity.lightningThickness * getRockLightningSizeMultiplier(p5, p6)
    local v6 = createRockBoltEntry(v3, v4, v1, v5, p6)
    v2 = u275[p1]
    if not v2 or v2.cancelled or v2.lightningDisabled then
        releaseRockBolt(v6)
        return false
    end
    table.insert(p3, v6)
    return true
end
local function startRockLightning(p1, p2, p3, p4, p5) -- Line: 1532 -- upvalues: u275 (val), tryCreateRockChain (val), getMaxActiveLightning (val), getLightningSpawnInterval (val), releaseRockBolt (val)
    task.delay(p5.rockLightningStartDelay, function() -- Line: 1539 -- upvalues: p5 (val), p1 (val), u275 (upval), tryCreateRockChain (upval), p2 (val), p3 (val), getMaxActiveLightning (upval), p4 (val), getLightningSpawnInterval (upval), releaseRockBolt (upval)
        local v1
        local lightningSpawnLoops = p5.intensity.lightningSpawnLoops
        local v2 = 1
        for i = 1, lightningSpawnLoops, v2 do
            task.spawn(function() -- Line: 1541 -- upvalues: p1 (upval), u275 (upval), tryCreateRockChain (upval), p2 (upval), p3 (upval), getMaxActiveLightning (upval), p4 (upval), p5 (upval), getLightningSpawnInterval (upval)
                local v1, v2
                while p1.Parent do
                    v1 = u275[p1]
                    if not v1 or v1.cancelled or v1.lightningDisabled then
                        break
                    end
                    v2 = getMaxActiveLightning(p4, p5)
                    tryCreateRockChain(p1, p2, p3, v2, p4, p5)
                    task.wait(getLightningSpawnInterval(p4, p5))
                end
            end)
        end
        while p1.Parent do
            v1 = u275[p1]
            if not v1 or v1.cancelled or v1.lightningDisabled then
                break
            end
            task.wait(0.05)
        end
        v1 = u275[p1]
        v2 = p3
        local v3 = nil
        local v4 = nil
        for j, k in v2, v3, v4 do
            releaseRockBolt(k)
        end
        table.clear(p3)
        if v1 then
            table.clear(v1.rockBolts)
        end
    end)
end
local function applyBodyLightningIntensity(p1, p2) -- Line: 1589 -- upvalues: scaleSize (val)
    local function apply(p1) -- Line: 1590 -- upvalues: scaleSize (upval), p2 (val)
        p1.Size = scaleSize(p1.Size, p2.bodyLightningSizeScale)
        p1.Rate = p1.Rate * p2.bodyLightningRateScale
        p1.Brightness = p1.Brightness * p2.bodyLightningBrightnessScale
    end
    if p1:IsA("ParticleEmitter") then
        apply(p1)
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            apply(j)
        end
    end
end
local function onShowBodyLightning(p1, p2, p3, p4) -- Line: 1614 -- upvalues: u234 (val), Shifter (val), applyBodyLightningIntensity (val), registerInstanceGrowth (val)
    local v1, v2
    local v3 = u234
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v2 = p1:FindFirstChild(j)
        if v2 then
            v1 = Shifter.Lightning.Lightning:Clone()
            v1.Parent = v2
            applyBodyLightningIntensity(v1, p4.intensity)
            registerInstanceGrowth(p2, v1, p4)
            v1.Enabled = true
            table.insert(p3, v1)
        end
    end
end
local function onSpawnParticleAttachment(p1, p2) -- Line: 1642 -- upvalues: Shifter (val), Titans (val), Particles (val)
    local Shift
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return nil
    end
    if p2 ~= "Shift" then
        local Tease = Titans:WaitForChild("Tease")
        Shift = Tease:WaitForChild("Tease")
    else
        Shift = Shifter:WaitForChild("Shift")
    end
    if not (Shift:IsA("Attachment")) then
        return nil
    end
    local v1 = Shift:Clone()
    v1.Parent = Torso
    Particles.deepEnableParticles(v1)
    Particles.deepEmitParticles(v1)
    return v1
end
local function getTeaseShakeIntensity(p1) -- Line: 1669 -- upvalues: Alive (val), Character (val)
    local LocalPlayer = Alive.LocalPlayer
    if not LocalPlayer then
        return 0
    end
    local v1 = Character.getPosition(LocalPlayer)
    if not v1 then
        return 0
    end
    local Magnitude = (p1:GetPivot().Position - v1).Magnitude
    if 240 <= Magnitude then
        return 0
    end
    if Magnitude <= 100 then
        return 1
    end
    return 1 - (Magnitude - 100) / 140
end
local function getTeaseSustainShakeIntensity(p1) -- Line: 1697 -- upvalues: RunService (val), Workspace (val), Alive (val), Character (val)
    local Magnitude, Position
    if not (RunService:IsClient()) then
        return 0
    end
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        Position = nil
    else
        Position = CurrentCamera.CFrame.Position
    end
    if Position then
        Magnitude = (p1:GetPivot().Position - Position).Magnitude
        if 10000 <= Magnitude then
            return 0
        end
        if Magnitude <= 1000 then
            return 1
        end
        return 1 - (Magnitude - 1000) / 9000
    end
    local LocalPlayer = Alive.LocalPlayer
    if not LocalPlayer then
        return 0
    end
    Position = Character.getPosition(LocalPlayer)
    Magnitude = (p1:GetPivot().Position - Position).Magnitude
    if 10000 <= Magnitude then
        return 0
    end
    if Magnitude <= 1000 then
        return 1
    end
    return 1 - (Magnitude - 1000) / 9000
end
local function getTeaseSustainShakeStrength(p1, p2) -- Line: 1733
    local v1 = math.clamp(p1 / p2, 0, 1)
    return v1 * v1 * 0.88 + 0.12
end
local function startTeaseCameraShake(p1) -- Line: 1744 -- upvalues: Workspace (val), getTeaseShakeIntensity (val), Shake (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v1 = getTeaseShakeIntensity(p1)
    if v1 <= 0 then
        return
    end
    local v2 = Shake.new()
    v2.FadeInTime = 0.2
    v2.FadeOutTime = 0
    v2.SustainTime = 3
    v2.Frequency = 0.14
    v2.Amplitude = v1 * 0.4
    v2.RotationInfluence = Vector3.one * (v1 * 0.03)
    v2.PositionInfluence = Vector3.one * (v1 * 0.06)
    v2:Start()
    v2:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 1765 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
end
local function stopTeaseSound(p1, p2) -- Line: 1776 -- upvalues: Sounds (val)
    if not p1.soundId then
        return
    end
    Sounds.stopGlobalSoundEffect(p1.soundId, p2 or 0.35)
    p1.soundId = nil
end
local function startTeaseSound(p1, p2, p3) -- Line: 1792 -- upvalues: RunService (val), stopTeaseSound (val), Sounds (val)
    local fadeIn, fadeOut, volume
    if not (RunService:IsClient()) then
        return
    end
    stopTeaseSound(p1)
    if not p2.volume then
        volume = 3
    elseif 0 < p2.volume then
        volume = p2.volume
    end
    if p2.fadeIn == nil then
        fadeIn = 0.1
    elseif 0 <= p2.fadeIn then
        fadeIn = p2.fadeIn
    end
    if p2.fadeOut == nil then
        fadeOut = 0.35
    elseif 0 > p2.fadeOut then
        fadeOut = 0.35
    else
        fadeOut = p2.fadeOut
    end
    Sounds.playGlobalSoundEffect(p2.id, fadeIn, volume, 500, nil, fadeOut)
    p1.soundId = p2.id
end
local function stopTeaseSustainShake(p1, p2) -- Line: 1819
    if p1.cameraShakeConnection then
        p1.cameraShakeConnection:Disconnect()
        p1.cameraShakeConnection = nil
    end
    local cameraShake = p1.cameraShake
    p1.cameraShake = nil
    if not cameraShake then
        return
    end
    if not p2 or not (cameraShake:IsShaking()) then
        cameraShake:Destroy()
        return
    end
    cameraShake.FadeOutTime = 0.35
    cameraShake:StopSustain()
end
local function startTeaseSustainShake(p1, p2, p3, p4) -- Line: 1847 -- upvalues: RunService (val), stopTeaseSustainShake (val), Workspace (val), getTeaseSustainShakeIntensity (val), Shake (val), getTeaseSustainShakeStrength (val)
    if not (RunService:IsClient()) then
        return
    end
    stopTeaseSustainShake(p2)
    if not Workspace.CurrentCamera then
        return
    end
    local u15 = getTeaseSustainShakeIntensity(p1)
    if u15 <= 0 then
        return
    end
    local u19 = Shake.new()
    u19.FadeInTime = 0
    u19.FadeOutTime = 0
    u19.Sustain = true
    u19.Frequency = 0.1
    u19.Amplitude = u15 * 0.33599999999999997
    u19.RotationInfluence = Vector3.one * (u15 * 0.016800000000000002)
    u19.PositionInfluence = Vector3.one * (u15 * 0.0288)
    u19:Start()
    u19:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, a2, p3) -- Line: 1876 -- upvalues: p2 (val), u19 (val), Workspace (upval)
        if p3 then
            if p2.cameraShake == u19 then
                p2.cameraShake = nil
            end
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            local v1 = CFrame.new(p1)
            CurrentCamera.CFrame = CurrentCamera.CFrame * (v1 * CFrame.Angles(a2.X, a2.Y, a2.Z))
        end
    end)
    p2.cameraShake = u19
    local u43 = 0
    p2.cameraShakeConnection = RunService.RenderStepped:Connect(function(p1) -- Line: 1893 -- upvalues: p2 (val), stopTeaseSustainShake (upval), u43 (ref), p4 (val), getTeaseSustainShakeStrength (upval), p3 (val), u15 (val), u19 (val)
        if p2.cancelled then
            stopTeaseSustainShake(p2, true)
            return
        end
        u43 = u43 + p1
        if p4 <= u43 then
            stopTeaseSustainShake(p2, true)
            return
        end
        local v1 = getTeaseSustainShakeStrength(u43, p3)
        local v2 = v1 * u15
        u19.Amplitude = v2 * 2.8
        u19.RotationInfluence = Vector3.one * (v2 * 0.14)
        u19.PositionInfluence = Vector3.one * (v2 * 0.24)
    end)
end
local function cancelColorCorrectionTween(p1) -- Line: 1917
    if p1.colorCorrectionTween then
        p1.colorCorrectionTween:Cancel()
        p1.colorCorrectionTween = nil
    end
end
local function playColorCorrectionTween(p1, p2, p3) -- Line: 1931 -- upvalues: cancelColorCorrectionTween (val), TweenService (val)
    cancelColorCorrectionTween(p1)
    local colorCorrection = p1.colorCorrection
    if not colorCorrection then
        return
    end
    local v1 = TweenInfo.new(p3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local u17 = TweenService:Create(colorCorrection, v1, p2)
    p1.colorCorrectionTween = u17
    u17:Play()
    u17.Completed:Once(function() -- Line: 1947 -- upvalues: p1 (val), u17 (val)
        if p1.colorCorrectionTween == u17 then
            p1.colorCorrectionTween = nil
        end
    end)
end
local function detachTeaseLighting(p1) -- Line: 1959 -- upvalues: cancelColorCorrectionTween (val)
    cancelColorCorrectionTween(p1)
    local lightingTweens = p1.lightingTweens
    local v1 = nil
    local v2 = nil
    for i, j in lightingTweens, v1, v2 do
        j:Cancel()
    end
    table.clear(p1.lightingTweens)
    p1.lightingSnapshot = nil
    p1.colorCorrection = nil
end
local function clearTeaseLighting(p1) -- Line: 1976 -- upvalues: cancelColorCorrectionTween (val), Lighting (val)
    cancelColorCorrectionTween(p1)
    local lightingTweens = p1.lightingTweens
    local v1 = nil
    local v2 = nil
    for i, j in lightingTweens, v1, v2 do
        j:Cancel()
    end
    table.clear(p1.lightingTweens)
    if p1.lightingSnapshot then
        Lighting.Ambient = p1.lightingSnapshot.Ambient
        Lighting.Brightness = p1.lightingSnapshot.Brightness
        Lighting.ColorShift_Bottom = p1.lightingSnapshot.ColorShift_Bottom
        Lighting.ColorShift_Top = p1.lightingSnapshot.ColorShift_Top
        Lighting.ExposureCompensation = p1.lightingSnapshot.ExposureCompensation
        p1.lightingSnapshot = nil
    end
    if p1.colorCorrection then
        p1.colorCorrection:Destroy()
        p1.colorCorrection = nil
    end
end
local function fadeOutTeaseLighting(p1, p2) -- Line: 2004 -- upvalues: cancelColorCorrectionTween (val), TweenService (val), Lighting (val), playColorCorrectionTween (val), u212 (val)
    local colorCorrection, lightingSnapshot
    cancelColorCorrectionTween(p1)
    local lightingTweens = p1.lightingTweens
    local v1 = nil
    local v2 = nil
    for i, j in lightingTweens, v1, v2 do
        j:Cancel()
    end
    table.clear(p1.lightingTweens)
    if p1.lightingSnapshot then
        local v3 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        if p1.lightingSnapshot then
            lightingSnapshot = p1.lightingSnapshot
            v2 = TweenService:Create(Lighting, v3, {
                Ambient = lightingSnapshot.Ambient,
                Brightness = lightingSnapshot.Brightness,
                ColorShift_Bottom = lightingSnapshot.ColorShift_Bottom,
                ColorShift_Top = lightingSnapshot.ColorShift_Top,
                ExposureCompensation = lightingSnapshot.ExposureCompensation,
            })
            table.insert(p1.lightingTweens, v2)
            v2:Play()
            v2.Completed:Once(function() -- Line: 2028 -- upvalues: p1 (val)
                p1.lightingSnapshot = nil
            end)
        end
        colorCorrection = p1.colorCorrection
        if colorCorrection then
            playColorCorrectionTween(p1, u212, p2)
            task.delay(p2, function() -- Line: 2036 -- upvalues: p1 (val), colorCorrection (val)
                if p1.colorCorrection == colorCorrection then
                    colorCorrection:Destroy()
                    p1.colorCorrection = nil
                end
            end)
        end
        return
    elseif not p1.colorCorrection then
        return
    end
end
local function scheduleTeaseLightingFlashbang(p1, p2) -- Line: 2051 -- upvalues: playColorCorrectionTween (val), u212 (val)
    local u3 = p2.growDuration / 2
    task.delay(u3, function() -- Line: 2055 -- upvalues: p1 (val), playColorCorrectionTween (upval), u3 (val)
        if p1.cancelled or not p1.colorCorrection then
            return
        end
        playColorCorrectionTween(p1, {Brightness = 2}, u3)
    end)
    task.delay(p2.growDuration, function() -- Line: 2063 -- upvalues: p1 (val), playColorCorrectionTween (upval), u212 (upval)
        if p1.cancelled or not p1.colorCorrection then
            return
        end
        playColorCorrectionTween(p1, u212, 0.2)
    end)
end
local function startTeaseLighting(p1, p2) -- Line: 2078 -- upvalues: clearTeaseLighting (val), Lighting (val), playColorCorrectionTween (val), u190 (val), TweenService (val), u196 (val)
    clearTeaseLighting(p1)
    p1.lightingSnapshot = {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
    local v1 = TweenInfo.new(p2.growDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "TeaseColorCorrection"
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.Contrast = 0
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrectionEffect.Parent = Lighting
    p1.colorCorrection = ColorCorrectionEffect
    playColorCorrectionTween(p1, u190, p2.growDuration)
    local v2 = TweenService:Create(Lighting, v1, u196)
    table.insert(p1.lightingTweens, v2)
    v2:Play()
end
local function collectShifterParticleRefs(p1) -- Line: 2113 -- upvalues: u234 (val)
    local Lightning, v1
    local v2 = {}
    local v3 = u234
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p1:FindFirstChild(j)
        if v1 then
            Lightning = v1:FindFirstChild("Lightning")
            if Lightning then
                table.insert(v2, Lightning)
            end
        end
    end
    local Torso = p1:FindFirstChild("Torso")
    if Torso then
        local v6
        v4 = {"Shift", "Tease"}
        v5 = nil
        local v7 = nil
        for k, n in v4, v5, v7 do
            v6 = Torso:FindFirstChild(n)
            if v6 then
                table.insert(v2, v6)
            end
        end
    end
    return v2
end
local function clearShifterEmitterParticles(p1) -- Line: 2146
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j:IsA("ParticleEmitter") then
            j:Clear()
        end
        for k, n in j:GetDescendants() do
            if n:IsA("ParticleEmitter") then
                n:Clear()
            end
        end
    end
end
local function destroyShifterParticleRefs(p1) -- Line: 2165 -- upvalues: clearShifterEmitterParticles (val), Particles (val)
    clearShifterEmitterParticles(p1)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.Parent then
            if not (j:IsA("ParticleEmitter")) then
                Particles.deepDisableParticles(j)
                if j:IsA("Beam") then
                    j.Enabled = false
                end
            else
                j.Enabled = false
            end
            j:Destroy()
        end
    end
end
local function clearTeaseLightning(p1, p2) -- Line: 2190 -- upvalues: releaseRockBolt (val), destroyShifterParticleRefs (val)
    local rockBolts = p1.rockBolts
    local v1 = nil
    local v2 = nil
    for i, j in rockBolts, v1, v2 do
        releaseRockBolt(j)
    end
    table.clear(p1.rockBolts)
    if p2 then
        return
    end
    destroyShifterParticleRefs(p1.bodyLightningRefs)
    table.clear(p1.bodyLightningRefs)
end
local function destroyTeaseRocks(p1) -- Line: 2209
    local orbitEntries = p1.orbitEntries
    local v1 = nil
    local v2 = nil
    local v3 = p1
    for i, j in orbitEntries, v1, v2 do
        if not j.rock then
            if j.point.Parent then
                j.point:Destroy()
            end
        elseif j.rock.Parent then
            j.rock:Destroy()
        end
    end
    table.clear(v3.orbitEntries)
    local kickEntries = v3.kickEntries
    v1 = nil
    v2 = nil
    for k, n in kickEntries, v1, v2 do
        if not n.rock then
            if n.point.Parent then
                n.point:Destroy()
            end
        elseif n.rock.Parent then
            n.rock:Destroy()
        end
    end
    table.clear(v3.kickEntries)
end
local function preserveShifterRefs(p1, p2) -- Line: 2235 -- upvalues: u276 (val)
    local v1 = {}
    local v2 = p2
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.Parent then
            table.insert(v1, j)
        end
    end
    if #v1 == 0 then
        return
    end
    u276[p1] = v1
end
local function registerInstanceShrink(p1, p2, p3) -- Line: 2258 -- upvalues: scaleSize (val), NumberSequence (val)
    local function registerShrink(a1) -- Line: 2259 -- upvalues: scaleSize (upval), NumberSequence (upval), p3 (val), p1 (val)
        local Size = a1.Size
        local v1 = scaleSize(Size, 0.1)
        local v2 = NumberSequence.tweenNumberSequence(Size, v1, p3)
        table.insert(p1, {emitter = a1, goalSize = v1, get = v2.get, destroy = v2.destroy})
    end
    if p2:IsA("ParticleEmitter") then
        registerShrink(p2)
    end
    for i, j in p2:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            registerShrink(j)
        end
    end
end
local function fadeOutBodyLightning(p1, p2) -- Line: 2289 -- upvalues: clearShifterEmitterParticles (val), registerInstanceShrink (val), destroyShifterParticleRefs (val), RunService (val)
    if #p1 == 0 then
        return
    end
    clearShifterEmitterParticles(p1)
    local u6 = {}
    local v1 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        registerInstanceShrink(u6, j, v1)
    end
    if #u6 == 0 then
        destroyShifterParticleRefs(p1)
        return
    end
    local u33 = RunService.RenderStepped:Connect(function() -- Line: 2308 -- upvalues: u6 (val)
        local v1 = u6
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j.emitter.Parent then
                j.emitter.Size = j.get()
            end
        end
    end)
    task.delay(p2, function() -- Line: 2316 -- upvalues: u33 (val), u6 (val), destroyShifterParticleRefs (upval), p1 (val)
        u33:Disconnect()
        local v1 = u6
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j.emitter.Parent then
                j.emitter.Size = j.goalSize
            end
            j.destroy()
        end
        destroyShifterParticleRefs(p1)
    end)
end
local function purgeTeaseLightningFromModel(p1) -- Line: 2335 -- upvalues: u276 (val), destroyShifterParticleRefs (val), collectShifterParticleRefs (val)
    local v1 = u276[p1]
    u276[p1] = nil
    if v1 then
        destroyShifterParticleRefs(v1)
    end
    destroyShifterParticleRefs(collectShifterParticleRefs(p1))
end
local function releaseAllRockBolts(p1, p2) -- Line: 2352 -- upvalues: releaseRockBolt (val)
    local rockBolts = p1.rockBolts
    local v1 = nil
    local v2 = nil
    for i, j in rockBolts, v1, v2 do
        releaseRockBolt(j, p2)
    end
    table.clear(p1.rockBolts)
end
local function disableTeaseLightning(p1, p2) -- Line: 2365 -- upvalues: releaseAllRockBolts (val), destroyTeaseRocks (val), destroyShifterParticleRefs (val), purgeTeaseLightningFromModel (val), clearTeaseLighting (val), Lightning (val), fadeOutBodyLightning (val), fadeOutTeaseLighting (val)
    if p1.lightningDisabled then
        return
    end
    p1.lightningDisabled = true
    local lightningFadeDuration = p1.lightningFadeDuration
    local bodyLightningRefs = p1.bodyLightningRefs
    table.clear(p1.bodyLightningRefs)
    releaseAllRockBolts(p1, lightningFadeDuration)
    destroyTeaseRocks(p1)
    releaseAllRockBolts(p1, lightningFadeDuration)
    if lightningFadeDuration > 0 then
        fadeOutBodyLightning(bodyLightningRefs, lightningFadeDuration)
        fadeOutTeaseLighting(p1, lightningFadeDuration)
        task.defer(function() -- Line: 2398 -- upvalues: releaseAllRockBolts (upval), p1 (val), lightningFadeDuration (val)
            releaseAllRockBolts(p1, lightningFadeDuration)
        end)
        return
    end
    destroyShifterParticleRefs(bodyLightningRefs)
    if p2 then
        purgeTeaseLightningFromModel(p2)
    end
    clearTeaseLighting(p1)
    Lightning.destroyAll()
    task.defer(function() -- Line: 2388 -- upvalues: releaseAllRockBolts (upval), p1 (val), lightningFadeDuration (val), Lightning (upval)
        releaseAllRockBolts(p1, lightningFadeDuration)
        Lightning.destroyAll()
    end)
end
local function getShrinkRefs(p1) -- Line: 2408 -- upvalues: u276 (val), collectShifterParticleRefs (val)
    local u1 = {}
    local u2 = {}
    local function add(p1) -- Line: 2412 -- upvalues: u2 (val), u1 (val)
        if not p1 or not p1.Parent or u2[p1] then
            return
        end
        u2[p1] = true
        table.insert(u1, p1)
    end
    local v1 = u276[p1]
    u276[p1] = nil
    if v1 then
        local v2 = v1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            add(j)
        end
    end
    for k, n in collectShifterParticleRefs(p1) do
        add(n)
    end
    return u1
end
local function stopTease(p1, p2) -- Line: 2501 -- upvalues: u275 (val), stopTeaseSustainShake (val), clearTeaseLightning (val), destroyTeaseRocks (val), purgeTeaseLightningFromModel (val), detachTeaseLighting (val), clearTeaseLighting (val), Particles (val), Lightning (val)
    local v1 = u275[p1]
    if not v1 or v1.cancelled then
        return
    end
    v1.cancelled = true
    stopTeaseSustainShake(v1, true)
    if v1.connection then
        v1.connection:Disconnect()
        v1.connection = nil
    end
    clearTeaseLightning(v1, false)
    destroyTeaseRocks(v1)
    purgeTeaseLightningFromModel(p1)
    if not p2 then
        clearTeaseLighting(v1)
    elseif p2.preserveLighting then
        detachTeaseLighting(v1)
    end
    table.clear(v1.bodyLightningRefs)
    if v1.teaseAttachment and v1.teaseAttachment.Parent then
        Particles.deepDisableParticles(v1.teaseAttachment)
        v1.teaseAttachment:Destroy()
        v1.teaseAttachment = nil
    end
    local growthEntries = v1.growthEntries
    local v2 = nil
    local v3 = nil
    for i, j in growthEntries, v2, v3 do
        j.destroy()
    end
    table.clear(v1.growthEntries)
    Lightning.destroyAll()
    u275[p1] = nil
end
function Tease(p1, p2, p3) -- Line: 2542 -- upvalues: stopTease (val), createTeaseContext (val), u275 (val), onSpawnParticleAttachment (val), registerInstanceGrowth (val), startTeaseLighting (val), scheduleTeaseLightingFlashbang (val), startTeaseSustainShake (val), startTeaseCameraShake (val), resolveTeaseSound (val), startTeaseSound (val), RunService (val), updateOrbitingRocks (val), updateKickRocks (val), updateRockLightning (val), onShowBodyLightning (val), startKickRockWaves (val), onSpawnRisingRocks (val), startRockLightning (val), disableTeaseLightning (val), stopTeaseSustainShake (val), Particles (val)
    local lightningDuration, lightningDuration_2, lightningFadeDuration, v1
    stopTease(p1)
    local u9 = createTeaseContext(p2, p3)
    if not p3 then
        v1 = "Tease"
    elseif p3.particle == "Shift" then
        v1 = "Shift"
    end
    local u14 = os.clock()
    local u15 = {
        cancelled = false,
        lightningDisabled = false,
        growthEntries = {},
        orbitEntries = {},
        kickEntries = {},
        rockBolts = {},
        bodyLightningRefs = {},
        lightingTweens = {},
    }
    if not p3 then
        lightningFadeDuration = 2
    elseif p3.lightningFadeDuration ~= nil then
        lightningFadeDuration = p3.lightningFadeDuration
    end
    u15.lightningFadeDuration = lightningFadeDuration
    u275[p1] = u15
    if not p3 then
        lightningDuration = u9.growDuration + 1
    elseif p3.lightningDuration and 0 < p3.lightningDuration then
        lightningDuration = p3.lightningDuration
    end
    u15.teaseAttachment = onSpawnParticleAttachment(p1, v1)
    if u15.teaseAttachment then
        registerInstanceGrowth(u15.growthEntries, u15.teaseAttachment, u9)
    end
    if p3 and p3.lighting then
        startTeaseLighting(u15, u9)
        if p3.lightingFlashbang then
            scheduleTeaseLightingFlashbang(u15, u9)
        end
    end
    if not p3 then
        startTeaseCameraShake(p1)
    elseif p3.sustainShake then
        startTeaseSustainShake(p1, u15, u9.growDuration, lightningDuration)
    end
    local v2 = resolveTeaseSound(p3)
    if v2 then
        startTeaseSound(u15, v2, lightningDuration)
    end
    u15.connection = RunService.RenderStepped:Connect(function(a1) -- Line: 2599 -- upvalues: u15 (val), updateOrbitingRocks (upval), p1 (val), u14 (val), u9 (val), updateKickRocks (upval), updateRockLightning (upval)
        if u15.cancelled then
            return
        end
        local growthEntries = u15.growthEntries
        local v1 = nil
        local v2 = nil
        for i, j in growthEntries, v1, v2 do
            if j.emitter.Parent then
                j.emitter.Size = j.get()
            end
        end
        updateOrbitingRocks(p1, u15.orbitEntries, a1, u14, u9)
        updateKickRocks(u15.kickEntries, a1)
        if not u15.lightningDisabled then
            updateRockLightning(u15.orbitEntries, u15.rockBolts, u14, u9)
        end
    end)
    onShowBodyLightning(p1, u15.growthEntries, u15.bodyLightningRefs, u9)
    if u9.intensity.enableKickRocks then
        startKickRockWaves(p1, u15.kickEntries, u9)
    end
    onSpawnRisingRocks(p1, u15.orbitEntries, u9)
    startRockLightning(p1, u15.orbitEntries, u15.rockBolts, u14, u9)
    if not p3 then
        lightningDuration_2 = nil
    else
        lightningDuration_2 = p3.lightningDuration
    end
    if lightningDuration_2 and 0 < lightningDuration_2 then
        task.delay(lightningDuration_2, function() -- Line: 2626 -- upvalues: u275 (upval), p1 (val), disableTeaseLightning (upval), stopTeaseSustainShake (upval)
            local v1 = u275[p1]
            if not v1 or v1.cancelled then
                return
            end
            disableTeaseLightning(v1, p1)
            stopTeaseSustainShake(v1, true)
        end)
    end
    task.delay(u9.growDuration, function() -- Line: 2638 -- upvalues: u15 (val), Particles (upval)
        if u15.cancelled then
            return
        end
        if u15.teaseAttachment and u15.teaseAttachment.Parent then
            Particles.deepDisableParticles(u15.teaseAttachment)
        end
        local growthEntries = u15.growthEntries
        local v1 = nil
        local v2 = nil
        for i, j in growthEntries, v1, v2 do
            if j.emitter.Parent then
                j.emitter.Size = j.goalSize
            end
            j.destroy()
        end
        table.clear(u15.growthEntries)
    end)
    p1.Destroying:Once(function() -- Line: 2656 -- upvalues: stopTease (upval), p1 (val)
        stopTease(p1)
    end)
end
local v5 = {
    getChargeDuration = function(p1) -- Line: 340 -- upvalues: createTeaseContext (val)
        return createTeaseContext(p1).growDuration
    end,
    shrinkShifter = function(p1, p2) -- Line: 2443 -- upvalues: u277 (val), getShrinkRefs (val), clearShifterEmitterParticles (val), registerInstanceShrink (val), destroyShifterParticleRefs (val), RunService (val)
        local v1 = u277[p1]
        if v1 then
            v1:Disconnect()
            u277[p1] = nil
        end
        local u12 = getShrinkRefs(p1)
        if #u12 == 0 then
            return
        end
        clearShifterEmitterParticles(u12)
        local u17 = {}
        local v2 = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local v3 = u12
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            registerInstanceShrink(u17, j, v2)
        end
        if #u17 == 0 then
            destroyShifterParticleRefs(u12)
            return
        end
        local u45 = RunService.RenderStepped:Connect(function() -- Line: 2469 -- upvalues: u17 (val)
            local v1 = u17
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.emitter.Parent then
                    j.emitter.Size = j.get()
                end
            end
        end)
        u277[p1] = u45
        task.delay(p2, function() -- Line: 2478 -- upvalues: u277 (upval), p1 (val), u45 (val), u17 (val), destroyShifterParticleRefs (upval), u12 (val)
            local v1 = u277[p1]
            if v1 == u45 then
                u45:Disconnect()
                u277[p1] = nil
            end
            v1 = u17
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.emitter.Parent then
                    j.emitter.Size = j.goalSize
                end
                j.destroy()
            end
            destroyShifterParticleRefs(u12)
        end)
    end,
    stop = stopTease,
}
local v6 = {
    __call = function(p1, p2, p3, p4) -- Line: 2672 -- upvalues: Tease (val)
        Tease(p2, p3, p4)
    end,
}
return (setmetatable(v5, v6))