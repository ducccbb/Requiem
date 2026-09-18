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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Staff.Subpages.PlayersPage
--                               Dumped in 0.00183 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local Image = require(Primitives_2:WaitForChild("Image"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Radios = require(Universal:WaitForChild("Radios"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local TextInput = require(Inputs:WaitForChild("TextInput"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_4 = Components_6:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_2 = Components_7:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_3 = Components_8:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Universal_4 = Components_9:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local u423 = {"Alive", "Dead", "Pending"}
return function(p1) -- Line: 41 -- upvalues: useTheme (val), useRem (val), useOrder (val), react (val), u423 (val), useStore (val), Player (val), Table (val), Form (val), Image (val), Branches (val), HeaderBodyComponent (val), Radios (val), Frame (val), VerticalListLayout (val), TextInput (val), Checkbox (val), ScrollingFrame (val)
    local u12, u13, u17, v1, v2, v3, v4, v5, v6, v7
    local v8 = useTheme()
    local v9 = useRem()
    local v10 = useOrder()
    u12, u13 = react.useState((table.clone(u423)))
    u17, v7 = react.useState("")
    local v11 = useStore(Player.Store, function(p1) -- Line: 49
        return p1.players
    end)
    react.useEffect(function() -- Line: 53 -- upvalues: p1 (val), Player (upval)
        if p1.Enabled then
            Player.Request.post(0)
        end
    end, {p1.Enabled, u12})
    local v12 = Table.filter(v11, function(p1) -- Line: 59 -- upvalues: u17 (val), u12 (val)
        local status = p1.status
        local v1 = string.lower(p1.username)
        local v2 = string.sub(v1, 1, #u17)
        local v3 = v2 == string.lower(u17)
        if not v3 then
            return false
        end
        if u12[1] ~= "Alive" then
            if u12[2] ~= "Dead" then
                if u12[3] == "Pending" then
                    if status == 3 then
                        return true
                    end
                    return false
                end
                return false
            end
            if status == 2 then
                return true
            end
            if u12[3] ~= "Pending" then
                return false
            end
            if status == 3 then
                return true
            end
            return false
        elseif status == 1 then
            return true
        end
    end)
    local v13 = {}
    for k, v in pairs(v12) do
        v1 = v.name .. v.username
        v2 = {LayoutOrder = v.branch}
        v3 = {}
        v4 = {}
        v5 = {}
        v6 = v9(40)
        v5.Size = UDim2.fromOffset(v6, v9(40))
        v5.Image = Branches.Labels[v.branch]
        v4.Icon = react.createElement(Image, v5)
        v4.Label = react.createElement(HeaderBodyComponent, {Header = v.username, Body = v.name})
        v3.Left = react.createElement(Form.Divider, {Side = "Left"}, v4)
        v3.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "P_30"}, {react.createElement(Radios, {
            Options = u423,
            Selected = u423[v.status],
            Toggled = function(p1) -- Line: 107 -- upvalues: Player (upval), v (val), u423 (upval)
                Player.Update.post({user = v.username, status = table.find(u423, p1)})
            end,
        })})
        v13[v1] = react.createElement(Form.Form, v2, v3)
    end
    local v14 = {Visible = p1.Enabled}
    local v15 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), Event = react.createElement(Form.Form, {}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Players", Body = "A list of all players and their current status relative to the event.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})})}
    local createElement_2 = react.createElement
    local v16 = {}
    local v17 = {}
    v3 = UDim2.fromScale(1, 0)
    v17.Size = v3 + UDim2.fromOffset(0, v9(60))
    v16.Native = v17
    v17 = {}
    local v18 = {}
    local v19 = {Layout = 3, Header = "Search...", Color = v8.PageBackground}
    local v20 = {BackgroundTransparency = 1}
    local v21 = UDim2.fromScale(0.7, 0)
    v20.Size = v21 + UDim2.fromOffset(0, v9(70))
    v20.LayoutOrder = 3 - v10()
    v20.Position = UDim2.fromScale(0.5, 0.5)
    v19.Native = v20
    v19.Stepped = v7
    v18.Search = react.createElement(TextInput, v19)
    v17.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Medium"}, v18)
    v17.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "P_30"}, {Alive = react.createElement(Checkbox, {
        Default = true,
        Label = "Alive",
        Native = {LayoutOrder = v10()},
        Toggled = function(p1) -- Line: 174 -- upvalues: u12 (val), u13 (val)
            local v1
            if not p1 then
                v1 = nil
            else
                v1 = "Alive"
            end
            u12[1] = v1
            u13(table.clone(u12))
        end,
    }), Dead = react.createElement(Checkbox, {
        Default = true,
        Label = "Dead",
        Native = {LayoutOrder = v10()},
        Toggled = function(p1) -- Line: 184 -- upvalues: u12 (val), u13 (val)
            local v1
            if not p1 then
                v1 = nil
            else
                v1 = "Dead"
            end
            u12[2] = v1
            u13(table.clone(u12))
        end,
    }), Pending = react.createElement(Checkbox, {
        Default = true,
        Label = "Pending",
        Native = {LayoutOrder = v10()},
        Toggled = function(p1) -- Line: 194 -- upvalues: u12 (val), u13 (val)
            local v1
            if not p1 then
                v1 = nil
            else
                v1 = "Pending"
            end
            u12[3] = v1
            u13(table.clone(u12))
        end,
    })})
    v15.Filters = createElement_2(Form.Form, v16, v17)
    v15.Results = react.createElement(ScrollingFrame, {LayoutOrder = v10()}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v13)
    return react.createElement(Frame, v14, v15)
end