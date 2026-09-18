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
--    File: ReplicatedStorage.Common.Effects.Types.Events.Events.FemaleTitanCollapse
--                               Dumped in 0.00159 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Lightning_2 = Utilities:WaitForChild("Lightning")
local Lightning = require(Lightning_2:WaitForChild("Lightning"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_3 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_3:WaitForChild("Titans"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local Debris = require(Utilities_4:WaitForChild("Debris"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_5 = Common_7:WaitForChild("Utilities")
local Particles = require(Utilities_5:WaitForChild("Particles"))
return function(p1) -- Line: 37 -- upvalues: Players (val), Lightning (val), Sounds (val), Universal (val), Debris (val), TweenService (val), Titans (val), Particles (val), Workspace (val), Shake (val)
    local Female = workspace:WaitForChild("Female")
    local u10 = Vector3.new(-5473, -180.357, 1580.8)
    local u16 = u10 + Vector3.new(0, 1500, 0)
    local function getLocalRoot() -- Line: 46 -- upvalues: Players (upval)
        local Character = Players.LocalPlayer.Character
        if not Character then
            return nil
        end
        return (Character:FindFirstChild("HumanoidRootPart"))
    end
    local function getShakeIntensity() -- Line: 58 -- upvalues: getLocalRoot (val), u10 (val)
        local v1 = getLocalRoot()
        if not v1 then
            return 0
        end
        local Magnitude = (v1.Position - u10).Magnitude
        if 12000 < Magnitude then
            return 0
        end
        if Magnitude <= 500 then
            return 1
        end
        if 12000 <= Magnitude then
            return 0
        end
        return 1 - (Magnitude - 500) / 11500
    end
    local function createLightningBolt(p1, p2, p3) -- Line: 86 -- upvalues: Lightning (upval)
        local Attachment = Instance.new("Attachment")
        Attachment.WorldPosition = p1
        Attachment.Parent = workspace.Terrain
        local Attachment_2 = Instance.new("Attachment")
        Attachment_2.WorldPosition = p2
        Attachment_2.Parent = workspace.Terrain
        local v1 = Lightning.new(Attachment, Attachment_2, p3.segments)
        local v2 = {}
        local v3 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
        local v4 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255))
        v2[1] = v3
        v2[2] = v4
        v2[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 213, 62))
        v1.Color = ColorSequence.new(v2)
        v1.Thickness = p3.thickness
        v1.PulseSpeed = p3.pulseSpeed
        v1.PulseLength = p3.pulseLength
        v1.FadeLength = 0.7
        v1.ColorOffsetSpeed = 0
        v1.MaxRadius = p3.radius
        return v1
    end
    local function onSpawnLightningStrike() -- Line: 122 -- upvalues: createLightningBolt (val), u10 (val), u16 (val), Sounds (upval), Universal (upval), Debris (upval), TweenService (upval)
        local v1 = 3
        local v2 = 1
        for i = 1, v1, v2 do
            createLightningBolt(u10, u16, {
                segments = 40,
                thickness = 3,
                radius = 50,
                pulseSpeed = 15,
                pulseLength = 3,
            })
        end
        Sounds.playGlobalSoundEffect(Universal.Shifter, 0.25, 3)
        Sounds.playFalloffSoundEffect(Universal.Lightning, u10, 15000, 5, {min = 0.9, max = 1.1})
        Sounds.playFalloffSoundEffect(Universal.Buzz, u10, 5000, 6, {min = 0.9, max = 1.1})
        Sounds.playFalloffSoundEffect(Universal.RumblingQuake, u10, 8000, 7, {min = 0.9, max = 1.1})
        Sounds.playFalloffSoundEffect(Universal.Explosions, u10, 5000, 10, {min = 0.9, max = 1.1})
        Debris.rocks(u10, 50, 30, 15, 400, 200)
        task.delay(0.1, function() -- Line: 141 -- upvalues: TweenService (upval)
            local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Parent = game:GetService("Lighting")
            local v1 = TweenInfo.new(0.1)
            TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0.6}):Play()
            task.wait(0.1)
            v1 = TweenInfo.new(0.3)
            TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0}):Play()
            task.wait(0.3)
            ColorCorrectionEffect:Destroy()
        end)
    end
    Sounds.playGlobalSoundEffect(Universal.Earthquake, 0.1, 4, 120, nil, 10)
    local u31 = {}
    task.spawn(function() -- Line: 166 -- upvalues: u31 (val), Debris (upval), u10 (val)
        local v1
        local v2 = 30
        local v3 = 1
        for i = 1, v2, v3 do
            v1 = math.max(50 - i * 2, 20)
            table.insert(u31, Debris.circular(u10, i * 10 + 300, i * 2 + 30, v1, 0.05, {}, true, 0.3, i + 151, true, -209))
            task.wait(0.05)
        end
    end)
    task.delay(110, function() -- Line: 190 -- upvalues: u31 (val)
        local v1, v2, v3
        local v4 = u31
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            if j then
                v1 = j
                v2 = nil
                v3 = nil
                for k, n in v1, v2, v3 do
                    n:Destroy()
                end
            end
        end
    end)
    onSpawnLightningStrike()
    task.delay(0.1, function() -- Line: 203 -- upvalues: Female (val), TweenService (upval)
        local v1
        Female.Delete:Destroy()
        for i, j in Female.Sink:GetChildren() do
            v1 = TweenInfo.new(80, Enum.EasingStyle.Linear)
            TweenService:Create(j, v1, {Position = j.Position - Vector3.new(0, 160, 0), Size = j.Size * 0.8}):Play()
        end
    end)
    local Blocker = Female.Blocker
    Blocker.Position = Female.Blocker.Position + Vector3.new(0, 150, 0)
    task.delay(25, function() -- Line: 217 -- upvalues: onSpawnLightningStrike (val), Sounds (upval), Titans (upval), TweenService (upval), Female (val), Particles (upval)
        onSpawnLightningStrike()
        Sounds.playGlobalSoundEffect(Titans.FemaleTitanRoar, 0.1, 6)
        task.delay(1, function() -- Line: 221 -- upvalues: TweenService (upval), Female (upval), Particles (upval)
            local v1 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            local v2 = {}
            local v3 = Female.Arm.Ref.CFrame * CFrame.new(0, 125, 0)
            local v4 = math.rad(95)
            v2.CFrame = v3 * CFrame.Angles(0, v4, 0)
            TweenService:Create(Female.Arm.Ref, v1, v2):Play()
            task.wait(0.1)
            Particles.deepEmitParticles(Female.Emit)
            task.wait(0.2)
            v1 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            v2 = {}
            v3 = Female.Arm.Ref.CFrame * CFrame.new(0, -125, 0)
            v4 = math.rad(-40)
            v2.CFrame = v3 * CFrame.Angles(0, v4, 0)
            TweenService:Create(Female.Arm.Ref, v1, v2):Play()
            task.wait(2)
            Female.Arm:Destroy()
        end)
        task.wait(25)
        onSpawnLightningStrike()
        Sounds.playGlobalSoundEffect(Titans.FemaleTitanRoar, 0.1, 1)
    end)
    ;(function() -- Line: 253 -- upvalues: Workspace (upval), Shake (upval), getShakeIntensity (val)
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        local u4 = Shake.new()
        u4.FadeInTime = 10
        u4.FadeOutTime = 10
        u4.Frequency = 0.04
        u4.Amplitude = 0.1
        u4.Sustain = true
        u4.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
        u4:Start()
        u4:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 268 -- upvalues: getShakeIntensity (upval), CurrentCamera (val)
            local v1 = getShakeIntensity()
            if v1 <= 0 then
                return
            end
            local v2 = p2 * v1
            local v3 = CurrentCamera
            local v4 = CFrame.new(p1 * v1)
            v3.CFrame = v3.CFrame * (v4 * CFrame.Angles(v2.X, v2.Y, v2.Z))
        end)
        task.delay(60, function() -- Line: 280 -- upvalues: u4 (val)
            u4:Stop()
            task.wait(10)
            u4:Destroy()
        end)
    end)()
    task.delay(0.6, function() -- Line: 292 -- upvalues: Universal (upval), Sounds (upval)
        local v1 = Universal.Thunder[math.random(1, #Universal.Thunder)]
        Sounds.playGlobalSoundEffect(v1, 0.1, 1.5, 5, NumberRange.new(0.9, 1.1))
    end)
end