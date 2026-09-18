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
--             File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Intro
--                               Dumped in 0.00320 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Customization_2 = Common_4:WaitForChild("Customization")
local Mouths = require(Customization_2:WaitForChild("Mouths"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
return function(p1, p2, p3) -- Line: 53 -- upvalues: Workspace (val), Mouths (val), ContentProvider (val), TweenService (val), Lighting (val), useAnimatorObserver (val), Cinematics (val), Customization (val), Particles (val), ReplicatedStorage (val), Signals (val), RunService (val), Players (val)
    local u10, u6, u7, u8, u9
    local CurrentCamera = Workspace.CurrentCamera
    u6, u7, u8, u9, u10 = (function() -- Line: 61
        local Requiem_CreateCharacter_Ymir = workspace:WaitForChild("Requiem_CreateCharacter_Ymir")
        local Requiem_CreateCharacter_Player = workspace:WaitForChild("Requiem_CreateCharacter_Player")
        local YmirFlashStep = workspace:WaitForChild("YmirFlashStep")
        local Draging = workspace:WaitForChild("Draging")
        return Requiem_CreateCharacter_Ymir, Requiem_CreateCharacter_Player, YmirFlashStep, Draging, workspace:WaitForChild("Dimension")
    end)()
    local function onSetYmirTransparency(p1) -- Line: 88 -- upvalues: u6 (val)
        local v1 = p1
        for i, j in u6:GetDescendants() do
            if j.Name ~= "HumanoidRootPart" and j.Name ~= "FacePanel" then
                if j:IsA("BasePart") then
                    j.Transparency = v1
                elseif not (j:IsA("Decal")) then
                end
            end
        end
    end
    local Piano = p1.Audio.Piano
    local v1 = TweenInfo.new(0.5)
    TweenService:Create(Piano, v1, {Volume = 0}):Play()
    local Rain = p1.Audio.Rain
    v1 = TweenInfo.new(0.5)
    TweenService:Create(Rain, v1, {Volume = 0}):Play()
    task.delay(0.5, function() -- Line: 103 -- upvalues: p1 (val)
        p1.Audio.Piano:Stop()
        p1.Audio.Rain:Stop()
    end)
    p1.Audio.Cutscene1:Play()
    ;(function() -- Line: 70 -- upvalues: Mouths (upval), p1 (val), ContentProvider (upval)
        local Decal
        local v1 = {}
        local Vocabulary = Mouths.Vocabulary
        local v2 = nil
        local v3 = nil
        for i, j in Vocabulary, v2, v3 do
            Decal = Instance.new("Decal")
            Decal.Texture = j
            table.insert(v1, Decal)
        end
        table.insert(v1, p1.Audio.Cutscene1)
        table.insert(v1, p1.Audio.Speak)
        table.insert(v1, p1.Audio.Splash)
        table.insert(v1, p1.Audio.Knockback)
        ContentProvider:PreloadAsync(v1)
    end)()
    local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
    DepthOfFieldEffect.FarIntensity = 1
    DepthOfFieldEffect.FocusDistance = 0
    DepthOfFieldEffect.InFocusRadius = 46.9
    DepthOfFieldEffect.NearIntensity = 0
    DepthOfFieldEffect.Parent = Lighting
    DepthOfFieldEffect.Name = "CUTSCENE_DEPTH_OF_FIELD"
    task.delay(2, function() -- Line: 120 -- upvalues: p2 (val), TweenService (upval), DepthOfFieldEffect (val)
        p2({enabled = false, tween = TweenInfo.new(1)})
        task.wait(2)
        local v1 = TweenInfo.new(3)
        TweenService:Create(DepthOfFieldEffect, v1, {FarIntensity = 0}):Play()
    end)
    local v2 = useAnimatorObserver.playAnimationOnRig(u6, Cinematics.CreateCharacterYmirAnimation)
    local u74 = useAnimatorObserver.playAnimationOnRig(u7, Cinematics.CreateCharacterPlayerAnimation)
    Customization.decorateRigCopyingRig(u7, p1.Character)
    v2:Play()
    u74:Play()
    u74.KeyframeReached:Connect(function(a1) -- Line: 139 -- upvalues: DepthOfFieldEffect (val), CurrentCamera (val), p1 (val), u6 (val), Mouths (upval), onSetYmirTransparency (val), TweenService (upval), Particles (upval), u8 (val), u9 (val), u7 (val), Lighting (upval), u10 (val), ReplicatedStorage (upval), useAnimatorObserver (upval), Cinematics (upval), u74 (val), Signals (upval), p3 (val)
        local v1, v2, v3, v4, v5, v6
        if a1 == "DOF-on" then
            DepthOfFieldEffect.FarIntensity = 1
            return
        end
        if a1 == "DOF-off" then
            DepthOfFieldEffect.FarIntensity = 0
            return
        end
        if a1 == "FOV-on" then
            CurrentCamera.FieldOfView = 20
            return
        end
        if a1 == "FOV-off" then
            CurrentCamera.FieldOfView = 70
            return
        end
        if a1 == "speak" then
            local a
            p1.Audio.Speak:Play()
            task.delay(1.2, function() -- Line: 151 -- upvalues: p1 (upval)
                p1.Audio.WindRiser:Play()
            end)
            task.delay(2.2, function() -- Line: 155 -- upvalues: p1 (upval)
                p1.Audio.ReverseWindRiser:Play()
            end)
            local Texture = u6.FacePanel.Mouth.Texture
            local v7 = 12
            v3 = 1
            for m = 1, v7, v3 do
                v4 = ("You got this"):sub(m, m)
                a = Mouths.Vocabulary[string.lower(v4)]
                if not a then
                    a = Mouths.Vocabulary.a
                end
                u6.FacePanel.Mouth.Texture = a
                task.wait(0.08)
            end
            task.wait(0.1)
            u6.FacePanel.Mouth.Texture = Texture
            return
        end
        if a1 == "dustAway" then
            local v8
            v1 = u6:Clone()
            v1.Name = "Requiem_CreateCharacter_Ymir_Dust"
            onSetYmirTransparency(1)
            for k, n in v1:GetDescendants() do
                if n:IsA("BasePart") then
                    n.Anchored = true
                    v5 = n:FindFirstAncestorWhichIsA("Model")
                    v6 = v5
                    if v6 then
                        v6 = v5:GetAttribute("CustomizationAccessory") == true
                    end
                    if not (n.Parent:IsA("Accessory")) and not v6 and n.Name ~= "FacePanel" then
                        n.CFrame = u6:FindFirstChild(n.Name).CFrame
                    end
                    v8 = TweenInfo.new(0.1)
                    TweenService:Create(n, v8, {Transparency = 1, CFrame = n.CFrame + Vector3.new(2, 1, -1)}):Play()
                elseif n:IsA("Decal") then
                    v2 = TweenInfo.new(0.1)
                    TweenService:Create(n, v2, {Transparency = 1}):Play()
                end
            end
            v1.Parent = workspace
            task.delay(0.5, function() -- Line: 204 -- upvalues: onSetYmirTransparency (upval)
                onSetYmirTransparency(0)
            end)
            return
        end
        if a1 == "flashstep" then
            Particles.deepEmitParticles(u8)
            return
        end
        if a1 == "flashstepsfx" then
            p1.Audio.Flashstep:Play()
            return
        end
        if a1 == "slide" then
            p1.Audio.Knockback:Play()
            task.wait(0.185)
            u9.SlideWind.Enabled = true
            local v9 = TweenInfo.new(5.22, Enum.EasingStyle.Linear)
            TweenService:Create(u9, v9, {Position = Vector3.new(-453.255, 16.194, -377.587)}):Play()
            task.delay(5.1, function() -- Line: 221 -- upvalues: u9 (upval)
                u9.SlideWind.Enabled = false
            end)
            return
        end
        if a1 == "glassemit" then
            u7["Left Arm"].Specs.Enabled = true
            u7["Right Arm"].Specs.Enabled = true
            u7.Head.Specs.Enabled = true
            return
        end
        if a1 == "dimensionfade" then
            local Specs = u7["Left Arm"].Specs
            Specs.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            local Specs_2 = u7["Right Arm"].Specs
            Specs_2.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            local Specs_3 = u7.Head.Specs
            Specs_3.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Parent = Lighting
            task.delay(0.1, function() -- Line: 236 -- upvalues: ColorCorrectionEffect (val), TweenService (upval)
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
            Particles.deepEnableParticles(u10)
            local Transition = workspace:WaitForChild("Transition")
            local Sand = workspace:WaitForChild("Sand")
            local Back = workspace:WaitForChild("Back")
            v6 = TweenInfo.new(0.3)
            TweenService:Create(Transition, v6, {Transparency = 0}):Play()
            v6 = TweenInfo.new(0.5)
            TweenService:Create(Sand, v6, {Transparency = 1}):Play()
            v6 = TweenInfo.new(0.5)
            TweenService:Create(Back, v6, {Transparency = 1}):Play()
            return
        end
        if a1 ~= "dimensionswtich" then
            if a1 == "talktoai" then
                v1 = useAnimatorObserver.playAnimationOnRig(u7, Cinematics.CreateCharacterSpeakingAI, 0.75)
                v1:Play(0.75)
                u74:Stop(0.75)
                p1.Audio.Cutscene2:Play()
                p1.Audio.Cutscene2.Volume = 0
                v4 = TweenInfo.new(5)
                TweenService:Create(p1.Audio.Cutscene1, v4, {Volume = 0}):Play()
                v4 = TweenInfo.new(30, Enum.EasingStyle.Linear)
                TweenService:Create(p1.Audio.Cutscene2, v4, {Volume = 1}):Play()
                task.delay(5, function() -- Line: 349 -- upvalues: p1 (upval)
                    p1.Audio.Cutscene1:Stop()
                end)
                task.wait(1)
                Signals.Bars:Fire(0, 0)
                p3()
            end
            return
        end
        local Tree = workspace:WaitForChild("Tree")
        Tree.Parent = ReplicatedStorage
        local Visuals = workspace:WaitForChild("Visuals")
        Visuals.Parent = ReplicatedStorage
        local Infinite = workspace:WaitForChild("Infinite")
        Infinite.Parent = ReplicatedStorage
        local Transition_2 = workspace:WaitForChild("Transition")
        v6 = TweenInfo.new(0.2)
        TweenService:Create(Transition_2, v6, {Transparency = 1}):Play()
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        BlurEffect.Name = "CUTSCENE_BLUR_1"
        local ColorCorrectionEffect_2 = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect_2.Parent = Lighting
        ColorCorrectionEffect_2.Name = "CUTSCENE_COLOR_CORRECTION"
        v2 = TweenInfo.new(0.3)
        TweenService:Create(DepthOfFieldEffect, v2, {FarIntensity = 1}):Play()
        v5 = Lighting:FindFirstAncestorWhichIsA("Atmosphere")
        local v10 = TweenInfo.new(0.2)
        TweenService:Create(v5, v10, {Offset = 0, Density = 0.48, Glare = 0}):Play()
        v10 = TweenInfo.new(0.2)
        TweenService:Create(BlurEffect, v10, {Size = 40}):Play()
        v10 = TweenInfo.new(0.3)
        TweenService:Create(ColorCorrectionEffect_2, v10, {Saturation = -0.5, Brightness = -0.1, Contrast = 0.3, TintColor = Color3.fromRGB(120, 167, 255)}):Play()
        v10 = TweenInfo.new(5)
        TweenService:Create(BlurEffect, v10, {Size = 0}):Play()
        u7["Left Arm"].Specs.Enabled = false
        u7["Right Arm"].Specs.Enabled = false
        u7.Head.Specs.Enabled = false
        task.delay(0.2, function() -- Line: 327 -- upvalues: p1 (upval)
            p1.Audio.Splash:Play()
        end)
        for i, j in u7:GetDescendants() do
            if j:IsA("ParticleEmitter") and j.Name == "Water" then
                j.Enabled = true
            end
        end
    end)
    local u91 = nil
end