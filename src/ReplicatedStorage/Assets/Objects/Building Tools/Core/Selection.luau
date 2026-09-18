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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Core.Selection
--                               Dumped in 0.00235 seconds
--                          Bytecode version 9  |  31 functions

local GetVisibleChildren
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local History = require(u0.Parent.History)
local Libraries = u0.Parent.Parent:WaitForChild("Libraries")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Signal = require(Libraries:WaitForChild("Signal"))
local Maid = require(Libraries:WaitForChild("Maid"))
local Make = require(Libraries:WaitForChild("Make"))
local InstancePool = require(Libraries:WaitForChild("InstancePool"))
Selection = {}
Selection.Items = {}
Selection.ItemIndex = {}
Selection.Parts = {}
Selection.PartIndex = {}
Selection.Models = {}
Selection.ModelIndex = {}
Selection.Outlines = {}
Selection.Color = BrickColor.new("Cyan")
Selection.Multiselecting = false
Selection.Maid = Maid.new()
Selection.ItemsAdded = Signal.new()
Selection.ItemsRemoved = Signal.new()
Selection.PartsAdded = Signal.new()
Selection.PartsRemoved = Signal.new()
Selection.FocusChanged = Signal.new()
Selection.Cleared = Signal.new()
Selection.Changed = Signal.new()
function Selection.IsSelected(p1) -- Line: 41
    return Selection.ItemIndex[p1]
end
local function CollectPartsAndModels(p1, p2, p3) -- Line: 50
    if p1:IsA("BasePart") then
        table.insert(p2, p1)
        return
    end
    if p1:IsA("Model") then
        table.insert(p3, p1)
    end
    local Descendants = p1:GetDescendants()
    for i, v in ipairs(Descendants) do
        if v:IsA("BasePart") then
            table.insert(p2, v)
        elseif v:IsA("Model") then
            table.insert(p3, v)
        end
    end
end
function Selection.Add(p1, p2) -- Line: 75 -- upvalues: Maid (val), CollectPartsAndModels (val), SupportLibrary (val)
    local v1, v2, v3
    GetCore()
    local v4 = {}
    for k, v in pairs(p1) do
        if v.Parent and not (Selection.ItemIndex[v]) then
            table.insert(v4, v)
        end
    end
    local Items = Selection.Items
    local v5 = {}
    local v6 = {}
    local v7 = p2
    for k2, i in pairs(v4) do
        Selection.ItemIndex[i] = true
        CreateSelectionBoxes(i)
        v1 = Maid.new()
        Selection.Maid[i] = v1
        v1.RemovalListener = i.AncestryChanged:Connect(function(p1, p2) -- Line: 110 -- upvalues: i (val)
            if p2 == nil then
                Selection.Remove({i})
            end
        end)
        CollectPartsAndModels(i, v5, v6)
        v2 = not i:IsA("BasePart") or nil
        v3 = v2
        if v3 then
            v3 = i.DescendantAdded:Connect(function(p1) -- Line: 121 -- upvalues: SupportLibrary (upval)
                if not (p1:IsA("PVInstance")) then
                    return
                end
                if not (p1:IsA("BasePart")) then
                    if p1:IsA("Model") then
                        Selection.ModelIndex[p1] = (Selection.ModelIndex[p1] or 0) + 1
                        Selection.Models = SupportLibrary.Keys(Selection.ModelIndex)
                    end
                    return
                end
                local v1 = (Selection.PartIndex[p1] or 0) + 1
                Selection.PartIndex[p1] = v1
                Selection.Parts = SupportLibrary.Keys(Selection.PartIndex)
                if v1 ~= 1 then
                    return
                end
                Selection.PartsAdded:Fire({p1})
            end)
        end
        v1.NewPartsOrModels = v3
        v3 = v2
        if v3 then
            v3 = i.DescendantRemoving:Connect(function(p1) -- Line: 137 -- upvalues: SupportLibrary (upval)
                local PartIndex, v1, v2
                if not (Selection.PartIndex[p1]) then
                    local ModelIndex
                    if Selection.ModelIndex[p1] then
                        v1 = (Selection.ModelIndex[p1] or 0) - 1
                        ModelIndex = Selection.ModelIndex
                        if 0 >= v1 then
                            v2 = nil
                        else
                            v2 = v1
                            if not v2 then
                                v2 = nil
                            end
                        end
                        ModelIndex[p1] = v2
                        if v1 == 0 then
                            Selection.Models = SupportLibrary.Keys(Selection.ModelIndex)
                        end
                    end
                    return
                end
                v1 = (Selection.PartIndex[p1] or 0) - 1
                PartIndex = Selection.PartIndex
                if 0 >= v1 then
                    v2 = nil
                else
                    v2 = v1
                    if not v2 then
                        v2 = nil
                    end
                end
                PartIndex[p1] = v2
                if v1 ~= 0 then
                    return
                end
                Selection.Parts = SupportLibrary.Keys(Selection.PartIndex)
                Selection.PartsRemoved:Fire({p1})
            end)
        end
        v1.RemovingPartsOrModels = v3
    end
    Selection.Items = SupportLibrary.Keys(Selection.ItemIndex)
    if v7 and 0 < #v4 then
        TrackSelectionChange(Items)
    end
    local v8 = {}
    for k3, j in pairs(v5) do
        v2 = (Selection.PartIndex[j] or 0) + 1
        Selection.PartIndex[j] = v2
        if v2 == 1 then
            table.insert(v8, j)
        end
    end
    local v9 = 0
    for i2, k4 in ipairs(v6) do
        v3 = (Selection.ModelIndex[k4] or 0) + 1
        Selection.ModelIndex[k4] = v3
        if v3 == 1 then
            v9 = v9 + 1
        end
    end
    if 0 < #v8 then
        Selection.Parts = SupportLibrary.Keys(Selection.PartIndex)
        Selection.PartsAdded:Fire(v8)
    end
    if 0 < v9 then
        Selection.Models = SupportLibrary.Keys(Selection.ModelIndex)
    end
    if 0 < #v4 then
        Selection.ItemsAdded:Fire(v4)
        Selection.Changed:Fire()
    end
