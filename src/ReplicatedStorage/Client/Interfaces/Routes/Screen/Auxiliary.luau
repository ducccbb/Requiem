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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Auxiliary
--                               Dumped in 0.00103 seconds
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
local Types = Common:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_2:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local Image = require(Primitives:WaitForChild("Image"))
local Components_6 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_6:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local function Branch_2(p1) -- Line: 29 -- upvalues: Branches (val), useRem (val), react (val), Form (val), Image (val), HeaderBodyComponent (val), Button (val)
    local v1 = Branches.Icons[p1.Id]
    local v2 = Branches.Names[p1.Id]
    local v3 = useRem()
    local v4 = {LayoutOrder = p1.Id}
    local v5 = {}
    local v6 = {}
    local v7 = {}
    local v8 = v3(40)
    v7.Size = UDim2.fromOffset(v8, v3(40))
    v7.Image = v1
    v6.Icon = react.createElement(Image, v7)
    v6.Label = react.createElement(HeaderBodyComponent, {Header = v2, Body = ("Enlist in to the %*."):format(v2)})
    v5.Left = react.createElement(Form.Divider, {Side = "Left"}, v6)
    v5.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "P_30"}, {Button = react.createElement(Button, {
        Text = "Enlist",
        Clicked = function() -- Line: 58 -- upvalues: p1 (val)
            p1.Clicked(p1.Id)
        end,
    })})
    return react.createElement(Form.Form, v4, v5)
end
return function() -- Line: 66 -- upvalues: react (val), Branch (val), DynamicPage (val), PageLayout (val), Branch_2 (val), Branches (val)
    local u4, v1
    v1, u4 = react.useState(false)
    react.useEffect(function() -- Line: 69 -- upvalues: Branch (upval), u4 (val)
        Branch.Auxiliary.listen(function() -- Line: 70 -- upvalues: u4 (upval)
            u4(true)
        end)
    end, {})
    local function v2(p1) -- Line: 75 -- upvalues: u4 (val), Branch (upval)
        u4(false)
        Branch.Auxiliary.post(p1)
    end
    return react.createElement(DynamicPage, {Enabled = v1}, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.8, 0.8), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}, {
        Layout = react.createElement(PageLayout, {}),
        SL = react.createElement(Branch_2, {Id = Branches.Branches.SCOUTING_LEGION, Clicked = v2}),
        MP = react.createElement(Branch_2, {Id = Branches.Branches.MILITARY_POLICE, Clicked = v2}),
        SG = react.createElement(Branch_2, {Id = Branches.Branches.STATIONARY_GUARD, Clicked = v2}),
        TC = react.createElement(Branch_2, {Id = Branches.Branches.TRAINEE_CORPS, Clicked = v2}),
    })})
end