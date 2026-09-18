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
--      File: ReplicatedStorage.Client.Interfaces.Components.Inputs.EyePickerInput
--                               Dumped in 0.00118 seconds
--                          Bytecode version 9  |  5 functions

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
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Eyes = require(Customization:WaitForChild("Eyes"))
local function EyePickerSelection(p1) -- Line: 24 -- upvalues: useToast (val), useRem (val), react (val)
    local u2 = useToast()
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
    if not p1.Locked then
        v3 = 0
    else
        v3 = 100
    end
    v2.LayoutOrder = v3 + (p1.LayoutOrder or 0)
    local v4 = {Corner = react.createElement("UICorner"), Iris = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        Image = p1.Eyes.Iris,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.985, 0.685),
        Size = UDim2.fromScale(2.96, 2.96),
        ImageColor3 = p1.Color,
    }), Locked = react.createElement("Frame", {
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = p1.Locked,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Corner = react.createElement("UICorner"), Lock = react.createElement("ImageLabel", {
        Image = "rbxassetid://14187755345",
        ImageTransparency = 0.5,
        BackgroundTransparency = 1,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    })}), Eyes = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Image = p1.Eyes.Iris,
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
    v5[react.Event.MouseButton1Click] = function() -- Line: 101 -- upvalues: p1 (val), u2 (val)
        if p1.Locked then
            u2({message = "You must be a supporter to unlock this item.", type = "error"})
            return
        end
        p1.Clicked()
    end
    v4.Button = react.createElement("TextButton", v5)
    v4.Ratio = react.createElement("UIAspectRatioConstraint")
    return react.createElement("Frame", v2, v4)
end
return function(p1) -- Line: 115 -- upvalues: useTextScale (val), Eyes (val), react (val), EyePickerSelection (val)
    local v1, v2
    local v3 = useTextScale()
    local v4 = {}
    local u259 = p1
    for i, v in ipairs(Eyes) do
        v1 = u259.Locked and table.find(u259.Locked, i)
        v2 = tostring(i) .. "_eyes"
        v4[v2] = react.createElement(EyePickerSelection, {
            Eyes = v,
            Color = u259.Color,
            Locked = v1,
            Clicked = function() -- Line: 136 -- upvalues: u259 (val), i (val)
                u259.Clicked(i)
            end,
        })
    end
    local v5 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.568, 0.333),
        Size = UDim2.fromScale(0.417, 0.186),
        LayoutOrder = u259.LayoutOrder,
    }
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.95),
        Size = UDim2.fromScale(0.969, 0.576),
    }
    local v7 = {Scrolling = react.createElement("ScrollingFrame", {
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
    local v8 = {}
    local v9 = {}
    local v10 = NumberSequenceKeypoint.new(0, 0)
    local v11 = NumberSequenceKeypoint.new(0.807, 0)
    v9[1] = v10
    v9[2] = v11
    v9[3] = NumberSequenceKeypoint.new(1, 1)
    v8.Transparency = NumberSequence.new(v9)
    v7.Gradient = react.createElement("UIGradient", v8)
    v6.Canvas = react.createElement("CanvasGroup", v2, v7)
    v6.Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    v6.Body = react.createElement("TextLabel", {
        Text = "Your character's eye selection.",
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = v3(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.256),
        Size = UDim2.fromScale(0.65, 0.0988),
    })
    v6.Header = react.createElement("TextLabel", {
        Text = "Eye Selection",
        TextTransparency = 0.24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v3(16),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.0873),
        Size = UDim2.fromScale(0.337, 0.118),
    })
    return react.createElement("Frame", v5, v6)
end