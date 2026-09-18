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
--             File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Outro
--                               Dumped in 0.00199 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
return function(p1) -- Line: 49 -- upvalues: TweenService (val), Particles (val), Signals (val), Lighting (val), ReplicatedStorage (val), useAnimatorObserver (val), Cinematics (val)
    local u3, v1
    v1, u3 = (function() -- Line: 51
        local Requiem_CreateCharacter_Ymir = workspace:WaitForChild("Requiem_CreateCharacter_Ymir")
        return Requiem_CreateCharacter_Ymir, workspace:WaitForChild("Requiem_CreateCharacter_Player")
    end)()
    local CustomizationModel = workspace:WaitForChild("CustomizationModel")
    local v2 = TweenInfo.new(1)
    TweenService:Create(CustomizationModel.Audio.Cutscene2, v2, {Volume = 0}):Play()
    task.delay(1, function() -- Line: 58 -- upvalues: CustomizationModel (val)
        CustomizationModel.Audio.Cutscene2:Stop()
    end)
    CustomizationModel.Audio.Cutscene3.Volume = 0
    CustomizationModel.Audio.Cutscene3:Play()
    v2 = TweenInfo.new(1)
    TweenService:Create(CustomizationModel.Audio.Cutscene3, v2, {Volume = 2}):Play()
    local Dimension = workspace:WaitForChild("Dimension")
    Particles.deepDisableParticles(Dimension)
    Signals.Bars:Fire(0.3, -2)
    local Sphere = workspace:WaitForChild("Sphere")
    Lighting:WaitForChild("CUTSCENE_DEPTH_OF_FIELD"):Destroy()
    local Fog = workspace:WaitForChild("Fog")
    Fog.Transparency = 0
    local WaterStep = workspace:WaitForChild("WaterStep")
    local WaterExplosion = workspace:WaitForChild("WaterExplosion")
    local CUTSCENE_BLUR_1 = Lighting:WaitForChild("CUTSCENE_BLUR_1")
    CUTSCENE_BLUR_1.Size = 5
    Lighting:WaitForChild("CUTSCENE_BLUR_2"):Destroy()
    local Tree = ReplicatedStorage:WaitForChild("Tree")
    local Visuals = ReplicatedStorage:WaitForChild("Visuals")
    local Infinite = ReplicatedStorage:WaitForChild("Infinite")
    local Sand = workspace:WaitForChild("Sand")
    local Back = workspace:WaitForChild("Back")
    local CUTSCENE_COLOR_CORRECTION = Lighting:WaitForChild("CUTSCENE_COLOR_CORRECTION")
    local WORLD_DARK = Lighting:WaitForChild("WORLD_DARK")
    WORLD_DARK.Brightness = 0
    v1.Parent = nil
    local Requiem_CreateCharacter_Ymir_Dust = workspace:WaitForChild("Requiem_CreateCharacter_Ymir_Dust")
    Requiem_CreateCharacter_Ymir_Dust.Parent = nil
    useAnimatorObserver.onStopRigAnimations(u3)
    local v3 = useAnimatorObserver.playAnimationOnRig(u3, Cinematics.CreateCharacterOutroAnimation)
    local v4 = TweenInfo.new(11)
    TweenService:Create(CUTSCENE_COLOR_CORRECTION, v4, {Brightness = 0.2}):Play()
    v3.KeyframeReached:Connect(function(a1) -- Line: 121 -- upvalues: u3 (val), Particles (upval), WaterStep (val), WaterExplosion (val), CustomizationModel (val), TweenService (upval), CUTSCENE_COLOR_CORRECTION (val), Lighting (upval), Sphere (val), Tree (val), Visuals (val), Infinite (val), CUTSCENE_BLUR_1 (val), Fog (val), WORLD_DARK (val), Sand (val), Back (val), p1 (val)
        local v1
        if a1 == "stopbubbles" then
            for i, j in u3:GetDescendants() do
                if j:IsA("ParticleEmitter") and j.Name == "Water" then
                    j.Enabled = false
                end
            end
            return
        end
        if a1 == "stepforward" then
            Particles.deepEmitParticles(WaterStep)
            return
        end
        if a1 == "dimensionparticle" then
            Particles.deepEmitParticles(WaterExplosion)
            CustomizationModel.Audio.WindRiser:Play()
            return
        end
        if a1 == "dimensionexplode" then
            task.wait(0.1)
            local v2 = TweenInfo.new(0.2)
            TweenService:Create(CUTSCENE_COLOR_CORRECTION, v2, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
            local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Parent = Lighting
            v1 = TweenInfo.new(0.2)
            TweenService:Create(Sphere, v1, {Transparency = 0}):Play()
            task.delay(0.1, function() -- Line: 150 -- upvalues: ColorCorrectionEffect (val), TweenService (upval)
                ColorCorrectionEffect.Saturation = -1
                task.wait(0.1)
                ColorCorrectionEffect.Saturation = 2
                task.wait(0.1)
                ColorCorrectionEffect.Saturation = -3
                task.wait(0.1)
                ColorCorrectionEffect.Saturation = 0
                task.wait(0.1)
                ColorCorrectionEffect.Saturation = -1
                local v1 = TweenInfo.new(2)
                TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0}):Play()
                task.wait(2)
                ColorCorrectionEffect:Destroy()
            end)
            return
        end
        if a1 == "pathreturn" then
            local v3 = Lighting:FindFirstAncestorWhichIsA("Atmosphere")
            Tree.Parent = workspace
            Visuals.Parent = workspace
            Infinite.Parent = workspace
            task.wait(0.1)
            v1 = TweenInfo.new(0.25)
            TweenService:Create(v3, v1, {
                Density = 0.285,
                Offset = 0.25,
                Glare = 0.215,
                Haze = 2.025,
                Color = Color3.fromRGB(255, 255, 255),
            }):Play()
            v1 = TweenInfo.new(0.25)
            TweenService:Create(CUTSCENE_BLUR_1, v1, {Size = 0}):Play()
            v1 = TweenInfo.new(0.5)
            TweenService:Create(Fog, v1, {Transparency = 1}):Play()
            v1 = TweenInfo.new(0.5)
            TweenService:Create(WORLD_DARK, v1, {Brightness = -0.1}):Play()
            v1 = TweenInfo.new(0.5)
            TweenService:Create(Sphere, v1, {Transparency = 1}):Play()
            v1 = TweenInfo.new(0.4)
            TweenService:Create(Sand, v1, {Transparency = 0}):Play()
            v1 = TweenInfo.new(0.35)
            TweenService:Create(Back, v1, {Transparency = 0}):Play()
            task.wait(4)
            v1 = TweenInfo.new(1)
            TweenService:Create(CustomizationModel.Audio.Cutscene3, v1, {Volume = 0}):Play()
            task.delay(1, function() -- Line: 220 -- upvalues: CustomizationModel (upval)
                CustomizationModel.Audio.Cutscene3:Stop()
            end)
            p1()
        end
    end)
end