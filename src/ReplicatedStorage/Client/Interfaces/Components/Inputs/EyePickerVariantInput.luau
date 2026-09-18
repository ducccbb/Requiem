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
--   File: ReplicatedStorage.Client.Interfaces.Components.Inputs.EyePickerVariantInput
--                              Dumped in 0.000982 seconds
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
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Eyes = require(Customization:WaitForChild("Eyes"))
local function EyePickerSelection(p1) -- Line: 23 -- upvalues: useRem (val), react (val)
    local v1 = useRem()
    local v2 = {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(204, 142, 105),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.844, 0.00684),
    }
    local v3 = v1(75)
    v2.Size = UDim2.fromOffset(v3, v1(75))
    local v4 = {Corner = react.createElement("UICorner"), Iris = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        Image = p1.Eye.Iris,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.985, 0.685),
        Size = UDim2.fromScale(2.96, 2.96),
        ImageColor3 = p1.Color,
    }), Eyes = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Image = p1.Eye.Frames[p1.Frame],
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.985, 0.685),
        Size = UDim2.fromScale(2.96, 2.96),
    })}
    local v5 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 4,
    }
    v5[react.Event.MouseButton1Click] = p1.Clicked
    v4.Button = react.createElement("TextButton", v5)
    v4.Ratio = react.createElement("UIAspectRatioConstraint")
    return react.createElement("Frame", v2, v4)
end
return function(p1) -- Line: 77 -- upvalues: useTextScale (val), Eyes (val), react (val), EyePickerSelection (val)
    local v1
    local v2 = useTextScale()
    local v3 = Eyes[p1.Eye]
    if not v3 then
        v3 = Eyes[1]
    end
    local v4 = {}
    for i, v in ipairs(v3.Frames) do
        v1 = tostring(i) .. "_eyes"
        v4[v1] = react.createElement(EyePickerSelection, {
            Eye = v3,
            Frame = i,
            Color = p1.Color,
            Clicked = function() -- Line: 94 -- upvalues: p1 (val), i (val)
                p1.Clicked(i)
            end,
        })
    end
    local v5 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.568, 0.333),
        Size = UDim2.fromScale(0.417, 0.186),
        LayoutOrder = p1.LayoutOrder,
    }
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.95),
        Size = UDim2.fromScale(0.969, 0.576),
    }
    local v8 = {Scrolling = react.createElement("ScrollingFrame", {
        ScrollBarThickness = 4,
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        CanvasSize = UDim2.new(),
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder})}, v4)}
    local v9 = {}
    local v10 = {}
    local v11 = NumberSequenceKeypoint.new(0, 0)
    local v12 = NumberSequenceKeypoint.new(0.807, 0)
    v10[1] = v11
    v10[2] = v12
    v10[3] = NumberSequenceKeypoint.new(1, 1)
    v9.Transparency = NumberSequence.new(v10)
    v8.Gradient = react.createElement("UIGradient", v9)
    v6.Canvas = react.createElement("CanvasGroup", v7, v8)
    v6.Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    v6.Body = react.createElement("TextLabel", {
        Text = "Your character's eye frame selection.",
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = v2(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.256),
        Size = UDim2.fromScale(0.65, 0.0988),
    })
    v6.Header = react.createElement("TextLabel", {
        Text = "Eye Frame Selection",
        TextTransparency = 0.24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v2(16),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.0873),
        Size = UDim2.fromScale(0.337, 0.118),
    })
    return react.createElement("Frame", v5, v6)
end