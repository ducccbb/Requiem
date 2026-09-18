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
--      File: ReplicatedStorage.Client.Interfaces.Components.Screen.EnchantmentItem
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  7 functions

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
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
return function(p1) -- Line: 23 -- upvalues: useRem (val), useTextScale (val), react (val), TransparencyGroup (val)
    local Right
    local u2 = useRem()
    local createElement = react.createElement
    local v1 = "Frame"
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.831),
    }
    local v3 = u2(364)
    v2.Size = UDim2.fromOffset(v3, u2(23))
    v2.Visible = p1.Progress:map(function(p1) -- Line: 42
        local v1 = 0 < p1
        return v1
    end)
    local v4 = {}
    local createElement_2 = react.createElement
    local v5 = {Enabled = p1.Visible, Tween = TweenInfo.new(0.3)}
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 0.75,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v8 = u2(364)
    v7.Size = UDim2.fromOffset(v8, u2(23))
    v6.Backdrop = react.createElement("Frame", v7)
    v7 = {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(189, 189, 189),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v8 = u2(352)
    v7.Size = UDim2.fromOffset(v8, u2(11))
    v6.frame1 = react.createElement("Frame", v7, {frame2 = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = p1.Color,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = p1.Progress:map(function(p1) -- Line: 75
            return UDim2.fromScale(p1, 1)
        end),
    })})
    v6.uIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, u2(6)), PaddingLeft = UDim.new(0, u2(6)), PaddingRight = UDim.new(0, u2(6)), PaddingTop = UDim.new(0, u2(6))})
    v6.uIStroke = react.createElement("UIStroke", {Transparency = 0.7, Color = Color3.fromRGB(255, 255, 255)})
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v8 = u2(372)
    v7.Size = UDim2.fromOffset(v8, u2(31))
    v6.frame3 = react.createElement("Frame", v7, {uIStroke1 = react.createElement("UIStroke", {Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})})
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = p1.Stroke:map(function(p1) -- Line: 115 -- upvalues: u2 (val)
            local v1 = UDim2.fromScale(1, 1)
            local v2 = u2(150) * p1
            return v1 + UDim2.fromOffset(v2, u2(150) * p1)
        end),
        Visible = p1.Stroke:map(function(p1) -- Line: 118
            local v1 = 0 < p1
            return v1
        end),
    }
    local v9 = {uIStroke2 = react.createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Transparency = p1.Stroke:map(function(p1) -- Line: 124
        return 0.7 + 0.3 * p1
    end)})}
    v6.frame4 = react.createElement("Frame", v7, v9)
    local createElement_3 = react.createElement
    v7 = {
        TextScaled = true,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Light, Enum.FontStyle.Normal),
        Text = string.upper(p1.Name),
        TextColor3 = Color3.fromRGB(229, 229, 229),
        TextSize = useTextScale()(14),
    }
    if not p1.IsBottomRight then
        v9 = Vector2.new(0.5, 0)
    else
        v9 = Vector2.new(1, 0)
    end
    v7.AnchorPoint = v9
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    if not p1.IsBottomRight then
        v9 = UDim2.fromScale(0.5, 2.53)
    else
        v9 = UDim2.fromScale(1, 2.53)
    end
    v7.Position = v9
    v7.Size = UDim2.fromOffset(200, 15)
    if not p1.IsBottomRight then
        Right = Enum.TextXAlignment.Center
    else
        Right = Enum.TextXAlignment.Right
        if not Right then
            Right = Enum.TextXAlignment.Center
        end
    end
    v7.TextXAlignment = Right
    v6.textLabel = createElement_3("TextLabel", v7)
    v4.Group = createElement_2(TransparencyGroup, v5, v6)
    return createElement(v1, v2, v4)
end