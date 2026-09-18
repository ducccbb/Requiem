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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Explorer
--                               Dumped in 0.00279 seconds
--                          Bytecode version 9  |  35 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local UI = Parent:WaitForChild("UI")
game:GetService("RunService")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
require(Libraries:WaitForChild("Signal"))
local createElement = Roact.createElement
require(UI:WaitForChild("Frame"))
local ImageLabel = require(UI:WaitForChild("ImageLabel"))
local ImageButton = require(UI:WaitForChild("ImageButton"))
local TextLabel = require(UI:WaitForChild("TextLabel"))
local ItemList = require(v1:WaitForChild("ItemList"))
local v3 = Roact.PureComponent:extend("Explorer")
function v3.init(p1, p2) -- Line: 31
    p1:setState({RowHeight = 18, Items = {}})
    p1.UpdateQueues = {}
    p1.QueueTimers = {}
    p1.LastId = 0
    p1.IdMap = {}
    p1.PendingParent = {}
    function p1.ToggleExpand(a1) -- Line: 47 -- upvalues: p1 (val)
        return p1:setState(function(p1) -- Line: 48 -- upvalues: a1 (val)
            local v1 = p1.Items[a1]
            v1.Expanded = not v1.Expanded
            return {Items = p1.Items}
        end)
    end
end
function v3.didUpdate(p1, p2, p3) -- Line: 56
    if p2.Scope ~= p1.props.Scope then
        p1:UpdateScope(p1.props.Scope)
    end
end
function v3:UpdateScope(p2) -- Line: 65 -- upvalues: Maid (val), Roact (val), SupportLibrary (val)
    local ScopeMaid
    local Core = self.props.Core
    local Selection = Core.Selection
    if self.ScopeMaid then
        self.ScopeMaid:Destroy()
    end
    self.ScopeMaid = Maid.new()
    if not p2 then
        return
    end
    coroutine.resume(coroutine.create(function() -- Line: 83 -- upvalues: self (val), Selection (val), Roact (upval)
        local Focus
        self:UpdateTree()
        local v1 = #Selection.Items
        if 0 >= v1 then
            self:setState({ScrollTo = Roact.None})
            return
        end
        if not (Selection.IsSelected(Selection.Focus)) then
            Focus = Selection.Items[1]
        else
            Focus = Selection.Focus
            if not Focus then
                Focus = Selection.Items[1]
            end
        end
        self:setState({ScrollTo = self.IdMap[Focus]})
    end))
    local Scope = Core.Targeting.Scope
    ScopeMaid = self.ScopeMaid
    ScopeMaid.Add = Scope.DescendantAdded:Connect(function(p1) -- Line: 101 -- upvalues: self (val)
        self:UpdateTree()
    end)
    local ScopeMaid_2 = self.ScopeMaid
    ScopeMaid_2.Remove = Scope.DescendantRemoving:Connect(function(p1) -- Line: 104 -- upvalues: self (val)
        self:UpdateTree()
    end)
    local ScopeMaid_3 = self.ScopeMaid
    ScopeMaid_3.Select = Selection.ItemsAdded:Connect(function(p1) -- Line: 109 -- upvalues: self (val), SupportLibrary (upval)
        self:UpdateSelection(p1)
        local u11 = if #p1 == 1 then self.IdMap[p1[1]] else false
        self:setState(function(p1) -- Line: 116 -- upvalues: u11 (val), self (upval), SupportLibrary (upval)
            local v1 = {}
            local v2 = p1.Items[u11]
            local v3 = v2
            if v3 then
                v3 = self.IdMap[v2.Parent]
            end
            local v4 = v3
            if v4 then
                v4 = p1.Items[v3]
            end
            while v4 do
                v4.Expanded = true
                v1[v3] = v4
                v4 = p1.Items[self.IdMap[v4.Parent]]
            end
            return {Items = SupportLibrary.Merge(p1.Items, v1), ScrollTo = u11}
        end)
    end)
    local ScopeMaid_4 = self.ScopeMaid
    ScopeMaid_4.Deselect = Selection.ItemsRemoved:Connect(function(p1) -- Line: 135 -- upvalues: self (val)
        self:UpdateSelection(p1)
    end)
end
function v3.didMount(p1) -- Line: 141 -- upvalues: Maid (val)
    p1.Mounted = true
    p1.ItemMaid = Maid.new()
    p1:UpdateScope(p1.props.Scope)
end
function v3.willUnmount(p1) -- Line: 151
    p1.Mounted = false
    p1.ScopeMaid:Destroy()
    p1.ItemMaid:Destroy()
