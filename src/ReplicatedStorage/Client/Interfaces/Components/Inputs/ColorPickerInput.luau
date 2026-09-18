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
--     File: ReplicatedStorage.Client.Interfaces.Components.Inputs.ColorPickerInput
--                               Dumped in 0.00376 seconds
--                          Bytecode version 9  |  19 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local function ColorRainbowPicker(p1) -- Line: 46 -- upvalues: useTextScale (val), useTheme (val), react (val), UserInputService (val), Color (val)
    local u13, u14, u18, u19, u3, u4, u5
    u3, u4, u5 = Color3.toHSV(p1.Color)
    local v1 = useTextScale()
    u13, u14 = react.useState(nil)
    u18, u19 = react.useState(nil)
    local function disconnect(p1, p2) -- Line: 55 -- upvalues: u13 (val), u18 (val)
        local v1 = p2
        if not v1 then
            v1 = u13
        end
        local v2 = p1
        if not v2 then
            v2 = u18
        end
        if v1 then
            v1:Disconnect()
        end
        if v2 then
            v2:Disconnect()
        end
    end
    local function getAbsoluteBounds(p1) -- Line: 68
        local AbsolutePosition = p1.AbsolutePosition
        local AbsoluteSize = p1.AbsoluteSize
        return AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + 58, AbsolutePosition.Y + AbsoluteSize.Y + 58
    end
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v3 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})}
    local v4 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v5 = {Ratio = react.createElement("UIAspectRatioConstraint")}
    local v6 = {}
    local v7 = {}
    local v8 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 1))
    local v9 = ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 0, 255))
    local v10 = ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 0, 255))
    local v11 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 225))
    local v12 = ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 255, 0))
    local v13 = ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 255, 0))
    v7[1] = v8
    v7[2] = v9
    v7[3] = v10
    v7[4] = v11
    v7[5] = v12
    v7[6] = v13
    v7[7] = ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    v6.Color = ColorSequence.new(v7)
    v7 = {}
    v8 = NumberSequenceKeypoint.new(0, 0)
    v9 = NumberSequenceKeypoint.new(0.481, 0.294)
    v7[1] = v8
    v7[2] = v9
    v7[3] = NumberSequenceKeypoint.new(1, 0)
    v6.Transparency = NumberSequence.new(v7)
    v5.Gradient = react.createElement("UIGradient", v6)
    v6 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
    }
    v6[react.Event.MouseButton1Down] = function(a1) -- Line: 81 -- upvalues: UserInputService (upval), getAbsoluteBounds (val), p1 (val), u5 (val), disconnect (val), u14 (val), u19 (val)
        local u10, u7, u8, u9
        local MouseLocation = UserInputService:GetMouseLocation()
        u7, u8, u9, u10 = getAbsoluteBounds(a1)
        local v1 = 1 - math.clamp((MouseLocation.X - u7) / (u8 - u7), 0, 1)
        local v2 = 1 - math.clamp((MouseLocation.Y - u9) / (u10 - u9), 0, 1)
        p1.Update(Color3.fromHSV(v1, v2, u5))
        local u38 = nil
        disconnect()
        local u47 = UserInputService.InputChanged:Connect(function(a1) -- Line: 94 -- upvalues: UserInputService (upval), u7 (val), u8 (val), u9 (val), u10 (val), p1 (upval), u5 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local MouseLocation = UserInputService:GetMouseLocation()
                local v1 = 1 - math.clamp((MouseLocation.X - u7) / (u8 - u7), 0, 1)
                local v2 = 1 - math.clamp((MouseLocation.Y - u9) / (u10 - u9), 0, 1)
                p1.Update(Color3.fromHSV(v1, v2, u5))
            end
        end)
        u38 = UserInputService.InputEnded:Connect(function(p1) -- Line: 105 -- upvalues: disconnect (upval), u47 (ref), u38 (ref)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                disconnect(u47, u38)
            end
        end)
        u14(u47)
        u19(u38)
    end
    v5.Button = react.createElement("TextButton", v6)
    v6 = {BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), Size = UDim2.fromScale(1, 1)}
    local v14 = {}
    v9 = {Rotation = 270}
    v11 = {}
    v12 = NumberSequenceKeypoint.new(0, 0)
    v11[1] = v12
    v11[2] = NumberSequenceKeypoint.new(1, 1)
    v9.Transparency = NumberSequence.new(v11)
    v14.Gradient = react.createElement("UIGradient", v9)
    v14.Cursor = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1 - u3, 1 - u4),
        Size = UDim2.fromScale(0.07, 0.07),
    }, {Y = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0, 2, 1, 0),
    }), X = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 0, 0, 2),
    }), Ratio = react.createElement("UIAspectRatioConstraint")})
    v14.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v5.Overlay = react.createElement("Frame", v6, v14)
    v5.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v5.Stroke = react.createElement("UIStroke", {Transparency = 0.5, Color = Color.Darken(useTheme().PageBackground, 2, 0.2, 0.2)})
    v3.Color = react.createElement("Frame", v4, v5)
    v4 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.925, 0.5),
        Size = UDim2.fromScale(0.035, 1),
    }
    v5 = {}
    v6 = {Rotation = 270}
    v7 = {}
    v8 = ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0))
    v7[1] = v8
    v7[2] = ColorSequenceKeypoint.new(1, Color3.fromHSV(u3, u4, 1))
    v6.Color = ColorSequence.new(v7)
    v5.Gradient = react.createElement("UIGradient", v6)
    v6 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = p1.Color,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1 - u5),
    }
    v8 = v1(15)
    v6.Size = UDim2.new(0, v8, 0, v1(4))
    v5.Cursor = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v6 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
    }
    v6[react.Event.MouseButton1Down] = function(a1) -- Line: 115 -- upvalues: UserInputService (upval), getAbsoluteBounds (val), p1 (val), u3 (val), u4 (val), disconnect (val), u14 (val), u19 (val)
        local u10, u9
        local MouseLocation = UserInputService:GetMouseLocation()
        _, _, u9, u10 = getAbsoluteBounds(a1)
        local v1 = 1 - math.clamp((MouseLocation.Y - u9) / (u10 - u9), 0, 1)
        p1.Update(Color3.fromHSV(u3, u4, v1))
        local u29 = nil
        disconnect()
        local u38 = UserInputService.InputChanged:Connect(function(a1) -- Line: 126 -- upvalues: UserInputService (upval), u9 (val), u10 (val), p1 (upval), u3 (upval), u4 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local v1 = UserInputService:GetMouseLocation().Y - u9
                local v2 = 1 - math.clamp(v1 / (u10 - u9), 0, 1)
                p1.Update(Color3.fromHSV(u3, u4, v2))
            end
        end)
        u29 = UserInputService.InputEnded:Connect(function(p1) -- Line: 135 -- upvalues: disconnect (upval), u38 (ref), u29 (ref)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                disconnect(u38, u29)
            end
        end)
        u14(u38)
        u19(u29)
    end
    v5.Button = react.createElement("TextButton", v6)
    v5.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v3.Value = react.createElement("Frame", v4, v5)
    v3.Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.14, DominantAxis = Enum.DominantAxis.Height})
    return react.createElement("Frame", v2, v3)
