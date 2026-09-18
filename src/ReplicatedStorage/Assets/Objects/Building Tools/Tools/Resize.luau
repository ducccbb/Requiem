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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Resize
--                               Dumped in 0.00412 seconds
--                          Bytecode version 9  |  46 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Tool = script.Parent.Parent
Core = require(Tool.Core)
SnapTracking = require(Tool.Core.Snapping)
game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")
local Libraries = Tool:WaitForChild("Libraries")
local Signal = require(Libraries:WaitForChild("Signal"))
require(Libraries:WaitForChild("Make"))
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u67 = {
    Name = "Resize Tool",
    Increment = 1,
    Directions = "Normal",
    Color = BrickColor.new("Cyan"),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Resize Tool  🛠</font>\nAllows you to resize parts.<font size=\"12\"><br /></font>\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Directions</b></font>\nLets you choose in which directions to resize the part.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Click on a part to focus the handles on it.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Hit <b>Enter</b> to switch between directions quickly.<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Increment</b></font>\nLets you choose how many studs to resize by.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Hit the – key to quickly type increments.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Use your number pad to resize exactly by the current increment. Holding <b>Shift</b> reverses the increment.<font size=\"4\"><br /></font>\n   <font color=\"rgb(150, 150, 150)\">•</font>  8 & 2 — up & down\n   <font color=\"rgb(150, 150, 150)\">•</font>  1 & 9 — back & forth\n   <font color=\"rgb(150, 150, 150)\">•</font>  4 & 6 — left & right<font size=\"12\"><br /></font>\n\n<font size=\"12\" color=\"rgb(150, 150, 150)\"><b>Snapping</b></font>\nHold the <b><i>R</i></b> key, and <b>click and drag the snap point</b> of a part (in the direction you want to resize) towards the snap point of another part, to resize up to that point.\n",
}
local u72 = {}
function u67.Equip() -- Line: 64
    ShowUI()
    ShowHandles()
    BindShortcutKeys()
end
function u67.Unequip() -- Line: 74
    HideUI()
    HideHandles()
    ClearConnections()
    SnapTracking.StopTracking()
    FinishSnapping()
end
function ClearConnections() -- Line: 86 -- upvalues: u72 (val)
    for k, v in pairs(u72) do
        v:Disconnect()
        u72[k] = nil
    end
end
function ClearConnection(p1) -- Line: 96 -- upvalues: u72 (val)
    local v1 = u72[p1]
    if v1 then
        v1:Disconnect()
        u72[p1] = nil
    end
end
function ShowUI() -- Line: 109 -- upvalues: u67 (val), ListenForManualWindowTrigger (val)
    if u67.UI then
        u67.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u67.UI = Core.Tool.Interfaces.BTResizeToolGUI:Clone()
    u67.UI.Parent = Core.UI
    u67.UI.Visible = true
    local DirectionsOption = u67.UI.DirectionsOption
    DirectionsOption.Normal.Button.MouseButton1Down:Connect(function() -- Line: 133
        SetDirections("Normal")
    end)
    DirectionsOption.Both.Button.MouseButton1Down:Connect(function() -- Line: 136
        SetDirections("Both")
    end)
    local TextBox = u67.UI.IncrementOption.Increment.TextBox
    TextBox.FocusLost:Connect(function(p1) -- Line: 142 -- upvalues: u67 (upval), TextBox (val)
        local Increment = tonumber(TextBox.Text)
        if not Increment then
            Increment = u67.Increment
        end
        u67.Increment = Increment
        TextBox.Text = Support.Round(u67.Increment, 4)
    end)
    local TextBox_2 = u67.UI.Info.SizeInfo.X.TextBox
    local TextBox_3 = u67.UI.Info.SizeInfo.Y.TextBox
    local TextBox_4 = u67.UI.Info.SizeInfo.Z.TextBox
    TextBox_2.FocusLost:Connect(function(p1) -- Line: 151 -- upvalues: TextBox_2 (val)
        local v1 = tonumber(TextBox_2.Text)
        if v1 then
            SetAxisSize("X", v1)
        end
    end)
    TextBox_3.FocusLost:Connect(function(p1) -- Line: 157 -- upvalues: TextBox_3 (val)
        local v1 = tonumber(TextBox_3.Text)
        if v1 then
            SetAxisSize("Y", v1)
        end
    end)
    TextBox_4.FocusLost:Connect(function(p1) -- Line: 163 -- upvalues: TextBox_4 (val)
        local v1 = tonumber(TextBox_4.Text)
        if v1 then
            SetAxisSize("Z", v1)
        end
    end)
    local Title = u67.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u67.ManualText, u67.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function HideUI() -- Line: 179 -- upvalues: u67 (val)
    if not u67.UI then
        return
    end
    u67.UI.Visible = false
    UIUpdater:Stop()
