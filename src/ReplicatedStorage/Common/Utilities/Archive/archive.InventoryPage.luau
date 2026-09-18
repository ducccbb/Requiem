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
--        File: ReplicatedStorage.Common.Utilities.Archive.archive.InventoryPage
--                               Dumped in 0.00432 seconds
--                          Bytecode version 9  |  24 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Constants = require(v1.Parent.Parent.Parent:WaitForChild("Constants"))
local Types = v1.Parent.Parent.Parent:WaitForChild("Types")
local Ingots = require(Types:WaitForChild("Ingots"))
local Types_2 = v1.Parent.Parent.Parent:WaitForChild("Types")
local Item = require(Types_2:WaitForChild("Item"))
local Network = v1.Parent.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local Number = require(v1.Parent.Parent:WaitForChild("Number"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Table = require(v1.Parent.Parent:WaitForChild("Table"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local CharacterViewport = require(Universal:WaitForChild("CharacterViewport"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Routes = Interfaces_3:WaitForChild("Routes")
local Screen = Routes:WaitForChild("Screen")
local ContextMenu = require(Screen:WaitForChild("ContextMenu"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local ItemViewport = require(Universal_2:WaitForChild("ItemViewport"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useInputPopup = require(Hooks:WaitForChild("useInputPopup"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_6:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_11:WaitForChild("Client")
local User = Client_10:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local function getPositionOfCellAt(p1, p2) -- Line: 68
    local v1 = UDim2.fromScale((p1 - 1) / 7, (p2 - 1) / 8)
    return v1 + UDim2.fromOffset(p1 * 2, p2 * 2)
end
local function getAbsoluteBounds(p1) -- Line: 72
    local AbsolutePosition = p1.AbsolutePosition
    local AbsoluteSize = p1.AbsoluteSize
    return AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + 58, AbsolutePosition.Y + AbsoluteSize.Y + 58
end
local function InventoryItem(p1) -- Line: 87 -- upvalues: useRem (val), useMotion (val), getPositionOfCellAt (val), useInputPopup (val), useToast (val), react (val), Ingots (val), UserInputService (val), getAbsoluteBounds (val), GuiService (val), Inventory (val), Frame (val), ItemViewport (val), ClientInventoryHandler (val), ContextMenu (val), Constants (val), Number (val), Item (val)
    local u11, u12, u16, u20, u29, u30, u34, u35, v1, v2, v3, v4, v5, v6
    local v7 = useRem()
    local Item_2 = p1.Item
    u11, u12 = useMotion(getPositionOfCellAt(Item_2.Position.X, Item_2.Position.Y))
    v5, u16 = useMotion(5)
    v6, u20 = useMotion(1)
    local u22 = useInputPopup()
    local u25 = useToast()
    u29, u30 = react.useState(false)
    u34, u35 = react.useState(false)
    local v8 = if Item_2.Name ~= "Pouch" then if Item_2.Name ~= "Payslip" then Item_2.Name == "Marcs" else true else true
    local v9 = {}
    local v10 = {}
    if -1 >= p1.Item.Slot then
        v1 = "Add to Hotbar"
    else
        v1 = "Remove from Hotbar"
    end
    v10.label = v1
    v9[1] = v10
    local Tags = Item_2
    if Tags then
        Tags = Item_2.Tags
        if Tags then
            Tags = Item_2.Tags[1]
            if Tags then
                Tags = typeof(Item_2.Tags[1]) == "string"
            end
        end
    end
    if not Tags then
        v1 = ""
    else
        v1 = table.concat(Item_2.Tags, " ")
    end
    if Item_2.Name == "Pouch" then
        table.insert(v9, {label = "Withdraw from Pouch"})
    end
    if Item_2.Tags then
        local v11 = #Item_2.Tags
        if 0 < v11 then
            v11 = Ingots.getMaskedNameFromTags(Item_2.Tags)
            if not v11 then end
        end
    end
    react.useEffect(function() -- Line: 124 -- upvalues: u29 (val), u34 (val), u20 (val), u16 (val)
        local v1 = 0
        if u29 then
            v1 = v1 + 10
        end
        if u34 then
            v1 = v1 + 15
        end
        if not u29 then
            u20:spring(1)
        else
            u20:spring(0.4)
        end
        u16:spring(v1)
    end, {u29, u34})
    local function updateInventoryItemPosition(a1) -- Line: 144 -- upvalues: UserInputService (upval), getAbsoluteBounds (upval), GuiService (upval), Item_2 (val), p1 (val), u35 (val), getPositionOfCellAt (upval), u12 (val), u11 (val), Inventory (upval)
        local X, Y, u134, u137, u140, u143, v1, v2, v3
        local MouseLocation = UserInputService:GetMouseLocation()
        u134, u137, u140, u143 = getAbsoluteBounds(a1.Parent.Parent)
        local GuiInset = GuiService:GetGuiInset()
        a1.Parent.ZIndex = 2
        local v4 = MouseLocation.X - a1.AbsolutePosition.X
        local v5 = MouseLocation.Y - a1.AbsolutePosition.Y
        local u149 = Vector2.new(v4, v5 - GuiInset.Y)
        local u152 = Vector2.new(Item_2.Position.X, Item_2.Position.Y)
        local u127 = {}
        local u131 = a1
        for k, v in pairs(p1.Contents) do
            if v ~= p1.Item then
                X = v.Size.X
                v1 = 1
                for i = 1, X, v1 do
                    Y = v.Size.Y
                    v2 = 1
                    for j = 1, Y, v2 do
                        v3 = v.Position - Vector2.new(1, 1)
                        u127[v3 + Vector2.new(i, j)] = v
                    end
                end
            end
        end
        u35(true)
        local function getCellPosition(p1) -- Line: 172 -- upvalues: u131 (val), GuiInset (val), u134 (val), u137 (val), u140 (val), u143 (val), getPositionOfCellAt (upval)
            local v1, v2, v3, v4
            local u8 = u131.AbsolutePosition + Vector2.new(0, GuiInset.Y)
            local u15 = u8 + Vector2.new(u131.AbsoluteSize.X, 0)
            local u22 = u8 + Vector2.new(0, u131.AbsoluteSize.Y)
            local u31 = u8 + Vector2.new(u131.AbsoluteSize.X, u131.AbsoluteSize.Y)
            v2, v3 = (function() -- Line: 179 -- upvalues: u8 (val), u15 (val), u22 (val), u31 (val), u134 (upval), u137 (upval), u140 (upval), u143 (upval), p1 (val), getPositionOfCellAt (upval)
                local Magnitude, v1, v2, v3, v4, v5, v6, v7
                local v8 = {u8, u15, u22, u31}
                local v9 = nil
                local v10 = nil
                local huge = math.huge
                for k, v in pairs(v8) do
                    v7 = (v.X - u134) / (u137 - u134)
                    v1 = (v.Y - u140) / (u143 - u140)
                    v2 = math.floor(v7 * 7) + 1
                    v3 = math.floor(v1 * 8) + 1
                    v2 = math.clamp(v2, 1, 7 - p1.Size.X + 1)
                    v3 = math.clamp(v3, 1, 8 - p1.Size.Y + 1)
                    v4 = getPositionOfCellAt(v2, v3)
                    v5 = Vector2.new(v7, v1)
                    Magnitude = (v5 - Vector2.new(v4.X.Scale, v4.Y.Scale)).Magnitude
                    if Magnitude < huge then
                        huge = Magnitude
                        v9 = k
                        v10 = Vector2.new(v2, v3)
                    end
                end
                if v9 == 1 then
                    v6 = Vector2.new(0, 0)
                    return v6, v10
                end
                if v9 == 2 then
                    v6 = Vector2.new(p1.Size.X, 0)
                    return v6, v10
                end
                if v9 == 3 then
                    v6 = Vector2.new(0, p1.Size.Y)
                    return v6, v10
                end
                if v9 == 4 then
                    v6 = Vector2.new(p1.Size.X, p1.Size.Y)
                    return v6, v10
                end
                v6 = Vector2.new(0, 0)
                return v6, v10
            end)()
            local v5 = v3 - v2
            v1 = math.clamp(v5.X, 1, 7)
            v5 = Vector2.new(v1, (math.clamp(v5.Y, 1, 8)))
            v4 = getPositionOfCellAt(v5.X, v5.Y)
            return v4, Vector2.new(v5.X, v5.Y)
        end
        local function isPositionFull(p1) -- Line: 231 -- upvalues: Item_2 (upval), u127 (val)
            local Y, v1, v2
            local X = Item_2.Size.X
            local v3 = 1
            local v4 = p1
            for i = 1, X, v3 do
                Y = Item_2.Size.Y
                v2 = 1
                for j = 1, Y, v2 do
                    for k, v in pairs(u127) do
                        v1 = v4 - Vector2.new(1, 1)
                        if v1 + Vector2.new(i, j) == k then
                            return true, v
                        end
                    end
                end
            end
            return false, nil
        end
        local u65 = nil
        local u73 = UserInputService.InputChanged:Connect(function(p1) -- Line: 247 -- upvalues: UserInputService (upval), u134 (val), u137 (val), u140 (val), u143 (val), u149 (val), u12 (upval)
            if p1.UserInputType == Enum.UserInputType.MouseMovement then
                local MouseLocation = UserInputService:GetMouseLocation()
                local v1 = UDim2.fromScale((MouseLocation.X - u134) / (u137 - u134), (MouseLocation.Y - u140) / (u143 - u140))
                local v2 = v1 - UDim2.fromOffset(u149.X, u149.Y)
                u12:immediate(v2)
            end
        end)
    end
    local createElement = react.createElement
    local v12 = {BackgroundTransparency = 1}
    local v13 = v7(85)
    local v14 = v13 * Item_2.Size.X
    local v15 = v7(85)
    v12.Size = UDim2.fromOffset(v14, v15 * Item_2.Size.Y)
    v12.Position = u11
    v12.AnchorPoint = Vector2.new(0, 0)
    local v16 = {}
    local createElement_2 = react.createElement
    v15 = {BackgroundTransparency = 0, Size = v5:map(function(p1) -- Line: 319
        local v1 = UDim2.fromScale(1, 1)
        return v1 + UDim2.fromOffset(p1, p1)
    end), BackgroundColor3 = Color3.fromRGB(23, 25, 30)}
    local v17 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 8)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(59, 63, 71)})}
    local createElement_3 = react.createElement
    local v18 = {Spins = true, Model = Item_2.Model}
    if not Item_2 then
        v2 = nil
    elseif Item_2.Tags then
        v3 = #Item_2.Tags
        if 0 < v3 then
            function v2(p1) -- Line: 334 -- upvalues: ClientInventoryHandler (upval), Item_2 (val)
                ClientInventoryHandler.onRenderItemModel(Item_2, p1)
            end
        end
    end
    v18.Render = v2
    v17.Viewport = createElement_3(ItemViewport, v18)
    v17.Pouch = react.createElement(ContextMenu.ContextMenu, {
        Contexts = v9,
        Callback = function(p1) -- Line: 341 -- upvalues: Item_2 (val), u22 (val), u25 (val), Inventory (upval)
            if p1 ~= 2 then
                Inventory.Action.post({action = p1, hash = Item_2.Hash, offset = Item_2.Offset, data = {}})
                return
            end
            if Item_2.Name == "Pouch" then
                u22("Withdraw from Pouch", "How much would you like to withdraw?", "Amount", function(a1) -- Line: 348 -- upvalues: u25 (upval), Inventory (upval), p1 (val), Item_2 (upval)
                    if not a1 or not (tonumber(a1)) then
                        u25({message = "Invalid Pouch Withdraw Amount", type = "error"})
                        return
                    end
                    Inventory.Action.post({
                        action = p1,
                        hash = Item_2.Hash,
                        offset = Item_2.Offset,
                        data = {tonumber(a1) or 0},
                    })
                end)
                return
            end
            Inventory.Action.post({action = p1, hash = Item_2.Hash, offset = Item_2.Offset, data = {}})
        end,
    })
    local createElement_4 = react.createElement
    v18 = {TextSize = 15, BackgroundTransparency = 1, ZIndex = 3}
    local Symbol = Constants.Currency.Symbol
    local FormatWithCommas = Number.FormatWithCommas
    if not Item_2.Meta then
        v4 = 0
    else
        v4 = Item_2.Meta[1]
        if not v4 then
            v4 = 0
        end
    end
    v18.Text = Symbol .. tostring(FormatWithCommas(v4))
    v18.TextColor3 = Color3.fromRGB(79, 218, 66)
    v18.TextTransparency = v6
    v18.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v18.TextXAlignment = Enum.TextXAlignment.Center
    v18.AnchorPoint = Vector2.new(0.5, 1)
    v3 = UDim2.fromScale(0.5, 1)
    v18.Position = v3 + UDim2.fromOffset(0, -20)
    v18.Visible = v8
    v17.Currency = createElement_4("TextLabel", v18)
    v18 = {
        TextSize = 18,
        BackgroundTransparency = 1,
        ZIndex = 3,
        Text = Item.getDisplayName(Item_2),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v6,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        TextXAlignment = Enum.TextXAlignment.Center,
        AnchorPoint = Vector2.new(0.5, 1),
    }
    v3 = UDim2.fromScale(0.5, 1)
    if not v8 then
        v4 = -25
    else
        v4 = -35
    end
    v18.Position = v3 + UDim2.fromOffset(0, v4)
    v17.Label = react.createElement("TextLabel", v18)
    v16.Container = createElement_2(Frame, v15, v17)
    v15 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
    v15[react.Event.MouseButton1Down] = function(...) -- Line: 419 -- upvalues: updateInventoryItemPosition (val)
        updateInventoryItemPosition(...)
    end
    v15[react.Event.MouseEnter] = function(...) -- Line: 423 -- upvalues: u30 (val)
        u30(true)
    end
    v15[react.Event.MouseLeave] = function() -- Line: 427 -- upvalues: u30 (val)
        u30(false)
    end
    v16.Button = react.createElement("TextButton", v15)
    return createElement(Frame, v12, v16)
end
return function(p1) -- Line: 436 -- upvalues: useRem (val), react (val), Frame (val), getPositionOfCellAt (val), useStore (val), Inventory (val), Table (val), ClientInventoryHandler (val), InventoryItem (val), CharacterViewport (val)
    local u6, u7, v1, v2, v3
    local u2 = useRem()
    local v4 = {}
    u6, u7 = react.useState(v4)
    v3 = react.useMemo(function() -- Line: 440 -- upvalues: react (upval), Frame (upval), u2 (val), getPositionOfCellAt (upval)
        local v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = 7
        local v8 = 1
        for i = 1, v7, v8 do
            v3 = 8
            v4 = 1
            for j = 1, v3, v4 do
                v5 = tostring(i .. "-" .. j)
                v1 = {BackgroundTransparency = 0}
                v2 = u2(85)
                v1.Size = UDim2.fromOffset(v2, u2(85))
                v1.BackgroundColor3 = Color3.fromRGB(27, 29, 35)
                v1.Position = getPositionOfCellAt(i, j)
                v1.AnchorPoint = Vector2.new(0, 0)
                v6[v5] = react.createElement(Frame, v1, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(52, 56, 66)})})
            end
        end
        return v6
    end)
    local u16 = useStore(Inventory.Store, function(p1) -- Line: 463 -- upvalues: Table (upval), ClientInventoryHandler (upval)
        if not p1 then
            return {}
        end
        return Table.map(p1, function(p1) -- Line: 467 -- upvalues: ClientInventoryHandler (upval)
            local v1, v2
            local id = false
            if typeof(p1) == "table" then
                id = p1.id
                if id then
                    id = p1.position
                end
            end
            if not id then
                v1 = "Unknown"
            else
                v1 = ClientInventoryHandler.getItemNameFromHash(p1.id)
            end
            if not id then
                v2 = nil
            else
                v2 = ClientInventoryHandler.getItemModel(p1.id)
                if not v2 then
                    v2 = nil
                end
            end
            return {
                Name = v1 or "Unknown",
                Position = Vector2.new(p1.position.x, p1.position.y),
                Size = Vector2.new(p1.size.x, p1.size.y),
                Id = p1.id + p1.hotbar + p1.size.x + p1.size.y + p1.offset,
                Meta = p1.meta,
                Model = v2,
                Hash = p1.id,
                Offset = p1.offset,
                Slot = p1.hotbar,
                Tags = p1.tags,
            }
        end)
    end)
    react.useEffect(function() -- Line: 493 -- upvalues: u7 (val), u16 (val)
        u7(u16)
    end, {u16})
    local v5 = {}
    for k, v in pairs(u6) do
        v2 = tostring(v.Id)
        v5[v2] = react.createElement(InventoryItem, {
            Item = v,
            Contents = u6,
            Repositioned = function(p1) -- Line: 503 -- upvalues: u6 (val), k (val), Inventory (upval), v (val), u7 (val)
                local v1 = table.clone(u6)
                v1[k].Position = p1
                Inventory.Reposition.post({
                    hash = v.Hash,
                    offset = v.Offset,
                    position = {x = p1.X, y = p1.Y},
                })
                u7(v1)
            end,
        })
    end
    local v6 = {Visible = p1.Enabled}
    v1 = {Left = react.createElement(Frame, {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(0.5, 1)}, {ViewportFrame = react.createElement(CharacterViewport)})}
    local createElement_2 = react.createElement
    local v7 = {AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.75, 0)}
    local v8 = 7 * u2(85)
    local v9 = UDim2.fromOffset(v8, 8 * u2(85))
    v7.Size = v9 + UDim2.fromOffset(4, 4)
    local v10 = {}
    local v11 = {BackgroundTransparency = 1}
    local v12 = UDim2.fromScale(0.5, 0.5)
    v11.Position = v12 + UDim2.fromOffset(-4, 0)
    v10.Grid = react.createElement(Frame, v11, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 7)})}, v3)
    v11 = {BackgroundTransparency = 1, ZIndex = 2}
    v12 = UDim2.fromScale(0.5, 0.5)
    v11.Position = v12 + UDim2.fromOffset(-4, 0)
    v10.Items = react.createElement(Frame, v11, v5)
    v1.Right = createElement_2(Frame, v7, v10)
    return react.createElement(Frame, v6, v1)
end