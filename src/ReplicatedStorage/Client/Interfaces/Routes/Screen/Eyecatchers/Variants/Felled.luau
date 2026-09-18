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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Felled
--                               Dumped in 0.00164 seconds
--                          Bytecode version 9  |  7 functions

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
local u121 = Color3.fromRGB(255, 255, 255)
local u126 = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u130 = UDim2.fromOffset(720, 64)
return function(p1) -- Line: 35 -- upvalues: useMotion (val), react (val), useFieldOfView (val), Sounds (val), Universal (val), Lighting (val), TweenService (val), u126 (val), u121 (val), u130 (val)
    local u11, u18, u22, u26, u4, v1, v2, v3, v4, v5
    v1, u4 = useMotion(1)
    v2, u11 = useMotion(UDim2.fromScale(0.5, 0.5))
    v3, u18 = useMotion(UDim2.fromScale(0.5, 0.5))
    v4, u22 = useMotion(1)
    v5, u26 = useMotion(1)
    react.useEffect(function() -- Line: 44 -- upvalues: p1 (val), useFieldOfView (upval), Sounds (upval), Universal (upval), Lighting (upval), u4 (val), u11 (val), u18 (val), u22 (val), TweenService (upval), u26 (val)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        Sounds.playGlobalSoundEffect(Universal.EyecatcherFelled, 0.1, 1.5, 5)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.Parent = Lighting
        local u30 = v1("Basic", 50, "set", 58, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        u4:tween(0.2, {time = 0.4})
        local v2 = UDim2.fromScale(0.45, 0.5)
        u11:tween(v2, {time = 5.35})
        v2 = UDim2.fromScale(0.55, 0.5)
        u18:tween(v2, {time = 5.35})
        u22:tween(0.45, {time = 0.45})
        local u64 = task.delay(0.45, function() -- Line: 72 -- upvalues: u22 (upval)
            u22:tween(1, {time = 4.8999999999999995})
        end)
        local v3 = TweenInfo.new(0.5)
        TweenService:Create(ColorCorrectionEffect, v3, {Saturation = -0.35, Brightness = -0.12, Contrast = 0.06}):Play()
        local u80 = task.delay(0.15, function() -- Line: 82 -- upvalues: u26 (upval)
            u26:tween(0, {time = 0.5})
        end)
        local u84 = task.delay(5.5, function() -- Line: 86 -- upvalues: u11 (upval), u18 (upval), u26 (upval), u22 (upval), TweenService (upval), ColorCorrectionEffect (val), u4 (upval), u30 (val)
            local v1 = UDim2.fromScale(0.5, 0.5)
            u11:tween(v1, {time = 0.8})
            v1 = UDim2.fromScale(0.5, 0.5)
            u18:tween(v1, {time = 0.8})
            u26:tween(1, {time = 0.35})
            u22:tween(1, {time = 0.35})
            local v2 = TweenInfo.new(1.5)
            TweenService:Create(ColorCorrectionEffect, v2, {Saturation = 0, Brightness = 0, Contrast = 0}):Play()
            u4:tween(1, {time = 0.6})
            u30(TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        return function() -- Line: 103 -- upvalues: ColorCorrectionEffect (val), u4 (upval), u11 (upval), u18 (upval), u22 (upval), u26 (upval), u80 (val), u64 (val), u84 (val)
            ColorCorrectionEffect:Destroy()
            u4:immediate(1)
            u11:immediate(UDim2.fromScale(0.5, 0.5))
            u18:immediate(UDim2.fromScale(0.5, 0.5))
            u22:immediate(1)
            u26:immediate(1)
            pcall(task.cancel, u80)
            pcall(task.cancel, u64)
            pcall(task.cancel, u84)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    local v6 = string.upper(p1.Header)
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }, {Band = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.15, 0.22),
    }), GhostLeft = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = false,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = u126,
        Text = v6,
        TextColor3 = u121,
        TextTransparency = v4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2,
        Size = u130,
    }), GhostRight = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = false,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = u126,
        Text = v6,
        TextColor3 = u121,
        TextTransparency = v4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v3,
        Size = u130,
    }), Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = false,
        BackgroundTransparency = 1,
        ZIndex = 3,
        FontFace = u126,
        Text = v6,
        TextColor3 = u121,
        TextTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u130,
    })})
end