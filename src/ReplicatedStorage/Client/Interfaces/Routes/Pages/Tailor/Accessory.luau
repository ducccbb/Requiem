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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tailor.Accessory
--                               Dumped in 0.00256 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local Accessories = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Accessories")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Accessories_2 = require(Namespaces:WaitForChild("Accessories"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Branch = require(Namespaces_2:WaitForChild("Branch"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_3 = Common_3:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Customization = require(Namespaces_3:WaitForChild("Customization"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local CustomizationViewport = require(Universal_2:WaitForChild("CustomizationViewport"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_4:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_6:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_7:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_9:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_10 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_10:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_11 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_11:WaitForChild("Utilities")
local Scaler = require(Utilities:WaitForChild("Scaler"))
local Components_12 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_12:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local u381 = {"Closed Shirt", "Open Shirt", "Undershirt"}
local function getAccessoryNamesFromStore(p1) -- Line: 60
    if p1 == nil then
        return nil
    end
    if typeof(p1) ~= "table" then
        return p1
    end
    if p1.value ~= nil then
        return p1.value
    end
    return p1
end
return function() -- Line: 74 -- upvalues: useInterfaceState (val), useStore (val), Branch (val), Branches (val), react (val), u381 (val), Accessories_2 (val), getAccessoryNamesFromStore (val), Players (val), Accessories (val), Form (val), HeaderBodyComponent (val), Button (val), Customization (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), CustomizationViewport (val), Accordion (val)
    local CIVILIAN, accessory, accessory_2, u416, u430, u434, v1, v2, v3, v4, v5, v6, v7
    accessory, accessory_2 = useInterfaceState("accessory")
    local v8 = accessory_2
    if not v8 then
        v8 = {visible = false}
    end
    local u396 = v8
    v8 = useStore(Branch.Branch, function(p1) -- Line: 78 -- upvalues: Branches (upval)
        local Branchless = p1
        if not Branchless then
            Branchless = Branches.Branchless
        end
        if not Branchless.member then
            return Branches.Branches.CIVILIAN
        end
        if Branchless.member.branch_id ~= nil then
            return Branchless.member.branch_id
        end
        return Branches.Branches.CIVILIAN
    end)
    if typeof(v8) ~= "number" then
        CIVILIAN = Branches.Branches.CIVILIAN
    else
        CIVILIAN = v8
    end
    local v9 = Branches.Names[CIVILIAN]
    if v9 and v9 ~= "Government" then end
    v7, u416 = react.useState(u396.visible)
    react.useEffect(function() -- Line: 95 -- upvalues: u416 (val), u396 (ref)
        u416(u396.visible)
    end, {u396.visible})
    local v10 = react.useState("Rolled White Shirt")
    local v11 = react.useState("Civilian/Black Slacks")
    u430, u434 = react.useState(nil)
    local v12 = {}
    local function getLayoutOrder(p1) -- Line: 107 -- upvalues: u381 (upval)
        local v1 = u381
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if string.find(p1, j) then
                return i
            end
        end
        return #u381 + 1
    end
    local v13 = useStore(Accessories_2.Owned, getAccessoryNamesFromStore)
    local v14 = useStore(Accessories_2.Accessories, getAccessoryNamesFromStore)
    local v15 = Accessories_2.Owned.current[Players.LocalPlayer] ~= nil
    if not v15 then
        v1 = {}
    else
        v1 = v13
        if not v1 then
            v1 = {}
        end
    end
    local u455 = v14
    if not u455 then
        u455 = {}
    end
    local v16 = react.useMemo(function() -- Line: 124 -- upvalues: u455 (val), u430 (val)
        local v1 = {}
        local v2 = {}
        local v3 = u455
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j ~= nil and j ~= "" and not (v2[j]) then
                v2[j] = true
                table.insert(v1, j)
            end
        end
        if u430 ~= nil and u430 ~= "" and not (v2[u430]) then
            table.insert(v1, u430)
        end
        return v1
    end, {u455, u430})
    for i, j in Accessories:GetChildren() do
        if v15 and table.find(v1, j.Name) ~= nil then
            u290 = table.find(u455, j.Name) ~= nil
            v2 = {LayoutOrder = getLayoutOrder(j.Name)}
            v3 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = j.Name})})}
            v4 = {}
            v5 = {}
            if u430 ~= j.Name then
                v6 = "Preview"
            else
                v6 = "Un-Preview"
            end
            v5.Text = v6
            function v5.Clicked() -- Line: 169 -- upvalues: u434 (val), j (val)
                u434(function(p1) -- Line: 170 -- upvalues: j (upval)
                    if p1 == j.Name then
                        return nil
                    end
                    return j.Name
                end)
            end
            v4.Preview = react.createElement(Button, v5)
            v5 = {}
            if not u290 then
                v6 = "Equip"
            else
                v6 = "Unequip"
            end
            v5.Text = v6
            function v5.Clicked() -- Line: 182 -- upvalues: u290 (val), Customization (upval), j (val)
                if u290 then
                    Customization.Accessory.post(j.Name, "unequip")
                    return
                end
                Customization.Accessory.post(j.Name, "equip")
            end
            v4.Wear = react.createElement(Button, v5)
            v3.Right = react.createElement(Form.Divider, {Side = "Right"}, v4)
            v12[j.Name] = react.createElement(Form.Form, v2, v3)
        end
    end
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {Enabled = v7}), Group = react.createElement(TransparencyGroup, {ZIndex = 2, Enabled = v7, Tween = TweenInfo.new(0.3)}, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Scaler = react.createElement(Scaler, {
        Enabled = v7,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Header = react.createElement(PageHeader, {
        Header = "Owned Accessories",
        Body = "Equip and unequip your accessories to your liking.",
        Icon = "rbxassetid://11430237344",
        Closed = function() -- Line: 220 -- upvalues: u396 (ref), accessory (val), u416 (val)
            u396.visible = false
            accessory(table.clone(u396))
            u416(false)
        end,
    }), Content = react.createElement(Frame, {Size = UDim2.fromScale(1, 0.823)}, {Left = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
    }, {Character = react.createElement(CustomizationViewport, {
        Eyes = 1,
        Mouth = 1,
        Eyebrows = 1,
        AccessorySource = "Local",
        UseHairColor = false,
        Burns = 1,
        Freckles = 1,
        Moles = 1,
        Scars = 1,
        Frame = 1,
        Strokeless = true,
        Shirt = v10,
        Pants = v11,
        BranchId = CIVILIAN,
        Accessories = v16,
        EyeColor = {R = 255, G = 255, B = 255},
        HairColor = {R = 255, G = 255, B = 255},
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.8)},
    })}), Right = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    }), Items = react.createElement(Accordion.Accordion, {}, {Shirts = react.createElement(Accordion.AccordionItem, {Header = "Accessories", LayoutOrder = 1, Padding = "Small"}, {Accessories = react.createElement(Accordion.Accordion, {MaxSize = 400}, v12)})})})})})})})})
end