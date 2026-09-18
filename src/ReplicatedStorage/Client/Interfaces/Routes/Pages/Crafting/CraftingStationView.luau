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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Crafting.CraftingStationView
--                               Dumped in 0.00985 seconds
--                          Bytecode version 9  |  87 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = require(Common_2:WaitForChild("Network"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local ItemViewport = require(Universal_2:WaitForChild("ItemViewport"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local TextInput = require(Inputs:WaitForChild("TextInput"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_5:WaitForChild("Utilities")
local Bindings = require(Utilities_2:WaitForChild("Bindings"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_6:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBindingListener = require(Hooks:WaitForChild("useBindingListener"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Crafting = Common_5:WaitForChild("Crafting")
local GridRecipeMatch = require(Crafting:WaitForChild("GridRecipeMatch"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Crafting_2 = Common_6:WaitForChild("Crafting")
local IngredientAliases = require(Crafting_2:WaitForChild("IngredientAliases"))
local u373 = RunService:IsStudio()
local function findScrollingFrame(p1) -- Line: 82
    local Parent = p1
    while Parent do
        if Parent:IsA("ScrollingFrame") then
            return Parent
        end
        Parent = Parent.Parent
    end
    return nil
end
local function CraftingTagBadge(p1) -- Line: 93 -- upvalues: react (val)
    return react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = false, Size = UDim2.fromOffset(p1.Width, p1.Height), LayoutOrder = p1.LayoutOrder}, {Gutter = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 2)}), Label = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        TextSize = p1.textScale(p1.constants.TextSize.Medium * 1.2 * 0.75),
        Text = p1.Text,
        TextColor3 = p1.theme.Primary,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, {Padding = react.createElement("UIPadding", p1.constants.Padding.Universal.Small), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), BorderStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.35, Color = p1.theme.Primary, ApplyStrokeMode = Enum.ApplyStrokeMode.Border})})})
end
local function getAbsoluteBounds(p1, p2) -- Line: 140 -- upvalues: GuiService (val)
    local AbsolutePosition = p1.AbsolutePosition
    local AbsoluteSize = p1.AbsoluteSize
    local GuiInset = GuiService:GetGuiInset()
    return AbsolutePosition.X - GuiInset.X, AbsolutePosition.X + AbsoluteSize.X - GuiInset.X, AbsolutePosition.Y + 58 - GuiInset.Y, AbsolutePosition.Y + AbsoluteSize.Y + 58 - GuiInset.Y
end
local function guiMouseVector() -- Line: 155 -- upvalues: GuiService (val), UserInputService (val)
    local GuiInset = GuiService:GetGuiInset()
    local MouseLocation = UserInputService:GetMouseLocation()
    return Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
end
local function pointInFrameGui(p1, p2) -- Line: 161 -- upvalues: getAbsoluteBounds (val)
    local v1, v2, v3, v4
    v1, v2, v3, v4 = getAbsoluteBounds(p2, nil)
    local v5 = if v1 <= p1.X then if p1.X <= v2 then if v3 <= p1.Y then p1.Y <= v4 else false else false else false
    return v5
end
local function inventoryRowKey(p1) -- Line: 168
    local v1 = tostring(p1.id)
    return v1 .. "\000" .. tostring(p1.offset)
end
local function placedRowKey(p1) -- Line: 172
    local v1 = tostring(p1.id)
    return v1 .. "\000" .. tostring(p1.offset)
end
local function tagsNumsToStrings(p1) -- Line: 176
    local v1 = {}
    if not p1 then
        return v1
    end
    for i, v in ipairs(p1) do
        table.insert(v1, (tostring(v)))
    end
    return v1
end
local function placementBudget(p1) -- Line: 187
    if p1.stack ~= 1 then
        return 1
    end
    local meta = p1.meta
    if meta then
        meta = p1.meta[1]
    end
    if type(meta) == "number" then
        return (math.max(1, meta))
    end
    return 1
end
local function itemMergeKey(p1) -- Line: 200
    local v1 = {(tostring(p1.id))}
    local tags = p1.tags
    if not tags then
        tags = {}
    end
    for i, v in ipairs(tags) do
        table.insert(v1, (tostring(v)))
    end
    if p1.stack == 1 then
        return table.concat(v1, "\000")
    end
    table.insert(v1, "\001meta\001")
    local meta = p1.meta
    if not meta then
        meta = {}
    end
    for i2, i3 in ipairs(meta) do
        table.insert(v1, (tostring(i3)))
    end
    return table.concat(v1, "\000")
end
local function pickAvailableSourceItem(p1, p2) -- Line: 215 -- upvalues: inventoryRowKey (val), placementBudget (val)
    local SourceItems, v1
    if not p1.SourceItems then
        SourceItems = {p1.Item}
    else
        local v2 = #p1.SourceItems
        if 0 < v2 then
            SourceItems = p1.SourceItems
        end
    end
    for i, v in ipairs(SourceItems) do
        v1 = p2[inventoryRowKey(v)] or 0
        if v1 < placementBudget(v) then
            return v
        end
    end
    return nil
end
local function networkItemToPlaced(p1) -- Line: 231 -- upvalues: ClientInventoryHandler (val), Item (val), tagsNumsToStrings (val)
    local v1 = ClientInventoryHandler.getItemNameFromHash(p1.id) or "Unknown"
    return {
        id = p1.id,
        offset = p1.offset,
        tags = p1.tags,
        meta = p1.meta,
        displayName = Item.getDisplayName({name = v1, tags = tagsNumsToStrings(p1.tags)}),
        modelName = v1,
    }
end
local function buildRequirementMultiset(p1) -- Line: 246
    local v1 = {}
    local requirements = p1
    if requirements then
        requirements = p1.requirements
    end
    if type(requirements) ~= "table" then
        return v1
    end
    for i, v in ipairs(requirements) do
        v1[v.item] = (v1[v.item] or 0) + v.amount
    end
    return v1
end
local function multisetsEqual(p1, p2) -- Line: 258
    for k, v in pairs(p1) do
        if p2[k] or 0 ~= v then
            return false
        end
    end
    for k2, i in pairs(p2) do
        if p1[k2] or 0 ~= i then
            return false
        end
    end
    return true
end
local function buildPlacedMultisetFromGrid(p1) -- Line: 272 -- upvalues: ClientInventoryHandler (val), IngredientAliases (val), tagsNumsToStrings (val)
    local v1, v2
    local v3 = {}
    for k, v in pairs(p1) do
        if v then
            v1 = ClientInventoryHandler.getItemNameFromHash(v.id) or ""
            v2 = IngredientAliases.recipeMatchIdentity(v1, tagsNumsToStrings(v.tags))
            v3[v2] = (v3[v2] or 0) + 1
        end
    end
    return v3
end
local function collectPlacedList(p1) -- Line: 284
    local v1 = {}
    for k, v in pairs(p1) do
        if v then
            table.insert(v1, v)
        end
    end
    return v1
end
local function placementReadMapFromGrid(p1, p2) -- Line: 294
    local v1
    local v2 = {}
    local v3 = p2 * p2
    local v4 = 1
    local v5 = p1
    for i = 1, v3, v4 do
        v1 = v5[i]
        if v1 then
            v2[i] = {id = v1.id, offset = v1.offset, tags = v1.tags}
        end
    end
    return v2
end
local function shapedPatternActive(p1) -- Line: 308 -- upvalues: GridRecipeMatch (val)
    local v1, v2
    if not p1 then
        return false
    end
    _, v1, v2 = GridRecipeMatch.trimPattern(p1)
    local v3 = if 0 < v1 then 0 < v2 else false
    return v3
end
local function resolveRecipeFromGrid(p1, p2, p3) -- Line: 316 -- upvalues: collectPlacedList (val), buildPlacedMultisetFromGrid (val), placementReadMapFromGrid (val), ClientInventoryHandler (val), shapedPatternActive (val), GridRecipeMatch (val), buildRequirementMultiset (val), multisetsEqual (val), IngredientAliases (val), tagsNumsToStrings (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = collectPlacedList(p1)
    if #v7 == 0 then
        return nil
    end
    local v8 = buildPlacedMultisetFromGrid(p1)
    local v9 = placementReadMapFromGrid(p1, p3)
    local getItemNameFromHash = ClientInventoryHandler.getItemNameFromHash
    local v10 = p3
    for k, v in pairs(p2) do
        if shapedPatternActive(v.pattern) and v.pattern then
            v4 = v.merge_tags == true
            v1, v2 = GridRecipeMatch.matchShapedPlacements(v10, v9, getItemNameFromHash, v.pattern, v4)
            if not v1 then
                continue
            end
            v3 = table.clone(v)
            if v.merge_tags then
                v3.tags = v2
            end
            return v3
        end
        if type(v.requirements) == "table" then
            v1 = buildRequirementMultiset(v)
            if multisetsEqual(v8, v1) then
                v2 = table.clone(v)
                if v.merge_tags then
                    v3 = {}
                    for i, i2 in ipairs(v7) do
                        v5 = ClientInventoryHandler.getItemNameFromHash(i2.id) or ""
                        _, v6 = IngredientAliases.recipeMatchIdentity(v5, tagsNumsToStrings(i2.tags))
                        for i3, j in ipairs(v6) do
                            table.insert(v3, j)
                        end
                    end
                    v2.tags = v3
                end
                return v2
            end
        end
    end
    return nil
end
local function formatCraftingGridDebug(p1, p2) -- Line: 370
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    local v9 = p2
    local v10 = 1
    v2, v1 = p2, p1
    for i = 1, v9, v10 do
        v5 = {}
        v6 = v2
        v7 = 1
        for j = 1, v6, v7 do
            v3 = v1[(i - 1) * v2 + j]
            if not v3 then
                table.insert(v5, ".")
            else
                v4 = v3.modelName or "?"
                if 12 < #v4 then
                    v4 = string.sub(v4, 1, 12) .. "..."
                end
                table.insert(v5, v4)
            end
        end
        table.insert(v8, table.concat(v5, "  "))
    end
    return table.concat(v8, "\n")
end
local function rowMatchesSearch(p1, p2) -- Line: 392
    local v1
    if p2 == "" then
        return true
    end
    local v2 = string.lower(p2)
    local v3 = string.lower(p1.Name)
    if string.find(v3, v2, 1, true) then
        return true
    end
    for i, v in ipairs(p1.Tags) do
        v1 = string.lower(v)
        if string.find(v1, v2, 1, true) then
            return true
        end
    end
    return false
end
local function sortCategoryNames(p1, p2) -- Line: 408
    if p1 == "Other" then
        return false
    end
    if p2 == "Other" then
        return true
    end
    local v1 = p1 < p2
    return v1
end
local function buildRowsFromInventory(p1, p2, p3) -- Line: 418 -- upvalues: ClientInventoryHandler (val), itemMergeKey (val), placementBudget (val), inventoryRowKey (val), tagsNumsToStrings (val), Item (val), rowMatchesSearch (val)
    local category, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = {}
    local v12 = {}
    v1, v10 = p2, p3
    for k, v in pairs(p1) do
        if typeof(v) == "table" and v.id and ClientInventoryHandler.getItemNameFromHash(v.id) then
            v3 = itemMergeKey(v)
            if not (v12[v3]) then
                v12[v3] = {}
            end
            table.insert(v12[v3], v)
        end
    end
    for k2, i in pairs(v12) do
        table.sort(i, function(p1, p2) -- Line: 443
            local v1 = p1.offset < p2.offset
            return v1
        end)
        v2 = i[1]
        v3 = ClientInventoryHandler.getItemNameFromHash(v2.id)
        if v3 then
            v4 = 0
            v5 = 0
            for i2, j in ipairs(i) do
                v4 = v4 + placementBudget(j)
                v5 = v5 + (v10[inventoryRowKey(j)] or 0)
            end
            v6 = v4 - v5
            if v6 > 0 then
                v7 = ClientInventoryHandler.getItemDataFromName(v3)
                if not v7 then
                    category = "Other"
                else
                    category = v7.category
                end
                if not (v11[category]) then
                    v11[category] = {}
                end
                v8 = tagsNumsToStrings(v2.tags)
                v9 = {
                    Name = Item.getDisplayName({name = v3, tags = v8}),
                    Amount = v6,
                    Tags = v8,
                    Item = v2,
                    SourceItems = i,
                }
                if rowMatchesSearch(v9, v1) then
                    table.insert(v11[category], v9)
                end
            end
        end
    end
    return v11
end
local function CraftingItem(p1) -- Line: 487 -- upvalues: useRem (val), useTheme (val), useConstants (val), useTextScale (val), react (val), Bindings (val), useBindingListener (val), findScrollingFrame (val), UserInputService (val), getAbsoluteBounds (val), GuiService (val), CraftingTagBadge (val), ClientInventoryHandler (val), Table (val), ItemViewport (val), Color (val)
    local Item, Tags, u20, u21, u34, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = useTheme()
    local v8 = useConstants()
    local v9 = useTextScale()
    local u11 = p1.DragDisabled == true
    local u15 = p1.RowHeight + p1.RowGap
    local function getPositionOfCellAt(p1) -- Line: 508 -- upvalues: u15 (val)
        return UDim2.fromOffset(0, u15 * ((p1 or 1) - 1))
    end
    u20, u21 = react.useBinding(false)
    local v10 = Bindings.getBindingValue(p1.Order)
    v1, u34 = react.useBinding(getPositionOfCellAt(v10[p1.ItemId] or 1))
    useBindingListener(p1.Order, function(a1) -- Line: 517 -- upvalues: u11 (val), Bindings (upval), u20 (val), p1 (val), u34 (val), getPositionOfCellAt (val)
        if u11 then
            return
        end
        if not (Bindings.getBindingValue(u20)) and a1[p1.ItemId] then
            u34(getPositionOfCellAt(a1[p1.ItemId]))
        end
    end)
    react.useEffect(function() -- Line: 526 -- upvalues: u11 (val), Bindings (upval), p1 (val), u34 (val), getPositionOfCellAt (val)
        if u11 then
            return
        end
        local v1 = Bindings.getBindingValue(p1.Order)
        u34(getPositionOfCellAt(v1[p1.ItemId] or 1))
    end, {p1.ItemId, u11})
    local u57 = react.useCallback(function(a1) -- Line: 535 -- upvalues: u11 (val), p1 (val), findScrollingFrame (upval), u21 (val), UserInputService (upval), getAbsoluteBounds (upval), GuiService (upval), u15 (val), Bindings (upval), u34 (val), getPositionOfCellAt (val)
        local u22
        if u11 or p1.Filtered then
            return
        end
        local u6 = findScrollingFrame(a1)
        if not u6 then
            return
        end
        u21(true)
        local Parent = a1.Parent
        Parent.ZIndex = 2
        Parent.Rotation = 0.05
        local MouseLocation = UserInputService:GetMouseLocation()
        _, _, u22 = getAbsoluteBounds(Parent.Parent, u6)
        local GuiInset = GuiService:GetGuiInset()
        local AbsolutePosition = a1.AbsolutePosition
        local v1 = Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
        local u44 = Vector2.new(v1.X - AbsolutePosition.X, v1.Y - AbsolutePosition.Y)
        local function getClosestIndexFromMousePosition(a1) -- Line: 561 -- upvalues: u6 (val), u22 (val), u15 (upval), p1 (upval)
            local Y
            if not u6 then
                Y = 0
            else
                Y = u6.CanvasPosition.Y
                if not Y then
                    Y = 0
                end
            end
            local v1 = a1.Y - u22 + Y
            return (math.min(math.max(1, math.floor(v1 / u15) + 1), p1.TotalItems))
        end
        local u47 = nil
        local u54 = UserInputService.InputChanged:Connect(function(a1) -- Line: 573 -- upvalues: UserInputService (upval), GuiInset (val), u44 (val), u6 (val), Bindings (upval), p1 (upval), getClosestIndexFromMousePosition (val), u34 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local MouseLocation = UserInputService:GetMouseLocation()
                local v1 = Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
                local v2 = UDim2.fromOffset(v1.X - u44.X - u6.AbsolutePosition.X, v1.Y - u44.Y - u6.AbsolutePosition.Y + u6.CanvasPosition.Y)
                local v3 = Bindings.getBindingValue(p1.Order)
                local v4 = v3[p1.ItemId]
                v3 = getClosestIndexFromMousePosition(v1)
                if v4 and v3 ~= v4 then
                    p1.OnImmediateIndexChange(v3)
                end
                u34(v2)
            end
        end)
    end, {
        p1.Filtered,
        p1.TotalItems,
        p1.Order,
        p1.ItemId,
        u15,
        p1.OnImmediateIndexChange,
    })
    local PageBackground = v7.PageBackground
    v10 = {}
    local v11 = v6(88)
    local v12 = 0
    if p1.Item.Tags then
        v12 = #p1.Item.Tags
        for i, v in ipairs(p1.Item.Tags) do
            v10["Tag_" .. i] = react.createElement(CraftingTagBadge, {
                Text = v,
                Width = v11,
                Height = v6(20),
                LayoutOrder = i,
                theme = v7,
                constants = v8,
                textScale = v9,
            })
        end
    end
    local v13 = v6(10)
    local v14 = 0
    if 0 < v12 then
        v3 = math.max(0, v12 - 1)
        v14 = v13 + v12 * v11 + v3 * v6(4)
    end
    Item = p1.Item.Item
    if not Item then
        v2 = nil
    else
        v2 = ClientInventoryHandler.getItemNameFromHash(Item.id)
    end
    if not v2 then
        v3 = nil
    else
        v3 = ClientInventoryHandler.getItemModelFromName(v2)
    end
    Tags = p1.Item.Tags
    local v15 = p1.RowHeight - v6(6) * 2
    local v16 = v6(26)
    local v17 = math.clamp(v15, v16, v6(56))
    v15 = v6(8)
    local merge = Table.merge
    local v18 = {ZIndex = 1, Size = UDim2.new(1, 0, 0, p1.RowHeight)}
    if not u11 then
        v4 = v1
    else
        v4 = UDim2.new(0, 0, 0, 0)
    end
    v18.Position = v4
    v18.AnchorPoint = Vector2.new(0, 0)
    v18.BackgroundTransparency = v7.PageTransparency
    v18.BackgroundColor3 = PageBackground
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    v16 = merge(v18, Native, true)
    v18 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 6)}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v6(6)), PaddingRight = UDim.new(0, v6(6)), PaddingTop = UDim.new(0, v6(6)), PaddingBottom = UDim.new(0, v6(6))}), Tags = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(4)),
    })}, v10)}
    local createElement = react.createElement
    local v19 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromOffset(v17, v17),
    }
    local v20 = {}
    local v21 = {CornerRadius = UDim.new(0, (math.max(4, (math.floor(v17 * 0.12)))))}
    v20.IconCorner = react.createElement("UICorner", v21)
    if not v3 then
        v5 = nil
    else
        local createElement_2 = react.createElement
        v21 = {Spins = false, Background = true, Model = v3}
        local v22 = {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Size = UDim2.fromScale(0.9, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        v21.Native = v22
        v21.BackgroundColor3 = Color.Darken(v7.PageBackground, 0.92)
        if not Tags then
            v22 = nil
        elseif 0 < #Tags then
            function v22(p1) -- Line: 725 -- upvalues: ClientInventoryHandler (upval), Tags (val)
                ClientInventoryHandler.onRenderItemModel({tags = Tags}, p1)
            end
        end
        v21.Render = v22
        v5 = createElement_2(ItemViewport, v21)
        if not v5 then
            v5 = nil
        end
    end
    v20.Viewport = v5
    v18.IconShell = createElement("Frame", v19, v20)
    v19 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, v17 + v15, 0.5, 0),
        Size = UDim2.new(1, -(v17 + v15 + v14), 1, 0),
    }
    v18.TextStack = react.createElement("Frame", v19, {VLayout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(2)),
    }), Name = react.createElement("TextLabel", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        TextWrapped = false,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = p1.Item.Name,
        TextColor3 = Color.Darken(v7.Primary, 0.8),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextSize = v9(v8.TextSize.Body),
    }), Amount = react.createElement("TextLabel", {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = string.format("x%d", p1.Item.Amount or 1),
        TextColor3 = Color.Darken(v7.Primary, 0.55),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextSize = v9(v8.TextSize.Medium * 1.05),
    })})
    if not u11 then
        v19 = {ZIndex = 5, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
        v19[react.Event.MouseButton1Down] = function(a1) -- Line: 788 -- upvalues: p1 (val), u57 (val)
            if not p1.Filtered then
                u57(a1)
            end
        end
        v18.Hitbox = react.createElement("TextButton", v19)
    end
    return react.createElement("Frame", v16, v18)
end
local function CraftingCategoryRow(p1) -- Line: 799 -- upvalues: react (val), findScrollingFrame (val), guiMouseVector (val), UserInputService (val), pickAvailableSourceItem (val), networkItemToPlaced (val), CraftingItem (val)
    local v1 = (p1.rowIndex - 1) * p1.cellStride
    local v2 = {}
    v2[p1.rowIndex] = 1
    local v3 = react.useBinding(v2)
    local u23 = react.useCallback(function(a1) -- Line: 818 -- upvalues: findScrollingFrame (upval), guiMouseVector (upval), p1 (val), UserInputService (upval), pickAvailableSourceItem (upval), networkItemToPlaced (upval)
        if not (findScrollingFrame(a1)) then
            return
        end
        local u5 = guiMouseVector()
        local u6 = false
        local u7 = nil
        local u8 = nil
        local u9 = nil
        local u10 = nil
        local function syncGhostToMouse() -- Line: 831 -- upvalues: u10 (ref), p1 (upval), UserInputService (upval)
            local v1 = u10
            if not v1 then
                return
            end
            local current = p1.stationRootRef.current
            local MouseLocation = UserInputService:GetMouseLocation()
            if current then
                p1.setDragGhost({x = MouseLocation.X - current.AbsolutePosition.X, y = MouseLocation.Y - current.AbsolutePosition.Y, placed = v1})
                return
            end
            p1.setDragGhost({x = 0, y = 0, placed = v1})
        end
        local function startDragFollow() -- Line: 849 -- upvalues: u6 (ref), p1 (upval), syncGhostToMouse (val), u7 (ref), UserInputService (upval)
            if u6 then
                return
            end
            u6 = true
            p1.setScrollClipped(false)
            p1.setCategoryDragActive(true)
            syncGhostToMouse()
            u7 = UserInputService.InputChanged:Connect(function(p1) -- Line: 858 -- upvalues: syncGhostToMouse (upval)
                if p1.UserInputType == Enum.UserInputType.MouseMovement then
                    syncGhostToMouse()
                end
            end)
        end
        local u13 = nil
        u13 = UserInputService.InputChanged:Connect(function(a1) -- Line: 866 -- upvalues: guiMouseVector (upval), u6 (ref), u5 (val), pickAvailableSourceItem (upval), p1 (upval), u13 (ref), u9 (ref), u10 (ref), networkItemToPlaced (upval), startDragFollow (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseMovement or u6 or 8 >= (guiMouseVector() - u5).Magnitude then
                return
            end
            local v1 = pickAvailableSourceItem(p1.row, p1.gridUsage)
            if not v1 then
                u13:Disconnect()
                return
            end
            u9 = v1
            u10 = networkItemToPlaced(v1)
            u13:Disconnect()
            startDragFollow()
        end)
    end, {
        p1.row,
        p1.gridUsage,
        p1.onFinishRowGridDrag,
        p1.onSelectInventoryRow,
        p1.setScrollClipped,
        p1.setCategoryDragActive,
        p1.stationRootRef,
        p1.setDragGhost,
    })
    local v4 = {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        ZIndex = 1,
        Size = UDim2.new(1, 0, 0, p1.rowHeight),
        Position = UDim2.fromOffset(0, v1),
        AnchorPoint = Vector2.new(0, 0),
    }
    local v5 = {Item = react.createElement(CraftingItem, {
        TotalItems = 1,
        RowGap = 0,
        Filtered = false,
        DragDisabled = true,
        Item = p1.row,
        ItemId = p1.rowIndex,
        Order = v3,
        RowHeight = p1.rowHeight,
        Native = {ZIndex = 1, Size = UDim2.fromScale(1, 1), Position = UDim2.new(0, 0, 0, 0)},
        OnImmediateIndexChange = function() end,
    })}
    local v6 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        TextTransparency = 1,
        ZIndex = 10,
        AutoButtonColor = false,
    }
    v6[react.Event.MouseButton1Down] = function(p1) -- Line: 954 -- upvalues: u23 (val)
        u23(p1)
    end
    v5.DragHitbox = react.createElement("TextButton", v6)
    return react.createElement("Frame", v4, v5)
end
local function CraftingCategoryScroll(p1) -- Line: 961 -- upvalues: useRem (val), react (val), CraftingCategoryRow (val), Accordion (val)
    local u30, v1
    local v2 = useRem()
    local v3 = v2(200)
    local u10 = p1.rowHeight + p1.rowGap
    local v4 = #p1.rows * u10 + v2(4)
    local v5 = math.max(v4, u10 + v2(4))
    v4 = math.min(v5, v3)
    v1, u30 = react.useState(true)
    local v6 = react.useMemo(function() -- Line: 984 -- upvalues: p1 (val), react (upval), CraftingCategoryRow (upval), u10 (val), u30 (val)
        local v1 = {}
        for i, v in ipairs(p1.rows) do
            v1["Row_" .. i] = react.createElement(CraftingCategoryRow, {
                key = p1.category .. "_" .. tostring(i),
                row = v,
                rowIndex = i,
                cellStride = u10,
                rowHeight = p1.rowHeight,
                category = p1.category,
                gridUsage = p1.gridUsage,
                onSelectInventoryRow = p1.onSelectInventoryRow,
                onFinishRowGridDrag = p1.onFinishRowGridDrag,
                setScrollClipped = u30,
                setCategoryDragActive = p1.setCategoryDragActive,
                stationRootRef = p1.stationRootRef,
                setDragGhost = p1.setDragGhost,
            })
        end
        return v1
    end, {
        p1.rows,
        p1.rowHeight,
        p1.rowGap,
        u10,
        p1.category,
        p1.gridUsage,
        p1.onSelectInventoryRow,
        p1.onFinishRowGridDrag,
        u30,
        p1.setCategoryDragActive,
        p1.stationRootRef,
        p1.setDragGhost,
    })
    return react.createElement(Accordion.AccordionItem, {Padding = "Small", LayoutGap = 4, Header = p1.category, LayoutOrder = p1.layoutOrder}, {Scroll = react.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Color3.fromRGB(120, 120, 130),
        Size = UDim2.new(1, 0, 0, v4),
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        CanvasSize = UDim2.fromOffset(0, v5),
        ClipsDescendants = v1,
    }, v6)})
