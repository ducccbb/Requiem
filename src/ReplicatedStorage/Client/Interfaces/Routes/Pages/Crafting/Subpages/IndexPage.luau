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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Crafting.Subpages.IndexPage
--                               Dumped in 0.00125 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
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
local Universal = Components_3:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Badge = require(Universal_2:WaitForChild("Badge"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_3 = Components_6:WaitForChild("Primitives")
local Frame = require(Primitives_3:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_5 = Components_8:WaitForChild("Universal")
local ItemViewport = require(Universal_5:WaitForChild("ItemViewport"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local function getItemModel(p1) -- Line: 42 -- upvalues: ReplicatedStorage (val)
    local Assets = ReplicatedStorage:WaitForChild("Assets")
    local Tools = Assets:WaitForChild("Tools")
    for k, v in pairs(Tools:GetChildren()) do
        for k2, i in pairs(v:GetChildren()) do
            if i.Name == v1 then
                return i
            end
        end
    end
    return nil
end
return function(p1) -- Line: 58 -- upvalues: useRem (val), react (val), getItemModel (val), Badge (val), Form (val), ItemViewport (val), HeaderBodyComponent (val), Accordion (val), Frame (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1
    local u2 = useRem()
    v1 = react.useMemo(function() -- Line: 61 -- upvalues: p1 (val), getItemModel (upval), react (upval), Badge (upval), Form (upval), ItemViewport (upval), u2 (val), HeaderBodyComponent (upval), Accordion (upval)
        local Divider, Form_2, createElement, createElement_2, createElement_3, index, index_2, results, results_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local v12 = {}
        local v13 = {}
        local v14 = pairs
        if not p1.Recipes then
            index = {}
        else
            index = p1.Recipes.index
        end
        for k, v in v14(index) do
            v9 = table.concat(v.category, "/")
            v10 = v13[v9]
            if not v10 then
                v10 = {}
            end
            v13[v9] = v10
            v10 = getItemModel(v.results)
            v11 = {}
            for k2, i in pairs(v.requirements) do
                v11[i.item .. i.amount] = react.createElement(Badge, {Text = i.item .. " x" .. i.amount})
            end
            v1 = v13[v9]
            results = v.results
            createElement = react.createElement
            Form_2 = Form.Form
            v2 = {}
            createElement_2 = react.createElement
            Divider = Form.Divider
            v3 = {}
            v4 = v10
            if v4 then
                v5 = {Model = v10}
                v6 = {}
                v7 = u2(70)
                v6.Size = UDim2.fromOffset(v7, u2(70))
                v7 = UDim2.fromScale(0, 0.5)
                v8 = u2(-50)
                v6.Position = v7 + UDim2.fromOffset(v8, 0)
                v5.Native = v6
                v4 = react.createElement(ItemViewport, v5)
            end
            v3.Viewport = v4
            createElement_3 = react.createElement
            v5 = {Body = "The requirements for the recipe.", Wrap = true, RichText = true}
            results_2 = v.results
            if not v.amount then
                v7 = ""
            else
                v7 = "<font size=\"14\"> (x" .. tostring(v.amount) .. ")</font>"
            end
            v5.Header = results_2 .. v7
            v3.Header = createElement_3(HeaderBodyComponent, v5)
            v2.Left = createElement_2(Divider, {Side = "Left"}, v3)
            v2.Right = react.createElement(Form.Divider, {Side = "Right"}, v11)
            v1[results] = createElement(Form_2, {
                Native = {BackgroundTransparency = 1},
            }, v2)
        end
        v14 = pairs
        if not p1.Recipes then
            index_2 = {}
        else
            index_2 = p1.Recipes.index
        end
        for k3, j in v14(index_2) do
            v9 = j.category[1]
            if not (v12[v9]) then
                v12[v9] = {}
            end
            v10 = table.concat(j.category, "/")
            v12[v9][j.category[2]] = react.createElement(Accordion.AccordionItem, {Padding = "Small", Header = j.category[2]}, v13[v10])
        end
        v14 = {}
        for k4, k5 in pairs(v12) do
            v14[k4] = react.createElement(Accordion.Accordion, {Header = k4 .. " Recipes"}, k5)
        end
        return v14
    end, {p1.Recipes})
    return react.createElement(Frame, {ZIndex = 3, Visible = p1.Enabled}, {Frame = react.createElement(ScrollingFrame, {}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)})
end