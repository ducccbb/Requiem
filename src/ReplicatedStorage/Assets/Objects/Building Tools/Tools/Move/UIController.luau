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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Move.UIController
--                              Dumped in 0.000981 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Core = require(Parent.Core)
local Selection = Core.Selection
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Maid = require(Libraries:WaitForChild("Maid"))
local ListenForManualWindowTrigger = require(Parent.Core:WaitForChild("ListenForManualWindowTrigger"))
local u42 = {}
u42.__index = u42
function u42.new(p1) -- Line: 24 -- upvalues: Maid (val), u42 (val)
    local v1 = {Tool = p1, Maid = Maid.new()}
    return (setmetatable(v1, u42))
end
function u42.ShowUI(p1) -- Line: 36 -- upvalues: SupportLibrary (val), Core (val), ListenForManualWindowTrigger (val)
    if p1.UI then
        p1.UI.Visible = true
        local Maid = p1.Maid
        Maid.UIUpdater = SupportLibrary.Loop(0.1, p1.UpdateUI, p1)
        p1:AttachDragListener()
        p1:AttachAxesListener()
        return
    end
    p1.UI = Core.Tool.Interfaces.BTMoveToolGUI:Clone()
    p1.UI.Parent = Core.UI
    p1.UI.Visible = true
    local AxesOption = p1.UI.AxesOption
    AxesOption.Global.Button.MouseButton1Down:Connect(function() -- Line: 55 -- upvalues: p1 (val)
        p1.Tool:SetAxes("Global")
    end)
    AxesOption.Local.Button.MouseButton1Down:Connect(function() -- Line: 58 -- upvalues: p1 (val)
        p1.Tool:SetAxes("Local")
    end)
    AxesOption.Last.Button.MouseButton1Down:Connect(function() -- Line: 61 -- upvalues: p1 (val)
        p1.Tool:SetAxes("Last")
    end)
    local TextBox = p1.UI.IncrementOption.Increment.TextBox
    TextBox.FocusLost:Connect(function(a1) -- Line: 67 -- upvalues: p1 (val), TextBox (val), SupportLibrary (upval)
        local Increment = tonumber(TextBox.Text)
        if not Increment then
            Increment = p1.Tool.Increment
        end
        p1.Tool.Increment = Increment
        TextBox.Text = SupportLibrary.Round(p1.Tool.Increment, 4)
    end)
    local TextBox_2 = p1.UI.Info.Center.X.TextBox
    local TextBox_3 = p1.UI.Info.Center.Y.TextBox
    local TextBox_4 = p1.UI.Info.Center.Z.TextBox
    TextBox_2.FocusLost:Connect(function(a1) -- Line: 76 -- upvalues: TextBox_2 (val), p1 (val)
        local v1 = tonumber(TextBox_2.Text)
        if v1 then
            p1.Tool:SetAxisPosition("X", v1)
        end
    end)
    TextBox_3.FocusLost:Connect(function(a1) -- Line: 82 -- upvalues: TextBox_3 (val), p1 (val)
        local v1 = tonumber(TextBox_3.Text)
        if v1 then
            p1.Tool:SetAxisPosition("Y", v1)
        end
    end)
    TextBox_4.FocusLost:Connect(function(a1) -- Line: 88 -- upvalues: TextBox_4 (val), p1 (val)
        local v1 = tonumber(TextBox_4.Text)
        if v1 then
            p1.Tool:SetAxisPosition("Z", v1)
        end
    end)
    local Title = p1.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(p1.Tool.ManualText, p1.Tool.Color.Color, Signature)
    local Maid_2 = p1.Maid
    Maid_2.UIUpdater = SupportLibrary.Loop(0.1, p1.UpdateUI, p1)
    p1:AttachDragListener()
    p1:AttachAxesListener()
end
function u42:AttachDragListener() -- Line: 108
    local Maid = self.Maid
    Maid.DragListener = self.Tool.DragChanged:Connect(function(p1) -- Line: 109 -- upvalues: self (val)
        self.UI.Changes.Text.Text = "moved " .. math.abs(p1) .. " studs"
    end)
end
function u42:AttachAxesListener() -- Line: 117 -- upvalues: Core (val)
    local Maid = self.Maid
    Maid.AxesListener = self.Tool.AxesChanged:Connect(function(p1) -- Line: 118 -- upvalues: Core (upval), self (val)
        Core.ToggleSwitch(p1, self.UI.AxesOption)
    end)
end
function u42.HideUI(p1) -- Line: 126
    if not p1.UI then
        return
    end
    p1.UI.Visible = false
    p1.Maid:Destroy()
end
function u42.UpdateUI(p1) -- Line: 142 -- upvalues: Selection (val), SupportLibrary (val)
    if not p1.UI then
        return
    end
    if #Selection.Parts == 0 then
        p1.UI.Info.Visible = false
        p1.UI.Size = UDim2.new(0, 245, 0, 90)
        return
    end
    p1.UI.Info.Visible = true
    p1.UI.Size = UDim2.new(0, 245, 0, 150)
    local v1 = {}
    local v2 = {}
    local v3 = {}
    for k, v in pairs(Selection.Parts) do
        table.insert(v1, SupportLibrary.Round(v.Position.X, 3))
        table.insert(v2, SupportLibrary.Round(v.Position.Y, 3))
        table.insert(v3, SupportLibrary.Round(v.Position.Z, 3))
    end
    local v4 = SupportLibrary.IdentifyCommonItem(v1)
    local v5 = SupportLibrary.IdentifyCommonItem(v2)
    local v6 = SupportLibrary.IdentifyCommonItem(v3)
    local TextBox = p1.UI.Info.Center.X.TextBox
    local TextBox_2 = p1.UI.Info.Center.Y.TextBox
    local TextBox_3 = p1.UI.Info.Center.Z.TextBox
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
function u42.FocusIncrementInput(p1) -- Line: 193
    p1.UI.IncrementOption.Increment.TextBox:CaptureFocus()
end
return u42