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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Refactor.Home.InventoryPage
--                               Dumped in 0.00445 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local CharacterViewport = require(Universal:WaitForChild("CharacterViewport"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Badge = require(Universal_2:WaitForChild("Badge"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs_2 = Components_5:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local ItemViewport = require(Universal_3:WaitForChild("ItemViewport"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs_3 = Components_7:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_8 = Interfaces_9:WaitForChild("Components")
local Utilities = Components_8:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_13:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local u363 = {}
local v2 = {
    Name = "Bandage",
    Id = 1,
    Description = "A standard bandage, used for medical purposes.",
    Position = Vector2.new(1, 1),
    Size = Vector2.new(1, 1),
    Meta = {1},
}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Tools = Assets:WaitForChild("Tools")
local Medical = Tools:WaitForChild("Medical")
v2.Model = Medical:WaitForChild("Bandage")
local v3 = {
    Name = "Compass",
    Id = 1,
    Description = "A navigation tool, used for finding your way.",
    Position = Vector2.new(1, 1),
    Size = Vector2.new(1, 1),
}
local v4 = {1}
v3.Meta = v4
local Assets_2 = ReplicatedStorage:WaitForChild("Assets")
local Tools_2 = Assets_2:WaitForChild("Tools")
local Exploration = Tools_2:WaitForChild("Exploration")
v3.Model = Exploration:WaitForChild("Compass")
u363[1] = v2
u363[2] = v3
local function InventoryItem(p1) -- Line: 76 -- upvalues: useRem (val), useTheme (val), useConstants (val), useTextScale (val), react (val), useMotion (val), Badge (val), Color (val), ItemViewport (val), Button (val)
    local u12, u13, u17, v1
    local u2 = useRem()
    local v2 = useTheme()
    local v3 = useConstants()
    local v4 = useTextScale()
    u12, u13 = react.useState(false)
    v1, u17 = useMotion(0)
    local PageBackground = v2.PageBackground
    local v5 = {}
    if p1.Item.Tags then
        for k, v in pairs(p1.Item.Tags) do
            v5[v] = react.createElement(Badge, {
                Scale = 0.95,
                Outline = true,
                Text = v,
                TextColor = Color3.fromRGB(180, 180, 180),
                Color = Color3.fromRGB(75, 75, 75),
            })
        end
    end
    react.useEffect(function() -- Line: 103 -- upvalues: u12 (val), u17 (val), u2 (val)
        if u12 then
            u17:spring(u2(0))
            return
        end
        u17:spring(u2(15))
    end, {u12})
    local createElement = react.createElement
    local v6 = {BackgroundTransparency = 0, LayoutOrder = 1}
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, u2(100))
    v6.BackgroundColor3 = v2.Container.Background
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
    v9[react.Event.MouseEnter] = function() -- Line: 127 -- upvalues: u13 (val)
        u13(true)
    end
    v9[react.Event.MouseLeave] = function() -- Line: 131 -- upvalues: u13 (val)
        u13(false)
    end
    v8.Hitbox = react.createElement("TextButton", v9)
    v9 = {BackgroundTransparency = 1}
    local v10 = u2(70)
    v9.Size = UDim2.fromOffset(v10, u2(70))
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v10 = UDim2.fromScale(0, 0.5)
    local v11 = u2(15)
    v9.Position = v10 + UDim2.fromOffset(v11, 0)
    v9.BackgroundColor3 = Color.Darken(PageBackground, 0.9)
    local v12 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), Viewport = react.createElement(ItemViewport, {
        Spins = true,
        Model = p1.Item.Model,
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.95, 0.95)},
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})}
    v8.Viewport = react.createElement("Frame", v9, v12)
    local createElement_2 = react.createElement
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(70)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.Text = p1.Item.Name
    v9.TextColor3 = Color.Darken(v2.Primary, 0.8)
    v9.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextSize = v4(v3.TextSize.Header)
    if not p1.Item.Tags then
        v10 = UDim2.fromScale(0, 0.5)
        v11 = u2(100)
        v12 = v10 + UDim2.fromOffset(v11, u2(-8))
    else
        v10 = UDim2.fromScale(0, 0)
        v11 = u2(90)
        v12 = v10 + UDim2.fromOffset(v11, u2(10))
    end
    v9.Position = v12
    if p1.Item.Tags then
        v12 = nil
    else
        v12 = Vector2.new(0, 0.5)
    end
    v9.AnchorPoint = v12
    v8.Header = createElement_2("TextLabel", v9)
    local createElement_3 = react.createElement
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(70)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.Text = p1.Item.Description
    v9.TextColor3 = Color.Darken(v2.Primary, 0.6)
    v9.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextSize = v4(v3.TextSize.Body)
    if not p1.Item.Tags then
        v10 = UDim2.fromScale(0, 0.5)
        v11 = u2(100)
        v12 = v10 + UDim2.fromOffset(v11, u2(8))
    else
        v10 = UDim2.fromScale(0, 0)
        v11 = u2(90)
        v12 = v10 + UDim2.fromOffset(v11, u2(25))
    end
    v9.Position = v12
    if p1.Item.Tags then
        v12 = nil
    else
        v12 = Vector2.new(0, 0.5)
        if not v12 then
            v12 = nil
        end
    end
    v9.AnchorPoint = v12
    v8.Body = createElement_3("TextLabel", v9)
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(500)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.AnchorPoint = Vector2.new(1, 0.5)
    v9.Position = v1:map(function(p1) -- Line: 201 -- upvalues: u2 (val)
        local v1 = UDim2.fromScale(1, 0.5)
        local v2 = -u2(30)
        return v1 + UDim2.fromOffset(v2, p1)
    end)
    v9.Visible = u12
    v8.Options = react.createElement("Frame", v9, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    }), Button = react.createElement(Button, {Text = "Equip", Padding = "Medium", Type = 1, Transparency = v1:map(function(p1) -- Line: 219
        return p1 / 15
    end)})})
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(100)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v10 = UDim2.fromScale(0, 0)
    v11 = u2(90)
    v9.Position = v10 + UDim2.fromOffset(v11, u2(55))
    v8.Tags = react.createElement("Frame", v9, {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, Padding = UDim.new(0, 5)})}, v5)
    v8.Stroke = react.createElement("UIStroke", {Transparency = 0, Thickness = 1, Color = v2.Container.Stroke})
    return createElement("Frame", v6, v8)
