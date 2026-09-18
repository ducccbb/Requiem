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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.NewPart
--                              Dumped in 0.000821 seconds
--                          Bytecode version 9  |  15 functions

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
local ContextActionService = game:GetService("ContextActionService")
local ListenForManualWindowTrigger = require(Tool.Core:WaitForChild("ListenForManualWindowTrigger"))
local Roact = require(Vendor:WaitForChild("Roact"))
local Dropdown = require(UI:WaitForChild("Dropdown"))
local Signal = require(Libraries:WaitForChild("Signal"))
Selection = Core.Selection
Support = Core.Support
Security = Core.Security
Support.ImportServices()
local u73 = {
    Name = "New Part Tool",
    Type = "Normal",
    Color = BrickColor.new("Really black"),
    OnTypeChanged = Signal.new(),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">New Part Tool  🛠</font>\nLets you create new parts.<font size=\"6\"><br /></font>\n\n<b>TIP:</b> Click and drag where you want your part to be.",
}
local u80 = {}
function u73.Equip(p1) -- Line: 49 -- upvalues: u73 (val)
    p1:ShowUI()
    EnableClickCreation()
    p1:SetType(u73.Type)
end
function u73.Unequip(p1) -- Line: 61 -- upvalues: ContextActionService (val)
    p1:HideUI()
    ClearConnections()
    ContextActionService:UnbindAction("BT: Create part")
end
function ClearConnections() -- Line: 71 -- upvalues: u80 (val)
    for k, v in pairs(u80) do
        v:Disconnect()
        u80[k] = nil
    end
end
function u73:ShowUI() -- Line: 81 -- upvalues: Roact (val), Dropdown (val), ListenForManualWindowTrigger (val), u73 (val)
    if self.UI then
        self.UI.Visible = true
        return
    end
    self.UI = Core.Tool.Interfaces.BTNewPartToolGUI:Clone()
    self.UI.Parent = Core.UI
    self.UI.Visible = true
    Types = {
        "Normal",
        "Truss",
        "Wedge",
        "Corner",
        "Cylinder",
        "Ball",
        "Seat",
        "Vehicle Seat",
        "Spawn",
    }
    local function BuildTypeDropdown() -- Line: 114 -- upvalues: Roact (upval), Dropdown (upval), self (val)
        return Roact.createElement(Dropdown, {
            MaxRows = 5,
            Position = UDim2.new(0, 70, 0, 0),
            Size = UDim2.new(0, 140, 0, 25),
            Options = Types,
            CurrentOption = self.Type,
            OnOptionSelected = function(p1) -- Line: 121 -- upvalues: self (upval)
                self:SetType(p1)
            end,
        })
    end
    local u34 = Roact.mount(BuildTypeDropdown(), self.UI.TypeOption, "Dropdown")
    self.OnTypeChanged:Connect(function() -- Line: 129 -- upvalues: Roact (upval), u34 (val), BuildTypeDropdown (val)
        Roact.update(u34, BuildTypeDropdown())
    end)
    local Title = self.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u73.ManualText, u73.Color.Color, Signature)
end
function u73:HideUI() -- Line: 138
    if not self.UI then
        return
    end
    self.UI.Visible = false
end
function u73:SetType(p2) -- Line: 151
    if self.Type ~= p2 then
        self.Type = p2
        self.OnTypeChanged:Fire(p2)
    end
end
function EnableClickCreation() -- Line: 158 -- upvalues: u73 (val), ContextActionService (val)
    ContextActionService:BindAction("BT: Create part", function(p1, p2, p3) -- Line: 161 -- upvalues: u73 (upval)
        if p2.Name ~= "Begin" then
            if p2.Name == "End" then
                DragNewParts = nil
            end
            return
        end
        DragNewParts = true
        Core.Targeting.CancelSelecting()
        CreatePart(u73.Type)
    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch)
end
function CreatePart(p1) -- Line: 186
    local v1 = CFrame.new(Core.Mouse.Hit.p)
    local v2 = Core.SyncAPI:Invoke("CreatePart", p1, v1, Core.Targeting.Scope)
    if not v2 then
        return
    end
    Core.History.Add({
        Part = v2,
        Unapply = function(p1) -- Line: 200
            Core.SyncAPI:Invoke("Remove", {p1.Part})
        end,
        Apply = function(p1) -- Line: 208
            Core.SyncAPI:Invoke("UndoRemove", {p1.Part})
        end,
    })
    Selection.Replace({v2})
    local Move = require(Core.Tool.Tools.Move)
    Core.EquipTool(Move)
    if DragNewParts then
        Move.FreeDragging:SetUpDragging(v2)
    end
end
return u73