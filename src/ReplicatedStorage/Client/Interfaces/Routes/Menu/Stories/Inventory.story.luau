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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Inventory.story
--                               Dumped in 0.00282 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_3:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_4:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local ItemViewport = require(Universal_2:WaitForChild("ItemViewport"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
require(Universal_3:WaitForChild("Progress"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_7:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local Storybox = require(Universal_4:WaitForChild("Storybox"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_5 = Components_9:WaitForChild("Universal")
local Checkbox = require(Universal_5:WaitForChild("Checkbox"))
local Components_10 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_6 = Components_10:WaitForChild("Universal")
local Form = require(Universal_6:WaitForChild("Form"))
local Components_11 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_3 = Components_11:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Components_12 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_12:WaitForChild("Utilities")
local Theme = require(Utilities_2:WaitForChild("Theme"))
local Components_13 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_13:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local u338 = {}
local v3 = {
    Name = "Musket",
    Id = 1,
    Description = "A standard mility musket, used for long range combat.",
    Position = Vector2.new(1, 1),
    Size = Vector2.new(1, 1),
    Meta = {1},
    Tags = {"Military Grade", "Identifier"},
}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Tools = Assets:WaitForChild("Tools")
local Firearms = Tools:WaitForChild("Firearms")
v3.Model = Firearms:WaitForChild("Musket")
local v4 = {
    Name = "Bandage",
    Id = 1,
    Description = "A standard bandage, used for medical purposes.",
    Position = Vector2.new(1, 1),
    Size = Vector2.new(1, 1),
    Meta = {1},
    Tags = {"Medical Grade"},
}
local Assets_2 = ReplicatedStorage:WaitForChild("Assets")
local Tools_2 = Assets_2:WaitForChild("Tools")
local Medical = Tools_2:WaitForChild("Medical")
v4.Model = Medical:WaitForChild("Bandage")
local v5 = {
    Name = "Compass",
    Id = 1,
    Description = "A navigation tool, used for finding your way.",
    Position = Vector2.new(1, 1),
    Size = Vector2.new(1, 1),
    Meta = {1},
}
local Assets_3 = ReplicatedStorage:WaitForChild("Assets")
local Tools_3 = Assets_3:WaitForChild("Tools")
local Exploration = Tools_3:WaitForChild("Exploration")
v5.Model = Exploration:WaitForChild("Compass")
u338[1] = v3
u338[2] = v4
u338[3] = v5
local function InventoryItem(p1) -- Line: 101 -- upvalues: useRem (val), useTheme (val), useConstants (val), useTextScale (val), react (val), useMotion (val), Badge (val), Color (val), ItemViewport (val), Button (val)
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
            v5[v] = react.createElement(Badge, {Scale = 0.95, Outline = true, Text = v})
        end
    end
    react.useEffect(function() -- Line: 125 -- upvalues: u12 (val), u17 (val), u2 (val)
        if u12 then
            u17:spring(u2(0))
            return
        end
        u17:spring(u2(15))
    end, {u12})
    local v6 = {LayoutOrder = 1}
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, u2(85))
    v6.BackgroundTransparency = v2.PageTransparency
    v6.BackgroundColor3 = PageBackground
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
    v9[react.Event.MouseEnter] = function() -- Line: 149 -- upvalues: u13 (val)
        u13(true)
    end
    v9[react.Event.MouseLeave] = function() -- Line: 153 -- upvalues: u13 (val)
        u13(false)
    end
    v8.Hitbox = react.createElement("TextButton", v9)
    v9 = {BackgroundTransparency = 0}
    local v10 = u2(70)
    v9.Size = UDim2.fromOffset(v10, u2(70))
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v10 = UDim2.fromScale(0, 0.5)
    local v11 = u2(10)
    v9.Position = v10 + UDim2.fromOffset(v11, 0)
    v9.BackgroundColor3 = Color.Darken(PageBackground, 0.9)
    v8.Viewport = react.createElement("Frame", v9, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), Viewport = react.createElement(ItemViewport, {
        Spins = true,
        Model = p1.Item.Model,
        Native = {Size = UDim2.fromScale(0.95, 0.95)},
    })})
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(70)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.Text = p1.Item.Name
    v9.TextColor3 = Color.Darken(v2.Primary, 0.8)
    v9.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextSize = v4(v3.TextSize.Header)
    v10 = UDim2.fromScale(0, 0)
    v11 = u2(90)
    v9.Position = v10 + UDim2.fromOffset(v11, u2(10))
    v8.Header = react.createElement("TextLabel", v9)
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(70)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.Text = p1.Item.Description
    v9.TextColor3 = Color.Darken(v2.Primary, 0.6)
    v9.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v9.TextSize = v4(v3.TextSize.Body)
    v10 = UDim2.fromScale(0, 0)
    v11 = u2(90)
    v9.Position = v10 + UDim2.fromOffset(v11, u2(25))
    v8.Body = react.createElement("TextLabel", v9)
    v9 = {BackgroundTransparency = 1}
    v10 = UDim2.fromScale(1, 0)
    v11 = -u2(500)
    v9.Size = v10 + UDim2.fromOffset(v11, u2(20))
    v9.AnchorPoint = Vector2.new(1, 0.5)
    v9.Position = v1:map(function(p1) -- Line: 212 -- upvalues: u2 (val)
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
    }), Button = react.createElement(Button, {Text = "Equip", Padding = "Medium", Type = 1, Transparency = v1:map(function(p1) -- Line: 230
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
    return react.createElement("Frame", v6, v8)
end
return QuickStory(Theme.getStoryControls(), function(p1) -- Line: 251 -- upvalues: react (val), Storybox (val), Frame (val), Form (val), TextInput (val), DropdownInput (val), Checkbox (val), InventoryItem (val), u338 (val)
    local v1 = {Left = react.createElement(Frame, {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(0.5, 1)}, {})}
    local v2 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.75, 0), Size = UDim2.fromScale(0.5, 1)}
    local v3 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}
    local v4 = {
        Native = {
            LayoutOrder = 2,
            ZIndex = 10,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.06),
        },
    }
    local v5 = {Left = react.createElement(Form.Divider, {
        Side = "Left",
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.6, 1)},
    }, {Search = react.createElement(TextInput, {
        Header = "Search",
        Placeholder = "Search",
        Layout = 3,
        Outlined = false,
        Width = "Small",
        Height = 50,
        Native = {BackgroundTransparency = 1},
    })}), Right = react.createElement(Form.Divider, {
        Side = "Right",
        Native = {Size = UDim2.fromScale(0.1, 1)},
    }, {Dropdown = react.createElement(DropdownInput, {
        Visible = true,
        Length = 190,
        Options = {
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
        Native = {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromScale(0.5, 0)},
    }), Box = react.createElement(Checkbox, {
        Label = "Tags",
        Default = true,
        Native = {LayoutOrder = 3},
    })})}
    v3[1] = (react.createElement(Form.Form, v4, v5))
    v3.Content = react.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        ScrollBarThickness = 3,
        Size = UDim2.fromScale(1, 0.85),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 5),
    }), Item = react.createElement(InventoryItem, {Item = u338[1]}), Item2 = react.createElement(InventoryItem, {Item = u338[2]}), Item3 = react.createElement(InventoryItem, {Item = u338[3]})}, {})
    v1.Right = react.createElement(Frame, v2, v3)
    return react.createElement(Storybox, {}, v1)
end)