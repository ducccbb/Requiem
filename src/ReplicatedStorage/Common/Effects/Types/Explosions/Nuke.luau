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
--             File: ReplicatedStorage.Common.Effects.Types.Explosions.Nuke
--                               Dumped in 0.0132 seconds
--                         Bytecode version 9  |  130 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Lightning_2 = Utilities:WaitForChild("Lightning")
local Lightning = require(Lightning_2:WaitForChild("Lightning"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local Tease = require(script.Parent:WaitForChild("Tease"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Objects = Assets:WaitForChild("Objects")
local Nuke_2 = Objects:WaitForChild("Nuke")
local Start = Nuke_2:WaitForChild("Start")
local Objects_2 = Assets:WaitForChild("Objects")
local Nuke_3 = Objects_2:WaitForChild("Nuke")
local Nuke = Nuke_3:WaitForChild("Nuke")
local Objects_3 = Assets:WaitForChild("Objects")
local Nuke_4 = Objects_3:WaitForChild("Nuke")
local Impacts = Nuke_4:WaitForChild("Impacts")
local Objects_4 = Assets:WaitForChild("Objects")
local Nuke_5 = Objects_4:WaitForChild("Nuke")
local Shockwave = Nuke_5:WaitForChild("Shockwave")
local End = Shockwave:WaitForChild("End")
local Objects_5 = Assets:WaitForChild("Objects")
local Nuke_6 = Objects_5:WaitForChild("Nuke")
local Blast = Nuke_6:WaitForChild("Blast")
local u177 = {"First", "Second", "Third"}
local u185 = Vector3.new(-250, -10, -250)
local u190 = Vector3.new(40000, 40000, 40000)
local u191 = {Cover = 1, Density = 1, Color = Color3.new(0, 0, 0)}
local u197 = {
    Brightness = 0,
    EnvironmentDiffuseScale = 0,
    EnvironmentSpecularScale = 0,
    ExposureCompensation = 0.86,
    Ambient = Color3.new(0, 0, 0),
    ColorShift_Bottom = Color3.new(0, 0, 0),
    ColorShift_Top = Color3.new(0, 0, 0),
}
local u213 = {Brightness = -0.1, Contrast = 0, Saturation = -0.2, TintColor = Color3.fromRGB(255, 214, 143)}
local u219 = {
    Density = 0.355,
    Offset = 0.246,
    Haze = 10,
    Glare = 0,
    Color = Color3.fromRGB(255, 125, 38),
}
local u225 = {
    Brightness = 2.98,
    EnvironmentDiffuseScale = 0.8,
    EnvironmentSpecularScale = 0.2,
    ExposureCompensation = -0.1,
    Ambient = Color3.new(0, 0, 0),
    ColorShift_Bottom = Color3.new(0, 0, 0),
    ColorShift_Top = Color3.new(0, 0, 0),
}
local u241 = {Brightness = -0.1, Contrast = 0.1, Saturation = -0.2, TintColor = Color3.fromRGB(255, 189, 142)}
local u251 = CFrame.new(0, -400, 0)
local u256 = Vector3.new(2048, 2048, 2048)
local u257 = {black = Color3.new(0, 0, 0), blue = Color3.fromRGB(120, 190, 255), white = Color3.fromRGB(255, 255, 255)}
local u273 = {
    white = {Brightness = -5, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
    black = {Brightness = 10, Contrast = -30, Saturation = -1, TintColor = Color3.fromRGB(255, 255, 255)},
    blue = {Brightness = 8, Contrast = -24, Saturation = -0.65, TintColor = Color3.fromRGB(120, 190, 255)},
}
local u292 = {
    {kind = "white", duration = 0.035},
    {kind = "black", duration = 0.018},
    {kind = "white", duration = 0.028},
    {kind = "black", duration = 0.018},
    {kind = "black", duration = 0.018},
    {kind = "white", duration = 0.032},
    {kind = "white", duration = 0.055},
}
local u302 = math.rad(45)
local u307 = Vector3.new(0, 2200, 0)
local u309 = u256.X / 2
local v2 = {}
local v3 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 172, 47))
local v4 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 182, 87))
v2[1] = v3
v2[2] = v4
v2[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 195, 85))
local u336 = ColorSequence.new(v2)
local u337 = {Brightness = -0.25, Contrast = 0.15, Saturation = -0.3, TintColor = Color3.fromRGB(255, 206, 90)}
local u343 = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}
local u353 = Color3.fromRGB(255, 255, 255)
local u354 = {Intensity = 20, Size = 56, Threshold = 0.8}
local u355 = {Intensity = 10, Size = 56, Threshold = 1}
local u356 = {}
local u357 = {}
function getRevealRestoreFov() -- Line: 379 -- upvalues: u357 (val)
    return u357.cameraInitialFov or 70
end
function cancelRevealCameraFovTween() -- Line: 386 -- upvalues: u357 (val)
    if u357.cameraFovTween then
        u357.cameraFovTween:Cancel()
        u357.cameraFovTween = nil
    end
end
function cancelBlastPassFovTween() -- Line: 396 -- upvalues: u357 (val)
    if u357.blastPassFovTween then
        u357.blastPassFovTween:Cancel()
        u357.blastPassFovTween = nil
    end
end
function restoreRevealCameraFov(p1) -- Line: 408 -- upvalues: u357 (val), Workspace (val), TweenService (val)
    local cameraInitialFov = u357.cameraInitialFov
    if not cameraInitialFov then
        return
    end
    if not p1 then
        u357.cameraInitialFov = nil
    end
    cancelRevealCameraFovTween()
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera then
        local v1 = TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        local u20 = TweenService:Create(CurrentCamera, v1, {FieldOfView = cameraInitialFov})
        u357.cameraFovTween = u20
        u20.Completed:Once(function() -- Line: 428 -- upvalues: u357 (upval), u20 (val), CurrentCamera (val), cameraInitialFov (val)
            if u357.cameraFovTween == u20 then
                CurrentCamera.FieldOfView = cameraInitialFov
                u357.cameraFovTween = nil
            end
        end)
        u20:Play()
    end
end
function holdRevealCameraShake() -- Line: 442 -- upvalues: u357 (val)
    if u357.cameraProgressConnection then
        u357.cameraProgressConnection:Disconnect()
        u357.cameraProgressConnection = nil
    end
    local cameraShake = u357.cameraShake
    if cameraShake and cameraShake:IsShaking() then
        cameraShake.Amplitude = cameraShake.Amplitude * 0.55
        cameraShake.RotationInfluence = cameraShake.RotationInfluence * 0.55
        cameraShake.PositionInfluence = cameraShake.PositionInfluence * 0.55
    end
    u357.cameraEffectsActive = nil
end
function stopRevealCameraShakeInstant() -- Line: 462 -- upvalues: u357 (val)
    if u357.cameraProgressConnection then
        u357.cameraProgressConnection:Disconnect()
        u357.cameraProgressConnection = nil
    end
    if u357.cameraShake then
        u357.cameraShake:Destroy()
        u357.cameraShake = nil
    end
end
function easeOutRevealCameraShake() -- Line: 478 -- upvalues: u357 (val)
    if u357.cameraProgressConnection then
        u357.cameraProgressConnection:Disconnect()
        u357.cameraProgressConnection = nil
    end
    local cameraShake = u357.cameraShake
    if not cameraShake or not (cameraShake:IsShaking()) then
        return
    end
    cameraShake.FadeOutTime = 5
    cameraShake:StopSustain()
end
function stopStartScreenShake() -- Line: 497 -- upvalues: u357 (val)
    if u357.startCameraShake then
        u357.startCameraShake:Destroy()
        u357.startCameraShake = nil
    end
end
function playStartScreenShake() -- Line: 508 -- upvalues: Workspace (val), Shake (val), u357 (val)
    stopStartScreenShake()
    if not Workspace.CurrentCamera then
        return
    end
    local u6 = Shake.new()
    u6.FadeInTime = 0
    u6.FadeOutTime = 1.75
    u6.SustainTime = 0.2
    u6.Frequency = 0.06
    u6.Amplitude = 2.2
    u6.RotationInfluence = Vector3.one * 0.1
    u6.PositionInfluence = Vector3.one * 0.14
    u6:Start()
    u6:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2, p3) -- Line: 526 -- upvalues: u357 (upval), u6 (val), Workspace (upval)
        if p3 then
            if u357.startCameraShake == u6 then
                u357.startCameraShake = nil
            end
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            local v1 = CFrame.new(p1)
            CurrentCamera.CFrame = CurrentCamera.CFrame * (v1 * CFrame.Angles(p2.X, p2.Y, p2.Z))
        end
    end)
    u357.startCameraShake = u6
end
function clearRevealCameraEffects(p1, p2) -- Line: 549 -- upvalues: u357 (val)
    if not p2 then
        stopRevealCameraShakeInstant()
    else
        easeOutRevealCameraShake()
    end
    u357.cameraEffectsActive = nil
    if p1 then
        cancelBlastPassFovTween()
        restoreRevealCameraFov()
    end