end
local function NumericInputColor(p1) -- Line: 315 -- upvalues: useTheme (val), useTextScale (val), react (val), Color (val)
    local v1 = useTheme()
    local v2 = useTextScale()
    local v3 = {}
    local v4 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = tostring(p1.Value),
        TextColor3 = v1.Primary,
        TextSize = v2(14),
        TextTransparency = 0.5,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
    }
    local v5 = Color.Darken(v1.PageBackground, 0.85)
    v4.BackgroundColor3 = Color.Darken(v5, 1, 0.1, 0.1)
    v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v4.BorderSizePixel = 0
    v4.LayoutOrder = p1.LayoutOrder + 2
    v5 = UDim2.fromScale(0.5, 0)
    v4.Size = v5 + UDim2.new(0, 0, 0, v2(22))
    v4.BackgroundTransparency = 0.5
    v4[react.Event.FocusLost] = function(a1) -- Line: 336 -- upvalues: p1 (val)
        local v1 = math.floor(tonumber(a1.Text) or 0)
        local v2 = math.clamp(v1, 0, 255)
        if v2 then
            p1.Update(v2)
        end
    end
    v3.Input = react.createElement("TextBox", v4, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 1), PaddingLeft = UDim.new(0, 10), PaddingTop = UDim.new(0, 1)}), Stroke = react.createElement("UIStroke", {Transparency = 0.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = Color.Darken(v1.PageBackground, 0.5, 0.2, 0.2)})})
    v4 = {
        TextTransparency = 0.42,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Text,
        TextColor3 = v1.Primary,
        TextSize = v2(15),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = p1.LayoutOrder + 1,
        Position = UDim2.fromScale(0, 0.633),
    }
    v5 = UDim2.fromScale(0.215, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v2(20))
    v3.Label = react.createElement("TextLabel", v4)
    v3.Padding = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(1, 4), LayoutOrder = p1.LayoutOrder})
    return react.createElement(react.Fragment, {}, v3)
