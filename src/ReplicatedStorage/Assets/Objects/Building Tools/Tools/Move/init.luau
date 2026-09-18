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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Move
--                               Dumped in 0.00217 seconds
--                          Bytecode version 9  |  22 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent
local Core = require(Parent.Core)
local Snapping = require(Parent.Core.Snapping)
local BoundingBox = require(Parent.Core.BoundingBox)
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Libraries = Parent:WaitForChild("Libraries")
local Signal = require(Libraries:WaitForChild("Signal"))
local Maid = require(Libraries:WaitForChild("Maid"))
local Selection = Core.Selection
local Support = Core.Support
local Security = Core.Security
local v3 = {
    Name = "Move Tool",
    Increment = 1,
    Axes = "Global",
    Color = BrickColor.new("Deep orange"),
    PointSnapped = Signal.new(),
    Maid = Maid.new(),
    DragChanged = Signal.new(),
    AxesChanged = Signal.new(),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Move Tool  🛠</font>\nAllows you to move parts.<font size=\"12\"><br /></font>\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Axes</b></font>\nThis option lets you choose in which direction to move each part.<font size=\"6\"><br /></font>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>GLOBAL</b> <font color=\"rgb(150, 150, 150)\">—</font> Relative to the <b>world</b>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>LOCAL</b> <font color=\"rgb(150, 150, 150)\">—</font> Relative to each <b>individual part</b>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>LAST</b> <font color=\"rgb(150, 150, 150)\">—</font> Relative to the <b>last part clicked</b><font size=\"6\"><br /></font>\n\n<b>TIP:</b> Click on any part to focus the handles on it.<font size=\"6\"><br /></font>\n<b>TIP: </b>Hit the <b>Enter</b> key to switch between Axes modes quickly.<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Increment</b></font>\nLets you choose how many studs to move parts by.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Hit the – key to quickly type increments.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Use your number pad to move exactly by the current increment. Holding <b>Shift</b> reverses the increment.<font size=\"4\"><br /></font>\n   <font color=\"rgb(150, 150, 150)\">•</font>  8 & 2 — up & down\n   <font color=\"rgb(150, 150, 150)\">•</font>  1 & 9 — back & forth\n   <font color=\"rgb(150, 150, 150)\">•</font>  4 & 6 — left & right<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Snapping</b></font>\nYou can place parts perfectly together by holding the <b><i>R</i></b> key, and dragging parts by their <b>snap points</b>.<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Alignment</b></font>\nPress <b><i>T</i></b> while dragging to <b>align</b> the bottom surface of your base part to the current target surface.\n",
}
v3.HandleDragging = require(v1:WaitForChild("HandleDragging")).new(v3)
v3.FreeDragging = require(v1:WaitForChild("FreeDragging")).new(v3)
v3.UIController = require(v1:WaitForChild("UIController")).new(v3)
function v3.Equip(p1) -- Line: 90
    p1:SetAxes(p1.Axes)
    p1.UIController:ShowUI()
    p1:BindShortcutKeys()
    p1.FreeDragging:EnableDragging()
end
function v3.Unequip(p1) -- Line: 103 -- upvalues: ContextActionService (val), BoundingBox (val), Snapping (val)
    if p1.FreeDragging.IsDragging then
        p1.FreeDragging:FinishDragging()
    end
    ContextActionService:UnbindAction("BT: Start dragging")
    p1.UIController:HideUI()
    p1.HandleDragging:HideHandles()
    p1.Maid:Destroy()
    BoundingBox.ClearBoundingBox()
    Snapping.StopTracking()
end
function v3:SetAxes(p2) -- Line: 123 -- upvalues: BoundingBox (val), Selection (val)
    self.Axes = p2
    self.AxesChanged:Fire(self.Axes)
    BoundingBox.ClearBoundingBox()
    if p2 == "Global" then
        BoundingBox.StartBoundingBox(function(p1) -- Line: 135 -- upvalues: self (val)
            self.HandleDragging:AttachHandles(p1)
        end)
        return
    end
    if p2 == "Local" then
        self.HandleDragging:AttachHandles(Selection.Focus, true)
        return
    end
    if p2 == "Last" then
        self.HandleDragging:AttachHandles(Selection.Focus, true)
    end
end
function v3:MovePartsAlongAxesByFace(p2, p3, p4, p5, p6) -- Line: 151
    local v1 = Vector3.FromNormalId(p2) * p3
    if self.Axes == "Global" then
        for k4, k5 in pairs(p4) do
            k4.CFrame = k5.CFrame + v1
        end
        for k6, n in pairs(p5) do
            k6.WorldPivot = n.Pivot + v1
        end
        return
    end
    if self.Axes == "Local" then
        for k3, j in pairs(p4) do
            k3.CFrame = j.CFrame * CFrame.new(v1)
        end
        return
    end
    if self.Axes == "Last" then
        local v2 = p6 * CFrame.new(v1)
        for k, v in pairs(p4) do
            k.CFrame = v2 * p6:toObjectSpace(v.CFrame)
        end
        for k2, i in pairs(p5) do
            k2.WorldPivot = v2 * p6:ToObjectSpace(i.Pivot)
        end
    end
