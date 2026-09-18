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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.White
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
return function(p1) -- Line: 27 -- upvalues: useMotion (val), react (val), useFieldOfView (val), Sounds (val), Universal (val), Lighting (val), TweenService (val)
    local u15, u22, u4, u8, v1, v2, v3, v4
    v1, u4 = useMotion(1)
    v2, u8 = useMotion(1)
    v3, u15 = useMotion(UDim2.fromScale(0.5, 0.3))
    v4, u22 = useMotion(UDim2.fromScale(0.5, 0.7))
    react.useEffect(function() -- Line: 34 -- upvalues: p1 (val), useFieldOfView (upval), Sounds (upval), Universal (upval), Lighting (upval), TweenService (upval), u4 (val), u8 (val), u15 (val), u22 (val)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        Sounds.playGlobalSoundEffect(Universal.EyecatcherBasic, 0.1, 0.5, 5)
        Sounds.playGlobalSoundEffect(Universal.EyecatcherWhite, 0.1, 3, 3, nil, 5)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.Parent = Lighting
        local v2 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 0, Brightness = 2, Contrast = 0}):Play()
        local u52 = v1("Basic", 50, "set", 60, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        u4:tween(0, {time = 1})
        local u62 = task.delay(1, function() -- Line: 68 -- upvalues: u8 (upval), u15 (upval), u22 (upval)
            u8:tween(0, {time = 0.5})
            u15:spring(UDim2.fromScale(0.5, 0.4))
            u22:spring(UDim2.fromScale(0.5, 0.6))
        end)
        local u66 = task.delay(6.5, function() -- Line: 75 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), u4 (upval), u15 (upval), u22 (upval), u8 (upval), u52 (val)
            local v1 = TweenInfo.new(2.5)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
            u4:tween(2.5, {time = 1})
            u15:spring(UDim2.fromScale(0.5, 0.3))
            u22:spring(UDim2.fromScale(0.5, 0.7))
            u8:tween(1, {time = 0.4})
            u52(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        return function() -- Line: 95 -- upvalues: ColorCorrectionEffect (val), u8 (upval), u4 (upval), u15 (upval), u22 (upval), u62 (val), u66 (val)
            ColorCorrectionEffect:Destroy()
            u8:immediate(1)
            u4:immediate(1)
            u15:immediate(UDim2.fromScale(0.5, 0.3))
            u22:immediate(UDim2.fromScale(0.5, 0.7))
            pcall(task.cancel, u62)
            pcall(task.cancel, u66)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    return react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }, {White = react.createElement("Frame", {
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
        Visible = p1.Visible,
    }), Container = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.25),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Text = string.upper(p1.Header),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = v2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v3,
        Size = UDim2.fromOffset(687, 45),
    }), Body = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Body,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = v2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v4,
        Size = UDim2.fromOffset(687, 70),
    })})})
end