end
local function IsTargetable(p1) -- Line: 159
    local v1 = p1:IsA("Model")
    if not v1 then
        v1 = p1:IsA("BasePart")
        if not v1 then
            v1 = p1:IsA("Tool")
            if not v1 then
                v1 = p1:IsA("Accessory")
                if not v1 then
                    v1 = p1:IsA("Accoutrement")
                end
            end
        end
    end
    return v1
end
function v3.IsItemIndexable(p1) -- Line: 167 -- upvalues: IsTargetable (val)
    local v1
    if not (IsTargetable(p1)) then
        v1 = p1:IsA("Folder")
    else
        v1 = if p1.ClassName == "Terrain" then p1:IsA("Folder") else true
    end
    return v1
end
function v3:UpdateTree() -- Line: 172 -- upvalues: SupportLibrary (val)
    if not (self:ShouldExecuteQueue("Tree")) then
        return
    end
    local u5 = 1
    local IdMap = self.IdMap
    self:setState(function(p1) -- Line: 184 -- upvalues: self (val), SupportLibrary (upval), IdMap (val), u5 (ref)
        local Instance, Parent, StagedItemState, v1, v2, v3, v4
        local v5 = {}
        local Descendants = self.props.Scope:GetDescendants()
        local v6 = SupportLibrary.FlipTable(Descendants)
        local v7 = p1
        for i, v in ipairs(Descendants) do
            v4 = IdMap[v]
            v1 = v4
            if v1 then
                v1 = v7.Items[v4]
            end
            if v1 then
                if v1.Order ~= u5 then
                    v1 = SupportLibrary.CloneTable(v1)
                    v1.Order = u5
                    v5[v4] = v1
                end
                u5 = u5 + 1
                v2 = self.IdMap[v1.Parent]
                if not (v7.Items[v2]) then
                    self:UpdateItemParent(v, v5, v7)
                end
            elseif self:BuildItemState(v, self.props.Scope, u5, v5, v7) then
                u5 = u5 + 1
            end
        end
        for k, i2 in pairs(v7.Items) do
            Instance = i2.Instance
            if not (v6[Instance]) then
                v5[k] = SupportLibrary.Blank
                IdMap[Instance] = nil
                self.ItemMaid[k] = nil
                Parent = i2.Parent
                if Parent then
                    Parent = self.IdMap[i2.Parent]
                end
                StagedItemState = self:GetStagedItemState(Parent, v5, v7)
                if StagedItemState then
                    StagedItemState.Children[k] = nil
                    StagedItemState.Unlocked[k] = nil
                    v3 = next(StagedItemState.Children)
                    if v3 then
                        v3 = not next(StagedItemState.Unlocked)
                    end
                    StagedItemState.IsLocked = v3
                    v5[Parent] = StagedItemState
                    self:PropagateLock(StagedItemState, v5, v7)
                end
            end
        end
        return {Items = SupportLibrary.MergeWithBlanks(v7.Items, v5)}
    end)
end
function v3:UpdateSelection(p2) -- Line: 249 -- upvalues: SupportLibrary (val)
    local Selection = self.props.Core.Selection
    self:QueueUpdate("Selection", p2)
    if not (self:ShouldExecuteQueue("Selection")) then
        return
    end
    self:setState(function(p1) -- Line: 261 -- upvalues: self (val), SupportLibrary (upval), Selection (val)
        local v1, v2
        local v3 = {}
        local UpdateQueue = self:GetUpdateQueue("Selection")
        local v4 = p1
        for k in pairs(UpdateQueue) do
            for i, v in ipairs(k) do
                v1 = self.IdMap[v]
                if v1 then
                    v2 = SupportLibrary.CloneTable(v4.Items[v1])
                    v2.Selected = Selection.IsSelected(v)
                    v3[v1] = v2
                end
            end
        end
        return {Items = SupportLibrary.Merge(v4.Items, v3)}
    end)
