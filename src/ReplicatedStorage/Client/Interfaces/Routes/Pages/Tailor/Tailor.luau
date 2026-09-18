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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tailor.Tailor
--                               Dumped in 0.00237 seconds
--                          Bytecode version 9  |  10 functions

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
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Customization = require(Namespaces_2:WaitForChild("Customization"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Customization_2 = Common_4:WaitForChild("Customization")
local Pants = require(Customization_2:WaitForChild("Pants"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Customization_3 = Common_5:WaitForChild("Customization")
local Shirts = require(Customization_3:WaitForChild("Shirts"))
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
local u378 = {"Closed Shirt", "Open Shirt", "Undershirt"}
return function() -- Line: 56 -- upvalues: useInterfaceState (val), useStore (val), Branch (val), Branches (val), react (val), u378 (val), Shirts (val), Form (val), HeaderBodyComponent (val), Button (val), Customization (val), Accordion (val), Pants (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), CustomizationViewport (val)
    local CIVILIAN, tailoring, tailoring_2, u457, u460, u462, v1, v2, v3, v4, v5, v6, v7
    tailoring, tailoring_2 = useInterfaceState("tailoring")
    local v8 = tailoring_2
    if not v8 then
        v8 = {visible = false}
    end
    local u450 = v8
    v8 = useStore(Branch.Branch, function(p1) -- Line: 60 -- upvalues: Branches (upval)
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
    if not v9 then
        v9 = "Civilian"
    elseif v9 ~= "Government" then
    end
    v5, u457 = react.useState(u450.visible)
    react.useEffect(function() -- Line: 77 -- upvalues: u457 (val), u450 (ref)
        u457(u450.visible)
    end, {u450.visible})
    v6, u460 = react.useState("Rolled White Shirt")
    v7, u462 = react.useState("Civilian/Black Slacks")
    local v10 = {}
    local v11 = {}
    local function getLayoutOrder(p1) -- Line: 89 -- upvalues: u378 (upval)
        local v1 = u378
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if string.find(p1, j) then
                return i
            end
        end
        return #u378 + 1
    end
    local v12 = Shirts
    local v13 = nil
    local v14 = nil
    for i, j in v12, v13, v14 do
        v1 = {}
        v2 = j
        v3 = nil
        v4 = nil
        for k, n in v2, v3, v4 do
            if i == v9 then
                v1[k] = react.createElement(Form.Form, {LayoutOrder = getLayoutOrder(k)}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = k})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Preview = react.createElement(Button, {
                    Text = "Preview",
                    Clicked = function() -- Line: 130 -- upvalues: u460 (val), k (val)
                        u460(k)
                    end,
                }), Wear = react.createElement(Button, {
                    Text = "Wear",
                    Clicked = function() -- Line: 137 -- upvalues: Customization (upval), k (val)
                        Customization.Shirt.post(k)
                    end,
                })})})
            elseif i ~= "Civilian" and i ~= "Offduty" and i ~= "Trainee Corps" then
            end
        end
        if v9 == i then
            v10[i] = react.createElement(Accordion.AccordionItem, {LayoutOrder = 1, Header = i}, v1)
        elseif i ~= "Civilian" and i ~= "Offduty" and i ~= "Trainee Corps" then
        end
    end
    v12 = Pants
    v13 = nil
    v14 = nil
    for m, i5 in v12, v13, v14 do
        v1 = {}
        v2 = i5
        v3 = nil
        v4 = nil
        for i6, i7 in v2, v3, v4 do
            v1[i6] = react.createElement(Form.Form, {LayoutOrder = getLayoutOrder(i6)}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = i6})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Preview = react.createElement(Button, {
                Text = "Preview",
                Clicked = function() -- Line: 176 -- upvalues: u462 (val), m (val), i6 (val)
                    u462(m .. "/" .. i6)
                end,
            }), Wear = react.createElement(Button, {
                Text = "Wear",
                Clicked = function() -- Line: 183 -- upvalues: Customization (upval), m (val), i6 (val)
                    Customization.Pants.post(m .. "/" .. i6)
                end,
            })})})
        end
        v11[m] = react.createElement(Accordion.AccordionItem, {LayoutOrder = 2, Header = m}, v1)
    end
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {Enabled = v5}), Group = react.createElement(TransparencyGroup, {ZIndex = 2, Enabled = v5, Tween = TweenInfo.new(0.3)}, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Scaler = react.createElement(Scaler, {
        Enabled = v5,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Header = react.createElement(PageHeader, {
        Header = "Tailoring Store",
        Body = "Purchase and Tailor your outfit to your liking.",
        Icon = "rbxassetid://11430237344",
        Closed = function() -- Line: 225 -- upvalues: u450 (ref), tailoring (val), u457 (val)
            u450.visible = false
            tailoring(table.clone(u450))
            u457(false)
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
        AccessorySource = "None",
        UseHairColor = false,
        Burns = 1,
        Freckles = 1,
        Moles = 1,
        Scars = 1,
        Frame = 1,
        Strokeless = true,
        Shirt = v6,
        Pants = v7,
        BranchId = CIVILIAN,
        Accessories = {},
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
    }), Items = react.createElement(Accordion.Accordion, {}, {Shirts = react.createElement(Accordion.AccordionItem, {Header = "Shirts", LayoutOrder = 1, Padding = "Small"}, {Shirts = react.createElement(Accordion.Accordion, {MaxSize = 400}, v10)}), Pants = react.createElement(Accordion.AccordionItem, {Header = "Pants", LayoutOrder = 2}, {Pants = react.createElement(Accordion.Accordion, {MaxSize = 400}, v11)})})})})})})})})
end