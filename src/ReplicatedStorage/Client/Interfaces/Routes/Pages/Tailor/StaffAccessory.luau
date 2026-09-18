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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tailor.StaffAccessory
--                               Dumped in 0.00205 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Accessories = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Accessories")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_6:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_8:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_9:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_10 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_10:WaitForChild("Utilities")
local Scaler = require(Utilities:WaitForChild("Scaler"))
local Components_11 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_11:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local useState = react.useState
local u280 = {"Closed Shirt", "Open Shirt", "Undershirt"}
return function() -- Line: 54 -- upvalues: useInterfaceState (val), useState (val), react (val), u280 (val), Player (val), Accessories (val), Form (val), HeaderBodyComponent (val), Button (val), Accordion (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val)
    local staffAccessory_2, u11, u15, u330, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    _, staffAccessory_2 = useInterfaceState("staffAccessory")
    local v14 = staffAccessory_2
    if not v14 then
        v14 = {visible = false}
    end
    local u313 = v14
    local v15 = {}
    v14, u11 = useState(v15)
    v12, u15 = useState({})
    v13, u330 = react.useState(u313.visible)
    react.useEffect(function() -- Line: 62 -- upvalues: u330 (val), u313 (ref)
        u330(u313.visible)
    end, {u313.visible})
    local v16 = {}
    local v17 = {}
    local function getLayoutOrder(p1) -- Line: 71 -- upvalues: u280 (upval)
        local v1 = u280
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if string.find(p1, j) then
                return i
            end
        end
        return #u280 + 1
    end
    react.useEffect(function() -- Line: 80 -- upvalues: u11 (val), u15 (val), u313 (ref), u330 (val), Player (upval)
        local u5 = Player.Accessories.listen(function(p1) -- Line: 81 -- upvalues: u11 (upval), u15 (upval), u313 (upval), u330 (upval)
            u11(p1.ownedAccessories)
            u15(p1.equippedAccessories)
            print(p1.ownedAccessories, p1.equippedAccessories)
            u313.visible = true
            u330(true)
        end)
        return function() -- Line: 97 -- upvalues: u5 (val)
            u5()
        end
    end, {})
    for i, j in Accessories:GetChildren() do
        v1 = v14
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            if table.find(n, j.Name) ~= nil then
                v4 = v12[k]
                if typeof(v4) ~= "table" then
                    v4 = {}
                end
                v5 = table.find(v4, j.Name) ~= nil
                v6 = v16[k]
                if not v6 then
                    v6 = {}
                end
                v16[k] = v6
                v7 = {LayoutOrder = getLayoutOrder(j.Name)}
                v8 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = j.Name})})}
                v9 = {}
                v10 = {}
                if not v5 then
                    v11 = "Not Equipped"
                else
                    v11 = "Equipped"
                end
                v10.Text = v11
                v9.HasEquipped = react.createElement(Button, v10)
                v8.Right = react.createElement(Form.Divider, {Side = "Right"}, v9)
                v16[k][j.Name] = react.createElement(Form.Form, v7, v8)
            end
        end
    end
    local v18 = v14
    local v19 = nil
    local v20 = nil
    for m, i5 in v18, v19, v20 do
        if typeof(i5) == "table" and typeof(v16[m]) == "table" then
            v17[m] = react.createElement(Accordion.AccordionItem, {LayoutOrder = 1, Header = m}, {Accessories = react.createElement(Accordion.Accordion, {MaxSize = 400}, v16[m])})
        end
    end
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {Enabled = v13}), Group = react.createElement(TransparencyGroup, {ZIndex = 2, Enabled = v13, Tween = TweenInfo.new(0.3)}, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Scaler = react.createElement(Scaler, {
        Enabled = v13,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Header = react.createElement(PageHeader, {
        Header = "Accessory Store",
        Body = "View the accessories owned by specific players.",
        Icon = "rbxassetid://11430237344",
        Closed = function() -- Line: 186 -- upvalues: u313 (ref), u330 (val)
            u313.visible = false
            u330(false)
        end,
    }), Content = react.createElement(Frame, {Size = UDim2.fromScale(1, 0.823)}, {Right = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    }), Items = react.createElement(Accordion.Accordion, {MaxSize = 400}, v17)})})})})})})
end