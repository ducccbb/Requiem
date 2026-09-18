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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Rotate
--                               Dumped in 0.00420 seconds
--                          Bytecode version 9  |  43 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Tool = script.Parent.Parent
Core = require(Tool.Core)
SnapTracking = require(Tool.Core.Snapping)
BoundingBox = require(Tool.Core.BoundingBox)
game:GetService("ContextActionService")
game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Libraries = Tool:WaitForChild("Libraries")
local Make = require(Libraries:WaitForChild("Make"))
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u71 = {
    Name = "Rotate Tool",
    Increment = 15,
    Pivot = "Center",
    Color = BrickColor.new("Bright green"),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Rotate Tool  🛠</font>\nAllows you to rotate parts.<font size=\"12\"><br /></font>\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Pivot</b></font>\nThis option lets you choose what to rotate the parts around.<font size=\"6\"><br /></font>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>CENTER</b> <font color=\"rgb(150, 150, 150)\">—</font> Relative to the <b>center of the selection</b>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>LOCAL</b> <font color=\"rgb(150, 150, 150)\">—</font> Each part around its <b>own center</b>\n <font color=\"rgb(150, 150, 150)\">•</font>  <b>LAST</b> <font color=\"rgb(150, 150, 150)\">—</font> Relative to the <b>center of the last part clicked</b><font size=\"6\"><br /></font>\n\n<b>TIP:</b> Click on any part to focus the handles on it.<font size=\"6\"><br /></font>\n<b>TIP: </b>Hit the <b>Enter</b> key to switch between Pivot modes quickly.<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Increment</b></font>\nLets you choose how many degrees to rotate by.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Hit the – key to quickly type increments.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Use your number pad to rotate exactly by the current increment. Holding <b>Shift</b> reverses the increment.<font size=\"4\"><br /></font>\n   <font color=\"rgb(150, 150, 150)\">•</font>  4 & 6 — Y axis (green)\n   <font color=\"rgb(150, 150, 150)\">•</font>  1 & 9 — Z axis (blue)\n   <font color=\"rgb(150, 150, 150)\">•</font>  2 & 8 — X axis (red)<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Snapping</b></font>\nPress <b><i>R</i></b> and click on a part's <b>snap point</b> to rotate around it.\n",
}
local u76 = {}
function u71.Equip() -- Line: 67 -- upvalues: u71 (val)
    SetPivot(u71.Pivot)
    ShowUI()
    BindShortcutKeys()
end
function u71.Unequip() -- Line: 79
    HideUI()
    HideHandles()
    ClearConnections()
    BoundingBox.ClearBoundingBox()
    SnapTracking.StopTracking()
end
function ClearConnections() -- Line: 91 -- upvalues: u76 (val)
    for k, v in pairs(u76) do
        v:Disconnect()
        u76[k] = nil
    end
end
function ClearConnection(p1) -- Line: 101 -- upvalues: u76 (val)
    local v1 = u76[p1]
    if u76[p1] then
        v1:Disconnect()
        u76[p1] = nil
    end
end
function ShowUI() -- Line: 114 -- upvalues: u71 (val), ListenForManualWindowTrigger (val)
    if u71.UI then
        u71.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u71.UI = Core.Tool.Interfaces.BTRotateToolGUI:Clone()
    u71.UI.Parent = Core.UI
    u71.UI.Visible = true
    local PivotOption = u71.UI.PivotOption
    PivotOption.Center.Button.MouseButton1Down:Connect(function() -- Line: 138
        SetPivot("Center")
    end)
    PivotOption.Local.Button.MouseButton1Down:Connect(function() -- Line: 141
        SetPivot("Local")
    end)
    PivotOption.Last.Button.MouseButton1Down:Connect(function() -- Line: 144
        SetPivot("Last")
    end)
    local TextBox = u71.UI.IncrementOption.Increment.TextBox
    TextBox.FocusLost:Connect(function(p1) -- Line: 150 -- upvalues: u71 (upval), TextBox (val)
        local Increment = tonumber(TextBox.Text)
        if not Increment then
            Increment = u71.Increment
        end
        u71.Increment = Increment
        TextBox.Text = Support.Round(u71.Increment, 4)
    end)
    local TextBox_2 = u71.UI.Info.RotationInfo.X.TextBox
    local TextBox_3 = u71.UI.Info.RotationInfo.Y.TextBox
    local TextBox_4 = u71.UI.Info.RotationInfo.Z.TextBox
    TextBox_2.FocusLost:Connect(function(p1) -- Line: 159 -- upvalues: TextBox_2 (val)
        local v1 = tonumber(TextBox_2.Text)
        if v1 then
            SetAxisAngle("X", v1)
        end
    end)
    TextBox_3.FocusLost:Connect(function(p1) -- Line: 165 -- upvalues: TextBox_3 (val)
        local v1 = tonumber(TextBox_3.Text)
        if v1 then
            SetAxisAngle("Y", v1)
        end
    end)
    TextBox_4.FocusLost:Connect(function(p1) -- Line: 171 -- upvalues: TextBox_4 (val)
        local v1 = tonumber(TextBox_4.Text)
        if v1 then
            SetAxisAngle("Z", v1)
        end
    end)
    local Title = u71.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u71.ManualText, u71.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function HideUI() -- Line: 187 -- upvalues: u71 (val)
    if not u71.UI then
        return
    end
    u71.UI.Visible = false
    UIUpdater:Stop()
