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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Staff.StaffPage
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Administration_2 = Common:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Error = require(Interfaces:WaitForChild("Error"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components = Interfaces_2:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_4:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_5:WaitForChild("Components")
local Menu = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_6:WaitForChild("Components")
local Menu_2 = Components_5:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_7:WaitForChild("Components")
local Menu_3 = Components_6:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local EconomyPage = require(Subpages:WaitForChild("EconomyPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local HealthPage = require(Subpages_2:WaitForChild("HealthPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local PlayersPage = require(Subpages_3:WaitForChild("PlayersPage"))
local Subpages_4 = v1.Parent:WaitForChild("Subpages")
local ServerPage = require(Subpages_4:WaitForChild("ServerPage"))
local u371 = {"Event Status", "Server Health", "Player Status", "Economy Management"}
return function(p1) -- Line: 52 -- upvalues: react (val), u371 (val), useMenuPage (val), useRem (val), Tablet (val), useStore (val), Administration (val), Permissions (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), ScrollingFrame (val), Error (val), ServerPage (val), HealthPage (val), PlayersPage (val), EconomyPage (val)
    local u6, v1, v2, v3
    v1, u6 = react.useState(u371[1])
    local Admin = useMenuPage("Admin")
    local v4 = useRem()
    local v5 = {}
    for i, v in ipairs(u371) do
        v2 = {Text = v}
        v3 = v1 == v
        v2.Selected = v3
        v2.LayoutOrder = i
        v3 = i < #u371
        v2.ShowDivider = v3
        function v2.Clicked() -- Line: 67 -- upvalues: u6 (val), v (val)
            u6(v)
        end
        v5[v] = react.createElement(Tablet, v2)
    end
    local v6 = useStore(Administration.Store, function(p1) -- Line: 73
        return p1
    end)
    if not v6.permission then
        local v7 = {
            Enabled = Admin,
            Tween = TweenInfo.new(0.3),
            Delays = {Enabled = 0.2, Disabled = 0},
        }
        local v8 = {}
        v3 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Tabs = react.createElement(TabLayout, {}, v5)}
        local v9 = {BackgroundTransparency = 1}
        local v10 = UDim2.fromScale(1, 1)
        v9.Size = v10 + UDim2.fromOffset(0, -v4(75))
        v10 = UDim2.fromScale(0.5, 0)
        v9.Position = v10 + UDim2.fromOffset(0, v4(75))
        v9.AnchorPoint = Vector2.new(0.5, 0)
        local v11 = {}
        local v12 = {Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
        local v13 = {}
        local v14 = {}
        local v15 = {}
        local v16 = v1 == "Event Status"
        v15.Enabled = v16
        v14.Server = react.createElement(ServerPage, v15)
        v13.Server = react.createElement(Error.Boundary, {}, v14)
        v14 = {}
        v15 = {}
        v16 = v1 == "Server Health"
        v15.Enabled = v16
        v14.Health = react.createElement(HealthPage, v15)
        v13.Health = react.createElement(Error.Boundary, {}, v14)
        v14 = {}
        v15 = {}
        v16 = v1 == "Player Status"
        v15.Enabled = v16
        v14.Players = react.createElement(PlayersPage, v15)
        v13.Players = react.createElement(Error.Boundary, {}, v14)
        v14 = {}
        v15 = {}
        v16 = v1 == "Economy Management"
        v15.Enabled = v16
        v14.Economy = react.createElement(EconomyPage, v15)
        v13.Economy = react.createElement(Error.Boundary, {}, v14)
        v11.Scroll = react.createElement(ScrollingFrame, v12, v13)
        v3.Subpages = react.createElement("Frame", v9, v11)
        v8.Content = react.createElement(Content, {}, v3)
        return react.createElement(TransparencyGroup, v7, v8)
    elseif v6.permission < Permissions.Accessability.Events then
        return react.createElement(react.Fragment)
    elseif v6.staffSlot == 0 then
        return react.createElement(react.Fragment)
    end
end