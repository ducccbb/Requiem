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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Legendary.Heartseeker
--                              Dumped in 0.000872 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Enchantments = require(Sounds_2:WaitForChild("Enchantments"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local v2 = {}
function v2.activated() -- Line: 44 -- upvalues: Sounds (val), Enchantments (val), Lighting (val), TweenService (val), Alive (val), Assets (val), Workspace (val), Signals (val)
    local HeartseekerTest, HumanoidRootPart, ImageLabel_2, v1, v2
    Sounds.playGlobalSoundEffect(Enchantments.Heartseeker, 0.2, 1)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local v3 = TweenInfo.new(0.2)
    TweenService:Create(ColorCorrectionEffect, v3, {Brightness = -0.01, Saturation = -0.9, Contrast = -1, TintColor = Color3.fromRGB(3, 3, 3)}):Play()
    for i, j in Alive.getPlayers() do
        v2 = Alive.getAliveCharacter(j)
        if v2 and v2:FindFirstChild("HumanoidRootPart") then
            HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
            local u103 = Assets.Particles.Enchantments.Heartseeker.Heartseeker:Clone()
            u103.Parent = v2
            u103.Enabled = true
            u103.Adornee = HumanoidRootPart
            ImageLabel_2 = u103.ImageLabel
            v1 = TweenInfo.new(0.2)
            TweenService:Create(ImageLabel_2, v1, {ImageTransparency = 0}):Play()
            task.delay(9.5, function() -- Line: 71 -- upvalues: u103 (val)
                u103.Parent = nil
            end)
        end
    end
    if Workspace:FindFirstChild("HeartseekerTest") then
        HeartseekerTest = Workspace.HeartseekerTest
        local u54 = Assets.Particles.Enchantments.Heartseeker.Heartseeker:Clone()
        u54.Parent = HeartseekerTest
        u54.Enabled = true
        u54.Adornee = HeartseekerTest
        local ImageLabel = u54.ImageLabel
        v2 = TweenInfo.new(0.2)
        TweenService:Create(ImageLabel, v2, {ImageTransparency = 0}):Play()
        task.delay(9.5, function() -- Line: 89 -- upvalues: u54 (val)
            u54.Parent = nil
        end)
    end
    local v4 = {id = "Heartseeker", length = 9.5}
    Signals.Buff:Fire(v4)
    task.delay(9.5, function() -- Line: 97 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
        local v1 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        task.delay(1, function() -- Line: 105 -- upvalues: ColorCorrectionEffect (upval)
            ColorCorrectionEffect:Destroy()
        end)
    end)
end
v2.settings = {
    description = "As you close your eyes, you see the heart beats of individuals nearby.",
    drawbacks = "With every use, you grow more and more blind.",
    passive = false,
    upgradable = true,
    icon = "rbxassetid://71789464555991",
    prerequisites = {wall = "Maria", enchantments = {}},
}
return v2