end
function Selection.Remove(p1, p2) -- Line: 203 -- upvalues: CollectPartsAndModels (val), SupportLibrary (val)
    local ModelIndex, PartIndex, v1, v2, v3, v4
    local v5 = {}
    for k, v in pairs(p1) do
        if Selection.IsSelected(v) then
            table.insert(v5, v)
        end
    end
    local v6 = {}
    local v7 = {}
    for k2, i in pairs(v5) do
        Selection.ItemIndex[i] = nil
        RemoveSelectionBoxes(i)
        Selection.Maid[i] = nil
        CollectPartsAndModels(i, v6, v7)
    end
    Selection.Items = SupportLibrary.Keys(Selection.ItemIndex)
    if p2 and 0 < #v5 then
        TrackSelectionChange(Selection.Items)
    end
    local v8 = {}
    for k3, j in pairs(v6) do
        v1 = (Selection.PartIndex[j] or 0) - 1
        PartIndex = Selection.PartIndex
        if 0 >= v1 then
            v3 = nil
        else
            v3 = v1
        end
        PartIndex[j] = v3
        if v1 == 0 then
            table.insert(v8, j)
        end
    end
    local v9 = 0
    for i2, k4 in ipairs(v7) do
        v2 = (Selection.ModelIndex[k4] or 0) - 1
        ModelIndex = Selection.ModelIndex
        if 0 >= v2 then
            v4 = nil
        else
            v4 = v2
        end
        ModelIndex[k4] = v4
        if v2 == 0 then
            v9 = v9 + 1
        end
    end
    if 0 < #v8 then
        Selection.Parts = SupportLibrary.Keys(Selection.PartIndex)
        Selection.PartsRemoved:Fire(v8)
    end
    if 0 < v9 then
        Selection.Models = SupportLibrary.Keys(Selection.ModelIndex)
    end
    if 0 < #v5 then
        Selection.ItemsRemoved:Fire(v5)
        Selection.Changed:Fire()
    end
end
function Selection.Clear(p1) -- Line: 285
    Selection.Remove(Selection.Items, p1)
    Selection.Cleared:Fire()
end
function Selection.Replace(p1, p2) -- Line: 296 -- upvalues: SupportLibrary (val)
    local v1 = {}
    for i, v in ipairs(p1) do
        if not (Selection.ItemIndex[v]) then
            table.insert(v1, v)
        end
    end
    local v2 = {}
    local v3 = SupportLibrary.FlipTable(p1)
    for i2, i3 in ipairs(Selection.Items) do
        if not (v3[i3]) then
            table.insert(v2, i3)
        end
    end
    if 0 < #v2 then
        Selection.Remove(v2, false)
    end
    if 0 < #v1 then
        Selection.Add(v1, false)
    end
    if p2 then
        TrackSelectionChange(Selection.Items)
    end
end
local function IsVisible(p1) -- Line: 334
    local v1 = p1:IsA("Model")
    if not v1 then
        v1 = p1:IsA("BasePart")
    end
    return v1
end
local function GetVisibleFocus(p1) -- Line: 338 -- upvalues: IsVisible (val)
    if not p1 then
        return nil
    end
    if IsVisible(p1) then
        return p1
    end
    if not p1 then
        return
    end
    local BasePart = p1:FindFirstChildWhichIsA("BasePart")
    if not BasePart then
        BasePart = p1:FindFirstChildWhichIsA("Model")
        if not BasePart then
            BasePart = p1:FindFirstChildWhichIsA("BasePart", true)
            if not BasePart then
                BasePart = p1:FindFirstChildWhichIsA("Model", true)
            end
        end
    end
    return BasePart
