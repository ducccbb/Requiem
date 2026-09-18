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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Decorate
--                               Dumped in 0.00229 seconds
--                          Bytecode version 9  |  36 functions

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
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
local Roact = require(Vendor:WaitForChild("Roact"))
local ColorPicker = require(UI:WaitForChild("ColorPicker"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u57 = {Name = "Decorate Tool", Color = BrickColor.new("Really black"), ManualText = "<font face=\"GothamBlack\" size=\"16\">Decorate Tool  🛠</font>\nAllows you to add smoke, fire, and sparkles to parts."}
local u62 = {}
function u57.Equip() -- Line: 36
    ShowUI()
end
function u57.Unequip() -- Line: 44
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 53 -- upvalues: u62 (val)
    for k, v in pairs(u62) do
        v:Disconnect()
        u62[k] = nil
    end
end
function ShowUI() -- Line: 63 -- upvalues: u57 (val), ListenForManualWindowTrigger (val)
    if u57.UI then
        u57.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u57.UI = Core.Tool.Interfaces.BTDecorateToolGUI:Clone()
    u57.UI.Parent = Core.UI
    u57.UI.Visible = true
    EnableOptionsUI(u57.UI.Smoke)
    EnableOptionsUI(u57.UI.Fire)
    EnableOptionsUI(u57.UI.Sparkles)
    local Title = u57.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u57.ManualText, u57.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
local u67 = {"Smoke", "Fire", "Sparkles"}
function UpdateUI() -- Line: 102 -- upvalues: u57 (val), u67 (val)
    local AddButton, Options, RemoveButton, v1, v2, v3, v4
    if not u57.UI then
        return
    end
    for k, v in pairs(u67) do
        v3 = GetDecorations(v)
        v4 = u57.UI[v]
        Options = v4.Options
        AddButton = v4.AddButton
        RemoveButton = v4.RemoveButton
        if #v3 == 0 and not v4.ClipsDescendants then
            CloseOptions()
        end
        if #v3 == 0 then
            AddButton.Visible = true
            AddButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5, 0, 3)
            RemoveButton.Visible = false
        elseif #v3 < #Selection.Parts then
            AddButton.Visible = true
            AddButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5, 0, 3)
            RemoveButton.Visible = true
            RemoveButton.Position = UDim2.new(1, -AddButton.AbsoluteSize.X - 5 - RemoveButton.AbsoluteSize.X - 2, 0, 3)
        elseif #v3 == #Selection.Parts then
            RemoveButton.Visible = true
            RemoveButton.Position = UDim2.new(1, -RemoveButton.AbsoluteSize.X - 5, 0, 3)
            AddButton.Visible = false
        end
        if v == "Smoke" then
            v1 = {}
            v2 = Support.IdentifyCommonProperty(v3, "Size")
            v1[Options.SizeOption.Input.TextBox] = Support.Round(v2, 2) or "*"
            v2 = Support.IdentifyCommonProperty(v3, "RiseVelocity")
            v1[Options.VelocityOption.Input.TextBox] = Support.Round(v2, 2) or "*"
            v2 = Support.IdentifyCommonProperty(v3, "Opacity")
            v1[Options.OpacityOption.Input.TextBox] = Support.Round(v2, 2) or "*"
            UpdateDataInputs(v1)
            UpdateColorIndicator(Options.ColorOption.Indicator, Support.IdentifyCommonProperty(v3, "Color"))
        elseif v == "Fire" then
            UpdateColorIndicator(Options.ColorOption.Indicator, Support.IdentifyCommonProperty(v3, "Color"))
            UpdateColorIndicator(Options.SecondaryColorOption.Indicator, Support.IdentifyCommonProperty(v3, "SecondaryColor"))
            v1 = {}
            v2 = Support.IdentifyCommonProperty(v3, "Heat")
            v1[Options.HeatOption.Input.TextBox] = Support.Round(v2, 2) or "*"
            v2 = Support.IdentifyCommonProperty(v3, "Size")
            v1[Options.SizeOption.Input.TextBox] = Support.Round(v2, 2) or "*"
            UpdateDataInputs(v1)
        elseif v == "Sparkles" then
            UpdateColorIndicator(Options.ColorOption.Indicator, Support.IdentifyCommonProperty(v3, "SparkleColor"))
        end
    end
end
function HideUI() -- Line: 212 -- upvalues: u57 (val)
    if not u57.UI then
        return
    end
    u57.UI.Visible = false
    UIUpdater:Stop()
