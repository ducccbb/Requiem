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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Mesh
--                               Dumped in 0.00311 seconds
--                          Bytecode version 9  |  49 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Tool = script.Parent.Parent
Core = require(Tool.Core)
local Vendor = Tool:WaitForChild("Vendor")
local UI = Tool:WaitForChild("UI")
local Libraries = Tool:WaitForChild("Libraries")
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
local Roact = require(Vendor:WaitForChild("Roact"))
local ColorPicker = require(UI:WaitForChild("ColorPicker"))
local Dropdown = require(UI:WaitForChild("Dropdown"))
local Signal = require(Libraries:WaitForChild("Signal"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u74 = {Name = "Mesh Tool", Color = BrickColor.new("Bright violet"), OnTypeChanged = Signal.new(), ManualText = "<font face=\"GothamBlack\" size=\"16\">Mesh Tool  🛠</font>\nLets you add meshes to parts.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> You can paste the link to anything with a mesh (e.g. a hat, gear, etc) and it will automatically find the right mesh and texture IDs.<font size=\"6\"><br /></font>\n\n<b>NOTE:</b> If HttpService is not enabled, you must type the mesh or image asset ID directly."}
local u81 = {}
function u74.Equip() -- Line: 49
    ShowUI()
end
function u74.Unequip() -- Line: 57
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 66 -- upvalues: u81 (val)
    for k, v in pairs(u81) do
        v:Disconnect()
        u81[k] = nil
    end
end
function ShowUI() -- Line: 76 -- upvalues: u74 (val), Roact (val), Dropdown (val), ColorPicker (val), ListenForManualWindowTrigger (val)
    if u74.UI then
        u74.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u74.UI = Core.Tool.Interfaces.BTMeshToolGUI:Clone()
    u74.UI.Parent = Core.UI
    u74.UI.Visible = true
    local TextBox = u74.UI.MeshIdOption.TextBox
    local TextBox_2 = u74.UI.TextureIdOption.TextBox
    MeshTypes = {
        Block = Enum.MeshType.Brick,
        Cylinder = Enum.MeshType.Cylinder,
        File = Enum.MeshType.FileMesh,
        Head = Enum.MeshType.Head,
        Sphere = Enum.MeshType.Sphere,
        Wedge = Enum.MeshType.Wedge,
    }
    SortedMeshTypes = Support.Keys(MeshTypes)
    table.sort(SortedMeshTypes)
    local function BuildTypeDropdown() -- Line: 119 -- upvalues: Roact (upval), Dropdown (upval), u74 (upval)
        return Roact.createElement(Dropdown, {
            MaxRows = 6,
            Position = UDim2.new(0, 40, 0, 0),
            Size = UDim2.new(1, -40, 0, 25),
            Options = SortedMeshTypes,
            CurrentOption = u74.CurrentType,
            OnOptionSelected = function(p1) -- Line: 126
                SetProperty("MeshType", MeshTypes[p1])
            end,
        })
    end
    local u66 = Roact.mount(BuildTypeDropdown(), u74.UI.TypeOption, "Dropdown")
    u74.OnTypeChanged:Connect(function() -- Line: 134 -- upvalues: Roact (upval), u66 (val), BuildTypeDropdown (val)
        Roact.update(u66, BuildTypeDropdown())
    end)
    local TextBox_3 = u74.UI.ScaleOption.XInput.TextBox
    local TextBox_4 = u74.UI.ScaleOption.YInput.TextBox
    local TextBox_5 = u74.UI.ScaleOption.ZInput.TextBox
    TextBox_3.FocusLost:Connect(function(p1) -- Line: 142 -- upvalues: TextBox_3 (val)
        local v1 = tonumber(TextBox_3.Text)
        SetAxisScale("X", v1)
    end)
    TextBox_4.FocusLost:Connect(function(p1) -- Line: 146 -- upvalues: TextBox_4 (val)
        local v1 = tonumber(TextBox_4.Text)
        SetAxisScale("Y", v1)
    end)
    TextBox_5.FocusLost:Connect(function(p1) -- Line: 150 -- upvalues: TextBox_5 (val)
        local v1 = tonumber(TextBox_5.Text)
        SetAxisScale("Z", v1)
    end)
    local TextBox_6 = u74.UI.OffsetOption.XInput.TextBox
    local TextBox_7 = u74.UI.OffsetOption.YInput.TextBox
    local TextBox_8 = u74.UI.OffsetOption.ZInput.TextBox
    TextBox_6.FocusLost:Connect(function(p1) -- Line: 159 -- upvalues: TextBox_6 (val)
        local v1 = tonumber(TextBox_6.Text)
        SetAxisOffset("X", v1)
    end)
    TextBox_7.FocusLost:Connect(function(p1) -- Line: 163 -- upvalues: TextBox_7 (val)
        local v1 = tonumber(TextBox_7.Text)
        SetAxisOffset("Y", v1)
    end)
    TextBox_8.FocusLost:Connect(function(p1) -- Line: 167 -- upvalues: TextBox_8 (val)
        local v1 = tonumber(TextBox_8.Text)
        SetAxisOffset("Z", v1)
    end)
    TextBox.FocusLost:Connect(function(p1) -- Line: 173 -- upvalues: TextBox (val)
        SetMeshId(ParseAssetId(TextBox.Text))
    end)
    TextBox_2.FocusLost:Connect(function(p1) -- Line: 178 -- upvalues: TextBox_2 (val)
        SetTextureId(ParseAssetId(TextBox_2.Text))
    end)
    local u143 = nil
    u74.UI.TintOption.HSVPicker.MouseButton1Click:Connect(function() -- Line: 184 -- upvalues: Roact (upval), ColorPicker (upval), u143 (ref)
        local v1
        local v2 = VectorToColor(Support.IdentifyCommonProperty(GetMeshes(), "VertexColor"))
        local v3 = {}
        local v4 = v2
        if not v4 then
            v4 = Color3.fromRGB(255, 255, 255)
        end
        v3.InitialColor = v4
        function v3.SetPreviewColor(p1) -- Line: 188
            SetPreviewTint(ColorToVector(p1))
        end
        function v3.OnConfirm(p1) -- Line: 191 -- upvalues: u143 (upval), Roact (upval)
            SetProperty("VertexColor", ColorToVector(p1))
            u143 = Roact.unmount(u143)
        end
        function v3.OnCancel() -- Line: 195 -- upvalues: u143 (upval), Roact (upval)
            u143 = Roact.unmount(u143)
        end
        local v5 = Roact.createElement(ColorPicker, v3)
        if not u143 then
            v1 = Roact.mount(v5, Core.UI, "ColorPicker")
        else
            v1 = Roact.update(u143, v5)
            if not v1 then
                v1 = Roact.mount(v5, Core.UI, "ColorPicker")
            end
        end
        u143 = v1
    end)
    u74.UI.AddButton.Button.MouseButton1Click:Connect(function() -- Line: 205
        AddMeshes()
    end)
    u74.UI.RemoveButton.Button.MouseButton1Click:Connect(function() -- Line: 208
        RemoveMeshes()
    end)
    local Title = u74.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u74.ManualText, u74.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function UpdateUI() -- Line: 221 -- upvalues: u74 (val)
    local v1
    if not u74.UI then
        return
    end
    local v2 = GetMeshes()
    local v3 = Support.IdentifyCommonProperty(v2, "MeshType")
    local v4 = Support.IdentifyCommonProperty(v2, "MeshId")
    local v5 = Support.IdentifyCommonProperty(v2, "TextureId")
    local v6 = VectorToColor(Support.IdentifyCommonProperty(v2, "VertexColor"))
    local v7 = false
    for k, v in pairs(GetMeshes()) do
        if v.MeshType == Enum.MeshType.FileMesh then
            v7 = true
            break
        end
    end
    local v8 = {}
    local v9 = {}
    local v10 = {}
    local v11 = {}
    local v12 = {}
    local v13 = {}
    for k2, i in pairs(GetMeshes()) do
        table.insert(v8, Support.Round(i.Scale.X, 3))
        table.insert(v9, Support.Round(i.Scale.Y, 3))
        table.insert(v10, Support.Round(i.Scale.Z, 3))
        table.insert(v11, Support.Round(i.Offset.X, 3))
        table.insert(v12, Support.Round(i.Offset.Y, 3))
        table.insert(v13, Support.Round(i.Offset.Z, 3))
    end
    local v14 = Support.IdentifyCommonItem(v8)
    local v15 = Support.IdentifyCommonItem(v9)
    local v16 = Support.IdentifyCommonItem(v10)
    local v17 = Support.IdentifyCommonItem(v11)
    local v18 = Support.IdentifyCommonItem(v12)
    local v19 = Support.IdentifyCommonItem(v13)
    local AddButton = u74.UI.AddButton
    local RemoveButton = u74.UI.RemoveButton
    local TextBox = u74.UI.MeshIdOption.TextBox
    local TextBox_2 = u74.UI.TextureIdOption.TextBox
    local Indicator = u74.UI.TintOption.Indicator
    local TextBox_3 = u74.UI.ScaleOption.XInput.TextBox
    local TextBox_4 = u74.UI.ScaleOption.YInput.TextBox
    local TextBox_5 = u74.UI.ScaleOption.ZInput.TextBox
    local TextBox_6 = u74.UI.OffsetOption.XInput.TextBox
    local TextBox_7 = u74.UI.OffsetOption.YInput.TextBox
    local TextBox_8 = u74.UI.OffsetOption.ZInput.TextBox
    local v20 = UpdateDataInputs
    local v21 = {}
    if not v4 then
        v1 = v4
        if not v1 then
            v1 = "*"
        end
    else
        v1 = ParseAssetId(v4)
    end
    v21[TextBox] = v1
    if not v5 then
        v1 = v5
        if not v1 then
            v1 = "*"
        end
    else
        v1 = ParseAssetId(v5)
    end
    v21[TextBox_2] = v1
    v21[TextBox_3] = v14 or "*"
    v21[TextBox_4] = v15 or "*"
    v21[TextBox_5] = v16 or "*"
    v21[TextBox_6] = v17 or "*"
    v21[TextBox_7] = v18 or "*"
    v21[TextBox_8] = v19 or "*"
    v20(v21)
    UpdateColorIndicator(Indicator, v6)
    v20 = Support.FindTableOccurrence(MeshTypes, v3)
    if u74.CurrentType ~= v20 then
        u74.CurrentType = v20
        u74.OnTypeChanged:Fire(v20)
    end
    AddButton.Visible = false
    RemoveButton.Visible = false
    u74.UI.TypeOption.Visible = false
    TextBox.Parent.Visible = false
    TextBox_2.Parent.Visible = false
    Indicator.Parent.Visible = false
    u74.UI.ScaleOption.Visible = false
    u74.UI.OffsetOption.Visible = false
    v21 = nil
    if #v2 == 0 then
        v21 = {AddButton}
    elseif #v2 ~= #Selection.Parts then
        if #v2 ~= #Selection.Parts then
            if #v2 == #Selection.Parts then
                if #v2 ~= #Selection.Parts and not v7 then
                    v21 = {
                        AddButton,
                        u74.UI.TypeOption,
                        u74.UI.ScaleOption,
                        u74.UI.OffsetOption,
                        RemoveButton,
                    }
                end
            elseif v7 then
                v21 = {
                    AddButton,
                    u74.UI.TypeOption,
                    u74.UI.ScaleOption,
                    u74.UI.OffsetOption,
                    TextBox.Parent,
                    TextBox_2.Parent,
                    Indicator.Parent,
                    RemoveButton,
                }
            elseif #v2 ~= #Selection.Parts and not v7 then
                v21 = {
                    AddButton,
                    u74.UI.TypeOption,
                    u74.UI.ScaleOption,
                    u74.UI.OffsetOption,
                    RemoveButton,
                }
            end
        elseif not v7 then
            v21 = {u74.UI.TypeOption, u74.UI.ScaleOption, u74.UI.OffsetOption, RemoveButton}
        end
    elseif v7 then
        v21 = {
            u74.UI.TypeOption,
            u74.UI.ScaleOption,
            u74.UI.OffsetOption,
            TextBox.Parent,
            TextBox_2.Parent,
            Indicator.Parent,
            RemoveButton,
        }
    end
    local v22 = UDim2.new(0, 0, 0, 20)
    DisplayLinearLayout(v21, u74.UI, v22, 10)
end
function HideUI() -- Line: 335 -- upvalues: u74 (val)
    if not u74.UI then
        return
    end
    u74.UI.Visible = false
    UIUpdater:Stop()
end
function GetMeshes() -- Line: 351
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, Support.GetChildOfClass(v, "SpecialMesh"))
    end
    return v1
end
function ParseAssetId(p1) -- Line: 365
    local v1 = tonumber(p1)
    if not v1 then
        v1 = tonumber(p1:lower():match("%?id=([0-9]+)"))
        if not v1 then
            v1 = tonumber(p1:match("/([0-9]+)/"))
            if not v1 then
                v1 = tonumber(p1:lower():match("rbxassetid://([0-9]+)"))
            end
        end
    end
    return v1
end
function VectorToColor(p1) -- Line: 378
    if not p1 then
        return
    end
    return Color3.new(p1.X, p1.Y, p1.Z)
end
function ColorToVector(p1) -- Line: 388
    if not p1 then
        return
    end
    return (Vector3.new(p1.r, p1.g, p1.b))
end
function UpdateDataInputs(p1) -- Line: 398
    for k, v in pairs(p1) do
        if not (k:IsFocused()) then
            k.Text = tostring(v)
        end
    end
end
function UpdateColorIndicator(p1, p2) -- Line: 416
    if p2 then
        p1.BackgroundColor3 = p2
        p1.Varies.Text = ""
        return
    end
    p1.BackgroundColor3 = Color3.new(0.8705882352941177, 0.8705882352941177, 0.8705882352941177)
    p1.Varies.Text = "*"
end
function DisplayLinearLayout(p1, p2, p3, p4) -- Line: 432
    local v1 = 0
    for i, v in ipairs(p1) do
        v.Visible = true
        v.Position = p3 + UDim2.new(v.Position.X.Scale, v.Position.X.Offset, 0, v1 + p4)
        v1 = v1 + p4 + v.AbsoluteSize.Y
    end
    p2.Size = UDim2.new(0, 200, 0, v1 + 30)
end
function AddMeshes() -- Line: 461
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        if not (Support.GetChildOfClass(v, "SpecialMesh")) then
            table.insert(v1, {Part = v})
        end
    end
    local v2 = Core.SyncAPI:Invoke("CreateMeshes", v1)
    Core.History.Add({
        Meshes = v2,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 487
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Meshes)
        end,
        Apply = function(p1) -- Line: 498
            Core.SyncAPI:Invoke("UndoRemove", p1.Meshes)
            Selection.Replace(p1.Selection)
        end,
    })
