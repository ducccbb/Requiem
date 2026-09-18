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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Blueprints.Drawer
--                               Dumped in 0.00177 seconds
--                          Bytecode version 9  |  2 functions

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
local Types = Common:WaitForChild("Types")
local Building = Types:WaitForChild("Building")
local Placeables = require(Building:WaitForChild("Placeables"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types_2 = Common_2:WaitForChild("Types")
local Building_2 = Types_2:WaitForChild("Building")
local Entries = Building_2:WaitForChild("Entries")
require(Entries:WaitForChild("Blueprints"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types_3 = Common_3:WaitForChild("Types")
local Building_3 = Types_3:WaitForChild("Building")
local Entries_2 = Building_3:WaitForChild("Entries")
require(Entries_2:WaitForChild("Decorations"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types_4 = Common_4:WaitForChild("Types")
local Building_4 = Types_4:WaitForChild("Building")
local Entries_3 = Building_4:WaitForChild("Entries")
require(Entries_3:WaitForChild("Sandbox"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types_5 = Common_5:WaitForChild("Types")
local Building_5 = Types_5:WaitForChild("Building")
local Entries_4 = Building_5:WaitForChild("Entries")
require(Entries_4:WaitForChild("Schematics"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Types_6 = Common_6:WaitForChild("Types")
require(Types_6:WaitForChild("Editor"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal = Editor_2:WaitForChild("Universal")
local Search = require(Universal:WaitForChild("Search"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_3:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_3 = Editor_4:WaitForChild("Universal")
local Layouts = Universal_3:WaitForChild("Layouts")
local Vertical = require(Layouts:WaitForChild("Vertical"))
local Item = require(v1.Parent:WaitForChild("Item"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildBlueprints = require(Hooks:WaitForChild("useBuildBlueprints"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildDecorations = require(Hooks_2:WaitForChild("useBuildDecorations"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildDescendants = require(Hooks_3:WaitForChild("useBuildDescendants"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSandbox = require(Hooks_4:WaitForChild("useBuildSandbox"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSchematics = require(Hooks_5:WaitForChild("useBuildSchematics"))
local Hooks_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSelection = require(Hooks_6:WaitForChild("useBuildSelection"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_6:WaitForChild("Hooks")
local useRem = require(Hooks_7:WaitForChild("useRem"))
return react.memo(function() -- Line: 47 -- upvalues: useBuildSelection (val), useBuildBlueprints (val), useBuildDecorations (val), useBuildSandbox (val), useBuildSchematics (val), useBuildDescendants (val), useRem (val), Placeables (val), react (val), Item (val), Frame (val), Vertical (val), Search (val), Checkbox (val), ScrollingFrame (val)
    local layoutOrder, v1, v2, v3, v4, v5, v6
    local v7 = useBuildSelection()
    local v8 = useBuildBlueprints()
    local v9 = useBuildDecorations()
    _, v4 = useBuildSandbox()
    local v10 = useBuildSchematics()
    v5, v6 = useBuildDescendants()
    local v11 = useRem()
    local v12 = v7
    if v7 and not (string.match(v7, "/%*$")) then
        v1 = string.split(v7, "/")
        table.remove(v1, #v1)
        v12 = table.concat(v1, "/") .. "/*"
    end
    v1 = v12
    if v1 then
        v1 = Placeables.getPlaceableSystemFromPath(v12)
    end
    local v13 = v12
    if v13 then
        v13 = string.split(v12, "/")[1]
    end
    if v13 == "Blueprints" then
        v2 = v8
    elseif v13 == "Decorations" then
        v2 = v9
    elseif v13 ~= "Schematics" then
        v2 = v4
    else
        v2 = v10
    end
    local v14 = v1
    if v14 then
        v14 = v1.getItemDirectoryFromPath(v12, v2)
    end
    if not v5 then
        v3 = v14
    elseif v14 then
        v3 = Placeables.getAllDescendants(v14)
    end
    local v15 = {}
    local v16 = v3
    if not v16 then
        v16 = {}
    end
    local v17 = nil
    local v18 = nil
    for i, j in v16, v17, v18 do
        if not j.layoutOrder then
            layoutOrder = i
        else
            layoutOrder = j.layoutOrder
        end
        v15[j.name .. "_" .. i] = react.createElement(Item, {Item = j, LayoutOrder = layoutOrder})
    end
    v18 = {Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    local v19 = {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)}), Layout = react.createElement(Vertical, {
        Spacing = 5,
        Native = {VerticalAlignment = Enum.VerticalAlignment.Top, HorizontalAlignment = Enum.HorizontalAlignment.Left},
    })}
    local v20 = {}
    local v21 = UDim2.fromScale(1, 0)
    v20.Size = v21 + UDim2.fromOffset(0, v11(23))
    v19.Frame = react.createElement(Frame, v20, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 15),
    }), Search = react.createElement(Search, {}), Checkbox = react.createElement(Checkbox, {
        Default = false,
        Label = "Show Descendants",
        Toggled = v6,
        Native = {LayoutOrder = 2},
    })})
    v20 = {Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    local v22 = {}
    local v23 = {}
    local v24 = v11(168)
    v23.CellSize = UDim2.fromOffset(v24, v11(215))
    v23.CellPadding = UDim2.fromScale(0.01, 0.01)
    v23.FillDirection = Enum.FillDirection.Horizontal
    v23.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v23.SortOrder = Enum.SortOrder.LayoutOrder
    v22.Grid = react.createElement("UIGridLayout", v23)
    v22.Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 2)})
    v19.Scrolling = react.createElement(ScrollingFrame, v20, v22, v15)
    return react.createElement(Frame, v18, v19)
end)