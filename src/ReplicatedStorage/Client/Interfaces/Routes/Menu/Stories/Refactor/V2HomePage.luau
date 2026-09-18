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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Refactor.V2HomePage
--                               Dumped in 0.00145 seconds
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
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
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
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components = Interfaces_5:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local Home = script.Parent:WaitForChild("Home")
local InventoryPage = require(Home:WaitForChild("InventoryPage"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_2 = Interfaces_6:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_3 = Interfaces_7:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_4 = Interfaces_8:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local Label = require(Primitives_2:WaitForChild("Label"))
local function Vital(p1) -- Line: 35 -- upvalues: useRem (val), useTextScale (val), react (val), Label (val), Progress (val)
    local v1 = useRem()
    local v2 = useTextScale()
    local v3 = {BackgroundTransparency = 1}
    local v4 = UDim2.fromScale(0.25, 1)
    v3.Size = v4 - UDim2.fromOffset(2.5, 0)
    v3.LayoutOrder = p1.LayoutOrder or 0
    local v5 = {}
    local v6 = {BackgroundTransparency = 1, Image = p1.Icon}
    local ImageColor = p1.ImageColor
    if not ImageColor then
        ImageColor = p1.Color
    end
    v6.ImageColor3 = ImageColor
    local v7 = v1(28)
    v6.Size = UDim2.fromOffset(v7, v1(28))
    v6.AnchorPoint = Vector2.new(0, 0.5)
    v7 = UDim2.fromScale(0, 0.5)
    local v8 = v1(10)
    v6.Position = v7 + UDim2.fromOffset(v8, 0)
    v6.ResampleMode = Enum.ResamplerMode.Default
    v5.Icon = react.createElement("ImageLabel", v6)
    v6 = {TextTransparency = 0, TextWrapped = true, Text = p1.Name}
    v7 = v2(25)
    v6.TextSize = math.min(v7, 20)
    v6.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    v6.TextXAlignment = Enum.TextXAlignment.Left
    v6.TextYAlignment = Enum.TextYAlignment.Center
    v6.AnchorPoint = Vector2.new(0, 0.5)
    v7 = UDim2.fromScale(0, 0.5)
    v8 = v1(55)
    v6.Position = v7 + UDim2.fromOffset(v8, -v1(10))
    v5.Name = react.createElement(Label, v6)
    v6 = {
        Display = true,
        Value = p1.Value,
        Color = p1.Color,
        Range = {Min = 0, Max = 100},
    }
    local v9 = {BackgroundTransparency = 1}
    local v10 = UDim2.fromScale(1, 0)
    local v11 = -v1(40)
    v9.Size = v10 + UDim2.fromOffset(v11, 0)
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v10 = UDim2.fromScale(0, 0.5)
    v11 = v1(40)
    v9.Position = v10 + UDim2.fromOffset(v11, v1(15))
    v6.Native = v9
    v5.Bar = react.createElement(Progress, v6)
    return react.createElement("Frame", v3, v5)
end
local function Divider(p1) -- Line: 98 -- upvalues: useTheme (val), react (val)
    local v1, v2
    local v3 = useTheme()
    if p1.Type ~= "Horizontal" then
        v2 = UDim2.fromScale(1, 0)
        v1 = v2 + UDim2.fromOffset(0, p1.Thickness)
    else
        v2 = UDim2.fromScale(0, 0.5)
        v1 = v2 + UDim2.fromOffset(p1.Thickness, 0)
        if not v1 then
            v2 = UDim2.fromScale(1, 0)
            v1 = v2 + UDim2.fromOffset(0, p1.Thickness)
        end
    end
    local v4 = {BackgroundTransparency = 0.98, BorderSizePixel = 0, Size = v1, BackgroundColor3 = v3.Divider.Primary}
    local Position = p1.Position
    if not Position then
        Position = UDim2.fromScale(0, 0)
    end
    v4.Position = Position
    v4.LayoutOrder = p1.LayoutOrder or 0
    return react.createElement("Frame", v4, {})
end
local function Splitter(p1) -- Line: 116 -- upvalues: react (val), Divider (val)
    return react.createElement(Divider, {Type = "Horizontal", Thickness = 2, Position = UDim2.fromScale(0, 0), LayoutOrder = p1.LayoutOrder or 0})
end
return function() -- Line: 125 -- upvalues: useMenuPage (val), useRem (val), useTheme (val), react (val), TransparencyGroup (val), Content (val), Divider (val), Vital (val), Splitter (val), InventoryPage (val)
    local Home = useMenuPage("Home")
    local v1 = useRem()
    local v2 = useTheme()
    local v3 = {
        Enabled = Home,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v4 = {}
    local v5 = {}
    local v6 = {BackgroundTransparency = 1}
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, v1(100))
    v5.Top = react.createElement("Frame", v6, {Top = react.createElement(Divider, {Type = "Vertical", Thickness = 2, Position = UDim2.fromScale(0, 0)}), Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5),
        }),
        Hunger = react.createElement(Vital, {
            Name = "Hunger",
            Max = 100,
            Value = 50,
            Icon = "rbxassetid://136925194391463",
            LayoutOrder = 0,
            Color = Color3.fromRGB(244, 174, 83),
        }),
        Splitter = react.createElement(Splitter, {LayoutOrder = 1}),
        Thirst = react.createElement(Vital, {
            Name = "Thirst",
            Max = 100,
            Value = 50,
            Icon = "rbxassetid://11295273090",
            LayoutOrder = 2,
            Color = Color3.fromRGB(83, 157, 244),
        }),
        Splitter2 = react.createElement(Splitter, {LayoutOrder = 3}),
        Temperature = react.createElement(Vital, {
            Name = "Temperature",
            Max = 100,
            Value = 50,
            Icon = "rbxassetid://71079401665365",
            LayoutOrder = 4,
            Color = v2.Bar,
            ImageColor = Color3.fromRGB(255, 255, 255),
        }),
        Splitter3 = react.createElement(Splitter, {LayoutOrder = 5}),
        Weight = react.createElement(Vital, {
            Name = "Weight",
            Max = 100,
            Value = 50,
            Icon = "rbxassetid://127565701450513",
            LayoutOrder = 6,
            Color = v2.Bar,
            ImageColor = Color3.fromRGB(255, 255, 255),
        }),
    }), Bottom = react.createElement(Divider, {Type = "Vertical", Thickness = 2, Position = UDim2.fromScale(0, 1)})})
    v6 = {BackgroundTransparency = 1}
    v7 = UDim2.fromScale(1, 1)
    v6.Size = v7 + UDim2.fromOffset(0, -v1(10))
    v7 = UDim2.fromScale(0.5, 0)
    v6.Position = v7 + UDim2.fromOffset(0, v1(115))
    v6.AnchorPoint = Vector2.new(0.5, 0)
    v5.Bottom = react.createElement("Frame", v6, {Inventory = react.createElement(InventoryPage, {}), react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.93})})
    v4.Content = react.createElement(Content, {}, v5)
    return react.createElement(TransparencyGroup, v3, v4)
end