end
function UpdateUI() -- Line: 195 -- upvalues: u67 (val)
    if not u67.UI then
        return
    end
    if #Selection.Parts == 0 then
        u67.UI.Info.Visible = false
        u67.UI.Size = UDim2.new(0, 245, 0, 90)
        return
    end
    u67.UI.Info.Visible = true
    u67.UI.Size = UDim2.new(0, 245, 0, 150)
    local v1 = {}
    local v2 = {}
    local v3 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, Support.Round(v.Size.X, 3))
        table.insert(v2, Support.Round(v.Size.Y, 3))
        table.insert(v3, Support.Round(v.Size.Z, 3))
    end
    local v4 = Support.IdentifyCommonItem(v1)
    local v5 = Support.IdentifyCommonItem(v2)
    local v6 = Support.IdentifyCommonItem(v3)
    local TextBox = u67.UI.Info.SizeInfo.X.TextBox
    local TextBox_2 = u67.UI.Info.SizeInfo.Y.TextBox
    local TextBox_3 = u67.UI.Info.SizeInfo.Z.TextBox
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
function SetDirections(p1) -- Line: 246 -- upvalues: u67 (val)
    u67.Directions = p1
    if u67.UI then
        Core.ToggleSwitch(p1, u67.UI.DirectionsOption)
    end
end
local u81 = {}
u81[Enum.NormalId.Top] = Vector3.new(0, 1, 0)
u81[Enum.NormalId.Bottom] = Vector3.new(0, 1, 0)
u81[Enum.NormalId.Front] = Vector3.new(0, 0, 1)
u81[Enum.NormalId.Back] = Vector3.new(0, 0, 1)
u81[Enum.NormalId.Left] = Vector3.new(1, 0, 0)
u81[Enum.NormalId.Right] = Vector3.new(1, 0, 0)
local u118 = {}
u118[Enum.NormalId.Top] = Vector3.new(0, 1, 0)
u118[Enum.NormalId.Bottom] = Vector3.new(0, -1, 0)
u118[Enum.NormalId.Front] = Vector3.new(0, 0, -1)
u118[Enum.NormalId.Back] = Vector3.new(0, 0, 1)
u118[Enum.NormalId.Left] = Vector3.new(-1, 0, 0)
u118[Enum.NormalId.Right] = Vector3.new(1, 0, 0)
local u155 = {}
u155[Enum.NormalId.Top] = "Y"
u155[Enum.NormalId.Bottom] = "Y"
u155[Enum.NormalId.Front] = "Z"
u155[Enum.NormalId.Back] = "Z"
u155[Enum.NormalId.Left] = "X"
u155[Enum.NormalId.Right] = "X"
function ShowHandles() -- Line: 289 -- upvalues: u72 (val), u67 (val), Libraries (val)
    local Handles
    if not u72.AutofocusHandle then
        u72.AutofocusHandle = Selection.FocusChanged:Connect(ShowHandles)
    end
    if u67.Handles then
        u67.Handles:SetAdornee(Selection.Focus)
        return
    end
    local u18 = nil
    Handles = require(Libraries:WaitForChild("Handles"))
    u67.Handles = Handles.new({
        Color = u67.Color.Color,
        Parent = Core.UIContainer,
        Adornee = Selection.Focus,
        OnDragStart = function() -- Line: 304 -- upvalues: u18 (ref)
            Core.Targeting.CancelSelecting()
            HandleResizing = true
            InitialState = PreparePartsForResizing()
            TrackChange()
            if Core.Mode == "Tool" then
                local v1 = Security.GetSelectionAreas(Selection.Parts)
                u18 = Security.GetPermissions(v1, Core.Player)
            end
        end,
        OnDrag = function(p1, p2) -- Line: 326 -- upvalues: u67 (upval), u18 (ref)
            local v1, v2
            if not HandleResizing then
                return
            end
            local v3 = GetIncrementMultiple(p2, u67.Increment)
            v1, v2 = ResizePartsByFace(p1, v3, u67.Directions, InitialState)
            if not v1 then
                ResizePartsByFace(p1, v2, u67.Directions, InitialState)
            end
            if u67.UI then
                local v4 = math.abs(v2 or v3)
                u67.UI.Changes.Text.Text = "resized " .. Support.Round(v4, 3) .. " studs"
            end
            if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, u18) then
                for k, v in pairs(InitialState) do
                    k.Size = v.Size
                    k.CFrame = v.CFrame
                end
            end
        end,
        OnDragEnd = function() -- Line: 360
            if not HandleResizing then
                return
            end
            HandleResizing = false
            Core.Targeting.CancelSelecting()
            for k, v in pairs(InitialState) do
                k:MakeJoints()
                k.CanCollide = v.CanCollide
                k.Anchored = v.Anchored
            end
            RegisterChange()
        end,
    })
