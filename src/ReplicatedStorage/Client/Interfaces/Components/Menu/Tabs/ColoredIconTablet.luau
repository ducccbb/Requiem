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
--   File: ReplicatedStorage.Client.Interfaces.Components.Menu.Tabs.ColoredIconTablet
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  4 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
return function(p1) -- Line: 36 -- upvalues: useTheme (val), useRem (val), useTextScale (val), useMotion (val), Color (val), react (val)
    local Color_2, Desaturate, u24, v1, v2
    local v3 = useTheme()
    local v4 = useRem()
    local v5 = useTextScale()
    if not p1.Selected then
        Desaturate = Color.Desaturate
        v2 = Color.Darken(p1.Color, 0.4)
        Color_2 = Desaturate(v2, 0.5)
    else
        Color_2 = p1.Color
        if not Color_2 then
            Desaturate = Color.Desaturate
            v2 = Color.Darken(p1.Color, 0.4)
            Color_2 = Desaturate(v2, 0.5)
        end
    end
    v1, u24 = useMotion(Color_2)
    react.useEffect(function() -- Line: 44 -- upvalues: u24 (val), p1 (val), Color (upval)
        local Color_2, v1
        if not p1.Selected then
            v1 = Color.Darken(p1.Color, 0.4)
            Color_2 = Color.Desaturate(v1, 0.5)
        else
            Color_2 = p1.Color
            if not Color_2 then
                v1 = Color.Darken(p1.Color, 0.4)
                Color_2 = Color.Desaturate(v1, 0.5)
            end
        end
        u24:spring(Color_2)
    end, {p1.Selected})
    local v6 = {
        Image = "rbxassetid://16255699706",
        ImageTransparency = 0.97,
        BorderSizePixel = 0,
        ImageColor3 = v3.Accent,
        ScaleType = Enum.ScaleType.Crop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.473),
        Size = UDim2.fromScale(0.331, 0.946),
    }
    local v7 = {}
    local v8 = {
        BackgroundTransparency = 1,
        Text = "",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ZIndex = 5,
    }
    v8[react.Event.MouseButton1Click] = function() -- Line: 68 -- upvalues: p1 (val)
        p1.Clicked()
    end
    v7.Hitbox = react.createElement("TextButton", v8)
    v7.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v7.Frame = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = v1,
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, 2),
    })
    v7.Content = react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0), Size = UDim2.fromOffset(410, 46)}, {Label = react.createElement("TextLabel", {
        TextTransparency = 0.21,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.Label,
        TextColor3 = v3.Primary,
        TextSize = v5(20),
        TextYAlignment = Enum.TextYAlignment.Center,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0.43, 0.5),
    }), Layout = react.createElement("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })})
    v8 = {
        BorderSizePixel = 0,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
    }
    local v9 = v4(39)
    v8.Size = UDim2.fromOffset(v9, v4(39))
    v7.Frame2 = react.createElement("Frame", v8, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 2, Color = v1}), Ratio = react.createElement("UIAspectRatioConstraint"), Label = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ZIndex = 3,
        Image = p1.Icon,
        ImageColor3 = v1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.575, 0.575),
    }, {Ratio = react.createElement("UIAspectRatioConstraint")})})
    return react.createElement("ImageLabel", v6, v7)
end