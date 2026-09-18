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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Paint
--                               Dumped in 0.00131 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
Tool = v1.Parent.Parent
Core = require(Tool.Core)
local Vendor = Tool:WaitForChild("Vendor")
local UI = Tool:WaitForChild("UI")
local Libraries = Tool:WaitForChild("Libraries")
local Maid = require(Libraries:WaitForChild("Maid"))
local PaintHistoryRecord = require(v1:WaitForChild("PaintHistoryRecord"))
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
local Roact = require(Vendor:WaitForChild("Roact"))
local ColorPicker = require(UI:WaitForChild("ColorPicker"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u74 = {
    Name = "Paint Tool",
    Color = BrickColor.new("Really red"),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Paint Tool  🛠</font>\nLets you paint parts in different colors.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> Press <b><i>R</i></b> while hovering over a part to copy its color.",
    Equip = function(p1) -- Line: 42 -- upvalues: Maid (val)
        p1.Maid = Maid.new()
        ShowUI()
        p1:BindShortcutKeys()
        p1:EnableClickPainting()
    end,
    Unequip = function(p1) -- Line: 55
        HideUI()
        p1.Maid = p1.Maid:Destroy()
    end,
}
function ShowUI() -- Line: 66 -- upvalues: u74 (val), Roact (val), ColorPicker (val), ListenForManualWindowTrigger (val)
    if u74.UI then
        u74.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u74.UI = Core.Tool.Interfaces.BTPaintToolGUI:Clone()
    u74.UI.Parent = Core.UI
    u74.UI.Visible = true
    local v1 = {}
    PaletteButtons = v1
    for k, v in pairs(u74.UI.Palette:GetChildren()) do
        for k2, i in pairs(v:GetChildren()) do
            if i.ClassName == "TextButton" then
                i.MouseButton1Click:Connect(function() -- Line: 97 -- upvalues: i (val)
                    SetColor(BrickColor.new(i.Name).Color)
                end)
                PaletteButtons[i.Name] = i
            end
        end
    end
    u74.UI.Controls.LastColorButton.MouseButton1Click:Connect(PaintParts)
    local u52 = nil
    u74.UI.Controls.ColorPickerButton.MouseButton1Click:Connect(function() -- Line: 113 -- upvalues: Roact (upval), ColorPicker (upval), u52 (ref)
        local v1
        local v2 = Support.IdentifyCommonProperty(Selection.Parts, "Color")
        local v3 = {}
        local v4 = v2
        if not v4 then
            v4 = Color3.fromRGB(255, 255, 255)
        end
        v3.InitialColor = v4
        v3.SetPreviewColor = PreviewColor
        function v3.OnConfirm(p1) -- Line: 118 -- upvalues: u52 (upval), Roact (upval)
            SetColor(p1)
            u52 = Roact.unmount(u52)
        end
        function v3.OnCancel() -- Line: 122 -- upvalues: u52 (upval), Roact (upval)
            u52 = Roact.unmount(u52)
        end
        local v5 = Roact.createElement(ColorPicker, v3)
        if not u52 then
            v1 = Roact.mount(v5, Core.UI, "ColorPicker")
        else
            v1 = Roact.update(u52, v5)
            if not v1 then
                v1 = Roact.mount(v5, Core.UI, "ColorPicker")
            end
        end
        u52 = v1
    end)
    local Title = u74.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u74.ManualText, u74.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function HideUI() -- Line: 140 -- upvalues: u74 (val)
    if not u74.UI then
        return
    end
    u74.UI.Visible = false
    UIUpdater:Stop()
end
function UpdateUI() -- Line: 156 -- upvalues: u74 (val)
    local BrickColor, v1
    if not u74.UI then
        return
    end
    for k, v in pairs(PaletteButtons) do
        v.Text = ""
    end
    for k2, i in pairs(Selection.Parts) do
        if PaletteButtons[i.BrickColor.Name] and i.Color == i.BrickColor.Color then
            v1 = PaletteButtons[i.BrickColor.Name]
            v1.Text = "+"
        end
    end
    local v2 = Support.IdentifyCommonProperty(Selection.Parts, "Color")
    BrickColor = v2
    if not BrickColor then
        BrickColor = u74.BrickColor
        if not BrickColor then
            BrickColor = Color3.new(1, 0, 0)
        end
    end
    u74.UI.Controls.ColorPickerButton.ImageColor3 = BrickColor
end
function SetColor(p1) -- Line: 186 -- upvalues: u74 (val)
    local Name
    u74.BrickColor = p1
    local v1 = BrickColor.new(p1)
    local v2 = ("(%d, %d, %d)"):format(p1.r * 255, p1.g * 255, p1.b * 255)
    if v1.Color ~= p1 then
        Name = v2
    else
        Name = v1.Name
        if not Name then
            Name = v2
        end
    end
    local ColorName = u74.UI.Controls.LastColorButton.ColorName
    local ColorSquare = ColorName.ColorSquare
    ColorName.Visible = true
    ColorName.Text = Name
    ColorSquare.BackgroundColor3 = p1
    ColorSquare.Position = UDim2.new(1, -ColorName.TextBounds.X - 18, 0.2, 1)
    PaintParts()
end
function PaintParts() -- Line: 212 -- upvalues: u74 (val), PaintHistoryRecord (val)
    if not u74.BrickColor or #Selection.Parts == 0 then
        return
    end
    local v1 = PaintHistoryRecord.new()
    v1.TargetColor = u74.BrickColor
    v1:Apply(true)
    Core.History.Add(v1)
end
function PreviewColor(p1) -- Line: 232
    if p1 then
        local v1
        if not p1 then
            return
        end
        if not InitialState then
            local UsePartColor, v2, v3
            InitialState = {}
            v1 = p1
            for k, v in pairs(Selection.Parts) do
                v2 = InitialState
                v3 = {Color = v.Color}
                if v.ClassName ~= "UnionOperation" then
                    UsePartColor = nil
                else
                    UsePartColor = v.UsePartColor
                end
                v3.UsePartColor = UsePartColor
                v2[v] = v3
            end
        end
        for k2, i in pairs(Selection.Parts) do
            i.Color = v1
            if i.ClassName == "UnionOperation" then
                i.UsePartColor = true
            end
        end
        return
    elseif InitialState then
        for k3, j in pairs(InitialState) do
            k3.Color = j.Color
            if k3.ClassName == "UnionOperation" then
                k3.UsePartColor = j.UsePartColor
            end
        end
        InitialState = nil
        return
    end
end
function u74:BindShortcutKeys() -- Line: 278
    self.Maid.Hotkeys = Support.AddUserInputListener("Began", "Keyboard", false, function(p1) -- Line: 282
        if p1.KeyCode.Name == "Return" or p1.KeyCode.Name == "KeypadEnter" then
            return PaintParts()
        end
        if p1.KeyCode.Name == "R" and not Selection.Multiselecting and Core.Mouse.Target then
            SetColor(Core.Mouse.Target.Color)
        end
    end)
end
function u74:EnableClickPainting() -- Line: 303
    self.Maid.ClickPainting = Selection.FocusChanged:Connect(function(p1) -- Line: 307
        local v1
        _, v1 = Core.Targeting:UpdateTarget()
        if Selection.IsSelected(v1) then
            PaintParts()
        end
    end)
end
return u74