end
function HideHandles() -- Line: 395 -- upvalues: u67 (val)
    if not u67.Handles then
        return
    end
    u67.Handles = u67.Handles:Destroy()
    ClearConnection("AutofocusHandle")
end
function ResizePartsByFace(p1, p2, p3, p4) -- Line: 411 -- upvalues: u81 (val), u155 (val), u67 (val), u118 (val)
    local v1, v2, v3, v4, v5, v6
    if p3 ~= "Both" then
        v2 = p2
    else
        v2 = p2 * 2
    end
    local v7 = v2 * u81[p1]
    local v8 = u155[p1]
    local v9 = nil
    local v10 = nil
    local v11 = nil
    v6, v1, v5 = p4, p1, p3
    for k, v in pairs(p4) do
        v4 = v.Size[v8] + v2
        if v4 >= 0.049999 then
            if 2048 < v4 then
                if not v11 then
                    v11 = v4
                elseif v11 and v11 >= v4 then
                end
            end
        elseif not v9 then
            v9 = v4
            v10 = k
        elseif v9 and v4 >= v9 then
        end
    end
    if v9 then
        v3 = v6[v10].Size[v8]
        local v12 = v3 - u67.Increment * tonumber((tostring((v3 - 0.05) / u67.Increment):gsub("%..+", "")))
        return false, v2 + v12 - v9
    end
    if v11 then
        v3 = u67.Increment * tonumber((tostring(2048 / u67.Increment):gsub("%..+", "")))
        return false, v2 + v3 - v11
    end
    for k2, i in pairs(v6) do
        if not (k2:IsA("Part")) then
            k2.Size = i.Size + v7
        elseif k2.Shape == Enum.PartType.Ball then
            k2.Size = i.Size + Vector3.new(v2, v2, v2)
        elseif k2.Shape ~= Enum.PartType.Cylinder then
            k2.Size = i.Size + v7
        elseif v8 ~= "X" then
            k2.Size = i.Size + Vector3.new(0, v2, v2)
        end
        if v5 == "Normal" then
            k2.CFrame = i.CFrame * CFrame.new(u118[v1] * v2 / 2)
        elseif v5 == "Both" then
            k2.CFrame = i.CFrame
        end
    end
    return true
end
function BindShortcutKeys() -- Line: 497 -- upvalues: u72 (val), u67 (val)
    table.insert(u72, UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 501 -- upvalues: u67 (upval)
        local Both, Normal
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Return then
            if u67.Directions == "Normal" then
                SetDirections("Both")
                return
            end
            if u67.Directions == "Both" then
                SetDirections("Normal")
                return
            end
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadEnter then
            if u67.Directions == "Normal" then
                SetDirections("Both")
                return
            end
            if u67.Directions ~= "Both" then
                return
            end
            SetDirections("Normal")
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadEight then
            NudgeSelectionByFace(Enum.NormalId.Top)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadTwo then
            NudgeSelectionByFace(Enum.NormalId.Bottom)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadNine then
            NudgeSelectionByFace(Enum.NormalId.Front)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadOne then
            NudgeSelectionByFace(Enum.NormalId.Back)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadFour then
            NudgeSelectionByFace(Enum.NormalId.Left)
            return
        end
        if p1.KeyCode == Enum.KeyCode.KeypadSix then
            NudgeSelectionByFace(Enum.NormalId.Right)
            return
        end
        if p1.KeyCode == Enum.KeyCode.R and not Selection.Multiselecting then
            StartSnapping()
        end
    end))
    table.insert(u72, UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 562 -- upvalues: u67 (upval)
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode ~= Enum.KeyCode.R then
            if p1.KeyCode.Name == "Minus" then
                if u67.UI then
                    u67.UI.IncrementOption.Increment.TextBox:CaptureFocus()
                end
            elseif p1.KeyCode.Name == "KeypadMinus" and u67.UI then
                u67.UI.IncrementOption.Increment.TextBox:CaptureFocus()
            end
            return
        elseif not Selection.Multiselecting then
            FinishSnapping()
            return
        end
    end))
