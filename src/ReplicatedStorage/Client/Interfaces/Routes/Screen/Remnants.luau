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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Remnants
--                               Dumped in 0.00265 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local Rarities = require(Enchantments:WaitForChild("Rarities"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_2:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_5:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local Components_6 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_6:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local function Card(p1) -- Line: 34 -- upvalues: useMotion (val), useRem (val), useTheme (val), useToast (val), useAlertPopup (val), Vitality (val), react (val), Frame (val), Color (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(0)
    local v3 = useRem()
    local v4 = useTheme()
    local u14 = useToast()
    local u17 = useAlertPopup(function(a1) -- Line: 47 -- upvalues: Vitality (upval), p1 (val), u14 (val)
        if not a1 then
            return
        end
        Vitality.Remenants.post(p1.Label)
        u14({type = "info", message = ("Attempting to spend %* remnants..."):format(p1.Price)})
    end)
    local v5 = {ClipsDescendants = false, LayoutOrder = p1.Index, Visible = true}
    local v6 = v3(202)
    v5.Size = UDim2.fromOffset(v6, v3(256))
    v5[react.Event.MouseEnter] = function(...) -- Line: 66 -- upvalues: u4 (val), u8 (val)
        local v1
        u4:spring(-10)
        local v2 = {tension = 200, friction = 12}
        if math.random(1, 2) ~= 1 then
            v1 = 1
        else
            v1 = -1
        end
        v2.impulse = 0.15 * v1
        u8:spring(0, v2)
    end
    v5[react.Event.MouseLeave] = function(...) -- Line: 75 -- upvalues: u4 (val), u8 (val)
        u4:spring(0)
        u8:spring(0)
    end
    local v7 = {}
    local v8 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 2,
    }
    v8[react.Event.MouseButton1Click] = function(...) -- Line: 88 -- upvalues: u17 (val), p1 (val)
        local v1 = ("This will spend %* remnants and you will not be able to undo this action."):format(p1.Price)
        u17("Spend Remnants", v1, p1.Color)
    end
    v7.Button = react.createElement("TextButton", v8)
    v8 = {
        BackgroundTransparency = 0,
        BackgroundColor3 = v4.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = v1:map(function(p1) -- Line: 102
            local v1 = UDim2.fromScale(1, 1)
            return v1 + UDim2.fromOffset(p1, p1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Rotation = v2:map(function(p1) -- Line: 108
            return p1
        end),
    }
    local v9 = {imageLabel = react.createElement("ImageLabel", {
        Image = "rbxassetid://121732085163959",
        ImageTransparency = 0.975,
        BackgroundTransparency = 1,
        ImageColor3 = v4.Primary,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }), uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), price = react.createElement("TextLabel", {
        TextSize = 75,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        TextTransparency = 0.7,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = ("%*"):format(p1.Price),
        TextColor3 = v4.Primary,
        TextYAlignment = Enum.TextYAlignment.Center,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    })}
    local v10 = {
        Image = "rbxassetid://92385662241240",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ImageTransparency = 0,
        ImageColor3 = Color.Darken(v4.Bar, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.495, 0.837),
    }
    local v11 = v3(152)
    v10.Size = UDim2.fromOffset(v11, v3(47))
    v9.imageLabel2 = react.createElement("ImageLabel", v10, {TextLabel = react.createElement("TextLabel", {
        TextSize = 17,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        TextTransparency = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.Label,
        TextColor3 = v4.Primary,
        TextYAlignment = Enum.TextYAlignment.Center,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    })})
    v10 = {
        Image = "rbxassetid://118601874567169",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        ImageTransparency = 0,
        ImageColor3 = Color.Darken(v4.Bar, 0.2),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(443, 190, 443, 190),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.495, 0.837),
    }
    v11 = v3(152)
    v10.Size = UDim2.fromOffset(v11, v3(47))
    v9.imageLabel3 = react.createElement("ImageLabel", v10)
    v10 = {
        BorderSizePixel = 0,
        ZIndex = 2,
        Visible = true,
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = p1.Color,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.0759),
    }
    local v12 = {}
    local v13 = {Rotation = -90}
    local v14 = {}
    local v15 = NumberSequenceKeypoint.new(0, 0)
    local v16 = NumberSequenceKeypoint.new(0.362, 0.761)
    v14[1] = v15
    v14[2] = v16
    v14[3] = NumberSequenceKeypoint.new(1, 1)
    v13.Transparency = NumberSequence.new(v14)
    v12.uIGradient = react.createElement("UIGradient", v13)
    v12.uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v9.frame = react.createElement("Frame", v10, v12)
    v7.Card = react.createElement(Frame, v8, v9)
    return react.createElement(Frame, v5, v7)
end
return function() -- Line: 230 -- upvalues: react (val), useRem (val), useToast (val), Vitality (val), DynamicPage (val), PageLayout (val), Frame (val), HorizontalListLayout (val), Card (val), Rarities (val), Progress (val)
    local u14, u4, u9, v1, v2, v3
    v1, u4 = react.useState(false)
    v2, u9 = react.useState(0)
    v3, u14 = react.useState(0)
    local u18 = useToast()
    react.useEffect(function() -- Line: 238 -- upvalues: Vitality (upval), u4 (val), u9 (val), u14 (val), u18 (val)
        Vitality.Remenants.listen(function(p1) -- Line: 239 -- upvalues: u4 (upval), u9 (upval), u14 (upval), u18 (upval)
            u4(true)
            u9(p1.total)
            u14(p1.amount)
            if p1.amount == p1.total then
                u18({message = "You have spent all your remnants.", type = "success"})
                u4(false)
            end
            local v1 = p1.total - p1.amount
            if v1 < 1 then
                u18({message = "You have spent all available remnants", type = "success"})
                u4(false)
            end
        end)
    end, {})
    local v4 = {}
    local v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.8, 0.8), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    local v6 = {Layout = react.createElement(PageLayout, {}), Selections = react.createElement(Frame, {LayoutOrder = 1, Size = UDim2.fromScale(1, 0.3)}, {
        Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Center}),
        Epic = react.createElement(Card, {
            Price = 20,
            Label = "Epic",
            Index = 2,
            Enabled = true,
            Color = Rarities.Colors[Rarities.Rarities.Epic],
        }),
        Rare = react.createElement(Card, {Price = 10, Label = "Rare", Index = 3, Color = Rarities.Colors[Rarities.Rarities.Rare]}),
        Uncommon = react.createElement(Card, {
            Price = 5,
            Label = "Uncommon",
            Index = 4,
            Enabled = true,
            Color = Rarities.Colors[Rarities.Rarities.Uncommon],
        }),
        Common = react.createElement(Card, {Price = 1, Label = "Common", Index = 5, Color = Rarities.Colors[Rarities.Rarities.Common]}),
        Random = react.createElement(Card, {Price = 8, Label = "Random", Index = 7, Color = Rarities.Colors[Rarities.Rarities.Unique]}),
    })}
    local v7 = {Header = "Remnants Progress", Animated = true, Value = v3 / v2, Body = ("You have spent %* of %* remnants."):format(v3, v2)}
    local v8 = {LayoutOrder = 2}
    local v9 = UDim2.fromScale(1.125, 0)
    v8.Size = v9 + UDim2.fromOffset(0, useRem()(90))
    v7.Native = v8
    v6.Progress = react.createElement(Progress, v7)
    v4.Content = react.createElement("Frame", v5, v6)
    return react.createElement(DynamicPage, {Enabled = v1}, v4)
end