end
function RemoveMeshes() -- Line: 516
    local v1 = GetMeshes()
    local v2 = {
        Meshes = v1,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 526
            Core.SyncAPI:Invoke("UndoRemove", p1.Meshes)
            Selection.Replace(p1.Selection)
        end,
        Apply = function(p1) -- Line: 537
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Meshes)
        end,
    }
    Core.SyncAPI:Invoke("Remove", v1)
    Core.History.Add(v2)
end
local u97 = nil
function SetPreviewTint(p1) -- Line: 560 -- upvalues: u97 (ref)
    if p1 then
        if not p1 then
            return
        end
        if not u97 then
            u97 = {}
            for k, v in pairs(GetMeshes()) do
                u97[v] = {VertexColor = v.VertexColor}
            end
        end
        for k2 in pairs(u97) do
            k2.VertexColor = p1
        end
        return
    elseif u97 then
        for k3, i in pairs(u97) do
            k3.VertexColor = i.VertexColor
        end
        u97 = nil
        return
    end
end
function SetProperty(p1, p2) -- Line: 593
    local v1
    if not p2 then
        return
    end
    TrackChange()
    for k, v in pairs(GetMeshes()) do
        v1 = {Part = v.Parent}
        v1[p1] = v[p1]
        table.insert(HistoryRecord.Before, v1)
        v1 = {Part = v.Parent}
        v1[p1] = p2
        table.insert(HistoryRecord.After, v1)
    end
    RegisterChange()
