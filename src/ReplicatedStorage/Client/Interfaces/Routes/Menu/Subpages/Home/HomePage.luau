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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.HomePage
--                               Dumped in 0.00187 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local Subpages = script.Parent:WaitForChild("Subpages")
local InventoryPage = require(Subpages:WaitForChild("InventoryPage"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local Label = require(Primitives_2:WaitForChild("Label"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Utilities = Components_4:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_6:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local function normalizeBodyTemperature(p1) -- Line: 43
    local v1 = (p1 - 83) / 30 * 100
    return (math.max(v1, 0))
end
local function normalizeVital(p1, p2) -- Line: 52
    if p2 <= 0 then
        return 0
    end
    local v1 = p1 / p2 * 100
    return (math.clamp(v1, 0, 100))
end
local function Vital(p1) -- Line: 62 -- upvalues: useRem (val), useTextScale (val), react (val), Label (val), Progress (val)
    local v1 = useRem()
    local v2 = useTextScale()
    local Range = p1.Range
    if not Range then
        Range = {Min = 0, Max = 100}
    end
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
    v6 = {Display = true, Value = p1.Value, Color = p1.Color, Range = Range}
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
local function Divider(p1) -- Line: 126 -- upvalues: useTheme (val), react (val)
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
local function Splitter(p1) -- Line: 144 -- upvalues: react (val), Divider (val)
    return react.createElement(Divider, {Type = "Horizontal", Thickness = 2, Position = UDim2.fromScale(0, 0), LayoutOrder = p1.LayoutOrder or 0})
end
return function(p1) -- Line: 157 -- upvalues: useMenuPage (val), useRem (val), useTheme (val), react (val), Players (val), useStore (val), Vitality (val), TransparencyGroup (val), Content (val), Divider (val), Vital (val), normalizeVital (val), Splitter (val), normalizeBodyTemperature (val), InventoryPage (val)
    local u18, v1, v2, v3, v4, v5, v6, v7
    local Home = useMenuPage("Home")
    local v8 = useRem()
    local v9 = useTheme()
    v3, u18 = react.useState(Players.LocalPlayer:GetAttribute("Temperature") or 98)
    v4, v5, v6, v7, v1, v2 = unpack(useStore(Vitality.Store, function(p1) -- Line: 165
        if not p1 then
            return {
                100,
                100,
                100,
                100,
                0,
                150,
            }
        end
        local v1 = {}
        local v2 = p1.thirst or 0
        local v3 = p1.maxHunger or 100
        local v4 = p1.maxThirst or 100
        local v5 = p1.weight or 0
        v1[1] = p1.hunger or 0
        v1[2] = v2
        v1[3] = v3
        v1[4] = v4
        v1[5] = v5
        v1[6] = p1.maxWeight or 150
        return v1
    end))
    react.useEffect(function() -- Line: 180 -- upvalues: u18 (val), Players (upval)
        local u18
        u18(Players.LocalPlayer:GetAttribute("Temperature") or 98)
        local AttributeChangedSignal = Players.LocalPlayer:GetAttributeChangedSignal("Temperature")
        u18 = AttributeChangedSignal:Connect(function() -- Line: 183 -- upvalues: u18 (upval), Players (upval)
            u18(Players.LocalPlayer:GetAttribute("Temperature") or 98)
        end)
        return function() -- Line: 187 -- upvalues: u18 (val)
            u18:Disconnect()
        end
    end, {})
    local v10 = {
        Enabled = Home,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v11 = {}
    local v12 = {}
    local v13 = {BackgroundTransparency = 1}
    local v14 = UDim2.fromScale(1, 0)
    v13.Size = v14 + UDim2.fromOffset(0, v8(100))
    v12.Top = react.createElement("Frame", v13, {Top = react.createElement(Divider, {Type = "Vertical", Thickness = 2, Position = UDim2.fromScale(0, 0)}), Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5),
        }),
        Hunger = react.createElement(Vital, {
            Name = "Hunger",
            Icon = "rbxassetid://136925194391463",
            LayoutOrder = 0,
            Value = normalizeVital(v4, v6),
            Color = Color3.fromRGB(244, 174, 83),
        }),
        Splitter = react.createElement(Splitter, {LayoutOrder = 1}),
        Thirst = react.createElement(Vital, {
            Name = "Thirst",
            Icon = "rbxassetid://11295273090",
            LayoutOrder = 2,
            Value = normalizeVital(v5, v7),
            Color = Color3.fromRGB(83, 157, 244),
        }),
        Splitter2 = react.createElement(Splitter, {LayoutOrder = 3}),
        Temperature = react.createElement(Vital, {
            Name = "Temperature",
            Icon = "rbxassetid://71079401665365",
            LayoutOrder = 4,
            Value = normalizeBodyTemperature(v3),
            Color = v9.Bar,
            ImageColor = Color3.fromRGB(255, 255, 255),
        }),
        Splitter3 = react.createElement(Splitter, {LayoutOrder = 5}),
        Weight = react.createElement(Vital, {
            Name = "Weight",
            Icon = "rbxassetid://127565701450513",
            LayoutOrder = 6,
            Value = v1,
            Range = {Min = 0, Max = math.max(v2, 1)},
            Color = v9.Bar,
            ImageColor = Color3.fromRGB(255, 255, 255),
        }),
    }), Bottom = react.createElement(Divider, {Type = "Vertical", Thickness = 2, Position = UDim2.fromScale(0, 1)})})
    v13 = {BackgroundTransparency = 1}
    v14 = UDim2.fromScale(1, 1)
    v13.Size = v14 + UDim2.fromOffset(0, -v8(10))
    v14 = UDim2.fromScale(0.5, 0)
    v13.Position = v14 + UDim2.fromOffset(0, v8(115))
    v13.AnchorPoint = Vector2.new(0.5, 0)
    v12.Bottom = react.createElement("Frame", v13, {Inventory = react.createElement(InventoryPage, {Enabled = Home}), react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.93})})
    v11.Content = react.createElement(Content, {}, v12)
    return react.createElement(TransparencyGroup, v10, v11)
end