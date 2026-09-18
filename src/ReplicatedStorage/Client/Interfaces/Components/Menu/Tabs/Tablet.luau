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
--         File: ReplicatedStorage.Client.Interfaces.Components.Menu.Tabs.Tablet
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  6 functions

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
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives:WaitForChild("Hitbox"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local u86 = Color3.fromRGB(255, 255, 255)
return react.memo(function(p1) -- Line: 42 -- upvalues: useRem (val), useTheme (val), useMotion (val), react (val), u86 (val), Hitbox (val)
    local SemiBold, u12, v1, v2
    local v3 = useRem()
    local u4 = useTheme()
    if not p1.Selected then
        v2 = 1
    else
        v2 = 0
    end
    v1, u12 = useMotion(v2)
    react.useEffect(function() -- Line: 48 -- upvalues: u12 (val), p1 (val)
        local v1
        if not p1.Selected then
            v1 = 1
        else
            v1 = 0
        end
        u12:spring(v1)
    end, {p1.Selected})
    local v4 = p1.ShowDivider ~= false
    local v5 = {Shell = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = u4.Container.Background,
    }, {Overlay = react.createElement("ImageLabel", {
        Image = "rbxassetid://16255699706",
        ImageTransparency = 0.978,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 1,
        ImageColor3 = Color3.fromRGB(149, 197, 255),
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.fromScale(1, 1),
    })})}
    if v4 then
        v5.Divider = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.new(0, 1, 1, 0),
            BackgroundColor3 = u4.Container.Stroke,
        })
    end
    v5.SelectionBar = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = u86,
        BackgroundTransparency = v1:map(function(p1) -- Line: 91
            return p1
        end),
    })
    v5.Hitbox = react.createElement(Hitbox, {Enabled = true, Clicked = p1.Clicked})
    local createElement = react.createElement
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, v3(34))
    local v8 = {}
    local createElement_2 = react.createElement
    local v9 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
    }
    local new = Font.new
    if not p1.Selected then
        SemiBold = Enum.FontWeight.Regular
    else
        SemiBold = Enum.FontWeight.SemiBold
        if not SemiBold then
            SemiBold = Enum.FontWeight.Regular
        end
    end
    v9.FontFace = new("rbxasset://fonts/families/SourceSansPro.json", SemiBold)
    v9.Text = p1.Text
    v9.TextColor3 = v1:map(function(p1) -- Line: 117 -- upvalues: u86 (upval), u4 (val)
        return u86:Lerp(u4.Primary, p1)
    end)
    v9.TextTransparency = v1:map(function(p1) -- Line: 122
        return 0.5 * p1
    end)
    v9.TextYAlignment = Enum.TextYAlignment.Center
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.AutomaticSize = Enum.AutomaticSize.X
    v9.Position = UDim2.fromScale(0.5, 0.5)
    local v10 = UDim2.fromScale(1, 0)
    v9.Size = v10 + UDim2.fromOffset(0, v3(18))
    v8.Label = createElement_2("TextLabel", v9)
    v8.Layout = react.createElement("UIListLayout", {
        ItemLineAlignment = Enum.ItemLineAlignment.Center,
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v5.Content = createElement("Frame", v6, v8)
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = p1.LayoutOrder or 1,
    }, v5)
end)