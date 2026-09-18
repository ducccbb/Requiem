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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Stores.Shops.Banker
--                               Dumped in 0.00130 seconds
--                          Bytecode version 9  |  7 functions

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
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Shop = require(Namespaces:WaitForChild("Shop"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_4:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_4 = Components_6:WaitForChild("Universal")
local Loading = require(Universal_4:WaitForChild("Loading"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Menu = Components_7:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Primitives_2 = Components_8:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_3 = Components_9:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local function BankerShopItem(p1) -- Line: 45 -- upvalues: useOrder (val), useToast (val), react (val), Badge (val), useAsyncEffect (val), Promise (val), Form (val), Loading (val), Constants (val), Number (val), HeaderBodyComponent (val), Button (val), Shop (val)
    local u10, v1
    local Item = p1.Item
    local v2 = useOrder()
    local u5 = useToast()
    v1, u10 = react.useState(false)
    local v3 = {}
    for k, v in pairs(Item.tags) do
        v3[k .. v] = react.createElement(Badge, {
            Outline = true,
            Text = v,
            Native = {LayoutOrder = 10 + v2()},
            Color = Color3.fromRGB(92, 92, 92),
            TextColor = Color3.fromRGB(171, 171, 171),
        })
    end
    useAsyncEffect(function() -- Line: 64 -- upvalues: Promise (upval), u10 (val)
        return Promise.delay(3):andThen(function() -- Line: 65 -- upvalues: u10 (upval)
            u10(false)
        end)
    end, {v1})
    return react.createElement(Form.Form, {
        Padding = "Large",
        Native = {LayoutOrder = p1.Index},
    }, {Loading = react.createElement(Loading, {Padding = "Large", Enabled = v1}), Left = react.createElement(Form.Divider, {Side = "Left"}, {Price = react.createElement(Badge, {
        Outline = true,
        Text = Constants.Currency.Symbol .. Number.FormatWithCommas(Item.price),
        Native = {LayoutOrder = v2()},
        Color = Color3.fromRGB(59, 92, 59),
        TextColor = Color3.fromRGB(97, 144, 97),
    }), Label = react.createElement(HeaderBodyComponent, {
        Body = "",
        Header = Item.name,
        Native = {LayoutOrder = v2()},
    })}, v3), Right = react.createElement(Form.Divider, {Side = "Right"}, {Purchase = react.createElement(Button, {
        Text = "Purchase",
        Color = Color3.fromRGB(42, 70, 42),
        Clicked = function() -- Line: 108 -- upvalues: u10 (val), u5 (val), Shop (upval), Item (val)
            u10(true)
            u5({message = "Attempting to process your purchase request...", type = "info"})
            Shop.Purchase.post(Item)
        end,
    })})})
end
return function(p1) -- Line: 119 -- upvalues: Table (val), react (val), BankerShopItem (val), Frame (val), PageLayout (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1 = {}
    local v2 = if not p1.Enabled then {} else Table.copy(p1.Content)
    table.sort(v2, function(p1, p2) -- Line: 128
        if not p1 or not p2 or not p1.price or not p2.price then
            return false
        end
        local v1 = p2.price < p1.price
        return v1
    end)
    for k, v in pairs(v2) do
        if typeof(v) == "table" and v.name then
            v1[v.name .. k] = react.createElement(BankerShopItem, {Item = v, Index = k})
        end
    end
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement(PageLayout, {Ratio = false}), Content = react.createElement(Frame, {Size = UDim2.fromScale(1, 1)}, {react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)})})
end