end
function UpdateUI() -- Line: 203 -- upvalues: u71 (val)
    if not u71.UI then
        return
    end
    if #Selection.Parts == 0 then
        u71.UI.Info.Visible = false
        u71.UI.Size = UDim2.new(0, 245, 0, 90)
        return
    end
    u71.UI.Info.Visible = true
    u71.UI.Size = UDim2.new(0, 245, 0, 150)
    local v1 = {}
    local v2 = {}
    local v3 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, Support.Round(v.Orientation.X, 3))
        table.insert(v2, Support.Round(v.Orientation.Y, 3))
        table.insert(v3, Support.Round(v.Orientation.Z, 3))
    end
    local v4 = Support.IdentifyCommonItem(v1)
    local v5 = Support.IdentifyCommonItem(v2)
    local v6 = Support.IdentifyCommonItem(v3)
    local TextBox = u71.UI.Info.RotationInfo.X.TextBox
    local TextBox_2 = u71.UI.Info.RotationInfo.Y.TextBox
    local TextBox_3 = u71.UI.Info.RotationInfo.Z.TextBox
    if not (TextBox:IsFocused()) then
        TextBox.Text = v4 or "*"
    end
    if not (TextBox_2:IsFocused()) then
        TextBox_2.Text = v5 or "*"
    end
    if not (TextBox_3:IsFocused()) then
        TextBox_3.Text = v6 or "*"
    end
end
function SetPivot(p1) -- Line: 254 -- upvalues: u71 (val)
    u71.Pivot = p1
    if u71.UI then
        Core.ToggleSwitch(p1, u71.UI.PivotOption)
    end
    BoundingBox.ClearBoundingBox()
    if p1 == "Center" then
        BoundingBox.StartBoundingBox(AttachHandles)
        return
    end
    if p1 == "Local" then
        AttachHandles(Selection.Focus, true)
        return
    end
    if p1 == "Last" then
        local Adornee
        local v1 = AttachHandles
        if not CustomPivotPoint then
            Adornee = Selection.Focus
        elseif not u71.Handles then
            Adornee = Selection.Focus
        else
            Adornee = u71.Handles.Adornee
            if not Adornee then
                Adornee = Selection.Focus
            end
        end
        v1(Adornee, true)
    end