end
function GetDecorations(p1) -- Line: 228
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, Support.GetChildOfClass(v, p1))
    end
    return v1
end
function UpdateColorIndicator(p1, p2) -- Line: 243
    if p2 then
        p1.BackgroundColor3 = p2
        p1.Varies.Text = ""
        return
    end
    p1.BackgroundColor3 = Color3.new(0.8705882352941177, 0.8705882352941177, 0.8705882352941177)
    p1.Varies.Text = "*"
end
function UpdateDataInputs(p1) -- Line: 259
    for k, v in pairs(p1) do
        if not (k:IsFocused()) then
            k.Text = tostring(v)
        end
    end
end
function TrackChange() -- Line: 277
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 285
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncDecorate", p1.Before)
        end,
        Apply = function(p1) -- Line: 296
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncDecorate", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 311
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncDecorate", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
function EnableOptionsUI(p1) -- Line: 328
    local Name = p1.Name
    local Options = p1.Options
    if Name == "Smoke" then
        SyncInputToProperty("Color", Name, "Color", Options.ColorOption.HSVPicker)
        SyncInputToProperty("Size", Name, "Number", Options.SizeOption.Input.TextBox)
        SyncInputToProperty("RiseVelocity", Name, "Number", Options.VelocityOption.Input.TextBox)
        SyncInputToProperty("Opacity", Name, "Number", Options.OpacityOption.Input.TextBox)
    elseif Name == "Fire" then
        SyncInputToProperty("Color", Name, "Color", Options.ColorOption.HSVPicker)
        SyncInputToProperty("SecondaryColor", Name, "Color", Options.SecondaryColorOption.HSVPicker)
        SyncInputToProperty("Size", Name, "Number", Options.SizeOption.Input.TextBox)
        SyncInputToProperty("Heat", Name, "Number", Options.HeatOption.Input.TextBox)
    elseif Name == "Sparkles" then
        SyncInputToProperty("SparkleColor", Name, "Color", Options.ColorOption.HSVPicker)
    end
    p1.AddButton.MouseButton1Click:Connect(function() -- Line: 363 -- upvalues: Name (val)
        AddDecorations(Name)
    end)
    p1.RemoveButton.MouseButton1Click:Connect(function() -- Line: 368 -- upvalues: Name (val)
        RemoveDecorations(Name)
    end)
    p1.ArrowButton.MouseButton1Click:Connect(function() -- Line: 373 -- upvalues: Name (val)
        OpenOptions(Name)
    end)
