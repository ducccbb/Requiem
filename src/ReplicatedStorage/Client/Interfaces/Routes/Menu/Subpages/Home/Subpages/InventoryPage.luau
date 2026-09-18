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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.InventoryPage
--                               Dumped in 0.00658 seconds
--                          Bytecode version 9  |  42 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Equipment_2 = Common_5:WaitForChild("Equipment")
local StackMerge = require(Equipment_2:WaitForChild("StackMerge"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local CharacterViewport = require(Universal:WaitForChild("CharacterViewport"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
require(Universal_2:WaitForChild("Badge"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Screen = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Screen")
local ContextMenu = require(Screen:WaitForChild("ContextMenu"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs_2 = Components_5:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local ItemViewport = require(Universal_3:WaitForChild("ItemViewport"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs_3 = Components_7:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local Popups = v1.Parent:WaitForChild("Popups")
local GiveMarcsPopup = require(Popups:WaitForChild("GiveMarcsPopup"))
local Popups_2 = v1.Parent:WaitForChild("Popups")
local InspectItemPopup = require(Popups_2:WaitForChild("InspectItemPopup"))
local Popups_3 = v1.Parent:WaitForChild("Popups")
local SplitItemPopup = require(Popups_3:WaitForChild("SplitItemPopup"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Utilities_3 = Components_8:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useBindingListener = require(Hooks:WaitForChild("useBindingListener"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_10 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_11 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_12 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local usePopup = require(Hooks_4:WaitForChild("usePopup"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_13 = Client_14:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_13:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_14 = Client_15:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_14:WaitForChild("Hooks")
local useStore = require(Hooks_6:WaitForChild("useStore"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_22:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local State = require(Utilities_4:WaitForChild("State"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_15 = Client_16:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_15:WaitForChild("Hooks")
local useTextScale = require(Hooks_7:WaitForChild("useTextScale"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_16 = Client_17:WaitForChild("Interfaces")
local Hooks_8 = Interfaces_16:WaitForChild("Hooks")
local useTheme = require(Hooks_8:WaitForChild("useTheme"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_18 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_17 = Client_18:WaitForChild("Interfaces")
local Components_9 = Interfaces_17:WaitForChild("Components")
local Utilities_5 = Components_9:WaitForChild("Utilities")
local Bindings = require(Utilities_5:WaitForChild("Bindings"))
local v3 = {}
local v4 = {}
local v5 = Color3.fromRGB(143, 70, 70)
v4[1] = v5
v4[2] = Color3.fromRGB(177, 89, 89)
v3.Administration = v4
v4 = {}
v5 = Color3.fromRGB(143, 70, 70)
v4[1] = v5
v4[2] = Color3.fromRGB(177, 89, 89)
v3["Soul Bound"] = v4
local function containsSearchTerm(p1, p2) -- Line: 108
    if not p1 or p1 == "" then
        return false
    end
    local v1 = string.lower(p1)
    local v2 = string.find(v1, p2, 1, true) ~= nil
    return v2
end
local function itemMatchesSearch(p1, p2) -- Line: 122 -- upvalues: containsSearchTerm (val), Item (val)
    local attributes, v1, v2
    if containsSearchTerm(p1.name, p2) then
        return true
    end
    local v3 = {}
    local display_name = p1.display_name
    if not display_name then
        display_name = p1.name
    end
    v3.Name = display_name
    local tags = p1.tags
    if not tags then
        tags = {}
    end
    v3.Tags = tags
    local v4 = Item.getDisplayName(v3)
    if containsSearchTerm(v4, p2) or containsSearchTerm(p1.description, p2) then
        return true
    end
    if not p1.attributes then
        local v5
        if not p1.tags then
            return false
        end
        local tags_2 = p1.tags
        v1 = nil
        v2 = nil
        for i, j in tags_2, v1, v2 do
            v5 = tostring(j)
            if containsSearchTerm(v5, p2) then
                return true
            end
        end
        return false
    else
        attributes = p1.attributes
        v1 = nil
        v2 = nil
        for k, n in attributes, v1, v2 do
            if containsSearchTerm(n, p2) then
                return true
            end
        end
    end
end
local function getAbsoluteBounds(p1, p2) -- Line: 164 -- upvalues: GuiService (val)
    local AbsolutePosition = p1.AbsolutePosition
    local AbsoluteSize = p1.AbsoluteSize
    local GuiInset = GuiService:GetGuiInset()
    return AbsolutePosition.X - GuiInset.X, AbsolutePosition.X + AbsoluteSize.X - GuiInset.X, AbsolutePosition.Y + 58 - GuiInset.Y, AbsolutePosition.Y + AbsoluteSize.Y + 58 - GuiInset.Y
end
local function InventoryItem(p1) -- Line: 202 -- upvalues: useRem (val), useTheme (val), useConstants (val), useTextScale (val), react (val), Item (val), Number (val), SplitItemPopup (val), InspectItemPopup (val), Inventory (val), useMotion (val), Bindings (val), useBindingListener (val), UserInputService (val), getAbsoluteBounds (val), GuiService (val), StackMerge (val), ContextMenu (val), Color (val), ItemViewport (val), ClientInventoryHandler (val), Button (val)
    local u17, u29, u30, u34, u38, u39, u59, v1, v2, v3, v4, v5, v6
    local u2 = useRem()
    local v7 = useTheme()
    local v8 = useConstants()
    local v9 = useTextScale()
    local openPopup = p1.openPopup
    local closePopup = p1.closePopup
    v6, u17 = react.useMemo(function() -- Line: 224 -- upvalues: p1 (val), Item (upval), Number (upval)
        local v1
        local v2 = {
            {label = "Inspect Item"},
            {label = "Drop Item"},
        }
        local v3 = p1.Item.meta[1]
        local v4 = v3
        if v4 then
            v4 = typeof(v3) == "number"
        end
        local stackable = p1.Item.stackable
        if stackable then
            stackable = v4
            if stackable then
                stackable = 1 < v3
            end
        end
        if stackable then
            table.insert(v2, {label = "Split Item"})
        end
        local v5 = {}
        local display_name = p1.Item.display_name
        if not display_name then
            display_name = p1.Item.name
        end
        v5.Name = display_name
        local tags = p1.Item.tags
        if not tags then
            tags = {}
        end
        v5.Tags = tags
        local name = Item.getDisplayName(v5)
        if not name then
            name = p1.Item.name
        end
        v5 = v4
        if v5 then
            v5 = if 1 <= v3 then if p1.Item.name ~= "Marcs" then p1.Item.name == "Pouch" else true else false
        end
        if p1.Item.name == "Marcs" then
            local v6
            if not v5 then
                v6 = ""
            else
                v6 = Number.FormatWithCommas(v3) .. " "
                if not v6 then
                    v6 = ""
                end
            end
            v1 = v6 .. name
        elseif p1.Item.name ~= "Pouch" then
            local v7
            if not stackable then
                v7 = ""
            else
                v7 = ("<font transparency=\"0.5\">(x%*)</font>"):format((Number.FormatWithCommas(p1.Item.meta[1]))) .. " "
                if not v7 then
                    v7 = ""
                end
            end
            v1 = ("%* %*"):format(name, v7)
        end
        return v1, v2
    end, {p1.Item})
    local v10 = react.useCallback(function(a1) -- Line: 264 -- upvalues: u17 (val), openPopup (val), react (upval), SplitItemPopup (upval), p1 (val), closePopup (val), InspectItemPopup (upval), Inventory (upval)
        local label = u17[a1]
        if label then
            label = u17[a1].label
        end
        if label == "Split Item" then
            openPopup({Companion = react.createElement(SplitItemPopup, {Item = p1.Item, closePopup = closePopup})})
            return
        end
        if label == "Inspect Item" then
            openPopup({Companion = react.createElement(InspectItemPopup, {Item = p1.Item, closePopup = closePopup})})
            return
        end
        if label == "Drop Item" then
            Inventory.Action.post({action = 2, hash = p1.Item.hash, offset = p1.Item.offset, data = {}})
        end
    end, {u17, openPopup, closePopup})
    u29, u30 = react.useState(false)
    v1, u34 = useMotion(0)
    u38, u39 = react.useBinding(false)
    local function getPositionOfCellAt(p1) -- Line: 299 -- upvalues: u2 (val)
        local v1 = u2(105)
        return UDim2.fromOffset(0, v1 * ((p1 or 1) - 1))
    end
    local v11 = Bindings.getBindingValue(p1.Order)
    local __immediate_index = v11[p1.Item.id]
    if not __immediate_index then
        __immediate_index = p1.Item.__immediate_index
        if not __immediate_index then
            __immediate_index = 1
        end
    end
    v2, u59 = react.useBinding(getPositionOfCellAt(__immediate_index))
    useBindingListener(p1.Order, function(a1) -- Line: 310 -- upvalues: Bindings (upval), u38 (val), p1 (val), u59 (val), getPositionOfCellAt (val)
        if not (Bindings.getBindingValue(u38)) then
            local v1 = a1[p1.Item.id]
            if v1 then
                u59(getPositionOfCellAt(v1))
            end
        end
    end)
    react.useEffect(function() -- Line: 320 -- upvalues: Bindings (upval), p1 (val), u59 (val), getPositionOfCellAt (val)
        local v1 = Bindings.getBindingValue(p1.Order)
        local __immediate_index = v1[p1.Item.id]
        if not __immediate_index then
            __immediate_index = p1.Item.__immediate_index
            if not __immediate_index then
                __immediate_index = 1
            end
        end
        u59(getPositionOfCellAt(__immediate_index))
    end, {p1.Item.id})
    react.useEffect(function() -- Line: 326 -- upvalues: u29 (val), u34 (val), u2 (val)
        if u29 then
            u34:spring(u2(0))
            return
        end
        u34:spring(u2(15))
    end, {u29})
    local u89 = react.useCallback(function(a1) -- Line: 336 -- upvalues: p1 (val), u39 (val), UserInputService (upval), getAbsoluteBounds (upval), GuiService (upval), u2 (val), StackMerge (upval), Bindings (upval), u59 (val), getPositionOfCellAt (val)
        local u20
        if p1.Filtered then
            return
        end
        local Parent = a1.Parent.Parent
        u39(true)
        local Parent_2 = a1.Parent
        Parent_2.ZIndex = 2
        Parent_2.Rotation = 0.05
        local MouseLocation = UserInputService:GetMouseLocation()
        _, _, u20 = getAbsoluteBounds(Parent_2.Parent, Parent)
        local GuiInset = GuiService:GetGuiInset()
        local AbsolutePosition_2 = a1.AbsolutePosition
        local AbsolutePosition = Parent.AbsolutePosition
        local v1 = Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
        local u51 = Vector2.new(v1.X - AbsolutePosition_2.X, v1.Y - AbsolutePosition_2.Y)
        local function getClosestIndexFromMousePosition(a1) -- Line: 373 -- upvalues: Parent (val), u20 (val), u2 (upval), p1 (upval)
            local Y
            if not Parent then
                Y = 0
            else
                Y = Parent.CanvasPosition.Y
                if not Y then
                    Y = 0
                end
            end
            local v1 = a1.Y - u20 + Y
            return (math.min(math.max(1, math.floor(v1 / u2(105)) + 1), p1.TotalItems))
        end
        local function getOverlappingItemFrames() -- Line: 397 -- upvalues: a1 (val), Parent (val)
            local v1, v2
            local v3 = {}
            local Parent_2 = a1.Parent
            for i, j in Parent:GetChildren() do
                if j:IsA("Frame") and j ~= Parent_2 then
                    v1 = false
                    if j.AbsolutePosition.X < Parent_2.AbsolutePosition.X + Parent_2.AbsoluteSize.X then
                        v1 = false
                        v2 = j.AbsolutePosition.X + j.AbsoluteSize.X
                        if Parent_2.AbsolutePosition.X < v2 then
                            v1 = false
                            if j.AbsolutePosition.Y < Parent_2.AbsolutePosition.Y + Parent_2.AbsoluteSize.Y then
                                v2 = j.AbsolutePosition.Y + j.AbsoluteSize.Y
                                v1 = Parent_2.AbsolutePosition.Y < v2
                            end
                        end
                    end
                    if v1 then
                        table.insert(v3, j)
                    end
                end
            end
            return v3
        end
        local function checkPossibleItemMerging() -- Line: 426 -- upvalues: getOverlappingItemFrames (val), p1 (upval), StackMerge (upval)
            local v1 = getOverlappingItemFrames()
            if #v1 == 0 then
                return
            end
            local v2 = v1[1]
            local v3 = (function(p1) -- Line: 427
                return string.gsub(p1.Name, "%d+", "")
            end)(v2)
            if v3 ~= p1.Item.name then
                return
            end
            local v4 = (function(p1) -- Line: 432
                return (tonumber((string.gsub(p1.Name, "%D+", ""))))
            end)(v2)
            local v5 = v4
            if v5 then
                v5 = p1.ItemsByOffset[v4]
            end
            if not v5 then
                return
            end
            if StackMerge.canStackItemsMerge(p1.Item.hash, p1.Item.tags, v5.tags) then
                return v4
            end
        end
        local u56 = nil
        local u63 = UserInputService.InputChanged:Connect(function(a1) -- Line: 461 -- upvalues: UserInputService (upval), GuiInset (val), Parent (val), u51 (val), Bindings (upval), p1 (upval), getClosestIndexFromMousePosition (val), u59 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local MouseLocation = UserInputService:GetMouseLocation()
                local v1 = Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
                local v2 = UDim2.fromOffset(v1.X - u51.X - Parent.AbsolutePosition.X, v1.Y - u51.Y - Parent.AbsolutePosition.Y + Parent.CanvasPosition.Y)
                local v3 = Bindings.getBindingValue(p1.Order)
                local v4 = v3[p1.Item.id]
                v3 = getClosestIndexFromMousePosition(v1)
                if v3 ~= v4 then
                    p1.OnImmediateIndexChange(v3)
                end
                u59(v2)
            end
        end)
        return function() -- Line: 539 -- upvalues: u63 (ref)
            u63:Disconnect()
        end
    end, {p1.Filtered})
    local PageBackground = v7.PageBackground
    if p1.Item.attributes then
        local v12 = #p1.Item.attributes
        if 0 < v12 then end
    end
    local v13 = false
    if not p1.Tags and not u29 then end
    local createElement = react.createElement
    local v14 = {BackgroundTransparency = 0, LayoutOrder = 1}
    local v15 = UDim2.fromScale(1, 0)
    v14.Size = v15 + UDim2.fromOffset(0, u2(100))
    v14.Position = v2
    v14.BackgroundColor3 = v7.Container.Background
    local v16 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v17 = {}
    local v18 = {ZIndex = 10}
    v17.Native = v18
    v17.Contexts = u17
    v17.Callback = v10
    v16.Contexts = react.createElement(ContextMenu.ContextMenu, v17)
    v17 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
    v17[react.Event.MouseEnter] = function() -- Line: 601 -- upvalues: u30 (val)
        u30(true)
    end
    v17[react.Event.MouseLeave] = function() -- Line: 605 -- upvalues: u30 (val)
        u30(false)
    end
    v17[react.Event.MouseButton1Down] = function(a1) -- Line: 609 -- upvalues: p1 (val), u89 (val)
        if not p1.Filtered then
            u89(a1)
        end
    end
    v16.Hitbox = react.createElement("TextButton", v17)
    if not p1.Item.model then
        v15 = nil
    else
        local createElement_2 = react.createElement
        v17 = {BackgroundTransparency = 1}
        v3 = u2(70)
        v17.Size = UDim2.fromOffset(v3, u2(70))
        v17.AnchorPoint = Vector2.new(0, 0.5)
        v3 = UDim2.fromScale(0, 0.5)
        v4 = u2(15)
        v17.Position = v3 + UDim2.fromOffset(v4, 0)
        v17.BackgroundColor3 = Color.Darken(PageBackground, 0.9)
        v18 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})}
        local createElement_3 = react.createElement
        v4 = {Spins = true, Model = p1.Item.model}
        v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.95, 0.95)}
        v4.Native = v5
        if not p1.Item then
            v5 = nil
        elseif p1.Item.model then
            function v5(a1) -- Line: 637 -- upvalues: ClientInventoryHandler (upval), p1 (val)
                ClientInventoryHandler.onRenderItemModel(p1.Item, a1)
            end
        end
        v4.Render = v5
        v18.Viewport = createElement_3(ItemViewport, v4, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})
        v15 = createElement_2("Frame", v17, v18)
    end
    v16.Viewport = v15
    local createElement_4 = react.createElement
    v17 = {BackgroundTransparency = 1, RichText = true}
    v3 = UDim2.fromScale(1, 0)
    v4 = -u2(70)
    v17.Size = v3 + UDim2.fromOffset(v4, u2(20))
    v17.Text = v6
    v17.TextColor3 = Color.Darken(v7.Primary, 0.8)
    v17.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v17.TextXAlignment = Enum.TextXAlignment.Left
    v17.TextSize = v9(v8.TextSize.Header)
    if not v13 then
        v3 = UDim2.fromScale(0, 0.5)
        v4 = u2(100)
        v18 = v3 + UDim2.fromOffset(v4, u2(-8))
    else
        v3 = UDim2.fromScale(0, 0)
        v4 = u2(90)
        v18 = v3 + UDim2.fromOffset(v4, u2(10))
    end
    v17.Position = v18
    if v13 then
        v18 = nil
    else
        v18 = Vector2.new(0, 0.5)
    end
    v17.AnchorPoint = v18
    v16.Header = createElement_4("TextLabel", v17)
    local createElement_5 = react.createElement
    v17 = {BackgroundTransparency = 1}
    v3 = UDim2.fromScale(1, 0)
    v4 = -u2(70)
    v17.Size = v3 + UDim2.fromOffset(v4, u2(20))
    v17.Text = p1.Item.description or ""
    v17.TextColor3 = Color.Darken(v7.Primary, 0.6)
    v17.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v17.TextXAlignment = Enum.TextXAlignment.Left
    v17.TextSize = v9(v8.TextSize.Body)
    if not v13 then
        v3 = UDim2.fromScale(0, 0.5)
        v4 = u2(100)
        v18 = v3 + UDim2.fromOffset(v4, u2(8))
    else
        v3 = UDim2.fromScale(0, 0)
        v4 = u2(90)
        v18 = v3 + UDim2.fromOffset(v4, u2(25))
    end
    v17.Position = v18
    if v13 then
        v18 = nil
    else
        v18 = Vector2.new(0, 0.5)
        if not v18 then
            v18 = nil
        end
    end
    v17.AnchorPoint = v18
    v16.Body = createElement_5("TextLabel", v17)
    v17 = {BackgroundTransparency = 1, ZIndex = 3}
    v3 = UDim2.fromScale(1, 0)
    v4 = -u2(500)
    v17.Size = v3 + UDim2.fromOffset(v4, u2(20))
    v17.AnchorPoint = Vector2.new(1, 0.5)
    v17.Position = v1:map(function(p1) -- Line: 688 -- upvalues: u2 (val)
        local v1 = UDim2.fromScale(1, 0.5)
        local v2 = -u2(30)
        return v1 + UDim2.fromOffset(v2, p1)
    end)
    v17.Visible = u29
    v18 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}
    v4 = {Padding = "Medium", Type = 1}
    if -1 >= p1.Item.slot then
        v5 = "Equip"
    else
        v5 = "Unequip"
    end
    v4.Text = v5
    v4.Transparency = v1:map(function(p1) -- Line: 707
        return p1 / 15
    end)
    v4.Native = {Visible = not p1.ButtonLocked}
    function v4.Clicked() -- Line: 715 -- upvalues: Inventory (upval), p1 (val)
        Inventory.Action.post({action = 1, hash = p1.Item.hash, offset = p1.Item.offset, data = {}})
    end
    v18.Button = react.createElement(Button, v4)
    v16.Options = react.createElement("Frame", v17, v18)
    v17 = {BackgroundTransparency = 1}
    v3 = UDim2.fromScale(1, 0)
    v4 = -u2(100)
    v17.Size = v3 + UDim2.fromOffset(v4, u2(20))
    v3 = UDim2.fromScale(0, 0)
    v4 = u2(90)
    v17.Position = v3 + UDim2.fromOffset(v4, u2(55))
    v17.Visible = p1.Tags or u29
    v16.Tags = react.createElement("Frame", v17, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })}, {})
    v16.Stroke = react.createElement("UIStroke", {Transparency = 0, Thickness = 1, Color = v7.Container.Stroke})
    return createElement("Frame", v14, v16)
end
return function(p1) -- Line: 751 -- upvalues: useTheme (val), useRem (val), usePopup (val), react (val), State (val), GiveMarcsPopup (val), useStore (val), Inventory (val), ClientInventoryHandler (val), Table (val), itemMatchesSearch (val), Bindings (val), InventoryItem (val), Frame (val), CharacterViewport (val), TextInput (val), DropdownInput (val)
    local All, All_2, u24, u29, u34, u35, u6, u7, v1, v2, v3
    local v4 = useTheme()
    local v5 = useRem()
    u6, u7, v2 = usePopup()
    local v6 = {u6, u7}
    react.useEffect(function() -- Line: 760 -- upvalues: State (upval), u6 (val), react (upval), GiveMarcsPopup (upval), u7 (val)
        local isGiveMarcsPopupOpen, isGiveMarcsPopupOpen_2
        isGiveMarcsPopupOpen, _, isGiveMarcsPopupOpen_2 = State("isGiveMarcsPopupOpen")
        return (isGiveMarcsPopupOpen_2(function(p1) -- Line: 763 -- upvalues: isGiveMarcsPopupOpen (val), u6 (upval), react (upval), GiveMarcsPopup (upval), u7 (upval)
    local v1, v2, v3
    if p1 then
        isGiveMarcsPopupOpen(false)
        v2 = {}
        v3 = {}
        v3.closePopup = u7
        v2.Companion = react.createElement(GiveMarcsPopup, v3)
        u6(v2)
        return
    else
        return
    end
end))
    end, v6)
    All, All_2 = react.useState("All")
    u24, v3 = react.useState("")
    u29, v1 = react.useState(false)
    local v7 = {}
    u34, u35 = react.useBinding(v7)
    local u38 = if u24 == "" then All ~= "All" else true
    local u43 = useStore(Inventory.Store, function(p1) -- Line: 787 -- upvalues: ClientInventoryHandler (upval), Table (upval)
        if not p1 then
            return {}
        end
        return Table.map(p1, function(p1) -- Line: 792 -- upvalues: ClientInventoryHandler (upval)
            local attributes, attributes_2, id, tags, v1, v2, v3, v4, v5, v6, v7
            id = if typeof(p1) == "table" then p1.id else false
            if not id then
                v2 = "Unknown"
            else
                v2 = ClientInventoryHandler.getItemNameFromHash(p1.id)
            end
            if not id then
                v3 = {}
            else
                v3 = ClientInventoryHandler.getItemDataFromName(v2)
            end
            if not id then
                v4 = nil
            else
                v4 = ClientInventoryHandler.getItemModel(p1.id)
            end
            if not id then
                v5 = 0
            else
                v5 = p1.id + p1.offset
            end
            local v8 = {}
            if v3.attributes then
                attributes = v3.attributes
                v6 = nil
                v7 = nil
                for i, j in attributes, v6, v7 do
                    table.insert(v8, j)
                end
            end
            if not p1.tags then
                v1 = p1
            else
                local v9, v10, v11, v12
                tags = p1.tags
                v6 = nil
                v7 = nil
                v1 = p1
                for k, n in tags, v6, v7 do
                    if typeof(n) == "string" then
                        v9 = false
                        v10 = v8
                        v11 = nil
                        v12 = nil
                        for m, i5 in v10, v11, v12 do
                            if i5 == n then
                                v9 = true
                                break
                            end
                        end
                        if not v9 then
                            table.insert(v8, n)
                        end
                    end
                end
            end
            local v13 = {
                name = v2,
                id = v5,
                meta = v1.meta,
                tags = v1.tags,
                model = v4,
            }
            if 0 >= #v8 then
                attributes_2 = v3.attributes
            else
                attributes_2 = v8
            end
            v13.attributes = attributes_2
            v13.description = v3.description
            v13.display_name = v3.display_name
            v13.category = v3.category or "Other"
            v13.hash = v1.id
            v13.offset = v1.offset
            v13.slot = v1.hotbar
            v13.y = v1.y
            v6 = v1.stack == 1
            v13.stackable = v6
            return v13
        end)
    end)
    local v8 = react.useMemo(function() -- Line: 851 -- upvalues: ClientInventoryHandler (upval)
        local v1 = ClientInventoryHandler.getItemCategoriesInInventory()
        table.insert(v1, 1, "All")
        return v1
    end, {u43})
    local u59 = react.useMemo(function() -- Line: 858 -- upvalues: u43 (val), All (val), Table (upval), u24 (val), itemMatchesSearch (upval)
        local v1 = u43
        if All ~= "All" then
            v1 = Table.filter(v1, function(p1) -- Line: 863 -- upvalues: All (upval)
                local v1 = p1.category == All
                return v1
            end)
        end
        if u24 ~= "" then
            local u11 = string.lower(u24)
            v1 = Table.filter(v1, function(p1) -- Line: 870 -- upvalues: itemMatchesSearch (upval), u11 (val)
                return itemMatchesSearch(p1, u11)
            end)
        end
        return v1
    end, {u43, All, u24})
    local u67 = react.useMemo(function() -- Line: 878 -- upvalues: u38 (val), u59 (val)
        local v1, v2
        local v3 = {}
        if not u38 then
            v1 = table.clone(u59)
            table.sort(v1, function(p1, p2) -- Line: 888
                local v1
                if p1.y ~= p2.y then
                    v1 = p1.y < p2.y
                    return v1
                end
                v1 = p1.id < p2.id
                return v1
            end)
            for i, v in ipairs(v1) do
                v3[v.id] = i
                v.__immediate_index = i
            end
            return v3
        end
        v1 = u59
        v2 = nil
        local v4 = nil
        for i2, j in v1, v2, v4 do
            v3[j.id] = i2
            j.__immediate_index = i2
        end
        return v3
    end, {u59, u38})
    react.useEffect(function() -- Line: 903 -- upvalues: u35 (val), u67 (val)
        u35(table.clone(u67))
    end, {u67})
    local u81 = react.useCallback(function(p1, p2, p3) -- Line: 908 -- upvalues: Bindings (upval), u34 (val), u35 (val)
        local v1 = Bindings.getBindingValue(u34)
        local v2 = v1[p1]
        if not v2 or v2 == p2 then
            return v1
        end
        local v3 = table.clone(v1)
        if p2 >= v2 then
            for k, v in pairs(v3) do
                if k ~= p1 and v2 < v and v <= p2 then
                    v3[k] = v - 1
                end
            end
        else
            for k2, i in pairs(v3) do
                if k2 ~= p1 and p2 <= i and i < v2 then
                    v3[k2] = i + 1
                end
            end
        end
        v3[p1] = p2
        local v4 = p3
        local v5 = nil
        local v6 = nil
        for j, k3 in v4, v5, v6 do
            k3.__immediate_index = v3[k3.id]
        end
        u35(v3)
        return v3
    end, {u34})
    local v9 = react.useMemo(function() -- Line: 943 -- upvalues: u59 (val), react (upval), InventoryItem (upval), u29 (val), u34 (val), u38 (val), u6 (val), u7 (val), u81 (val), Inventory (upval)
        local v1 = {}
        local v2 = {}
        local v3 = u59
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v2[j.offset] = j
        end
        v3 = u59
        v4 = nil
        v5 = nil
        for k, n in v3, v4, v5 do
            v1[n.name .. n.offset] = react.createElement(InventoryItem, {
                Tags = false,
                Item = n,
                ButtonLocked = u29,
                ItemsByOffset = v2,
                Order = u34,
                TotalItems = #u59,
                Filtered = u38,
                openPopup = u6,
                closePopup = u7,
                OnImmediateIndexChange = function(p1, p2, p3) -- Line: 967 -- upvalues: u59 (upval), u81 (upval), n (val), Inventory (upval)
                    local v1
                    if #u59 < p1 then
                        v1 = #u59
                    elseif p1 >= 1 then
                        v1 = p1
                    else
                        v1 = 1
                    end
                    local v2 = u81(n.id, v1, u59)
                    if p2 then
                        Inventory.Reposition.post({v2, p3 or 0, n.hash, n.offset})
                    end
                end,
            })
        end
        return v1
    end, {
        u59,
        u38,
        u81,
        u6,
        u7,
    })
    local v10 = v5(105) * math.max(#u59, 1)
    local v11 = {Visible = p1.Enabled}
    local v12 = {Left = react.createElement(CharacterViewport, {
        LookAtMouse = false,
        Native = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.5, 1)},
    })}
    local v13 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.5, 1)}
    local v14 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}
    local v15 = {
        LayoutOrder = 2,
        ZIndex = 10,
        BackgroundColor3 = v4.Container.Background,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v16 = UDim2.fromScale(1, 0)
    v15.Size = v16 + UDim2.fromOffset(0, v5(50))
    local v17 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Stroke = react.createElement("UIStroke", {Transparency = 0, Thickness = 1, Color = v4.Container.Stroke}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10)})}
    local v18 = {
        Header = "Search Items...",
        Placeholder = "Search",
        Layout = 3,
        Icon = "rbxassetid://11293977875",
        Outlined = false,
        Width = "Small",
        Stepped = v3,
    }
    local v19 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5)}
    local v20 = UDim2.fromScale(0, 0.5)
    local v21 = v5(6)
    v19.Position = v20 - UDim2.fromOffset(v21, 0)
    v19.Size = UDim2.fromScale(0.5, 1)
    v18.Native = v19
    v17.Search = react.createElement(TextInput, v18)
    v17.Dropdown = react.createElement(DropdownInput, {
        Visible = true,
        Full = true,
        Options = v8,
        Selected = All_2,
        Opened = v1,
        Native = {BackgroundTransparency = 1, LayoutOrder = 2, AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromScale(0.5, 1)},
    })
    v14.Header = react.createElement("Frame", v15, v17)
    v14.Content = react.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        ScrollBarThickness = 3,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 0.85),
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        CanvasSize = UDim2.fromOffset(0, v10),
    }, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 1), PaddingRight = UDim.new(0, 1), PaddingTop = UDim.new(0, 1), PaddingBottom = UDim.new(0, 1)})}, v9)
    v14.InspectItemPopup = v2
    v12.Right = react.createElement(Frame, v13, {}, v14)
    return react.createElement(Frame, v11, v12)
end