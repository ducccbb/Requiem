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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Smithing.Subpages.HomePage
--                               Dumped in 0.00142 seconds
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
local Inventory = require(Namespaces:WaitForChild("Inventory"))
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
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Inputs = Components_3:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_3 = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives_3:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local ItemViewport = require(Universal_3:WaitForChild("ItemViewport"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
return function(p1) -- Line: 44 -- upvalues: useStore (val), Inventory (val), useRem (val), react (val), ClientInventoryHandler (val), Form (val), ItemViewport (val), HeaderBodyComponent (val), Item (val), Button (val), Frame (val), ScrollingFrame (val), VerticalListLayout (val)
    local Divider, Form_2, createElement_2, createElement_3, createElement_4, results, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local u5 = useStore(Inventory.Store, function(p1) -- Line: 45
        return p1
    end)
    local v10 = useRem()
    local v11 = react.useMemo(function() -- Line: 51 -- upvalues: p1 (val), u5 (val), ClientInventoryHandler (upval)
        if not p1.Recipes or not u5 or not p1.Recipes.index then
            return {}
        end
        return (ClientInventoryHandler.getListOfCraftables(u5, p1.Recipes))
    end, {u5, p1.Recipes})
    local v12 = {}
    local u225 = p1
    for k, v in pairs(v11) do
        v1 = ClientInventoryHandler.getItemModelFromName(v.results)
        v2 = ""
        if not v.merge_tags then
            results = v.results
        else
            results = table.concat(v.tags, " ") .. " " .. v.results
        end
        for k2, i in pairs(v.requirements) do
            v2 = v2 .. i.item .. " x" .. i.amount .. ", "
        end
        v2 = v2:sub(1, -3)
        createElement_2 = react.createElement
        Form_2 = Form.Form
        v3 = {}
        createElement_3 = react.createElement
        Divider = Form.Divider
        v4 = {}
        v5 = v1
        if v5 then
            createElement_4 = react.createElement
            v6 = {Model = v1}
            v7 = {}
            v8 = v10(70)
            v7.Size = UDim2.fromOffset(v8, v10(70))
            v8 = UDim2.fromScale(0, 0.5)
            v9 = v10(-50)
            v7.Position = v8 + UDim2.fromOffset(v9, 0)
            v6.Native = v7
            if not v.merge_tags then
                v7 = nil
            else
                function v7(p1) -- Line: 87 -- upvalues: ClientInventoryHandler (upval), v (val)
                    ClientInventoryHandler.onRenderItemModel({tags = v.tags}, p1)
                end
            end
            v6.Render = v7
            v5 = createElement_4(ItemViewport, v6)
        end
        v4.Viewport = v5
        v4.Header = react.createElement(HeaderBodyComponent, {Wrap = true, Header = Item.getDisplayName({name = v.results, tags = v.tags}), Body = v2})
        v3.Left = createElement_3(Divider, {Side = "Left"}, v4)
        v3.Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
            Text = "Smith",
            Clicked = function() -- Line: 112 -- upvalues: u225 (val), v (val)
                u225.Smithing(v)
            end,
        })})
        v12[results] = createElement_2(Form_2, {}, v3)
    end
    return react.createElement(Frame, {ZIndex = 3, Visible = u225.Enabled}, {Frame = react.createElement(ScrollingFrame, {}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}, v12)})
end