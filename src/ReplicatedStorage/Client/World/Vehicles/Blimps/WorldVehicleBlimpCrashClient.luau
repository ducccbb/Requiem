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
--   File: ReplicatedStorage.Client.World.Vehicles.Blimps.WorldVehicleBlimpCrashClient
--                               Dumped in 0.00359 seconds
--                          Bytecode version 9  |  55 functions

local waitForCrashEntry
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local World = Common:WaitForChild("World")
local Vehicles = World:WaitForChild("Vehicles")
local BlimpCrash = require(Vehicles:WaitForChild("BlimpCrash"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Debris = require(Utilities:WaitForChild("Debris"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_3:WaitForChild("Shake"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds = Common_5:WaitForChild("Sounds")
local Crash = require(Sounds:WaitForChild("Vehicles")).Crash
local u132 = {}
local function getBlimpSoundParent(p1) -- Line: 117
    local Root = p1:FindFirstChild("Root")
    if not Root then
        local Fire = p1:FindFirstChild("Fire")
        if not Fire then
            Fire = p1:FindFirstChild("Fire", true)
        end
        if not Fire then
            return nil
        end
        if Fire:IsA("BasePart") then
            return Fire
        end
        return nil
    elseif Root:IsA("BasePart") then
        return Root
    end
end
local function landingSeed(p1) -- Line: 136
    return p1.X * 0.17 + p1.Z * 0.23 + p1.Y * 0.11
end
local function getBlimpDebrisIgnore(p1) -- Line: 145
    return {p1}
end
local function getSlideRockInterval(p1, p2) -- Line: 155
    return Random.new(math.floor(p1.landAt * 1000) + p2 + 41):NextNumber(1.5, 2.5)
end
local function playImpactDebris(p1, p2, p3) -- Line: 167 -- upvalues: getBlimpDebrisIgnore (val), landingSeed (val), Debris (val)
    if p2.impactDebrisPlayed or not p1.Parent then
        return
    end
    p2.impactDebrisPlayed = true
    local v1 = getBlimpDebrisIgnore(p1)
    local v2 = math.floor((landingSeed(p3)))
    Debris.rocks(p3, 48, 18, 14, 380, 200, v1)
    Debris.circular(p3, 100, 16, 52, 0.22, v1, nil, 5, v2)
end
local function spawnSlideDebris(p1, p2) -- Line: 206 -- upvalues: Debris (val), getBlimpDebrisIgnore (val)
    if not p1.Parent then
        return
    end
    Debris.rocks(p2, 28, 11, 10, 260, 130, getBlimpDebrisIgnore(p1))
end
local function playCrashSound(p1, p2, p3) -- Line: 229
    local Sound = Instance.new("Sound")
    Sound:AddTag("Custom")
    Sound.SoundId = p1
    Sound.Volume = p3
    Sound.Looped = false
    Sound.RollOffMode = Enum.RollOffMode.LinearSquare
    Sound.RollOffMinDistance = 5000
    Sound.RollOffMaxDistance = 20000
    Sound.Parent = p2
    Sound:Play()
    Sound.Ended:Once(function() -- Line: 241 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
    task.delay(30, function() -- Line: 245 -- upvalues: Sound (val)
        if Sound.Parent then
            Sound:Destroy()
        end
    end)
    return Sound
end
local function findCrashLoopSound(p1) -- Line: 259 -- upvalues: getBlimpSoundParent (val)
    local v1 = getBlimpSoundParent(p1)
    if not v1 then
        return nil
    end
    for i, j in v1:GetChildren() do
        if j:IsA("Sound") and j.Name == "BlimpCrashLoop" then
            return j
        end
    end
    return nil
end
local function beginCrashLoopSound(p1) -- Line: 279 -- upvalues: findCrashLoopSound (val), getBlimpSoundParent (val), Crash (val)
    local v1 = findCrashLoopSound(p1)
    if v1 then
        if not v1.IsPlaying then
            v1:Play()
        end
        return v1
    end
    local v2 = getBlimpSoundParent(p1)
    if not v2 then
        return nil
    end
    local Sound = Instance.new("Sound")
    Sound.Name = "BlimpCrashLoop"
    Sound:AddTag("Custom")
    Sound.SoundId = Crash.Loop
    Sound.Volume = 1.25
    Sound.Looped = true
    Sound.RollOffMode = Enum.RollOffMode.LinearSquare
    Sound.RollOffMinDistance = 0
    Sound.RollOffMaxDistance = 3000
    Sound.Parent = v2
    Sound:Play()
    return Sound
end
local function destroyCrashLoopSound(p1) -- Line: 313 -- upvalues: findCrashLoopSound (val)
    local v1 = findCrashLoopSound(p1)
    if v1 then
        v1:Destroy()
    end
end
local function playCrashFlameSound(p1) -- Line: 325 -- upvalues: Crash (val), playCrashSound (val)
    local Flame = Crash.Flame
    if #Flame == 0 then
        return
    end
    local v1 = Flame[math.random(1, #Flame)]
    playCrashSound(v1, p1, 2.5)
end
local function playBeginSounds(p1, p2, p3) -- Line: 342 -- upvalues: getBlimpSoundParent (val), Workspace (val), Crash (val), playCrashSound (val)
    local playSound, v1
    if p2.beginSoundsPlayed then
        return
    end
    p2.beginSoundsPlayed = true
    local u7 = getBlimpSoundParent(p1)
    if not u7 then
        return
    end
    local ServerTimeNow = Workspace:GetServerTimeNow()
    local v2 = math.max(0, ServerTimeNow - p3.startTime)
    local v3 = {}
    local v4 = {volume = 1.5, delay = 0.5, soundId = Crash.Begin2}
    local v5 = {volume = 4, delay = 1, soundId = Crash.Begin3}
    v3[1] = {volume = 4, delay = 0, soundId = Crash.Begin}
    v3[2] = v4
    v3[3] = v5
    local v6 = v3
    v4 = nil
    v5 = nil
    for i, j in v6, v4, v5 do
        if j.delay + 2 >= v2 then
            v1 = j.delay - v2
            function playSound() -- Line: 368 -- upvalues: p1 (val), u7 (val), playCrashSound (upval), j (val)
                if not p1.Parent or not u7.Parent then
                    return
                end
                playCrashSound(j.soundId, u7, j.volume)
            end
            if v1 > 0 then
                task.delay(v1, playSound)
            else
                playSound()
            end
        end
    end
end
local function playSlidingSounds(p1, p2) -- Line: 390 -- upvalues: getBlimpSoundParent (val), playCrashSound (val), Crash (val)
    if p2.slidingSoundsPlayed then
        return
    end
    p2.slidingSoundsPlayed = true
    local u6 = getBlimpSoundParent(p1)
    if not u6 then
        return
    end
    playCrashSound(Crash.Sliding.Beginning, u6, 3)
    task.delay(3, function() -- Line: 404 -- upvalues: p1 (val), u6 (val), playCrashSound (upval), Crash (upval)
        if not p1.Parent or not u6.Parent then
            return
        end
        playCrashSound(Crash.Sliding.Delayed, u6, 3)
    end)
end
local function getLocalRoot() -- Line: 419 -- upvalues: Players (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return nil
    end
    return (Character:FindFirstChild("HumanoidRootPart"))
end
local function getShakeIntensity(p1) -- Line: 433 -- upvalues: getLocalRoot (val)
    local v1 = getLocalRoot()
    if not v1 then
        return 0
    end
    local Magnitude = (v1.Position - p1).Magnitude
    if 15000 <= Magnitude then
        return 0
    end
    if Magnitude <= 5000 then
        return 1
    end
    return 1 - (Magnitude - 5000) / 10000
end
local function applyRangedCameraShake(p1, p2, p3) -- Line: 458 -- upvalues: Workspace (val), getShakeIntensity (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v1 = getShakeIntensity(p3)
    if v1 <= 0 then
        return
    end
    local v2 = p2 * v1
    local v3 = CFrame.new(p1 * v1)
    CurrentCamera.CFrame = CurrentCamera.CFrame * (v3 * CFrame.Angles(v2.X, v2.Y, v2.Z))
end
local function getBlimpShakePosition(p1) -- Line: 480
    local Root = p1:FindFirstChild("Root")
    if Root then
        return Root.Position
    end
    return p1:GetPivot().Position
end
local function updateSlideDebris(p1, p2, p3, p4) -- Line: 497 -- upvalues: BlimpCrash (val), getSlideRockInterval (val), spawnSlideDebris (val), getBlimpShakePosition (val)
    local v1 = math.max(0, p4 - p3.landAt)
    if BlimpCrash.LANDING_SEQUENCE_DURATION <= v1 then
        return
    end
    if p2.nextSlideRockAt == nil then
        p2.slideRockBurstIndex = 0
        p2.nextSlideRockAt = p3.landAt + getSlideRockInterval(p3, 0)
    end
    while p2.nextSlideRockAt <= p4 do
        if v1 >= BlimpCrash.LANDING_SEQUENCE_DURATION then
            break
        end
        spawnSlideDebris(p1, getBlimpShakePosition(p1))
        p2.slideRockBurstIndex = p2.slideRockBurstIndex + 1
        p2.nextSlideRockAt = p2.nextSlideRockAt + getSlideRockInterval(p3, p2.slideRockBurstIndex)
        v1 = math.max(0, p4 - p3.landAt)
    end
end
local function getDescentShakeProximity(p1) -- Line: 523
    if p1.contactTime then
        return 0
    end
    local v1 = 1 - p1.bobDamp
    return (math.clamp(v1, 0, 1))
end
local function getShakeSourcePosition(p1, p2) -- Line: 537 -- upvalues: getBlimpShakePosition (val)
    return getBlimpShakePosition(p1)
end
local function playImpactShake(p1, p2, p3) -- Line: 548 -- upvalues: playImpactDebris (val), getBlimpSoundParent (val), playCrashSound (val), Crash (val), getShakeIntensity (val), Shake (val), applyRangedCameraShake (val)
    if p2.impactShakePlayed then
        return
    end
    p2.impactShakePlayed = true
    playImpactDebris(p1, p2, p3)
    local v1 = getBlimpSoundParent(p1)
    if v1 then
        playCrashSound(Crash.Sliding.Impact, v1, 8)
    end
    local v2 = getShakeIntensity(p3)
    if v2 <= 0 then
        return
    end
    v2 = Shake.new()
    v2.FadeInTime = 0
    v2.FadeOutTime = 1.2
    v2.Frequency = 0.08
    v2.Amplitude = 5
    v2.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
    v2:Start()
    v2:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 574 -- upvalues: applyRangedCameraShake (upval), p3 (val)
        applyRangedCameraShake(p1, p2, p3)
    end)
    p2.impactShake = v2
end
local function beginDescentShake(p1, p2) -- Line: 587 -- upvalues: Shake (val), getDescentShakeProximity (val), applyRangedCameraShake (val), getBlimpShakePosition (val)
    if p2.descentShake then
        return
    end
    local v1 = Shake.new()
    v1.FadeInTime = 0.5
    v1.FadeOutTime = 0.6
    v1.Frequency = 0.048
    v1.Amplitude = 1.5
    v1.Sustain = true
    v1.RotationInfluence = Vector3.new(0.07, 0.07, 0.07)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(a1, a2) -- Line: 601 -- upvalues: getDescentShakeProximity (upval), p2 (val), applyRangedCameraShake (upval), getBlimpShakePosition (upval), p1 (val)
        local v1 = getDescentShakeProximity(p2.simulation)
        if v1 < 0.06 then
            return
        end
        applyRangedCameraShake(a1 * v1, a2 * v1, getBlimpShakePosition(p1))
    end)
    p2.descentShake = v1
end
local function stopDescentShake(p1) -- Line: 618
    if p1.descentShake then
        p1.descentShake:Destroy()
        p1.descentShake = nil
    end
end
local function updateDescentShakes(p1, p2) -- Line: 631 -- upvalues: stopDescentShake (val), getDescentShakeProximity (val), beginDescentShake (val)
    if p2.landing or p2.simulation.contactTime then
        stopDescentShake(p2)
        return
    end
    local v1 = getDescentShakeProximity(p2.simulation)
    if 0.06 <= v1 then
        beginDescentShake(p1, p2)
    end
end
local function beginLandingShake(p1, p2, p3) -- Line: 649 -- upvalues: Shake (val), applyRangedCameraShake (val), getShakeSourcePosition (val)
    if p2.landingShake then
        return
    end
    local v1 = Shake.new()
    v1.FadeInTime = 0.4
    v1.FadeOutTime = 2
    v1.Frequency = 0.055
    v1.Amplitude = 1.2
    v1.Sustain = true
    v1.RotationInfluence = Vector3.new(0.06, 0.06, 0.06)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(a1, p2) -- Line: 663 -- upvalues: applyRangedCameraShake (upval), getShakeSourcePosition (upval), p1 (val), p3 (val)
        applyRangedCameraShake(a1, p2, getShakeSourcePosition(p1, p3))
    end)
    p2.landingShake = v1
end
local function stopLandingShake(p1) -- Line: 675
    if not p1.landingShake or not (p1.landingShake:IsShaking()) or p1.landingShakeFadeRequested then
        return
    end
    p1.landingShakeFadeRequested = true
    p1.landingShake:StopSustain()
end
local function destroyCrashShakes(p1) -- Line: 689
    if p1.impactShake then
        p1.impactShake:Destroy()
        p1.impactShake = nil
    end
    if p1.descentShake then
        p1.descentShake:Destroy()
        p1.descentShake = nil
    end
    if p1.landingShake then
        p1.landingShake:Destroy()
        p1.landingShake = nil
    end
end
local function updateLandingShakes(p1, p2, p3) -- Line: 713 -- upvalues: playImpactShake (val), updateSlideDebris (val), BlimpCrash (val), beginLandingShake (val), stopLandingShake (val)
    local landing = p2.landing
    if not landing then
        return
    end
    local v1 = math.max(0, p3 - landing.landAt)
    if not p2.impactShakePlayed then
        if v1 > 0.35 then
            p2.impactShakePlayed = true
            p2.impactDebrisPlayed = true
        else
            playImpactShake(p1, p2, landing.position)
        end
    end
    updateSlideDebris(p1, p2, landing, p3)
    if v1 < BlimpCrash.LANDING_SEQUENCE_DURATION then
        beginLandingShake(p1, p2, landing)
        return
    end
    if p2.landingShake then
        stopLandingShake(p2)
    end
end
local function onLandingDetected(p1, p2, p3, p4) -- Line: 747 -- upvalues: stopDescentShake (val), playSlidingSounds (val), updateLandingShakes (val)
    stopDescentShake(p2)
    p2.landing = p3
    playSlidingSounds(p1, p2)
    updateLandingShakes(p1, p2, p4)
end
local function getFireAttachments(p1) -- Line: 761
    local Fire = p1:FindFirstChild("Fire")
    if not Fire then
        Fire = p1:FindFirstChild("Fire", true)
    end
    if not Fire or not (Fire:IsA("BasePart")) then
        return {}
    end
    local v1 = {}
    for i, j in Fire:GetChildren() do
        if j:IsA("Attachment") then
            table.insert(v1, j)
        end
    end
    table.sort(v1, function(p1, p2) -- Line: 774
        local v1 = p1.Name < p2.Name
        return v1
    end)
    return v1
end
local function getFireStaggerInterval(p1, p2) -- Line: 787
    return Random.new(math.floor(p1.startTime * 1000) + p2):NextNumber(5, 8)
end
local function setCrashFireEnabled(p1, p2) -- Line: 798 -- upvalues: getFireAttachments (val), Particles (val)
    for i, j in getFireAttachments(p1) do
        if not p2 then
            Particles.deepDisableParticles(j)
        else
            Particles.deepEnableParticles(j)
        end
    end
end
local function beginCrashFire(p1, p2, p3) -- Line: 815 -- upvalues: getFireAttachments (val), Particles (val), Workspace (val), getFireStaggerInterval (val), playCrashFlameSound (val)
    local enableAttachment, v1
    local v2 = getFireAttachments(p1)
    if #v2 == 0 then
        return
    end
    local v3 = v2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        Particles.deepDisableParticles(j)
    end
    local ServerTimeNow = Workspace:GetServerTimeNow()
    v3 = math.max(0, ServerTimeNow - p2.startTime)
    v4 = 0
    local v6 = p2
    for i2, v in ipairs(v2) do
        if 1 < i2 then
            v4 = v4 + getFireStaggerInterval(v6, i2)
        end
        v1 = v4 - v3
        function enableAttachment() -- Line: 835 -- upvalues: u0 (val), v (val), Particles (upval), playCrashFlameSound (upval)
            if not u0.Parent or not v.Parent then
                return
            end
            Particles.deepEnableParticles(v)
            playCrashFlameSound(v)
        end
        if v1 > 0 then
            task.delay(v1, enableAttachment)
        else
            enableAttachment()
        end
    end
end
local function applyBlimpRest(p1) -- Line: 859 -- upvalues: BlimpCrash (val)
    local v1 = BlimpCrash.readRestFromAttributes(p1)
    if v1 then
        BlimpCrash.applyRestPose(p1, v1)
    end
end
local function stopCrashAnimation(p1, p2) -- Line: 872 -- upvalues: u132 (val), destroyCrashShakes (val), setCrashFireEnabled (val), destroyCrashLoopSound (val)
    local v1 = u132[p1]
    if v1 then
        v1.connection:Disconnect()
        destroyCrashShakes(v1)
        if not p2 then
            setCrashFireEnabled(p1, false)
        end
        u132[p1] = nil
    end
    if not p2 then
        destroyCrashLoopSound(p1)
    end
end
local function finishCrashRest(p1, p2, p3) -- Line: 895 -- upvalues: stopDescentShake (val), stopLandingShake (val), BlimpCrash (val), stopCrashAnimation (val)
    stopDescentShake(p2)
    stopLandingShake(p2)
    BlimpCrash.applyRestPose(p1, p3)
    stopCrashAnimation(p1, true)
end
local function applyCrashPose(p1, p2, p3, p4) -- Line: 910 -- upvalues: BlimpCrash (val), onLandingDetected (val), updateLandingShakes (val), updateDescentShakes (val), finishCrashRest (val)
    local v1 = math.max(0, p4 - p2.startTime)
    BlimpCrash.advanceSimulation(p3.simulation, v1)
    if not p3.simulation.landingSnapshot then
        if not p3.landing then
            updateDescentShakes(p1, p3)
        else
            updateLandingShakes(p1, p3, p4)
        end
    elseif not p3.landing then
        onLandingDetected(p1, p3, p3.simulation.landingSnapshot, p4)
    end
    local v2 = BlimpCrash.getSimulationPose(p3.simulation)
    if BlimpCrash.isSequenceComplete(p3.simulation) then
        finishCrashRest(p1, p3, v2)
        return
    end
    if not p3.headMotor or not p3.headMotorBaseC0 then
        p1:PivotTo(v2.pitchedPivot)
        return
    end
    p1:PivotTo(v2.rootPivot)
    p3.headMotor.C0 = BlimpCrash.getHeadMotorC0(p3.headMotorBaseC0, v2.headPitch)
end
local function beginCrashAnimation(p1, p2) -- Line: 943 -- upvalues: u132 (val), BlimpCrash (val), RunService (val), stopCrashAnimation (val), applyBlimpRest (val), applyCrashPose (val), Workspace (val), beginCrashLoopSound (val), beginCrashFire (val), playBeginSounds (val), playSlidingSounds (val), updateLandingShakes (val)
    local v1, v2
    if u132[p1] then
        return
    end
    v1, v2 = BlimpCrash.findHeadMotor(p1)
    local u9 = {
        impactShakePlayed = false,
        landingShakeFadeRequested = false,
        beginSoundsPlayed = false,
        slidingSoundsPlayed = false,
        impactDebrisPlayed = false,
        slideRockBurstIndex = 0,
        headMotor = v1,
        headMotorBaseC0 = v2,
        landing = BlimpCrash.readLandingFromAttributes(p1),
        simulation = BlimpCrash.createSimulation(p2, p1),
    }
    u9.connection = RunService.RenderStepped:Connect(function() -- Line: 968 -- upvalues: p1 (val), stopCrashAnimation (upval), BlimpCrash (upval), applyBlimpRest (upval), applyCrashPose (upval), p2 (val), u9 (val), Workspace (upval)
        if not p1.Parent then
            stopCrashAnimation(p1, false)
            return
        end
        if p1:GetAttribute(BlimpCrash.CRASH_RESTED_ATTRIBUTE) == true then
            applyBlimpRest(p1)
            stopCrashAnimation(p1, true)
            return
        end
        if p1:GetAttribute(BlimpCrash.CRASHING_ATTRIBUTE) == true then
            applyCrashPose(p1, p2, u9, Workspace:GetServerTimeNow())
            return
        end
        applyBlimpRest(p1)
        local v1 = p1:GetAttribute(BlimpCrash.CRASH_RESTED_ATTRIBUTE) == true
        stopCrashAnimation(p1, v1)
    end)
    u132[p1] = u9
    beginCrashLoopSound(p1)
    local ServerTimeNow = Workspace:GetServerTimeNow()
    local v3 = math.max(0, ServerTimeNow - p2.startTime)
    local v4 = 0
    while u9.simulation.time < v3 - 0.008333333333333333 do
        if v4 >= 30 then
            break
        end
        BlimpCrash.advanceSimulation(u9.simulation, v3, 12)
        v4 = v4 + 1
    end
    applyCrashPose(p1, p2, u9, Workspace:GetServerTimeNow())
    beginCrashFire(p1, p2, u9)
    playBeginSounds(p1, u9, p2)
    if u9.landing then
        playSlidingSounds(p1, u9)
        updateLandingShakes(p1, u9, Workspace:GetServerTimeNow())
    end
end
function waitForCrashEntry(p1, p2) -- Line: 1016 -- upvalues: BlimpCrash (val), waitForCrashEntry (val)
    local v1 = BlimpCrash.readEntryFromAttributes(p1)
    if v1 then
        return v1
    end
    if 20 <= p2 then
        return nil
    end
    task.wait(0.1)
    return waitForCrashEntry(p1, p2 + 1)
end
local function syncBlimpCrash(p1) -- Line: 1035 -- upvalues: BlimpCrash (val), stopCrashAnimation (val), applyBlimpRest (val), beginCrashLoopSound (val), waitForCrashEntry (val), beginCrashAnimation (val)
    if not (p1:IsA("Model")) then
        return
    end
    if p1:GetAttribute(BlimpCrash.CRASH_RESTED_ATTRIBUTE) == true then
        stopCrashAnimation(p1, true)
        applyBlimpRest(p1)
        beginCrashLoopSound(p1)
        return
    end
    if p1:GetAttribute(BlimpCrash.CRASHING_ATTRIBUTE) ~= true then
        stopCrashAnimation(p1, false)
        return
    end
    task.spawn(function() -- Line: 1052 -- upvalues: waitForCrashEntry (upval), p1 (val), beginCrashAnimation (upval)
        local v1 = waitForCrashEntry(p1, 0)
        if v1 then
            beginCrashAnimation(p1, v1)
        end
    end)
end
local function syncPendingCrashes() -- Line: 1064 -- upvalues: CollectionService (val), Workspace (val), syncBlimpCrash (val)
    for i, j in CollectionService:GetTagged("Blimp") do
        if j:IsA("Model") and j:IsDescendantOf(Workspace) then
            syncBlimpCrash(j)
        end
    end
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Blimp")
InstanceAddedSignal:Connect(function(p1) -- Line: 1074 -- upvalues: syncBlimpCrash (val)
    if p1:IsA("Model") then
        syncBlimpCrash(p1)
    end
end)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Blimp")
InstanceRemovedSignal:Connect(function(p1) -- Line: 1080 -- upvalues: stopCrashAnimation (val)
    if p1:IsA("Model") then
        stopCrashAnimation(p1)
    end
end)
syncPendingCrashes()
return {syncBlimpCrash = syncBlimpCrash, syncPendingCrashes = syncPendingCrashes}