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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Overlays.Hotbar
--                               Dumped in 0.0149 seconds
--                          Bytecode version 9  |  73 functions

local Item, oxygen
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Gear = require(Namespaces_2:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_3 = Common_3:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Inventory = require(Namespaces_3:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_4 = Common_4:WaitForChild("Network")
local Namespaces_4 = Network_4:WaitForChild("Namespaces")
local Proficiencies = require(Namespaces_4:WaitForChild("Proficiencies"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Backpack = require(Utilities:WaitForChild("Backpack"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Constants = require(Common_6:WaitForChild("Constants"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_7:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Signals = require(Common_7:WaitForChild("Signals"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_2 = Common_8:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_3 = Common_9:WaitForChild("Utilities")
_, _, _, oxygen = require(Utilities_3:WaitForChild("State"))("oxygen")
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Inventory_2 = require(Common_10:WaitForChild("Logger"))("Inventory")
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useKeyPress = require(Hooks_2:WaitForChild("useKeyPress"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local Hooks_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_6:WaitForChild("useTextScale"))
local Hooks_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_7:WaitForChild("useToast"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_12:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_13:WaitForChild("Client")
local Progression = Client_2:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_14:WaitForChild("Client")
local Progression_2 = Client_3:WaitForChild("Progression")
local Enchantments_2 = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_15:WaitForChild("Client")
local User_2 = Client_4:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_16:WaitForChild("Client")
local User_3 = Client_5:WaitForChild("User")
local State = User_3:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_17:WaitForChild("Client")
local User_4 = Client_6:WaitForChild("User")
local State_2 = User_4:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local Categories = ClientStateHandler.Categories
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_18:WaitForChild("Common")
local Utilities_4 = Common_11:WaitForChild("Utilities")
local QuickAccessItems = require(Utilities_4:WaitForChild("QuickAccessItems"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_19:WaitForChild("Common")
local Animations = Common_12:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_20:WaitForChild("Common")
local Observers = Common_13:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_21:WaitForChild("Common")
local Network_5 = Common_14:WaitForChild("Network")
local Namespaces_5 = Network_5:WaitForChild("Namespaces")
local Vitality = require(Namespaces_5:WaitForChild("Vitality"))
local Backpack_2 = Constants.Backpack
local HotbarSlots = Backpack_2.HotbarSlots
local u588 = math.max(1, (math.ceil(Backpack_2.Rows * 0.9)))
local function getBackpackMetrics(p1, p2, p3) -- Line: 100
    return {step = p1 + p2, panelBottomOffset = p1 / 2 + p3}
end
local function getGuiMousePosition() -- Line: 113 -- upvalues: GuiService (val), UserInputService (val)
    local GuiInset = GuiService:GetGuiInset()
    local MouseLocation = UserInputService:GetMouseLocation()
    return Vector2.new(MouseLocation.X - GuiInset.X, MouseLocation.Y - GuiInset.Y)
end
local function getHotbarZoneTop(p1, p2, p3) -- Line: 127
    return p1.AbsolutePosition.Y + p1.AbsoluteSize.Y - p2(p3)
end
local function isMouseInHotbarDropZone(p1, p2, p3, p4, p5) -- Line: 140 -- upvalues: getHotbarZoneTop (val)
    local v1 = getHotbarZoneTop(p2, p3, p4)
    local v2 = if v1 - p3(p5) <= p1.Y then if p2.AbsolutePosition.X <= p1.X then p1.X <= p2.AbsolutePosition.X + p2.AbsoluteSize.X else false else false
    return v2
end
local function getHotbarSlotPosition(p1, p2, p3, p4) -- Line: 162 -- upvalues: Backpack_2 (val)
    local v1 = p2((p1 - 1 - (Backpack_2.Columns - 1) / 2) * (p3 + p4))
    return UDim2.new(0.5, v1, 1, 0)
end
local function getBackpackRowCount(p1) -- Line: 180 -- upvalues: u588 (val), Backpack_2 (val)
    local v1
    if p1 ~= 0 then
        v1 = math.max(1, (math.ceil(p1 / Backpack_2.Columns)))
    else
        v1 = u588
    end
    return (math.max(u588, v1))
end
local function getBackpackGridHeight(p1, p2, p3, p4) -- Line: 196
    return p1((p3 - 1) * p2.step + p4)
end
local function getBackpackGridHeightLogical(p1, p2, p3) -- Line: 212
    return (p1 - 1) * p2 + p3
end
local function getBackpackSearchBottomOffset(p1, p2, p3, p4) -- Line: 224 -- upvalues: getBackpackGridHeightLogical (val)
    return p1.panelBottomOffset + getBackpackGridHeightLogical(p2, p3, p4) + 0
end
local function getBackpackStackHeight(p1, p2, p3, p4) -- Line: 241 -- upvalues: getBackpackGridHeight (val)
    local v1 = getBackpackGridHeight(p1, p2, p3, p4)
    local v2 = v1 + p1(0)
    return v2 + p1(40)
end
local function getBackpackVisualPosition(p1, p2, p3, p4, p5, p6) -- Line: 261 -- upvalues: Backpack (val), Backpack_2 (val)
    local v1 = Backpack.packedIndexToBackpackGrid(p1)
    local v2 = p4.panelBottomOffset + ((p5 - 1) * p4.step + p6) - (v1.row * p4.step + p6 / 2)
    local v3 = p2((v1.col - (Backpack_2.Columns - 1) / 2) * p3)
    return UDim2.new(0.5, v3, 1, -p2(v2))
end
local function getSlotScreenCenter(p1, p2) -- Line: 283
    local AbsolutePosition = p2.AbsolutePosition
    local AbsoluteSize = p2.AbsoluteSize
    return Vector2.new(AbsolutePosition.X + AbsoluteSize.X * p1.X.Scale + p1.X.Offset, AbsolutePosition.Y + AbsoluteSize.Y * p1.Y.Scale + p1.Y.Offset)
end
local function getSlotContent(p1, p2, p3, p4) -- Line: 301 -- upvalues: Table (val)
    local v1, v2, v3, v4, v5
    local v6 = Table.find(p2, function(a1) -- Line: 311 -- upvalues: p1 (val)
        local v1 = a1.hotbar == p1
        return v1
    end)
    local v7 = Table.find(p3, function(a1) -- Line: 314 -- upvalues: p1 (val)
        local v1 = a1.hotbar == p1
        return v1
    end)
    local v8 = Table.find(p4, function(a1) -- Line: 317 -- upvalues: p1 (val)
        local v1 = a1.hotbar == p1
        return v1
    end)
    if not v6 then
        v3 = nil
    else
        v3 = p2[v6]
    end
    if not v7 then
        v4 = nil
    else
        v4 = p3[v7]
    end
    if not v8 then
        v5 = nil
    else
        v5 = p4[v8]
    end
    if v3 then
        v1 = nil
    else
        v1 = v4
    end
    if v3 then
        v2 = nil
    elseif v1 then
        v2 = nil
    else
        v2 = v5
        if not v2 then
            v2 = nil
        end
    end
    return v3, v1, v2
end
local function collectBackpackEntries(p1, p2, p3) -- Line: 339 -- upvalues: Backpack (val)
    local v1 = {}
    for k, v in pairs(p1) do
        if Backpack.isBackpackSlot(v.hotbar) then
            table.insert(v1, {slot = v.hotbar, item = v})
        end
    end
    for k2, i in pairs(p2) do
        if Backpack.isBackpackSlot(i.hotbar) then
            table.insert(v1, {slot = i.hotbar, enchantment = i})
        end
    end
    for k3, j in pairs(p3) do
        if Backpack.isBackpackSlot(j.hotbar) then
            table.insert(v1, {slot = j.hotbar, proficiency = j})
        end
    end
    table.sort(v1, function(p1, p2) -- Line: 370
        local v1 = p1.slot < p2.slot
        return v1
    end)
    return v1
end
local function containsBackpackSearchTerm(p1, p2) -- Line: 383
    if p2 == "" then
        return true
    end
    if not p1 or p1 == "" then
        return false
    end
    local v1 = string.lower(p1)
    local v2 = string.find(v1, p2, 1, true) ~= nil
    return v2
end
local function getBackpackEntrySearchLabel(p1) -- Line: 400 -- upvalues: ClientInventoryHandler (val), ClientEnchantmentsHandler (val)
    local Name
    if p1.item then
        return ClientInventoryHandler.getItemNameFromHash(p1.item.id) or ""
    end
    if not p1.enchantment then
        if p1.proficiency then
            return (("%* %*"):format(p1.proficiency.name, p1.proficiency.node))
        end
        return ""
    end
    local v1 = ClientEnchantmentsHandler.getEnchantmentFromHash(p1.enchantment.hash)
    if not v1 then
        Name = ""
    else
        Name = v1.Name
        if not Name then
            Name = ""
        end
    end
    return Name
end
local function backpackEntryMatchesSearch(p1, p2) -- Line: 423 -- upvalues: getBackpackEntrySearchLabel (val), containsBackpackSearchTerm (val)
    if p2 == "" then
        return true
    end
    local v1 = getBackpackEntrySearchLabel(p1)
    if containsBackpackSearchTerm(v1, p2) then
        return true
    end
    if not p1.proficiency then
        return false
    end
    local v2 = containsBackpackSearchTerm(p1.proficiency.name, p2)
    if not v2 then
        v2 = containsBackpackSearchTerm(p1.proficiency.node, p2)
    end
    return v2
end
local function snapshotQuickAccessState(p1, p2, p3) -- Line: 448
    local v1 = {}
    for i, v in ipairs(p1) do
        v1[i] = table.clone(v)
    end
    local v2 = {}
    for i2, i3 in ipairs(p2) do
        v2[i2] = table.clone(i3)
    end
    local v3 = {}
    for i4, j in ipairs(p3) do
        v3[i4] = table.clone(j)
    end
    return v1, v2, v3
end
local function inventoryQuickAccessMatches(p1, p2) -- Line: 483 -- upvalues: Table (val)
    local v1, v2
    if #p1 ~= #p2 then
        return false
    end
    local v3 = p2
    for i, v in ipairs(p1) do
        v1 = Table.find(v3, function(p1) -- Line: 489 -- upvalues: v (val)
            local v1 = if p1.id == v.id then p1.offset == v.offset else false
            return v1
        end)
        if not v1 then
            v2 = nil
        else
            v2 = v3[v1]
        end
        if v2 and v2.hotbar == v.hotbar then
            continue
        end
        return false
    end
    return true
end
local function enchantmentQuickAccessMatches(p1, p2) -- Line: 507 -- upvalues: Table (val)
    local v1, v2
    if #p1 ~= #p2 then
        return false
    end
    local v3 = p2
    for i, v in ipairs(p1) do
        v1 = Table.find(v3, function(p1) -- Line: 516 -- upvalues: v (val)
            local v1 = p1.hash == v.hash
            return v1
        end)
        if not v1 then
            v2 = nil
        else
            v2 = v3[v1]
        end
        if v2 and v2.hotbar == v.hotbar then
            continue
        end
        return false
    end
    return true
end
local function proficiencyQuickAccessMatches(p1, p2) -- Line: 534 -- upvalues: Table (val)
    local v1, v2
    if #p1 ~= #p2 then
        return false
    end
    local v3 = p2
    for i, v in ipairs(p1) do
        v1 = Table.find(v3, function(p1) -- Line: 543 -- upvalues: v (val)
            local v1 = if p1.name == v.name then p1.node == v.node else false
            return v1
        end)
        if not v1 then
            v2 = nil
        else
            v2 = v3[v1]
        end
        if v2 and v2.hotbar == v.hotbar then
            continue
        end
        return false
    end
    return true
end
local function getClosestHotbarSlotToMouse(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 567 -- upvalues: HotbarSlots (val), getHotbarSlotPosition (val), getSlotScreenCenter (val)
    local Magnitude, v1, v2, v3, v4, v5, v6
    local v7 = nil
    local huge = math.huge
    local v8 = p8
    if not v8 then
        v8 = p3(p4 + p5)
    end
    local v9 = HotbarSlots
    local v10 = 1
    v5, v2, v3, v4, v6 = p6, p3, p4, p5, p7
    for i = 1, v9, v10 do
        if not v5 then
            v1 = v6
            if v1 then
                v1 = v6[i]
            end
        else
            v1 = getHotbarSlotPosition(i, v2, v3, v4)
        end
        if v1 then
            Magnitude = (v11 - getSlotScreenCenter(v1, v12)).Magnitude
            if Magnitude < huge and Magnitude <= v8 then
                v7 = i
                huge = Magnitude
            end
        end
    end
    return v7
end
local function getBackpackEntrySlotUnderMouse(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) -- Line: 615 -- upvalues: collectBackpackEntries (val), backpackEntryMatchesSearch (val), getBackpackVisualPosition (val), getSlotScreenCenter (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = collectBackpackEntries(p3, p4, p5)
    local v11 = p6(p10 / 2)
    local v12 = p12 or ""
    v3, v5, v6, v7, v8, v9, v2, v1 = p11, p6, p7, p8, p9, p10, p2, p1
    for i, v in ipairs(v10) do
        if v3 and v.slot == v3 then
            continue
        end
        if backpackEntryMatchesSearch(v, v12) then
            v4 = getBackpackVisualPosition(i - 1, v5, v6, v7, v8, v9)
            if (v1 - getSlotScreenCenter(v4, v2)).Magnitude <= v11 then
                return v.slot
            end
        end
    end
    return nil
end
local function isMouseOverBackpackBackground(p1, p2, p3, p4, p5, p6) -- Line: 661 -- upvalues: getBackpackGridHeight (val)
    local AbsolutePosition = p2.AbsolutePosition
    local AbsoluteSize = p2.AbsoluteSize
    local v1 = AbsolutePosition.Y + AbsoluteSize.Y - p3(p5.panelBottomOffset)
    local v2 = v1 - getBackpackGridHeight(p3, p5, p6, p4)
    local v3 = if AbsolutePosition.X <= p1.X then if p1.X <= AbsolutePosition.X + AbsoluteSize.X then if v2 <= p1.Y then p1.Y < v1 else false else false else false
    return v3
end
local function resolveDropSlot(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) -- Line: 698 -- upvalues: Backpack (val), getBackpackRowCount (val), getBackpackMetrics (val), isMouseInHotbarDropZone (val), isMouseOverBackpackBackground (val), getBackpackEntrySlotUnderMouse (val), getClosestHotbarSlotToMouse (val), HotbarSlots (val)
    local v1
    local v2 = Backpack.countBackpackEntries(p3, p4, p5)
    local v3 = getBackpackRowCount(v2)
    local v4 = Backpack.getNextBackpackSlot(p3, p4, p5)
    local v5 = getBackpackMetrics(p7, p8, p9)
    local v6 = p11 or p10
    local v7 = isMouseInHotbarDropZone(p1, p2, p6, p7, p9)
    local v8 = string.lower(p14 or "")
    local v9 = p10
    if v9 then
        v9 = isMouseOverBackpackBackground(p1, p2, p6, p7, v5, v3)
    end
    if v9 then
        v1 = getBackpackEntrySlotUnderMouse(p1, p2, p3, p4, p5, p6, p7 + p8, v5, v3, p7, p13, v8)
        if v1 then
            return v1
        end
        return v4
    end
    if not v7 then
        if not v6 then
            if not p10 then
                v1 = getClosestHotbarSlotToMouse(p1, p2, p6, p7, p8, false, p12)
                if v1 then
                    return v1
                end
                return nil
            end
            return nil
        end
        v1 = getClosestHotbarSlotToMouse(p1, p2, p6, p7, p8, v6, p12)
        if v1 then
            return v1
        end
        if p10 then
            return nil
        end
        v1 = getClosestHotbarSlotToMouse(p1, p2, p6, p7, p8, false, p12)
        if v1 then
            return v1
        end
        return nil
    else
        v1 = getClosestHotbarSlotToMouse(p1, p2, p6, p7, p8, v6, p12, p6((p7 + p8) * HotbarSlots))
        if v1 then
            return v1
        end
    end
end
local u614 = {
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Zero,
}
function Item(p1) -- Line: 806 -- upvalues: useRem (val), useTextScale (val), useToast (val), useMotion (val), HotbarSlots (val), u614 (val), useKeyPress (val), react (val), CharacterRagdollHandler (val), ClientStateHandler (val), Gear (val), Players (val), oxygen (val), Categories (val), ClientAttributesHandler (val), ClientInventoryHandler (val), QuickAccessItems (val), Vitality (val), Default (val), useAnimatorObserver (val), Inventory_2 (val), Inventory (val), ClientEnchantmentsHandler (val), Signals (val)
    local End, hotbar, u10, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useTextScale()
    local u6 = useToast()
    v4, u10 = useMotion(0.95)
    if p1.Item then
        hotbar = p1.Item.hotbar
    elseif p1.Enchantment then
        hotbar = p1.Enchantment.hotbar
    elseif not p1.Proficiency then
        hotbar = -1
    else
        hotbar = p1.Proficiency.hotbar
    end
    if 0 >= hotbar then
        End = Enum.KeyCode.End
    elseif hotbar <= HotbarSlots then
        End = u614[hotbar]
    end
    local u32 = useKeyPress(End)
    local v7 = {u32}
    react.useEffect(function() -- Line: 828 -- upvalues: u32 (val), End (val), CharacterRagdollHandler (upval), p1 (val), u6 (val), ClientStateHandler (upval), Gear (upval), Players (upval), oxygen (upval), Categories (upval), ClientAttributesHandler (upval), ClientInventoryHandler (upval), QuickAccessItems (upval), Vitality (upval), Default (upval), useAnimatorObserver (upval), Inventory_2 (upval), Inventory (upval), ClientEnchantmentsHandler (upval), Signals (upval)
        if not u32 then
            return
        else
            if End == Enum.KeyCode.End then
                return
            end
            if not (CharacterRagdollHandler.isRagdolled()) then
                if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.MOUNTED)) then
                    if not (ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_TOOL_EQUIPPING)) then
                        if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.NO_ITEM_EQUIPPING)) then
                            local v1 = Gear.Gear.get(Players.LocalPlayer)
                            local v2 = ClientStateHandler.isStateBusy(ClientStateHandler.States.HANDLES)
                            if not v1 then
                                if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.GRAPPLING)) then
                                    local v3 = oxygen()
                                    local v4 = v3
                                    if v4 then
                                        v4 = v3.inWater == true
                                    end
                                    if not v4 then
                                        local Item, v5, v6
                                        if not (ClientStateHandler.isCategoryBusy(Categories.STRICT)) then
                                            local v7, v8, v9
                                            if not p1.Item then
                                                if p1.Enchantment then
                                                    v5 = ClientEnchantmentsHandler.getEnchantmentFromHash(p1.Enchantment.hash)
                                                    if not v5 then
                                                        return u6({message = "Enchantment not found.", type = "error"})
                                                    end
                                                    Signals.ActivateEnchantment:Fire(v5.Name)
                                                    return
                                                end
                                                if p1.Proficiency then
                                                    Signals.ActivateProficiency:Fire({name = p1.Proficiency.name, node = p1.Proficiency.node})
                                                end
                                                return
                                            end
                                            if not p1.Item then
                                                return u6({message = "This item is not available.", type = "error"})
                                            end
                                            v5 = ClientInventoryHandler.getItemNameFromHash(p1.Item.id)
                                            if not v5 then
                                                return
                                            end
                                            local LocalPlayer = Players.LocalPlayer
                                            if not LocalPlayer then
                                                return
                                            end
                                            v6 = Vitality.Store.get(LocalPlayer)
                                            if not v6 or v6.dead == 1 or v6.knocked == 1 then
                                                return
                                            end
                                            ClientStateHandler.updateState(ClientStateHandler.States.EQUIPPING, true)
                                            local v10 = ClientInventoryHandler.getItemDataFromName(v5)
                                            if not v10 then
                                                return u6({message = "Item data not found.", type = "error"})
                                            end
                                            if not p1.Equipped then
                                                local equip = v10.equip
                                                if not equip then
                                                    if not v10.isBackItem then
                                                        equip = Default.BackPocketGrab
                                                    else
                                                        equip = Default.OverTheShoulderGrab
                                                    end
                                                end
                                                v9 = equip
                                            else
                                                local unequip = v10.unequip
                                                if not unequip then
                                                    if not v10.isBackItem then
                                                        unequip = Default.BackPocketGrab
                                                    else
                                                        unequip = Default.OverTheShoulderGrab
                                                    end
                                                end
                                                v9 = unequip
                                            end
                                            local v11 = useAnimatorObserver.play(v9)
                                            if not v11 then
                                                return
                                            end
                                            local v12 = ClientAttributesHandler.getAttribute("EquipItemSpeedMultiplier") or 1
                                            local v13 = math.max(v12, 0.05)
                                            v11:AdjustSpeed(v13)
                                            if not p1.Equipped then
                                                v8 = "Equip"
                                            else
                                                v8 = "Unequip"
                                            end
                                            v12, v7 = pcall(v11.GetTimeOfKeyframe, v11, v8)
                                            local v14 = useAnimatorObserver.getAnimationLength(v11) / v13
                                            if not v12 then
                                                v7 = v14 / 2
                                            elseif v7 then
                                                v7 = v7 / v13
                                            else
                                                v7 = v14 / 2
                                            end
                                            local u236 = ClientInventoryHandler.getItemNameFromHash(p1.Item.id) or "Unknown"
                                            Inventory_2.info(string.format("Attempting to equip item %s", u236))
                                            task.delay(v7, function() -- Line: 977 -- upvalues: Inventory_2 (upval), u236 (val), Inventory (upval), p1 (upval)
                                                Inventory_2.info(string.format("Invoking equip for item %s", u236))
                                                Inventory.Equip.post({hash = p1.Item.id, offset = p1.Item.offset})
                                            end)
                                            task.delay(v14, function() -- Line: 983 -- upvalues: ClientStateHandler (upval)
                                                ClientStateHandler.updateState(ClientStateHandler.States.EQUIPPING, false)
                                            end)
                                            return
                                        elseif not p1.Enchantment and not p1.Proficiency and not p1.Equipped then
                                            v5 = ClientAttributesHandler.getAttribute("HasQuickAccess") == 1
                                            Item = p1.Item
                                            if Item then
                                                Item = ClientInventoryHandler.getItemNameFromHash(p1.Item.id)
                                            end
                                            v6 = Item
                                            if v6 then
                                                v6 = QuickAccessItems[Item]
                                            end
                                            if not v5 then
                                                return u6({message = "You cannot use a tool with your handles out.", type = "error"})
                                            elseif not v6 then
                                                return u6({message = "You cannot use a tool with your handles out.", type = "error"})
                                            end
                                        end
                                    elseif not p1.Enchantment and not p1.Proficiency then
                                        return u6({message = "You cannot equip a tool while in water.", type = "error"})
                                    end
                                elseif not p1.Enchantment and not p1.Proficiency then
                                    return u6({message = "You cannot equip a tool while grappling", type = "error"})
                                end
                            elseif v1.blades == 1 and v2 and not p1.Enchantment and not p1.Proficiency then
                                return u6({message = "You cannot equip a tool with your blades drawn.", type = "error"})
                            end
                        elseif not p1.Enchantment and not p1.Proficiency then
                            return u6({message = "You cannot unequip or equip an item at this time.", type = "error"})
                        end
                    elseif not p1.Enchantment and not p1.Proficiency then
                        return u6({message = "You cannot equip a tool at this time.", type = "error"})
                    end
                elseif not p1.Enchantment and not p1.Proficiency then
                    return u6({message = "You cannot use a tool while mounted.", type = "error"})
                end
            elseif not p1.Enchantment and not p1.Proficiency then
                return u6({message = "You cannot use a tool while ragdolled.", type = "error"})
            end
        end
    end, v7)
    react.useEffect(function() -- Line: 1002 -- upvalues: u10 (val), p1 (val)
        local v1
        if not p1.Equipped then
            v1 = 0.95
        else
            v1 = 1.05
        end
        u10:spring(v1, {frequency = 0.3})
    end, {p1.Equipped})
    local node = ""
    if p1.Item then
        node = ClientInventoryHandler.getItemNameFromHash(p1.Item.id) or ""
    elseif p1.Enchantment then
        local Name
        v1 = ClientEnchantmentsHandler.getEnchantmentFromHash(p1.Enchantment.hash)
        if not v1 then
            Name = ""
        else
            Name = v1.Name
        end
        node = Name
    elseif p1.Proficiency then
        node = p1.Proficiency.node
    end
    local createElement = react.createElement
    local Fragment = react.Fragment
    v2 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v5(3))}), Scale = react.createElement("UIScale", {Scale = v4})}
    local v8 = {
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextSize = v6(15),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0.8, 0, 1, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Text = node or "",
    }
    v2.Item = react.createElement("TextLabel", v8)
    if p1.Index > HotbarSlots then
        v3 = nil
    else
        local v9
        v8 = {
            TextWrapped = true,
            BackgroundTransparency = 1,
            TextTransparency = 0.5,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextSize = v6(15),
            AnchorPoint = Vector2.new(0.5, 0),
        }
        local v10 = v5(5)
        v8.Position = UDim2.new(0.5, v10, 0, v5(5))
        v8.Size = UDim2.new(1, 0, 0, 0)
        v8.TextColor3 = Color3.fromRGB(255, 255, 255)
        if p1.Index ~= 10 then
            v9 = tostring(p1.Index)
        else
            v9 = "0"
        end
        v8.Text = v9
        v3 = react.createElement("TextLabel", v8)
        if not v3 then
            v3 = nil
        end
    end
    v2.Slot = v3
    return createElement(Fragment, {}, v2)
end
return function() -- Line: 1076 -- upvalues: useRem (val), useTextScale (val), useInterfaceState (val), react (val), useStore (val), Inventory (val), Table (val), Enchantments (val), Proficiencies (val), inventoryQuickAccessMatches (val), enchantmentQuickAccessMatches (val), proficiencyQuickAccessMatches (val), ClientSettingsHandler (val), getBackpackMetrics (val), Backpack (val), HotbarSlots (val), getSlotContent (val), collectBackpackEntries (val), getGuiMousePosition (val), UserInputService (val), resolveDropSlot (val), ClientEnchantmentsHandler (val), Frame (val), Item (val), snapshotQuickAccessState (val), getBackpackRowCount (val), getBackpackGridHeight (val), Backpack_2 (val), getBackpackSearchBottomOffset (val), backpackEntryMatchesSearch (val), getBackpackVisualPosition (val), getHotbarSlotPosition (val), getBackpackStackHeight (val)
    local current, enchantments, hotbar, hotbar_2, item, items, proficiencies, u1006, u123, u20, u21, u26, u36, u369, u41, u426, u435, u444, u453, u46, u462, u471, u518, u527, u536, u545, u571, u737, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local u895 = useRem()
    local v14 = useTextScale()
    _, hotbar_2 = useInterfaceState("hotbar")
    local v15 = hotbar_2
    if not v15 then
        v15 = {visible = true}
    end
    local v16 = v15
    u369, u462 = react.useState(false)
    u20, u21 = react.useState(false)
    u1006, u26 = react.useState(false)
    v1, u737 = react.useState("")
    local v17 = {}
    v2, u36 = react.useState(v17)
    local v18 = {}
    v3, u41 = react.useState(v18)
    v4, u46 = react.useState({})
    u426, u518 = react.useState(nil)
    u435, u527 = react.useState(nil)
    u444, u536 = react.useState(nil)
    u453, u545 = react.useState(nil)
    u571, u471 = react.useState(nil)
    local u480 = react.useRef(nil)
    local u509 = react.useRef("")
    local u498 = react.useRef({hotbar = {}, enchantments = {}, proficiencies = {}})
    local function syncQuickAccessState(p1, p2, p3, p4) -- Line: 1112 -- upvalues: u498 (val), u36 (val), u41 (val), u46 (val), u21 (val)
        u498.current = {hotbar = p1, enchantments = p2, proficiencies = p3}
        u36(p1)
        u41(p2)
        u46(p3)
        if p4 then
            u21(true)
        end
    end
    local u92 = useStore(Inventory.Store, function(p1) -- Line: 1131 -- upvalues: Table (upval)
        if not p1 then
            return {}
        end
        return Table.filter(p1, function(p1) -- Line: 1136
            local v1 = -1 < p1.hotbar
            return v1
        end)
    end)
    local u97 = useStore(Enchantments.Store, function(p1) -- Line: 1141 -- upvalues: Table (upval)
        if not p1 then
            return {}
        end
        return Table.filter(p1, function(p1) -- Line: 1146
            local v1 = -1 < p1.hotbar
            return v1
        end)
    end)
    local u102 = useStore(Proficiencies.Store, function(p1) -- Line: 1150
        local hotbars
        if not p1 then
            return {}
        end
        local v1 = {}
        for k, v in pairs(p1) do
            hotbars = v.hotbars
            if not hotbars then
                hotbars = {}
            end
            for k2, i in pairs(hotbars) do
                if type(i) == "number" and -1 < i then
                    table.insert(v1, {name = v.name, node = k2, hotbar = i})
                end
            end
        end
        return v1
    end)
    local u589 = useStore(Inventory.Tool, function(p1) -- Line: 1172
        return p1
    end)
    local u114 = react.useRef({items = {}, enchantments = {}, proficiencies = {}})
    local v19 = react.useRef(false)
    _, u123 = react.useState(0)
    if not v19.current then
        v19.current = true
        u114.current = {items = u92, enchantments = u97, proficiencies = u102}
    end
    react.useEffect(function() -- Line: 1193 -- upvalues: u92 (val), u97 (val), u102 (val), u369 (val), u20 (val), u114 (val), u123 (val)
        local u0 = {items = u92, enchantments = u97, proficiencies = u102}
        if u369 or u20 then
            u114.current = u0
            u123(function(p1) -- Line: 1202
                return p1 + 1
            end)
            return
        end
        local u6 = false
        task.defer(function() -- Line: 1209 -- upvalues: u6 (ref), u114 (upval), u0 (val), u123 (upval)
            task.wait()
            if u6 then
                return
            end
            u114.current = u0
            u123(function(p1) -- Line: 1216
                return p1 + 1
            end)
        end)
        return function() -- Line: 1221 -- upvalues: u6 (ref)
            u6 = true
        end
    end, {
        u92,
        u97,
        u102,
        u369,
        u20,
    })
    react.useEffect(function() -- Line: 1230 -- upvalues: u20 (val), u369 (val), u498 (val), inventoryQuickAccessMatches (upval), u92 (val), enchantmentQuickAccessMatches (upval), u97 (val), proficiencyQuickAccessMatches (upval), u102 (val), u21 (val), u114 (val), u123 (val), syncQuickAccessState (val)
        if not u20 or u369 then
            return
        end
        local u2 = false
        task.defer(function() -- Line: 1236 -- upvalues: u2 (ref), u498 (upval), inventoryQuickAccessMatches (upval), u92 (upval), enchantmentQuickAccessMatches (upval), u97 (upval), proficiencyQuickAccessMatches (upval), u102 (upval), u21 (upval), u114 (upval), u123 (upval), syncQuickAccessState (upval)
            local v1, v2
            task.wait()
            if u2 then
                return
            end
            local current = u498.current
            if not (inventoryQuickAccessMatches(current.hotbar, u92)) or not (enchantmentQuickAccessMatches(current.enchantments, u97)) then
                v1 = #current.hotbar + #current.enchantments + #current.proficiencies
                v2 = #u92 + #u97
                if v1 ~= v2 + #u102 then
                    u114.current = {items = u92, enchantments = u97, proficiencies = u102}
                    u123(function(p1) -- Line: 1261
                        return p1 + 1
                    end)
                    syncQuickAccessState(u92, u97, u102)
                    u21(false)
                end
                return
            end
            if proficiencyQuickAccessMatches(current.proficiencies, u102) then
                u21(false)
                return
            end
            v1 = #current.hotbar + #current.enchantments + #current.proficiencies
            v2 = #u92 + #u97
            if v1 ~= v2 + #u102 then
                u114.current = {items = u92, enchantments = u97, proficiencies = u102}
                u123(function(p1) -- Line: 1261
                    return p1 + 1
                end)
                syncQuickAccessState(u92, u97, u102)
                u21(false)
            end
        end)
        return function() -- Line: 1269 -- upvalues: u2 (ref)
            u2 = true
        end
    end, {
        u92,
        u97,
        u102,
        u20,
        u369,
    })
    react.useEffect(function() -- Line: 1274 -- upvalues: ClientSettingsHandler (upval), u26 (val)
        local u7 = ClientSettingsHandler.onKeybindPressed("Toggle Backpack"):Connect(function() -- Line: 1275 -- upvalues: u26 (upval)
            u26(function(p1) -- Line: 1276
                return not p1
            end)
        end)
        return function() -- Line: 1281 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {})
    react.useEffect(function() -- Line: 1286 -- upvalues: u1006 (val), u737 (val)
        if u1006 then
            return
        end
        u737("")
    end, {u1006})
    local v20 = u369 or u20
    current = u114.current
    if not v20 then
        items = current.items
    else
        items = v2
    end
    if not v20 then
        enchantments = current.enchantments
    else
        enchantments = v3
    end
    if not v20 then
        proficiencies = current.proficiencies
    else
        proficiencies = v4
    end
    u509.current = v1
    local v21 = getBackpackMetrics(70, 5, 5)
    local v22 = u1006 or u369
    local u1113 = {}
    local v23 = {}
    for k, v in pairs(items) do
        if Backpack.isHotbarSlot(v.hotbar) then
            v23[v.hotbar] = true
        end
    end
    for k2, i in pairs(enchantments) do
        if Backpack.isHotbarSlot(i.hotbar) then
            v23[i.hotbar] = true
        end
    end
    for k3, j in pairs(proficiencies) do
        if Backpack.isHotbarSlot(j.hotbar) then
            v23[j.hotbar] = true
        end
    end
    local v24 = 0
    for k4 in pairs(v23) do
        v24 = v24 + 1
    end
    local u997 = {}
    local v25 = 0
    local v26 = HotbarSlots
    local v27 = 1
    for k5 = 1, v26, v27 do
        v5, v6, v7 = getSlotContent(k5, items, enchantments, proficiencies)
        v8 = if v5 == nil then if v6 == nil then v7 ~= nil else true else true
        if v8 then
            v9 = v25 + 1
            if not v9 then
                v9 = v25
            end
        elseif not u369 then
        end
        v25 = v9
        if not v22 then
            v9 = v24
        else
            v9 = HotbarSlots
        end
        v12 = -(v9 / 2 - v25 + 0.5) * u895(75)
        u997[k5] = UDim2.new(0.5, v12, 1, 0)
    end
    v26 = collectBackpackEntries(items, enchantments, proficiencies)
    v27 = string.lower(v1)
    v6 = {u426, u435, u444, u453}
    react.useEffect(function() -- Line: 1357 -- upvalues: u426 (val), u435 (val), u444 (val), u453 (val), u462 (val), u471 (val), u480 (val), u1006 (val), Table (upval), Backpack (upval), getGuiMousePosition (upval), UserInputService (upval), u498 (val), resolveDropSlot (upval), u895 (val), u997 (val), u509 (val), u518 (val), u527 (val), u536 (val), u545 (val), syncQuickAccessState (val), Inventory (upval), ClientEnchantmentsHandler (upval), Enchantments (upval), Proficiencies (upval)
        if not u426 then
            u462(false)
            u471(nil)
            u480.current = nil
            return
        elseif u435 then
            local hotbar
            local u4 = u1006
            local v1 = u426
            local u6 = u435
            local u7 = u444
            local u8 = u453
            if u6 then
                hotbar = u6.hotbar
            elseif u7 then
                hotbar = u7.hotbar
            elseif not u8 then
                hotbar = -1
            else
                hotbar = u8.hotbar
            end
            if not u480.current then
                return
            end
            local function optimisticSwapAtSlot(p1, p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 1381 -- upvalues: Table (upval), Backpack (upval)
                local u4, u5, v1, v2, v3, v4, v5, v6, v7
                local v8 = {}
                for i, v in ipairs(p7) do
                    v8[i] = table.clone(v)
                end
                local v9 = {}
                for i2, i3 in ipairs(p8) do
                    v9[i2] = table.clone(i3)
                end
                local v10 = {}
                for i4, j in ipairs(p9) do
                    v10[i4] = table.clone(j)
                end
                local v11 = nil
                v1, v5, v7, u4, u5, v2 = p1, p3, p4, p5, p6, p2
                for i5, k in ipairs(v8) do
                    if k.hotbar == v1 then
                        v3 = if v5 == "item" then if v7 ~= nil then i5 == v7 else false else false
                        if not v3 then
                            v11 = i5
                            break
                        end
                    end
                end
                local v12 = nil
                for i6, n in ipairs(v9) do
                    if n.hotbar == v1 then
                        v4 = if v5 == "ench" then if u4 ~= nil then n.hash == u4 else false else false
                        if not v4 then
                            v12 = i6
                            break
                        end
                    end
                end
                local v13 = nil
                for i7, m in ipairs(v10) do
                    if m.hotbar == v1 then
                        v6 = if v5 == "prof" then if u5 ~= nil then if m.name == u5.name then m.node == u5.node else false else false else false
                        if not v6 then
                            v13 = i7
                            break
                        end
                    end
                end
                if v11 then
                    v8[v11].hotbar = v2
                end
                if v12 then
                    v9[v12].hotbar = v2
                end
                if v13 then
                    v10[v13].hotbar = v2
                end
                if v5 ~= "item" then
                    local v14
                    if v5 ~= "ench" then
                        if v5 == "prof" and u5 then
                            v14 = Table.find(v10, function(p1) -- Line: 1469 -- upvalues: u5 (val)
                                local v1 = if p1.name == u5.name then p1.node == u5.node else false
                                return v1
                            end)
                            if v14 then
                                v10[v14].hotbar = v1
                            end
                        end
                    elseif u4 then
                        v14 = Table.find(v9, function(p1) -- Line: 1462 -- upvalues: u4 (val)
                            local v1 = p1.hash == u4
                            return v1
                        end)
                        if v14 then
                            v9[v14].hotbar = v1
                        end
                    elseif v5 == "prof" and u5 then
                        v14 = Table.find(v10, function(p1) -- Line: 1469 -- upvalues: u5 (val)
                            local v1 = if p1.name == u5.name then p1.node == u5.node else false
                            return v1
                        end)
                        if v14 then
                            v10[v14].hotbar = v1
                        end
                    end
                elseif v7 then
                    v8[v7].hotbar = v1
                end
                Backpack.packBackpackSlots(v8, v9, v10)
                return v8, v9, v10
            end
            local v2 = getGuiMousePosition()
            local Parent = v1.Parent
            while Parent do
                if Parent.Name == "QuickAccessContainer" then
                    break
                end
                Parent = Parent.Parent
            end
            if not Parent then
                Parent = v1.Parent
            end
            local u41 = v2 - (v1.AbsolutePosition + v1.AbsoluteSize / 2)
            local function mouseToDragPosition(p1) -- Line: 1493 -- upvalues: Parent (ref), u41 (val)
                local AbsolutePosition = Parent.AbsolutePosition
                return UDim2.fromOffset(p1.X - u41.X - AbsolutePosition.X, p1.Y - u41.Y - AbsolutePosition.Y)
            end
            u462(true)
            u471((mouseToDragPosition(v2)))
            local u53 = nil
            local u54 = false
            local u61 = UserInputService.InputChanged:Connect(function(p1) -- Line: 1507 -- upvalues: u471 (upval), mouseToDragPosition (val), getGuiMousePosition (upval)
                if p1.UserInputType == Enum.UserInputType.MouseMovement then
                    u471((mouseToDragPosition(getGuiMousePosition())))
                end
            end)
            u53 = UserInputService.InputEnded:Connect(function(p1) -- Line: 1513 -- upvalues: u54 (ref), u61 (ref), u53 (ref), u498 (upval), resolveDropSlot (upval), getGuiMousePosition (upval), Parent (ref), u895 (upval), u4 (val), u997 (upval), hotbar (val), u509 (upval), u471 (upval), u480 (upval), u462 (upval), u518 (upval), u527 (upval), u536 (upval), u545 (upval), u6 (val), Table (upval), optimisticSwapAtSlot (val), syncQuickAccessState (upval), Inventory (upval), u7 (val), ClientEnchantmentsHandler (upval), Enchantments (upval), u8 (val), Proficiencies (upval)
                local v1, v2, v3, v4
                if p1.UserInputType ~= Enum.UserInputType.MouseButton1 or u54 then
                    return
                end
                u54 = true
                u61:Disconnect()
                u53:Disconnect()
                local current = u498.current
                local v5 = getGuiMousePosition()
                local v6 = Parent
                local hotbar_2 = current.hotbar
                local enchantments = current.enchantments
                local proficiencies = current.proficiencies
                if 0 >= hotbar then
                    v1 = nil
                else
                    v1 = hotbar
                end
                local v7 = resolveDropSlot(v5, v6, hotbar_2, enchantments, proficiencies, u895, 70, 5, 5, u4, u4, u997, v1, u509.current)
                u471(nil)
                u480.current = nil
                u462(false)
                u518(nil)
                u527(nil)
                u536(nil)
                u545(nil)
                if not v7 or v7 == hotbar then
                    return
                end
                if not u6 then
                    v5 = nil
                else
                    v5 = Table.find(current.hotbar, function(p1) -- Line: 1553 -- upvalues: u6 (upval)
                        local v1 = if p1.id == u6.id then p1.offset == u6.offset else false
                        return v1
                    end)
                end
                if not v5 then
                    if u7 then
                        v6 = ClientEnchantmentsHandler.getEnchantmentFromHash(u7.hash)
                        if not v6 or not v6.Name then
                            return
                        end
                        v2, v3, v4 = optimisticSwapAtSlot(v7, u7.hotbar, "ench", nil, u7.hash, nil, current.hotbar, current.enchantments, current.proficiencies)
                        syncQuickAccessState(v2, v3, v4, true)
                        Enchantments.Hotbar.post({added = 2, name = v6.Name, value = v7})
                        return
                    end
                    if u8 then
                        v6, v2, v3 = optimisticSwapAtSlot(v7, u8.hotbar, "prof", nil, nil, {name = u8.name, node = u8.node}, current.hotbar, current.enchantments, current.proficiencies)
                        syncQuickAccessState(v6, v2, v3, true)
                        Proficiencies.Hotbar.post({added = 2, name = u8.name, node = u8.node, value = v7})
                    end
                    return
                end
                if u6 then
                    v6, v2, v3 = optimisticSwapAtSlot(v7, u6.hotbar, "item", v5, nil, nil, current.hotbar, current.enchantments, current.proficiencies)
                    syncQuickAccessState(v6, v2, v3, true)
                    v4 = Table.map(v6, function(p1) -- Line: 1573
                        return {slot = p1.hotbar, hash = p1.id, offset = p1.offset}
                    end)
                    Inventory.Hotbar.post(v4)
                    return
                end
                if not u7 then
                    if u8 then
                        v6, v2, v3 = optimisticSwapAtSlot(v7, u8.hotbar, "prof", nil, nil, {name = u8.name, node = u8.node}, current.hotbar, current.enchantments, current.proficiencies)
                        syncQuickAccessState(v6, v2, v3, true)
                        Proficiencies.Hotbar.post({added = 2, name = u8.name, node = u8.node, value = v7})
                    end
                    return
                end
                v6 = ClientEnchantmentsHandler.getEnchantmentFromHash(u7.hash)
                if not v6 or not v6.Name then
                    return
                end
                v2, v3, v4 = optimisticSwapAtSlot(v7, u7.hotbar, "ench", nil, u7.hash, nil, current.hotbar, current.enchantments, current.proficiencies)
                syncQuickAccessState(v2, v3, v4, true)
                Enchantments.Hotbar.post({added = 2, name = v6.Name, value = v7})
            end)
            return function() -- Line: 1629 -- upvalues: u61 (ref), u53 (ref)
                if u61 then
                    u61:Disconnect()
                end
                if u53 then
                    u53:Disconnect()
                end
            end
        elseif not u444 and not u453 then
            u462(false)
            u471(nil)
            u480.current = nil
            return
        end
    end, v6)
    local function createQuickAccessSlot(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) -- Line: 1644 -- upvalues: u435 (val), u444 (val), u453 (val), u369 (val), u571 (val), u895 (val), u1113 (val), react (upval), Frame (upval), Item (upval), u589 (val), snapshotQuickAccessState (upval), items (val), enchantments (val), proficiencies (val), u480 (val), syncQuickAccessState (val), u518 (val), u527 (val), u536 (val), u545 (val)
        local hotbar, v1, v2, v3, v4
        local v5 = p10 or 70
        if u435 then
            hotbar = u435.hotbar
        elseif u444 then
            hotbar = u444.hotbar
        elseif not u453 then
            hotbar = -1
        else
            hotbar = u453.hotbar
        end
        local v6 = u369
        if v6 then
            v6 = hotbar == p2
        end
        local v7 = v6
        if v7 then
            v7 = u571 ~= nil
        end
        if v7 then
            v2 = u895(v5 + 5)
            v1 = UDim2.new(0, v2, 0, u895(v5 + 5))
        elseif not u369 then
            v2 = u895(v5)
            v1 = UDim2.new(0, v2, 0, u895(v5))
        elseif not p7 then
            v2 = u895(v5 - 10)
            v1 = UDim2.new(0, v2, 0, u895(v5 - 10))
        end
        local v8 = {Size = v1, AnchorPoint = Vector2.new(0.5, 0.5)}
        if not v7 then
            v3 = p3
        else
            v3 = u571
        end
        v8.Position = v3
        if not v7 then
            v3 = 0.45
        else
            v3 = 0.2
        end
        v8.BackgroundTransparency = v3
        v8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v3 = p8
        if v3 then
            v3 = p7
            if not v3 then
                v3 = u369
                if not v3 then
                    v3 = p9 == true
                end
            end
        end
        v8.Visible = v3
        if not v7 then
            v3 = 2
        else
            v3 = 5
        end
        v8.ZIndex = v3
        v3 = {}
        local v9 = {}
        if v7 then
            v4 = p4
        elseif not v6 then
            v4 = p4
        else
            v4 = nil
        end
        v9.Item = v4
        if v7 then
            v4 = p5
        elseif not v6 then
            v4 = p5
        else
            v4 = nil
        end
        v9.Enchantment = v4
        if v7 then
            v4 = p6
        elseif not v6 then
            v4 = p6
        else
            v4 = nil
        end
        v9.Proficiency = v4
        v9.Index = p2
        v4 = u589
        if v4 then
            v4 = p4
            if v4 then
                v4 = if u589.hash == p4.id then u589.offset == p4.offset else false
            end
        end
        v9.Equipped = v4
        v3.Content = react.createElement(Item, v9)
        v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, TextTransparency = 1}
        v9[react.Event.MouseButton1Down] = function(...) -- Line: 1697 -- upvalues: snapshotQuickAccessState (upval), items (upval), enchantments (upval), proficiencies (upval), u480 (upval), syncQuickAccessState (upval), u518 (upval), p4 (val), u527 (upval), u536 (upval), u545 (upval), p5 (val), p6 (val)
            local v1, v2, v3
            v1, v2, v3 = snapshotQuickAccessState(items, enchantments, proficiencies)
            u480.current = {hotbar = v1, enchantments = v2, proficiencies = v3}
            syncQuickAccessState(v1, v2, v3)
            u518(...)
            if p4 then
                u527(p4)
                u536(nil)
                u545(nil)
                return
            end
            if p5 then
                u536(p5)
                u527(nil)
                u545(nil)
                return
            end
            if p6 then
                u545(p6)
                u527(nil)
                u536(nil)
            end
        end
        v3.Button = react.createElement("TextButton", v9)
        u1113[p1] = react.createElement(Frame, v8, v3)
        if v6 and u571 then
            v3 = {BackgroundTransparency = 0.45, ZIndex = 1}
            v9 = u895(v5 - 10)
            v3.Size = UDim2.new(0, v9, 0, u895(v5 - 10))
            v3.AnchorPoint = Vector2.new(0.5, 0.5)
            v3.Position = p3
            v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            u1113[p1 .. "Decoy"] = react.createElement(Frame, v3)
        end
    end
    if u1006 then
        local enchantment, proficiency, v28
        v5 = getBackpackRowCount(#v26)
        v6 = getBackpackGridHeight(u895, v21, v5, 70)
        v7 = u895(Backpack_2.Columns * 75)
        v8 = getBackpackSearchBottomOffset(v21, v5, 75, 70)
        v11 = {
            Name = "BackpackSearch",
            BackgroundTransparency = 1,
            ZIndex = 3,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 0, 1, -u895(v8)),
            Size = UDim2.new(0.3, 0, 0, u895(40)),
            BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        }
        v12 = {TopCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, u895(4))})}
        local v29 = {
            Name = "BackpackSearch",
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            PlaceholderColor3 = Color3.fromRGB(170, 170, 170),
            PlaceholderText = "Search...",
            Text = v1,
            TextColor3 = Color3.fromRGB(245, 245, 245),
            TextSize = v14(14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ClearTextOnFocus = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
        }
        local v30 = -u895(20)
        v29.Size = UDim2.new(1, v30, 1, -u895(14))
        v29.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v29.BackgroundTransparency = 0.25
        v29.BorderSizePixel = 0
        v29.ZIndex = 2
        v29[react.Change.Text] = function(p1) -- Line: 1777 -- upvalues: u737 (val)
            u737(p1.Text)
        end
        local v31 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, u895(4))}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, u895(8)), PaddingRight = UDim.new(0, u895(2)), PaddingTop = UDim.new(0, u895(2)), PaddingBottom = UDim.new(0, u895(2))})}
        local v32 = {Transparency = 0.9, Color = Color3.fromRGB(255, 255, 255), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
        v31.Stroke = react.createElement("UIStroke", v32)
        v12.SearchInput = react.createElement("TextBox", v29, v31)
        u1113.BackpackSearch = react.createElement(Frame, v11, v12)
        v11 = {
            Name = "BackpackBackground",
            BackgroundTransparency = 0.55,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, -u895(v21.panelBottomOffset)),
            Size = UDim2.new(0, v7, 0, v6),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }
        v12 = {}
        v29 = {CornerRadius = UDim.new(0, u895(4))}
        v12.Corner = react.createElement("UICorner", v29)
        u1113.BackpackBackground = react.createElement(Frame, v11, v12)
        for i2, n in ipairs(v26) do
            v13 = backpackEntryMatchesSearch(n, v27)
            v29 = getBackpackVisualPosition(i2 - 1, u895, 75, v21, v5, 70)
            item = n.item
            enchantment = n.enchantment
            proficiency = n.proficiency
            v32 = if item == nil then if enchantment == nil then proficiency ~= nil else true else true
            v28 = "backpack" .. tostring(n.slot)
            createQuickAccessSlot(v28, n.slot, v29, item, enchantment, proficiency, v32, v13, true, nil)
        end
    end
    v5 = HotbarSlots
    v6 = 1
    for m = 1, v5, v6 do
        v8, v9, v10 = getSlotContent(m, items, enchantments, proficiencies)
        v11 = if v8 == nil then if v9 == nil then v10 ~= nil else true else true
        if not v22 then
            v12 = u997[m]
        else
            v12 = getHotbarSlotPosition(m, u895, 70, 5)
        end
        v13 = "hotbar" .. tostring(m)
        createQuickAccessSlot(v13, m, v12, v8, v9, v10, v11, true, v22)
    end
    if not u1006 then
        v5 = u895(70)
    else
        v6 = u895(v21.panelBottomOffset)
        v10 = getBackpackRowCount(#v26)
        v5 = v6 + getBackpackStackHeight(u895, v21, v10, 70)
    end
    if not u1006 then
        v6 = u895(math.max(v24, 1) * 75)
    else
        v6 = u895(Backpack_2.Columns * 75)
    end
    return react.createElement(Frame, {
        Name = "QuickAccessContainer",
        BackgroundTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -u895(60)),
        Size = UDim2.new(0, v6, 0, v5),
        Visible = v16.visible,
    }, {}, u1113)
end