end
function AttachHandles(p1, p2) -- Line: 283 -- upvalues: u76 (val), u71 (val), Libraries (val)
    local AutofocusHandle, Handles
    if not p2 then
        if not p2 and u76.AutofocusHandle then
            ClearConnection("AutofocusHandle")
        end
    elseif not u76.AutofocusHandle then
        u76.AutofocusHandle = Selection.FocusChanged:Connect(function() -- Line: 288
            AttachHandles(Selection.Focus, true)
        end)
    end
    CustomPivotPoint = nil
    if u71.Handles then
        u71.Handles:BlacklistObstacle(BoundingBox.GetBoundingBox())
        u71.Handles:SetAdornee(p1)
        return
    end
    local u36 = nil
    local ArcHandles = require(Libraries:WaitForChild("ArcHandles"))
    u71.Handles = ArcHandles.new({
        Color = u71.Color.Color,
        Parent = Core.UIContainer,
        Adornee = p1,
        ObstacleBlacklist = {BoundingBox.GetBoundingBox()},
        OnDragStart = function() -- Line: 308 -- upvalues: u36 (ref), u71 (upval)
            local v1, v2
            Core.Targeting.CancelSelecting()
            HandleRotating = true
            if BoundingBox.GetBoundingBox() then
                v1, v2 = BoundingBox.CalculateExtents(Selection.Parts, BoundingBox.StaticExtents)
                InitialExtentsSize = v1
                InitialExtentsCFrame = v2
                BoundingBox.PauseMonitoring()
            end
            v1, v2 = PrepareSelectionForRotating()
            InitialPartStates = v1
            InitialModelStates = v2
            TrackChange()
            if Core.Mode == "Tool" then
                v2 = Security.GetSelectionAreas(Selection.Parts)
                u36 = Security.GetPermissions(v2, Core.Player)
            end
            if u71.Pivot == "Center" then
                PivotPoint = BoundingBox.GetBoundingBox().CFrame
                return
            end
            if u71.Pivot ~= "Last" or CustomPivotPoint then
                return
            end
            if Selection.Focus:IsA("BasePart") then
                PivotPoint = Selection.Focus.CFrame
                return
            end
            if Selection.Focus:IsA("Model") then
                PivotPoint = Selection.Focus:GetModelCFrame()
                pcall(function() -- Line: 344
                    PivotPoint = Selection.Focus:GetPivot()
                end)
            end
        end,
        OnDrag = function(p1, p2) -- Line: 352 -- upvalues: u71 (upval), u36 (ref)
            if not HandleRotating then
                return
            end
            local v1 = math.deg(p2)
            v1 = GetIncrementMultiple(v1, u71.Increment) % 360
            local v2 = GetHandleDisplayDelta(v1)
            RotateSelectionAroundPivot(u71.Pivot, PivotPoint, p1, v1, InitialPartStates, InitialModelStates)
            if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, u36) then
                for k, v in pairs(InitialPartStates) do
                    k.CFrame = v.CFrame
                end
                for k2, i in pairs(InitialModelStates) do
                    k2.WorldPivot = i.Pivot
                end
                v2 = 0
            end
            if u71.UI then
                u71.UI.Changes.Text.Text = "rotated " .. v2 .. " degrees"
            end
        end,
        OnDragEnd = function() -- Line: 392
            if not HandleRotating then
                return
            end
            Core.Targeting.CancelSelecting()
            HandleRotating = false
            ClearConnection("HandleRelease")
            HandleDirection = nil
            HandleFirstAngle = nil
            LastDisplayedRotation = nil
            for k, v in pairs(InitialPartStates) do
                k:MakeJoints()
                Core.RestoreJoints(v.Joints)
                k.CanCollide = v.CanCollide
                k.Anchored = v.Anchored
            end
            RegisterChange()
            BoundingBox.RecalculateStaticExtents()
            BoundingBox.ResumeMonitoring()
        end,
    })
end
function HideHandles() -- Line: 441 -- upvalues: u71 (val)
    if not u71.Handles then
        return
    end
    u71.Handles = u71.Handles:Destroy()
    ClearConnection("AutofocusHandle")
end
function RotateSelectionAroundPivot(p1, p2, p3, p4, p5, p6) -- Line: 457 -- upvalues: u71 (val)
    local v1, v2, v3
    local v4 = Vector3.FromAxis(p3)
    local v5 = CFrame.fromAxisAngle(v4, (math.rad(p4)))
    v3, v1, v2 = p6, p1, p2
    for k, v in pairs(p5) do
        if v1 == "Center" then
            k.CFrame = v2 * v5 * v2:toObjectSpace(v.CFrame)
        elseif v1 ~= "Last" and u71.Pivot == "Local" then
            k.CFrame = v.CFrame * v5
        end
    end
    for k2, i in pairs(v3) do
        if v1 == "Center" then
            k2.WorldPivot = v2 * v5 * v2:ToObjectSpace(i.Pivot)
        elseif v1 ~= "Last" then
        end
    end
end
function GetHandleDisplayDelta(p1) -- Line: 505
    local v1
    if HandleFirstAngle == nil then
        HandleFirstAngle = true
        HandleDirection = true
    elseif HandleFirstAngle == true then
        v1 = math.abs(p1)
        if 180 >= v1 then
            HandleDirection = true
        else
            HandleDirection = false
        end
        HandleFirstAngle = false
    end
    if HandleDirection ~= true then
        v1 = p1 % 360
    else
        v1 = (360 - p1) % 360
    end
    if LastDisplayedRotation then
        if LastDisplayedRotation > 120 then
            if 240 <= LastDisplayedRotation and v1 <= 120 then
                HandleDirection = not HandleDirection
            end
        elseif 240 <= v1 then
            HandleDirection = not HandleDirection
        end
    end
    if HandleDirection ~= true then
        v1 = p1 % 360
    else
        v1 = (360 - p1) % 360
    end
    LastDisplayedRotation = v1
    return v1
