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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Collision
--                              Dumped in 0.000760 seconds
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
local u35 = {Name = "Collision Tool", Color = BrickColor.new("Really black"), ManualText = "<font face=\"GothamBlack\" size=\"16\">Collision Tool  🛠</font>\nLets you change whether parts collide with one another.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> Press <b>Enter</b> to toggle collision quickly."}
local u40 = {}
function u35.Equip() -- Line: 34
    ShowUI()
    BindShortcutKeys()
end
function u35.Unequip() -- Line: 43
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 52 -- upvalues: u40 (val)
    for k, v in pairs(u40) do
        v:Disconnect()
        u40[k] = nil
    end
end
function ShowUI() -- Line: 62 -- upvalues: ListenForManualWindowTrigger (val), u35 (val)
    if UI then
        UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    UI = Core.Tool.Interfaces.BTCollisionToolGUI:Clone()
    UI.Parent = Core.UI
    UI.Visible = true
    UI.Status.On.Button.MouseButton1Click:Connect(function() -- Line: 89
        SetProperty("CanCollide", true)
    end)
    UI.Status.Off.Button.MouseButton1Click:Connect(function() -- Line: 92
        SetProperty("CanCollide", false)
    end)
    local Title = UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u35.ManualText, u35.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function UpdateUI() -- Line: 105
    if not UI then
        return
    end
    local v1 = Support.IdentifyCommonProperty(Selection.Parts, "CanCollide")
    if v1 == true then
        Core.ToggleSwitch("On", UI.Status)
        return
    end
    if v1 == false then
        Core.ToggleSwitch("Off", UI.Status)
        return
    end
    if v1 == nil then
        Core.ToggleSwitch(nil, UI.Status)
    end
end
function HideUI() -- Line: 131
    if not UI then
        return
    end
    UI.Visible = false
    UIUpdater:Stop()
end
function SetProperty(p1, p2) -- Line: 147
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
function BindShortcutKeys() -- Line: 173 -- upvalues: u40 (val)
    table.insert(u40, UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 177
        if p2 or p1.UserInputType ~= Enum.UserInputType.Keyboard or UserInputService:GetFocusedTextBox() then
            return
        end
        if p1.KeyCode == Enum.KeyCode.Return then
            ToggleCollision()
        elseif p1.KeyCode == Enum.KeyCode.KeypadEnter then
            ToggleCollision()
        end
    end))
end
function ToggleCollision() -- Line: 206
    SetProperty("CanCollide", not Support.IdentifyCommonProperty(Selection.Parts, "CanCollide"))
end
function TrackChange() -- Line: 214
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 222
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncCollision", p1.Before)
        end,
        Apply = function(p1) -- Line: 233
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncCollision", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 248
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncCollision", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u35