end
local function CraftingSlot(p1) -- Line: 1063 -- upvalues: useTheme (val), useConstants (val), ClientInventoryHandler (val), tagsNumsToStrings (val), react (val), Frame (val), Color (val), ItemViewport (val)
    local v1, v2
    local v3 = useTheme()
    local v4 = useConstants()
    local placedItem = p1.placedItem
    if not placedItem then
        v2 = nil
    else
        v2 = ClientInventoryHandler.getItemModelFromName(placedItem.modelName)
    end
    local u16 = placedItem
    if u16 then
        u16 = tagsNumsToStrings(placedItem.tags)
    end
    local createElement = react.createElement
    local v5 = {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = v3.PageTransparency,
        BackgroundColor3 = v3.PageBackground,
        LayoutOrder = p1.LayoutOrder,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromOffset(0, 0),
        Reference = function(a1) -- Line: 1084 -- upvalues: p1 (val)
            if not a1 then
                p1.registerSlotFrame(p1.slotIndex, nil)
            elseif not (a1:IsA("Frame")) then
                p1.registerSlotFrame(p1.slotIndex, nil)
            else
                p1.registerSlotFrame(p1.slotIndex, a1)
            end
            return nil
        end,
    }
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4.Padding.Sizes.Small)})}
    local createElement_2 = react.createElement
    local v7 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.95, 0.95),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color.Darken(v3.PageBackground, 0.8),
    }
    local v8 = {}
    local v9 = {CornerRadius = UDim.new(0, v4.Padding.Sizes.Small - 1)}
    v8.Corner = react.createElement("UICorner", v9)
    if not v2 then
        v1 = nil
    elseif placedItem then
        local createElement_3 = react.createElement
        v9 = {Spins = false, Background = true, Model = v2}
        local v10 = {
            ZIndex = 2,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.88, 0.88),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        v9.Native = v10
        v9.BackgroundColor3 = Color.Darken(v3.PageBackground, 0.92)
        if not u16 then
            v10 = nil
        elseif 0 < #u16 then
            function v10(p1) -- Line: 1121 -- upvalues: ClientInventoryHandler (upval), u16 (val)
                ClientInventoryHandler.onRenderItemModel({tags = u16}, p1)
            end
        end
        v9.Render = v10
        v1 = createElement_3(ItemViewport, v9)
    end
    v8.Viewport = v1
    if not placedItem then
        v1 = nil
    else
        v9 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Text = "",
            TextTransparency = 1,
            ZIndex = 8,
            AutoButtonColor = false,
        }
        v9[react.Event.MouseButton1Down] = function(a1) -- Line: 1135 -- upvalues: placedItem (val), p1 (val)
            if placedItem then
                p1.onOccupiedSlotPointerDown(a1, p1.slotIndex, placedItem)
            end
        end
        v1 = react.createElement("TextButton", v9)
        if not v1 then
            v1 = nil
        end
    end
    v8.OccupiedHitbox = v1
    v6.Inner = createElement_2("Frame", v7, v8)
    return createElement(Frame, v5, v6)
