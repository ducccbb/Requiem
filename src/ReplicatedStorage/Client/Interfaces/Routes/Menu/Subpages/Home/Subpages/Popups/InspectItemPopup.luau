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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.Popups.InspectItemPopup
--                               Dumped in 0.00158 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Screen = Components_4:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Progress = require(Universal_3:WaitForChild("Progress"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useToast = require(Hooks_4:WaitForChild("useToast"))
local function ItemWeightComponent(p1) -- Line: 57 -- upvalues: useRem (val), react (val), Item (val), useAsyncEffect (val), ClientInventoryHandler (val), Progress (val)
    local u7, v1, v2
    v1, u7 = react.useState(0)
    _, v2 = Item.getRelativeItemWeight(v1)
    useAsyncEffect(function() -- Line: 65 -- upvalues: ClientInventoryHandler (upval), p1 (val), u7 (val)
        local v1 = ClientInventoryHandler.requestItemInformation(p1.Item, "weight")
        v1 = v1:andThen(function(p1) -- Line: 67 -- upvalues: u7 (upval)
            u7(p1)
        end)
        return v1:catch(function(p1) -- Line: 70
            print(p1)
        end)
    end, {p1.Item})
    local v3 = {
        Header = "Item Weight",
        Animated = true,
        Display = true,
        Value = v1,
        Range = {Min = 0, Max = Item.ITEM_WEIGHTS.ExtremelyHeavy},
        Color = v2,
    }
    local v4 = {BackgroundTransparency = 1}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, useRem()(30))
    v4.LayoutOrder = p1.Order
    v3.Native = v4
    return react.createElement(Progress, v3)
end
local function ItemIdentifierComponent(p1) -- Line: 93 -- upvalues: useToast (val), react (val), useAsyncEffect (val), Promise (val), Players (val), Form (val), HeaderBodyComponent (val), Button (val), String (val)
    local u6, u7
    local u2 = useToast()
    u6, u7 = react.useState(nil)
    local v1 = {p1.Item}
    local u13 = react.useMemo(function() -- Line: 98 -- upvalues: p1 (val)
        if not p1.Item.attributes then
            return nil
        end
        local v1 = table.find(p1.Item.attributes, "Identifier Associated")
        if v1 then
            v1 = p1.Item.meta[2]
            if v1 then
                v1 = typeof(p1.Item.meta[3]) == "string"
            end
        end
        return v1
    end, v1)
    useAsyncEffect(function() -- Line: 109 -- upvalues: u13 (val), u7 (val), Promise (upval), Players (upval), p1 (val)
        if u13 then
            return Promise.new(function(a1) -- Line: 116 -- upvalues: Players (upval), p1 (upval), u7 (upval)
                local NameFromUserIdAsync = Players:GetNameFromUserIdAsync((tonumber(p1.Item.meta[2])))
                u7(NameFromUserIdAsync)
                a1(NameFromUserIdAsync)
            end)
        end
        u7(nil)
        return Promise.resolve()
    end, {u13, p1.Item})
    local v2 = {p1.Item, u13, u6}
    return (react.useMemo(function() -- Line: 124 -- upvalues: u13 (val), react (upval), Form (upval), p1 (val), HeaderBodyComponent (upval), Button (upval), u2 (val), String (upval), u6 (val)
    local v3, v4, v5, v1, v2
    if u13 then
        v4 = {}
        v5 = {BackgroundTransparency = 1}
        v5.LayoutOrder = p1.Order
        v4.Native = v5
        v5 = {}
        v1 = {Side = "Left"}
        v2 = {}
        v3 = {Header = "Identified", Body = "This item has an associated serial number and ownership identifier.", Wrap = true}
        v3.Position = UDim2.fromScale(0.5, 0.5)
        v2.Label = react.createElement(HeaderBodyComponent, v3)
        v5.Left = react.createElement(Form.Divider, v1, v2)
        v1 = {Side = "Right"}
        v2 = {}
        v3 = {Text = "Identify", Type = 3, Brightness = 1}
        v3.Color = Color3.fromRGB(255, 255, 255)
        v3.TextColor = Color3.fromRGB(255, 255, 255)
        function v3.Clicked() -- Line: 157 -- upvalues: u2 (upval), String (upval), p1 (upval), u6 (upval)
            local v6, v7, v4, v5, v8
            v7 = {type = "info"}
            v8 = String.removeExcessSpaces(p1.Item.meta[3])
            v7.message = ("This item was initially owned by \"%*\" <font transparency=\"0.5\">%*</font>"):format(v8, u6)
            u2(v7)
            return
        end
        v2.Inspect = react.createElement(Button, v3)
        v5.Right = react.createElement(Form.Divider, v1, v2)
        return react.createElement(Form.Form, v4, v5)
    else
        v4 = {}
        v5 = {}
        return react.createElement(react.Fragment, v4, v5)
    end
end, v2))
end
return function(p1) -- Line: 171 -- upvalues: useOrder (val), react (val), Popup (val), ItemWeightComponent (val), ItemIdentifierComponent (val), Button (val)
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v1 = useOrder()
    return react.createElement(react.Fragment, {}, {Header = react.createElement(Popup.Header, {Body = "The inspected item and it's properties.", Header = p1.Item.name}), Body = react.createElement(Popup.Body, {Bottom = 50}, {Weight = react.createElement(ItemWeightComponent, {Item = p1.Item, Order = v1()}), Identifier = react.createElement(ItemIdentifierComponent, {Item = p1.Item, Order = v1()})}), Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {LayoutOrder = 1},
        Clicked = closePopup,
    })})})
end