end
function v3:BindShortcutKeys() -- Line: 194 -- upvalues: UserInputService (val), Selection (val), Snapping (val)
    local Maid = self.Maid
    Maid.HotkeyStart = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 198 -- upvalues: UserInputService (upval), self (val), Selection (upval)
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Return then
            if self.Axes == "Global" then
                self:SetAxes("Local")
                return
            end
            if self.Axes == "Local" then
                self:SetAxes("Last")
                return
            end
            if self.Axes ~= "Last" then
                return
            end
            self:SetAxes("Global")
            return
        else
            if p1.KeyCode == Enum.KeyCode.KeypadEnter then
                if self.Axes == "Global" then
                    self:SetAxes("Local")
                    return
                end
                if self.Axes == "Local" then
                    self:SetAxes("Last")
                    return
                end
                if self.Axes ~= "Last" then
                    return
                end
                self:SetAxes("Global")
                return
            end
            if p1.KeyCode ~= Enum.KeyCode.R then
                if p1.KeyCode == Enum.KeyCode.KeypadEight then
                    self:NudgeSelectionByFace(Enum.NormalId.Top)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.KeypadTwo then
                    self:NudgeSelectionByFace(Enum.NormalId.Bottom)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.KeypadNine then
                    self:NudgeSelectionByFace(Enum.NormalId.Front)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.KeypadOne then
                    self:NudgeSelectionByFace(Enum.NormalId.Back)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.KeypadFour then
                    self:NudgeSelectionByFace(Enum.NormalId.Left)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.KeypadSix then
                    self:NudgeSelectionByFace(Enum.NormalId.Right)
                    return
                end
                if p1.KeyCode == Enum.KeyCode.T and not Selection.Multiselecting then
                    self.FreeDragging:AlignSelectionToTarget()
                end
                return
            elseif not Selection.Multiselecting then
                self:StartSnapping()
                return
            end
        end
    end)
    local Maid_2 = self.Maid
    Maid_2.HotkeyRelease = UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 262 -- upvalues: UserInputService (upval), self (val), Snapping (upval)
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end
        if p1.KeyCode ~= Enum.KeyCode.R then
            if p1.KeyCode.Name == "Minus" then
                self.UIController:FocusIncrementInput()
            elseif p1.KeyCode.Name == "KeypadMinus" then
                self.UIController:FocusIncrementInput()
            end
            return
        end
        if UserInputService:GetFocusedTextBox() then
            return
        end
        if not self.FreeDragging.IsDragging then
            self:SetAxes(self.Axes)
        end
        Snapping.StopTracking()
    end)
end
function v3:StartSnapping() -- Line: 296 -- upvalues: BoundingBox (val), Snapping (val), Selection (val)
    self.HandleDragging:AttachHandles(nil, true)
    BoundingBox.ClearBoundingBox()
    if self.FreeDragging.IsDragging then
        Snapping.TargetBlacklist = Selection.Items
    end
    Snapping.StartTracking(function(p1) -- Line: 309 -- upvalues: self (val)
        if p1 then
            self.SnappedPoint = p1.p
            self.PointSnapped:Fire(self.SnappedPoint)
        end
    end)
end
function v3.SetAxisPosition(p1, p2, p3) -- Line: 321 -- upvalues: Security (val), Selection (val), Core (val)
    local X, Y, Z, new, v1, v2, v3, v4
    p1:TrackChange()
    local v5 = p1:PrepareSelectionForDragging()
    v1, v2, v4 = p1, p2, p3
    for k in pairs(v5) do
        new = CFrame.new
        if v2 ~= "X" then
            X = k.Position.X
        else
            X = v4
        end
        if v2 ~= "Y" then
            Y = k.Position.Y
        else
            Y = v4
        end
        if v2 ~= "Z" then
            Z = k.Position.Z
        else
            Z = v4
        end
        v3 = new(X, Y, Z)
        k.CFrame = v3 * (k.CFrame - k.CFrame.p)
    end
    local v6 = Security.GetSelectionAreas(Selection.Parts)
    local v7 = Security.GetPermissions(v6, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v7) then
        for k2, v in pairs(v5) do
            k2.CFrame = v.CFrame
        end
    end
    for k3, i in pairs(v5) do
        k3:MakeJoints()
        Core.RestoreJoints(i.Joints)
        k3.CanCollide = i.CanCollide
        k3.Anchored = i.Anchored
    end
    v1:RegisterChange()
