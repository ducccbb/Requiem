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
--   File: ReplicatedStorage.Client.Interfaces.Components.Screen.Alert.AlertPopupPage
--                               Dumped in 0.00220 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Inputs = v1.Parent.Parent.Parent:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Providers = v1.Parent.Parent.Parent.Parent:WaitForChild("Providers")
local AlertPopupProvider = require(Providers:WaitForChild("AlertPopupProvider"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useSignal = require(Hooks_3:WaitForChild("useSignal"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local function lerp(p1, p2, p3) -- Line: 31
    return p1 + (p2 - p1) * p3
end
return function() -- Line: 37 -- upvalues: react (val), useSignal (val), AlertPopupProvider (val), useMotion (val), useTextScale (val), useConstants (val), lerp (val), Color (val), Button (val)
    local u13, u14, u19, u24, u3, u34, u38, u4, u9, v1, v2, v3, v4, v5
    u3, u4 = react.useState(false)
    v3, u9 = react.useState(nil)
    u13, u14 = react.useState({})
    v4, u19 = react.useState("No Header")
    v5, u24 = react.useState("No Body")
    useSignal(function(p1, p2, p3, p4) -- Line: 46 -- upvalues: u4 (val), u9 (val), u19 (val), u24 (val), u14 (val)
        u4(true)
        u9(p4)
        u19(p1)
        u24(p2)
        u14({current = p3})
    end, {AlertPopupProvider.Signal})
    v1, u34 = useMotion(0.95)
    v2, u38 = useMotion(1)
    local v6 = useTextScale()
    local v7 = useConstants()
    react.useEffect(function() -- Line: 62 -- upvalues: u3 (val), u34 (val), u38 (val)
        if u3 then
            u34:spring(1, {frequency = 0.2})
            u38:spring(0, {frequency = 0.4})
            return
        end
        u34:spring(0.95, {frequency = 0.2})
        u38:spring(1, {frequency = 0.4})
    end, {u3})
    local v8 = {
        BorderSizePixel = 0,
        ZIndex = 200,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v2:map(function(p1) -- Line: 75 -- upvalues: lerp (upval)
            return lerp(0.3, 1, p1)
        end),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v1:map(function(p1) -- Line: 83
            local v1 = 0.95 < p1
            return v1
        end),
    }
    local v9 = {}
    local v10 = {Image = "rbxassetid://17812826389", BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 0}
    local v11 = v3
    if not v11 then
        v11 = Color3.fromRGB(255, 255, 255)
    end
    v10.ImageColor3 = Color.Darken(v11, 0.3)
    v10.ImageTransparency = v2:map(function(p1) -- Line: 90 -- upvalues: lerp (upval)
        return lerp(0.56, 1, p1)
    end)
    v10.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v10.Position = UDim2.fromScale(0.5, 0.5)
    v10.Size = UDim2.fromScale(1.5, 1.5)
    v9.Glow = react.createElement("ImageLabel", v10, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")})
    v9.View = react.createElement("ImageLabel", {
        Image = "rbxassetid://6891912132",
        BackgroundTransparency = 0.85,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v2:map(function(p1) -- Line: 108 -- upvalues: lerp (upval)
            return lerp(0.6, 1, p1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.497, 0.5),
        Size = UDim2.fromScale(1, 1),
    })
    v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.273, 0.163),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = u3,
    }
    local v12 = {Scale = react.createElement("UIScale", {Scale = v1}), Shadow = react.createElement("ImageLabel", {
        Image = "rbxassetid://16264499577",
        ImageTransparency = 0.27,
        SliceScale = 0.275,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(379, 379, 379, 379),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.501, 0.505),
        Size = UDim2.fromScale(1.14, 1.18),
    })}
    local v13 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(9, 10, 13),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.496),
        Size = UDim2.fromScale(1, 0.996),
    }
    local v14 = {Padding = react.createElement("UIPadding", v7.Padding.Universal.Large)}
    local v15 = {
        TextTransparency = 0.24,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = v4,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v6(22),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v16 = v6(15)
    v15.Position = UDim2.fromOffset(v16, v6(30))
    v15.Size = UDim2.fromScale(0.478, 0.0724)
    v14.Header = react.createElement("TextLabel", v15)
    v15 = {
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        RichText = true,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = v5,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v6(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v16 = v6(15)
    v15.Position = UDim2.fromOffset(v16, v6(50))
    v15.Size = UDim2.fromScale(0.912, 0.442)
    v14.Body = react.createElement("TextLabel", v15)
    v15 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 1), Position = UDim2.fromScale(1, 1)}
    v16 = UDim2.fromScale(1, 0)
    v15.Size = v16 + UDim2.fromOffset(0, v6(40))
    v14.Buttons = react.createElement("Frame", v15, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(15)),
    }), Submit = react.createElement(Button, {
        Text = "Continue",
        Brightness = 1,
        Hover = 5,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 222 -- upvalues: u13 (val), u4 (val)
            if u13.current then
                u13.current(true)
                u4(false)
            end
        end,
    }), Cancel = react.createElement(Button, {
        Text = "Cancel",
        Brightness = 1,
        Type = 3,
        Hover = 5,
        Color = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(188, 188, 188),
        Clicked = function() -- Line: 240 -- upvalues: u13 (val), u4 (val)
            if u13.current then
                u13.current(false)
                u4(false)
            end
        end,
        Native = {LayoutOrder = -1},
    })})
    v15 = {Transparency = 0.2, Thickness = 1}
    v16 = v3
    if not v16 then
        v16 = Color3.fromRGB(255, 255, 255)
    end
    v15.Color = Color.Darken(v16, 0.1)
    v14.Stroke = react.createElement("UIStroke", v15)
    v14.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})
    v15 = {BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 2, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v17 = v3
    if not v17 then
        v17 = Color3.fromRGB(255, 255, 255)
    end
    v15.BackgroundColor3 = v17
    v15.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v15.Position = UDim2.fromScale(0.501, 0.5)
    v16 = UDim2.fromScale(1, 1)
    v15.Size = v16 + UDim2.fromOffset(v7.Padding.Sizes.Large * 2, v7.Padding.Sizes.Large * 2)
    v17 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}
    local v18 = {Rotation = 90}
    local v19 = {}
    local v20 = NumberSequenceKeypoint.new(0, 0.85)
    v19[1] = v20
    v19[2] = NumberSequenceKeypoint.new(1, 1)
    v18.Transparency = NumberSequence.new(v19)
    v17.Gradient = react.createElement("UIGradient", v18)
    v14.Gradient = react.createElement("Frame", v15, v17)
    v12.Effects = react.createElement("Frame", v13, v14)
    v9.Alert = react.createElement("Frame", v10, v12)
    return react.createElement("Frame", v8, v9)
end