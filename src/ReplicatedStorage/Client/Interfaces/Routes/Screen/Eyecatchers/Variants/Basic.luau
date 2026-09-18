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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Basic
--                               Dumped in 0.00139 seconds
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
    local u11, u15, u19, u26, u33, u4, v1, v2, v3, v4, v5, v6
    v1, u4 = useMotion(1)
    v3, u11 = useMotion(UDim2.fromScale(0.512, 0.45))
    v4, u15 = useMotion(1)
    v5, u19 = useMotion(1)
    v6, u26 = useMotion(UDim2.fromScale(0.472, 0.45))
    v2, u33 = useMotion(UDim2.fromScale(0.474, 0.61))
    react.useEffect(function() -- Line: 35 -- upvalues: p1 (val), useFieldOfView (upval), Sounds (upval), Universal (upval), Lighting (upval), u11 (val), u15 (val), TweenService (upval), u4 (val), u19 (val), u26 (val), u33 (val)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        Sounds.playGlobalSoundEffect(Universal.EyecatcherBasic, 0.1, 3, 5)
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.Parent = Lighting
        local v2 = UDim2.fromScale(0.512, 0.5)
        u11:tween(v2, {time = 0.5})
        u15:tween(0, {time = 0.4})
        local v3 = TweenInfo.new(1)
        TweenService:Create(BlurEffect, v3, {Size = 30}):Play()
        v3 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v3, {Saturation = -1, Brightness = -0.3, Contrast = 0.1}):Play()
        local u74 = v1("Basic", 50, "set", 60, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        u4:tween(0.2, {time = 1})
        local u84 = task.delay(0.5, function() -- Line: 79 -- upvalues: u19 (upval), u26 (upval), u33 (upval)
            u19:tween(0, {time = 0.5})
            local v1 = UDim2.fromScale(0.472, 0.496)
            u26:tween(v1, {time = 0.5})
            v1 = UDim2.fromScale(0.474, 0.569)
            u33:tween(v1, {time = 0.5})
        end)
        local u88 = task.delay(5, function() -- Line: 86 -- upvalues: u19 (upval), u15 (upval), u11 (upval), u26 (upval), u33 (upval), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u4 (upval), u74 (val)
            u19:tween(1, {time = 1})
            u15:tween(1, {time = 1})
            local v1 = UDim2.fromScale(0.512, 0.45)
            u11:tween(v1, {time = 1})
            v1 = UDim2.fromScale(0.472, 0.45)
            u26:tween(v1, {time = 1})
            v1 = UDim2.fromScale(0.474, 0.61)
            u33:tween(v1, {time = 1})
            local v2 = TweenInfo.new(2.5)
            TweenService:Create(BlurEffect, v2, {Size = 0}):Play()
            v2 = TweenInfo.new(2.5)
            TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
            u4:tween(2.5, {time = 1})
            u74(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        return function() -- Line: 108 -- upvalues: BlurEffect (val), ColorCorrectionEffect (val), u11 (upval), u15 (upval), u19 (upval), u4 (upval), u26 (upval), u33 (upval), u84 (val), u88 (val)
            BlurEffect:Destroy()
            ColorCorrectionEffect:Destroy()
            u11:immediate(UDim2.fromScale(0.512, 0.45))
            u15:immediate(1)
            u19:immediate(1)
            u4:immediate(1)
            u26:immediate(UDim2.fromScale(0.472, 0.45))
            u33:immediate(UDim2.fromScale(0.474, 0.61))
            pcall(task.cancel, u84)
            pcall(task.cancel, u88)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    local v7 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }
    local v8 = {Vignette = react.createElement("ImageLabel", {
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
    })}
    local v9 = {
        Image = "rbxassetid://126610563956068",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v4,
        ResampleMode = Enum.ResamplerMode.Pixelated,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v3,
        Size = UDim2.fromScale(0.437, 0.334),
    }
    local v10 = {Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = string.upper(p1.Header),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v6,
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
        TextTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
        Size = UDim2.fromOffset(687, 28),
    })}
    local v11 = {Rotation = 90}
    local v12 = {}
    local v13 = NumberSequenceKeypoint.new(0, 0)
    v12[1] = v13
    v12[2] = NumberSequenceKeypoint.new(1, 0.327)
    v11.Transparency = NumberSequence.new(v12)
    v10.Gradient = react.createElement("UIGradient", v11)
    v8.Splash = react.createElement("ImageLabel", v9, v10)
    return react.createElement("Frame", v7, v8)
end