end
function v3:BuildItemState(p2, p3, p4, p5, p6) -- Line: 279 -- upvalues: Maid (val), SupportLibrary (val)
    local Locked, StagedItemState_2
    local Parent = p2.Parent
    local v1 = self.IdMap[Parent]
    local v2 = v1
    if not v2 then
        v2 = Parent == p3
    end
    if not (self.IsItemIndexable(p2)) or not v2 then
        return nil
    end
    local v3 = self.LastId + 1
    self.LastId = v3
    self.IdMap[p2] = v3
    local v4 = p2:IsA("BasePart")
    local v5 = Maid.new()
    self.ItemMaid[v3] = v5
    local v6 = {Id = v3, Name = p2.Name, IsPart = v4}
    if not v4 then
        Locked = nil
    else
        Locked = p2.Locked
    end
    v6.IsLocked = Locked
    v6.Class = p2.ClassName
    v6.Parent = Parent
    v6.Children = {}
    v6.Unlocked = {}
    v6.Order = p4
    v6.Instance = p2
    v6.Selected = self.props.Core.Selection.IsSelected(p2) or nil
    p5[v3] = v6
    local StagedItemState = self:GetStagedItemState(v1, p5, p6)
    if StagedItemState then
        StagedItemState.Children[v3] = true
        p5[v1] = StagedItemState
    end
    local v7 = self.PendingParent[p2]
    if not v7 then
        v7 = {}
    end
    for k in pairs(v7) do
        StagedItemState_2 = self:GetStagedItemState(k, p5, p6)
        if StagedItemState_2 then
            v6.Children[k] = true
            self:PropagateLock(StagedItemState_2, p5, p6)
        end
    end
    self:PropagateLock(v6, p5, p6)
    local PropertyChangedSignal = p2:GetPropertyChangedSignal("Name")
    v5.Name = PropertyChangedSignal:Connect(function() -- Line: 340 -- upvalues: self (val), p2 (val), SupportLibrary (upval)
        self:QueueUpdate("Name", p2)
        if not (self:ShouldExecuteQueue("Name")) then
            return
        end
        self:setState(function(p1) -- Line: 351 -- upvalues: self (upval), SupportLibrary (upval)
            local v1, v2
            local v3 = {}
            local UpdateQueue = self:GetUpdateQueue("Name")
            for k in pairs(UpdateQueue) do
                v1 = self.IdMap[k]
                v2 = SupportLibrary.CloneTable(p1.Items[v1])
                v2.Name = k.Name
                v3[v1] = v2
            end
            return {Items = SupportLibrary.Merge(p1.Items, v3)}
        end)
    end)
    local PropertyChangedSignal_2 = p2:GetPropertyChangedSignal("Parent")
    v5.Parent = PropertyChangedSignal_2:Connect(function() -- Line: 366 -- upvalues: p2 (val), self (val), SupportLibrary (upval)
        if not p2.Parent then
            return
        end
        self:QueueUpdate("Parent", p2)
        if not (self:ShouldExecuteQueue("Parent")) then
            return
        end
        self:setState(function(p1) -- Line: 380 -- upvalues: self (upval), SupportLibrary (upval)
            local v1 = {}
            local UpdateQueue = self:GetUpdateQueue("Parent")
            for k in pairs(UpdateQueue) do
                self:UpdateItemParent(k, v1, p1)
            end
            return {Items = SupportLibrary.MergeWithBlanks(p1.Items, v1)}
        end)
        self:UpdateTree()
    end)
    if v4 then
        local PropertyChangedSignal_3 = p2:GetPropertyChangedSignal("Locked")
        v5.Locked = PropertyChangedSignal_3:Connect(function() -- Line: 395 -- upvalues: self (val), p2 (val), SupportLibrary (upval)
            self:QueueUpdate("Lock", p2)
            if not (self:ShouldExecuteQueue("Lock")) then
                return
            end
            self:setState(function(p1) -- Line: 406 -- upvalues: self (upval), SupportLibrary (upval)
                local v1 = {}
                local UpdateQueue = self:GetUpdateQueue("Lock")
                for k in pairs(UpdateQueue) do
                    self:UpdateItemLock(k, v1, p1)
                end
                return {Items = SupportLibrary.MergeWithBlanks(p1.Items, v1)}
            end)
        end)
    end
    return true
end
function v3:QueueUpdate(p2, p3) -- Line: 423 -- upvalues: SupportLibrary (val)
    local v1 = self.UpdateQueues[p2]
    if not v1 then
        v1 = {}
    end
    local v2 = {}
    v2[p3] = true
    self.UpdateQueues[p2] = SupportLibrary.Merge(v1, v2)
end
function v3:GetUpdateQueue(p2) -- Line: 429
    local v1 = self.UpdateQueues[p2]
    self.UpdateQueues[p2] = nil
    return v1
end
function v3:ShouldExecuteQueue(p2) -- Line: 440 -- upvalues: SupportLibrary (val)
    local v1 = self.QueueTimers[p2]
    if not v1 then
        v1 = SupportLibrary.CreateConsecutiveCallDeferrer(0.025)
    end
    self.QueueTimers[p2] = v1
    if not (v1()) then
        return
    end
    if self.Mounted then
        return true
    end
end
function v3:UpdateItemLock(p2, p3, p4) -- Line: 450
    local v1 = self.IdMap[p2]
    local StagedItemState = self:GetStagedItemState(v1, p3, p4)
    if not StagedItemState then
        return
    end
    StagedItemState.IsLocked = p2.Locked
    p3[v1] = StagedItemState
    self:PropagateLock(StagedItemState, p3, p4)