end
return function() -- Line: 246 -- upvalues: useTheme (val), useRem (val), react (val), CharacterViewport (val), Frame (val), TextInput (val), DropdownInput (val), InventoryItem (val), u363 (val)
    local v1 = useTheme()
    local v2 = useRem()
    local v3 = {Left = react.createElement(CharacterViewport, {
        LookAtMouse = false,
        Native = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.5, 1)},
    })}
    local v4 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.5, 1)}
    local v5 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}
    local v6 = {
        LayoutOrder = 2,
        ZIndex = 10,
        BackgroundColor3 = v1.Container.Background,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, v2(50))
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Stroke = react.createElement("UIStroke", {Transparency = 0, Thickness = 1, Color = v1.Container.Stroke}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10)})}
    local v9 = {
        Header = "Search Items...",
        Placeholder = "Search",
        Layout = 3,
        Icon = "rbxassetid://11293977875",
        Outlined = false,
        Width = "Small",
    }
    local v10 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5)}
    local v11 = UDim2.fromScale(0, 0.5)
    local v12 = v2(6)
    v10.Position = v11 - UDim2.fromOffset(v12, 0)
    v10.Size = UDim2.fromScale(0.5, 1)
    v9.Native = v10
    v8.Search = react.createElement(TextInput, v9)
    v8.Dropdown = react.createElement(DropdownInput, {
        Visible = true,
        Default = "All Items",
        Full = true,
        Options = {
            "All Items",
            "Red",
            "Green",
            "Blue",
            "Yellow",
            "Purple",
            "Orange",
            "Black",
            "White",
            "Gray",
            "Brown",
            "Teal",
        },
        Selected = function(...) end,
        Native = {BackgroundTransparency = 1, LayoutOrder = 2, AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromScale(0.5, 1)},
    })
    v5.Header = react.createElement("Frame", v6, v8)
    v5.Content = react.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        ScrollBarThickness = 3,
        ClipsDescendants = false,
        Size = UDim2.fromScale(1, 0.85),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 5),
    }), Item = react.createElement(InventoryItem, {Item = u363[1]}), Item2 = react.createElement(InventoryItem, {Item = u363[2]})}, {})
    v3.Right = react.createElement(Frame, v4, v5)
    return react.createElement(react.Fragment, {}, v3)
end