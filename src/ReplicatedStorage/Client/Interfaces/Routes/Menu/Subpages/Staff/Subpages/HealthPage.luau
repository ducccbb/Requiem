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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Staff.Subpages.HealthPage
--                               Dumped in 0.00128 seconds
--                          Bytecode version 9  |  6 functions

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
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Charts = Universal:WaitForChild("Charts")
local Bar = require(Charts:WaitForChild("Bar"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Charts_2 = Universal_2:WaitForChild("Charts")
local Line = require(Charts_2:WaitForChild("Line"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_4 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Menu = Components_7:WaitForChild("Menu")
local Tabs = Menu:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Menu_2 = Components_8:WaitForChild("Menu")
local Tabs_2 = Menu_2:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local u351 = {"Network Bandwidth", "Average Ping"}
local function ServerLatencyPage(p1) -- Line: 39 -- upvalues: useOrder (val), useRem (val), react (val), Form (val), HeaderBodyComponent (val), Line (val)
    local v1 = useRem()
    local v2 = {
        Native = {LayoutOrder = useOrder()(), Visible = p1.Enabled},
    }
    local v3 = {}
    local v4 = {BackgroundTransparency = 1}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v1(340))
    local v6 = {Label = react.createElement(HeaderBodyComponent, {
        Header = "Average Ping",
        Body = "The average ping between clients and the server.",
        Wrap = true,
        Position = UDim2.fromScale(0, 0),
        Native = {AnchorPoint = Vector2.new(0, 0)},
    })}
    local v7 = {
        Data = p1.Server.latency,
        Tooltips = {
            {"Average Ping", "Averaging %d/ms"},
            {"Total Players", "%d Player(s)"},
        },
    }
    local v8 = {}
    local v9 = UDim2.fromScale(0.5, 0.5)
    v8.Position = v9 + UDim2.fromOffset(0, v1(45))
    v7.Native = v8
    v6.Chart = react.createElement(Line, v7)
    v3.Container = react.createElement("Frame", v4, v6)
    return react.createElement(Form.Form, v2, v3)
end
local function ServerNetworkHealthPage(p1) -- Line: 79 -- upvalues: useOrder (val), useRem (val), react (val), Form (val), HeaderBodyComponent (val), Bar (val)
    local v1 = useRem()
    local v2 = {
        Native = {LayoutOrder = useOrder()(), Visible = p1.Enabled},
    }
    local v3 = {}
    local v4 = {BackgroundTransparency = 1}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v1(340))
    local v6 = {Label = react.createElement(HeaderBodyComponent, {
        Header = "Networking Bandwidth",
        Body = "The amount of information being sent between the server and client.",
        Wrap = true,
        Position = UDim2.fromScale(0, 0),
        Native = {AnchorPoint = Vector2.new(0, 0)},
    })}
    local v7 = {
        Data = p1.Server.networking,
        Tooltips = {
            {"Physics Recieved", "Averaged over period %d megabit/s"},
            {"Physics Sent", "Averaged over period %d megabit/s"},
            {"Networking Recieved", "Averaged over period %d megabit/s"},
            {"Networking Sent", "Averaged over period %d megabit/s"},
        },
    }
    local v8 = {}
    local v9 = UDim2.fromScale(0.5, 0.5)
    v8.Position = v9 + UDim2.fromOffset(0, v1(45))
    v7.Native = v8
    v6.Chart = react.createElement(Bar, v7)
    v3.Container = react.createElement("Frame", v4, v6)
    return react.createElement(Form.Form, v2, v3)
end
return function(p1) -- Line: 121 -- upvalues: react (val), u351 (val), useStore (val), Server (val), Tablet (val), Frame (val), VerticalListLayout (val), TabLayout (val), ServerNetworkHealthPage (val), ServerLatencyPage (val)
    local u6, v1, v2, v3
    v1, u6 = react.useState(u351[1])
    local v4 = useStore(Server.Store, function(p1) -- Line: 123
        return p1
    end)
    local v5 = {}
    for i, v in ipairs(u351) do
        v2 = {Text = v}
        v3 = v1 == v
        v2.Selected = v3
        function v2.Clicked(...) -- Line: 135 -- upvalues: u6 (val), v (val)
            u6(v)
        end
        v5[v] = react.createElement(Tablet, v2)
    end
    local v6 = {Visible = p1.Enabled}
    local v7 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), Tabs = react.createElement(TabLayout, {Subtabs = true}, v5)}
    local v8 = {}
    v2 = v1 == "Network Bandwidth"
    v8.Enabled = v2
    v8.Server = v4
    v7.Bandwidth = react.createElement(ServerNetworkHealthPage, v8)
    v8 = {}
    v2 = v1 == "Average Ping"
    v8.Enabled = v2
    v8.Server = v4
    v7.Latency = react.createElement(ServerLatencyPage, v8)
    return react.createElement(Frame, v6, v7)
end