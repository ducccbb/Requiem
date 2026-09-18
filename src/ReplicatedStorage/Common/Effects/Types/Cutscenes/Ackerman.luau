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
--            File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Ackerman
--                              Dumped in 0.000870 seconds
--                          Bytecode version 9  |  4 functions

local u101
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Sounds_2 = Common:WaitForChild("Sounds")
local Enchantments = require(Sounds_2:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
_, u101 = require(Statistics:WaitForChild("useFieldOfView"))()
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_2:WaitForChild("useNumberEasing"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_3 = Common_6:WaitForChild("Sounds")
local Titans = require(Sounds_3:WaitForChild("Titans"))
return function(p1) -- Line: 34 -- upvalues: Signals (val), Sounds (val), Enchantments (val), u101 (val), useNumberEasing (val), Titans (val), Lighting (val), TweenService (val), RunService (val)
    local u44, v1, v2
    local Character = p1.Character
    if not Character then
        Character = p1.CharacterAdded:Wait()
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    Signals.Bars:Fire(0.3, 0)
    Sounds.playGlobalSoundEffect(Enchantments.AckermanAwakening, 1, 5, 30)
    task.wait(0.1)
    local CurrentCamera = workspace.CurrentCamera
    local v3 = u101("berserk", 50, "set", 100, TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    u44, v1, v2 = useNumberEasing(0)
    v1(30, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    task.delay(1.3, function() -- Line: 58 -- upvalues: Sounds (upval), Titans (upval), HumanoidRootPart (val), Lighting (upval), Character (val), TweenService (upval)
        Sounds.playFalloffSoundEffect(Titans.BerserkDowner, HumanoidRootPart, 15000, 3)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Brightness = -3
        ColorCorrectionEffect.Parent = Lighting
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 0
        Highlight.OutlineTransparency = 1
        Highlight.FillColor = Color3.fromRGB(255, 255, 255)
        Highlight.Adornee = Character
        Highlight.Parent = Character
        task.wait(0.2)
        Highlight.FillColor = Color3.fromRGB(0, 0, 0)
        ColorCorrectionEffect.Brightness = 3
        task.wait(0.1)
        Highlight.FillColor = Color3.fromRGB(255, 255, 255)
        ColorCorrectionEffect.Brightness = -3
        task.wait(0.1)
        local v1 = TweenInfo.new(0.1)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0}):Play()
        v1 = TweenInfo.new(0.1)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.wait(0.1)
        ColorCorrectionEffect:Destroy()
        Highlight:Destroy()
    end)
    local v4 = RunService.RenderStepped:Connect(function(p1) -- Line: 102 -- upvalues: HumanoidRootPart (val), CurrentCamera (val), u44 (val)
        local v1 = CFrame.new(CurrentCamera.CFrame.Position, HumanoidRootPart.CFrame.Position)
        local v2 = CurrentCamera.CFrame:Lerp(v1, u44() * p1)
        CurrentCamera.CFrame = v2 * CFrame.Angles(0, 0, (math.rad(0)))
    end)
    task.wait(7)
    v4:Disconnect()
    v2()
    v3(TweenInfo.new(1))
    Signals.Bars:Fire(0, 0)
end