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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Bloodline.BloodlinePage
--                               Dumped in 0.00194 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Bloodline = require(Namespaces:WaitForChild("Bloodline"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Bloodline_2 = require(Types:WaitForChild("Bloodline"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Menu = Components_7:WaitForChild("Menu")
local Tabs = Menu:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Menu_2 = Components_8:WaitForChild("Menu")
local Tabs_2 = Menu_2:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useInputPopup = require(Hooks_2:WaitForChild("useInputPopup"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_13:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local BloodlineHomePage = require(Subpages:WaitForChild("BloodlineHomePage"))
local BloodlineOverviewSticky = require(v1.Parent:WaitForChild("BloodlineOverviewSticky"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local BloodlineTreePage = require(Subpages_2:WaitForChild("BloodlineTreePage"))
local u452 = {"Overview", "Family Tree"}
local function u455(p1) -- Line: 54
    return {type = "info", message = "Successfully sent a request to create the bloodline " .. p1 .. "."}
end
local function u456(p1) -- Line: 61
    return {"Confirm Creation", "Are you sure you wish to create the bloodline " .. (p1 or "None") .. "? You can only do this once per life.", Color3.fromRGB(0, 255, 13)}
end
local function BloodlinelessPage(p1) -- Line: 71 -- upvalues: react (val), useOrder (val), useToast (val), useAlertPopup (val), u455 (val), Bloodline (val), useInputPopup (val), u456 (val), Form (val), HeaderBodyComponent (val), Button (val), Constants (val), Frame (val), VerticalListLayout (val), Accordion (val)
    local u4, u5
    u4, u5 = react.createBinding("")
    local v1 = useOrder()
    local u9 = useToast()
    local u12 = useAlertPopup(function(p1) -- Line: 79 -- upvalues: u9 (val), u455 (upval), u4 (val), Bloodline (upval)
        if not p1 then
            return
        end
        u9((u455(u4:getValue())))
        Bloodline.Create.post({name = u4:getValue()})
    end)
    local u15 = useInputPopup(function(p1) -- Line: 90 -- upvalues: u12 (val), u456 (upval), u5 (val)
        if not p1 then
            return
        end
        u12(unpack(u456(p1)))
        u5(p1)
    end)
    local v2 = {}
    for k, v in pairs(p1.Invitations) do
        v2[v.name] = react.createElement(Form.Form, {
            Native = {BackgroundTransparency = 1},
        }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = v.name .. " Bloodline", Body = "You have been invited to join the " .. v.name .. " Bloodline.", Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Button = react.createElement(Button, {
            Text = "Accept Invitation",
            Padding = "Large",
            Type = 1,
            Clicked = function() -- Line: 128 -- upvalues: Constants (upval), u9 (val), Bloodline (upval), v (val)
                if Constants.IsSupporterPlace or Constants.IsTestingPlace then
                    u9({message = "Bloodlines are disabled in the Supporter place.", type = "error"})
                    return
                end
                Bloodline.Accept.post({bloodline = v.id})
            end,
        })})})
    end
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), Create = react.createElement(Form.Form, {
        Native = {LayoutOrder = v1()},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Create Bloodline", Body = "You are currently bloodlineless, would you like to create one? This can only be done once per life.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Button = react.createElement(Button, {
        Text = "Create Bloodline",
        Padding = "Large",
        Type = 1,
        Clicked = function() -- Line: 175 -- upvalues: Constants (upval), u9 (val), u15 (val)
            if Constants.IsSupporterPlace or Constants.IsTestingPlace then
                u9({message = "Bloodlines are disabled in the Supporter place.", type = "error"})
                return
            end
            u15("Create Bloodline", "Enter the name of your bloodline", "Bloodline Name")
        end,
    }), Refresh = react.createElement(Button, {
        Text = "Refresh Invitations",
        Padding = "Large",
        Type = 1,
        Clicked = function() -- Line: 191 -- upvalues: Bloodline (upval)
            Bloodline.Refresh.post()
        end,
    })})}), Invites = react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = v1()},
    }, {Invites = react.createElement(Accordion.AccordionItem, {Header = "Bloodline Invitations"}, v2)})})
end
return function(p1) -- Line: 210 -- upvalues: useOrder (val), react (val), u452 (val), useStore (val), Bloodline (val), Bloodline_2 (val), Tablet (val), Frame (val), BloodlinelessPage (val), VerticalListLayout (val), BloodlineOverviewSticky (val), TabLayout (val), BloodlineHomePage (val), BloodlineTreePage (val)
    local u12, u13, u8, v1, v2, v3, v4
    local v5 = useOrder()
    v4, u8 = react.useState(u452[1])
    u12, u13 = react.useState(false)
    local v6 = useStore(Bloodline.Store, function(p1) -- Line: 215 -- upvalues: Bloodline_2 (upval)
        local Bloodlineless = p1
        if not Bloodlineless then
            Bloodlineless = Bloodline_2.Bloodlineless
        end
        return Bloodlineless
    end)
    react.useEffect(function() -- Line: 219 -- upvalues: p1 (val), u12 (val), u13 (val), Bloodline (upval)
        if not p1.Enabled or u12 then
            return
        end
        u13(true)
        Bloodline.Action.post({user = 0, action = 4})
    end, {p1.Enabled})
    local v7 = {}
    local v8 = u452
    local v9 = nil
    local v10 = nil
    for i, j in v8, v9, v10 do
        v2 = {Text = j}
        v3 = v4 == j
        v2.Selected = v3
        v2.LayoutOrder = v5()
        function v2.Clicked(...) -- Line: 236 -- upvalues: u8 (val), j (val)
            u8(j)
        end
        v7[j] = react.createElement(Tablet, v2)
    end
    local createElement = react.createElement
    v10 = {Visible = p1.Enabled}
    local v11 = {}
    local v12 = false
    if v6.id == 0 then
        v1 = {}
        v2 = v6.id == 0
        v1.Enabled = v2
        v1.Invitations = v6.invites
        v12 = react.createElement(BloodlinelessPage, v1)
    end
    v11.Bloodlineless = v12
    v12 = false
    if v6.id ~= 0 then
        v1 = {}
        v2 = v6.id ~= 0
        v1.Visible = v2
        v2 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
        local v13 = v6.id == 0
        v3 = not v13
        if v3 then
            v3 = react.createElement(BloodlineOverviewSticky, {
                Enabled = true,
                Bloodline = v6,
                Native = {LayoutOrder = -2},
            })
        end
        v2.Sticky = v3
        v2.Tabs = react.createElement(TabLayout, {LayoutOrder = -1, Subtabs = true}, v7)
        local v14 = {}
        local v15 = v4 == "Overview"
        v14.Enabled = v15
        v14.Bloodline = v6
        v2.BloodlineHomePage = react.createElement(BloodlineHomePage, v14)
        v14 = {}
        v15 = v4 == "Family Tree"
        v14.Enabled = v15
        v14.Bloodline = v6
        v2.BloodlineTreePage = react.createElement(BloodlineTreePage, v14)
        v12 = react.createElement(Frame, v1, v2)
    end
    v11.Bloodline = v12
    return createElement(Frame, v10, v11)
end