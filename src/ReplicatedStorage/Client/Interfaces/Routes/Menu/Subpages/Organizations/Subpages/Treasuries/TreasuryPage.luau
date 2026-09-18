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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Treasuries.TreasuryPage
--                               Dumped in 0.00192 seconds
--                          Bytecode version 9  |  11 functions

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
local Treasury = require(Namespaces:WaitForChild("Treasury"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Tabs = Menu:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local Tabs_2 = Menu_2:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local TreasuryAuditPage = require(Subpages:WaitForChild("TreasuryAuditPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local TreasuryHomePage = require(Subpages_2:WaitForChild("TreasuryHomePage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local TreasuryIncomePage = require(Subpages_3:WaitForChild("TreasuryIncomePage"))
local TreasuryOverviewSticky = require(v1.Parent:WaitForChild("TreasuryOverviewSticky"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_6:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_3:WaitForChild("useThrottleCallback"))
local u294 = {"Overview", "Income Sources", "Audit Logs"}
return function(p1) -- Line: 48 -- upvalues: useOrder (val), react (val), u294 (val), useStore (val), Treasury (val), Table (val), useThrottleCallback (val), Tablet (val), Frame (val), VerticalListLayout (val), TreasuryOverviewSticky (val), TabLayout (val), TreasuryHomePage (val), TreasuryIncomePage (val), TreasuryAuditPage (val)
    local u121, u147, u211, u22, u23, u8, v1, v2
    local v3 = useOrder()
    v1, u8 = react.useState(u294[1])
    local u144 = useStore(Treasury.Store, function(p1) -- Line: 53
        return p1
    end)
    u211, u147 = react.useState(nil)
    u22, u23 = react.useState(false)
    local v4 = u144
    if not v4 then
        v4 = {}
    end
    local v5 = Table.filter(v4, function(p1) -- Line: 60 -- upvalues: u211 (val)
        if not p1 or typeof(p1) ~= "table" then
            return false
        end
        local v1 = p1.treasuryID == u211
        return v1
    end)[1]
    react.useEffect(function() -- Line: 68 -- upvalues: u144 (val), u211 (val), u147 (val)
        if u144 and not u211 then
            local v1 = #u144
            if 0 < v1 then
                u147(u144[1].treasuryID)
            end
        end
    end, {u144})
    react.useEffect(function() -- Line: 75 -- upvalues: u144 (val), u211 (val), u147 (val)
        if not u144 or not u211 then
            return
        end
        local v1 = false
        for i, v in ipairs(u144) do
            if v.treasuryID == u211 then
                v1 = true
                break
            end
        end
        if v1 then
            return
        end
        local v2 = #u144
        if 0 < v2 then
            u147(u144[1].treasuryID)
            return
        end
        u147(nil)
    end, {u144, u211})
    local u56 = useThrottleCallback(function() -- Line: 99 -- upvalues: Treasury (upval)
        Treasury.Update.post({key = math.random(1, 500000)})
    end, {wait = 5, trailing = false}, {p1.Selected, p1.Enabled})
    react.useEffect(function() -- Line: 103 -- upvalues: p1 (val), u22 (val), u23 (val), u56 (val)
        if p1.Selected and p1.Enabled and not u22 then
            u23(true)
            u56.run()
        end
    end, {p1.Selected, p1.Enabled, u22})
    v4 = react.useMemo(function() -- Line: 110 -- upvalues: u144 (val)
        if not u144 then
            return {}
        end
        local v1 = {}
        for i, v in ipairs(u144) do
            table.insert(v1, {v.name, v.treasuryID})
        end
        return v1
    end, {u144})
    local v6 = {}
    if not u211 then
        u121 = p1
    else
        local v7
        u121 = p1
        for i, v in ipairs(u294) do
            v2 = {Text = v}
            v7 = v1 == v
            v2.Selected = v7
            v2.LayoutOrder = v3()
            function v2.Clicked(...) -- Line: 133 -- upvalues: u8 (val), v (val)
                u8(v)
            end
            v6[v] = react.createElement(Tablet, v2)
        end
    end
    local createElement = react.createElement
    local v8 = {Visible = u121.Enabled}
    local v9 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v10 = v5
    if v10 then
        v10 = react.createElement(TreasuryOverviewSticky, {
            Enabled = true,
            Treasury = v5,
            Treasuries = v4,
            Selected = function(p1) -- Line: 153 -- upvalues: u144 (val), u147 (val)
                for i, v in ipairs(u144) do
                    if p1 == v.name then
                        u147(v.treasuryID)
                    end
                end
            end,
            Native = {LayoutOrder = -2, ZIndex = 5},
        })
    end
    v9.Sticky = v10
    local v11 = {LayoutOrder = -1, Subtabs = true}
    v9.Tabs = react.createElement(TabLayout, v11, v6)
    v10 = u211
    if v10 then
        v11 = {}
        v2 = v1 == "Overview"
        v11.Enabled = v2
        v11.Selected = u121.Selected
        v11.Treasury = v5
        v10 = react.createElement(TreasuryHomePage, v11)
    end
    v9.Home = v10
    v10 = u211
    if v10 then
        v11 = {}
        v2 = v1 == "Income Sources"
        v11.Enabled = v2
        v11.Selected = u121.Selected
        v11.Treasury = v5
        v10 = react.createElement(TreasuryIncomePage, v11)
    end
    v9.Income = v10
    v10 = u211
    if v10 then
        v11 = {}
        v2 = v1 == "Audit Logs"
        v11.Enabled = v2
        v11.Selected = u121.Selected
        v11.Treasury = v5
        v10 = react.createElement(TreasuryAuditPage, v11)
    end
    v9.Audit = v10
    return createElement(Frame, v8, v9)
end