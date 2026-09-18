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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Economy.Subpages.Resources.ResourcePage
--                               Dumped in 0.00402 seconds
--                          Bytecode version 9  |  30 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Locations = require(Types:WaitForChild("Locations"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Resources = require(Namespaces:WaitForChild("Resources"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local String = require(Utilities_2:WaitForChild("String"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Network_2 = Common_7:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Treasury = require(Namespaces_2:WaitForChild("Treasury"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Types_2 = Common_8:WaitForChild("Types")
local Resources_2 = require(Types_2:WaitForChild("Resources"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Inputs_2 = Components_3:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Screen = Components_6:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Progress = require(Universal_4:WaitForChild("Progress"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Primitives = Components_8:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Inputs_3 = Components_9:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs_3:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Primitives_2 = Components_10:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks = Interfaces_11:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_12:WaitForChild("Hooks")
local usePopup = require(Hooks_2:WaitForChild("usePopup"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_13:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_14:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_15:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_16:WaitForChild("Hooks")
local useTheme = require(Hooks_6:WaitForChild("useTheme"))
local function getHeaderForDisplay(p1) -- Line: 55
    local v1 = {}
    v1["Gear Spawner"] = "Omnidirectional Manuevering Gear"
    return v1[p1] or p1
end
local function getBodyForDisplay(p1) -- Line: 68
    local v1 = {}
    v1["Gear Spawner"] = "The amount of Omnidirectional Manuevering Gear sets available at the location."
    v1["Gas Tank"] = "The unit amount of gas available at the location."
    v1["Blade Box"] = "The amount of blades available at the location."
    v1["Musket Rack"] = "The amount of muskets available at the location."
    v1["Sabre Rack"] = "The amount of sabres available at the location."
    v1["Handcuff Crate"] = "The amount of handcuffs available at the location."
    v1["Compass Crate"] = "The amount of compasses available at the location."
    v1["Bandages Crate"] = "The amount of bandages available at the location."
    v1["Bow Crate"] = "The amount of bows available at the location."
    v1["Cannonball Crate"] = "The amount of cannonballs available at the location."
    v1["Bread Crate"] = "The amount of bread available at the location."
    v1["Canteen Crate"] = "The amount of canteens available at the location."
    local v2 = v1[p1]
    if not v2 then
        v2 = ("The amount of %*s available at the location."):format(p1)
    end
    return v2
end
local function ResourcePurchasePopup(p1) -- Line: 93 -- upvalues: useOrder (val), useRem (val), react (val), useStore (val), Treasury (val), Resources (val), Resources_2 (val), Form (val), HeaderBodyComponent (val), Constants (val), Number (val), Button (val), Popup (val), NumberSliderInput (val), DropdownInput (val)
    local Divider, Form_2, createElement_3, createElement_4, name, u29, u468, u471, u474, v1, v2, v3, v4, v5
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v6 = useOrder()
    local v7 = useRem()
    u468, u471 = react.useBinding(1)
    local v8 = {}
    local u17 = useStore(Treasury.Store, function(p1) -- Line: 102
        return p1
    end)
    local factories = useStore(Resources.Store, function(p1) -- Line: 107
        return p1
    end).factories
    if not factories then
        factories = {}
    end
    u474, u29 = react.useState({isUsing = false})
    local u36 = react.useMemo(function() -- Line: 114 -- upvalues: u17 (val)
        if not u17 then
            return {}
        end
        local v1 = {}
        local v2 = u17
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, {j.name, j.treasuryID})
        end
        return v1
    end, {u17})
    local v9 = react.useMemo(function() -- Line: 128 -- upvalues: u36 (val)
        local v1 = {}
        for i, v in ipairs(u36) do
            table.insert(v1, v[1])
        end
        return v1
    end, {u36})
    local u478 = react.useCallback(function(p1) -- Line: 138 -- upvalues: u36 (val), u29 (val), u474 (val)
        for i, v in ipairs(u36) do
            if v[1] == p1 then
                u29({isUsing = u474.isUsing, treasuryId = v[2]})
            end
        end
    end, {u36, u17, u474})
    local u455 = p1
    for i, v in ipairs(factories) do
        if Resources_2.isResourceMatching(v.item_type, u455.Resource.name) then
            v1 = tostring(v.id)
            createElement_3 = react.createElement
            Form_2 = Form.Form
            v2 = {
                Native = {BackgroundTransparency = 1, LayoutOrder = v6()},
            }
            v3 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {RichText = true, Wrap = true, Header = ("%* <font transparency=\"0.5\">%*%*</font>"):format(v.name, Constants.Currency.Symbol, (Number.FormatWithCommas(Number.Round(v.current_price, 4)))), Body = ("This factory has a remaining stock of %*."):format((Number.FormatWithCommas((math.floor(v.amount)))))})})}
            createElement_4 = react.createElement
            Divider = Form.Divider
            v4 = {}
            if 0 >= v.amount then
                v5 = react.createElement(react.Fragment)
            else
                v5 = react.createElement(Button, {
                    Text = u468:map(function(p1) -- Line: 176 -- upvalues: u455 (val), v (val), Constants (upval), Number (upval)
                        local v1 = math.clamp(p1 * (u455.Resource.max_amount - u455.Resource.amount), 0, v.amount)
                        return (("%*%*"):format(Constants.Currency.Symbol, (Number.FormatWithCommas((math.ceil(v1 * v.current_price))))))
                    end),
                    Color = Color3.fromRGB(42, 70, 42),
                    Clicked = function() -- Line: 188 -- upvalues: Resources (upval), u474 (val), v (val), u468 (val)
                        Resources.Purchase.post({treasury_id = u474.treasuryId or 0, factory_id = v.id, amount = u468:getValue()})
                    end,
                })
            end
            v4.Button = v5
            v3.Right = createElement_4(Divider, {Side = "Right"}, v4)
            v8[v1] = createElement_3(Form_2, v2, v3)
        end
    end
    local v10 = {Header = react.createElement(Popup.Header, {Header = "Purchase Resource", Body = "Purchase the resource from the selected factories."})}
    local createElement = react.createElement
    local v11 = {}
    local v12 = {
        Body = "How much of the available capacity would you like to fill through this purchase?",
        Initial = 1,
        RichText = true,
        Display = true,
        Header = u468:map(function(p1) -- Line: 211 -- upvalues: u455 (val), Number (upval)
            local v1 = p1 * (u455.Resource.max_amount - u455.Resource.amount)
            return (("Remaining Capacity to Purchase <font transparency=\"0.6\">%*</font>"):format((Number.FormatWithCommas((math.ceil(v1))))))
        end),
        Update = function() end,
        Stepped = function(p1) -- Line: 221 -- upvalues: u471 (val)
            u471(p1)
        end,
    }
    local v13 = {LayoutOrder = -3, BackgroundTransparency = 1}
    v4 = UDim2.fromScale(1, 0)
    v13.Size = v4 + UDim2.new(0, 0, 0, v7(90))
    v12.Native = v13
    v11.Amount = react.createElement(NumberSliderInput, v12)
    v11.Display = react.createElement("Frame", {LayoutOrder = -2, BackgroundColor3 = Color3.fromRGB(84, 84, 84), Size = UDim2.new(0.93, 0, 0, 5)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Purchasing = react.createElement("Frame", {
        LayoutOrder = -2,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 134, 63),
        Position = UDim2.fromScale(u455.Resource.amount / u455.Resource.max_amount, 0.5),
        Size = u468:map(function(p1) -- Line: 249 -- upvalues: u455 (val)
            return UDim2.fromScale(p1 * (u455.Resource.max_amount - u455.Resource.amount) / u455.Resource.max_amount, 1)
        end),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Endpoint = react.createElement("Frame", {
        LayoutOrder = -2,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 134, 63),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromOffset(10, 10),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})}), Current = react.createElement("Frame", {
        LayoutOrder = -2,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(148, 139, 70),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(u455.Resource.amount / u455.Resource.max_amount, 1),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Endpoint = react.createElement("Frame", {
        LayoutOrder = -2,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(148, 139, 70),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromOffset(10, 10),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})})})
    v11.Breaker = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = -2, Size = UDim2.fromOffset(0, v7(10))})
    v11.Resource = react.createElement(DropdownInput, {
        Header = "Treasury",
        Body = "The treasury that the purchase will withdraw from.",
        Visible = true,
        Default = "None",
        Padding = "Large",
        Options = v9,
        Selected = function(p1) -- Line: 314 -- upvalues: u478 (val)
            u478(p1)
        end,
        OutlineColor = Color3.fromRGB(189, 189, 189),
        Native = {BackgroundTransparency = 1, LayoutOrder = -1},
    })
    v11.Breaker2 = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 0, Size = UDim2.fromOffset(0, v7(10))})
    v11.Children = react.createElement(react.Fragment, {}, v8)
    v10.Body = createElement(Popup.Body, {Bottom = 50}, v11)
    v10.Buttons = react.createElement(Popup.Buttons, {}, {Submit = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 343 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v10)
end
local function ResourceSelectionPage(p1) -- Line: 357 -- upvalues: usePopup (val), useTextScale (val), useTheme (val), react (val), Resources_2 (val), Table (val), Progress (val), getHeaderForDisplay (val), Number (val), getBodyForDisplay (val), ResourcePurchasePopup (val), Accordion (val), String (val)
    local u2, u3, v1, v2, v3
    u2, u3, v3 = usePopup()
    local v4 = useTextScale()
    local v5 = useTheme()
    local v6 = {p1.Resources}
    local v7 = react.useMemo(function() -- Line: 362 -- upvalues: p1 (val)
        return p1.Resources.selected
    end, v6)
    if not p1.Loading then
        local v8, v9, v10
        local v11 = {}
        for k, v in pairs(Resources_2.CATEGORIES) do
            v1 = {}
            for k2, i in pairs(v) do
                v2 = Table.find(v7, function(p1) -- Line: 420 -- upvalues: i (val)
                    local v1 = string.lower(p1.name)
                    local v2 = v1 == string.lower(i)
                    return v2
                end)
                if v2 then
                    local u200 = v7[v2]
                    v8 = {Button = "Purchase", RichText = true}
                    v9 = getHeaderForDisplay(i)
                    v10 = Number.FormatWithCommas(u200.amount or 0)
                    v8.Header = ("%* <font transparency=\"0.5\">(%* / %*)</font>"):format(v9, v10, (Number.FormatWithCommas(u200.max_amount or 0)))
                    v8.Body = ("%*"):format((getBodyForDisplay(i)))
                    v8.Value = u200.amount or 0
                    v8.Range = {Min = 0, Max = u200.max_amount or 0}
                    function v8.Clicked() -- Line: 442 -- upvalues: u2 (val), react (upval), ResourcePurchasePopup (upval), u200 (val), u0 (val), u3 (val)
                        u2({Popup = react.createElement(ResourcePurchasePopup, {Resource = u200, Factories = u0.Resources.factories, closePopup = u3})})
                    end
                    v8.Native = {BackgroundTransparency = 1}
                    v1[i] = react.createElement(Progress, v8)
                end
            end
            v11[k] = react.createElement(Accordion.Accordion, {}, {Content = react.createElement(Accordion.AccordionItem, {Header = String.capitalizeAllFirstLetters(k)}, v1)})
        end
        v6 = {_ListLayout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)}), ResourcePopup = v3}
        for k3, j in pairs(v11) do
            v6[k3] = j
        end
        return react.createElement("Frame", {BackgroundTransparency = 1, Visible = true, Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y}, v6)
    end
    local v12 = {BackgroundTransparency = 1, Visible = false, Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v13 = {ResourcePopup = v3}
    v1 = {BackgroundTransparency = 1}
    local v14 = UDim2.fromScale(1, 0)
    v1.Size = v14 + UDim2.fromOffset(0, v4(72))
    local v15 = {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v4(6))})}
    local v16 = {LayoutOrder = 1, BackgroundTransparency = 1, Text = "Loading resources"}
    v2 = UDim2.fromScale(1, 0)
    v16.Size = v2 + UDim2.fromOffset(0, v4(22))
    v16.Font = Enum.Font.SourceSansBold
    v16.TextSize = v4(18)
    v16.TextColor3 = v5.Primary
    v16.TextXAlignment = Enum.TextXAlignment.Left
    v16.TextYAlignment = Enum.TextYAlignment.Top
    v15.Title = react.createElement("TextLabel", v16)
    v16 = {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        Text = "Fetching funnel stock for the selected location...",
        TextTransparency = 0.25,
        TextWrapped = true,
    }
    v2 = UDim2.fromScale(1, 0)
    v16.Size = v2 + UDim2.fromOffset(0, v4(40))
    v16.Font = Enum.Font.SourceSans
    v16.TextSize = v4(14)
    v16.TextColor3 = v5.Primary
    v16.TextXAlignment = Enum.TextXAlignment.Left
    v16.TextYAlignment = Enum.TextYAlignment.Top
    v15.Subtitle = react.createElement("TextLabel", v16)
    v13.Status = react.createElement("Frame", v1, v15)
    return react.createElement("Frame", v12, v13)