end
function SetAxisScale(p1, p2) -- Line: 619
    local X, Y, Z, v1, v2, v3
    TrackChange()
    v1, v2 = p1, p2
    for k, v in pairs(GetMeshes()) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, Scale = v.Scale})
        if v1 ~= "X" then
            X = v.Scale.X
        else
            X = v2
        end
        if v1 ~= "Y" then
            Y = v.Scale.Y
        else
            Y = v2
        end
        if v1 ~= "Z" then
            Z = v.Scale.Z
        else
            Z = v2
        end
        v3 = Vector3.new(X, Y, Z)
        table.insert(HistoryRecord.After, {Part = v.Parent, Scale = v3})
    end
    RegisterChange()
end
function SetAxisOffset(p1, p2) -- Line: 648
    local X, Y, Z, v1, v2, v3
    TrackChange()
    v1, v2 = p1, p2
    for k, v in pairs(GetMeshes()) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, Offset = v.Offset})
        if v1 ~= "X" then
            X = v.Offset.X
        else
            X = v2
        end
        if v1 ~= "Y" then
            Y = v.Offset.Y
        else
            Y = v2
        end
        if v1 ~= "Z" then
            Z = v.Offset.Z
        else
            Z = v2
        end
        v3 = Vector3.new(X, Y, Z)
        table.insert(HistoryRecord.After, {Part = v.Parent, Offset = v3})
    end
    RegisterChange()
