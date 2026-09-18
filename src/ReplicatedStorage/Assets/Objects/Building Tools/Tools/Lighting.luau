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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Lighting
--                               Dumped in 0.00304 seconds
--                          Bytecode version 9  |  47 functions

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
local u74 = {Name = "Lighting Tool", Color = BrickColor.new("Really black"), OnSideChanged = Signal.new(), ManualText = "<font face=\"GothamBlack\" size=\"16\">Lighting Tool  🛠</font>\nLets you add point lights, surface lights, and spotlights to parts.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> Click on the surface of any part to change a light's side quickly."}
local u81 = {}
function u74.Equip() -- Line: 44
    ShowUI()
    EnableSurfaceClickSelection()
end
function u74.Unequip() -- Line: 53
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 62 -- upvalues: u81 (val)
    for k, v in pairs(u81) do
        v:Disconnect()
        u81[k] = nil
    end
end
function ShowUI() -- Line: 72 -- upvalues: u74 (val), ListenForManualWindowTrigger (val)
    if u74.UI then
        u74.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u74.UI = Core.Tool.Interfaces.BTLightingToolGUI:Clone()
    u74.UI.Parent = Core.UI
    u74.UI.Visible = true
    EnableLightSettingsUI(u74.UI.PointLight)
    EnableLightSettingsUI(u74.UI.SpotLight)
    EnableLightSettingsUI(u74.UI.SurfaceLight)
    local Title = u74.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u74.ManualText, u74.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function EnableSurfaceClickSelection(p1) -- Line: 107 -- upvalues: u81 (val)
    if u81.SurfaceClickSelection then
        u81.SurfaceClickSelection:Disconnect()
        u81.SurfaceClickSelection = nil
    end
    u81.SurfaceClickSelection = Core.Mouse.Button1Down:Connect(function() -- Line: 117 -- upvalues: p1 (val)
        local v1
        _, v1 = Core.Targeting:UpdateTarget()
        if Selection.IsSelected(v1) then
            SetSurface(p1, Core.Mouse.TargetSurface)
        end
    end)