end
function v3:NudgeSelectionByFace(p2) -- Line: 365 -- upvalues: Support (val), UserInputService (val), Security (val), Selection (val), Core (val)
    local v1, v2, v3
    local Increment = self.Increment
    local KeysPressed = UserInputService:GetKeysPressed()
    local v4 = Support.FlipTable(Support.GetListMembers(KeysPressed, "KeyCode"))
    if v4[Enum.KeyCode.LeftShift] then
        Increment = -Increment
    elseif not (v4[Enum.KeyCode.RightShift]) then
    end
    self:TrackChange()
    v1, v2, v3 = self:PrepareSelectionForDragging()
    self:MovePartsAlongAxesByFace(p2, Increment, v1, v2, v3)
    self.DragChanged:Fire(Increment)
    local v5 = Security.GetSelectionAreas(Selection.Parts)
    local v6 = Security.GetPermissions(v5, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v6) then
        for k, v in pairs(v1) do
            k.CFrame = v.CFrame
        end
    end
    for k2, i in pairs(v1) do
        k2:MakeJoints()
        Core.RestoreJoints(i.Joints)
        k2.CanCollide = i.CanCollide
        k2.Anchored = i.Anchored
    end
    self:RegisterChange()
end
function v3:TrackChange() -- Line: 412 -- upvalues: Support (val), Selection (val), Core (val)
    local v1 = {
        Parts = Support.CloneTable(Selection.Parts),
        Models = Support.CloneTable(Selection.Models),
        BeforeCFrame = {},
        AfterCFrame = {},
        Selection = Selection.Items,
    }
    function v1.Unapply(p1) -- Line: 422 -- upvalues: Selection (upval), Core (upval)
        Selection.Replace(p1.Selection)
        local v1 = {}
        for i, v in ipairs(p1.Parts) do
            table.insert(v1, {Part = v, CFrame = p1.BeforeCFrame[v]})
        end
        for i2, i3 in ipairs(p1.Models) do
            table.insert(v1, {Model = i3, Pivot = p1.BeforeCFrame[i3]})
        end
        Core.SyncAPI:Invoke("SyncMove", v1)
    end
    function v1.Apply(p1) -- Line: 448 -- upvalues: Selection (upval), Core (upval)
        Selection.Replace(p1.Selection)
        local v1 = {}
        for i, v in ipairs(p1.Parts) do
            table.insert(v1, {Part = v, CFrame = p1.AfterCFrame[v]})
        end
        for i2, i3 in ipairs(p1.Models) do
            table.insert(v1, {Model = i3, Pivot = p1.AfterCFrame[i3]})
        end
        Core.SyncAPI:Invoke("SyncMove", v1)
    end
    self.HistoryRecord = v1
    for k, v in pairs(self.HistoryRecord.Parts) do
        self.HistoryRecord.BeforeCFrame[v] = v.CFrame
    end
    pcall(function() -- Line: 480 -- upvalues: self (val)
        for i, v in ipairs(self.HistoryRecord.Models) do
            self.HistoryRecord.BeforeCFrame[v] = v:GetPivot()
        end
    end)
end
function v3:RegisterChange() -- Line: 488 -- upvalues: Core (val)
    if not self.HistoryRecord then
        return
    end
    local u2 = {}
    for k, v in pairs(self.HistoryRecord.Parts) do
        self.HistoryRecord.AfterCFrame[v] = v.CFrame
        table.insert(u2, {Part = v, CFrame = v.CFrame})
    end
    pcall(function() -- Line: 505 -- upvalues: self (val), u2 (val)
        for k, v in pairs(self.HistoryRecord.Models) do
            self.HistoryRecord.AfterCFrame[v] = v:GetPivot()
            table.insert(u2, {Model = v, Pivot = v:GetPivot()})
        end
    end)
    Core.SyncAPI:Invoke("SyncMove", u2)
    Core.History.Add(self.HistoryRecord)
    self.HistoryRecord = nil
end
function v3.PrepareSelectionForDragging(p1) -- Line: 525 -- upvalues: Support (val), Selection (val), Core (val)
    local v1 = {}
    local u2 = {}
    local v2 = Support.FlipTable(Selection.Parts)
    for k, v in pairs(Selection.Parts) do
        v1[v] = {Anchored = v.Anchored, CanCollide = v.CanCollide, CFrame = v.CFrame}
        v.Anchored = true
        v.CanCollide = false
        v1[v].Joints = Core.PreserveJoints(v, v2)
        v:BreakJoints()
        v.Velocity = Vector3.new()
        v.RotVelocity = Vector3.new()
    end
    pcall(function() -- Line: 548 -- upvalues: Selection (upval), u2 (val)
        for i, v in ipairs(Selection.Models) do
            u2[v] = {Pivot = v:GetPivot()}
        end
    end)
    local CFrame = nil
    local Focus = Selection.Focus
    if not Focus then
        CFrame = nil
    elseif Focus:IsA("BasePart") then
        CFrame = Focus.CFrame
    elseif Focus:IsA("Model") then
        CFrame = Focus:GetModelCFrame()
        pcall(function() -- Line: 565 -- upvalues: CFrame (ref), Focus (val)
            CFrame = Focus:GetPivot()
        end)
    end
    return v1, u2, CFrame
end
return v3