end
function Selection.SetFocus(p1) -- Line: 359 -- upvalues: GetVisibleFocus (val)
    local v1 = GetVisibleFocus(p1)
    if Selection.Focus == v1 then
        return
    end
    Selection.Focus = v1
    Selection.FocusChanged:Fire(v1)
end
function FocusOnLastSelectedPart() -- Line: 376
    if #Selection.Items == 0 then
        Selection.SetFocus(nil)
        return
    end
    Selection.SetFocus(Selection.Items[#Selection.Items])
end
Selection.Changed:Connect(FocusOnLastSelectedPart)
function GetCore() -- Line: 393 -- upvalues: u0 (val)
    return require(u0.Parent)
end
function GetVisibleChildren(p1, p2) -- Line: 398 -- upvalues: IsVisible (val), GetVisibleChildren (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    for k, v in pairs(p1:GetChildren()) do
        if not (IsVisible(v)) then
            GetVisibleChildren(v, v1)
        else
            v1[#v1 + 1] = v
        end
    end
    return v1
end
local u124 = InstancePool.new(60, function() -- Line: 415 -- upvalues: Make (val)
    local SelectionBox = Make("SelectionBox")
    return SelectionBox({
        Name = "BTSelectionBox",
        LineThickness = 0.025,
        Transparency = 0.5,
        Parent = GetCore().UI,
        Color = Selection.Color,
    })
end)
function u124.Cleanup(p1) -- Line: 426
    p1.Adornee = nil
    p1.Visible = nil
end
function CreateSelectionBoxes(p1) -- Line: 431 -- upvalues: SupportLibrary (val), IsVisible (val), GetVisibleChildren (val), u124 (val)
    local v1
    if GetCore().Mode ~= "Tool" or Selection.Outlines[p1] then
        return
    end
    local v2 = if not (IsVisible(p1)) then SupportLibrary.FlipTable(GetVisibleChildren(p1)) else SupportLibrary.FlipTable({p1})
    local v3 = {}
    for k in pairs(v2) do
        v1 = u124:Get()
        v1.Adornee = k
        v1.Visible = true
        v3[k] = v1
    end
    Selection.Outlines[p1] = v3
end
function RemoveSelectionBoxes(p1) -- Line: 469 -- upvalues: u124 (val)
    local v1 = Selection.Outlines[p1]
    if not v1 then
        return
    end
    for k, v in pairs(v1) do
        u124:Release(v)
    end
    Selection.Outlines[p1] = nil
end
function Selection.RecolorOutlines(p1) -- Line: 488 -- upvalues: u124 (val)
    Selection.Color = p1
    for k in pairs(u124.All) do
        k.Color = Selection.Color
    end
end
function Selection.RecolorOutline(p1, p2) -- Line: 501
    local v1 = Selection.Outlines[p1]
    if not v1 then
        return
    end
    for k, v in pairs(v1) do
        v.Color = p2
    end
end
function Selection.FlashOutlines() -- Line: 516 -- upvalues: u124 (val)
    local v1 = 0.5
    local v2 = -0.1
    for i = 1, v1, v2 do
        for k in pairs(u124.InUse) do
            k.Transparency = i
        end
        wait(0.1)
    end
end
function Selection.EnableMultiselectionHotkeys() -- Line: 534 -- upvalues: SupportLibrary (val)
    local u7 = SupportLibrary.FlipTable({"LeftShift", "RightShift", "LeftControl", "RightControl"})
    local v1 = GetCore()
    v1.Connections.MultiselectionHotkeys = SupportLibrary.AddUserInputListener("Began", "Keyboard", false, function(p1) -- Line: 544 -- upvalues: u7 (val)
        if u7[p1.KeyCode.Name] then
            Selection.Multiselecting = true
        end
    end)
    v1.Connections.MultiselectingReleaseHotkeys = SupportLibrary.AddUserInputListener("Ended", "Keyboard", true, function(p1) -- Line: 551 -- upvalues: SupportLibrary (upval), u7 (val)
        local KeysPressed = Game:GetService("UserInputService"):GetKeysPressed()
        local v1 = SupportLibrary.GetListMembers(KeysPressed, "KeyCode")
        local v2 = SupportLibrary.GetListMembers(v1, "Name")
        for k, v in pairs(v2) do
            if u7[v] then
                return
            end
        end
        Selection.Multiselecting = false
    end)
end
function Selection.EnableOutlines() -- Line: 570
    for k in pairs(Selection.ItemIndex) do
        CreateSelectionBoxes(k)
    end
end
function Selection.HideOutlines() -- Line: 579
    for k in pairs(Selection.Outlines) do
        RemoveSelectionBoxes(k)
    end
end
function TrackSelectionChange(p1) -- Line: 588 -- upvalues: History (val)
    if History.Index ~= #History.Stack then
        return
    end
    History.Add({
        Before = p1,
        After = Selection.Items,
        Unapply = function(p1) -- Line: 602
            Selection.Replace(p1.Before)
        end,
        Apply = function(p1) -- Line: 610
            Selection.Replace(p1.After)
        end,
    })
end
return Selection