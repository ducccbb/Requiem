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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Surface
--                               Dumped in 0.00161 seconds
--                          Bytecode version 9  |  22 functions

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
local u68 = {
    Name = "Surface Tool",
    Surface = "All",
    Color = BrickColor.new("Bright violet"),
    OnSurfaceChanged = Signal.new(),
    OnSurfaceTypeChanged = Signal.new(),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Surface Tool  🛠</font>\nLets you change the surfaces of parts.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Click a part's surface to select it quickly.",
}
local u77 = {}
function u68.Equip() -- Line: 50 -- upvalues: u68 (val)
    ShowUI()
    EnableSurfaceSelection()
    SetSurface(u68.Surface)
end
function u68.Unequip() -- Line: 62
    HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 71 -- upvalues: u77 (val)
    for k, v in pairs(u77) do
        v:Disconnect()
        u77[k] = nil
    end
end
function ShowUI() -- Line: 81 -- upvalues: u68 (val), Roact (val), Dropdown (val), ListenForManualWindowTrigger (val)
    local u0 = u68
    if u68.UI then
        u68.UI.Visible = true
        UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
        return
    end
    u68.UI = Core.Tool.Interfaces.BTSurfaceToolGUI:Clone()
    u68.UI.Parent = Core.UI
    u68.UI.Visible = true
    local u26 = {
        "All",
        "Top",
        "Bottom",
        "Front",
        "Back",
        "Left",
        "Right",
    }
    local function BuildSurfaceDropdown() -- Line: 115 -- upvalues: Roact (upval), Dropdown (upval), u26 (val), u0 (val)
        return Roact.createElement(Dropdown, {
            MaxRows = 4,
            Position = UDim2.new(0, 30, 0, 0),
            Size = UDim2.new(0, 72, 0, 25),
            Options = u26,
            CurrentOption = u0.Surface,
            OnOptionSelected = function(p1) -- Line: 122
                SetSurface(p1)
            end,
        })
    end
    local u42 = Roact.mount(BuildSurfaceDropdown(), u0.UI.SideOption, "Dropdown")
    u0.OnSurfaceChanged:Connect(function() -- Line: 130 -- upvalues: Roact (upval), u42 (val), BuildSurfaceDropdown (val)
        Roact.update(u42, BuildSurfaceDropdown())
    end)
    local u48 = {
        "Smooth",
        "Studs",
        "Inlet",
        "Weld",
        "Hinge",
        "Motor",
        "Universal",
        "Glue",
    }
    local function BuildSurfaceTypeDropdown() -- Line: 145 -- upvalues: Roact (upval), Dropdown (upval), u48 (val), u0 (val)
        local v1 = {MaxRows = 4, Position = UDim2.new(0, 30, 0, 0), Size = UDim2.new(0, 91, 0, 25), Options = u48}
        local CurrentSurfaceType = u0.CurrentSurfaceType
        if CurrentSurfaceType then
            CurrentSurfaceType = u0.CurrentSurfaceType.Name
        end
        v1.CurrentOption = CurrentSurfaceType
        function v1.OnOptionSelected(p1) -- Line: 152
            SetSurfaceType(Enum.SurfaceType[p1])
        end
        return Roact.createElement(Dropdown, v1)
    end
    local u65 = Roact.mount(BuildSurfaceTypeDropdown(), u0.UI.TypeOption, "Dropdown")
    u0.OnSurfaceTypeChanged:Connect(function() -- Line: 160 -- upvalues: Roact (upval), u65 (val), BuildSurfaceTypeDropdown (val)
        Roact.update(u65, BuildSurfaceTypeDropdown())
    end)
    local Title = u68.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u68.ManualText, u68.Color.Color, Signature)
    UIUpdater = Support.ScheduleRecurringTask(UpdateUI, 0.1)
end
function HideUI() -- Line: 173 -- upvalues: u68 (val)
    if not u68.UI then
        return
    end
    u68.UI.Visible = false
    UIUpdater:Stop()
end
function GetSurfaceTypeDisplayName(p1) -- Line: 189
    if p1 == Enum.SurfaceType.SteppingMotor then
        return "Stepping Motor"
    end
    if p1 == Enum.SurfaceType.SmoothNoOutlines then
        return "No Outline"
    end
    return p1.Name
