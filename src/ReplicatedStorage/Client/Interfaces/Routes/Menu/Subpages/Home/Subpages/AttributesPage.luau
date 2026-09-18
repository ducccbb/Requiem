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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.AttributesPage
--                              Dumped in 0.000571 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal_2 = Components_2:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
return function(p1) -- Line: 29 -- upvalues: react (val), ClientAttributesHandler (val), Form (val), HeaderBodyComponent (val), ScrollingFrame (val), VerticalListLayout (val)
    local u4, u5
    u4, u5 = react.useState(0)
    local v1 = react.useMemo(function() -- Line: 32 -- upvalues: ClientAttributesHandler (upval), react (upval), Form (upval), HeaderBodyComponent (upval)
        local v1
        local v2 = {}
        for k, v in pairs((ClientAttributesHandler.getAttributes())) do
            v1 = tostring(k)
            v2[v1] = react.createElement(Form.Form, {}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = tostring(k), Body = tostring(v)})})})
        end
        return v2
    end, {u4})
    react.useEffect(function() -- Line: 52 -- upvalues: ClientAttributesHandler (upval), u5 (val), u4 (val)
        local u5
        u5 = ClientAttributesHandler.Changed:Connect(function() -- Line: 53 -- upvalues: u5 (upval), u4 (upval)
            u5(u4 + 1)
        end)
        return function() -- Line: 57 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {u4})
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)
end