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
--       File: ReplicatedStorage.Client.Interfaces.Components.Screen.Notification
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function(p1) -- Line: 15 -- upvalues: useMotion (val), react (val)
    local u14, u7, v1, v2
    v1, u7 = useMotion(UDim2.fromScale(1, 0))
    v2, u14 = useMotion(UDim2.fromScale(-2, 0))
    react.useEffect(function() -- Line: 19 -- upvalues: u14 (val), u7 (val)
        u14:spring(UDim2.fromScale(1, 0))
        local v1 = UDim2.fromScale(0.997, 0.664)
        u7:spring(v1, {frequency = 0.3})
        task.delay(8.5, function() -- Line: 25 -- upvalues: u7 (upval), u14 (upval)
            u7:spring(UDim2.fromScale(1, 0))
            u14:spring(UDim2.fromScale(-2.5, 0))
        end)
    end, {})
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.332),
        Size = v1,
    }
    local v4 = {}
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
        Size = UDim2.fromOffset(326, 104),
    }
    local v6 = {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 1), HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center})}
    local v7 = {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(14, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }
    local v8 = {Header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.header,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.391, 0, 0.0589, 20),
        Size = UDim2.new(0.662, 0, -0.0168, 20),
    }), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Body = react.createElement("TextLabel", {
        TextSize = 14,
        TextTransparency = 0.35,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.description,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.406, 0, 0.0132, 40),
        Size = UDim2.new(0.692, 0, -0.0132, 50),
    })}
    local v9 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(43, 135, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0.0092, 6, 1, 0),
    }
    local v10 = {corner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    local v11 = {}
    local v12 = {}
    local v13 = NumberSequenceKeypoint.new(0, 0)
    local v14 = NumberSequenceKeypoint.new(0.5, 0)
    local v15 = NumberSequenceKeypoint.new(0.501, 1)
    v12[1] = v13
    v12[2] = v14
    v12[3] = v15
    v12[4] = NumberSequenceKeypoint.new(1, 1)
    v11.Transparency = NumberSequence.new(v12)
    v10.uIGradient = react.createElement("UIGradient", v11)
    v8.Color = react.createElement("Frame", v9, v10)
    v8.Image = react.createElement("ImageLabel", {
        Image = "rbxassetid://11419713314",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(43, 135, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.773, 0.5),
        Size = UDim2.fromOffset(61, 61),
    })
    v8.Backdrop = react.createElement("ImageLabel", {
        Image = "rbxassetid://11419713314",
        ImageTransparency = 0.98,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(43, 135, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.721, 0.5),
        Size = UDim2.fromOffset(171, 171),
    })
    v6.Labels = react.createElement("Frame", v7, v8)
    v4.Animation = react.createElement("Frame", v5, v6)
    return react.createElement("Frame", v3, v4)
end