end
function BindShortcutKeys() -- Line: 558 -- upvalues: u76 (val), UserInputService (val), u71 (val)
    table.insert(u76, UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 562 -- upvalues: UserInputService (upval), u71 (upval)
        local Center, Last, Local
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Return then
            if u71.Pivot == "Center" then
                SetPivot("Local")
                return
            end
            if u71.Pivot == "Local" then
                SetPivot("Last")
                return
            end
            if u71.Pivot == "Last" then
                SetPivot("Center")
                return
            end
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadEnter then
            if u71.Pivot == "Center" then
                SetPivot("Local")
                return
            end
            if u71.Pivot == "Local" then
                SetPivot("Last")
                return
            end
            if u71.Pivot ~= "Last" then
                return
            end
            SetPivot("Center")
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadEight then
            NudgeSelectionByAxis(Enum.Axis.X, 1)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadTwo then
            NudgeSelectionByAxis(Enum.Axis.X, -1)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadNine then
            NudgeSelectionByAxis(Enum.Axis.Z, 1)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadOne then
            NudgeSelectionByAxis(Enum.Axis.Z, -1)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadFour then
            NudgeSelectionByAxis(Enum.Axis.Y, -1)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadSix then
            NudgeSelectionByAxis(Enum.Axis.Y, 1)
            return
        end
        if p1.KeyCode ~= Enum.KeyCode.R then
            if p1.KeyCode == Enum.KeyCode.T and not Selection.Multiselecting then
                StartSnapping()
            end
            return
        end
        if not Selection.Multiselecting then
            StartSnapping()
            return
        end
        if p1.KeyCode == Enum.KeyCode.T and not Selection.Multiselecting then
            StartSnapping()
        end
    end))
    u76.HotkeyRelease = UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 630 -- upvalues: u71 (upval)
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end
        if p1.KeyCode.Name == "Minus" then
            if u71.UI then
                u71.UI.IncrementOption.Increment.TextBox:CaptureFocus()
            end
        elseif p1.KeyCode.Name == "KeypadMinus" and u71.UI then
            u71.UI.IncrementOption.Increment.TextBox:CaptureFocus()
        end
    end)
end
function StartSnapping() -- Line: 649 -- upvalues: u76 (val), Make (val)
    if SnapTracking.Enabled then
        return
    end
    SnapTracking.StartTracking(function(p1) -- Line: 657
        SnappedPoint = p1
    end)
    u76.SelectSnappedPivot = Core.Mouse.Button1Down:Connect(function() -- Line: 662 -- upvalues: Make (upval)
        Core.Targeting.CancelSelecting()
        if not SnappedPoint then
            return
        end
        SnapTracking.StopTracking()
        local Part = Make("Part")
        local v1 = Part({CFrame = SnappedPoint, Size = Vector3.new(5, 1, 5)})
        SetPivot("Last")
        AttachHandles(v1, true)
        GCBypass = {v1}
        PivotPoint = SnappedPoint
        CustomPivotPoint = true
        ClearConnection("SelectSnappedPivot")
    end)
end
function SetAxisAngle(p1, p2) -- Line: 697
    local fromOrientation, v1, v2, v3, v4
    local v5 = math.rad(p2)
    TrackChange()
    local v6 = PrepareSelectionForRotating()
    local v7 = p1
    for k, v in pairs(v6) do
        v1 = CFrame.new(k.Position)
        fromOrientation = CFrame.fromOrientation
        if v7 ~= "X" then
            v2 = math.rad(k.Orientation.X)
        else
            v2 = v5
        end
        if v7 ~= "Y" then
            v3 = math.rad(k.Orientation.Y)
        else
            v3 = v5
        end
        if v7 ~= "Z" then
            v4 = math.rad(k.Orientation.Z)
        else
            v4 = v5
        end
        k.CFrame = v1 * fromOrientation(v2, v3, v4)
    end
    local v8 = Security.GetSelectionAreas(Selection.Parts)
    local v9 = Security.GetPermissions(v8, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v9) then
        for k2, i in pairs(v6) do
            k2.CFrame = i.CFrame
        end
    end
    for k3, j in pairs(v6) do
        k3:MakeJoints()
        Core.RestoreJoints(j.Joints)
        k3.CanCollide = j.CanCollide
        k3.Anchored = j.Anchored
    end
    RegisterChange()
