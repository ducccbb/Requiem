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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Staff.Subpages.ServerPage
--                               Dumped in 0.00142 seconds
--                          Bytecode version 9  |  16 functions

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
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local Switch = require(Universal_3:WaitForChild("Switch"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_7:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_8:WaitForChild("Hooks")
local useToast = require(Hooks_2:WaitForChild("useToast"))
return function(p1) -- Line: 30 -- upvalues: useToast (val), useStore (val), Server (val), react (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Switch (val), NumberSliderInput (val)
    local u12, u20, v1, v2
    local u2 = useToast()
    local v3 = useStore(Server.Store, function(p1) -- Line: 33
        return p1
    end)
    v1, u12 = react.useBinding(0.25)
    v2, u20 = react.useBinding(((v3.queueInterval or 2) - 1) / 29)
    local v4 = {Visible = p1.Enabled}
    local v5 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v6 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Permanent Death", Body = "Whether or not the current server is in a permanent death event.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    local v7 = {}
    local v8 = {}
    local v9 = v3.event == 1
    v8.Default = v9
    v9 = v3.event == 1
    v8.Override = v9
    function v8.Toggled(p1) -- Line: 70 -- upvalues: Server (upval)
        Server.Event.post(0)
    end
    v7.Switch = react.createElement(Switch, v8)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v7)
    v5.Event = react.createElement(Form.Form, {}, v6)
    v6 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Soft Event", Body = "Whether or not the current server is in a soft event.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    v7 = {}
    v8 = {}
    v9 = v3.event == 2
    v8.Default = v9
    v9 = v3.event == 2
    v8.Override = v9
    function v8.Toggled(p1) -- Line: 99 -- upvalues: Server (upval)
        Server.Event.post(3)
    end
    v7.Switch = react.createElement(Switch, v8)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v7)
    v5.Soft = react.createElement(Form.Form, {}, v6)
    v6 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Server Locked", Body = "Whether or not the current server is currently locked.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    v7 = {}
    v8 = {}
    v9 = v3.locked == 1
    v8.Default = v9
    v9 = v3.locked == 1
    v8.Override = v9
    function v8.Toggled(p1) -- Line: 128 -- upvalues: Server (upval)
        Server.Event.post(1)
    end
    v7.Switch = react.createElement(Switch, v8)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v7)
    v5.Locked = react.createElement(Form.Form, {}, v6)
    v6 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Free Escape", Body = "Whether or not players can use the escape command.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    v7 = {}
    v8 = {}
    v9 = v3.freeEscape == 1
    v8.Default = v9
    v9 = v3.freeEscape == 1
    v8.Override = v9
    function v8.Toggled(p1) -- Line: 157 -- upvalues: Server (upval)
        Server.Event.post(4)
    end
    v7.Switch = react.createElement(Switch, v8)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v7)
    v5.FreeEscape = react.createElement(Form.Form, {}, v6)
    v6 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Join Queue", Body = "When enabled, joins are rate-limited and overflow players wait in a priority queue.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    v7 = {}
    v8 = {}
    if v3.queue or 0 == 1 then
        v9 = true
    else
        v9 = false
    end
    v8.Default = v9
    if v3.queue or 0 == 1 then
        v9 = true
    else
        v9 = false
    end
    v8.Override = v9
    function v8.Toggled(p1) -- Line: 186 -- upvalues: Server (upval)
        Server.Event.post(5)
    end
    v7.Switch = react.createElement(Switch, v8)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v7)
    v5.Queue = react.createElement(Form.Form, {}, v6)
    v5.QueueInterval = react.createElement(NumberSliderInput, {
        Body = "Seconds between each player admitted when the join queue is enabled.",
        RichText = true,
        Minimum = 1,
        Maximum = 30,
        Button = "Set Interval",
        Header = v2:map(function(p1) -- Line: 194
            local v1 = math.round(p1 * 29 + 1)
            local v2 = math.clamp(v1, 1, 30)
            return (("Join Interval <font transparency=\"0.4\">[%*s]</font>"):format(v2))
        end),
        Initial = ((v3.queueInterval or 2) - 1) / 29,
        Clicked = function(p1) -- Line: 210 -- upvalues: u2 (val), Server (upval)
            local v1 = math.round(p1 * 29 + 1)
            local v2 = math.clamp(v1, 1, 30)
            u2({type = "info", message = "Attempting to set join interval to " .. v2 .. "s..."})
            Server.Queue.post(v2)
        end,
        Update = function(p1) end,
        Stepped = function(p1) -- Line: 223 -- upvalues: u20 (val)
            u20(p1)
        end,
        Native = {LayoutOrder = 4},
    })
    v5.Players = react.createElement(NumberSliderInput, {
        Body = "The number of players allowed in the server.",
        Initial = 0.25,
        RichText = true,
        Minimum = 0,
        Maximum = 500,
        Button = "Set Players",
        Header = v1:map(function(p1) -- Line: 233
            return (("Players <font transparency=\"0.4\">[%* / 500]</font>"):format((math.floor(p1 * 500))))
        end),
        Clicked = function(p1) -- Line: 248 -- upvalues: u2 (val), Server (upval)
            u2({type = "info", message = "Attempting to set players to " .. math.floor(p1 * 500) .. "..."})
            Server.Players.post((math.floor(p1 * 500)))
        end,
        Update = function(p1) end,
        Stepped = function(p1) -- Line: 260 -- upvalues: u12 (val)
            u12(p1)
        end,
        Native = {LayoutOrder = 3},
    })
    return react.createElement(Frame, v4, v5)
end