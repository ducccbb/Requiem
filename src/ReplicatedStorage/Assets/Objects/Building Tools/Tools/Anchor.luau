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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Anchor
--                              Dumped in 0.000735 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Tool = script.Parent.Parent
Core = require(Tool.Core)
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u35 = {Name = "Anchor Tool", Color = BrickColor.new("Really black"), ManualText = "<font face=\"GothamBlack\" size=\"16\">Anchor Tool  🛠</font>\nLets you anchor and unanchor parts.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> Press <b>Enter</b> to toggle anchor quickly."}
local u40 = {}
function u35.Equip() -- Line: 36
    ShowUI()
    BindShortcutKeys()
end
function u35.Unequip() -- Line: 45
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 54 -- upvalues: u40 (val)
    for k, v in pairs(u40) do
        v:Disconnect()
        u40[k] = nil
    end
end
function ShowUI() -- Line: 64 -- upvalues: ListenForManualWindowTrigger (val), u35 (val)
    if UI then
        UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    UI = Core.Tool.Interfaces.BTAnchorToolGUI:Clone()
    UI.Parent = Core.UI
    UI.Visible = true
    UI.Status.Anchored.Button.MouseButton1Click:Connect(function() -- Line: 91
        SetProperty("Anchored", true)
    end)
    UI.Status.Unanchored.Button.MouseButton1Click:Connect(function() -- Line: 94
        SetProperty("Anchored", false)
    end)
    local Title = UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u35.ManualText, u35.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function UpdateUI() -- Line: 107
    if not UI then
        return
    end
    local v1 = Support.IdentifyCommonProperty(Selection.Parts, "Anchored")
    if v1 == true then
        Core.ToggleSwitch("Anchored", UI.Status)
        return
    end
    if v1 == false then
        Core.ToggleSwitch("Unanchored", UI.Status)
        return
    end
    if v1 == nil then
        Core.ToggleSwitch(nil, UI.Status)
    end
end
function HideUI() -- Line: 133
    if not UI then
        return
    end
    UI.Visible = false
    UIUpdater:Stop()
end
function SetProperty(p1, p2) -- Line: 149
    local v1
    if p2 == nil then
        return
    end
    TrackChange()
    for k, v in pairs(Selection.Parts) do
        v1 = {Part = v}
        v1[p1] = v[p1]
        table.insert(HistoryRecord.Before, v1)
        v1 = {Part = v}
        v1[p1] = p2
        table.insert(HistoryRecord.After, v1)
    end
    RegisterChange()
end
function BindShortcutKeys() -- Line: 175 -- upvalues: u40 (val)
    table.insert(u40, UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 179
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Return then
            ToggleAnchors()
        elseif p1.KeyCode == Enum.KeyCode.KeypadEnter then
            ToggleAnchors()
        end
    end))
end
function ToggleAnchors() -- Line: 208
    SetProperty("Anchored", not Support.IdentifyCommonProperty(Selection.Parts, "Anchored"))
end
function TrackChange() -- Line: 216
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 224
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncAnchor", p1.Before)
        end,
        Apply = function(p1) -- Line: 235
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncAnchor", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 250
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncAnchor", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u35