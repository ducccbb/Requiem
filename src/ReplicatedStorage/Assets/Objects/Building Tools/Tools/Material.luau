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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Material
--                               Dumped in 0.00128 seconds
--                          Bytecode version 9  |  21 functions

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
local Dropdown = require(UI:WaitForChild("Dropdown"))
local Signal = require(Libraries:WaitForChild("Signal"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u68 = {Name = "Material Tool", Color = BrickColor.new("Bright violet"), OnMaterialChanged = Signal.new(), ManualText = "<font face=\"GothamBlack\" size=\"16\">Material Tool  🛠</font>\nLets you change the material, transparency, and reflectance of parts."}
local u75 = {}
function u68.Equip(p1) -- Line: 44
    p1:ShowUI()
end
function u68.Unequip(p1) -- Line: 52
    p1:HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 61 -- upvalues: u75 (val)
    for k, v in pairs(u75) do
        v:Disconnect()
        u75[k] = nil
    end
end
local u79 = {}
u79[Enum.Material.SmoothPlastic] = "Smooth Plastic"
u79[Enum.Material.Plastic] = "Plastic"
u79[Enum.Material.Brick] = "Brick"
u79[Enum.Material.Cobblestone] = "Cobblestone"
u79[Enum.Material.Concrete] = "Concrete"
u79[Enum.Material.CorrodedMetal] = "Corroded Metal"
u79[Enum.Material.DiamondPlate] = "Diamond Plate"
u79[Enum.Material.Fabric] = "Fabric"
u79[Enum.Material.Foil] = "Foil"
u79[Enum.Material.ForceField] = "Forcefield"
u79[Enum.Material.Granite] = "Granite"
u79[Enum.Material.Grass] = "Grass"
u79[Enum.Material.Ice] = "Ice"
u79[Enum.Material.Marble] = "Marble"
u79[Enum.Material.Metal] = "Metal"
u79[Enum.Material.Neon] = "Neon"
u79[Enum.Material.Pebble] = "Pebble"
u79[Enum.Material.Sand] = "Sand"
u79[Enum.Material.Slate] = "Slate"
u79[Enum.Material.Wood] = "Wood"
u79[Enum.Material.WoodPlanks] = "Wood Planks"
u79[Enum.Material.Glass] = "Glass"
function u68:ShowUI() -- Line: 97 -- upvalues: u79 (val), Roact (val), Dropdown (val), ListenForManualWindowTrigger (val), u68 (val)
    if self.UI then
        self.UI.Visible = true
        self.StopUpdatingUI = Support.Loop(0.1, function() -- Line: 107 -- upvalues: self (val)
            self:UpdateUI()
        end)
        return
    end
    self.UI = Core.Tool.Interfaces.BTMaterialToolGUI:Clone()
    self.UI.Parent = Core.UI
    self.UI.Visible = true
    local u32 = Support.Values(u79)
    table.sort(u32)
    local function BuildMaterialDropdown() -- Line: 130 -- upvalues: Roact (upval), Dropdown (upval), u32 (val), self (val), u79 (upval)
        local v1 = {MaxRows = 6, Position = UDim2.new(0, 50, 0, 0), Size = UDim2.new(0, 130, 0, 25), Options = u32}
        local CurrentMaterial = self.CurrentMaterial
        if CurrentMaterial then
            CurrentMaterial = self.CurrentMaterial.Name
        end
        v1.CurrentOption = CurrentMaterial
        function v1.OnOptionSelected(p1) -- Line: 137 -- upvalues: u79 (upval)
            SetProperty("Material", Support.FindTableOccurrence(u79, p1))
        end
        return Roact.createElement(Dropdown, v1)
    end
    local u44 = Roact.mount(BuildMaterialDropdown(), self.UI.MaterialOption, "Dropdown")
    self.OnMaterialChanged:Connect(function() -- Line: 145 -- upvalues: Roact (upval), u44 (val), BuildMaterialDropdown (val)
        Roact.update(u44, BuildMaterialDropdown())
    end)
    SyncInputToProperty("Transparency", self.UI.TransparencyOption.Input.TextBox)
    SyncInputToProperty("Reflectance", self.UI.ReflectanceOption.Input.TextBox)
    local Title = self.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u68.ManualText, u68.Color.Color, Signature)
    self.StopUpdatingUI = Support.Loop(0.1, function() -- Line: 158 -- upvalues: self (val)
        self:UpdateUI()
    end)
end
function u68:HideUI() -- Line: 164
    if not self.UI then
        return
    end
    self.UI.Visible = false
    self.StopUpdatingUI()
end
function SyncInputToProperty(p1, p2) -- Line: 180
    p2.FocusLost:Connect(function() -- Line: 184 -- upvalues: p1 (val), p2 (val)
        SetProperty(p1, (tonumber(p2.Text)))
    end)
end
function SetProperty(p1, p2) -- Line: 190
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
function UpdateDataInputs(p1) -- Line: 216
    for k, v in pairs(p1) do
        if not (k:IsFocused()) then
            k.Text = tostring(v)
        end
    end
end
local u129 = {
    EmptySelection = {"SelectNote"},
    Normal = {"MaterialOption", "TransparencyOption", "ReflectanceOption"},
}
local u136 = {"SelectNote", "MaterialOption", "TransparencyOption", "ReflectanceOption"}
local u141 = nil
function u68:ChangeLayout(p2) -- Line: 246 -- upvalues: u141 (ref), u136 (val)
    local v1, v2, v3
    if u141 == p2 then
        return
    end
    u141 = p2
    for k, v in pairs(u136) do
        v2 = self.UI[v]
        v2.Visible = false
    end
    local v4 = 0
    for i, i2 in ipairs(p2) do
        v3 = self.UI[i2]
        v3.Visible = true
        v1 = UDim2.new(0, 0, 0, 20)
        v3.Position = v1 + UDim2.new(v3.Position.X.Scale, v3.Position.X.Offset, 0, v4 + 10)
        v4 = v4 + 10 + v3.AbsoluteSize.Y
    end
    self.UI.Size = UDim2.new(0, 200, 0, v4 + 40)
end
function u68:UpdateUI() -- Line: 292 -- upvalues: u129 (val)
    local v1
    if not self.UI then
        return
    end
    local TextBox = self.UI.TransparencyOption.Input.TextBox
    local TextBox_2 = self.UI.ReflectanceOption.Input.TextBox
    if #Selection.Parts == 0 then
        self:ChangeLayout(u129.EmptySelection)
        return
    end
    self:ChangeLayout(u129.Normal)
    local v2 = Support.IdentifyCommonProperty(Selection.Parts, "Material")
    local v3 = Support.IdentifyCommonProperty(Selection.Parts, "Transparency")
    local v4 = Support.IdentifyCommonProperty(Selection.Parts, "Reflectance")
    if self.CurrentMaterial ~= v2 then
        self.CurrentMaterial = v2
        self.OnMaterialChanged:Fire(v2)
    end
    local v5 = UpdateDataInputs
    local v6 = {}
    if not v3 then
        v1 = "*"
    else
        v1 = Support.Round(v3, 2)
    end
    v6[TextBox] = v1
    if not v4 then
        v1 = "*"
    else
        v1 = Support.Round(v4, 2)
        if not v1 then
            v1 = "*"
        end
    end
    v6[TextBox_2] = v1
    v5(v6)
end
function TrackChange() -- Line: 337
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 345
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncMaterial", p1.Before)
        end,
        Apply = function(p1) -- Line: 356
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncMaterial", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 371
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncMaterial", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u68