end
function startBlastPassThroughCameraEffects(p1) -- Line: 569 -- upvalues: Workspace (val), u357 (val), TweenService (val), Shake (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local u5 = p1
    if not u5 then
        u5 = getRevealRestoreFov()
    end
    if u357.cameraProgressConnection then
        u357.cameraProgressConnection:Disconnect()
        u357.cameraProgressConnection = nil
    end
    if u357.cameraShake then
        u357.cameraShake:Destroy()
        u357.cameraShake = nil
    end
    u357.cameraEffectsActive = nil
    cancelRevealCameraFovTween()
    cancelBlastPassFovTween()
    CurrentCamera.FieldOfView = 150
    local v1 = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local u47 = TweenService:Create(CurrentCamera, v1, {FieldOfView = u5})
    u357.blastPassFovTween = u47
    u47.Completed:Once(function() -- Line: 599 -- upvalues: u357 (upval), u47 (val), Workspace (upval), u5 (val)
        if u357.blastPassFovTween ~= u47 then
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            CurrentCamera.FieldOfView = u5
        end
        u357.blastPassFovTween = nil
        u357.cameraInitialFov = nil
    end)
    u47:Play()
    local u59 = Shake.new()
    u59.FadeInTime = 0
    u59.FadeOutTime = 5
    u59.Sustain = true
    u59.Frequency = 0.05
    u59.Amplitude = 1.6
    u59.RotationInfluence = Vector3.one * 0.14
    u59.PositionInfluence = Vector3.one * 0.18
    u59:Start()
    u59:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2, p3) -- Line: 624 -- upvalues: u357 (upval), u59 (val), Workspace (upval)
        if p3 then
            if u357.cameraShake == u59 then
                u357.cameraShake = nil
            end
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            local v1 = CFrame.new(p1)
            CurrentCamera.CFrame = CurrentCamera.CFrame * (v1 * CFrame.Angles(p2.X, p2.Y, p2.Z))
        end
    end)
    u357.cameraShake = u59
    u59:StopSustain()
end
function getBlastPassShockwaveDamage(p1) -- Line: 647
    if 3500 < p1 then
        return nil
    end
    if p1 <= 600 then
        return 150
    end
    return (3500 - p1) / 2900 * 150
end
function applyBlastPassKnockback(p1) -- Line: 667 -- upvalues: RunService (val), u357 (val), Vitality (val), Workspace (val)
    if not (RunService:IsClient()) then
        return
    end
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Utilities = Common:WaitForChild("Utilities")
    local Character = require(Utilities:WaitForChild("Character"))
    local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
    local Client = ReplicatedStorage_2:WaitForChild("Client")
    local User = Client:WaitForChild("User")
    local Equipment = User:WaitForChild("Equipment")
    local Gear = Equipment:WaitForChild("Gear")
    local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
    local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
    local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
    local User_2 = Client_2:WaitForChild("User")
    local State = User_2:WaitForChild("State")
    local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
    local v1 = Character.getCharacter()
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = HumanoidRootPart.Position - p1
    local v3 = getBlastPassShockwaveDamage(Vector3.new(v2.X, 0, v2.Z).Magnitude)
    if u357.damage and v3 and 0 < v3 then
        Vitality.Inflict.post({reason = "shockwave", amount = math.round(v3)})
    end
    if v2.Magnitude < 0.01 then
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            v2 = Vector3.new(0, 0, -1)
        else
            v2 = -CurrentCamera.CFrame.LookVector
        end
    end
    HumanoidRootPart.AssemblyLinearVelocity = v2.Unit * 400
    local v4 = ClientGearHandler.getGearState()
    if v4 then
        v4.signals.ungrapple:Fire("Left")
        v4.signals.ungrapple:Fire("Right")
    end
    ClientStatusHandler.addPlayerStatus("Concussed", 2.5)
end
function getTerrainClouds() -- Line: 718 -- upvalues: Workspace (val), u356 (val)
    local Terrain = Workspace:FindFirstChild("Terrain")
    if not Terrain then
        Terrain = Workspace:WaitForChild("Terrain")
    end
    local Clouds = Terrain:FindFirstChildWhichIsA("Clouds")
    if not Clouds then
        Clouds = Instance.new("Clouds")
        Clouds.Parent = Terrain
        u356.cloudsCreated = true
    end
    return Clouds
end
function getPostImpactAtmosphere() -- Line: 734 -- upvalues: Lighting (val), u356 (val)
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    if not WorldAtmosphere then
        WorldAtmosphere = Instance.new("Atmosphere")
        WorldAtmosphere.Name = "NukePostImpactAtmosphere"
        WorldAtmosphere.Parent = Lighting
        u356.atmosphereCreated = true
    end
    return WorldAtmosphere
end
function cancelPostImpactEnvironmentUndo() -- Line: 750 -- upvalues: u356 (val)
    if u356.undoCompleteThread then
        task.cancel(u356.undoCompleteThread)
        u356.undoCompleteThread = nil
    end
    local undoTweens = u356.undoTweens
    u356.undoTweens = nil
    if undoTweens then
        local v1 = undoTweens
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Cancel()
        end
    end
    cancelMeshSpinEaseOut()
    cancelMushroomTweenOut()
end
function finishPostImpactEnvironmentUndo() -- Line: 773 -- upvalues: u356 (val), Workspace (val), Lighting (val)
    cancelPostImpactEnvironmentUndo()
    if u356.cloudsCreated then
        local Clouds
        local Terrain = Workspace:FindFirstChild("Terrain")
        if not Terrain then
            Clouds = nil
        else
            Clouds = Terrain:FindFirstChildWhichIsA("Clouds")
        end
        if Clouds then
            Clouds:Destroy()
        end
    end
    if u356.atmosphereCreated then
        local NukePostImpactAtmosphere = Lighting:FindFirstChild("NukePostImpactAtmosphere")
        if not NukePostImpactAtmosphere then
            NukePostImpactAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
        end
        if NukePostImpactAtmosphere then
            NukePostImpactAtmosphere:Destroy()
        end
    end
    u356.active = nil
    u356.lightingSnapshot = nil
    u356.cloudsSnapshot = nil
    u356.cloudsCreated = nil
    u356.atmosphereSnapshot = nil
    u356.atmosphereCreated = nil
end
function startPostImpactEnvironmentUndo() -- Line: 804 -- upvalues: u356 (val), TweenService (val), Lighting (val), u225 (val), Workspace (val), u241 (val)
    cancelPostImpactEnvironmentUndo()
    local cloudsSnapshot = u356.cloudsSnapshot
    local atmosphereSnapshot = u356.atmosphereSnapshot
    local colorCorrection = u356.colorCorrection
    if cloudsSnapshot then
        local v1
        local v2 = TweenInfo.new(60, Enum.EasingStyle.Linear)
        local v3 = {}
        u356.undoTweens = v3
        local v4 = TweenService:Create(Lighting, v2, u225)
        table.insert(v3, v4)
        v4:Play()
        if cloudsSnapshot then
            local Terrain = Workspace:FindFirstChild("Terrain")
            if Terrain then
                Terrain = Workspace.Terrain:FindFirstChildWhichIsA("Clouds")
            end
            if Terrain then
                v1 = TweenService:Create(Terrain, v2, {Cover = cloudsSnapshot.Cover, Density = cloudsSnapshot.Density, Color = cloudsSnapshot.Color})
                table.insert(v3, v1)
                v1:Play()
            end
        end
        if atmosphereSnapshot then
            local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
            if not WorldAtmosphere then
                WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
            end
            if WorldAtmosphere then
                v1 = TweenService:Create(WorldAtmosphere, v2, {
                    Density = atmosphereSnapshot.Density,
                    Offset = atmosphereSnapshot.Offset,
                    Color = atmosphereSnapshot.Color,
                    Haze = atmosphereSnapshot.Haze,
                    Glare = atmosphereSnapshot.Glare,
                })
                table.insert(v3, v1)
                v1:Play()
            end
        end
        if colorCorrection then
            local v5 = TweenService:Create(colorCorrection, v2, u241)
            table.insert(v3, v5)
            v5:Play()
        end
        u356.undoCompleteThread = task.delay(60, function() -- Line: 859 -- upvalues: u356 (upval)
            u356.undoCompleteThread = nil
            finishPostImpactEnvironmentUndo()
        end)
        task.delay(75, function() -- Line: 864
            startMeshSpinEaseOut(20)
            tweenOutMushroomCloud(20, nil, TweenInfo.new(20, Enum.EasingStyle.Linear))
        end)
        return
    elseif not atmosphereSnapshot and not colorCorrection then
        return
    end
end
function clearPostImpactEnvironment() -- Line: 878 -- upvalues: u356 (val), Lighting (val), Workspace (val)
    cancelPostImpactEnvironmentUndo()
    if u356.colorCorrection then
        u356.colorCorrection:Destroy()
        u356.colorCorrection = nil
    end
    local lightingSnapshot = u356.lightingSnapshot
    if lightingSnapshot then
        Lighting.Ambient = lightingSnapshot.Ambient
        Lighting.Brightness = lightingSnapshot.Brightness
        Lighting.ColorShift_Bottom = lightingSnapshot.ColorShift_Bottom
        Lighting.ColorShift_Top = lightingSnapshot.ColorShift_Top
        Lighting.EnvironmentDiffuseScale = lightingSnapshot.EnvironmentDiffuseScale
        Lighting.EnvironmentSpecularScale = lightingSnapshot.EnvironmentSpecularScale
        Lighting.ExposureCompensation = lightingSnapshot.ExposureCompensation
    end
    local cloudsSnapshot = u356.cloudsSnapshot
    if cloudsSnapshot then
        local Terrain = Workspace:FindFirstChild("Terrain")
        if Terrain then
            Terrain = Workspace.Terrain:FindFirstChildWhichIsA("Clouds")
        end
        if Terrain then
            Terrain.Cover = cloudsSnapshot.Cover
            Terrain.Density = cloudsSnapshot.Density
            Terrain.Color = cloudsSnapshot.Color
        end
    end
    if u356.cloudsCreated then
        local Clouds
        local Terrain_2 = Workspace:FindFirstChild("Terrain")
        if not Terrain_2 then
            Clouds = nil
        else
            Clouds = Terrain_2:FindFirstChildWhichIsA("Clouds")
        end
        if Clouds then
            Clouds:Destroy()
        end
    end
    local atmosphereSnapshot = u356.atmosphereSnapshot
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    if WorldAtmosphere and atmosphereSnapshot then
        WorldAtmosphere.Density = atmosphereSnapshot.Density
        WorldAtmosphere.Offset = atmosphereSnapshot.Offset
        WorldAtmosphere.Color = atmosphereSnapshot.Color
        WorldAtmosphere.Haze = atmosphereSnapshot.Haze
        WorldAtmosphere.Glare = atmosphereSnapshot.Glare
    end
    if u356.atmosphereCreated and WorldAtmosphere then
        WorldAtmosphere:Destroy()
    end
    u356.active = nil
    u356.lightingSnapshot = nil
    u356.cloudsSnapshot = nil
    u356.cloudsCreated = nil
    u356.atmosphereSnapshot = nil
    u356.atmosphereCreated = nil