end
function SetAxisSize(p1, p2) -- Line: 594
    local X, Y, Z, v1, v2
    TrackChange()
    local v3 = PreparePartsForResizing()
    v1, v2 = p1, p2
    for k, v in pairs(v3) do
        if v1 ~= "X" then
            X = k.Size.X
        else
            X = v2
        end
        if v1 ~= "Y" then
            Y = k.Size.Y
        else
            Y = v2
        end
        if v1 ~= "Z" then
            Z = k.Size.Z
        else
            Z = v2
        end
        k.Size = Vector3.new(X, Y, Z)
        k.CFrame = v.CFrame
    end
    local v4 = Security.GetSelectionAreas(Selection.Parts)
    local v5 = Security.GetPermissions(v4, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v5) then
        for k2, i in pairs(v3) do
            k2.Size = i.Size
            k2.CFrame = i.CFrame
        end
    end
    for k3, j in pairs(v3) do
        k3:MakeJoints()
        k3.CanCollide = j.CanCollide
        k3.Anchored = j.Anchored
    end
    RegisterChange()
end
function NudgeSelectionByFace(p1) -- Line: 641 -- upvalues: u67 (val)
    local v1, v2
    local Increment = u67.Increment
    local KeysPressed = UserInputService:GetKeysPressed()
    local v3 = Support.FlipTable(Support.GetListMembers(KeysPressed, "KeyCode"))
    if v3[Enum.KeyCode.LeftShift] then
        Increment = -Increment
    elseif not (v3[Enum.KeyCode.RightShift]) then
    end
    TrackChange()
    local v4 = PreparePartsForResizing()
    v1, v2 = ResizePartsByFace(p1, Increment, u67.Directions, v4)
    if not v1 then
        ResizePartsByFace(p1, v2, u67.Directions, v4)
    end
    if u67.UI then
        u67.UI.Changes.Text.Text = "resized " .. Support.Round(v2 or Increment, 3) .. " studs"
    end
    local v5 = Security.GetSelectionAreas(Selection.Parts)
    local v6 = Security.GetPermissions(v5, Core.Player)
    if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, v6) then
        for k, v in pairs(v4) do
            k.Size = v.Size
            k.CFrame = v.CFrame
        end
    end
    for k2, i in pairs(v4) do
        k2:MakeJoints()
        k2.CanCollide = i.CanCollide
        k2.Anchored = i.Anchored
    end
    RegisterChange()
end
function TrackChange() -- Line: 695
    local v1 = {Parts = Support.CloneTable(Selection.Parts), BeforeSize = {}, AfterSize = {}, BeforeCFrame = {}}
    local v2 = {}
    v1.AfterCFrame = v2
    v1.Selection = Selection.Items
    function v1.Unapply(p1) -- Line: 706
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, Size = p1.BeforeSize[v], CFrame = p1.BeforeCFrame[v]})
        end
        Core.SyncAPI:Invoke("SyncResize", v1)
    end
    function v1.Apply(p1) -- Line: 723
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, Size = p1.AfterSize[v], CFrame = p1.AfterCFrame[v]})
        end
        Core.SyncAPI:Invoke("SyncResize", v1)
    end
    HistoryRecord = v1
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.BeforeSize[v] = v.Size
        HistoryRecord.BeforeCFrame[v] = v.CFrame
    end
end
function RegisterChange() -- Line: 750
    if not HistoryRecord then
        return
    end
    local v1 = {}
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.AfterSize[v] = v.Size
        HistoryRecord.AfterCFrame[v] = v.CFrame
        table.insert(v1, {Part = v, Size = v.Size, CFrame = v.CFrame})
    end
    Core.SyncAPI:Invoke("SyncResize", v1)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
function PreparePartsForResizing() -- Line: 775
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        v1[v] = {Anchored = v.Anchored, CanCollide = v.CanCollide, Size = v.Size, CFrame = v.CFrame}
        v.Anchored = true
        v.CanCollide = false
        v:BreakJoints()
        v.Velocity = Vector3.new()
        v.RotVelocity = Vector3.new()
    end
    return v1
end
function GetIncrementMultiple(p1, p2) -- Line: 793
    local v1 = p1 % p2
    local v2 = p1 - v1
    local v3 = p1 - v1 + p2
    local v4 = math.abs(p1 - v2)
    if v4 <= math.abs(p1 - v3) then
        return v2
    end
    return v3