end
local function CraftingGrid(p1) -- Line: 1145 -- upvalues: react (val), CraftingSlot (val)
    local gridSize, gridSize_2, u10, u5, v1, v2, v3, v4, v5
    v1, u5 = react.useState(0)
    v5, u10 = react.useState(0)
    local v6 = 1 - (p1.gridSize - 1) * 0.007
    local v7 = v6 / p1.gridSize
    v6 = react.useCallback(function(a1) -- Line: 1156 -- upvalues: p1 (val), u10 (val), u5 (val)
        local X = a1.AbsoluteSize.X
        local Y = a1.AbsoluteSize.Y
        if X < 2 or Y < 2 then
            return
        end
        local v1 = math.min(X, Y)
        local gridSize = p1.gridSize
        local v2 = math.max(1, (math.floor(v1 * 0.007 + 0.5)))
        local v3 = math.max(1, (math.floor((v1 - v2 * (gridSize - 1)) / gridSize + 0.5)))
        u10(v2)
        u5(v3)
    end, {p1.gridSize})
    local v8 = {}
    local createElement = react.createElement
    local v9 = {}
    if 0 >= v5 then
        v2 = UDim2.fromScale(0.007, 0.007)
    elseif 0 < v1 then
        v2 = UDim2.fromOffset(v5, v5)
    end
    v9.CellPadding = v2
    if 0 >= v1 then
        v2 = UDim2.fromScale(v7, v7)
    else
        v2 = UDim2.fromOffset(v1, v1)
    end
    v9.CellSize = v2
    v9.FillDirection = Enum.FillDirection.Horizontal
    v9.FillDirectionMaxCells = p1.gridSize
    v9.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v9.VerticalAlignment = Enum.VerticalAlignment.Center
    v9.SortOrder = Enum.SortOrder.LayoutOrder
    v8.Layout = createElement("UIGridLayout", v9)
    gridSize = p1.gridSize
    local v10 = 1
    local u126 = p1
    for i = 1, gridSize, v10 do
        gridSize_2 = u126.gridSize
        v3 = 1
        for j = 1, gridSize_2, v3 do
            v4 = (i - 1) * u126.gridSize + j
            v8["Slot_" .. v4] = react.createElement(CraftingSlot, {
                LayoutOrder = v4,
                slotIndex = v4,
                placedItem = u126.gridPlacements[v4],
                registerSlotFrame = u126.registerSlotFrame,
                onOccupiedSlotPointerDown = u126.onOccupiedSlotPointerDown,
            })
        end
    end
    v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}
    v9[react.Change.AbsoluteSize] = v6
    return react.createElement("Frame", v9, v8)
