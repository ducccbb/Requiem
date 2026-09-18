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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Economy.EconomyPage
--                               Dumped in 0.00250 seconds
--                          Bytecode version 9  |  7 functions

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
local Governor = require(Namespaces:WaitForChild("Governor"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Resources = require(Namespaces_2:WaitForChild("Resources"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Error = require(Interfaces:WaitForChild("Error"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Constants = require(Common_3:WaitForChild("Constants"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components = Interfaces_2:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_4:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_5:WaitForChild("Components")
local Menu = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_6:WaitForChild("Components")
local Menu_2 = Components_5:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_7:WaitForChild("Components")
local Menu_3 = Components_6:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local Governor_2 = Subpages:WaitForChild("Governor")
local GovernorPage = require(Governor_2:WaitForChild("GovernorPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local Reputation = Subpages_2:WaitForChild("Reputation")
local ReputationPage = require(Reputation:WaitForChild("ReputationPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local Resources_2 = Subpages_3:WaitForChild("Resources")
local ResourcePage = require(Resources_2:WaitForChild("ResourcePage"))
return function(p1) -- Line: 51 -- upvalues: useStore (val), Governor (val), Resources (val), react (val), Constants (val), useMenuPage (val), useRem (val), Tablet (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), ScrollingFrame (val), Error (val), ReputationPage (val), GovernorPage (val), ResourcePage (val)
    local u22, u282, v1, v2
    local u5 = useStore(Governor.Store, function(p1) -- Line: 52
        return p1
    end)
    local u10 = useStore(Resources.Store, function(p1) -- Line: 56
        return p1
    end)
    local u280 = react.useMemo(function() -- Line: 60 -- upvalues: u5 (val), Constants (upval), u10 (val)
        local v1 = {"Reputation"}
        local v2 = #u5
        if 0 < v2 and not Constants.IsSupporterPlace then
            table.insert(v1, "Governor")
        end
        if u10.loaded == 1 and not Constants.IsSupporterPlace then
            table.insert(v1, "Resources")
        end
        return v1
    end, {u5, u10.loaded})
    u282, u22 = react.useState(u280[1])
    local Economy = useMenuPage("Economy")
    local v3 = useRem()
    react.useEffect(function() -- Line: 78 -- upvalues: u280 (val), u282 (val), u22 (val)
        if not (table.find(u280, u282)) then
            u22(u280[1])
        end
    end, {u280, u282})
    local v4 = {}
    for i, v in ipairs(u280) do
        v1 = {Text = v}
        v2 = u282 == v
        v1.Selected = v2
        v1.LayoutOrder = i
        v2 = i < #u280
        v1.ShowDivider = v2
        function v1.Clicked() -- Line: 94 -- upvalues: u22 (val), v (val)
            u22(v)
        end
        v4[v] = react.createElement(Tablet, v1)
    end
    local v5 = {
        Enabled = Economy,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v6 = {}
    v1 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Tabs = react.createElement(TabLayout, {}, v4)}
    local v7 = {BackgroundTransparency = 1}
    local v8 = UDim2.fromScale(1, 1)
    v7.Size = v8 + UDim2.fromOffset(0, -v3(75))
    v8 = UDim2.fromScale(0.5, 0)
    v7.Position = v8 + UDim2.fromOffset(0, v3(75))
    v7.AnchorPoint = Vector2.new(0.5, 0)
    local v9 = {}
    local v10 = {Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v11 = {}
    local v12 = {}
    local v13 = {}
    local v14 = Economy
    if v14 then
        v14 = u282 == "Reputation"
    end
    v13.Enabled = v14
    v12.Reputation = react.createElement(ReputationPage, v13)
    v11.Reputation = react.createElement(Error.Boundary, {}, v12)
    v12 = {}
    v13 = {}
    v14 = Economy
    if v14 then
        v14 = u282 == "Governor"
    end
    v13.Enabled = v14
    v12.Governor = react.createElement(GovernorPage, v13)
    v11.Governor = react.createElement(Error.Boundary, {}, v12)
    v12 = {}
    v13 = {}
    v14 = Economy
    if v14 then
        v14 = u282 == "Resources"
    end
    v13.Enabled = v14
    v12.Resources = react.createElement(ResourcePage, v13)
    v11.Resources = react.createElement(Error.Boundary, {}, v12)
    v9.Scroll = react.createElement(ScrollingFrame, v10, v11)
    v1.Subpages = react.createElement("Frame", v7, v9)
    v6.Content = react.createElement(Content, {}, v1)
    return react.createElement(TransparencyGroup, v5, v6)
end