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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Profile.Subpages.VouchersPage
--                               Dumped in 0.00181 seconds
--                          Bytecode version 9  |  8 functions

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
local Vouchers = require(Namespaces:WaitForChild("Vouchers"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives_3 = Components_7:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local u308 = {Enchantment = "An enchantment voucher which can be used to claim an enchantment.", Wage = "A wage voucher which can be used to claim your wage."}
u308["Trainee Camp"] = "You are able to skip portions of the training process."
u308.Auxiliary = "You are to join immediately into a branch."
u308.Remnants = "You are able to spend remnants to claim a rarity."
local u314 = {
    Recustomize = 6,
    Wage = 5,
    Auxiliary = 4,
    Remnants = 3,
    Enchantment = 2,
}
u314["Sacrament Reset"] = 1
local function groupVouchers(p1) -- Line: 60 -- upvalues: u314 (val)
    local v1
    local v2 = {}
    local v3 = p1
    if not v3 then
        v3 = {}
    end
    for i, v in ipairs(v3) do
        v1 = v2[v.type]
        if not v1 then
            v2[v.type] = {count = 1, type = v.type, voucher = v}
        else
            v1.count = v1.count + 1
        end
    end
    local v4 = {}
    v3 = v2
    local v5 = nil
    local v6 = nil
    for i2, j in v3, v5, v6 do
        table.insert(v4, j)
    end
    table.sort(v4, function(p1, p2) -- Line: 81 -- upvalues: u314 (upval)
        local v1
        local v2 = u314[p1.type] or -1
        local v3 = u314[p2.type] or -1
        if v2 == v3 then
            v1 = p1.type < p2.type
            return v1
        end
        v1 = v3 < v2
        return v1
    end)
    return v4
end
return function(p1) -- Line: 95 -- upvalues: useRem (val), useOrder (val), useStore (val), Vouchers (val), react (val), groupVouchers (val), Form (val), u314 (val), HeaderBodyComponent (val), u308 (val), Button (val), Frame (val), VerticalListLayout (val), Checkbox (val), ScrollingFrame (val)
    local v1 = useRem()
    local v2 = useOrder()
    local u9 = useStore(Vouchers.Store, function(p1) -- Line: 99
        return p1
    end)
    local v3 = react.useMemo(function() -- Line: 103 -- upvalues: groupVouchers (upval), u9 (val)
        return groupVouchers(u9)
    end, {u9})
    local v4 = {}
    for i, v in ipairs(v3) do
        v4[v.type] = react.createElement(Form.Form, {Darken = false, LayoutOrder = u314[v.type]}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, RichText = true, Header = ("%* <font transparency=\"0.5\">(x%*)</font>"):format(v.type, v.count), Body = u308[v.type] or "No description available."})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Redeem = react.createElement(Button, {
            Text = "Redeem",
            Clicked = function() -- Line: 129 -- upvalues: Vouchers (upval), v (val)
                Vouchers.Claim.post(v.voucher)
            end,
        })})})
    end
    local v5 = {Visible = p1.Enabled}
    local v6 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local createElement = react.createElement
    local v7 = {}
    local v8 = {}
    local v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, v1(60))
    v7.Native = v8
    v6.Filters = createElement(Form.Form, v7, {Left = react.createElement(Form.Divider, {Side = "Left", Padding = "P_30"}, {Alive = react.createElement(Checkbox, {
        Default = false,
        Label = "Autoclaim Vouchers",
        Native = {LayoutOrder = v2()},
        Toggled = function(p1) end,
    })})})
    v6.Results = react.createElement(ScrollingFrame, {LayoutOrder = v2()}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v4)
    return react.createElement(Frame, v5, v6)
end