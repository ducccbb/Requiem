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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Stores.Store
--                               Dumped in 0.00118 seconds
--                          Bytecode version 9  |  6 functions

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
local Shop = require(Namespaces:WaitForChild("Shop"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_6:WaitForChild("Utilities")
local Scaler = require(Utilities_2:WaitForChild("Scaler"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_7:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local Shops = v1.Parent:WaitForChild("Shops")
local Banker = require(Shops:WaitForChild("Banker"))
local Shops_2 = v1.Parent:WaitForChild("Shops")
local Merchant = require(Shops_2:WaitForChild("Merchant"))
local Shops_3 = v1.Parent:WaitForChild("Shops")
local Stablemen = require(Shops_3:WaitForChild("Stablemen"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local u260 = {
    header = "Unknown Store",
    body = "Unknown Store Description.",
    icon = "rbxassetid://11433532654",
    visible = false,
    content = {},
}
return function() -- Line: 52 -- upvalues: useInterfaceState (val), u260 (val), react (val), useStore (val), Shop (val), Table (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), Stablemen (val), Banker (val), Merchant (val)
    local shop, shop_2, u12, u27, v1
    shop, shop_2 = useInterfaceState("shop")
    local v2 = shop_2
    if not v2 then
        v2 = u260
    end
    local u7 = v2
    v2, u12 = react.useState(u7.visible)
    local visible = u7
    if visible then
        visible = false
        if u7.content ~= nil then
            visible = u7.visible
            if visible then
                visible = v2
            end
        end
    end
    local u22 = useStore(Shop.Store, function(p1) -- Line: 60
        if not p1 then
            return {}
        end
        return p1
    end)
    v1, u27 = react.useState({})
    react.useEffect(function() -- Line: 69 -- upvalues: u22 (val), Table (upval), u7 (ref), shop (val), u27 (val), u12 (val)
        if not u22 then
            return
        end
        local v1 = Table.copy(u7)
        v1.content = u22
        shop(v1)
        u27(u22)
        u12(v1.visible)
    end, {u22})
    react.useEffect(function() -- Line: 83 -- upvalues: u12 (val), u7 (ref)
        u12(u7.visible)
    end, {u7.visible})
    local v3 = {Page = react.createElement(DynamicPage, {Enabled = visible})}
    local v4 = {
        ZIndex = 3,
        Enabled = visible,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v7 = {}
    local v8 = {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Header = react.createElement(PageHeader, {
        Header = u7.header,
        Body = u7.body,
        Icon = u7.icon,
        Closed = function() -- Line: 114 -- upvalues: u7 (ref), u12 (val), shop (val)
            u7.visible = false
            u12(false)
            shop(table.clone(u7))
        end,
    })}
    local v9 = {Size = UDim2.fromScale(1, 0.823)}
    local v10 = {}
    local v11 = {}
    local v12 = visible
    if v12 then
        v12 = u7.header == "Stablemen"
    end
    v11.Enabled = v12
    v11.Content = v1
    v11.Interaction = u7.interaction
    v10.Stablemen = react.createElement(Stablemen, v11)
    v11 = {}
    v12 = visible
    if v12 then
        v12 = u7.header == "Banker"
    end
    v11.Enabled = v12
    v11.Content = v1
    v11.Interaction = u7.interaction
    v10.Banker = react.createElement(Banker, v11)
    v11 = {}
    v12 = visible
    if v12 then
        v12 = u7.header == "Merchant"
    end
    v11.Enabled = v12
    v11.Content = v1
    v11.Interaction = u7.interaction
    v10.Merchant = react.createElement(Merchant, v11)
    v8.Content = react.createElement(Frame, v9, v10)
    v7.Scaler = react.createElement(Scaler, {
        Enabled = visible,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v8)
    v5.Content = react.createElement("Frame", v6, v7)
    v3[1] = react.createElement(TransparencyGroup, v4, v5)
    return react.createElement(Frame, {}, v3)
end