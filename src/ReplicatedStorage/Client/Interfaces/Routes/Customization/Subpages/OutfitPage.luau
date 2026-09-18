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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Subpages.OutfitPage
--                              Dumped in 0.000519 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local DropdownInput = require(Inputs:WaitForChild("DropdownInput"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Customization = Common_2:WaitForChild("Customization")
local Pants = require(Customization:WaitForChild("Pants"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Customization_2 = Common_3:WaitForChild("Customization")
local Shirts = require(Customization_2:WaitForChild("Shirts"))
local u122 = Table.keys(Shirts.Civilian)
local u125 = Table.keys(Pants.Civilian)
return function(p1) -- Line: 45 -- upvalues: react (val), Shirts (val), Pants (val), Frame (val), DropdownInput (val), u122 (val), u125 (val)
    local u11, u5, v1, v2
    u5, v1 = react.useState(p1.Default.shirt)
    u11, v2 = react.useState(p1.Default.pants)
    react.useEffect(function() -- Line: 49 -- upvalues: Shirts (upval), u5 (val), Pants (upval), u11 (val), p1 (val)
        local v1 = Pants.Civilian[u11]
        p1.Character.Shirt.ShirtTemplate = Shirts.Civilian[u5]
        p1.Character.Pants.PantsTemplate = v1
        p1.Updated(u5, u11)
    end, {u5, u11})
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), Shirts = react.createElement(DropdownInput, {
        Header = "Shirts",
        Body = "Select a shirt to wear.",
        Visible = p1.Enabled,
        Options = u122,
        Selected = v1,
        Native = {ZIndex = 2, LayoutOrder = 1},
    }), Pants = react.createElement(DropdownInput, {
        Header = "Pants",
        Body = "Select a pair of pants to wear.",
        Visible = p1.Enabled,
        Options = u125,
        Selected = v2,
        Native = {LayoutOrder = 2},
    })})
end