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
--             File: ReplicatedStorage.Common.Effects.Types.Titans.Lightning
--                               Dumped in 0.00220 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Shifter = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Shifter")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Lightning_2 = Utilities:WaitForChild("Lightning")
local Lightning = require(Lightning_2:WaitForChild("Lightning"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u104 = {
    Default = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
    BrightFrame = {Brightness = 0.6, Contrast = 0.6, Saturation = 0.1, TintColor = Color3.fromRGB(255, 243, 69)},
    DarkenFrame = {Brightness = -0.3, Contrast = 0.3, Saturation = 0.3, TintColor = Color3.fromRGB(255, 214, 117)},
    RedBlackFrame = {Brightness = 20, Contrast = -200, Saturation = -100, TintColor = Color3.fromRGB(15, 0, 0)},
    YellowFrame = {Brightness = 20, Contrast = -9, Saturation = 20, TintColor = Color3.fromRGB(255, 216, 97)},
    YellowFrameInverse = {Brightness = 20, Contrast = 9, Saturation = -20, TintColor = Color3.fromRGB(255, 216, 97)},
    BrightWhite = {Brightness = 1, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
    Black = {Brightness = -100, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(0, 0, 0)},
    White = {Brightness = 100, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
}
local u161 = math.rad(90)
local u166 = Vector3.new(0, 1500, 0)
local function randomMultiplier() -- Line: 63
    return math.random(30, 150) / 100
end
return function(p1, p2) -- Line: 67 -- upvalues: Shifter (val), Sounds (val), Universal (val), Lightning (val), TweenService (val), u166 (val), randomMultiplier (val), RunService (val), u161 (val), u104 (val)
    local Attachment_4, X, Z, v1, v2, v3, v4, v5
    local u2 = p2 or 0
    local u6 = Shifter:Clone()
    Sounds.playGlobalSoundEffect(Universal.Shifter, 0.25, 3)
    local Attachment = Instance.new("Attachment")
    Attachment.WorldPosition = p1 + Vector3.new(0, 3000, 0)
    Attachment.Parent = workspace.Terrain
    local Attachment_2 = Instance.new("Attachment")
    Attachment_2.WorldPosition = p1
    Attachment_2.Parent = workspace.Terrain
    local Attachment_3 = Instance.new("Attachment")
    Attachment_3.WorldPosition = p1 + Vector3.new(0, 500, 0)
    Attachment_3.Parent = workspace.Terrain
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = game.Lighting
    local u46 = {}
    local u47 = {}
    local Highlight = Instance.new("Highlight")
    Highlight.Parent = workspace:WaitForChild("Bolts")
    Highlight.Adornee = workspace:WaitForChild("Bolts")
    Highlight.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight.FillTransparency = 0
    Highlight.OutlineTransparency = 1
    Highlight.Enabled = false
    local function createLightningBolt(p1, p2, p3, p4, p5, p6, p7) -- Line: 100 -- upvalues: Lightning (upval), u47 (ref)
        local v1 = Lightning.new(p1, p2, p3)
        local v2 = {}
        local v3 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
        local v4 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255))
        v2[1] = v3
        v2[2] = v4
        v2[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 213, 62))
        v1.Color = ColorSequence.new(v2)
        v1.Thickness = p4
        v1.PulseSpeed = p6
        v1.PulseLength = p7
        v1.FadeLength = 0.7
        v1.ColorOffsetSpeed = 0
        v1.MaxRadius = p5
        table.insert(u47, v1)
        return v1
    end
    local function onGotoLighting(p1, p2) -- Line: 128 -- upvalues: ColorCorrectionEffect (val), TweenService (upval)
        if p2 then
            local v1 = TweenInfo.new(p2)
            TweenService:Create(ColorCorrectionEffect, v1, p1):Play()
            return
        end
        ColorCorrectionEffect.TintColor = p1.TintColor
        ColorCorrectionEffect.Brightness = p1.Brightness
        ColorCorrectionEffect.Saturation = p1.Saturation
        ColorCorrectionEffect.Contrast = p1.Contrast
    end
    local v6 = 3
    local v7 = 1
    for i = 1, v6, v7 do
        v1 = math.rad(i / 3 * 360)
        v2 = math.random(90, 110) / 100
        X = p1.X
        v4 = math.cos(v1)
        Z = p1.Z
        v5 = math.sin(v1)
        v3 = Vector3.new(X + v4 * (15 * v2), p1.Y, Z + v5 * (15 * v2))
        Attachment_4 = Instance.new("Attachment")
        Attachment_4.WorldPosition = v3 + u166
        Attachment_4.Parent = workspace.Terrain
        u46[i] = {
            attachment = Attachment_4,
            bolt = createLightningBolt(Attachment, Attachment_4, 10, 5, 300, 5, 3),
            raiseMult = randomMultiplier(),
            expandMult = randomMultiplier(),
            spinMult = randomMultiplier(),
        }
    end
    v6 = 3
    v7 = 1
    for j = 1, v6, v7 do
        createLightningBolt(Attachment, Attachment_2, 40, 15, 120, 5, 8)
    end
    v6 = 4
    v7 = 1
    for k = 1, v6, v7 do
        createLightningBolt(Attachment, Attachment_2, 15, 3, 300, 5, 8)
    end
    v6 = 4
    v7 = 1
    for n = 1, v6, v7 do
        createLightningBolt(Attachment, Attachment_3, 10, 1, 600, 5, 6)
    end
    local u219 = 0
    local u239 = RunService.RenderStepped:Connect(function(a1) -- Line: 176 -- upvalues: u219 (ref), u46 (ref), u161 (upval), p1 (val), u166 (upval)
        local bolt, bolt_2, v1, v2, v3, v4, v5, v6
        u219 = u219 + a1
        local v7 = u46
        local v8 = nil
        local v9 = nil
        for i, j in v7, v8, v9 do
            v4 = math.rad(i / 3 * 360) + u219 * u161 * j.spinMult
            v5 = math.random(60, 110) / 100 * 300
            v6 = u219 * 2000 * j.expandMult + 15
            v2 = math.cos(v4)
            v1 = p1.X + v2 * (v6 + v5)
            v3 = math.sin(v4)
            v2 = Vector3.new(v1, p1.Y + u219 * 1000 * j.raiseMult, p1.Z + v3 * (v6 + v5))
            j.attachment.WorldPosition = v2 + u166
            bolt = j.bolt
            bolt.CurveSize0 = bolt.CurveSize0 + a1 * (i / 3 * 200)
            bolt_2 = j.bolt
            bolt_2.CurveSize1 = bolt_2.CurveSize1 - a1 * (i / 3 * -200)
        end
    end)
    task.delay(0.2, function() -- Line: 196 -- upvalues: u6 (val), p1 (val), u2 (val)
        u6.CFrame = CFrame.new(p1)
        u6.Parent = workspace
        task.wait(1.25 + u2)
        for i, j in u6:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = false
            end
        end
        task.wait(2)
        u6:Destroy()
    end)
    task.spawn(function() -- Line: 215 -- upvalues: onGotoLighting (val), u104 (upval), Highlight (val), u2 (val)
        onGotoLighting(u104.DarkenFrame, 0.5)
        task.wait(0.5)
        onGotoLighting(u104.BrightFrame, 0.1)
        task.wait(0.1)
        onGotoLighting(u104.Black)
        Highlight.Enabled = true
        task.wait(0.06)
        onGotoLighting(u104.White)
        Highlight.FillColor = Color3.fromRGB(0, 0, 0)
        task.wait(0.06)
        onGotoLighting(u104.Black)
        Highlight.FillColor = Color3.fromRGB(255, 255, 255)
        task.wait(0.06)
        Highlight.Enabled = false
        onGotoLighting(u104.YellowFrame)
        task.wait(0.06)
        onGotoLighting(u104.YellowFrameInverse)
        task.wait(0.06)
        onGotoLighting(u104.BrightWhite, 0.1)
        task.wait(0.1)
        onGotoLighting(u104.BrightFrame, 0.1)
        task.wait(0.1 + u2)
        onGotoLighting(u104.Default, 10)
    end)
    task.delay(3 + u2, function() -- Line: 259 -- upvalues: u239 (val), u46 (ref), Attachment (val), Attachment_2 (val), ColorCorrectionEffect (val), Highlight (val), u47 (ref)
        u239:Disconnect()
        local v1 = u46
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j.attachment:Destroy()
        end
        Attachment:Destroy()
        Attachment_2:Destroy()
        task.delay(15, function() -- Line: 269 -- upvalues: ColorCorrectionEffect (upval), Highlight (upval), u47 (upval), u46 (upval)
            ColorCorrectionEffect:Destroy()
            Highlight:Destroy()
            u47 = {}
            u46 = {}
        end)
    end)
end