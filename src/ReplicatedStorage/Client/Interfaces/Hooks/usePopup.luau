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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.usePopup
--                               Dumped in 0.00138 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u46 = require(Packages_2:WaitForChild("react-roblox"))
local Components = v1.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local useConstants = require(v1.Parent:WaitForChild("useConstants"))
local useMotion = require(v1.Parent:WaitForChild("useMotion"))
local useRem = require(v1.Parent:WaitForChild("useRem"))
local Error = require(v1.Parent.Parent:WaitForChild("Error"))
local function lerp(p1, p2, p3) -- Line: 42
    return p1 + (p2 - p1) * p3
end
local function PopupPortal(p1) -- Line: 48 -- upvalues: useMotion (val), useRem (val), useConstants (val), react (val), Players (val), u46 (val), Error (val), lerp (val), Color (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(0.95)
    v2, u8 = useMotion(1)
    local v3 = useRem()
    local v4 = useConstants()
    react.useEffect(function() -- Line: 59 -- upvalues: p1 (val), u4 (val), u8 (val)
        if p1.visible then
            u4:spring(1, {frequency = 0.2})
            u8:spring(0, {frequency = 0.4})
            return
        end
        u4:spring(0.95, {frequency = 0.2})
        u8:spring(1, {frequency = 0.4})
    end, {p1.visible})
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local v5 = {
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        Name = "PopupPortal",
        DisplayOrder = 100,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Enabled = p1.visible,
    }
    local v6 = {}
    local v7 = {}
    local v8 = {
        BorderSizePixel = 0,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v2:map(function(p1) -- Line: 84 -- upvalues: lerp (upval)
            return lerp(0.3, 1, p1)
        end),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v1:map(function(p1) -- Line: 92
            local v1 = 0.95 < p1
            return v1
        end),
    }
    local v9 = {}
    local v10 = {Image = "rbxassetid://17812826389", BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 0}
    local color = p1.color
    if not color then
        color = Color3.fromRGB(255, 255, 255)
    end
    v10.ImageColor3 = Color.Darken(color, 0.3)
    v10.ImageTransparency = v2:map(function(p1) -- Line: 99 -- upvalues: lerp (upval)
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
        ImageTransparency = v2:map(function(p1) -- Line: 117 -- upvalues: lerp (upval)
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
        Size = UDim2.fromScale(0.35, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = p1.visible,
    }
    local v11 = {Scale = react.createElement("UIScale", {Scale = v1}), Shadow = react.createElement("ImageLabel", {
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
    local v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(9, 10, 13),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.496),
        Size = UDim2.fromScale(1, 0.996),
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    local v13 = {Padding = react.createElement("UIPadding", v4.Padding.Universal.Large)}
    local v14 = {Transparency = 0.2, Thickness = 1}
    local color_2 = p1.color
    if not color_2 then
        color_2 = Color3.fromRGB(255, 255, 255)
    end
    v14.Color = Color.Darken(color_2, 0.1)
    v13.Stroke = react.createElement("UIStroke", v14)
    v13.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 15)})
    v14 = {BackgroundTransparency = 0, BorderSizePixel = 0, ZIndex = 2, AnchorPoint = Vector2.new(0.5, 0)}
    local color_3 = p1.color
    if not color_3 then
        color_3 = Color3.fromRGB(255, 255, 255)
    end
    v14.BackgroundColor3 = color_3
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local v15 = UDim2.fromScale(0.5, 0)
    v14.Position = v15 + UDim2.fromOffset(0, -v4.Padding.Sizes.Large)
    v15 = UDim2.fromScale(1, 0)
    v14.Size = v15 + UDim2.fromOffset(v4.Padding.Sizes.Large * 2, v3(125))
    local v16 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 15)})}
    local v17 = {Rotation = 90}
    local v18 = {}
    local v19 = NumberSequenceKeypoint.new(0, 0.884)
    v18[1] = v19
    v18[2] = NumberSequenceKeypoint.new(1, 1)
    v17.Transparency = NumberSequence.new(v18)
    v16.Gradient = react.createElement("UIGradient", v17)
    v13.Gradient = react.createElement("Frame", v14, v16)
    v11.Content = react.createElement("Frame", v12, v13, p1.content)
    v9.Popup = react.createElement("Frame", v10, v11)
    v7.Page = react.createElement("Frame", v8, v9)
    v6[1] = react.createElement(Error.Boundary, {}, v7)
    local v20 = react.createElement("ScreenGui", v5, v6)
    return u46.createPortal(v20, PlayerGui)
end
return function() -- Line: 218 -- upvalues: react (val), PopupPortal (val)
    local u17, u18, u3, u4, u8, u9
    u3, u4 = react.useState(false)
    u8, u9 = react.useState({})
    u17, u18 = react.useState(Color3.fromRGB(255, 255, 255))
    local v1 = react.useCallback(function(p1, p2) -- Line: 223 -- upvalues: u9 (val), u18 (val), u4 (val)
        u9(p1)
        if p2 and p2.color then
            u18(p2.color)
        end
        u4(true)
    end, {})
    local u28 = react.useCallback(function() -- Line: 231 -- upvalues: u4 (val)
        u4(false)
    end, {})
    local v2 = {u3, u17, u8}
    return v1, u28, (react.useMemo(function() -- Line: 235 -- upvalues: react (upval), PopupPortal (upval), u3 (val), u17 (val), u8 (val), u28 (val)
    local v3
    v3 = {}
    v3.visible = u3
    v3.color = u17
    v3.content = u8
    v3.onClose = u28
    return react.createElement(PopupPortal, v3)
end, v2))
end