end
function EnableLightSettingsUI(p1) -- Line: 126 -- upvalues: Roact (val), ColorPicker (val), Dropdown (val), u74 (val)
    local BuildDropdown, TextBox_3, u52, u63, u72
    local Name = p1.Name
    local Options = p1.Options
    local TextBox = Options.RangeOption.Input.TextBox
    local TextBox_2 = Options.BrightnessOption.Input.TextBox
    TextBox.FocusLost:Connect(function() -- Line: 145 -- upvalues: Name (val), TextBox (val)
        SetRange(Name, (tonumber(TextBox.Text)))
    end)
    TextBox_2.FocusLost:Connect(function() -- Line: 150 -- upvalues: Name (val), TextBox_2 (val)
        SetBrightness(Name, (tonumber(TextBox_2.Text)))
    end)
    local u26 = nil
    Options.ColorOption.HSVPicker.MouseButton1Click:Connect(function() -- Line: 156 -- upvalues: Name (val), Roact (upval), ColorPicker (upval), u26 (ref)
        local v1
        local v2 = GetLights(Name)
        local v3 = Support.IdentifyCommonProperty(v2, "Color")
        local v4 = {}
        local v5 = v3
        if not v5 then
            v5 = Color3.fromRGB(255, 255, 255)
        end
        v4.InitialColor = v5
        function v4.SetPreviewColor(p1) -- Line: 160 -- upvalues: Name (upval)
            PreviewColor(Name, p1)
        end
        function v4.OnConfirm(p1) -- Line: 163 -- upvalues: Name (upval), u26 (upval), Roact (upval)
            SetColor(Name, p1)
            u26 = Roact.unmount(u26)
        end
        function v4.OnCancel() -- Line: 167 -- upvalues: u26 (upval), Roact (upval)
            u26 = Roact.unmount(u26)
        end
        v2 = Roact.createElement(ColorPicker, v4)
        if not u26 then
            v1 = Roact.mount(v2, Core.UI, "ColorPicker")
        else
            v1 = Roact.update(u26, v2)
            if not v1 then
                v1 = Roact.mount(v2, Core.UI, "ColorPicker")
            end
        end
        u26 = v1
    end)
    Options.ShadowsOption.Checkbox.MouseButton1Click:Connect(function() -- Line: 177 -- upvalues: Name (val)
        ToggleShadows(Name)
    end)
    p1.AddButton.MouseButton1Click:Connect(function() -- Line: 182 -- upvalues: Name (val)
        AddLights(Name)
    end)
    p1.RemoveButton.MouseButton1Click:Connect(function() -- Line: 187 -- upvalues: Name (val)
        RemoveLights(Name)
    end)
    p1.ArrowButton.MouseButton1Click:Connect(function() -- Line: 192 -- upvalues: Name (val)
        OpenLightOptions(Name)
    end)
    if Name == "SpotLight" then
        u52 = {
            "Top",
            "Bottom",
            "Front",
            "Back",
            "Left",
            "Right",
        }
        u63 = "Current" .. Name .. "Side"
        function BuildDropdown() -- Line: 209 -- upvalues: Roact (upval), Dropdown (upval), u52 (val), u74 (upval), u63 (val), Name (val)
            local v1 = {MaxRows = 3, Position = UDim2.new(0, 30, 0, 0), Size = UDim2.new(0, 72, 0, 25), Options = u52}
            local Name_2 = u74[u63]
            if Name_2 then
                Name_2 = u74[u63].Name
            end
            v1.CurrentOption = Name_2
            function v1.OnOptionSelected(p1) -- Line: 216 -- upvalues: Name (upval)
                SetSurface(Name, Enum.NormalId[p1])
            end
            return Roact.createElement(Dropdown, v1)
        end
        u72 = Roact.mount(BuildDropdown(), Options.SideOption, "Dropdown")
        u74.OnSideChanged:Connect(function() -- Line: 224 -- upvalues: Roact (upval), u72 (val), BuildDropdown (val)
            Roact.update(u72, BuildDropdown())
        end)
        TextBox_3 = Options.AngleOption.Input.TextBox
        TextBox_3.FocusLost:Connect(function() -- Line: 230 -- upvalues: Name (val), TextBox_3 (val)
            SetAngle(Name, (tonumber(TextBox_3.Text)))
        end)
    elseif Name == "SurfaceLight" then
        u52 = {
            "Top",
            "Bottom",
            "Front",
            "Back",
            "Left",
            "Right",
        }
        u63 = "Current" .. Name .. "Side"
        function BuildDropdown() -- Line: 209 -- upvalues: Roact (upval), Dropdown (upval), u52 (val), u74 (upval), u63 (val), Name (val)
            local v1 = {MaxRows = 3, Position = UDim2.new(0, 30, 0, 0), Size = UDim2.new(0, 72, 0, 25), Options = u52}
            local Name_2 = u74[u63]
            if Name_2 then
                Name_2 = u74[u63].Name
            end
            v1.CurrentOption = Name_2
            function v1.OnOptionSelected(p1) -- Line: 216 -- upvalues: Name (upval)
                SetSurface(Name, Enum.NormalId[p1])
            end
            return Roact.createElement(Dropdown, v1)
        end
        u72 = Roact.mount(BuildDropdown(), Options.SideOption, "Dropdown")
        u74.OnSideChanged:Connect(function() -- Line: 224 -- upvalues: Roact (upval), u72 (val), BuildDropdown (val)
            Roact.update(u72, BuildDropdown())
        end)
        TextBox_3 = Options.AngleOption.Input.TextBox
        TextBox_3.FocusLost:Connect(function() -- Line: 230 -- upvalues: Name (val), TextBox_3 (val)
            SetAngle(Name, (tonumber(TextBox_3.Text)))
        end)
    end
end
function HideUI() -- Line: 238 -- upvalues: u74 (val)
    if not u74.UI then
        return
    end
    u74.UI.Visible = false
    UIUpdater:Stop()
end
function GetLights(p1) -- Line: 254
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, Support.GetChildOfClass(v, p1))
    end
    return v1
