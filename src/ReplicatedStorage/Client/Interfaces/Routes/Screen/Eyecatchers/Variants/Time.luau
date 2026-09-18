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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Time
--                               Dumped in 0.00117 seconds
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
    local u11, u15, u22, u29, u4, v1, v2, v3, v4, v5
    v1, u4 = useMotion(1)
    v2, u11 = useMotion(UDim2.fromScale(1, 0))
    v3, u15 = useMotion(1)
    v4, u22 = useMotion(UDim2.fromScale(0.5, 0.4))
    v5, u29 = useMotion(UDim2.fromScale(0.5, 0.6))
    react.useEffect(function() -- Line: 36 -- upvalues: p1 (val), useFieldOfView (upval), Sounds (upval), Universal (upval), Lighting (upval), TweenService (upval), u4 (val), u11 (val), u15 (val), u22 (val), u29 (val)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        Sounds.playGlobalSoundEffect(Universal.EyecatcherBasic, 0.1, 0.5, 5)
        Sounds.playGlobalSoundEffect(Universal.EyecatcherTime, 0.1, 3, 3, nil, 5)
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.Parent = Lighting
        local v2 = TweenInfo.new(1)
        TweenService:Create(BlurEffect, v2, {Size = 30}):Play()
        v2 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v2, {Saturation = -1, Brightness = -0.1, Contrast = 0.05}):Play()
        local u69 = v1("Basic", 50, "set", 60, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        u4:tween(0.2, {time = 1})
        v2 = UDim2.fromScale(1, 0.25)
        u11:tween(v2, {time = 1})
        local u88 = task.delay(0.3, function() -- Line: 79 -- upvalues: u15 (upval), u22 (upval), u29 (upval)
            u15:tween(0, {time = 0.5})
            local v1 = UDim2.fromScale(0.5, 0.4)
            u22:tween(v1, {time = 0.5})
            v1 = UDim2.fromScale(0.5, 0.6)
            u29:tween(v1, {time = 0.5})
        end)
        local u92 = task.delay(4, function() -- Line: 86 -- upvalues: TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u4 (upval), u11 (upval), u22 (upval), u29 (upval), u15 (upval), u69 (val)
            local v1 = TweenInfo.new(2.5)
            TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
            v1 = TweenInfo.new(2.5)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
            u4:tween(2.5, {time = 1})
            local v2 = UDim2.fromScale(1, 0)
            u11:tween(v2, {time = 1})
            v2 = UDim2.fromScale(0.5, 0.4)
            u22:tween(v2, {time = 0.5})
            v2 = UDim2.fromScale(0.5, 0.6)
            u29:tween(v2, {time = 0.5})
            u15:tween(1, {time = 0.4})
            u69(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        return function() -- Line: 108 -- upvalues: BlurEffect (val), ColorCorrectionEffect (val), u15 (upval), u4 (upval), u22 (upval), u29 (upval), u88 (val), u92 (val)
            BlurEffect:Destroy()
            ColorCorrectionEffect:Destroy()
            u15:immediate(1)
            u4:immediate(1)
            u22:immediate(UDim2.fromScale(0.5, 0.4))
            u29:immediate(UDim2.fromScale(0.5, 0.6))
            pcall(task.cancel, u88)
            pcall(task.cancel, u92)
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
    }, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
        Visible = p1.Visible,
    }), Container = react.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = string.upper(p1.Header),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v4,
        Size = UDim2.fromOffset(687, 56),
    }), Body = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        Text = p1.Body,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v5,
        Size = UDim2.fromOffset(687, 28),
    })})})
end