end
function v3.GetStagedItemState(p1, p2, p3, p4) -- Line: 468 -- upvalues: SupportLibrary (val)
    local v1
    local v2 = p2
    if v2 then
        v2 = p3[p2]
    end
    if not p2 or v2 == SupportLibrary.Blank then
        return
    end
    if v2 then
        v1 = v2
        if not v1 then
            v1 = SupportLibrary.CloneTable(p4.Items[p2])
        end
        return v1
    end
    if not (p4.Items[p2]) then
        return
    end
    v1 = v2
    if not v1 then
        v1 = SupportLibrary.CloneTable(p4.Items[p2])
    end
    return v1
end
function v3:UpdateItemParent(p2, p3, p4) -- Line: 484 -- upvalues: SupportLibrary (val)
    local v1 = self.IdMap[p2]
    local StagedItemState = self:GetStagedItemState(v1, p3, p4)
    if not StagedItemState then
        return
    end
    local Parent = StagedItemState.Parent
    if Parent then
        Parent = self.IdMap[StagedItemState.Parent]
    end
    local Parent_2 = p2.Parent
    local v2 = self.IdMap[Parent_2]
    StagedItemState.Parent = Parent_2
    p3[v1] = StagedItemState
    if not v2 and Parent_2 ~= Scope and Parent_2:IsDescendantOf(Scope) then
        local v3 = self.PendingParent[Parent_2]
        if not v3 then
            v3 = {}
        end
        local v4 = {}
        v4[v1] = true
        self.PendingParent[Parent_2] = SupportLibrary.Merge(v3, v4)
    end
    local StagedItemState_2 = self:GetStagedItemState(Parent, p3, p4)
    if StagedItemState_2 then
        StagedItemState_2.Children[v1] = nil
        StagedItemState_2.Unlocked[v1] = nil
        local v5 = next(StagedItemState_2.Children)
        if v5 then
            v5 = not next(StagedItemState_2.Unlocked)
        end
        StagedItemState_2.IsLocked = v5
        p3[Parent] = StagedItemState_2
    end
    local StagedItemState_3 = self:GetStagedItemState(v2, p3, p4)
    if StagedItemState_3 then
        StagedItemState_3.Children[v1] = true
        p3[v2] = StagedItemState_3
        self:PropagateLock(StagedItemState, p3, p4)
    end
end
function v3:PropagateLock(p2, p3, p4) -- Line: 528
    local Parent, StagedItemState, v1, v2, v3, v4, v5
    if not p2.Parent then
        return
    end
    local Id = p2.Id
    local v6 = p2
    local v7 = self
    while true do
        Parent = v6.Parent
        v4 = Parent
        if v4 then
            v4 = v7.IdMap[Parent]
        end
        StagedItemState = v7:GetStagedItemState(v4, v2, v3)
        if not StagedItemState then
            Id = nil
            v6 = nil
        else
            if v6.IsLocked then
                v1 = nil
            else
                v1 = true
            end
            StagedItemState.Unlocked[Id] = v1
            v5 = next(StagedItemState.Children)
            if v5 then
                v5 = not next(StagedItemState.Unlocked)
            end
            StagedItemState.IsLocked = v5
            v2[v4] = StagedItemState
            Id = v4
            v6 = StagedItemState
        end
        if not v6 then
            break
        end
    end
end
function v3.render(p1) -- Line: 567 -- upvalues: createElement (val), ImageLabel (val), TextLabel (val), ImageButton (val), Roact (val), ItemList (val)
    local props = p1.props
    local state = p1.state
    local v1 = {
        Active = true,
        Layout = "List",
        LayoutDirection = "Vertical",
        Height = "WRAP_CONTENT",
        Image = "rbxassetid://2244248341",
        ScaleType = "Slice",
        ImageTransparency = 0.06999999999999995,
        ImageColor = "3B3B3B",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -100, 0.6, -190),
        Width = UDim.new(0, 145),
        SliceCenter = Rect.new(4, 4, 12, 12),
    }
    local v2 = {}
    local v3 = {
        Text = "  EXPLORER",
        TextSize = 9,
        TextColor = "FFFFFF",
        TextTransparency = 0.7,
        Height = UDim.new(0, 14),
    }
    local v4 = {}
    local v5 = {
        Image = "rbxassetid://2244452978",
        ImageRectOffset = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(14, 14) * 2,
        AspectRatio = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        ImageTransparency = 0.6599999999999999,
    }
    v5[Roact.Event.Activated] = props.Close
    v4.CloseButton = createElement(ImageButton, v5)
    v2.Header = createElement(TextLabel, v3, v4)
    v2.ItemList = createElement(ItemList, {
        Scope = props.Scope,
        Items = state.Items,
        ScrollTo = state.ScrollTo,
        Core = props.Core,
        IdMap = p1.IdMap,
        RowHeight = state.RowHeight,
        ToggleExpand = p1.ToggleExpand,
    })
    return createElement(ImageLabel, v1, v2)
end
return v3