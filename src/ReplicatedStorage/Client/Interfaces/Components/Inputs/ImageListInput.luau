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
--      File: ReplicatedStorage.Client.Interfaces.Components.Inputs.ImageListInput
--                               Dumped in 0.00120 seconds
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
local useTextScale = require(Hooks:WaitForChild("useTextScale"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_4:WaitForChild("useToast"))
local function ImagePickerSelection(p1) -- Line: 24 -- upvalues: useToast (val), useRem (val), react (val)
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
    local v4 = {Corner = react.createElement("UICorner")}
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Image = p1.Asset,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Position = p1.Position
    if not Position then
        Position = UDim2.fromScale(0.5, -0.2)
    end
    v5.Position = Position
    local Size = p1.Size
    if not Size then
        Size = UDim2.fromScale(3.5, 3.5)
    end
    v5.Size = Size
    v4.Image = react.createElement("ImageLabel", v5)
    v4.Locked = react.createElement("Frame", {
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
    })})
    v5 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 4,
    }
    v5[react.Event.MouseButton1Click] = function() -- Line: 89 -- upvalues: p1 (val), u2 (val)
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
return function(p1) -- Line: 103 -- upvalues: useRem (val), useTextScale (val), useTheme (val), react (val), ImagePickerSelection (val)
    local v1, v2
    local v3 = useRem()
    local v4 = useTextScale()
    local v5 = useTheme()
    local v6 = {}
    local u278 = p1
    for i, v in ipairs(p1.Images) do
        v1 = u278.Locked and table.find(u278.Locked, i)
        v2 = tostring(i) .. "_img"
        v6[v2] = react.createElement(ImagePickerSelection, {
            Asset = v,
            Clicked = function() -- Line: 129 -- upvalues: u278 (val), i (val)
                u278.Clicked(i)
            end,
            Size = u278.ImageSize,
            Position = u278.ImagePosition,
            LayoutOrder = i,
            Locked = v1,
        })
    end
    local v7 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.568, 0.333),
        Size = UDim2.fromScale(0.417, 0.186),
        LayoutOrder = u278.LayoutOrder,
        BackgroundTransparency = v5.PageTransparency,
    }
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.95),
    }
    local v9 = UDim2.fromScale(0.969, 0)
    v2.Size = v9 + UDim2.fromOffset(0, v3(83))
    local v10 = {Scrolling = react.createElement("ScrollingFrame", {
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
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder})}, v6)}
    local v11 = {}
    local v12 = {}
    local v13 = NumberSequenceKeypoint.new(0, 0)
    local v14 = NumberSequenceKeypoint.new(0.807, 0)
    v12[1] = v13
    v12[2] = v14
    v12[3] = NumberSequenceKeypoint.new(1, 1)
    v11.Transparency = NumberSequence.new(v12)
    v10.Gradient = react.createElement("UIGradient", v11)
    v8.Canvas = react.createElement("CanvasGroup", v2, v10)
    v8.Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    v8.Body = react.createElement("TextLabel", {
        TextTransparency = 0.46,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = u278.Body or "Your character's mouth selection.",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v4(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.256),
        Size = UDim2.fromScale(0.65, 0.0988),
    })
    v8.Header = react.createElement("TextLabel", {
        TextTransparency = 0.24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = u278.Header or "Mouth Selection",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v4(16),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0195, 0.0873),
        Size = UDim2.fromScale(0.337, 0.118),
    })
    return react.createElement("Frame", v7, v8)
end