end
local function NumericColorPicker(p1) -- Line: 390 -- upvalues: react (val), NumericInputColor (val)
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.563),
        Size = UDim2.fromScale(1, 0.4),
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom}), Red = react.createElement(NumericInputColor, {
        Text = "Red",
        LayoutOrder = 0,
        Value = math.floor(p1.Color.R * 255),
        Update = function(a1) -- Line: 410 -- upvalues: p1 (val)
            p1.Update(Color3.fromRGB(a1, p1.Color.G * 255, p1.Color.B * 255))
        end,
    }), Green = react.createElement(NumericInputColor, {
        Text = "Green",
        LayoutOrder = 3,
        Value = math.floor(p1.Color.G * 255),
        Update = function(a1) -- Line: 419 -- upvalues: p1 (val)
            p1.Update(Color3.fromRGB(p1.Color.R * 255, a1, p1.Color.B * 255))
        end,
    }), Blue = react.createElement(NumericInputColor, {
        Text = "Blue",
        LayoutOrder = 6,
        Value = math.floor(p1.Color.B * 255),
        Update = function(a1) -- Line: 428 -- upvalues: p1 (val)
            p1.Update(Color3.fromRGB(p1.Color.R * 255, p1.Color.G * 255, a1))
        end,
    })})
end
local function ColorInformation(p1) -- Line: 435 -- upvalues: react (val), HeaderBodyComponent (val)
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.199),
        Size = UDim2.fromScale(1, 0.165),
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 5.02}), Label = react.createElement(HeaderBodyComponent, {Header = p1.Header or "Color Information", Body = p1.Body or "Your lore character's eye color.", Position = UDim2.fromScale(0.235, 0.45)}), Preview = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = p1.Color,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.00452, 0.455),
        Size = UDim2.fromScale(0.186, 0.932),
    }, {Ratio = react.createElement("UIAspectRatioConstraint"), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})})
end
return function(p1) -- Line: 472 -- upvalues: react (val), useConstants (val), useTheme (val), FillProps (val), ColorRainbowPicker (val), NumericColorPicker (val), ColorInformation (val)
    local Medium, Right, u11, v1, v2
    local Default = p1.Default
    if not Default then
        Default = Color3.fromRGB(255, 0, 0)
    end
    u11, v2 = react.useState(Default)
    local v3 = useConstants()
    local v4 = useTheme()
    react.useEffect(function() -- Line: 478 -- upvalues: p1 (val), u11 (val)
        p1.Updated(u11)
    end, {u11})
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v5 = FillProps(Native, {
        BorderSizePixel = 0,
        BackgroundColor3 = v4.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.568, 0.00615),
        Size = UDim2.new(0.417, 0, -0.00401, 270),
        LayoutOrder = p1.LayoutOrder,
    })
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local createElement_2 = react.createElement
    if not p1.Simple then
        Medium = v3.Padding.Universal.Large
    else
        Medium = v3.Padding.Universal.Medium
    end
    v6.Padding = createElement_2("UIPadding", Medium)
    local createElement_3 = react.createElement
    local v7 = {Padding = UDim.new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center}
    if not p1.Simple then
        Right = Enum.HorizontalAlignment.Left
    else
        Right = Enum.HorizontalAlignment.Right
    end
    v7.HorizontalAlignment = Right
    v7.FillDirection = Enum.FillDirection.Horizontal
    v6.Layout = createElement_3("UIListLayout", v7)
    local createElement_4 = react.createElement
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 0,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
    }
    if not p1.Simple then
        v1 = UDim2.fromScale(0.55, 1)
    else
        v1 = UDim2.fromScale(1, 1)
        if not v1 then
            v1 = UDim2.fromScale(0.55, 1)
        end
    end
    v7.Size = v1
    v7.AnchorPoint = Vector2.new(0, 0.5)
    v6.Left = createElement_4("Frame", v7, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.14}), ColorRainbowPicker = react.createElement(ColorRainbowPicker, {Color = u11, Update = v2})})
    local v8 = not p1.Simple
    if v8 then
        v8 = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.55, 1),
            AnchorPoint = Vector2.new(0, 0.5),
        }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0.4, 0), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top}), NumericColorPicker = react.createElement(NumericColorPicker, {Color = u11, Update = v2}), Information = react.createElement(ColorInformation, {Color = u11, Header = p1.Header, Body = p1.Body})})
    end
    v6.Right = v8
    return createElement("Frame", v5, v6)
end