end
local function CraftingStationLeftPanel(p1) -- Line: 1205 -- upvalues: useTheme (val), useConstants (val), react (val), Color (val), CraftingGrid (val)
    local v1 = useTheme()
    local v2 = useConstants()
    return react.createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 1, Size = UDim2.fromScale(0.95, 0.8)}, {TopInset = react.createElement("UIPadding", {PaddingTop = UDim.new(0, 40)}), SquareCard = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.96, 1),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        BackgroundColor3 = v1.PageBackground,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v2.Padding.Sizes.Large)}), Inner = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.98, 0.98),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color.Darken(v1.PageBackground, 0.8),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v2.Padding.Sizes.Medium)}), Grid = react.createElement(CraftingGrid, {gridSize = p1.gridSize, gridPlacements = p1.gridPlacements, registerSlotFrame = p1.registerSlotFrame, onOccupiedSlotPointerDown = p1.onOccupiedSlotPointerDown})})})})
end
local function cloneGridPlacements(p1) -- Line: 1259
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
return function(p1) -- Line: 1267 -- upvalues: useRem (val), useTheme (val), useConstants (val), useTextScale (val), react (val), Network (val), Inventory (val), Players (val), placedRowKey (val), resolveRecipeFromGrid (val), inventoryRowKey (val), placementBudget (val), networkItemToPlaced (val), pointInFrameGui (val), guiMouseVector (val), UserInputService (val), buildRowsFromInventory (val), sortCategoryNames (val), CraftingCategoryScroll (val), ClientInventoryHandler (val), tagsNumsToStrings (val), Frame (val), ItemViewport (val), Color (val), CraftingStationLeftPanel (val), u373 (val), formatCraftingGridDebug (val), HttpService (val), cloneGridPlacements (val), TextInput (val), Accordion (val)
    local placed, u18, u19, u25, u26, u48, u73, u74, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useRem()
    local v10 = useTheme()
    local v11 = useConstants()
    local v12 = useTextScale()
    local v13 = v9(70)
    local v14 = v9(4)
    u18, u19 = react.useState("")
    local u21 = p1.gridSize or 5
    u25, u26 = react.useState({})
    local u30 = react.useRef({})
    local u34 = react.useRef(nil)
    local u38 = react.useRef(nil)
    v1, v2 = react.useState(false)
    v3, u48 = react.useState(nil)
    local v15 = react.useCallback(function(p1, p2) -- Line: 1288 -- upvalues: u30 (val)
        u30.current[p1] = p2
    end, {})
    react.useEffect(function() -- Line: 1292 -- upvalues: u26 (val), u21 (val)
        u26(function(p1) -- Line: 1293 -- upvalues: u21 (upval)
            local v1 = {}
            for k, v in pairs(p1) do
                if 1 <= k and k <= u21 * u21 then
                    v1[k] = v
                end
            end
            return v1
        end)
    end, {u21})
    local u63 = react.useRef(nil)
    react.useEffect(function() -- Line: 1306 -- upvalues: u63 (val), p1 (val), u26 (val)
        u63.current = p1.Enabled
        if p1.Enabled == true and u63.current == false then
            u26({})
        end
    end, {p1.Enabled})
    u73, u74 = react.useState(nil)
    react.useEffect(function() -- Line: 1317 -- upvalues: p1 (val), u74 (val), Network (upval), Inventory (upval), Players (upval)
        if not p1.MenuVisible then
            u74(nil)
            return
        end
        local u5 = false
        local u6 = nil
        Network.loaded:andThen(function() -- Line: 1326 -- upvalues: u5 (ref), u74 (upval), Inventory (upval), Players (upval), u6 (ref)
            if u5 then
                return
            end
            u74(Inventory.Store.get(Players.LocalPlayer))
            u6 = Inventory.Store.observe(Players.LocalPlayer, function() -- Line: 1331 -- upvalues: u5 (upval), u74 (upval), Inventory (upval), Players (upval)
                if u5 then
                    return
                end
                u74(Inventory.Store.get(Players.LocalPlayer))
            end)
        end)
        return function() -- Line: 1339 -- upvalues: u5 (ref), u6 (ref)
            u5 = true
            if u6 then
                u6()
            end
        end
    end, {p1.MenuVisible})
    local u86 = react.useMemo(function() -- Line: 1349 -- upvalues: u73 (val)
        if not u73 then
            return {}
        end
        local v1 = u73
        if type(v1) ~= "table" then
            return {}
        end
        if v1.value == nil then
            return v1
        end
        if type(v1.value) == "table" then
            return v1.value
        end
        return v1
    end, {u73})
    local u92 = react.useMemo(function() -- Line: 1363 -- upvalues: u25 (val), placedRowKey (upval)
        local v1
        local v2 = {}
        for k, v in pairs(u25) do
            if v then
                v1 = placedRowKey(v)
                v2[v1] = (v2[v1] or 0) + 1
            end
        end
        return v2
    end, {u25})
    local u100 = react.useMemo(function() -- Line: 1374 -- upvalues: p1 (val), resolveRecipeFromGrid (upval), u25 (val), u21 (val)
        if not p1.Recipes or not p1.Recipes.index then
            return nil
        end
        return resolveRecipeFromGrid(u25, p1.Recipes.index, u21)
    end, {u25, p1.Recipes, u21})
    local u106 = react.useCallback(function(p1, p2) -- Line: 1381 -- upvalues: inventoryRowKey (upval), placementBudget (upval), networkItemToPlaced (upval), u21 (val), u30 (val), pointInFrameGui (upval), u26 (val), placedRowKey (upval)
        local v1
        local u42 = inventoryRowKey(p1)
        local u43 = placementBudget(p1)
        local u44 = networkItemToPlaced(p1)
        local v2 = u21 * u21
        local v3 = 1
        local v4 = p2
        for i = 1, v2, v3 do
            v1 = u30.current[i]
            if v1 and pointInFrameGui(v4, v1) then
                u26(function(p1) -- Line: 1389 -- upvalues: placedRowKey (upval), u42 (val), u43 (val), i (val), u44 (val)
                    local v1
                    local v2 = 0
                    for k, v in pairs(p1) do
                        if v then
                            v1 = placedRowKey(v)
                            if v1 == u42 then
                                v2 = v2 + 1
                            end
                        end
                    end
                    if u43 <= v2 then
                        return p1
                    end
                    local v3 = table.clone(p1)
                    v3[i] = u44
                    return v3
                end)
                return
            end
        end
    end, {u21})
    local v16 = react.useCallback(function(p1, p2) -- Line: 1408 -- upvalues: u106 (val)
        u106(p1, p2)
    end, {u106})
    local v17 = react.useCallback(function(p1) end, {})
    local v18 = react.useCallback(function(p1, p2, p3) -- Line: 1415 -- upvalues: u21 (val), u30 (val), pointInFrameGui (upval), guiMouseVector (upval), UserInputService (upval), u26 (val), u38 (val), u48 (val), u34 (val)
        local function slotUnderPoint(p1) -- Line: 1416 -- upvalues: u21 (upval), u30 (upval), pointInFrameGui (upval)
            local v1
            local v2 = u21 * u21
            local v3 = 1
            local v4 = p1
            for i = 1, v2, v3 do
                v1 = u30.current[i]
                if v1 and pointInFrameGui(v4, v1) then
                    return i
                end
            end
            return nil
        end
        local u5 = guiMouseVector()
        local u6 = false
        local u8 = nil
        local u15 = UserInputService.InputChanged:Connect(function(p1) -- Line: 1432 -- upvalues: guiMouseVector (upval), u6 (ref), u5 (val), u26 (upval), p2 (val), u38 (upval), UserInputService (upval), u48 (upval), p3 (val)
            if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
                return
            end
            if not u6 and 8 < (guiMouseVector() - u5).Magnitude then
                u6 = true
                u26(function(p1) -- Line: 1439 -- upvalues: p2 (upval)
                    local v1 = table.clone(p1)
                    v1[p2] = nil
                    return v1
                end)
                local current_2 = u38.current
                if not current_2 then
                    u48({x = 0, y = 0, placed = p3})
                else
                    local MouseLocation_2 = UserInputService:GetMouseLocation()
                    u48({x = MouseLocation_2.X - current_2.AbsolutePosition.X, y = MouseLocation_2.Y - current_2.AbsolutePosition.Y, placed = p3})
                end
            end
            if u6 then
                local current = u38.current
                if current then
                    local MouseLocation = UserInputService:GetMouseLocation()
                    u48(function(p1) -- Line: 1460 -- upvalues: p3 (upval), MouseLocation (val), current (val)
                        local placed
                        placed = if p1 then p1.placed else p3
                        return {x = MouseLocation.X - current.AbsolutePosition.X, y = MouseLocation.Y - current.AbsolutePosition.Y, placed = placed}
                    end)
                end
            end
        end)
    end, {u21})
    local u131 = react.useMemo(function() -- Line: 1525 -- upvalues: buildRowsFromInventory (upval), u86 (val), u18 (val), u92 (val)
        return buildRowsFromInventory(u86, u18, u92)
    end, {u86, u18, u92})
    local v19 = react.useMemo(function() -- Line: 1529 -- upvalues: u131 (val), sortCategoryNames (upval)
        local v1 = {}
        for k, v in pairs(u131) do
            if 0 < #v then
                table.insert(v1, k)
            end
        end
        table.sort(v1, sortCategoryNames)
        return v1
    end, {u131})
    local v20 = {}
    for i, v in ipairs(v19) do
        v4 = u131[v]
        if v4 and 0 < #v4 then
            v20["Category_" .. v] = react.createElement(CraftingCategoryScroll, {
                category = v,
                layoutOrder = i,
                rows = v4,
                rowHeight = v13,
                rowGap = v14,
                gridUsage = u92,
                onSelectInventoryRow = v17,
                onFinishRowGridDrag = v16,
                setCategoryDragActive = v2,
                stationRootRef = u38,
                setDragGhost = u48,
            })
        end
    end
    local v21 = v9(96)
    local v22 = nil
    if v3 then
        placed = v3.placed
        local v23 = ClientInventoryHandler.getItemModelFromName(placed.modelName)
        local u164 = tagsNumsToStrings(placed.tags)
        local createElement = react.createElement
        local v24 = {
            BackgroundTransparency = 0.35,
            ZIndex = 500,
            BorderSizePixel = 0,
            Size = UDim2.fromOffset(v21, v21),
            Position = UDim2.fromOffset(v3.x, v3.y),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v10.PageBackground,
        }
        local v25 = {}
        local v26 = {CornerRadius = UDim.new(0, v11.Padding.Sizes.Small)}
        v25.Corner = react.createElement("UICorner", v26)
        if not v23 then
            v6 = nil
        else
            local createElement_2 = react.createElement
            v26 = {Spins = false, Background = true, Model = v23}
            v7 = {
                ZIndex = 2,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.88, 0.88),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
            }
            v26.Native = v7
            v26.BackgroundColor3 = Color.Darken(v10.PageBackground, 0.92)
            if 0 >= #u164 then
                v7 = nil
            else
                function v7(p1) -- Line: 1589 -- upvalues: ClientInventoryHandler (upval), u164 (val)
                    ClientInventoryHandler.onRenderItemModel({tags = u164}, p1)
                end
            end
            v26.Render = v7
            v6 = createElement_2(ItemViewport, v26)
        end
        v25.Viewport = v6
        v22 = createElement(Frame, v24, v25)
    end
    local v27 = {}
    local createElement_3 = react.createElement
    v4 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.25, 0.018), Size = UDim2.fromScale(0.5, 0.88)}
    if not v1 then
        v5 = 2
    else
        v5 = 1
    end
    v4.ZIndex = v5
    v5 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v9(1)),
    }), Panel = react.createElement(CraftingStationLeftPanel, {gridSize = u21, gridPlacements = u25, registerSlotFrame = v15, onOccupiedSlotPointerDown = v18})}
    local createElement_4 = react.createElement
    v6 = {LayoutOrder = 2, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v28 = {RowLayout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
    })}
    local createElement_5 = react.createElement
    local v29 = {LayoutOrder = 1}
    local v30 = UDim2.fromScale(0.26, 0)
    v29.Size = v30 + UDim2.fromOffset(0, v9(28))
    if not u100 then
        v8 = Color.Darken(v10.Secondary, 0.5)
    else
        v8 = Color.Darken(v10.Secondary, 0.72)
    end
    v29.BackgroundColor3 = v8
    v29.Text = "Craft"
    if not u100 then
        v8 = 0.45
    else
        v8 = 0
    end
    v29.TextTransparency = v8
    v29.TextColor3 = v10.Primary
    v8 = u100 ~= nil
    v29.AutoButtonColor = v8
    v29.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v29.TextSize = v12(v11.TextSize.Body * 0.92)
    v29.BorderSizePixel = 0
    v29[react.Event.Activated] = function() -- Line: 1650 -- upvalues: u100 (val), u373 (upval), u21 (val), formatCraftingGridDebug (upval), u25 (val), HttpService (upval), p1 (val), cloneGridPlacements (upval)
        if u100 then
            if u373 then
                local v1 = tostring(u21)
                local v2 = tostring(u21)
                print("[Crafting] grid " .. v1 .. "x" .. v2 .. ":\n" .. formatCraftingGridDebug(u25, u21))
                local v3 = HttpService:JSONEncode(u100)
                print("[Crafting] Craft clicked — recipe:", v3)
            end
            p1.onCraftRecipe(u100, cloneGridPlacements(u25))
        end
    end
    v28.CraftBar = createElement_5("TextButton", v29, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})
    v5.CraftBarRow = createElement_4("Frame", v6, v28)
    v27.Left = createElement_3("Frame", v4, v5)
    v4 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.5, 0.88), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.725, 0.018)}
    if not v1 then
        v5 = 1
    else
        v5 = 30
    end
    v4.ZIndex = v5
    v5 = {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), VerticalAlignment = Enum.VerticalAlignment.Top}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12), PaddingTop = UDim.new(0, 0), PaddingBottom = UDim.new(0, 8)})}
    v6 = {
        Placeholder = "Search",
        Outlined = false,
        Width = "None",
        Height = 36,
        LayoutOrder = 1,
        Changed = function(p1) -- Line: 1703 -- upvalues: u19 (val)
            u19(p1)
        end,
    }
    v28 = {BackgroundTransparency = 1}
    v7 = UDim2.fromScale(1, 0)
    v28.Size = v7 + UDim2.fromOffset(0, 36)
    v6.Native = v28
    v5.Search = react.createElement(TextInput, v6)
    v5.Categories = react.createElement(Frame, {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0.8, -40),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromOffset(0, 0),
        Reference = function(p1) -- Line: 1726 -- upvalues: u34 (val)
            if not p1 then
                u34.current = nil
            elseif not (p1:IsA("Frame")) then
                u34.current = nil
            else
                u34.current = p1
            end
            return nil
        end,
    }, {Accordion = react.createElement(Accordion.Accordion, {
        Header = "Categories",
        FillHeight = true,
        Native = {Size = UDim2.fromScale(1, 1)},
    }, v20)})
    v27.Right = react.createElement("Frame", v4, v5)
    if v22 then
        v27.RecipeDragGhost = v22
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        Visible = p1.Enabled,
        Size = UDim2.fromScale(1, 1),
        ref = function(p1) -- Line: 1755 -- upvalues: u38 (val)
            if not p1 then
                u38.current = nil
            elseif not (p1:IsA("Frame")) then
                u38.current = nil
            else
                u38.current = p1
            end
            return nil
        end,
    }, v27)
end