end
PointSnapped = Signal.new()
function StartSnapping() -- Line: 819 -- upvalues: u72 (val), Workspace (val), u67 (val)
    if SnappingStage or SnapTracking.Enabled then
        return
    end
    SnappingStage = "Starting"
    SnapTracking.TrackEdgeMidpoints = false
    SnapTracking.TrackFaceCentroids = false
    function SnapTracking.TargetFilter(p1) -- Line: 832
        return Selection.PartIndex[p1]
    end
    SnapTracking.StartTracking(function(p1) -- Line: 837
        if p1 and p1.p ~= SnappedPoint then
            SnappedPoint = p1.p
            PointSnapped:Fire(p1.p)
        end
    end)
    u72.SnapDragStart = Support.AddUserInputListener("Began", "MouseButton1", false, function(p1) -- Line: 845 -- upvalues: u72 (upval), Workspace (upval), u67 (upval)
        SnappingStage = "Direction"
        SnappingStartAim = Vector2.new(p1.Position.X, p1.Position.Y)
        SnappingStartPoint = SnappedPoint
        SnappingStartTarget = SnapTracking.Target
        SnappingStartDirections = GetFaceOffsetsFromCorner(SnappingStartTarget, SnappingStartPoint)
        SnappingStartSelectionState = PreparePartsForResizing()
        local v1 = Security.GetSelectionAreas(Selection.Parts)
        AreaPermissions = Security.GetPermissions(v1, Core.Player)
        SnapTracking.StopTracking()
        DirectionLine = Core.Tool.Interfaces.SnapLine:Clone()
        DirectionLine.Parent = Core.UI
        DirectionLine.Visible = false
        TrackChange()
        u72.SnapDrag = Support.AddUserInputListener("Changed", "MouseMovement", true, function(p1) -- Line: 868 -- upvalues: Workspace (upval)
            local v1, v2, v3, v4, v5
            SnappingEndAim = Vector2.new(p1.Position.X, p1.Position.Y)
            ScreenSnappedPoint = Workspace.CurrentCamera:WorldToScreenPoint(SnappingStartPoint)
            ScreenSnappedPoint = Vector2.new(ScreenSnappedPoint.X, ScreenSnappedPoint.Y)
            local v6 = math.min(50, (math.max(50, (SnappingStartAim - ScreenSnappedPoint).magnitude * 1.5)))
            if SnappingStage ~= "Direction" then
                return
            end
            local v7 = SnappingEndAim.Y - ScreenSnappedPoint.Y
            local v8 = math.deg((math.atan2(v7, SnappingEndAim.X - ScreenSnappedPoint.X)))
            if 0 >= v8 then
                v4 = v8
            else
                v4 = v8 - 360
            end
            v8 = v4
            v4 = {}
            for k, v in pairs(SnappingStartDirections) do
                v5 = Workspace.CurrentCamera:WorldToScreenPoint(v.Offset)
                v3 = v5.Y - ScreenSnappedPoint.Y
                v1 = math.deg((math.atan2(v3, v5.X - ScreenSnappedPoint.X)))
                if 0 >= v1 then
                    v2 = v1
                else
                    v2 = v1 - 360
                end
                v1 = v2
                v2 = math.abs(v8 - v1) % 180
                if 90 >= v2 then
                    v3 = v2
                else
                    v3 = 180 - v2
                end
                table.insert(v4, {Face = v.Face, AngleDelta = v3, DirectionAngle = v1, Offset = v.Offset})
            end
            table.sort(v4, function(p1, p2) -- Line: 911
                local v1 = p1.AngleDelta < p2.AngleDelta
                return v1
            end)
            DirectionLine.Position = UDim2.new(0, ScreenSnappedPoint.X, 0, ScreenSnappedPoint.Y)
            v7 = math.abs(v8 - v4[1].DirectionAngle)
            if v7 > 90 then
                DirectionLine.Rotation = 180 + v4[1].DirectionAngle
            else
                DirectionLine.Rotation = v4[1].DirectionAngle
            end
            DirectionLine.PointMarker.Rotation = -DirectionLine.Rotation
            DirectionLine.SnapProgress.Size = UDim2.new(0, v6, 2, 0)
            DirectionLine.Visible = true
            if (SnappingEndAim - ScreenSnappedPoint).magnitude < v6 then
                return
            end
            DirectionLine:Destroy()
            SnappingDirection = v4[1].Face
            SnappingDirectionOffset = v4[1].Offset
            SnappingStage = "Destination"
            SnapTracking.TrackEdgeMidpoints = true
            SnapTracking.TrackFaceCentroids = true
            function SnapTracking.TargetFilter(p1) -- Line: 949
                return not p1.Locked
            end
            SnapTracking.TargetBlacklist = Selection.Items
            AlignmentLine = Core.Tool.Interfaces.SnapLineSegment:Clone()
            AlignmentLine.Visible = false
            AlignmentLine.Parent = Core.UI
            SnapTracking.StartTracking(function(p1) -- Line: 958
                if p1 and p1.p ~= SnappedPoint then
                    SnappedPoint = p1.p
                    PointSnapped:Fire(p1.p)
                end
            end)
        end)
        u72.Snap = PointSnapped:Connect(function(p1) -- Line: 970 -- upvalues: u67 (upval), Workspace (upval)
            if SnappingStage == "Destination" then
                local unit = (SnappingDirectionOffset - SnappingStartPoint).unit
                local v1 = (p1 - SnappingStartPoint):Dot(unit)
                if ResizePartsByFace(SnappingDirection, v1, "Normal", SnappingStartSelectionState) then
                    if u67.UI then
                        u67.UI.Changes.Text.Text = "resized " .. Support.Round(v1, 3) .. " studs"
                    end
                    local v2 = Workspace.CurrentCamera:WorldToScreenPoint(SnappingStartPoint + unit * v1)
                    v2 = Vector2.new(v2.X, v2.Y)
                    local v3 = Workspace.CurrentCamera:WorldToScreenPoint(p1)
                    v3 = Vector2.new(v3.X, v3.Y)
                    local v4 = v3.Y - v2.Y
                    local v5 = math.deg((math.atan2(v4, v3.X - v2.X)))
                    local v6 = v2:Lerp(v3, 0.5)
                    AlignmentLine.Position = UDim2.new(0, v6.X, 0, v6.Y)
                    AlignmentLine.Rotation = v5
                    AlignmentLine.Size = UDim2.new(0, (v3 - v2).magnitude, 0, 1)
                    AlignmentLine.PointMarkerA.Rotation = -v5
                    AlignmentLine.Visible = true
                end
                if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, AreaPermissions) then
                    for k, v in pairs(SnappingStartSelectionState) do
                        k.Size = v.Size
                        k.CFrame = v.CFrame
                    end
                end
            end
        end)
    end)