end
local u90 = {"SpotLight", "PointLight", "SurfaceLight"}
function OpenLightOptions(p1) -- Line: 272 -- upvalues: u74 (val), u90 (val)
    local v1, v2
    local u3 = u74.UI[p1]
    local v3 = Core.Tool.Interfaces.BTLightingToolGUI[p1]
    CloseLightOptions(p1)
    local v4 = UDim2.new(0, 0, 0, v3.Options.Size.Y.Offset)
    local Options = u3.Options
    Options.Size = UDim2.new(u3.Options.Size.X.Scale, u3.Options.Size.X.Offset, u3.Options.Size.Y.Scale, 0)
    u3.ClipsDescendants = false
    u3.Options:TweenSize(v3.Options.Size + v4, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function() -- Line: 295 -- upvalues: u3 (val)
        u3.Options.ClipsDescendants = false
    end)
    u74.UI:TweenSize(Core.Tool.Interfaces.BTLightingToolGUI.Size + v4, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    local v5 = #u90
    local v6 = 1
    for i = Support.FindTableOccurrence(u90, p1) + 1, v5, v6 do
        v2 = u74.UI[u90[i]]
        v1 = UDim2.new(v2.Position.X.Scale, v2.Position.X.Offset, v2.Position.Y.Scale, (i - 1) * 30 + 30 + v4.Y.Offset)
        v2:TweenPosition(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
    EnableSurfaceClickSelection(p1)
end
function CloseLightOptions(p1) -- Line: 335 -- upvalues: u90 (val), u74 (val)
    local Options, v1
    local v2 = p1
    for k, v in pairs(u90) do
        local u30 = u74.UI[v]
        local Size = Core.Tool.Interfaces.BTLightingToolGUI[v].Options.Size
        v1 = UDim2.new(u30.Position.X.Scale, u30.Position.X.Offset, u30.Position.Y.Scale, 30 + 30 * (k - 1))
        u30:TweenPosition(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        if not v2 then
            u30.Options.ClipsDescendants = true
            Options = u30.Options
            v1 = UDim2.new(u30.Options.Size.X.Scale, u30.Options.Size.X.Offset, u30.Options.Size.Y.Scale, 0)
            Options:TweenSize(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function() -- Line: 369 -- upvalues: u30 (val), Size (val)
                u30.ClipsDescendants = true
                u30.Options.Size = Size
            end)
        elseif v2 and v == v2 then
        end
    end
    if not v2 then
        u74.UI:TweenSize(Core.Tool.Interfaces.BTLightingToolGUI.Size, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
end
function UpdateUI() -- Line: 394 -- upvalues: u74 (val), u90 (val)
    local AddButton, Checkbox, Indicator, Options, RemoveButton, v1, v2, v3, v4, v5, v6, v7
    if not u74.UI then
        return
    end
    for k, v in pairs(u90) do
        v6 = GetLights(v)
        v7 = u74.UI[v]
        Options = v7.Options
        Indicator = Options.ColorOption.Indicator
        Checkbox = Options.ShadowsOption.Checkbox
        AddButton = v7.AddButton
        RemoveButton = v7.RemoveButton
        if #v6 == 0 and not v7.ClipsDescendants then
            CloseLightOptions()
        end
        if #v6 == 0 then
            AddButton.Visible = true
            AddButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5, 0, 3)
            RemoveButton.Visible = false
        elseif #v6 < #Selection.Parts then
            AddButton.Visible = true
            AddButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5, 0, 3)
            RemoveButton.Visible = true
            RemoveButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5 - RemoveButton.AbsoluteSize.X - 2, 0, 3)
        elseif #v6 == #Selection.Parts then
            RemoveButton.Visible = true
            RemoveButton.Position = UDim2.new(1, -RemoveButton.AbsoluteSize.X - 5, 0, 3)
            AddButton.Visible = false
        end
        v2 = {}
        v4 = Support.IdentifyCommonProperty(v6, "Range")
        v2[Options.RangeOption.Input.TextBox] = Support.Round(v4, 2) or "*"
        v4 = Support.IdentifyCommonProperty(v6, "Brightness")
        v2[Options.BrightnessOption.Input.TextBox] = Support.Round(v4, 2) or "*"
        UpdateDataInputs(v2)
        if v == "SpotLight" then
            v3 = {}
            v5 = Support.IdentifyCommonProperty(v6, "Angle")
            v3[Options.AngleOption.Input.TextBox] = Support.Round(v5, 2) or "*"
            UpdateDataInputs(v3)
            v2 = Support.IdentifyCommonProperty(v6, "Face")
            v3 = "Current" .. v .. "Side"
            if u74[v3] ~= v2 then
                u74[v3] = v2
                u74.OnSideChanged:Fire()
            end
        elseif v ~= "SurfaceLight" then
        end
        v1 = Support.IdentifyCommonProperty(v6, "Color")
        if not v1 then
            Indicator.BackgroundColor3 = Color3.new(0.8705882352941177, 0.8705882352941177, 0.8705882352941177)
            Indicator.Varies.Text = "*"
        else
            Indicator.BackgroundColor3 = v1
            Indicator.Varies.Text = ""
        end
        v2 = Support.IdentifyCommonProperty(v6, "Shadows")
        if v2 == true then
            Checkbox.Image = Core.Assets.CheckedCheckbox
        elseif v2 == false then
            Checkbox.Image = Core.Assets.UncheckedCheckbox
        elseif v2 == nil then
            Checkbox.Image = Core.Assets.SemicheckedCheckbox
        end
    end
end
function UpdateDataInputs(p1) -- Line: 507
    for k, v in pairs(p1) do
        if not (k:IsFocused()) then
            k.Text = tostring(v)
        end
    end
end
function AddLights(p1) -- Line: 525
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        if not (Support.GetChildOfClass(v, p1)) then
            table.insert(v1, {Part = v, LightType = p1})
        end
    end
    local v2 = Core.SyncAPI:Invoke("CreateLights", v1)
    Core.History.Add({
        Lights = v2,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 551
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Lights)
        end,
        Apply = function(p1) -- Line: 562
            Core.SyncAPI:Invoke("UndoRemove", p1.Lights)
            Selection.Replace(p1.Selection)
        end,
    })
    OpenLightOptions(p1)
