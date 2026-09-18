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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Texture
--                               Dumped in 0.00227 seconds
--                          Bytecode version 9  |  40 functions

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
    Name = "Texture Tool",
    Type = "Decal",
    Color = BrickColor.new("Bright violet"),
    Face = Enum.NormalId.Front,
    OnFaceChanged = Signal.new(),
    ManualText = "<font face=\"GothamBlack\" size=\"16\">Texture Tool  🛠</font>\nLets you add decals and textures to parts.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>Click on any part's surface to quickly change a decal/texture's side.<font size=\"6\"><br /></font>\n\n<b>TIP: </b>You can paste the link to any decal and it'll automatically get the right image ID.<font size=\"6\"><br /></font>\n\n<b>NOTE: </b>If HttpService isn't enabled, you must manually type an image's ID.",
}
local u76 = {}
function u68.Equip(p1) -- Line: 51
    p1:ShowUI()
    p1:EnableSurfaceClickSelection()
    p1:SetTextureType(p1.Type)
    p1:SetFace(p1.Face)
end
function u68.Unequip(p1) -- Line: 64
    p1:HideUI()
    ClearConnections()
end
function ClearConnections() -- Line: 73 -- upvalues: u76 (val)
    for k, v in pairs(u76) do
        v:Disconnect()
        u76[k] = nil
    end
end
function u68:ShowUI() -- Line: 83 -- upvalues: Roact (val), Dropdown (val), u68 (val), ListenForManualWindowTrigger (val)
    if self.UI then
        self.UI.Visible = true
        self.StopUpdatingUI = Support.Loop(0.1, function() -- Line: 93 -- upvalues: self (val)
            self:UpdateUI()
        end)
        return
    end
    self.UI = Core.Tool.Interfaces.BTTextureToolGUI:Clone()
    self.UI.Parent = Core.UI
    self.UI.Visible = true
    local TextBox = self.UI.ImageIDOption.TextBox
    self.UI.ModeOption.Decal.Button.MouseButton1Click:Connect(function() -- Line: 118 -- upvalues: self (val)
        self:SetTextureType("Decal")
    end)
    self.UI.ModeOption.Texture.Button.MouseButton1Click:Connect(function() -- Line: 121 -- upvalues: self (val)
        self:SetTextureType("Texture")
    end)
    local u58 = {
        "Top",
        "Bottom",
        "Front",
        "Back",
        "Left",
        "Right",
    }
    local function BuildFaceDropdown() -- Line: 134 -- upvalues: Roact (upval), Dropdown (upval), u58 (val), self (val)
        local v1 = {MaxRows = 6, Position = UDim2.new(0, 30, 0, 0), Size = UDim2.new(1, -45, 0, 25), Options = u58}
        local Face = self.Face
        if Face then
            Face = self.Face.Name
        end
        v1.CurrentOption = Face
        function v1.OnOptionSelected(p1) -- Line: 141 -- upvalues: self (upval)
            self:SetFace(Enum.NormalId[p1])
        end
        return Roact.createElement(Dropdown, v1)
    end
    local u73 = Roact.mount(BuildFaceDropdown(), self.UI.SideOption, "Dropdown")
    self.OnFaceChanged:Connect(function() -- Line: 149 -- upvalues: Roact (upval), u73 (val), BuildFaceDropdown (val)
        Roact.update(u73, BuildFaceDropdown())
    end)
    TextBox.FocusLost:Connect(function(p1) -- Line: 154 -- upvalues: u68 (upval), TextBox (val)
        SetTextureId(u68.Type, u68.Face, ParseAssetId(TextBox.Text))
    end)
    SyncInputToProperty("Transparency", self.UI.TransparencyOption.Input.TextBox)
    SyncInputToProperty("StudsPerTileU", self.UI.RepeatOption.XInput.TextBox)
    SyncInputToProperty("StudsPerTileV", self.UI.RepeatOption.YInput.TextBox)
    self.UI.AddButton.Button.MouseButton1Click:Connect(function() -- Line: 164 -- upvalues: u68 (upval)
        AddTextures(u68.Type, u68.Face)
    end)
    self.UI.RemoveButton.Button.MouseButton1Click:Connect(function() -- Line: 167 -- upvalues: u68 (upval)
        RemoveTextures(u68.Type, u68.Face)
    end)
    local Title = self.UI:WaitForChild("Title")
    local Signature = Title:WaitForChild("Signature")
    ListenForManualWindowTrigger(u68.ManualText, u68.Color.Color, Signature)
    self.StopUpdatingUI = Support.Loop(0.1, function() -- Line: 176 -- upvalues: self (val)
        self:UpdateUI()
    end)
