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
-- File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Vow.VowCategory
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_4:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Utilities = script.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
return function(p1) -- Line: 37 -- upvalues: useMotion (val), useTheme (val), useTextScale (val), useRem (val), react (val), Color (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(1.5)
    v2, u8 = useMotion(0)
    local v3 = useTheme()
    local v4 = useRem()
    react.useEffect(function() -- Line: 45 -- upvalues: p1 (val), u4 (val)
        if not p1.Enabled then
            u4:immediate(1.5)
            return
        end
        u4:spring(0.5)
    end, {p1.Enabled})
    react.useEffect(function() -- Line: 54 -- upvalues: u8 (val)
        u8:spring(0, {impulse = 0.5, tension = 200, friction = 12})
    end, {p1.Label})
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 6,
        BackgroundColor3 = v3.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.336),
        Size = UDim2.new(0.96, 0, 0, v4(250)),
    }
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.749})}
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Rotation = v2,
    }
    local v8 = {}
    local v9 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1:map(function(p1) -- Line: 96
            return UDim2.fromScale(0.5, p1)
        end),
        Size = UDim2.fromScale(1, 1),
    }
    local v10 = {Icon = react.createElement("ImageLabel", {
        Image = "rbxassetid://11419715564",
        ImageTransparency = 0.9,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.432),
        Size = UDim2.fromOffset(111, 111),
        ImageColor3 = v3.Primary,
    })}
    local v11 = {
        Image = "rbxassetid://92385662241240",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ImageColor3 = Color.Darken(v3.Bar, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.495, 0.837),
    }
    local v12 = v4(152)
    v11.Size = UDim2.fromOffset(v12, v4(47))
    v10.Backpanel = react.createElement("ImageLabel", v11, {Name = react.createElement("TextLabel", {
        TextTransparency = 0.21,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = "Vow of " .. p1.Label,
        TextColor3 = v3.Primary,
        TextSize = useTextScale()(15),
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.489),
        Size = UDim2.fromOffset(124, 17),
    })})
    v10.Background = react.createElement("ImageLabel", {
        Image = "rbxassetid://121732085163959",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(36, 38, 45),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.495, 0.5),
        Size = UDim2.fromScale(0.96, 0.96),
    })
    v11 = {
        Image = "rbxassetid://118601874567169",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        ImageColor3 = Color.Darken(v3.Bar, 0.2),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.495, 0.837),
    }
    v12 = v4(152)
    v11.Size = UDim2.fromOffset(v12, v4(47))
    v10.Border = react.createElement("ImageLabel", v11)
    v10.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v10.Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.749})
    v8.Card = react.createElement("Frame", v9, v10)
    v6.Clipping = react.createElement("Frame", v7, v8)
    return react.createElement("Frame", v5, v6)
end