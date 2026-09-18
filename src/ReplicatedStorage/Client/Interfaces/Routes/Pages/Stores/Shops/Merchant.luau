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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Stores.Shops.Merchant
--                               Dumped in 0.00395 seconds
--                          Bytecode version 9  |  25 functions

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
local Economy = Common_2:WaitForChild("Economy")
local MerchantPricing = require(Economy:WaitForChild("MerchantPricing"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Shop = require(Namespaces:WaitForChild("Shop"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Promise = require(Common_5:WaitForChild("Promise"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_6:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Utilities_3 = Components_3:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Loading = require(Universal_4:WaitForChild("Loading"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Menu = Components_8:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_2 = Components_9:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Primitives_3 = Components_10:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Primitives_4 = Components_11:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_12 = Interfaces_12:WaitForChild("Components")
local Menu_2 = Components_12:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Components_13 = Interfaces_13:WaitForChild("Components")
local Menu_3 = Components_13:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_21:WaitForChild("Client")
local User = Client_14:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_22:WaitForChild("Common")
local Network_2 = Common_7:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces_2:WaitForChild("Inventory"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_14 = Client_15:WaitForChild("Interfaces")
local Hooks = Interfaces_14:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_15 = Client_16:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_15:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_16 = Client_17:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_16:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local Client_18 = ReplicatedStorage_26:WaitForChild("Client")
local Interfaces_17 = Client_18:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_17:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_27 = game:GetService("ReplicatedStorage")
local Client_19 = ReplicatedStorage_27:WaitForChild("Client")
local Interfaces_18 = Client_19:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_18:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local ReplicatedStorage_28 = game:GetService("ReplicatedStorage")
local Client_20 = ReplicatedStorage_28:WaitForChild("Client")
local Interfaces_19 = Client_20:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_19:WaitForChild("Hooks")
local useTheme = require(Hooks_6:WaitForChild("useTheme"))
local ReplicatedStorage_29 = game:GetService("ReplicatedStorage")
local Client_21 = ReplicatedStorage_29:WaitForChild("Client")
local Interfaces_20 = Client_21:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_20:WaitForChild("Hooks")
local useToast = require(Hooks_7:WaitForChild("useToast"))
local u707 = {"Buy", "Sell"}
local function buildGetRecipe(p1) -- Line: 65
    return function(a1) -- Line: 66 -- upvalues: p1 (val)
        if not p1 then
            return nil
        end
        for k, v in pairs(p1) do
            if v.results == a1 then
                return {requirements = v.requirements, grid = v.grid, pattern = v.pattern, amount = v.amount}
            end
        end
        return nil
    end
end
local function MerchantBuyItem(p1) -- Line: 86 -- upvalues: useOrder (val), useToast (val), react (val), Badge (val), useAsyncEffect (val), Promise (val), Form (val), Loading (val), Constants (val), Number (val), HeaderBodyComponent (val), Button (val), Shop (val)
    local name_2, u10, v1, v2
    local Item = p1.Item
    local v3 = useOrder()
    local u5 = useToast()
    v1, u10 = react.useState(false)
    if not Item.meta then
        v2 = 1
    elseif Item.meta[1] then
        v2 = Item.meta[1]
    end
    if 1 >= v2 then
        name_2 = Item.name
    else
        name_2 = ("%* (x%*)"):format(Item.name, v2)
    end
    local v4 = {}
    for k, v in pairs(Item.tags) do
        v4[k .. v] = react.createElement(Badge, {
            Outline = true,
            Text = v,
            Native = {LayoutOrder = 10 + v3()},
            Color = Color3.fromRGB(92, 92, 92),
            TextColor = Color3.fromRGB(171, 171, 171),
        })
    end
    useAsyncEffect(function() -- Line: 108 -- upvalues: Promise (upval), u10 (val)
        return Promise.delay(3):andThen(function() -- Line: 109 -- upvalues: u10 (upval)
            u10(false)
        end)
    end, {v1})
    return react.createElement(Form.Form, {
        Padding = "Large",
        Native = {LayoutOrder = p1.Index},
    }, {Loading = react.createElement(Loading, {Padding = "Large", Enabled = v1}), Left = react.createElement(Form.Divider, {Side = "Left"}, {Price = react.createElement(Badge, {
        Outline = true,
        Text = Constants.Currency.Symbol .. Number.FormatWithCommas(Item.price),
        Native = {LayoutOrder = v3()},
        Color = Color3.fromRGB(59, 92, 59),
        TextColor = Color3.fromRGB(97, 144, 97),
    }), Label = react.createElement(HeaderBodyComponent, {
        Header = name_2,
        Native = {LayoutOrder = v3()},
    })}, v4), Right = react.createElement(Form.Divider, {Side = "Right"}, {Purchase = react.createElement(Button, {
        Text = "Purchase",
        Color = Color3.fromRGB(42, 70, 42),
        Clicked = function() -- Line: 150 -- upvalues: u10 (val), u5 (val), Shop (upval), Item (val)
            u10(true)
            u5({message = "Attempting to process your purchase request...", type = "info"})
            Shop.Purchase.post(Item)
        end,
    })})})
end
local function MerchantBuyPage(p1) -- Line: 161 -- upvalues: Table (val), react (val), MerchantBuyItem (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1 = {}
    local v2 = if not p1.Enabled then {} else Table.copy(p1.Content)
    table.sort(v2, function(p1, p2) -- Line: 169
        if not p1 or not p2 or not p1.price or not p2.price then
            return false
        end
        local v1 = p2.price < p1.price
        return v1
    end)
    for k, v in pairs(v2) do
        if typeof(v) == "table" and v.name then
            v1[v.name .. k] = react.createElement(MerchantBuyItem, {Item = v, Index = k})
        end
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)
end
local function MerchantSellRow(p1) -- Line: 209 -- upvalues: useOrder (val), useToast (val), useTextScale (val), useConstants (val), useTheme (val), react (val), useAsyncEffect (val), Promise (val), Constants (val), Number (val), Color (val), Form (val), Loading (val), Badge (val), Frame (val), HeaderBodyComponent (val), HorizontalListLayout (val), Button (val), Shop (val)
    local Name_2, TotalQty, u15, v1, v2, v3
    local v4 = useOrder()
    local u4 = useToast()
    local v5 = useTextScale()
    local v6 = useConstants()
    local v7 = useTheme()
    v3, u15 = react.useState(false)
    useAsyncEffect(function() -- Line: 224 -- upvalues: Promise (upval), u15 (val)
        return Promise.delay(3):andThen(function() -- Line: 225 -- upvalues: u15 (upval)
            u15(false)
        end)
    end, {v3})
    if 1 >= p1.TotalQty then
        Name_2 = p1.Name
    else
        Name_2 = ("%* (x%*)"):format(p1.Name, p1.TotalQty)
    end
    if 1 >= p1.TotalQty then
        v1 = ""
    else
        v1 = " each"
    end
    local v8 = Constants.Currency.Symbol .. Number.FormatWithCommas(p1.UnitPayout) .. v1
    local v9 = v5(v6.TextSize.Body)
    local v10 = v5(v6.TextSize.Header)
    v1 = math.ceil(math.max(v10, v9) + 2)
    local v11 = Color.Darken(v7.Primary, 0.6)
    local v12 = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    local v13 = {
        Padding = "Large",
        Native = {LayoutOrder = p1.Index},
    }
    local v14 = {Loading = react.createElement(Loading, {Padding = "Large", Enabled = v3})}
    local v15 = {Price = react.createElement(Badge, {
        Outline = true,
        Text = v8,
        Native = {LayoutOrder = v4()},
        Color = Color3.fromRGB(92, 59, 59),
        TextColor = Color3.fromRGB(144, 97, 97),
    })}
    if 1 >= p1.TotalQty then
        v2 = react.createElement(HeaderBodyComponent, {
            Header = Name_2,
            Native = {LayoutOrder = v4()},
        })
    else
        v2 = react.createElement(Frame, {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2.new(1, 0, 0, 0), LayoutOrder = v4()}, {Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }), NameLabel = react.createElement("TextLabel", {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            TextWrapped = true,
            Text = Name_2,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            TextColor3 = Color.Darken(v7.Primary, 0.8),
            TextSize = v10,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v1),
        }), SellAllLabel = react.createElement("TextLabel", {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Text = ("Sell all: %*%*"):format(Constants.Currency.Symbol, (Number.FormatWithCommas(p1.TotalPayout))),
            FontFace = v12,
            TextColor3 = v11,
            TextSize = v9,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v1),
        })})
    end
    v15.Label = v2
    v14.Left = react.createElement(Form.Divider, {Side = "Left"}, v15, {})
    v14.Right = react.createElement(Form.Divider, {Side = "Right"}, {Actions = react.createElement(Frame, {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}, {Layout = react.createElement(HorizontalListLayout, {Spacing = 6, HorizontalAlignment = Enum.HorizontalAlignment.Right}), Sell = react.createElement(Button, {
        Text = "Sell",
        Color = Color3.fromRGB(70, 42, 42),
        Native = {LayoutOrder = 1},
        Clicked = function() -- Line: 326 -- upvalues: u15 (val), u4 (val), p1 (val), Shop (upval)
            u15(true)
            u4({message = "Selling...", type = "info"})
            task.spawn(function() -- Line: 329 -- upvalues: p1 (upval), Shop (upval)
                local v1 = p1.Slots[1]
                if not v1 then
                    return
                end
                Shop.Sell.post({amount = 1, id = v1.invItem.id, offset = v1.invItem.offset})
            end)
        end,
    }), SellAll = react.createElement(Button, {
        Text = "Sell All",
        Color = Color3.fromRGB(55, 38, 38),
        Native = {LayoutOrder = 2},
        Clicked = function() -- Line: 346 -- upvalues: u15 (val), u4 (val), p1 (val), Shop (upval)
            u15(true)
            u4({message = "Selling all...", type = "info"})
            task.spawn(function() -- Line: 349 -- upvalues: p1 (upval), Shop (upval)
                local stackAmt
                local v1 = {}
                for i, v in ipairs(p1.Slots) do
                    if not v.isStackable then
                        stackAmt = 1
                    else
                        stackAmt = v.stackAmt
                    end
                    table.insert(v1, {id = v.invItem.id, offset = v.invItem.offset, amount = stackAmt})
                end
                if 0 < #v1 then
                    Shop.SellMany.post(v1)
                end
            end)
        end,
    })})})
    return react.createElement(Form.Form, v13, v14)
end
local function MerchantSellPage(p1) -- Line: 370 -- upvalues: useStore (val), Inventory (val), ClientInventoryHandler (val), MerchantPricing (val), react (val), MerchantSellRow (val), Shop (val), ScrollingFrame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Constants (val), Number (val)
    local v1, v2
    local v3 = useStore(Inventory.Store, function(p1) -- Line: 375
        if not p1 then
            return {}
        end
        return p1
    end)
    local v4 = {}
    if not p1.Enabled then
        v1 = p1
    elseif not v3 then
        v1 = p1
    else
        local meta, v5, v6, v7, v8, v9
        v2 = {}
        v1 = p1
        for i, v in ipairs(v3) do
            v9 = ClientInventoryHandler.getItemNameFromHash(v.id)
            if v9 and v9 ~= "Marcs" and v9 ~= "Pouch" and not (MerchantPricing.itemTagsBlockMerchantSell(v.tags)) then
                v5 = v.stack == 1
                v6 = 1
                if v5 then
                    meta = v.meta
                    if meta then
                        meta = v.meta[1]
                    end
                    if typeof(meta) ~= "number" then
                        v6 = 1
                    elseif 0 < meta then
                        v6 = meta
                    end
                end
                v7 = v1.SellUnitHints[v9]
                if typeof(v7) ~= "number" then
                    v8 = MerchantPricing.merchantSellPayout(v9, v6, v1.GetRecipe, nil)
                elseif 0 < v7 then
                    v8 = v7 * v6
                end
                if v8 > 0 then
                    if not (v2[v9]) then
                        v2[v9] = {}
                    end
                    table.insert(v2[v9], {invItem = v, stackAmt = v6, payout = v8, isStackable = v5})
                end
            end
        end
        local v10 = {}
        for k, i2 in pairs(v2) do
            v5 = 0
            v6 = 0
            for i3, j in ipairs(i2) do
                v5 = v5 + j.payout
                v6 = v6 + j.stackAmt
            end
            v7 = v1.SellUnitHints[k]
            if typeof(v7) ~= "number" then
                v8 = MerchantPricing.merchantSellPayout(k, 1, v1.GetRecipe, nil)
            elseif 0 < v7 then
                v8 = v7
            end
            table.insert(v10, {
                name = k,
                slots = i2,
                totalPayout = v5,
                totalQty = v6,
                unitPayout = v8,
            })
        end
        table.sort(v10, function(p1, p2) -- Line: 460
            local v1 = p2.totalPayout < p1.totalPayout
            return v1
        end)
        for i4, k2 in ipairs(v10) do
            v4[k2.name] = react.createElement(MerchantSellRow, {
                Index = i4,
                Name = k2.name,
                UnitPayout = k2.unitPayout,
                TotalPayout = k2.totalPayout,
                TotalQty = k2.totalQty,
                Slots = k2.slots,
            })
        end
    end
    v2 = useStore(Shop.MerchantSession, function(p1) -- Line: 476
        if not p1 then
            return 0
        end
        local buybackMarcs = p1.buybackMarcs
        if typeof(buybackMarcs) == "number" then
            return buybackMarcs
        end
        return 0
    end)
    return react.createElement(ScrollingFrame, {Visible = v1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top, HorizontalAlignment = Enum.HorizontalAlignment.Left}), Wallet = react.createElement(Form.Form, {LayoutOrder = 0, Darken = true, Width = "Large", Height = "Medium"}, {Blurb = react.createElement(HeaderBodyComponent, {
        Header = "Merchant purse",
        Wrap = true,
        Body = "This merchant can pay up to " .. Constants.Currency.Symbol .. Number.FormatWithCommas(v2 or 0) .. " for goods.",
        Native = {AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0)},
    })})}, v4)
end
return function(p1) -- Line: 513 -- upvalues: react (val), u707 (val), useStore (val), Inventory (val), buildGetRecipe (val), Shop (val), Tablet (val), Frame (val), PageLayout (val), TabLayout (val), MerchantBuyPage (val), MerchantSellPage (val)
    local Enabled, u6, v1, v2, v3
    v1, u6 = react.useState(u707[1])
    local v4 = {}
    local u12 = useStore(Inventory.Recipes, function(p1) -- Line: 517
        if not p1 or not p1.index then
            return nil
        end
        return p1.index
    end)
    local v5 = react.useMemo(function() -- Line: 523 -- upvalues: buildGetRecipe (upval), u12 (val)
        return buildGetRecipe(u12)
    end, {u12})
    local v6 = useStore(Shop.MerchantSession, function(p1) -- Line: 527
        if not p1 then
            return {}
        end
        local v1 = {}
        local sellUnitHints = p1.sellUnitHints
        if typeof(sellUnitHints) == "table" then
            for i, v in ipairs(sellUnitHints) do
                if v and typeof(v.name) == "string" and typeof(v.unit) == "number" and 0 < v.unit then
                    v1[v.name] = v.unit
                end
            end
        end
        return v1
    end)
    local v7 = p1
    for i, v in ipairs(u707) do
        v2 = {Text = v, LayoutOrder = i}
        v3 = v1 == v
        v2.Selected = v3
        function v2.Clicked() -- Line: 549 -- upvalues: u6 (val), v (val)
            u6(v)
        end
        v4[v] = react.createElement(Tablet, v2)
    end
    local v8 = {Visible = v7.Enabled}
    local v9 = {Layout = react.createElement(PageLayout, {Ratio = false}), Tabs = react.createElement(TabLayout, {Subtabs = true}, v4)}
    local v10 = {Size = UDim2.fromScale(1, 1)}
    v2 = {}
    local v11 = {Content = v7.Content}
    Enabled = if v1 == "Buy" then v7.Enabled else false
    v11.Enabled = Enabled
    v2.Buy = react.createElement(MerchantBuyPage, v11)
    v11 = {}
    local Enabled_2 = v7.Enabled
    if Enabled_2 then
        Enabled_2 = v1 == "Sell"
    end
    v11.Enabled = Enabled_2
    v11.GetRecipe = v5
    v11.SellUnitHints = v6
    v2.Sell = react.createElement(MerchantSellPage, v11)
    v9.Content = react.createElement(Frame, v10, v2)
    return react.createElement(Frame, v8, v9)
end