end
function SyncInputToProperty(p1, p2) -- Line: 182 -- upvalues: u68 (val)
    p2.FocusLost:Connect(function() -- Line: 186 -- upvalues: u68 (upval), p1 (val), p2 (val)
        SetProperty(u68.Type, u68.Face, p1, (tonumber(p2.Text)))
    end)
end
function u68.EnableSurfaceClickSelection(p1) -- Line: 192 -- upvalues: u76 (val)
    if u76.SurfaceClickSelection then
        u76.SurfaceClickSelection:Disconnect()
        u76.SurfaceClickSelection = nil
    end
    u76.SurfaceClickSelection = Core.Mouse.Button1Down:Connect(function() -- Line: 202 -- upvalues: p1 (val)
        local v1
        _, v1 = Core.Targeting:UpdateTarget()
        if Selection.IsSelected(v1) then
            p1:SetFace(Core.Mouse.TargetSurface)
        end
    end)
end
function u68:HideUI() -- Line: 211
    if not self.UI then
        return
    end
    self.UI.Visible = false
    self.StopUpdatingUI()
end
function GetTextures(p1, p2) -- Line: 227
    local v1 = {}
    for k, v in pairs(Selection.Parts) do
        for k2, i in pairs(v:GetChildren()) do
            if i.ClassName == v2 and i.Face == v3 then
                table.insert(v1, i)
            end
        end
    end
    return v1
end
local v2 = {"Decal", "Texture"}
local u88 = {
    EmptySelection = {"SelectNote"},
    NoTextures = {"ModeOption", "SideOption", "AddButton"},
    SomeDecals = {
        "ModeOption",
        "SideOption",
        "ImageIDOption",
        "TransparencyOption",
        "AddButton",
        "RemoveButton",
    },
    AllDecals = {
        "ModeOption",
        "SideOption",
        "ImageIDOption",
        "TransparencyOption",
        "RemoveButton",
    },
    SomeTextures = {
        "ModeOption",
        "SideOption",
        "ImageIDOption",
        "TransparencyOption",
        "RepeatOption",
        "AddButton",
        "RemoveButton",
    },
}
local v3 = {
    "ModeOption",
    "SideOption",
    "ImageIDOption",
    "TransparencyOption",
    "RepeatOption",
    "RemoveButton",
}
u88.AllTextures = v3
local u123 = {
    "SelectNote",
    "ModeOption",
    "SideOption",
    "ImageIDOption",
    "TransparencyOption",
    "RepeatOption",
    "AddButton",
    "RemoveButton",
}
local u132 = nil
function u68:ChangeLayout(p2) -- Line: 268 -- upvalues: u132 (ref), u123 (val)
    local v1, v2, v3
    if u132 == p2 then
        return
    end
    u132 = p2
    for k, v in pairs(u123) do
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
    self.UI.Size = UDim2.new(0, 200, 0, v4 + 30)
end
function u68:UpdateUI() -- Line: 314 -- upvalues: u68 (val), u88 (val)
    local v1
    if not self.UI then
        return
    end
    local v2 = GetTextures(u68.Type, u68.Face)
    local TextBox = self.UI.ImageIDOption.TextBox
    local TextBox_2 = self.UI.TransparencyOption.Input.TextBox
    local v3 = u68.Type .. "s"
    if #Selection.Parts == 0 then
        self:ChangeLayout(u88.EmptySelection)
        return
    end
    if #v2 == 0 then
        self:ChangeLayout(u88.NoTextures)
        return
    end
    local v4 = #Selection.Parts
    if v4 == #v2 then
        v4 = #Selection.Parts
        if v4 == #v2 then
            self:ChangeLayout(u88["All" .. v3])
        end
    else
        self:ChangeLayout(u88["Some" .. v3])
    end
    v4 = Support.IdentifyCommonProperty(v2, "Texture")
    local v5 = Support.IdentifyCommonProperty(v2, "Transparency")
    local v6 = UpdateDataInputs
    local v7 = {}
    if not v4 then
        v1 = v4
        if not v1 then
            v1 = "*"
        end
    else
        v1 = ParseAssetId(v4)
    end
    v7[TextBox] = v1
    if not v5 then
        v1 = "*"
    else
        v1 = Support.Round(v5, 3)
    end
    v7[TextBox_2] = v1
    v6(v7)
    if u68.Type == "Texture" then
        local v8
        local TextBox_3 = self.UI.RepeatOption.XInput.TextBox
        local TextBox_4 = self.UI.RepeatOption.YInput.TextBox
        v1 = Support.IdentifyCommonProperty(v2, "StudsPerTileU")
        local v9 = Support.IdentifyCommonProperty(v2, "StudsPerTileV")
        local v10 = UpdateDataInputs
        local v11 = {}
        if not v1 then
            v8 = "*"
        else
            v8 = Support.Round(v1, 3)
        end
        v11[TextBox_3] = v8
        if not v9 then
            v8 = "*"
        else
            v8 = Support.Round(v9, 3)
            if not v8 then
                v8 = "*"
            end
        end
        v11[TextBox_4] = v8
        v10(v11)
    end