end
function applyPostImpactEnvironment(p1) -- Line: 942 -- upvalues: u356 (val), Lighting (val), u191 (val), u197 (val), u219 (val), u213 (val)
    if u356.active then
        return
    end
    u356.active = true
    u356.cloudsCreated = false
    u356.atmosphereCreated = false
    u356.lightingSnapshot = {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
    local v1 = getTerrainClouds()
    u356.cloudsSnapshot = {Cover = v1.Cover, Density = v1.Density, Color = v1.Color}
    v1.Cover = u191.Cover
    v1.Density = u191.Density
    v1.Color = u191.Color
    Lighting.Ambient = u197.Ambient
    Lighting.Brightness = u197.Brightness
    Lighting.ColorShift_Bottom = u197.ColorShift_Bottom
    Lighting.ColorShift_Top = u197.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = u197.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = u197.EnvironmentSpecularScale
    Lighting.ExposureCompensation = u197.ExposureCompensation
    local v2 = getPostImpactAtmosphere()
    u356.atmosphereSnapshot = {
        Density = v2.Density,
        Offset = v2.Offset,
        Color = v2.Color,
        Haze = v2.Haze,
        Glare = v2.Glare,
    }
    v2.Density = u219.Density
    v2.Offset = u219.Offset
    v2.Color = u219.Color
    v2.Haze = u219.Haze
    v2.Glare = u219.Glare
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "NukePostImpactColorCorrection"
    ColorCorrectionEffect.Brightness = u213.Brightness
    ColorCorrectionEffect.Contrast = u213.Contrast
    ColorCorrectionEffect.Saturation = u213.Saturation
    ColorCorrectionEffect.TintColor = u213.TintColor
    ColorCorrectionEffect.Parent = Lighting
    u356.colorCorrection = ColorCorrectionEffect
    if not p1 then
        startPostImpactEnvironmentUndo()
    end
end
local u378 = {}
local u379 = {spinSpeedMultiplier = 1}
function cancelMeshSpinEaseOut() -- Line: 1124 -- upvalues: u379 (val)
    if u379.spinEaseOutConnection then
        u379.spinEaseOutConnection:Disconnect()
        u379.spinEaseOutConnection = nil
    end
    if u379.spinEaseOutProgress then
        u379.spinEaseOutProgress:Destroy()
        u379.spinEaseOutProgress = nil
    end
    u379.spinSpeedMultiplier = 1
end
function startMeshSpinEaseOut(p1) -- Line: 1143 -- upvalues: u379 (val), TweenService (val)
    local v1
    if u379.spinEaseOutProgress then
        return
    end
    if not p1 then
        v1 = 20
    elseif 0 >= p1 then
        v1 = 20
    else
        v1 = p1
    end
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 1
    u379.spinEaseOutProgress = NumberValue
    u379.spinSpeedMultiplier = 1
    u379.spinEaseOutConnection = NumberValue.Changed:Connect(function(p1) -- Line: 1155 -- upvalues: u379 (upval)
        u379.spinSpeedMultiplier = p1
    end)
    local v2 = TweenInfo.new(v1, Enum.EasingStyle.Linear)
    TweenService:Create(NumberValue, v2, {Value = 0}):Play()
end
function resolvePivot(p1) -- Line: 1167
    if typeof(p1) == "CFrame" then
        return p1
    end
    if p1:IsA("Model") then
        return p1:GetPivot()
    end
    return p1.CFrame
end
function getBuildupDuration(p1) -- Line: 1184
    if not p1 then
        return 2.5
    end
    if p1.duration then
        return p1.duration
    end
    return 2.5
end
function getBuildupTotalDuration(p1) -- Line: 1193
    return 0.3 + getBuildupDuration(p1)
end
function getFlashDuration(p1) -- Line: 1202
    if not p1 then
        return 2.5
    end
    if p1.flashDuration then
        return p1.flashDuration
    end
    return 2.5
end
function getRevealFlashTweenInfo(p1) -- Line: 1211
    return TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
end
function clearBuildupLightning() -- Line: 1219 -- upvalues: u378 (val)
    local v1, v2
    if u378.lightningConnection then
        u378.lightningConnection:Disconnect()
        u378.lightningConnection = nil
    end
    local lightningBolts = u378.lightningBolts
    u378.lightningBolts = nil
    if lightningBolts then
        local v3 = lightningBolts
        v1 = nil
        v2 = nil
        for i, j in v3, v1, v2 do
            j.Enabled = false
            pcall(function() -- Line: 1231 -- upvalues: j (val)
                j:Destroy()
            end)
        end
    end
    local lightningAttachments = u378.lightningAttachments
    u378.lightningAttachments = nil
    if lightningAttachments then
        v1 = lightningAttachments
        v2 = nil
        local v4 = nil
        for k, n in v1, v2, v4 do
            n:Destroy()
        end
    end
    u378.lightningDispersion = nil
    u378.lightningCenterAttachment = nil
    u378.lightningOriginAttachment = nil
end
function clearBuildupShockwaves() -- Line: 1255 -- upvalues: u378 (val)
    if u378.shockwaveSpawnThread then
        task.cancel(u378.shockwaveSpawnThread)
        u378.shockwaveSpawnThread = nil
    end
    local shockwaveParts = u378.shockwaveParts
    u378.shockwaveParts = nil
    if shockwaveParts then
        local v1 = shockwaveParts
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j.Parent then
                j:Destroy()
            end
        end
    end
end
function spawnBuildupShockwave(p1, p2) -- Line: 1279 -- upvalues: End (val), u378 (val), TweenService (val), u185 (val)
    local u5 = End:Clone()
    u5.Anchored = true
    u5.CFrame = p1
    u5.Parent = p2
    local shockwaveParts = u378.shockwaveParts
    if not shockwaveParts then
        shockwaveParts = {}
    end
    u378.shockwaveParts = shockwaveParts
    table.insert(shockwaveParts, u5)
    local Mesh = u5:FindFirstChild("Mesh")
    local Decal = u5:FindFirstChild("Decal")
    local v1 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    if Mesh then
        TweenService:Create(Mesh, v1, {Scale = u185}):Play()
    end
    if Decal then
        TweenService:Create(Decal, v1, {Transparency = 1}):Play()
    end
    task.delay(0.4, function() -- Line: 1305 -- upvalues: u378 (upval), u5 (val)
        local shockwaveParts = u378.shockwaveParts
        if shockwaveParts then
            local v1 = table.find(shockwaveParts, u5)
            if v1 then
                table.remove(shockwaveParts, v1)
            end
        end
        if u5.Parent then
            u5:Destroy()
        end
    end)
end
function startBuildupShockwaves(p1, p2, p3) -- Line: 1327 -- upvalues: u378 (val)
    clearBuildupShockwaves()
    u378.shockwaveParts = {}
    u378.shockwaveSpawnThread = task.spawn(function() -- Line: 1331 -- upvalues: p3 (val), u378 (upval), p1 (val), p2 (val)
        local v1
        local v2 = 0
        while v2 < p3 do
            if not u378.instance then
                break
            end
            spawnBuildupShockwave(p1(), p2)
            v1 = math.min(0.2, p3 - v2)
            if v1 <= 0 then
                break
            end
            task.wait(v1)
            v2 = v2 + v1
        end
        u378.shockwaveSpawnThread = nil
    end)
end
function getBlastPartWorldRadius(p1) -- Line: 1359
    local Size = p1.Size
    return math.max(Size.X, Size.Y, Size.Z) * 0.5
end
function clearBuildupBallPassColorCorrection() -- Line: 1368 -- upvalues: u378 (val)
    if u378.ballPassColorCorrection then
        u378.ballPassColorCorrection:Destroy()
        u378.ballPassColorCorrection = nil
    end
end
function applyBuildupBallPassColorCorrection() -- Line: 1379 -- upvalues: Lighting (val), u378 (val)
    clearBuildupBallPassColorCorrection()
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "NukeBuildupBallPassColorCorrection"
    ColorCorrectionEffect.Brightness = 5
    ColorCorrectionEffect.Parent = Lighting
    u378.ballPassColorCorrection = ColorCorrectionEffect
end
function clearBuildupBallPassDetection() -- Line: 1393 -- upvalues: u378 (val)
    if u378.ballPassConnection then
        u378.ballPassConnection:Disconnect()
        u378.ballPassConnection = nil
    end
end
function startBuildupBallPassDetection(p1) -- Line: 1405 -- upvalues: RunService (val), u357 (val), Vitality (val), u378 (val), Workspace (val)
    clearBuildupBallPassDetection()
    if not (RunService:IsClient()) then
        return
    end
    local u7 = false
    local function onBallPassedThrough() -- Line: 1414 -- upvalues: u7 (ref), u357 (upval), Vitality (upval)
        if u7 then
            return
        end
        u7 = true
        clearBuildupBallPassDetection()
        if u357.buildupBallFlash then
            applyBuildupBallPassColorCorrection()
        end
        if u357.damage then
            Vitality.Inflict.post({reason = "nuke", amount = 500})
        end
    end
    u378.ballPassConnection = RunService.RenderStepped:Connect(function() -- Line: 1434 -- upvalues: u7 (ref), p1 (val), Workspace (upval), onBallPassedThrough (val)
        if u7 or not p1.Parent then
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        if (CurrentCamera.CFrame.Position - p1.Position).Magnitude <= getBlastPartWorldRadius(p1) then
            onBallPassedThrough()
        end
    end)
end
function clearBuildup() -- Line: 1458 -- upvalues: u378 (val)
    clearBuildupBallPassDetection()
    clearBuildupBallPassColorCorrection()
    if u378.ballSpawnThread then
        task.cancel(u378.ballSpawnThread)
        u378.ballSpawnThread = nil
    end
    if u378.progressConnection then
        u378.progressConnection:Disconnect()
        u378.progressConnection = nil
    end
    if u378.progress then
        u378.progress:Destroy()
        u378.progress = nil
    end
    if u378.instance then
        u378.instance:Destroy()
        u378.instance = nil
    end
    clearBuildupShockwaves()
    clearBuildupLightning()
end
function prepareBubbleModelForBuildup(p1, p2) -- Line: 1492
    local v1 = p2
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
        elseif j:IsA("WeldConstraint") then
            if j.Part0 == v1 then
                j:Destroy()
            elseif j.Part1 ~= v1 then
            end
        elseif not (j:IsA("Weld")) then
        end
    end
end
function removeBlastBubbleConstraints(p1, p2, p3) -- Line: 1513
    local Part0, Part1, v1, v2, v3, v4
    v1, v4 = p2, p3
    for i, j in p1:GetDescendants() do
        if j:IsA("WeldConstraint") then
            Part0 = j.Part0
            Part1 = j.Part1
            if Part0 and Part1 then
                v2 = if Part0 ~= v1 then Part1 == v1 else true
                v3 = v4:IsAncestorOf(Part0)
                if not v3 then
                    v3 = v4:IsAncestorOf(Part1)
                end
                if v2 and v3 then
                    j:Destroy()
                end
            end
        elseif not (j:IsA("Weld")) then
        end
    end
end
function randomBuildupLightningMultiplier() -- Line: 1537
    return math.random(30, 150) / 100
end
function startBuildupLightning(p1, p2, p3) -- Line: 1548 -- upvalues: Workspace (val), Lightning (val), u336 (val), u378 (val), u307 (val), RunService (val), u302 (val)
    local X, Z, v1, v2, v3, v4, v5
    clearBuildupLightning()
    local Terrain = Workspace:FindFirstChild("Terrain")
    if not Terrain then
        Terrain = Workspace
    end
    local u11 = {}
    local u12 = {}
    local function createAttachment(p1) -- Line: 1556 -- upvalues: Terrain (val), u11 (val)
        local Attachment = Instance.new("Attachment")
        Attachment.WorldPosition = p1
        Attachment.Parent = Terrain
        table.insert(u11, Attachment)
        return Attachment
    end
    local function createLightningBolt(p1, p2, p3, p4, p5, p6, p7) -- Line: 1564 -- upvalues: Lightning (upval), u336 (upval), u12 (val)
        local v1 = Lightning.new(p1, p2, p3)
        v1.Color = u336
        v1.Thickness = p4
        v1.PulseSpeed = p6
        v1.PulseLength = p7
        v1.FadeLength = 0.7
        v1.ColorOffsetSpeed = 0
        v1.MaxRadius = p5
        table.insert(u12, v1)
        return v1
    end
    local u24 = createAttachment(p1 + Vector3.new(0, 3500, 0))
    local u27 = createAttachment(p1)
    local u35 = createAttachment(p1 + Vector3.new(0, 500, 0))
    u378.lightningOriginAttachment = u24
    u378.lightningCenterAttachment = u27
    local v6 = 3
    local v7 = 1
    for i = 1, v6, v7 do
        createLightningBolt(u24, u27, 40, 50, 160, 5, 1000000)
    end
    v6 = 4
    v7 = 1
    for j = 1, v6, v7 do
        createLightningBolt(u24, u27, 15, 24, 360, 5, 1000000)
    end
    v6 = 4
    v7 = 1
    for k = 1, v6, v7 do
        createLightningBolt(u24, u35, 10, 14, 700, 5, 1000000)
    end
    local u113 = {}
    v7 = 8
    local v8 = 1
    for n = 1, v7, v8 do
        v1 = math.rad(n / 8 * 360)
        v2 = math.random(90, 110) / 100
        X = p1.X
        v4 = math.cos(v1)
        Z = p1.Z
        v5 = math.sin(v1)
        v5 = Vector3.new(X + v4 * (120 * v2), p1.Y, Z + v5 * (120 * v2))
        v3 = createAttachment(v5 + u307)
        table.insert(u113, {
            attachment = v3,
            bolt = createLightningBolt(u24, v3, 10, 32, 420, 5, 1000000),
            spinMult = randomBuildupLightningMultiplier(),
            expandMult = randomBuildupLightningMultiplier(),
            raiseMult = randomBuildupLightningMultiplier(),
        })
    end
    u378.lightningAttachments = u11
    u378.lightningBolts = u12
    u378.lightningDispersion = u113
    local u216 = 0
    u378.lightningConnection = RunService.RenderStepped:Connect(function(a1) -- Line: 1658 -- upvalues: u378 (upval), u216 (ref), p3 (val), p1 (val), u27 (val), u35 (val), u24 (val), u113 (val), u302 (upval), u307 (upval)
        local bolt, bolt_2, v1, v2, v3, v4, v5, v6, v7, v8
        if not u378.lightningBolts then
            clearBuildupLightning()
            return
        end
        u216 = u216 + a1
        if not p3 then
            v1 = p1
        else
            v1 = p3()
        end
        u27.WorldPosition = v1
        u35.WorldPosition = v1 + Vector3.new(0, 500, 0)
        u24.WorldPosition = v1 + Vector3.new(0, 3500, 0)
        local v9 = u113
        local v10 = nil
        local v11 = nil
        for i, j in v9, v10, v11 do
            v7 = math.rad(i / 8 * 360) + u216 * u302 * j.spinMult
            v8 = math.random(60, 110) / 100 * 350
            v2 = u216 * 900 * j.expandMult + 120
            v4 = math.cos(v7)
            v3 = v1.X + v4 * (v2 + v8)
            v5 = math.sin(v7)
            v6 = Vector3.new(v3, v1.Y + u216 * 120 * j.raiseMult, v1.Z + v5 * (v2 + v8))
            j.attachment.WorldPosition = v6 + u307
            bolt = j.bolt
            bolt.CurveSize0 = bolt.CurveSize0 + a1 * (i / 8 * 250)
            bolt_2 = j.bolt
            bolt_2.CurveSize1 = bolt_2.CurveSize1 - a1 * (i / 8 * -250)
        end
    end)
    task.delay(p2, clearBuildupLightning)
end
function startBuildup(p1, p2) -- Line: 1694 -- upvalues: Start (val), u251 (val), Workspace (val), u256 (val), u378 (val), TweenService (val)
    local ExtentsSize, Magnitude, Pivot, parent, pivotOffset, v1, v2, v3, xAxis
    clearBuildup()
    local u174 = Start:Clone()
    local Blast = u174:FindFirstChild("Blast")
    local Bubbles = u174:FindFirstChild("Bubbles")
    if not Blast or not Bubbles then
        u174:Destroy()
        return nil
    end
    if not p2 then
        pivotOffset = u251
    elseif p2.pivotOffset then
        pivotOffset = p2.pivotOffset
    end
    local u178 = getBuildupDuration(p2)
    if not p2 then
        parent = Workspace
    elseif p2.parent then
        parent = p2.parent
    end
    local v4 = resolvePivot(p1) * pivotOffset
    local Position = v4.Position
    u174:PivotTo(v4)
    Blast.Anchored = true
    removeBlastBubbleConstraints(u174, Blast, Bubbles)
    local function getBlastCFrame() -- Line: 1724 -- upvalues: u174 (val), Blast (val), Position (val)
        if not u174.Parent then
            return CFrame.new(Position)
        end
        if Blast.Parent then
            return Blast.CFrame
        end
        return CFrame.new(Position)
    end
    local v5 = getBuildupTotalDuration(p2)
    startBuildupLightning(Position, v5, function() -- Line: 1716 -- upvalues: u174 (val), Blast (val), Position (val)
        if not u174.Parent then
            return Position
        end
        if Blast.Parent then
            return Blast.Position
        end
        return Position
    end)
    local Size = Blast.Size
    local Position_2 = Blast.Position
    local u170 = {}
    for i, j in Bubbles:GetChildren() do
        if j:IsA("Model") then
            Pivot = j:GetPivot()
            prepareBubbleModelForBuildup(j, Blast)
            v2 = Pivot.Position - Position_2
            v3 = Vector3.new(v2.X, 0, v2.Z)
            Magnitude = v3.Magnitude
            if 0 >= Magnitude then
                xAxis = Vector3.xAxis
            else
                xAxis = Vector3.yAxis:Cross(v3.Unit)
            end
            ExtentsSize = j:GetExtentsSize()
            table.insert(u170, {
                model = j,
                initialY = Pivot.Position.Y,
                initialOffset = v2,
                initialRotation = Pivot - Pivot.Position,
                initialScale = j:GetScale(),
                initialHorizontalDistance = Magnitude,
                rollAxis = xAxis,
                initialRadius = math.max(math.max(ExtentsSize.X, ExtentsSize.Y, ExtentsSize.Z) * 0.5, 0.01),
                initialRollOffset = math.random() * math.pi * 2,
            })
        end
    end
    local function applyBuildupProgress(p1) -- Line: 1769 -- upvalues: Size (val), u256 (upval), Blast (val), u170 (val)
        local initialOffset, v1, v2, v3, v4, v5, v6
        local v7 = Size:Lerp(u256, p1)
        local v8 = v7.X / Size.X
        local Position = Blast.Position
        Blast.Size = v7
        local v9 = u170
        local v10 = nil
        local v11 = nil
        for i, j in v9, v10, v11 do
            initialOffset = j.initialOffset
            v1 = Vector3.new(Position.X + initialOffset.X * v8, j.initialY, Position.Z + initialOffset.Z * v8)
            v2 = j.initialScale * v8
            v3 = j.initialHorizontalDistance * (v8 - 1) / math.max(j.initialRadius * v8, 0.01)
            v4 = j.initialRollOffset + (v3 + p1 * 0.5 * math.pi * 2) * 1
            v6 = CFrame.new(v1)
            v5 = v6 * j.initialRotation
            j.model:ScaleTo(v2)
            j.model:PivotTo(v5 * CFrame.fromAxisAngle(v5:VectorToObjectSpace(j.rollAxis).Unit, v4))
        end
    end
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    v1 = NumberValue.Changed:Connect(function(p1) -- Line: 1800 -- upvalues: u174 (val), applyBuildupProgress (val)
        if not u174.Parent then
            return
        end
        applyBuildupProgress(p1)
    end)
    u378.instance = u174
    u378.progress = NumberValue
    u378.progressConnection = v1
    u378.ballSpawnThread = task.delay(0.3, function() -- Line: 1812 -- upvalues: u378 (upval), u174 (val), parent (val), applyBuildupProgress (val), Blast (val), getBlastCFrame (val), u178 (val), TweenService (upval), NumberValue (val)
        u378.ballSpawnThread = nil
        if u378.instance ~= u174 then
            return
        end
        u174.Parent = parent
        applyBuildupProgress(0)
        startBuildupBallPassDetection(Blast)
        startBuildupShockwaves(getBlastCFrame, parent, u178)
        local v1 = TweenInfo.new(u178, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(NumberValue, v1, {Value = 1}):Play()
    end)
    return u174
end
function prepareMushroomParts(p1) -- Line: 1838
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
        elseif j:IsA("WeldConstraint") then
            j:Destroy()
        elseif not (j:IsA("Weld")) then
        end
    end
end
function playShockwaves(p1) -- Line: 1853 -- upvalues: TweenService (val)
    local Size
    local Shockwaves = p1:FindFirstChild("Shockwaves")
    if not Shockwaves then
        return
    end
    local v1 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    for i, j in Shockwaves:GetChildren() do
        if j:IsA("BasePart") then
            Size = j.Size
            j.Size = Vector3.zero
            TweenService:Create(j, v1, {Transparency = 1, Size = Size}):Play()
        end
    end
end
function hideMushroomShockwaves(p1) -- Line: 1881
    local Shockwaves = p1:FindFirstChild("Shockwaves")
    if not Shockwaves then
        return
    end
    for i, j in Shockwaves:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = 1
        end
    end
end
function isMushroomShockwavePart(p1, p2) -- Line: 1900
    local Shockwaves = p2:FindFirstChild("Shockwaves")
    if not Shockwaves then
        return false
    end
    return p1:IsDescendantOf(Shockwaves)
end
function clearMushroomLightning() -- Line: 1913 -- upvalues: u379 (val)
    local v1, v2
    u379.lightningActive = false
    if u379.lightningCleanupThread then
        task.cancel(u379.lightningCleanupThread)
        u379.lightningCleanupThread = nil
    end
    local lightningBolts = u379.lightningBolts
    u379.lightningBolts = nil
    if lightningBolts then
        local v3 = lightningBolts
        v1 = nil
        v2 = nil
        for i, j in v3, v1, v2 do
            j.Enabled = false
            pcall(function() -- Line: 1927 -- upvalues: j (val)
                j:Destroy()
            end)
        end
    end
    local lightningAttachments = u379.lightningAttachments
    u379.lightningAttachments = nil
    u379.lightningStrikeCenter = nil
    if lightningAttachments then
        v1 = lightningAttachments
        v2 = nil
        local v4 = nil
        for k, n in v1, v2, v4 do
            if n.Parent then
                n:Destroy()
            end
        end
    end
end
function clearAllNukeLightning() -- Line: 1950
    clearBuildupLightning()
    clearMushroomLightning()
end
function randomMushroomLightningOffset() -- Line: 1959 -- upvalues: u309 (val)
    if math.random() < 0.2 then
        return Vector3.zero
    end
    local v1 = math.random() * math.pi * 2
    local v2 = u309 * 0.55 * (math.random(35, 100) / 100)
    local v3 = math.cos(v1) * v2
    return (Vector3.new(v3, 0, math.sin(v1) * v2))
end
function startMushroomLightning(p1) -- Line: 1974 -- upvalues: Workspace (val), u309 (val), u379 (val), Lightning (val), u336 (val)
    clearBuildupLightning()
    clearMushroomLightning()
    local Position = p1:GetPivot().Position
    local Terrain = Workspace:FindFirstChild("Terrain")
    if not Terrain then
        Terrain = Workspace
    end
    local u15 = {}
    local function createAttachment(p1) -- Line: 1983 -- upvalues: Terrain (val), u15 (val)
        local Attachment = Instance.new("Attachment")
        Attachment.WorldPosition = p1
        Attachment.Parent = Terrain
        table.insert(u15, Attachment)
        return Attachment
    end
    local v1 = -u309
    local u28 = createAttachment(Position + Vector3.new(0, v1, 0))
    u379.lightningActive = true
    u379.lightningStrikeCenter = u28
    u379.lightningAttachments = u15
    u379.lightningBolts = {}
    local function spawnShockStrike() -- Line: 1997 -- upvalues: u379 (upval), p1 (val), u28 (val), Position (val), u309 (upval), createAttachment (val), Lightning (upval), u336 (upval)
        local lightningBolts, v1, v2, v3, v4, v5, v6, v7
        if not u379.lightningActive or not p1.Parent or not u28.Parent then
            return
        end
        local v8 = math.random(1, 2)
        local v9 = 1
        for i = 1, v8, v9 do
            if not u379.lightningActive or not u379.lightningBolts then
                break
            end
            v5 = Position + randomMushroomLightningOffset()
            v4 = v5 + Vector3.new(0, u309 + 1800, 0)
            local u32 = createAttachment(v4)
            v6 = (v4 - u28.WorldPosition).Magnitude * (math.random(8, 20) / 100)
            v7 = math.random(200, 500) / 100
            v1 = math.random(1000, 1600) / 100
            local u58 = Lightning.new(u32, u28, 40)
            u58.Color = u336
            u58.Thickness = 10 * (math.random(85, 115) / 100)
            u58.PulseSpeed = v1
            u58.PulseLength = v7
            u58.FadeLength = math.random(12, 22) / 100
            u58.ColorOffsetSpeed = math.random(20, 50) / 10
            u58.MinRadius = 0
            u58.MaxRadius = math.random(18000, 42000) / 100
            u58.Frequency = math.random(160, 280) / 100
            u58.AnimationSpeed = math.random(1000, 1600) / 100
            if math.random() >= 0.5 then
                v2 = -1
            else
                v2 = 1
            end
            u58.CurveSize0 = v6 * v2
            if math.random() >= 0.5 then
                v3 = -1
            else
                v3 = 1
            end
            u58.CurveSize1 = v6 * v3 * (math.random(70, 130) / 100)
            u58.MinThicknessMultiplier = math.random(35, 55) / 100
            u58.MaxThicknessMultiplier = math.random(95, 130) / 100
            lightningBolts = u379.lightningBolts
            if not u379.lightningActive then
                if u32.Parent then
                    u32:Destroy()
                end
                u58.Enabled = false
                pcall(function() -- Line: 2046 -- upvalues: u58 (val)
                    u58:Destroy()
                end)
            elseif lightningBolts then
                table.insert(lightningBolts, u58)
                task.delay((v7 + 1) / v1 + 0.05, function() -- Line: 2055 -- upvalues: u32 (val), u58 (val), u379 (upval)
                    if u32.Parent then
                        u32:Destroy()
                    end
                    u58.Enabled = false
                    pcall(function() -- Line: 2061 -- upvalues: u58 (upval)
                        u58:Destroy()
                    end)
                    local lightningBolts = u379.lightningBolts
                    if lightningBolts then
                        local v1 = table.find(lightningBolts, u58)
                        if v1 then
                            table.remove(lightningBolts, v1)
                        end
                    end
                end)
            end
        end
    end
    task.spawn(function() -- Line: 2076 -- upvalues: u379 (upval), p1 (val), spawnShockStrike (val)
        while u379.lightningActive do
            if not p1.Parent then
                break
            end
            spawnShockStrike()
            task.wait(math.random(8, 22) / 100)
        end
    end)
    if u379.lightningCleanupThread then
        task.cancel(u379.lightningCleanupThread)
    end
    u379.lightningCleanupThread = task.delay(4, function() -- Line: 2089 -- upvalues: u379 (upval)
        u379.lightningCleanupThread = nil
        clearMushroomLightning()
    end)
end
function cancelMushroomTweenOut() -- Line: 2099 -- upvalues: u379 (val)
    if u379.easeOutConnection then
        u379.easeOutConnection:Disconnect()
        u379.easeOutConnection = nil
    end
    if u379.easeOutProgress then
        u379.easeOutProgress:Destroy()
        u379.easeOutProgress = nil
    end
end
function clearMushroomImpactCameraLookAt() -- Line: 2115 -- upvalues: RunService (val)
    RunService:UnbindFromRenderStep("NukeImpactCameraLookAt")
end
function getImpactTargetPivot(p1) -- Line: 2124
    if typeof(p1) == "CFrame" then
        return p1.Position
    end
    if p1:IsA("Model") then
        return p1:GetPivot().Position
    end
    return p1.Position
end
function startMushroomImpactCameraLookAt(p1) -- Line: 2141 -- upvalues: Workspace (val), RunService (val)
    clearMushroomImpactCameraLookAt()
    if not Workspace.CurrentCamera then
        return
    end
    RunService:BindToRenderStep("NukeImpactCameraLookAt", Enum.RenderPriority.Last.Value + 1, function() -- Line: 2149 -- upvalues: Workspace (upval), p1 (val)
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        local v1 = getImpactTargetPivot(p1)
        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, v1)
    end)
end
function startMushroomImpactFrameFov() -- Line: 2164 -- upvalues: Workspace (val), u379 (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    if not u379.impactFrameRestoreFov then
        u379.impactFrameRestoreFov = getRevealRestoreFov()
    end
    CurrentCamera.FieldOfView = 120
end
function restoreMushroomImpactFrameFov() -- Line: 2181 -- upvalues: u379 (val), Workspace (val)
    local impactFrameRestoreFov = u379.impactFrameRestoreFov
    u379.impactFrameRestoreFov = nil
    if not impactFrameRestoreFov then
        return
    end
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera then
        local v1 = impactFrameRestoreFov
        if not v1 then
            v1 = getRevealRestoreFov()
        end
        CurrentCamera.FieldOfView = v1
    end
end
function clearMushroomImpactFrames() -- Line: 2199 -- upvalues: u379 (val)
    u379.impactFrameCancelled = true
    if u379.impactFrameThread then
        task.cancel(u379.impactFrameThread)
        u379.impactFrameThread = nil
    end
    if u379.impactHighlight then
        u379.impactHighlight:Destroy()
        u379.impactHighlight = nil
    end
    if u379.impactColorCorrection then
        u379.impactColorCorrection:Destroy()
        u379.impactColorCorrection = nil
    end
    if u379.impactInstance then
        u379.impactInstance:Destroy()
        u379.impactInstance = nil
    end
    u379.impactSequenceActive = false
    restoreMushroomImpactFrameFov()
    clearRevealBlast()
    clearMushroomImpactCameraLookAt()
    restoreRevealCameraFov()
    easeOutRevealCameraShake()
end
function applyMushroomImpactFrameColorCorrection(p1, p2) -- Line: 2239 -- upvalues: u273 (val)
    local v1 = u273[p2]
    p1.Brightness = v1.Brightness
    p1.Contrast = v1.Contrast
    p1.Saturation = v1.Saturation
    p1.TintColor = v1.TintColor
end
function createMushroomImpactColorCorrection() -- Line: 2251 -- upvalues: Lighting (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "NukeMushroomImpactColorCorrection"
    ColorCorrectionEffect.Parent = Lighting
    applyMushroomImpactFrameColorCorrection(ColorCorrectionEffect, "black")
    return ColorCorrectionEffect
end
function getSpecialMeshWorldRadius(p1, p2) -- Line: 2265
    local Scale = p2.Scale
    local Size = p1.Size
    local v1 = Size.X * math.abs(Scale.X)
    local v2 = Size.Y * math.abs(Scale.Y)
    return math.max(v1, v2, Size.Z * math.abs(Scale.Z)) * 0.5
end
function multiplyVector3(p1, p2) -- Line: 2287
    local v1 = p1.X * p2.X
    local v2 = p1.Y * p2.Y
    return (Vector3.new(v1, v2, p1.Z * p2.Z))
end
function divideVector3(p1, p2) -- Line: 2297
    local v1 = p1.X / p2.X
    local v2 = p1.Y / p2.Y
    return (Vector3.new(v1, v2, p1.Z / p2.Z))
end
function getBlastMeshTargetScale(p1, p2) -- Line: 2307 -- upvalues: u190 (val)
    return multiplyVector3(p1, divideVector3(u190, p2))
end
function collectBlastMeshEntries(p1) -- Line: 2316
    local Mesh, v1, v2
    local v3 = {}
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            Mesh = j:FindFirstChild("Mesh")
            if Mesh then
                v1 = {
                    angle = 0,
                    part = j,
                    mesh = Mesh,
                    initialScale = Mesh.Scale,
                    initialCFrame = j.CFrame,
                }
                if math.random() >= 0.5 then
                    v2 = -1
                else
                    v2 = 1
                end
                v1.spinSpeed = v2 * 7
                table.insert(v3, v1)
            end
        end
    end
    return v3
end
function getBlastModelMaxWorldRadius(p1) -- Line: 2347
    local Mesh
    local v1 = 0
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            Mesh = j:FindFirstChild("Mesh")
            if Mesh then
                v1 = math.max(v1, getSpecialMeshWorldRadius(j, Mesh))
            end
        end
    end
    return v1
end
function clearRevealBlast() -- Line: 2368 -- upvalues: u379 (val)
    local blastMeshTweens, blastPartTweens, v1, v2
    if u379.blastPassConnection then
        u379.blastPassConnection:Disconnect()
        u379.blastPassConnection = nil
    end
    if u379.blastMeshTweens then
        blastMeshTweens = u379.blastMeshTweens
        v1 = nil
        v2 = nil
        for i, j in blastMeshTweens, v1, v2 do
            j:Cancel()
        end
        u379.blastMeshTweens = nil
    end
    if u379.blastPartTweens then
        blastPartTweens = u379.blastPartTweens
        v1 = nil
        v2 = nil
        for k, n in blastPartTweens, v1, v2 do
            n:Cancel()
        end
        u379.blastPartTweens = nil
    end
    if u379.blastModel then
        u379.blastModel:Destroy()
        u379.blastModel = nil
    end
end
function playRevealBlast(p1, p2, p3) -- Line: 2401 -- upvalues: Blast (val), u379 (val), u357 (val), RunService (val), Workspace (val), TweenService (val)
    local v1, v2, v3, v4
    clearRevealBlast()
    local u6 = getRevealRestoreFov()
    local u10 = Blast:Clone()
    u10:PivotTo(resolvePivot(p1) * p2)
    u10.Parent = p3
    u379.blastModel = u10
    for i, j in u10:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
        end
    end
    local u34 = collectBlastMeshEntries(u10)
    if #u34 == 0 then
        task.delay(15, clearRevealBlast)
        return
    end
    local u42 = false
    local u103 = 0
    local function onBlastPassedThrough() -- Line: 2427 -- upvalues: u42 (ref), u10 (val), u357 (upval), u6 (val)
        if u42 then
            return
        end
        u42 = true
        clearRevealBlast()
        if not u357.blastPassKnockback then
            return
        end
        applyBlastPassKnockback(u10:GetPivot().Position)
        startBlastPassThroughCameraEffects(u6)
    end
    local function onBlastTweenCompleted() -- Line: 2445 -- upvalues: u42 (ref), u103 (ref)
        if u42 then
            return
        end
        u103 = u103 - 1
        if 0 < u103 then
            return
        end
        clearRevealBlast()
        restoreRevealCameraFov()
        easeOutRevealCameraShake()
    end
    u379.blastPassConnection = RunService.RenderStepped:Connect(function(p1) -- Line: 2460 -- upvalues: u42 (ref), u10 (val), u34 (val), u357 (upval), Workspace (upval), onBlastPassedThrough (val)
        local v1, v2
        if u42 or not u10.Parent then
            return
        end
        local v3 = u34
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j.part.Parent then
                j.angle = j.angle + p1 * j.spinSpeed
                v2 = j.initialCFrame - j.initialCFrame.Position
                v1 = CFrame.new(j.initialCFrame.Position)
                j.part.CFrame = v1 * CFrame.Angles(0, j.angle, 0) * v2
            end
        end
        if not u357.blastPassKnockback then
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        if (CurrentCamera.CFrame.Position - u10:GetPivot().Position).Magnitude <= getBlastModelMaxWorldRadius(u10) then
            onBlastPassedThrough()
        end
    end)
    v1 = TweenInfo.new(15, Enum.EasingStyle.Linear)
    local v5 = {}
    local v6 = {}
    local v7 = u34
    local v8 = nil
    local v9 = nil
    for k, n in v7, v8, v9 do
        v2 = getBlastMeshTargetScale(n.initialScale, u34[1].initialScale)
        v3 = TweenService:Create(n.mesh, v1, {Scale = v2})
        table.insert(v5, v3)
        v4 = TweenService:Create(n.part, v1, {Transparency = 1})
        table.insert(v6, v4)
        u103 = u103 + 2
        v3.Completed:Connect(onBlastTweenCompleted)
        v4.Completed:Connect(onBlastTweenCompleted)
        v3:Play()
        v4:Play()
    end
    u379.blastMeshTweens = v5
    u379.blastPartTweens = v6
end
function settleRevealFlash() -- Line: 2527 -- upvalues: u357 (val), TweenService (val), u355 (val)
    local v1
    if u357.postImpactEnvironment then
        applyPostImpactEnvironment()
    end
    local bloom = u357.bloom
    local colorCorrection = u357.colorCorrection
    if colorCorrection then
        v1 = TweenInfo.new(0.5)
        TweenService:Create(colorCorrection, v1, {Brightness = 0}):Play()
    end
    if bloom then
        v1 = TweenInfo.new(0.7)
        TweenService:Create(bloom, v1, u355):Play()
    end
end
function playImpactFrameSequenceOnHighlight(p1, p2) -- Line: 2550 -- upvalues: u292 (val), u379 (val), u257 (val)
    local v1 = u292
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if not u379.impactFrameCancelled and u379.impactHighlight == p1 then
            p1.FillColor = u257[j.kind]
            p1.FillTransparency = 0
            p1.OutlineTransparency = 1
            applyMushroomImpactFrameColorCorrection(p2, j.kind)
            task.wait(j.duration / 3)
            continue
        end
        return false
    end
    return true
end
function playNukeRevealImpactSequence(p1, p2) -- Line: 2572 -- upvalues: u379 (val), Workspace (val), Impacts (val), u177 (val)
    local parent, pivotOffset, playShockwaves
    clearMushroomImpactFrames()
    u379.impactFrameCancelled = false
    u379.impactSequenceActive = true
    if not p2 then
        pivotOffset = CFrame.identity
    elseif p2.pivotOffset then
        pivotOffset = p2.pivotOffset
    end
    if not p2 then
        parent = Workspace
    elseif p2.parent then
        parent = p2.parent
    end
    if not p2 then
        playShockwaves = true
    elseif p2.playShockwaves == nil then
        playShockwaves = true
    else
        playShockwaves = p2.playShockwaves
    end
    local u26 = p2
    if u26 then
        u26 = p2.cameraLookAtNuke == true
    end
    local u30 = Impacts:Clone()
    u30:PivotTo(resolvePivot(p1) * pivotOffset)
    u30.Parent = parent
    u379.impactInstance = u30
    u379.impactFrameThread = task.spawn(function() -- Line: 2592 -- upvalues: u26 (val), p1 (val), u379 (upval), u30 (val), u177 (upval), parent (val), pivotOffset (val), playShockwaves (val)
        local v1
        if u26 then
            startMushroomImpactCameraLookAt(p1)
        end
        task.wait(0.2)
        if u379.impactFrameCancelled then
            restoreMushroomImpactFrameFov()
            restoreRevealCameraFov()
            easeOutRevealCameraShake()
            u379.impactFrameThread = nil
            u379.impactSequenceActive = false
            return
        end
        restoreRevealCameraFov(true)
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "NukeImpactHighlight"
        Highlight.Parent = u30
        Highlight.FillColor = Color3.new(0, 0, 0)
        Highlight.FillTransparency = 0
        Highlight.OutlineTransparency = 1
        u379.impactHighlight = Highlight
        local v2 = createMushroomImpactColorCorrection()
        u379.impactColorCorrection = v2
        startMushroomImpactFrameFov()
        local v3 = u177
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if u379.impactFrameCancelled or u379.impactHighlight ~= Highlight then
                break
            end
            v1 = u30:FindFirstChild(j)
            if v1 then
                Highlight.Adornee = v1
                playImpactFrameSequenceOnHighlight(Highlight, v2)
            end
        end
        if u379.impactHighlight == Highlight then
            Highlight.Parent = parent
            Highlight.Adornee = nil
        end
        if u379.impactInstance then
            u379.impactInstance:Destroy()
            u379.impactInstance = nil
        end
        if u379.impactFrameCancelled then
            if u379.impactHighlight == Highlight then
                Highlight:Destroy()
                u379.impactHighlight = nil
            end
            if u379.impactColorCorrection == v2 then
                v2:Destroy()
                u379.impactColorCorrection = nil
            end
            clearMushroomImpactCameraLookAt()
            restoreMushroomImpactFrameFov()
            restoreRevealCameraFov()
            easeOutRevealCameraShake()
            u379.impactFrameThread = nil
            u379.impactSequenceActive = false
            return
        elseif u379.impactHighlight == Highlight then
            v3 = spawnMushroomCloud(p1, {impactFrames = false, pivotOffset = pivotOffset, parent = parent, playShockwaves = playShockwaves})
            if v3 then
                Highlight.Adornee = v3
                Highlight.Parent = v3
                playImpactFrameSequenceOnHighlight(Highlight, v2)
            end
            if u379.impactHighlight == Highlight then
                Highlight:Destroy()
                u379.impactHighlight = nil
            end
            if u379.impactColorCorrection == v2 then
                v2:Destroy()
                u379.impactColorCorrection = nil
            end
            restoreMushroomImpactFrameFov()
            task.wait(0.3)
            if not u379.impactFrameCancelled then
                playRevealBlast(p1, pivotOffset, parent)
            end
            clearMushroomImpactCameraLookAt()
            settleRevealFlash()
            u379.impactFrameThread = nil
            u379.impactSequenceActive = false
            return
        end
    end)
end
function destroyMushroomInstance() -- Line: 2709 -- upvalues: u379 (val)
    clearAllNukeLightning()
    if not u379.impactSequenceActive then
        clearMushroomImpactFrames()
    end
    if u379.spinConnection then
        u379.spinConnection:Disconnect()
        u379.spinConnection = nil
    end
    if u379.instance then
        u379.instance:Destroy()
        u379.instance = nil
    end
end
function clearMushroomCloud() -- Line: 2731
    cancelMushroomTweenOut()
    destroyMushroomInstance()
end
function startMushroomSpin(p1) -- Line: 2741 -- upvalues: u379 (val), RunService (val)
    local v1
    cancelMeshSpinEaseOut()
    u379.spinSpeedMultiplier = 1
    local Mushroom = p1:FindFirstChild("Mushroom")
    if not Mushroom then
        return
    end
    if not u379.impactSequenceActive then
        clearMushroomCloud()
    else
        clearMushroomLightning()
        if u379.spinConnection then
            u379.spinConnection:Disconnect()
            u379.spinConnection = nil
        end
        if u379.instance then
            u379.instance:Destroy()
            u379.instance = nil
        end
    end
    prepareMushroomParts(Mushroom)
    local u88 = {}
    local u94 = p1
    for i, j in Mushroom:GetChildren() do
        if j:IsA("BasePart") and string.match(j.Name, "^Explosion") then
            if math.random() >= 0.5 then
                v1 = -1
            else
                v1 = 1
            end
            table.insert(u88, {angle = 0, part = j, initialCFrame = j.CFrame, spinSpeed = (0.02 + math.random() * 0.02) * v1})
        end
    end
    if #u88 == 0 then
        return
    end
    u379.instance = u94
    u379.spinConnection = RunService.RenderStepped:Connect(function(p1) -- Line: 2795 -- upvalues: u94 (val), u379 (upval), u88 (val)
        local v1, v2
        if not u94.Parent then
            clearMushroomCloud()
            return
        end
        local v3 = u88
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            j.angle = j.angle + p1 * j.spinSpeed * u379.spinSpeedMultiplier
            v2 = j.initialCFrame - j.initialCFrame.Position
            v1 = CFrame.new(j.initialCFrame.Position)
            j.part.CFrame = v1 * CFrame.Angles(0, j.angle, 0) * v2
        end
    end)
    startMushroomLightning(u94)
end
function spawnMushroomCloud(p1, p2) -- Line: 2821 -- upvalues: u379 (val), Workspace (val), Nuke (val)
    local parent, pivotOffset, playShockwaves
    local v1 = p2
    if v1 then
        v1 = p2.impactFrames == true
    end
    if v1 then
        playNukeRevealImpactSequence(p1, p2)
        return u379.instance
    end
    if not p2 then
        pivotOffset = CFrame.identity
    elseif p2.pivotOffset then
        pivotOffset = p2.pivotOffset
    end
    if not p2 then
        parent = Workspace
    elseif p2.parent then
        parent = p2.parent
    end
    if not p2 then
        playShockwaves = true
    elseif p2.playShockwaves == nil then
        playShockwaves = true
    else
        playShockwaves = p2.playShockwaves
    end
    local v2 = Nuke:Clone()
    v2:PivotTo(resolvePivot(p1) * pivotOffset)
    v2.Parent = parent
    startMushroomSpin(v2)
    if playShockwaves then
        playShockwaves(v2)
    end
    return v2
end
function tweenOutMushroomCloud(p1, p2, p3) -- Line: 2852 -- upvalues: u379 (val), TweenService (val)
    local instance
    if u379.instance then
        cancelMushroomTweenOut()
        if not p1 or p1 <= 0 then
            destroyMushroomInstance()
            if p2 then
                p2()
            end
            return
        end
        local v1 = p3
        if not v1 then
            v1 = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        end
        local Time = v1.Time
        clearAllNukeLightning()
        local u24 = {}
        local u25 = {}
        instance = u379.instance
        if instance and instance.Parent then
            hideMushroomShockwaves(instance)
            for i, j in instance:GetDescendants() do
                if j:IsA("BasePart") and not (isMushroomShockwavePart(j, instance)) then
                    u25[j] = j.Transparency
                    table.insert(u24, j)
                end
            end
        end
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 0
        u379.easeOutProgress = NumberValue
        u379.easeOutConnection = NumberValue.Changed:Connect(function(p1) -- Line: 2894 -- upvalues: u24 (val), u25 (val)
            local v1
            local v2 = u24
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if j.Parent then
                    v1 = u25[j]
                    j.Transparency = v1 + (1 - v1) * p1
                end
            end
        end)
        TweenService:Create(NumberValue, v1, {Value = 1}):Play()
        task.delay(Time, function() -- Line: 2905 -- upvalues: u379 (upval), NumberValue (val), p2 (val)
            if u379.easeOutProgress ~= NumberValue then
                return
            end
            destroyMushroomInstance()
            if p2 then
                p2()
            end
        end)
        return
    elseif not u379.easeOutProgress then
        if p2 then
            p2()
        end
        return
    end
end
function startRevealCameraEffects(p1) -- Line: 2922 -- upvalues: Workspace (val), u357 (val), TweenService (val), Shake (val), RunService (val)
    clearRevealCameraEffects(false)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    u357.cameraEffectsActive = true
    u357.cameraInitialFov = CurrentCamera.FieldOfView
    local v1 = getRevealFlashTweenInfo(p1)
    local v2 = {FieldOfView = 30}
    TweenService:Create(CurrentCamera, v1, v2):Play()
    local u24 = Shake.new()
    u24.FadeInTime = 0
    u24.FadeOutTime = 0
    u24.Sustain = true
    u24.Frequency = 0.11
    u24.Amplitude = 0
    u24.RotationInfluence = Vector3.zero
    u24.PositionInfluence = Vector3.zero
    u24:Start()
    u24:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2, p3) -- Line: 2947 -- upvalues: u357 (upval), u24 (val), CurrentCamera (val)
        if p3 then
            if u357.cameraShake == u24 then
                u357.cameraShake = nil
            end
            return
        end
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    u357.cameraShake = u24
    local u45 = 0
    u357.cameraProgressConnection = RunService.RenderStepped:Connect(function(a1) -- Line: 2961 -- upvalues: u45 (ref), p1 (val), u24 (val)
        u45 = u45 + a1
        local v1 = math.clamp(u45 / p1, 0, 1)
        local v2 = v1 * v1
        u24.Amplitude = v2 * 0.75
        u24.RotationInfluence = Vector3.one * (v2 * 0.05)
        u24.PositionInfluence = Vector3.one * (v2 * 0.1)
    end)
end
function clearRevealFlash() -- Line: 2976 -- upvalues: u357 (val)
    if u357.colorCorrection then
        u357.colorCorrection:Destroy()
        u357.colorCorrection = nil
    end
    if u357.bloom then
        u357.bloom:Destroy()
        u357.bloom = nil
    end
end
function cancelRevealSequence() -- Line: 2992 -- upvalues: u357 (val)
    if u357.revealThread then
        task.cancel(u357.revealThread)
        u357.revealThread = nil
    end
    cancelBlastPassFovTween()
    clearRevealCameraEffects(true)
    stopStartScreenShake()
    clearAllNukeLightning()
    u357.blastPassKnockback = nil
    u357.postImpactEnvironment = nil
    u357.damage = nil
    u357.buildupBallFlash = nil
    clearPostImpactEnvironment()
end
function captureCurrentColorCorrection() -- Line: 3013 -- upvalues: Lighting (val), u337 (val)
    local TeaseColorCorrection = Lighting:FindFirstChild("TeaseColorCorrection")
    if not TeaseColorCorrection or not (TeaseColorCorrection:IsA("ColorCorrectionEffect")) then
        return {Brightness = u337.Brightness, Contrast = u337.Contrast, Saturation = u337.Saturation, TintColor = u337.TintColor}
    end
    local v1 = {Brightness = TeaseColorCorrection.Brightness, Contrast = TeaseColorCorrection.Contrast, Saturation = TeaseColorCorrection.Saturation, TintColor = TeaseColorCorrection.TintColor}
    TeaseColorCorrection:Destroy()
    return v1
end
function startRevealFlash(p1) -- Line: 3044 -- upvalues: u353 (val), Lighting (val), u343 (val), u337 (val), u357 (val), TweenService (val), u354 (val)
    local peakBrightness, peakTintColor, v1, v2
    clearRevealFlash()
    if not p1 then
        peakBrightness = 5.5
    elseif p1.peakBrightness then
        peakBrightness = p1.peakBrightness
    end
    if not p1 then
        peakTintColor = u353
    elseif p1.peakTintColor then
        peakTintColor = p1.peakTintColor
    end
    local v3 = getFlashDuration(p1)
    local v4 = p1
    if v4 then
        v4 = p1.fromCurrentColorCorrection == true
    end
    local v5 = not v4
    if v5 then
        v5 = p1
        if v5 then
            v5 = p1.fromNeutralColorCorrection == true
        end
    end
    local BloomEffect = Instance.new("BloomEffect")
    BloomEffect.Name = "NukeRevealBloom"
    BloomEffect.Intensity = 0
    BloomEffect.Size = 0
    BloomEffect.Threshold = 0
    BloomEffect.Parent = Lighting
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "NukeRevealColorCorrection"
    if v4 then
        v2 = captureCurrentColorCorrection()
    elseif not v5 then
        v2 = u337
    else
        v2 = u343
    end
    ColorCorrectionEffect.Brightness = v2.Brightness
    ColorCorrectionEffect.Contrast = v2.Contrast
    ColorCorrectionEffect.Saturation = v2.Saturation
    ColorCorrectionEffect.TintColor = v2.TintColor
    ColorCorrectionEffect.Parent = Lighting
    u357.bloom = BloomEffect
    u357.colorCorrection = ColorCorrectionEffect
    local v6 = getRevealFlashTweenInfo(v3)
    TweenService:Create(BloomEffect, v6, u354):Play()
    if v4 then
        v1 = {Brightness = v2.Brightness + peakBrightness, Contrast = v2.Contrast, Saturation = v2.Saturation, TintColor = peakTintColor}
    elseif not v5 then
        v1 = {Brightness = peakBrightness, TintColor = peakTintColor}
    else
        v1 = {Brightness = v2.Brightness + peakBrightness, Contrast = v2.Contrast, Saturation = v2.Saturation, TintColor = peakTintColor}
    end
    local v7 = TweenService:Create(ColorCorrectionEffect, v6, v1)
    v7:Play()
    return v7
end
function revealMushroomCloud(p1, p2) -- Line: 3108 -- upvalues: u357 (val), u379 (val), Workspace (val)
    local parent, pivotOffset
    local v1 = p2
    if v1 then
        v1 = p2.impactFrames == true
    end
    local v2 = p2
    if v2 then
        v2 = p2.cameraLookAtNuke == true
    end
    if u357.cameraEffectsActive then
        holdRevealCameraShake()
        if not v1 then
            easeOutRevealCameraShake()
            if not v2 then
                restoreRevealCameraFov()
            end
        end
    end
    clearBuildup()
    if v1 then
        playNukeRevealImpactSequence(p1, p2)
        return u379.instance
    end
    local v3 = spawnMushroomCloud(p1, p2)
    settleRevealFlash()
    if not p2 then
        pivotOffset = CFrame.identity
    elseif p2.pivotOffset then
        pivotOffset = p2.pivotOffset
    end
    if not p2 then
        parent = Workspace
    elseif not p2.parent then
        parent = Workspace
    else
        parent = p2.parent
    end
    task.delay(0.3, function() -- Line: 3140 -- upvalues: p1 (val), pivotOffset (val), parent (val)
        playRevealBlast(p1, pivotOffset, parent)
    end)
    return v3
end
function playReveal(p1, p2) -- Line: 3153 -- upvalues: Tease (val), u357 (val)
    local buildup, flash, flashDelay, mushroom
    cancelRevealSequence()
    if typeof(p1) == "Instance" and p1:IsA("Model") then
        local v1
        if not p2 then
            v1 = nil
        elseif p2.preserveTeaseLighting then
            v1 = {preserveLighting = true}
        end
        Tease.stop(p1, v1)
    end
    local v2 = p2
    if v2 then
        v2 = p2.blastPassKnockback == true
    end
    u357.blastPassKnockback = v2
    v2 = p2
    if v2 then
        v2 = p2.postImpactEnvironment == true
    end
    u357.postImpactEnvironment = v2
    v2 = p2
    if v2 then
        v2 = p2.damage == true
    end
    u357.damage = v2
    v2 = p2
    if v2 then
        v2 = p2.buildupBallFlash == true
    end
    u357.buildupBallFlash = v2
    if p2 and p2.startScreenShake then
        playStartScreenShake()
    end
    if not p2 then
        buildup = nil
    else
        buildup = p2.buildup
    end
    if not p2 then
        mushroom = nil
    else
        mushroom = p2.mushroom
    end
    if not p2 then
        flash = nil
    else
        flash = p2.flash
    end
    if not p2 then
        flashDelay = getBuildupTotalDuration(buildup)
    elseif p2.flashDelay == nil then
        flashDelay = getBuildupTotalDuration(buildup)
    else
        flashDelay = p2.flashDelay
    end
    startBuildup(p1, buildup)
    u357.revealThread = task.spawn(function() -- Line: 3179 -- upvalues: flashDelay (val), flash (val), p2 (val), p1 (val), mushroom (val), u357 (upval)
        task.wait(flashDelay)
        local v1 = getFlashDuration(flash)
        local v2 = startRevealFlash(flash)
        if p2 and p2.cameraEffects then
            startRevealCameraEffects(v1)
        end
        if not p2 then
            if v2 then
                v2.Completed:Wait()
            end
        elseif p2.mushroomDelay then
            task.wait((math.max(0, p2.mushroomDelay - flashDelay)))
        elseif v2 then
            v2.Completed:Wait()
        end
        revealMushroomCloud(p1, mushroom)
        u357.revealThread = nil
    end)
    if typeof(p1) == "Instance" and p1:IsA("Model") then
        p1.Destroying:Once(function() -- Line: 3200
            cancelRevealSequence()
            clearBuildup()
            clearMushroomCloud()
            clearRevealFlash()
        end)
    end
end
local v5 = {
    startBuildup = startBuildup,
    clearBuildup = clearBuildup,
    spawnMushroomCloud = spawnMushroomCloud,
    clearMushroomCloud = clearMushroomCloud,
    tweenOutMushroomCloud = tweenOutMushroomCloud,
    cancelMushroomTweenOut = cancelMushroomTweenOut,
    startRevealFlash = startRevealFlash,
    revealMushroomCloud = revealMushroomCloud,
    clearRevealFlash = clearRevealFlash,
    playReveal = playReveal,
    getBuildupInstance = function() -- Line: 3242 -- upvalues: u378 (val)
        return u378.instance
    end,
    getMushroomInstance = function() -- Line: 3245 -- upvalues: u379 (val)
        return u379.instance
    end,
    getRevealColorCorrection = function() -- Line: 3248 -- upvalues: u357 (val)
        return u357.colorCorrection
    end,
    getRevealBloom = function() -- Line: 3251 -- upvalues: u357 (val)
        return u357.bloom
    end,
    getBuildupLightningLead = function() -- Line: 3254
        return 0.3
    end,
    getBuildupTotalDuration = getBuildupTotalDuration,
    applyPostImpactEnvironment = applyPostImpactEnvironment,
}
local v6 = {
    __call = function(p1, p2, p3) -- Line: 3260
        playReveal(p2, p3)
    end,
}
return (setmetatable(v5, v6))