end
function NudgeSelectionByAxis(p1, p2) -- Line: 744 -- upvalues: u71 (val), UserInputService (val)
    local v1, v2, v3
    if #Selection.Parts == 0 then
        return
    end
    local Increment = u71.Increment
    local KeysPressed = UserInputService:GetKeysPressed()
    local v4 = Support.FlipTable(Support.GetListMembers(KeysPressed, "KeyCode"))
    if v4[Enum.KeyCode.LeftShift] then
        Increment = -Increment
    elseif not (v4[Enum.KeyCode.RightShift]) then
    end
    TrackChange()
    v1, v2 = PrepareSelectionForRotating()
    if u71.Pivot == "Center" then
        _, v3 = BoundingBox.CalculateExtents(Selection.Parts)
        PivotPoint = v3
    elseif u71.Pivot == "Last" and not CustomPivotPoint then
        if Selection.Focus:IsA("BasePart") then
            PivotPoint = Selection.Focus.CFrame
        elseif Selection.Focus:IsA("Model") then
            PivotPoint = Selection.Focus:GetModelCFrame()
            pcall(function() -- Line: 778
                PivotPoint = Selection.Focus:GetPivot()
            end)
        end
    end
    RotateSelectionAroundPivot(u71.Pivot, PivotPoint, p1, Increment * (p2 or 1), v1, v2)
    if u71.UI then
        u71.UI.Changes.Text.Text = "rotated " .. Increment * (p2 or 1) .. " degrees"
    end
    v3 = Security.GetSelectionAreas(Selection.Parts)
    local v5 = Security.GetPermissions(v3, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v5) then
        for k, v in pairs(v1) do
            k.CFrame = v.CFrame
        end
        for k2, i in pairs(v2) do
            k2.WorldPivot = i.Pivot
        end
    end
    for k3, j in pairs(v1) do
        k3:MakeJoints()
        Core.RestoreJoints(j.Joints)
        k3.CanCollide = j.CanCollide
        k3.Anchored = j.Anchored
    end
    RegisterChange()
end
function TrackChange() -- Line: 818
    local v1 = {Parts = Support.CloneTable(Selection.Parts), Models = Support.CloneTable(Selection.Models), BeforeCFrame = {}}
    local v2 = {}
    v1.AfterCFrame = v2
    v1.Selection = Selection.Items
    function v1.Unapply(p1) -- Line: 828
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, CFrame = p1.BeforeCFrame[v]})
        end
        for k2, i in pairs(p1.Models) do
            table.insert(v1, {Model = i, Pivot = p1.BeforeCFrame[i]})
        end
        Core.SyncAPI:Invoke("SyncRotate", v1)
    end
    function v1.Apply(p1) -- Line: 854
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, CFrame = p1.AfterCFrame[v]})
        end
        for k2, i in pairs(p1.Models) do
            table.insert(v1, {Model = i, Pivot = p1.AfterCFrame[i]})
        end
        Core.SyncAPI:Invoke("SyncRotate", v1)
    end
    HistoryRecord = v1
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.BeforeCFrame[v] = v.CFrame
    end
    pcall(function() -- Line: 886
        for k, v in pairs(HistoryRecord.Models) do
            HistoryRecord.BeforeCFrame[v] = v:GetPivot()
        end
    end)
end
function RegisterChange() -- Line: 893
    if not HistoryRecord then
        return
    end
    local u1 = {}
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.AfterCFrame[v] = v.CFrame
        table.insert(u1, {Part = v, CFrame = v.CFrame})
    end
    pcall(function() -- Line: 910 -- upvalues: u1 (val)
        for k, v in pairs(HistoryRecord.Models) do
            HistoryRecord.AfterCFrame[v] = v:GetPivot()
            table.insert(u1, {Model = v, Pivot = v:GetPivot()})
        end
    end)
    Core.SyncAPI:Invoke("SyncRotate", u1)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
function PrepareSelectionForRotating() -- Line: 929
    local v1 = {}
    local u1 = {}
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
    pcall(function() -- Line: 955 -- upvalues: u1 (val)
        for k, v in pairs(Selection.Models) do
            u1[v] = {Pivot = v:GetPivot()}
        end
    end)
    return v1, u1
end
function GetIncrementMultiple(p1, p2) -- Line: 966
    local v1 = p1 % p2
    local v2 = p1 - v1
    local v3 = p1 - v1 + p2
    local v4 = math.abs(p1 - v2)
    if v4 <= math.abs(p1 - v3) then
        return v2
    end
    return v3
end
return u71