end
function UpdateDataInputs(p1) -- Line: 390
    for k, v in pairs(p1) do
        if not (k:IsFocused()) then
            k.Text = tostring(v)
        end
    end
end
function ParseAssetId(self) -- Line: 408
    local v1 = tonumber(self)
    if not v1 then
        v1 = tonumber(self:lower():match("%?id=([0-9]+)"))
        if not v1 then
            v1 = tonumber(self:match("/([0-9]+)/"))
            if not v1 then
                v1 = tonumber(self:lower():match("rbxassetid://([0-9]+)"))
            end
        end
    end
    return v1
end
function u68:SetFace(p2) -- Line: 421
    self.Face = p2
    self.OnFaceChanged:Fire(p2)
end
function u68:SetTextureType(p2) -- Line: 426
    self.Type = p2
    Core.ToggleSwitch(p2, self.UI.ModeOption)
    self.UI.AddButton.Button.Text = "ADD " .. p2:upper()
    self.UI.RemoveButton.Button.Text = "REMOVE " .. p2:upper()
end
function SetProperty(p1, p2, p3, p4) -- Line: 438
    local v1
    if not p4 then
        return
    end
    TrackChange()
    for k, v in pairs(GetTextures(p1, p2)) do
        v1 = {Part = v.Parent, TextureType = p1, Face = p2}
        v1[p3] = v[p3]
        table.insert(HistoryRecord.Before, v1)
        v1 = {Part = v.Parent, TextureType = p1, Face = p2}
        v1[p3] = p4
        table.insert(HistoryRecord.After, v1)
    end
    RegisterChange()
end
function SetTextureId(p1, p2, p3) -- Line: 464
    local v1, v2, v3, v4
    if not p3 then
        return
    end
    local u73 = {Texture = "rbxassetid://" .. p3}
    local v5 = Core.Try(Core.SyncAPI.Invoke, Core.SyncAPI, "ExtractImageFromDecal", p3)
    v5:Then(function(p1) -- Line: 479 -- upvalues: u73 (val)
        u73.Texture = "rbxassetid://" .. p1
    end)
    TrackChange()
    v1, v2 = p1, p2
    for k, v in pairs(GetTextures(p1, p2)) do
        v4 = {Part = v.Parent, TextureType = v1, Face = v2}
        v3 = {Part = v.Parent, TextureType = v1, Face = v2}
        for k2, i in pairs(u73) do
            v4[k2] = v[k2]
            v3[k2] = i
        end
        table.insert(HistoryRecord.Before, v4)
        table.insert(HistoryRecord.After, v3)
    end
    RegisterChange()
end
function AddTextures(p1, p2) -- Line: 511
    local v1
    local v2 = {}
    for k, v in pairs(Selection.Parts) do
        v1 = nil
        for k2, i in pairs(v:GetChildren()) do
            if i.ClassName == v3 and i.Face == v4 then
                v1 = true
            end
        end
        if not v1 then
            table.insert(v2, {Part = v, TextureType = v3, Face = v4})
        end
    end
    local v5 = Core.SyncAPI:Invoke("CreateTextures", v2)
    Core.History.Add({
        Textures = v5,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 542
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Textures)
        end,
        Apply = function(p1) -- Line: 553
            Core.SyncAPI:Invoke("UndoRemove", p1.Textures)
            Selection.Replace(p1.Selection)
        end,
    })
end
function RemoveTextures(p1, p2) -- Line: 571
    local v1 = GetTextures(p1, p2)
    local v2 = {
        Textures = v1,
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 581
            Core.SyncAPI:Invoke("UndoRemove", p1.Textures)
            Selection.Replace(p1.Selection)
        end,
        Apply = function(p1) -- Line: 592
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("Remove", p1.Textures)
        end,
    }
    Core.SyncAPI:Invoke("Remove", v1)
    Core.History.Add(v2)
end
function TrackChange() -- Line: 613
    HistoryRecord = {
        Before = {},
        After = {},
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 621
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncTexture", p1.Before)
        end,
        Apply = function(p1) -- Line: 632
            Selection.Replace(p1.Selection)
            Core.SyncAPI:Invoke("SyncTexture", p1.After)
        end,
    }
end
function RegisterChange() -- Line: 647
    if not HistoryRecord then
        return
    end
    Core.SyncAPI:Invoke("SyncTexture", HistoryRecord.After)
    Core.History.Add(HistoryRecord)
    HistoryRecord = nil
end
return u68