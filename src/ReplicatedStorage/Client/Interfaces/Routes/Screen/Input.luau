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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Input
--                               Dumped in 0.00237 seconds
--                          Bytecode version 9  |  13 functions

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
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local InputPopupProvider = require(Providers:WaitForChild("InputPopupProvider"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_3:WaitForChild("Inputs")
local TextInput = require(Inputs_2:WaitForChild("TextInput"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local function lerp(p1, p2, p3) -- Line: 31
    return p1 + (p2 - p1) * p3
end
local u131 = nil
local u132 = nil
return function() -- Line: 42 -- upvalues: react (val), InputPopupProvider (val), u131 (ref), useMotion (val), useTextScale (val), useConstants (val), lerp (val), Color (val), TextInput (val), u132 (ref), Button (val)
    local u14, u18, u19, u24, u29, u34, u38, u39, u53, u57, u8, u9, v1, v2, v3, v4, v5, v6
    local u4 = react.useContext(InputPopupProvider.InputContext)
    u8, u9 = react.useState(false)
    v4, u14 = react.useState(nil)
    u18, u19 = react.useState({})
    v5, u24 = react.useState("No Header")
    v6, u29 = react.useState("No Body")
    v1, u34 = react.useState("Type here...")
    u38, u39 = react.useState("")
    react.useEffect(function() -- Line: 56 -- upvalues: u9 (val), u4 (val), u14 (val), u24 (val), u29 (val), u34 (val), u19 (val), u39 (val), u131 (upval)
        u9(u4.visible)
        u14(u4.color)
        u24(u4.components[1])
        u29(u4.components[2])
        u34(u4.components[3])
        u19(u4.callback)
        if not u4.visible then
            u39("")
        end
        u131 = u4.callback.current
    end, {
        u4.visible,
        u4.color,
        u4.components,
        u4.callback,
        u38,
    })
    v2, u53 = useMotion(0.95)
    v3, u57 = useMotion(1)
    local v7 = useTextScale()
    local v8 = useConstants()
    react.useEffect(function() -- Line: 79 -- upvalues: u8 (val), u53 (val), u57 (val)
        if u8 then
            u53:spring(1, {frequency = 0.2})
            u57:spring(0, {frequency = 0.4})
            return
        end
        u53:spring(0.95, {frequency = 0.2})
        u57:spring(1, {frequency = 0.4})
    end, {u8})
    local v9 = {
        BorderSizePixel = 0,
        ZIndex = 200,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v3:map(function(p1) -- Line: 92 -- upvalues: lerp (upval)
            return lerp(0.3, 1, p1)
        end),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v2:map(function(p1) -- Line: 100
            local v1 = 0.95 < p1
            return v1
        end),
    }
    local v10 = {}
    local v11 = {Image = "rbxassetid://17812826389", BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 0}
    local v12 = v4
    if not v12 then
        v12 = Color3.fromRGB(255, 255, 255)
    end
    v11.ImageColor3 = Color.Darken(v12, 0.3)
    v11.ImageTransparency = v3:map(function(p1) -- Line: 107 -- upvalues: lerp (upval)
        return lerp(0.56, 1, p1)
    end)
    v11.AnchorPoint = Vector2.new(0.5, 0.5)
    v11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v11.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v11.Position = UDim2.fromScale(0.5, 0.5)
    v11.Size = UDim2.fromScale(1.5, 1.5)
    v10.Glow = react.createElement("ImageLabel", v11, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")})
    v10.View = react.createElement("ImageLabel", {
        Image = "rbxassetid://6891912132",
        BackgroundTransparency = 0.85,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v3:map(function(p1) -- Line: 125 -- upvalues: lerp (upval)
            return lerp(0.6, 1, p1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.497, 0.5),
        Size = UDim2.fromScale(1, 1),
    })
    v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.273, 0.185),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = u8,
    }
    local v13 = {Scale = react.createElement("UIScale", {Scale = v2}), Shadow = react.createElement("ImageLabel", {
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
    local v14 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(9, 10, 13),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.496),
        Size = UDim2.fromScale(1, 0.996),
    }
    local v15 = {Padding = react.createElement("UIPadding", v8.Padding.Universal.Large)}
    local v16 = {
        TextTransparency = 0.24,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = v5,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v7(22),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v17 = v7(15)
    v16.Position = UDim2.fromOffset(v17, v7(30))
    v16.Size = UDim2.fromScale(0.478, 0.0724)
    v15.Header = react.createElement("TextLabel", v16)
    v16 = {
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = v6,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v7(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v17 = v7(15)
    v16.Position = UDim2.fromOffset(v17, v7(50))
    v16.Size = UDim2.fromScale(0.912, 0.442)
    v15.Body = react.createElement("TextLabel", v16)
    v16 = {
        Layout = 3,
        Outlined = true,
        Header = v5,
        Body = v6,
        Placeholder = v1,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
    }
    local v18 = {BackgroundTransparency = 1}
    local v19 = UDim2.fromScale(0, 0)
    v18.Position = v19 + UDim2.fromOffset(0, v7(70))
    v16.Native = v18
    function v16.Stepped(p1) -- Line: 233 -- upvalues: u39 (val)
        u39(p1)
    end
    function v16.Changed(p1) -- Line: 237 -- upvalues: u39 (val), u132 (upval)
        u39(p1)
        u132 = p1
    end
    v15.Text = react.createElement(TextInput, v16)
    v16 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 1), Position = UDim2.fromScale(1, 1)}
    v17 = UDim2.fromScale(1, 0)
    v16.Size = v17 + UDim2.fromOffset(0, v7(40))
    v15.Buttons = react.createElement("Frame", v16, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v7(15)),
    }), Submit = react.createElement(Button, {
        Text = "Submit",
        Brightness = 1,
        Hover = 5,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 266 -- upvalues: u131 (upval), u4 (val), u38 (val), u132 (upval)
            if u131 then
                local v1
                u4.setVisible(false)
                if not u38 then
                    if not u132 then
                        v1 = nil
                    elseif u132 == "" then
                        v1 = nil
                    else
                        v1 = u132
                        if not v1 then
                            v1 = nil
                        end
                    end
                elseif u38 ~= "" then
                    v1 = u38
                end
                u131(v1)
            end
        end,
    }), Cancel = react.createElement(Button, {
        Text = "Cancel",
        Brightness = 1,
        Type = 3,
        Hover = 5,
        Color = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(188, 188, 188),
        Clicked = function() -- Line: 288 -- upvalues: u18 (val), u9 (val)
            if u18.current then
                u18.current()
                u9(false)
            end
        end,
        Native = {LayoutOrder = -1},
    })})
    v16 = {Transparency = 0.2, Thickness = 1}
    v17 = v4
    if not v17 then
        v17 = Color3.fromRGB(255, 255, 255)
    end
    v16.Color = Color.Darken(v17, 0.1)
    v15.Stroke = react.createElement("UIStroke", v16)
    v15.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})
    v16 = {BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 2, AnchorPoint = Vector2.new(0.5, 0.5)}
    v18 = v4
    if not v18 then
        v18 = Color3.fromRGB(255, 255, 255)
    end
    v16.BackgroundColor3 = v18
    v16.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v16.Position = UDim2.fromScale(0.501, 0.5)
    v17 = UDim2.fromScale(1, 1)
    v16.Size = v17 + UDim2.fromOffset(v8.Padding.Sizes.Large * 2, v8.Padding.Sizes.Large * 2)
    v18 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}
    local v20 = {Rotation = 90}
    local v21 = {}
    local v22 = NumberSequenceKeypoint.new(0, 0.85)
    v21[1] = v22
    v21[2] = NumberSequenceKeypoint.new(1, 1)
    v20.Transparency = NumberSequence.new(v21)
    v18.Gradient = react.createElement("UIGradient", v20)
    v15.Gradient = react.createElement("Frame", v16, v18)
    v13.Effects = react.createElement("Frame", v14, v15)
    v10.Content = react.createElement("Frame", v11, v13)
    return react.createElement("Frame", v9, v10)
end