end
return function(p1) -- Line: 491 -- upvalues: Constants (val), react (val), ScrollingFrame (val), useOrder (val), useRem (val), useStore (val), Resources (val), Locations (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), DropdownInput (val), ResourceSelectionPage (val)
    local u16, u17, u23, u33, v1, v2, v3
    if Constants.IsSupporterPlace then
        return react.createElement(ScrollingFrame, {Visible = p1.Enabled})
    end
    local v4 = useOrder()
    local v5 = useRem()
    u16, u17 = react.useState(nil)
    local function setSelected(p1) -- Line: 503 -- upvalues: u17 (val)
        u17(p1)
    end
    v2, u23 = react.useState({})
    local u28 = useStore(Resources.Store, function(p1) -- Line: 508
        return p1
    end)
    v3, u33 = react.useState(false)
    local u37 = react.useRef(nil)
    react.useEffect(function() -- Line: 515 -- upvalues: u37 (val), u16 (val)
        u37.current = u16
    end, {u16})
    react.useEffect(function() -- Line: 522 -- upvalues: u28 (val), Constants (upval), Locations (upval), u23 (val), setSelected (val), u37 (val)
        local locations = u28.locations
        local v1 = locations
        if not Constants.IsDevelopmentPlace then
            v1 = {}
            local v2 = locations
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if Locations.isManageableDisplayName(j) then
                    table.insert(v1, j)
                end
            end
        end
        u23(v1)
        if #v1 == 0 then
            setSelected(nil)
            return
        end
        local current = u37.current
        if current == nil then
            setSelected(v1[1])
        elseif not (table.find(v1, current)) then
            setSelected(v1[1])
        end
    end, {u28.locations})
    react.useEffect(function() -- Line: 547 -- upvalues: u16 (val), u33 (val), Resources (upval)
        if not u16 or u16 == "None" then
            return
        end
        u33(true)
        Resources.Select.post({location = u16})
        u33(false)
    end, {u16})
    local v6 = if u28.selected_location ~= nil then (function(p1, p2) -- Line: 559
    local v5, v1
    if p1 == nil or p2 == nil then
        v5 = p1 == p2
        return v5
    end
    v1 = string.lower(p1)
    v5 = v1 == string.lower(p2)
    return v5
end)(u28.selected_location, u16) else true
    local v7 = if u16 ~= nil then not v6 else false
    local v8 = {Visible = p1.Enabled}
    local v9 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v10 = {}
    local v11 = {LayoutOrder = -1, ZIndex = 10}
    local v12 = UDim2.fromScale(1, 0)
    v11.Size = v12 + UDim2.fromOffset(0, v5(60))
    v10.Native = v11
    v11 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Resource Page", Body = "View all information about the different resources available for the military.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    local v13 = {}
    local v14 = {Visible = true}
    local v15 = u16
    if not v15 then
        v15 = v2[1]
        if not v15 then
            v15 = "None"
        end
    end
    v14.Default = v15
    v14.Options = v2
    function v14.Selected(p1) -- Line: 604 -- upvalues: setSelected (val)
        setSelected(p1)
    end
    v14.Native = {BackgroundTransparency = 1, LayoutOrder = 3 - v4()}
    v13.Dropdown = react.createElement(DropdownInput, v14)
    v11.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v13)
    v9.Header = react.createElement(Form.Form, v10, v11)
    local v16 = u16
    if v16 then
        v16 = react.createElement(ResourceSelectionPage, {Loading = v3 or v7, Resources = u28})
    end
    v9.Content = v16
    return react.createElement(ScrollingFrame, v8, v9)
end