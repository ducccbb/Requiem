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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Refining.Subpages.HomePage
--                              Dumped in 0.000850 seconds
--                          Bytecode version 9  |  3 functions

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
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Inputs = Components_3:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_3 = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives_3:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local ItemViewport = require(Universal_3:WaitForChild("ItemViewport"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return function(p1) -- Line: 42 -- upvalues: useRem (val), ClientInventoryHandler (val), react (val), Form (val), ItemViewport (val), HeaderBodyComponent (val), Button (val), Frame (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = useRem()
    local v11 = {}
    local u116 = p1
    for k, v in pairs(p1.Refineables) do
        v8 = ClientInventoryHandler.getItemNameFromHash(v.id) or ""
        v9 = ClientInventoryHandler.getItemModelFromName(v8)
        v1 = {}
        v2 = {}
        v3 = v9
        if v3 then
            v4 = {Model = v9}
            v5 = {}
            v6 = v10(70)
            v5.Size = UDim2.fromOffset(v6, v10(70))
            v6 = UDim2.fromScale(0, 0.5)
            v7 = v10(-50)
            v5.Position = v6 + UDim2.fromOffset(v7, 0)
            v4.Native = v5
            v3 = react.createElement(ItemViewport, v4)
        end
        v2.Viewport = v3
        v2.Header = react.createElement(HeaderBodyComponent, {Body = "Refine your crude item.", Wrap = true, Header = v8})
        v1.Left = react.createElement(Form.Divider, {Side = "Left"}, v2)
        v1.Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
            Text = "Refine Item",
            Clicked = function() -- Line: 74 -- upvalues: u116 (val), v (val)
                u116.Refining(v)
            end,
        })})
        v11[tostring(k) .. v8] = react.createElement(Form.Form, {}, v1)
    end
    return react.createElement(Frame, {ZIndex = 3, Visible = u116.Enabled}, {Frame = react.createElement(ScrollingFrame, {}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}, v11)})
end