end
function OpenOptions(p1) -- Line: 379 -- upvalues: u57 (val), u67 (val)
    local v1, v2
    local u3 = u57.UI[p1]
    local v3 = Core.Tool.Interfaces.BTDecorateToolGUI[p1]
    CloseOptions(p1)
    local v4 = UDim2.new(0, 0, 0, v3.Options.Size.Y.Offset)
    local Options = u3.Options
    Options.Size = UDim2.new(u3.Options.Size.X.Scale, u3.Options.Size.X.Offset, u3.Options.Size.Y.Scale, 0)
    u3.ClipsDescendants = false
    u3.Options:TweenSize(v3.Options.Size + v4, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function() -- Line: 402 -- upvalues: u3 (val)
        u3.Options.ClipsDescendants = false
    end)
    u57.UI:TweenSize(Core.Tool.Interfaces.BTDecorateToolGUI.Size + v4, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    local v5 = #u67
    local v6 = 1
    for i = Support.FindTableOccurrence(u67, p1) + 1, v5, v6 do
        v2 = u57.UI[u67[i]]
        v1 = UDim2.new(v2.Position.X.Scale, v2.Position.X.Offset, v2.Position.Y.Scale, (i - 1) * 30 + 30 + v4.Y.Offset)
        v2:TweenPosition(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
end
function CloseOptions(p1) -- Line: 439 -- upvalues: u67 (val), u57 (val)
    local Options, v1
    local v2 = p1
    for k, v in pairs(u67) do
        local u30 = u57.UI[v]
        local Size = Core.Tool.Interfaces.BTDecorateToolGUI[v].Options.Size
        v1 = UDim2.new(u30.Position.X.Scale, u30.Position.X.Offset, u30.Position.Y.Scale, 30 + 30 * (k - 1))
        u30:TweenPosition(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        if not v2 then
            u30.Options.ClipsDescendants = true
            Options = u30.Options
            v1 = UDim2.new(u30.Options.Size.X.Scale, u30.Options.Size.X.Offset, u30.Options.Size.Y.Scale, 0)
            Options:TweenSize(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true, function() -- Line: 473 -- upvalues: u30 (val), Size (val)
                u30.ClipsDescendants = true
                u30.Options.Size = Size
            end)
        elseif v2 and v == v2 then
        end
    end
    if not v2 then
        u57.UI:TweenSize(Core.Tool.Interfaces.BTDecorateToolGUI.Size, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    end
end
function SyncInputToProperty(p1, p2, p3, p4) -- Line: 498 -- upvalues: Roact (val), ColorPicker (val)
    if p3 == "Color" then
        local FocusLost = nil
        p4.MouseButton1Click:Connect(function() -- Line: 504 -- upvalues: p2 (val), p1 (val), Roact (upval), ColorPicker (upval), FocusLost (ref)
            local v1
            local v2 = GetDecorations(p2)
            local v3 = Support.IdentifyCommonProperty(v2, p1)
            local v4 = {}
            local v5 = v3
            if not v5 then
                v5 = Color3.fromRGB(255, 255, 255)
            end
            v4.InitialColor = v5
            function v4.SetPreviewColor(a1) -- Line: 508 -- upvalues: p2 (upval), p1 (upval)
                SetPreviewColor(p2, p1, a1)
            end
            function v4.OnConfirm(a1) -- Line: 511 -- upvalues: p2 (upval), p1 (upval), FocusLost (upval), Roact (upval)
                SetProperty(p2, p1, a1)
                FocusLost = Roact.unmount(FocusLost)
            end
            function v4.OnCancel() -- Line: 515 -- upvalues: FocusLost (upval), Roact (upval)
                FocusLost = Roact.unmount(FocusLost)
            end
            v2 = Roact.createElement(ColorPicker, v4)
            if not FocusLost then
                v1 = Roact.mount(v2, Core.UI, "ColorPicker")
            else
                v1 = Roact.update(FocusLost, v2)
                if not v1 then
                    v1 = Roact.mount(v2, Core.UI, "ColorPicker")
                end
            end
            FocusLost = v1
        end)
        return
    end
    if p3 == "Number" then
        p4.FocusLost:Connect(function() -- Line: 526 -- upvalues: p2 (val), p1 (val), p4 (val)
            SetProperty(p2, p1, (tonumber(p4.Text)))
        end)
    end
end
local u82 = nil
function SetPreviewColor(p1, p2, p3) -- Line: 536 -- upvalues: u82 (ref)
    if p3 then
        if not p3 then
            return
        end
        if not u82 then
            local v1
            u82 = {}
            for k, v in pairs(GetDecorations(p1)) do
                v1 = {}
                v1[p2] = v[p2]
                u82[v] = v1
            end
        end
        for k2 in pairs(u82) do
            k2[p2] = p3
        end
        return
    elseif u82 then
        for k3, i in pairs(u82) do
            k3[p2] = i[p2]
        end
        u82 = nil
        return
    end
end
function SetProperty(p1, p2, p3) -- Line: 569
    local v1
    if not p3 then
        return
    end
    TrackChange()
    for k, v in pairs(GetDecorations(p1)) do
        v1 = {Part = v.Parent, DecorationType = p1}
        v1[p2] = v[p2]
        table.insert(HistoryRecord.Before, v1)
        v1 = {Part = v.Parent, DecorationType = p1}
        v1[p2] = p3
        table.insert(HistoryRecord.After, v1)
    end
    RegisterChange()
end
function AddDecorations(p1) -- Line: 595
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        if not (Support.GetChildOfClass(v, p1)) then
            table.insert(v1, {Part = v, DecorationType = p1})
        end
    end
    local v2 = Core.SyncAPI:Invoke("CreateDecorations", v1)
    Core.History.Add({
        Decorations = v2,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 621
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Decorations)
        end,
        Apply = function(p1) -- Line: 632
            Core.SyncAPI:Invoke("UndoRemove", p1.Decorations)
            Selection.Replace(p1.Selection)
        end,
    })
    OpenOptions(p1)
end
function RemoveDecorations(p1) -- Line: 653
    local v1 = GetDecorations(p1)
    local v2 = {
        Decorations = v1,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 663
            Core.SyncAPI:Invoke("UndoRemove", p1.Decorations)
            Selection.Replace(p1.Selection)
        end,
        Apply = function(p1) -- Line: 674
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Decorations)
        end,
    }
    Core.SyncAPI:Invoke("Remove", v1)
    Core.History.Add(v2)
end
return u57