end
function RemoveLights(p1) -- Line: 583
    local v1 = GetLights(p1)
    local v2 = {
        Lights = v1,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 593
            Core.SyncAPI:Invoke("UndoRemove", p1.Lights)
            Selection.Replace(p1.Selection)
        end,
        Apply = function(p1) -- Line: 604
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Lights)
        end,
    }
    Core.SyncAPI:Invoke("Remove", v1)
    Core.History.Add(v2)
end
function TrackChange() -- Line: 625
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 633
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncLighting", p1.Before)
        end,
        Apply = function(p1) -- Line: 644
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncLighting", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 659
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncLighting", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
function SetRange(p1, p2) -- Line: 676
    if not p2 then
        return
    end
    TrackChange()
    for k, v in pairs(GetLights(p1)) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Range = v.Range})
        table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Range = p2})
    end
    RegisterChange()
end
function SetBrightness(p1, p2) -- Line: 702
    if not p2 then
        return
    end
    TrackChange()
    for k, v in pairs(GetLights(p1)) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Brightness = v.Brightness})
        table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Brightness = p2})
    end
    RegisterChange()
end
function SetColor(p1, p2) -- Line: 728
    if not p2 then
        return
    end
    TrackChange()
    for k, v in pairs(GetLights(p1)) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Color = v.Color})
        table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Color = p2})
    end
    RegisterChange()
end
local u105 = nil
function PreviewColor(p1, p2) -- Line: 756 -- upvalues: u105 (ref)
    if p2 then
        if not p2 then
            return
        end
        if not u105 then
            u105 = {}
            for k, v in pairs(GetLights(p1)) do
                u105[v] = {Color = v.Color}
            end
        end
        for k2 in pairs(u105) do
            k2.Color = p2
        end
        return
    elseif u105 then
        for k3, i in pairs(u105) do
            k3.Color = i.Color
        end
        u105 = nil
        return
    end
end
function ToggleShadows(p1) -- Line: 789
    local v1 = GetLights(p1)
    TrackChange()
    for k, v in pairs(GetLights(p1)) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Shadows = v.Shadows})
        table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Shadows = not Support.IdentifyCommonProperty(v1, "Shadows")})
    end
    RegisterChange()
end
function SetSurface(p1, p2) -- Line: 813 -- upvalues: u74 (val)
    if not p2 then
        return
    elseif p1 == "SurfaceLight" then
        u74["Current" .. p1 .. "Side"] = p2
        TrackChange()
        for k, v in pairs(GetLights(p1)) do
            table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Face = v.Face})
            table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Face = p2})
        end
        RegisterChange()
        return
    elseif p1 ~= "SpotLight" then
        return
    end
end
function SetAngle(p1, p2) -- Line: 841
    if not p2 then
        return
    end
    TrackChange()
    for k, v in pairs(GetLights(p1)) do
        table.insert(HistoryRecord.Before, {Part = v.Parent, LightType = p1, Angle = v.Angle})
        table.insert(HistoryRecord.After, {Part = v.Parent, LightType = p1, Angle = p2})
    end
    RegisterChange()
end
return u74