end
function UpdateUI() -- Line: 208 -- upvalues: u68 (val)
    local v1 = u68
    if not u68.UI then
        return
    end
    if #Selection.Parts == 0 then
        if v1.CurrentSurfaceType ~= "" then
            v1.CurrentSurfaceType = ""
            v1.OnSurfaceTypeChanged:Fire("")
        end
        return
    end
    local v2 = {}
    for k, v in pairs(Selection.Parts) do
        if u68.Surface ~= "All" then
            table.insert(v2, v[u68.Surface .. "Surface"])
        else
            table.insert(v2, v.TopSurface)
            table.insert(v2, v.BottomSurface)
            table.insert(v2, v.FrontSurface)
            table.insert(v2, v.BackSurface)
            table.insert(v2, v.LeftSurface)
            table.insert(v2, v.RightSurface)
        end
    end
    local v3 = Support.IdentifyCommonItem(v2)
    if v1.CurrentSurfaceType ~= v3 then
        v1.CurrentSurfaceType = v3
        v1.OnSurfaceTypeChanged:Fire(v3)
    end
end
function SetSurface(p1) -- Line: 261 -- upvalues: u68 (val)
    u68.Surface = p1
    u68.OnSurfaceChanged:Fire(p1)
end
function SetSurfaceType(p1) -- Line: 270 -- upvalues: u68 (val)
    if not u68.Surface then
        return
    end
    TrackChange()
    for k, v in pairs(Selection.Parts) do
        if u68.Surface ~= "All" then
            v[u68.Surface .. "Surface"] = p1
        else
            v.TopSurface = p1
            v.BottomSurface = p1
            v.FrontSurface = p1
            v.BackSurface = p1
            v.LeftSurface = p1
            v.RightSurface = p1
        end
    end
    RegisterChange()
end
function EnableSurfaceSelection() -- Line: 305 -- upvalues: u77 (val)
    u77.SurfaceSelection = Core.Mouse.Button1Down:Connect(function() -- Line: 309
        local v1
        _, v1 = Core.Targeting:UpdateTarget()
        if Selection.IsSelected(v1) then
            SetSurface(Core.Mouse.TargetSurface.Name)
        end
    end)
end
function TrackChange() -- Line: 321 -- upvalues: u68 (val)
    local v1
    local v2 = {Parts = Support.CloneTable(Selection.Parts), BeforeSurfaces = {}}
    local v3 = {}
    v2.AfterSurfaces = v3
    v2.Selection = Selection.Items
    function v2.Unapply(p1) -- Line: 330
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, Surfaces = p1.BeforeSurfaces[v]})
        end
        Core.SyncAPI:Invoke("SyncSurface", v1)
    end
    function v2.Apply(p1) -- Line: 347
        Selection.Replace(p1.Selection)
        local v1 = {}
        for k, v in pairs(p1.Parts) do
            table.insert(v1, {Part = v, Surfaces = p1.AfterSurfaces[v]})
        end
        Core.SyncAPI:Invoke("SyncSurface", v1)
    end
    HistoryRecord = v2
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.BeforeSurfaces[v] = {}
        v1 = HistoryRecord.BeforeSurfaces[v]
        if u68.Surface ~= "All" then
            v1[u68.Surface] = v[u68.Surface .. "Surface"]
        else
            v1.Top = v.TopSurface
            v1.Bottom = v.BottomSurface
            v1.Front = v.FrontSurface
            v1.Back = v.BackSurface
            v1.Left = v.LeftSurface
            v1.Right = v.RightSurface
        end
    end
end
function RegisterChange() -- Line: 391 -- upvalues: u68 (val)
    local v1
    if not HistoryRecord then
        return
    end
    local v2 = {}
    for k, v in pairs(HistoryRecord.Parts) do
        HistoryRecord.AfterSurfaces[v] = {}
        v1 = HistoryRecord.AfterSurfaces[v]
        if u68.Surface ~= "All" then
            v1[u68.Surface] = v[u68.Surface .. "Surface"]
        else
            v1.Top = v.TopSurface
            v1.Bottom = v.BottomSurface
            v1.Front = v.FrontSurface
            v1.Back = v.BackSurface
            v1.Left = v.LeftSurface
            v1.Right = v.RightSurface
        end
        table.insert(v2, {Part = v, Surfaces = v1})
    end
    Core.SyncAPI:Invoke("SyncSurface", v2)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u68