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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Staff.Subpages.EconomyPage
--                               Dumped in 0.00296 seconds
--                          Bytecode version 9  |  26 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Resources = require(Namespaces:WaitForChild("Resources"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Resources_2 = require(Types:WaitForChild("Resources"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs_2 = Components_2:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Screen = Components_5:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives = Components_6:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs_3 = Components_7:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Primitives_2 = Components_8:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local usePopup = require(Hooks_2:WaitForChild("usePopup"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_13:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local function CreateFactoryPopup(p1) -- Line: 38 -- upvalues: useToast (val), useRem (val), react (val), useOrder (val), Table (val), Resources_2 (val), Popup (val), TextInput (val), DropdownInput (val), Button (val), Resources (val)
    local u10, u21, u22, u26, u27, u31, u32, u36, u37, u41, u42, u46, u47, v1
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local u4 = useToast()
    local v2 = useRem()
    u10, v1 = react.useState("")
    local v3 = useOrder()
    local v4 = react.useMemo(function() -- Line: 46 -- upvalues: Table (upval), Resources_2 (upval)
        return Table.values(Resources_2.RESOURCE_TYPE_MAP)
    end)
    u21, u22 = react.useState(v4[1])
    u26, u27 = react.useState(1)
    u31, u32 = react.useState(1)
    u36, u37 = react.useState(1)
    u41, u42 = react.useState(0.5)
    u46, u47 = react.useState(10000)
    return react.createElement(react.Fragment, {}, {Header = react.createElement(Popup.Header, {Header = "Create Factory", Body = "Create a new factory for a resource."}), Body = react.createElement(Popup.Body, {Bottom = 50}, {
        Name = react.createElement(TextInput, {
            Layout = 3,
            Header = "Factory Name",
            Outlined = true,
            Width = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = v1,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Resource = react.createElement(DropdownInput, {
            Header = "Resource",
            Body = "Select the resource that the factory will produce.",
            Visible = true,
            Padding = "Medium",
            Options = v4,
            Default = v4[1] or "None",
            Selected = function(p1) -- Line: 90 -- upvalues: u22 (val)
                u22(p1)
            end,
            OutlineColor = Color3.fromRGB(255, 255, 255),
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Rate = react.createElement(TextInput, {
            Header = "Factory Rate",
            Body = "The hourly production rate of the factory, per single unit.",
            Placeholder = "Hourly Rate",
            Outlined = true,
            Width = "Medium",
            Layout = 2,
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 113 -- upvalues: u27 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u27(v1)
                    return
                end
                u4({message = "Invalid rate, ensure it's a number, without commas or symbols.", type = "error"})
                u27(1)
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Price = react.createElement(TextInput, {
            Header = "Base Price",
            Body = "The base price of the resource, per single unit.",
            Placeholder = "Base Price",
            Outlined = true,
            Width = "Medium",
            Layout = 2,
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 141 -- upvalues: u32 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u32(v1)
                    return
                end
                u4({message = "Invalid price, ensure it's a number, without commas or symbols.", type = "error"})
                u32(1)
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Breaker = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v2(10)), LayoutOrder = v3()}),
        SupplyThreshold = react.createElement(TextInput, {
            Header = "Supply Threshold",
            Body = "The threshold for supply and demand to influence the price.",
            Placeholder = "Supply Threshold",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 174 -- upvalues: u37 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u37(v1)
                    return
                end
                u4({message = "Invalid supply threshold, ensure it's a number, without commas or symbols.", type = "error"})
                u37(1)
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Breaker2 = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v2(10)), LayoutOrder = v3()}),
        SupplyInfluence = react.createElement(TextInput, {
            Header = "Supply Influence",
            Body = "Influence of supply and demand on price, recommended to be between 0 and 1.",
            Placeholder = "Supply Influence",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 207 -- upvalues: u42 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u42(v1)
                    return
                end
                u4({message = "Invalid supply influence, ensure it's a number, without commas or symbols.", type = "error"})
                u42(0.5)
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        MaximumSupply = react.createElement(TextInput, {
            Header = "Maximum Supply",
            Body = "The maximum supply of the resource, per factory.",
            Placeholder = "Maximum Supply",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 235 -- upvalues: u47 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u47(v1)
                    return
                end
                u4({message = "Invalid maximum supply, ensure it's a number, without commas or symbols.", type = "error"})
                u47(10000)
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
    }), Buttons = react.createElement(Popup.Buttons, {}, {Submit = react.createElement(Button, {
        Text = "Create",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 260 -- upvalues: closePopup (val), Resources (upval), u10 (val), u21 (val), u26 (val), u31 (val), u36 (val), u41 (val), u46 (val), u4 (val)
            closePopup()
            Resources.Create.post({
                name = u10,
                resource = u21,
                rate = u26,
                price = u31,
                supplyThreshold = u36,
                supplyInfluence = u41,
                maximumSupply = u46,
            })
            u4({message = "Attempting to create factory...", type = "info"})
        end,
    }), Close = react.createElement(Button, {
        Text = "Cancel",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Clicked = function() -- Line: 288 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})})
end
local function EditFactoryPopup(p1) -- Line: 296 -- upvalues: useToast (val), useRem (val), react (val), useOrder (val), Popup (val), TextInput (val), Button (val), Resources (val)
    local u12, u18, u19, u24, u25, u30, u31, u36, u37, u42, u43, v1
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local u4 = useToast()
    local v2 = useRem()
    u12, v1 = react.useState(p1.factory.name)
    u18, u19 = react.useState(p1.factory.rate)
    u24, u25 = react.useState(p1.factory.base_price)
    u30, u31 = react.useState(p1.factory.supply_threshold)
    u36, u37 = react.useState(p1.factory.supply_influence)
    u42, u43 = react.useState(p1.factory.maximum_supply)
    local v3 = useOrder()
    return react.createElement(react.Fragment, {}, {Header = react.createElement(Popup.Header, {Header = "Edit Factory", Body = "Editing factory " .. p1.factory.name}), Body = react.createElement(Popup.Body, {Bottom = 50}, {
        Name = react.createElement(TextInput, {
            Layout = 3,
            Header = "Factory Name",
            Outlined = true,
            Width = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Text = p1.factory.name,
            Placeholder = p1.factory.name,
            Changed = v1,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Rate = react.createElement(TextInput, {
            Header = "Factory Rate",
            Body = "The hourly production rate of the factory, per single unit.",
            Outlined = true,
            Width = "Medium",
            Layout = 2,
            Placeholder = tostring(p1.factory.rate),
            Text = tostring(p1.factory.rate),
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 348 -- upvalues: u19 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u19(v1)
                    return
                end
                u4({message = "Invalid rate, ensure it's a number, without commas or symbols.", type = "error"})
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Price = react.createElement(TextInput, {
            Header = "Base Price",
            Body = "The base price of the resource, per single unit.",
            Outlined = true,
            Width = "Medium",
            Layout = 2,
            Placeholder = tostring(p1.factory.base_price),
            Text = tostring(p1.factory.base_price),
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 376 -- upvalues: u25 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u25(v1)
                    return
                end
                u4({message = "Invalid price, ensure it's a number, without commas or symbols.", type = "error"})
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Breaker = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v2(10)), LayoutOrder = v3()}),
        SupplyThreshold = react.createElement(TextInput, {
            Header = "Supply Threshold",
            Body = "The threshold for supply and demand to influence the price.",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Placeholder = tostring(p1.factory.supply_threshold),
            Text = tostring(p1.factory.supply_threshold),
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 409 -- upvalues: u31 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u31(v1)
                    return
                end
                u4({message = "Invalid supply threshold, ensure it's a number, without commas or symbols.", type = "error"})
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        Breaker2 = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v2(10)), LayoutOrder = v3()}),
        SupplyInfluence = react.createElement(TextInput, {
            Header = "Supply Influence",
            Body = "Influence of supply and demand on price, recommended to be between 0 and 1.",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Placeholder = tostring(p1.factory.supply_influence),
            Text = tostring(p1.factory.supply_influence),
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 442 -- upvalues: u37 (val), u4 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u37(v1)
                    return
                end
                u4({message = "Invalid supply influence, ensure it's a number, without commas or symbols.", type = "error"})
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
        MaximumSupply = react.createElement(TextInput, {
            Header = "Maximum Supply",
            Body = "The maximum supply of the resource, per factory.",
            Outlined = true,
            Width = "Medium",
            Layout = 1,
            Placeholder = tostring(p1.factory.maximum_supply),
            Text = tostring(p1.factory.maximum_supply),
            Color = Color3.fromRGB(255, 255, 255),
            TextBackgroundColor = Color3.fromRGB(0, 0, 0),
            Changed = function(p1) -- Line: 470 -- upvalues: u43 (val)
                local v1 = tonumber(p1)
                if v1 then
                    u43(v1)
                end
            end,
            Native = {BackgroundTransparency = 1, LayoutOrder = v3()},
        }),
    }), Buttons = react.createElement(Popup.Buttons, {}, {Submit = react.createElement(Button, {
        Text = "Update",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 489 -- upvalues: closePopup (val), Resources (upval), p1 (val), u12 (val), u18 (val), u24 (val), u30 (val), u36 (val), u42 (val), u4 (val)
            closePopup()
            Resources.Edit.post({
                id = p1.factory.id,
                name = u12,
                rate = u18,
                price = u24,
                supplyThreshold = u30,
                supplyInfluence = u36,
                maximumSupply = u42,
            })
            u4({message = "Updating factory...", type = "info"})
        end,
    }), Close = react.createElement(Button, {
        Text = "Cancel",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Clicked = function() -- Line: 517 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})})
end
return function(p1) -- Line: 525 -- upvalues: useStore (val), Resources (val), usePopup (val), useOrder (val), react (val), Form (val), HeaderBodyComponent (val), Button (val), CreateFactoryPopup (val), Number (val), EditFactoryPopup (val), ScrollingFrame (val), VerticalListLayout (val)
    local item_type, u7, u8, v1, v2, v3, v4, v5, v6
    local v7 = useStore(Resources.Store, function(p1) -- Line: 526
        return p1
    end)
    u7, u8, v6 = usePopup()
    local v8 = useOrder()
    local factories = v7.factories
    if not factories then
        factories = {}
    end
    local v9 = {}
    local v10 = {
        Native = {LayoutOrder = v8()},
    }
    local v11 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Create Factory", Body = "Create a new factory for a resource."})})}
    local createElement_2 = react.createElement
    local v12 = {Side = "Right"}
    local v13 = {}
    local v14 = {
        Text = "Create",
        Clicked = function() -- Line: 556 -- upvalues: u7 (val), react (upval), CreateFactoryPopup (upval), u8 (val)
            u7({Companion = react.createElement(CreateFactoryPopup, {closePopup = u8})})
        end,
    }
    v13.Button = react.createElement(Button, v14)
    v11.Right = createElement_2(Form.Divider, v12, v13)
    v9.Create = react.createElement(Form.Form, v10, v11)
    for i, v in ipairs(factories) do
        v12 = "Factory_" .. tostring(v.id)
        v1 = {
            Native = {LayoutOrder = v8()},
        }
        v14 = {}
        v2 = {}
        v3 = {Wrap = true, Header = v.name}
        item_type = v.item_type
        v4 = Number.FormatWithCommas(Number.Round(v.rate, 4))
        v5 = Number.FormatWithCommas(Number.Round(v.current_price, 4))
        v3.Body = string.format("%s | Rate: %s/hr | Price: %s | Stock: %s", item_type, v4, v5, Number.FormatWithCommas((math.floor(v.amount))))
        v2.Label = react.createElement(HeaderBodyComponent, v3)
        v14.Left = react.createElement(Form.Divider, {Side = "Left"}, v2)
        v14.Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
            Text = "Edit",
            Clicked = function() -- Line: 595 -- upvalues: u7 (val), react (upval), EditFactoryPopup (upval), v (val), u8 (val)
                u7({Companion = react.createElement(EditFactoryPopup, {factory = v, closePopup = u8})})
            end,
        }), Delete = react.createElement(Button, {
            Text = "Delete",
            Type = 4,
            Clicked = function() -- Line: 608 -- upvalues: Resources (upval), v (val)
                Resources.Delete.post({id = v.id})
            end,
        })})
        v9[v12] = react.createElement(Form.Form, v1, v14)
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), EconomyPopup = v6}, v9)
end