end
function SetMeshId(p1) -- Line: 677
    local v1, v2
    if not p1 then
        return
    end
    local u65 = {MeshId = "rbxassetid://" .. p1}
    local v3 = Core.Try(Core.SyncAPI.Invoke, Core.SyncAPI, "ExtractMeshFromAsset", p1)
    v3:Then(function(p1) -- Line: 692 -- upvalues: u65 (val)
        assert(p1.success, "Extraction failed")
        local meshID = p1.meshID
        if meshID then
            u65.MeshId = "rbxassetid://" .. meshID
        end
        local textureID = p1.textureID
        if textureID then
            u65.TextureId = "rbxassetid://" .. textureID
        end
        local tint = p1.tint
        if tint then
            u65.VertexColor = Vector3.new(tint.x, tint.y, tint.z)
        end
        local scale = p1.scale
        if scale then
            u65.Scale = Vector3.new(scale.x, scale.y, scale.z)
        end
    end)
    TrackChange()
    for k, v in pairs(GetMeshes()) do
        v1 = {Part = v.Parent}
        v2 = {Part = v.Parent}
        for k2, i in pairs(u65) do
            v1[k2] = v[k2]
            v2[k2] = i
        end
        table.insert(HistoryRecord.Before, v1)
        table.insert(HistoryRecord.After, v2)
    end
    RegisterChange()
end
function SetTextureId(p1) -- Line: 751
    local v1, v2
    if not p1 then
        return
    end
    local u65 = {TextureId = "rbxassetid://" .. p1}
    local v3 = Core.Try(Core.SyncAPI.Invoke, Core.SyncAPI, "ExtractImageFromDecal", p1)
    v3:Then(function(p1) -- Line: 766 -- upvalues: u65 (val)
        u65.TextureId = "rbxassetid://" .. p1
    end)
    TrackChange()
    for k, v in pairs(GetMeshes()) do
        v1 = {Part = v.Parent}
        v2 = {Part = v.Parent}
        for k2, i in pairs(u65) do
            v1[k2] = v[k2]
            v2[k2] = i
        end
        table.insert(HistoryRecord.Before, v1)
        table.insert(HistoryRecord.After, v2)
    end
    RegisterChange()
end
function TrackChange() -- Line: 798
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 806
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncMesh", p1.Before)
        end,
        Apply = function(p1) -- Line: 817
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncMesh", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 832
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncMesh", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u74