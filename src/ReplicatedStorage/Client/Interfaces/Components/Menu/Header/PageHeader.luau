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
--      File: ReplicatedStorage.Client.Interfaces.Components.Menu.Header.PageHeader
--                               Dumped in 0.00162 seconds
--                          Bytecode version 9  |  2 functions

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
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
return function(p1) -- Line: 34 -- upvalues: useTheme (val), useRem (val), react (val), Label (val)
    local Closed, Closed_3
    local v1 = useTheme()
    local v2 = useRem()
    local v3 = v2(30)
    local createElement = react.createElement
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = -2,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v1.BackgroundSecondary,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
    }
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v2(125))
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v7 = {
        ImageTransparency = 0.24,
        BackgroundTransparency = 1,
        ZIndex = 2,
        Image = p1.Icon,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ImageColor3 = v1.Primary,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v8 = UDim2.fromScale(0.022, 0.5)
    local v9 = v2(30)
    v7.Position = v8 + UDim2.fromOffset(v9, 0)
    v8 = v2(60)
    v7.Size = UDim2.fromOffset(v8, v2(50))
    v6.Icon = react.createElement("ImageLabel", v7, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.02})})
    v7 = {
        Image = "rbxassetid://11422155687",
        ImageTransparency = 0.51,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = v1.Primary,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0, 0.5),
    }
    v9 = UDim2.fromScale(0, 0.5)
    local v10 = v2(60)
    local v11 = v9 + UDim2.fromOffset(v10, 0)
    v8 = v11 + UDim2.fromOffset(v3, 0)
    v7.Position = v8 + UDim2.fromOffset(0, v2(12.5))
    v8 = v2(20)
    v7.Size = UDim2.fromOffset(v8, v2(20))
    v7.ImageColor3 = v1.Primary
    local v12 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    v6.Information = react.createElement("ImageLabel", v7, v12)
    v7 = {
        TextTransparency = 0.46,
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Body,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0, 0.5),
    }
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, v2(18))
    local v13 = UDim2.fromScale(0, 0.5)
    local v14 = v2(60)
    v9 = v13 + UDim2.fromOffset(v14, 0)
    v11 = v9 + UDim2.fromOffset(v3, 0)
    v13 = v2(25)
    v8 = v11 + UDim2.fromOffset(v13, 0)
    v7.Position = v8 + UDim2.fromOffset(0, v2(12.5))
    v6.Body = react.createElement(Label, v7)
    v7 = {
        TextScaled = true,
        TextTransparency = 0.24,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.Header,
    }
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, v2(24))
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextYAlignment = Enum.TextYAlignment.Bottom
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.AnchorPoint = Vector2.new(0, 0.5)
    v9 = UDim2.fromScale(0, 0.5)
    v10 = v2(60)
    v11 = v9 + UDim2.fromOffset(v10, 0)
    v8 = v11 + UDim2.fromOffset(v3, 0)
    v7.Position = v8 + UDim2.fromOffset(0, -v2(12.5))
    v6.Header = react.createElement(Label, v7)
    if p1.Clicked then
        v7 = {}
        if not p1.Closed then
            v12 = "rbxassetid://11422142913"
        else
            v12 = "rbxassetid://11293981586"
        end
        v7.Image = v12
        v7.ImageTransparency = 0.24
        v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v7.BackgroundTransparency = 1
        v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v7.BorderSizePixel = 0
        v7.Position = UDim2.fromScale(0.933, 0.231)
        v7.Size = UDim2.fromScale(0.034, 0.357)
        v7.ZIndex = 2
        local Closed_2 = p1.Closed
        if not Closed_2 then
            Closed_2 = p1.Clicked
        end
        v7[react.Event.MouseButton1Click] = Closed_2
        Closed = react.createElement("ImageButton", v7, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.02})})
    else
        Closed = p1.Closed
        if not Closed then end
    end
    v6.Arrow = Closed
    if p1.Clicked then
        v7 = {
            TextScaled = true,
            TextSize = 14,
            TextTransparency = 0.24,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        }
        if not p1.Closed then
            v12 = "Submit"
        else
            v12 = "Close"
        end
        v7.Text = v12
        v7.TextColor3 = Color3.fromRGB(255, 255, 255)
        v7.TextYAlignment = Enum.TextYAlignment.Bottom
        v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v7.Position = UDim2.fromScale(0.916, 0.583)
        v7.Size = UDim2.fromScale(0.0678, 0.158)
        Closed_3 = react.createElement("TextLabel", v7)
    else
        Closed_3 = p1.Closed
        if not Closed_3 then end
    end
    v6.Submit = Closed_3
    v6.Background = react.createElement("ImageLabel", {
        Image = "rbxassetid://16255699706",
        ImageTransparency = 0.97,
        BorderSizePixel = 0,
        ImageColor3 = v1.Accent,
        ScaleType = Enum.ScaleType.Crop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v1.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    return createElement("Frame", v4, v6)
end