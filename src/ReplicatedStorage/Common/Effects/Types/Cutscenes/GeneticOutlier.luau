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
--         File: ReplicatedStorage.Common.Effects.Types.Cutscenes.GeneticOutlier
--                               Dumped in 0.00146 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Objects = Assets:WaitForChild("Objects")
local Awakenings = Assets:WaitForChild("Particles"):WaitForChild("Awakenings")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_7:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Alive = require(Common_7:WaitForChild("Alive"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_4 = Common_8:WaitForChild("Utilities")
local State = require(Utilities_4:WaitForChild("State"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Utilities_5 = Common_9:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_12:WaitForChild("Common")
local Sounds_2 = Common_10:WaitForChild("Sounds")
local Enchantments = require(Sounds_2:WaitForChild("Enchantments"))
local u245 = {
    smoke = "smoke",
    shock = "shock",
    swirl = "swirl",
    palm = "palm",
    pressure = "pressure",
    scream = "scream",
    screamend = "screamend",
    bodyaura = "bodyaura",
}
local function playParticles(p1, p2) -- Line: 54 -- upvalues: trove (val), Awakenings (val), Particles (val)
    local u108 = trove.new()
    local v1 = Awakenings.GeneticOutlier:WaitForChild(p1):Clone()
    v1.Parent = p2
    if not (v1:IsA("Model")) then
        if not (v1:IsA("Model")) then
            v1.Position = p2.Position
            Particles.deepEmitDelayedParticles(v1)
        elseif v1.Name ~= "bodyaura" then
            v1.Position = p2.Position
            Particles.deepEmitDelayedParticles(v1)
        else
            local Parent
            local v2 = p2
            for i, j in v1:GetChildren() do
                Parent = v2.Parent
                if Parent and Parent:IsA("Model") then
                    for k, n in Parent:GetChildren() do
                        if n:IsA("BasePart") and j.Name == n.Name then
                            j.Position = n.Position
                            j.Parent = n
                            Particles.deepEmitDelayedParticles(j)
                        end
                    end
                end
            end
        end
    elseif v1.Name ~= "bodyaura" then
        for m, i5 in v1:GetChildren() do
            if i5:IsA("BasePart") then
                i5.Position = p2.Position
                Particles.deepEmitDelayedParticles(i5)
            end
        end
    end
    task.delay(12, function() -- Line: 100 -- upvalues: u108 (val)
        u108:Clean()
        u108:Destroy()
    end)
end
return function() -- Line: 106 -- upvalues: Alive (val), State (val), Objects (val), Customization (val), ReplicatedStorage (val), Character (val), Cinematics (val), useAnimatorObserver (val), Sounds (val), Enchantments (val), Signals (val), Lighting (val), Workspace (val), RunService (val), u245 (val), playParticles (val)
    local Ground
    local LocalPlayer = Alive.LocalPlayer
    local Character_2 = LocalPlayer.Character
    if not Character_2 then
        Character_2 = LocalPlayer.CharacterAdded:Wait()
    end
    local black = State("black")
    black({enabled = true, tween = TweenInfo.new(0.5)})
    local HumanoidRootPart = Character_2:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    task.wait(0.5)
    black({enabled = false, tween = TweenInfo.new(0.5)})
    local u37 = Objects:WaitForChild("Requiem_PlayerCamera"):Clone()
    u37.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame
    u37.HumanoidRootPart.Anchored = true
    u37.Parent = workspace
    Customization.decorateRigCopyingRig(u37, Character_2)
    Character_2.Parent = ReplicatedStorage
    if not (Character.isGrounded(u37)) then
        Ground = Cinematics.GeneticOutlier.Air
    else
        Ground = Cinematics.GeneticOutlier.Ground
        if not Ground then
            Ground = Cinematics.GeneticOutlier.Air
        end
    end
    local v1 = useAnimatorObserver.playAnimationOnRig(u37, Ground)
    if not v1 then
        return
    end
    Sounds.playGlobalSoundEffect(Enchantments.MightyMouseAwakening, 0.1, 2)
    v1:Play()
    Sounds.playGlobalSoundEffect(Enchantments.MightyMouseAwakening, 0.1, 2)
    Signals.Bars:Fire(0.3, 0)
    local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
    DepthOfFieldEffect.Parent = Lighting
    local CurrentCamera = Workspace.CurrentCamera
    local v2 = RunService.RenderStepped:Connect(function(p1) -- Line: 159 -- upvalues: u37 (val)
        workspace.CurrentCamera.CFrame = u37.Camera.Camera.CFrame
    end)
    local v3 = v1.KeyframeReached:Connect(function(p1) -- Line: 163 -- upvalues: u245 (upval), playParticles (upval), u37 (val)
        local v1 = u245
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if i == p1 then
                playParticles(i, u37.HumanoidRootPart)
                return
            end
        end
    end)
    task.wait(v1.Length - 1)
    black({enabled = true, tween = TweenInfo.new(0.5)})
    task.wait(0.5)
    v2:Disconnect()
    v3:Disconnect()
    Signals.Bars:Fire(0, 0)
    DepthOfFieldEffect:Destroy()
    CurrentCamera.CFrame = CurrentCamera.CFrame
    u37:Destroy()
    Character_2.Parent = workspace
    black({enabled = false, tween = TweenInfo.new(0.5)})
end