end
Support.AddUserInputListener("Ended", "MouseButton1", true, function(p1) -- Line: 1024
    if not SnappingStage then
        return
    end
    FinishSnapping()
end)
function FinishSnapping() -- Line: 1037
    if not SnappingStage then
        return
    end
    if SnappingStartSelectionState then
        for k, v in pairs(SnappingStartSelectionState) do
            k:MakeJoints()
            k.CanCollide = v.CanCollide
            k.Anchored = v.Anchored
        end
    end
    SnappingStage = nil
    SnapTracking.StopTracking()
    if DirectionLine then
        DirectionLine:Destroy()
        DirectionLine = nil
    end
    if AlignmentLine then
        AlignmentLine:Destroy()
        AlignmentLine = nil
    end
    if HistoryRecord then
        RegisterChange()
    end
    ClearConnection("SnapDragStart")
    ClearConnection("SnapDrag")
    ClearConnection("Snap")
    ClearConnection("SnapDragEnd")
end
function GetFaceOffsetsFromCorner(p1, p2) -- Line: 1084
    local v1, v2
    local v3 = {}
    local v4 = GetFacesFromCorner(p1, p2)
    for k, v in pairs(v4) do
        v1 = Vector3.FromNormalId(v)
        v2 = CFrame.new(p2)
        table.insert(v3, {Face = v, Offset = v2 * CFrame.Angles(p1.CFrame:toEulerAnglesXYZ()) * (v1 * p1.Size / 2)})
    end
    return v3
end
function GetFacesFromCorner(p1, p2) -- Line: 1104
    local v1 = {}
    for k, v in pairs(Enum.NormalId:GetEnumItems()) do
        table.insert(v1, {Proximity = (p2 - p1.CFrame * (p1.Size / 2 * Vector3.FromNormalId(v))).magnitude, Face = v})
    end
    table.sort(v1, function(p1, p2) -- Line: 1121
        local v1 = p1.Proximity < p2.Proximity
        return v1
    end)
    return {v1[1].Face, v1[2].Face, v1[3].Face}
end
return u67