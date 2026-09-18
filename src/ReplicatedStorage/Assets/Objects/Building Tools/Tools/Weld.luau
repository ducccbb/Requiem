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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Weld
--                               Dumped in 0.00110 seconds
--                          Bytecode version 9  |  16 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
Tool = v1.Parent.Parent
Core = require(Tool.Core)
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u35 = {Name = "Weld Tool", Color = BrickColor.new("Really black"), ManualText = "<font face=\"GothamBlack\" size=\"16\">Weld Tool  🛠</font>\nAllows you to weld parts to hold them together.<font size=\"6\"><br /></font>\n\n<b>NOTE: </b>Welds may break if parts are individually moved."}
local u40 = {}
function u35.Equip() -- Line: 34
    ShowUI()
    EnableFocusHighlighting()
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
        return
    end
    UI = Core.Tool.Interfaces.BTWeldToolGUI:Clone()
    UI.Parent = Core.UI
    UI.Visible = true
    UI.Interface.WeldButton.MouseButton1Click:Connect(CreateWelds)
    UI.Interface.BreakWeldsButton.MouseButton1Click:Connect(BreakWelds)
    local Title = UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u35.ManualText, u35.Color.Color, Signature)
end
function HideUI() -- Line: 91
    if not UI then
        return
    end
    UI.Visible = false
end
local GetConnectedParts = Instance.new("Part").GetConnectedParts
local GetChildren = v1.GetChildren
function GetPartWelds(p1) -- Line: 108 -- upvalues: GetConnectedParts (val)
    local v1 = {}
    for k in pairs(SearchWelds(p1, p1)) do
        v1[k] = true
    end
    local v2 = p1
    for k2, v in pairs(GetConnectedParts(p1)) do
        for k3 in pairs(SearchWelds(v, v2)) do
            v1[k3] = true
        end
    end
    return v1
end
function SearchWelds(p1, p2) -- Line: 130 -- upvalues: GetChildren (val)
    local v1 = {}
    local v2 = p2
    for k, v in pairs(GetChildren(p1)) do
        if v.Name == "BTWeld" and v.ClassName == "Weld" then
            if v.Part0 == v2 then
                v1[v] = true
            elseif v.Part1 ~= v2 then
            end
        end
    end
    return v1
end
function CreateWelds() -- Line: 154
    local Focus, v1
    if Selection.Focus:IsA("BasePart") then
        Focus = Selection.Focus
    elseif not (Selection.Focus:IsA("Model")) then
        Focus = Selection.Focus:FindFirstChildWhichIsA("BasePart", true)
    else
        Focus = Selection.Focus.PrimaryPart
        if not Focus then
            Focus = Selection.Focus:FindFirstChildWhichIsA("BasePart", true)
        end
    end
    local v2 = Core.SyncAPI:Invoke("CreateWelds", Selection.Parts, Focus)
    if #v2 ~= 1 then
        v1 = "s"
    else
        v1 = ""
    end
    UI.Changes.Text.Text = ("created %s weld%s"):format(#v2, v1)
    Core.History.Add({
        Welds = v2,
        Unapply = function(p1) -- Line: 172
            Core.SyncAPI:Invoke("RemoveWelds", p1.Welds)
        end,
        Apply = function(p1) -- Line: 180
            Core.SyncAPI:Invoke("UndoRemovedWelds", p1.Welds)
        end,
    })
end
function BreakWelds() -- Line: 195
    local v1
    local v2 = {}
    for k, v in pairs(Selection.Parts) do
        for k2 in pairs(GetPartWelds(v)) do
            v2[k2] = true
        end
    end
    v2 = Support.Keys(v2)
    local v3 = Core.SyncAPI:Invoke("RemoveWelds", v2)
    if v3 ~= 1 then
        v1 = "s"
    else
        v1 = ""
    end
    UI.Changes.Text.Text = ("removed %s weld%s"):format(v3, v1)
    Core.History.Add({
        Welds = v2,
        Unapply = function(p1) -- Line: 220
            Core.SyncAPI:Invoke("UndoRemovedWelds", p1.Welds)
        end,
        Apply = function(p1) -- Line: 228
            Core.SyncAPI:Invoke("RemoveWelds", p1.Welds)
        end,
    })
end
function EnableFocusHighlighting() -- Line: 243 -- upvalues: u40 (val)
    if Core.Mode ~= "Tool" then
        return
    end
    Core.Selection.RecolorOutlines(Core.Selection.Color)
    if Selection.Focus then
        local v1 = #Selection.Parts
        if 1 < v1 then
            Core.Selection.RecolorOutline(Selection.Focus, BrickColor.new("Deep orange"))
        end
    end
    u40.FocusHighlighting = Selection.FocusChanged:Connect(function(p1) -- Line: 260
        Core.Selection.RecolorOutlines(Core.Selection.Color)
        if p1 then
            local v1 = #Selection.Parts
            if 1 < v1 then
                Core.Selection.RecolorOutline(p1, BrickColor.new("Deep orange"))
            end
        end
    end)
end
return u35