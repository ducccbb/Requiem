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
--              File: ReplicatedStorage.Assets.Objects.Building Tools.Core
--                               Dumped in 0.00428 seconds
--                          Bytecode version 9  |  60 functions

local Parent, UI, v1, v2, v3
local u0 = script
script = nil
local v4 = getfenv(0)
v4.script = nil
_G.script = nil
v4 = getfenv(0)
v4.getfenv = nil
local u14 = getfenv(0)
Tool = u0.Parent
if not (Tool.Parent:IsA("Plugin")) then
    Parent = nil
else
    Parent = Tool.Parent
end
Plugin = Parent
if not Plugin then
    v3 = "Tool"
else
    v3 = "Plugin"
end
Mode = v3
local Loaded = Tool:WaitForChild("Loaded")
while not Loaded.Value do
    Loaded.Changed:Wait()
end
Security = require(u0.Security)
History = require(u0.History)
Selection = require(u0.Selection)
Targeting = require(u0.Targeting)
Region = require(Tool.Libraries.Region)
Signal = require(Tool.Libraries.Signal)
Support = require(Tool.Libraries.SupportLibrary)
Try = require(Tool.Libraries.Try)
Make = require(Tool.Libraries.Make)
local Roact = require(Tool.Vendor:WaitForChild("Roact"))
local Maid = require(Tool.Libraries:WaitForChild("Maid"))
local Cryo = require(Tool.Libraries:WaitForChild("Cryo"))
Support.ImportServices()
SyncAPI = Tool.SyncAPI
Player = Players.LocalPlayer
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
Assets = require(Tool.Assets)
ToolChanged = Signal.new()
function EquipTool(p1) -- Line: 50
    if CurrentTool and CurrentTool.Equipped then
        CurrentTool:Unequip()
        CurrentTool.Equipped = false
    end
    CurrentTool = p1
    CurrentTool.Equipped = true
    ToolChanged:Fire(p1)
    p1:Equip()
end
function RecolorHandle(p1) end
ToolChanged:Connect(function(p1) -- Line: 76
    local v1 = coroutine.wrap(RecolorHandle)
    v1(p1.Color)
    v1 = coroutine.wrap(Selection.RecolorOutlines)
    v1(p1.Color)
end)
Hotkeys = {}
function AssignHotkey(p1, p2) -- Line: 84
    local v1
    if type(p1) == "userdata" then
        v1 = {p1}
    elseif type(p1) == "string" then
        v1 = {Enum.KeyCode[p1]}
    elseif type(p1) ~= "table" then
        v1 = p1
    else
        for i, v in ipairs(p1) do
            if type(v) == "string" then
                p1[i] = Enum.KeyCode[v]
            end
        end
    end
    table.insert(Hotkeys, {Keys = v1, Callback = p2})
end
function EnableHotkeys() -- Line: 109
    Connections.Hotkeys = Support.AddUserInputListener("Began", "Keyboard", false, function(p1) -- Line: 113
        local v1, v2
        local KeysPressed = UserInputService:GetKeysPressed()
        local v3 = Support.GetListMembers(KeysPressed, "KeyCode")
        local v4 = {}
        local v5 = Support.FlipTable({
            "LeftAlt",
            "W",
            "S",
            "A",
            "D",
            "Space",
        })
        for i, v in ipairs(v3) do
            if not (v5[v.Name]) then
                table.insert(v4, v)
            end
        end
        local v6 = #v4
        table.sort(Hotkeys, function(p1, p2) -- Line: 129
            local v1 = #p1.Keys
            if #p2.Keys < v1 then
                return true
            end
        end)
        for i2, i3 in ipairs(Hotkeys) do
            if v6 == #i3.Keys then
                v1 = Support.FlipTable(i3.Keys)
                v2 = 0
                for k, j in pairs(v4) do
                    if v1[j] then
                        v2 = v2 + 1
                    end
                end
                if v2 == v6 then
                    i3.Callback()
                    return
                end
            end
        end
    end)
end
Enabling = Signal.new()
Disabling = Signal.new()
Enabled = Signal.new()
Disabled = Signal.new()
function Enable(p1) -- Line: 167 -- upvalues: u14 (val), Roact (val), RunService (val)
    if not IsEnabled then
        local UI, u75, v1
        if IsEnabling then
            return
        end
        if IsDisabling then
            Disabled:Wait()
            return Enable(p1)
        end
        IsEnabling = true
        Enabling:Fire()
        getfenv(0).Mouse = p1
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        if Mode == "Tool" then
            coroutine.resume(coroutine.create(function() -- Line: 191
                SyncAPI:Invoke("SetMouseLockEnabled", false)
            end))
        end
        while not UI do
            wait(0.1)
        end
        UI.Parent = UIContainer
        if not u14.StartupNotificationsDisplayed then
            UI = Tool:WaitForChild("UI")
            local Notifications = require(UI:WaitForChild("Notifications"))
            v1 = Roact.createElement(Notifications, {Core = u14})
            Roact.mount(v1, UI, "Notifications")
            u14.StartupNotificationsDisplayed = true
        end
        EnableHotkeys()
        Targeting:EnableTargeting()
        Selection.EnableOutlines()
        Selection.EnableMultiselectionHotkeys()
        if Mode == "Plugin" then
            u75 = nil
            Connections.StudioSelectionListener = SelectionService.SelectionChanged:Connect(function() -- Line: 223 -- upvalues: u75 (ref), RunService (upval)
                local v1 = {}
                u75 = v1
                RunService.Heartbeat:Wait()
                if u75 == v1 then
                    local v2 = SelectionService:Get()
                    Selection.Replace(v2, false)
                end
            end)
        end
        u75 = EquipTool
        local Move = CurrentTool
        if not Move then
            Move = require(Tool.Tools.Move)
        end
        u75(Move)
        IsEnabled = true
        IsEnabling = false
        Enabled:Fire()
        return
    elseif not IsDisabling then
        return
    end
end
function Disable() -- Line: 245 -- upvalues: u0 (val)
    if IsEnabled then
        if IsDisabling then
            return
        end
        if IsEnabling then
            Enabled:Wait()
            return Disable()
        end
        IsDisabling = true
        Disabling:Fire()
        if Mode == "Tool" then
            coroutine.resume(coroutine.create(function() -- Line: 263
                SyncAPI:Invoke("SetMouseLockEnabled", true)
            end))
        end
        if UI then
            UI.Parent = u0
        end
        if CurrentTool then
            CurrentTool:Unequip()
            CurrentTool.Equipped = false
        end
        ClearConnections()
        IsEnabled = false
        IsDisabling = false
        Disabled:Fire()
        return
    elseif not IsEnabling then
        return
    end
end
local v5 = {}
Connections = v5
function ClearConnections() -- Line: 293
    for k, v in pairs(Connections) do
        v:Disconnect()
        Connections[k] = nil
    end
end
function InitializeUI() -- Line: 301 -- upvalues: Roact (val), u14 (val), Cryo (val), Maid (val)
    local UI
    if UI then
        return
    end
    UI = Instance.new("ScreenGui")
    UI.Name = "Building Tools by F3X (UI)"
    local u6 = {}
    UI = Tool:WaitForChild("UI")
    local Dock = require(UI:WaitForChild("Dock"))
    local v1 = Roact.createElement(Dock, {Core = u14, Tools = u6})
    local u29 = Roact.mount(v1, UI, "Dock")
    function u14.AddToolButton(p1, p2, p3) -- Line: 323 -- upvalues: u6 (val), Roact (upval), u29 (val), Dock (val), u14 (upval), Cryo (upval)
        table.insert(u6, {IconAssetId = p1, HotkeyLabel = p2, Tool = p3})
        Roact.update(u29, Roact.createElement(Dock, {Core = u14, Tools = Cryo.List.join(u6)}))
    end
    UIMaid = Maid.new()
    Tool.AncestryChanged:Connect(function(p1, p2) -- Line: 340
        if p2 == nil then
            UIMaid:Destroy()
        end
    end)
end
UI = Tool:WaitForChild("UI")
local Explorer = require(UI:WaitForChild("Explorer"))
u14.ExplorerVisibilityChanged = Signal.new()
u14.ExplorerVisible = false
function ToggleExplorer() -- Line: 352 -- upvalues: u14 (val)
    if not u14.ExplorerVisible then
        OpenExplorer()
        return
    end
    CloseExplorer()
end
function OpenExplorer() -- Line: 360 -- upvalues: Roact (val), Explorer (val), u14 (val)
    if ExplorerHandle then
        return
    end
    Explorer = Roact.createElement(Explorer, {Core = getfenv(0), Close = CloseExplorer, Scope = Targeting.Scope})
    ExplorerHandle = Roact.mount(Explorer, UI, "Explorer")
    u14.ExplorerVisible = true
    UIMaid.Explorer = Support.Call(Roact.unmount, ExplorerHandle)
    UIMaid.ExplorerScope = Targeting.ScopeChanged:Connect(function(p1) -- Line: 380 -- upvalues: Roact (upval), Explorer (upval)
        local v1 = Support.Merge({}, Explorer.props, {Scope = p1})
        local v2 = Roact.createElement(Explorer, v1)
        ExplorerHandle = Roact.update(ExplorerHandle, v2)
    end)
    u14.ExplorerVisibilityChanged:Fire()
end
function CloseExplorer() -- Line: 390 -- upvalues: u14 (val)
    UIMaid.Explorer = nil
    UIMaid.ExplorerScope = nil
    ExplorerHandle = nil
    u14.ExplorerVisible = false
    u14.ExplorerVisibilityChanged:Fire()
end
coroutine.wrap(function() -- Line: 403 -- upvalues: UI (val), Roact (val)
    Enabled:Wait()
    local ScopeHUD = require(UI:WaitForChild("ScopeHUD"))
    local v1 = Roact.createElement(ScopeHUD, {Core = getfenv(0)})
    Roact.mount(v1, UI, "ScopeHUD")
end)()
AssignHotkey({"LeftShift", "H"}, ToggleExplorer)
AssignHotkey({"RightShift", "H"}, ToggleExplorer)
if Mode == "Plugin" then
    UIContainer = CoreGui
    v1 = Plugin:CreateToolbar("Building Tools by F3X")
    PluginButton = v1:CreateButton("Building Tools by F3X", "Building Tools by F3X", Assets.PluginIcon)
    PluginButton.Click:Connect(function() -- Line: 434
        PluginEnabled = not PluginEnabled
        PluginButton:SetActive(PluginEnabled)
        if not PluginEnabled then
            Disable()
            return
        end
        Plugin:Activate(true)
        Enable(Plugin:GetMouse())
    end)
    Plugin.Deactivation:Connect(Disable)
    Selection.Changed:Connect(function() -- Line: 451
        SelectionService:Set(Selection.Items)
    end)
    Enabling:Connect(function() -- Line: 456
        Selection.Replace(SelectionService:Get())
    end)
    History.Changed:Connect(function() -- Line: 461
        ChangeHistoryService:SetWaypoint("Building Tools by F3X")
    end)
    Plugin:CreatePluginAction("F3X/ToggleBuildingTools", "Toggle Building Tools", "Toggles the Building Tools by F3X plugin.", Assets.PluginIcon, true).Triggered:Connect(function() -- Line: 473
        PluginEnabled = not PluginEnabled
        PluginButton:SetActive(PluginEnabled)
        if not PluginEnabled then
            Disable()
            return
        end
        Plugin:Activate(true)
        Enable(Plugin:GetMouse())
    end)
elseif Mode == "Tool" then
    UIContainer = Player:WaitForChild("PlayerGui")
    Tool.Equipped:Connect(Enable)
    Tool.Unequipped:Connect(Disable)
    if not Tool.Parent then
        Disable()
    end
    Tool.AncestryChanged:Connect(function(p1, p2) -- Line: 501
        if not p2 then
            Disable()
        elseif not (p2:IsA("Backpack")) then
            if not (p2:IsA("Model")) then
                Disable()
            elseif not (Players:GetPlayerFromCharacter(p2)) then
                Disable()
            end
        end
    end)
end
AssignHotkey({"LeftShift", "Z"}, History.Undo)
AssignHotkey({"RightShift", "Z"}, History.Undo)
AssignHotkey({"LeftShift", "Y"}, History.Redo)
v2 = {"RightShift", "Y"}
AssignHotkey(v2, History.Redo)
if Mode == "Tool" then
    AssignHotkey({"LeftControl", "Z"}, History.Undo)
    AssignHotkey({"RightControl", "Z"}, History.Undo)
    AssignHotkey({"LeftControl", "Y"}, History.Redo)
    AssignHotkey({"RightControl", "Y"}, History.Redo)
end
local function GetDepthFromAncestor(p1, p2) -- Line: 525
    local v1 = 0
    local Parent = p1
    while Parent ~= p2 do
        v1 = v1 + 1
        Parent = Parent.Parent
    end
    return v1
end
local function GetHighestParent(p1) -- Line: 540 -- upvalues: GetDepthFromAncestor (val)
    local Parent, v1
    local v2 = nil
    local v3 = nil
    for i, v in ipairs(p1) do
        v1 = GetDepthFromAncestor(v, game)
        if not v3 then
            v2 = v
            v3 = v1
        elseif v1 >= v3 then
        end
    end
    if not v2 then
        Parent = nil
    else
        Parent = v2.Parent
        if not Parent then
            Parent = nil
        end
    end
    return Parent
end
function CloneSelection() -- Line: 556 -- upvalues: GetHighestParent (val), CollectionService (val)
    local Items, u14, u15, u16
    if #Selection.Items == 0 then
        return
    end
    u16, u14, u15 = SyncAPI:Invoke("Clone", Selection.Items, GetHighestParent(Selection.Items))
    if u16 == nil then
        u16 = {}
        for i, j in CollectionService:GetTagged("BTStreamingClone") do
            if j:GetAttribute("BTStreamingCloneID") == u14 then
                table.insert(u16, j)
            end
        end
        if #u16 < u15 then
            local u35 = coroutine.running()
            local u39 = task.delay(3, function() -- Line: 584 -- upvalues: u16 (ref), u15 (val), u35 (val)
                local v1 = #u16
                warn((("[Building Tools by F3X] Cloning operation only received %*/%* items after %* seconds, ignoring rest"):format(v1, u15, 3)))
                coroutine.resume(u35)
            end)
            local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("BTStreamingClone")
            local v1 = InstanceAddedSignal:Connect(function(p1) -- Line: 590 -- upvalues: u14 (val), u16 (ref), u15 (val), u39 (val), u35 (val)
                local Attribute = p1:GetAttribute("BTStreamingCloneID")
                if Attribute == u14 then
                    table.insert(u16, p1)
                    local v1 = #u16
                    if v1 == u15 then
                        task.cancel(u39)
                        coroutine.resume(u35)
                    end
                end
            end)
            coroutine.yield()
            v1:Disconnect()
        end
    end
    History.Add({
        Clones = u16,
        Unapply = function(p1) -- Line: 612
            Selection.Remove(p1.Clones, false)
            SyncAPI:Invoke("Remove", p1.Clones)
        end,
        Apply = function(self) -- Line: 623
            SyncAPI:Invoke("UndoRemove", self.Clones)
            Selection.Replace(self.Clones)
        end,
    })
    Selection.Replace(u16)
    coroutine.wrap(Selection.FlashOutlines)()
end
function DeleteSelection() -- Line: 647
    local v1 = {
        Parts = Support.CloneTable(Selection.Items),
        Unapply = function(p1) -- Line: 654
            SyncAPI:Invoke("UndoRemove", p1.Parts)
            Selection.Replace(p1.Parts)
        end,
        Apply = function(self) -- Line: 665
            Selection.Remove(self.Parts, false)
            SyncAPI:Invoke("Remove", self.Parts)
        end,
    }
    Selection.Remove(v1.Parts, false)
    SyncAPI:Invoke("Remove", v1.Parts)
    History.Add(v1)
end
AssignHotkey({"LeftShift", "C"}, CloneSelection)
AssignHotkey({"RightShift", "C"}, CloneSelection)
AssignHotkey({"LeftShift", "X"}, DeleteSelection)
AssignHotkey({"RightShift", "X"}, DeleteSelection)
if Mode == "Tool" then
    AssignHotkey({"LeftControl", "C"}, CloneSelection)
    AssignHotkey({"RightControl", "C"}, CloneSelection)
    AssignHotkey({"LeftControl", "X"}, DeleteSelection)
    AssignHotkey({"RightControl", "X"}, DeleteSelection)
end
AssignHotkey({"LeftShift", "K"}, Targeting.PrismSelect)
AssignHotkey({"RightShift", "K"}, Targeting.PrismSelect)
if Mode == "Tool" then
    AssignHotkey({"LeftControl", "K"}, Targeting.PrismSelect)
    AssignHotkey({"RightControl", "K"}, Targeting.PrismSelect)
end
AssignHotkey({"LeftBracket"}, Support.Call(Targeting.SelectSiblings, false, true))
AssignHotkey({"LeftShift", "LeftBracket"}, Support.Call(Targeting.SelectSiblings, false, false))
AssignHotkey({"RightShift", "LeftBracket"}, Support.Call(Targeting.SelectSiblings, false, false))
AssignHotkey({"LeftShift", "R"}, Support.Call(Selection.Clear, true))
AssignHotkey({"RightShift", "R"}, Support.Call(Selection.Clear, true))
if Mode == "Tool" then
    AssignHotkey({"LeftControl", "LeftBracket"}, Support.Call(Targeting.SelectSiblings, false, false))
    AssignHotkey({"RightControl", "LeftBracket"}, Support.Call(Targeting.SelectSiblings, false, false))
    AssignHotkey({"LeftControl", "R"}, Support.Call(Selection.Clear, true))
    AssignHotkey({"RightControl", "R"}, Support.Call(Selection.Clear, true))
end
function GroupSelection(p1) -- Line: 732 -- upvalues: GetHighestParent (val)
    local v1 = {
        Items = Support.CloneTable(Selection.Items),
        CurrentParents = Support.GetListMembers(Selection.Items, "Parent"),
        Unapply = function(p1) -- Line: 741
            SyncAPI:Invoke("SetParent", p1.Items, p1.CurrentParents)
            SyncAPI:Invoke("Remove", {p1.NewParent})
            Selection.Replace(p1.Items)
        end,
        Apply = function(self) -- Line: 747
            SyncAPI:Invoke("UndoRemove", {self.NewParent})
            SyncAPI:Invoke("SetParent", self.Items, self.NewParent)
            Selection.Replace({self.NewParent})
        end,
    }
    local v2 = GetHighestParent(v1.Items)
    v1.NewParent = SyncAPI:Invoke("CreateGroup", p1, v2, v1.Items)
    History.Add(v1)
    Selection.Replace({v1.NewParent})
end
function UngroupSelection() -- Line: 767
    local v1 = {
        Selection = Selection.Items,
        Unapply = function(p1) -- Line: 775
            SyncAPI:Invoke("UndoRemove", p1.Groups)
            for i, v in ipairs(p1.GroupChildren) do
                coroutine.resume(coroutine.create(function() -- Line: 780 -- upvalues: v (val), p1 (val), i (val)
                    SyncAPI:Invoke("SetParent", v, p1.Groups[i])
                end))
            end
            Selection.Replace(p1.Selection)
        end,
    }
    function v1:Apply() -- Line: 789
        self.Groups = {}
        local v1 = self
        for i, v in ipairs(self.Selection) do
            if v:IsA("Model") then
                v1.Groups[#v1.Groups + 1] = v
            elseif not (v:IsA("Folder")) then
            end
        end
        v1.GroupParents = Support.GetListMembers(v1.Groups, "Parent")
        v1.GroupChildren = SyncAPI:Invoke("Ungroup", v1.Groups)
        local v2 = Support.CloneTable(v1.Selection)
        for k, i2 in pairs(v1.GroupChildren) do
            for i3, j in ipairs(i2) do
                v2[#v2 + 1] = j
            end
        end
        Selection.Replace(v2)
    end
    v1:Apply()
    History.Add(v1)
end
AssignHotkey({"LeftShift", "G"}, Support.Call(GroupSelection, "Model"))
AssignHotkey({"RightShift", "G"}, Support.Call(GroupSelection, "Model"))
AssignHotkey({"LeftShift", "F"}, Support.Call(GroupSelection, "Folder"))
AssignHotkey({"RightShift", "F"}, Support.Call(GroupSelection, "Folder"))
AssignHotkey({"LeftShift", "U"}, UngroupSelection)
AssignHotkey({"RightShift", "U"}, UngroupSelection)
function GetPartsFromSelection(p1) -- Line: 832
    local v1 = {}
    for k, v in pairs(p1) do
        if not (v:IsA("BasePart")) then
            for k2, i in pairs(v:GetDescendants()) do
                if i:IsA("BasePart") then
                    v1[#v1 + 1] = i
                end
            end
        else
            v1[#v1 + 1] = v
        end
    end
    return v1
end
function IsSelectable(p1) -- Line: 854
    for k, v in pairs(p1) do
        if v and v.Parent then
            if v:IsA("BasePart") and v.Locked then
                return false
            end
            if Security.IsItemAllowed(v, Player) then
                continue
            end
            return false
        end
        return false
    end
    local v1 = GetPartsFromSelection(p1)
    if Security.ArePartsViolatingAreas(v1, Player, true) then
        return false
    end
    return true
end
function ExportSelection() -- Line: 882 -- upvalues: Roact (val)
    if #Selection.Items == 0 then
        return
    end
    local u3 = nil
    local UI = Tool:WaitForChild("UI")
    local ExportDialog = require(UI:WaitForChild("ExportDialog"))
    local function u15() -- Line: 893 -- upvalues: u3 (ref), Roact (upval)
        u3 = Roact.unmount(u3)
    end
    local v1 = Roact.createElement(ExportDialog, {Text = "Uploading selection...", OnDismiss = u15})
    u3 = Roact.mount(v1, UI, "ExportDialog")
    local v2 = Try(SyncAPI.Invoke, SyncAPI, "Export", Selection.Items)
    v2 = v2:Then(function(p1) -- Line: 906 -- upvalues: Roact (upval), u3 (ref), ExportDialog (val), u15 (val)
        Roact.update(u3, Roact.createElement(ExportDialog, {Text = "Your creation's ID:<font size=\"5\"><br /></font>\n" .. "<font face=\"GothamBlack\" size=\"18\">" .. p1 .. "</font><font size=\"6\"><br /></font>\n" .. "<font face=\"Gotham\" size=\"10\">Use the code above to import your creation using the plugin in Studio.</font>", OnDismiss = u15}))
        print("[Building Tools by F3X] Uploaded Export:", p1)
    end)
    v2 = v2:Catch("Http requests are not enabled", function() -- Line: 917 -- upvalues: Roact (upval), u3 (ref), ExportDialog (val), u15 (val)
        Roact.update(u3, Roact.createElement(ExportDialog, {Text = "Please enable HTTP requests.", OnDismiss = u15}))
    end)
    v2 = v2:Catch("Export failed due to server-side error", function() -- Line: 923 -- upvalues: Roact (upval), u3 (ref), ExportDialog (val), u15 (val)
        Roact.update(u3, Roact.createElement(ExportDialog, {Text = "An error occurred — please try again.", OnDismiss = u15}))
    end)
    v2 = v2:Catch("Post data too large", function() -- Line: 929 -- upvalues: Roact (upval), u3 (ref), ExportDialog (val), u15 (val)
        Roact.update(u3, Roact.createElement(ExportDialog, {Text = "Try splitting up your build.", OnDismiss = u15}))
    end)
    v2:Catch(function(p1, p2, p3) -- Line: 935 -- upvalues: Roact (upval), u3 (ref), ExportDialog (val), u15 (val)
        Roact.update(u3, Roact.createElement(ExportDialog, {Text = "An unknown error occurred — please try again.", OnDismiss = u15}))
        warn("❌ [Building Tools by F3X] Failed to export selection", "\n\nError:\n", p1, "\n\nStack:\n", p2)
    end)
end
AssignHotkey({"LeftShift", "P"}, ExportSelection)
local v6 = {"RightShift", "P"}
AssignHotkey(v6, ExportSelection)
if Mode == "Tool" then
    AssignHotkey({"LeftControl", "P"}, ExportSelection)
    AssignHotkey({"RightControl", "P"}, ExportSelection)
end
function IsVersionOutdated() -- Line: 955
    local v1, v2, v3, v4, v5, v6
    v1, v2, v3 = MarketplaceService:GetProductInfo(142785488, Enum.InfoType.Asset).Description:match("%[Version: ([0-9]+)%.([0-9]+)%.([0-9]+)%]")
    v4, v5, v6 = Tool.Version.Value:match("([0-9]+)%.([0-9]+)%.([0-9]+)")
    local v7 = tonumber(v1)
    local v8 = tonumber(v2)
    local v9 = tonumber(v3)
    local v10 = tonumber(v4)
    local v11 = tonumber(v5)
    local v12 = tonumber(v6)
    if v10 < v7 then
        return true
    end
    if v7 ~= v10 then
        return false
    end
    if v11 < v8 then
        return true
    end
    if v8 ~= v11 then
        return false
    end
    local v13 = v12 < v9
    return v13
end
function ToggleSwitch(p1, p2) -- Line: 985
    for k, v in pairs(p2:GetChildren()) do
        if v.Name ~= "Label" then
            v.SelectedIndicator.BackgroundTransparency = 1
            v.Background.Image = Assets.LightSlantedRectangle
        end
    end
    if p1 then
        local v1 = p2[p1]
        v1.SelectedIndicator.BackgroundTransparency = 0
        v1.Background.Image = Assets.DarkSlantedRectangle
    end
end
local GetConnectedParts = Instance.new("Part").GetConnectedParts
local GetChildren = u0.GetChildren
function GetPartJoints(p1, p2) -- Line: 1019 -- upvalues: GetConnectedParts (val)
    local v1, v2
    local v3 = {}
    for k, v in pairs(SearchJoints(p1, p1, p2)) do
        v3[k] = v
    end
    v1, v2 = p1, p2
    for k2, i in pairs(GetConnectedParts(p1)) do
        for k3, j in pairs(SearchJoints(i, v1, v2)) do
            v3[k3] = j
        end
    end
    return v3
end
local u640 = Support.FlipTable({
    "Weld",
    "ManualWeld",
    "ManualGlue",
    "Motor",
    "Motor6D",
})
function SearchJoints(p1, p2, p3) -- Line: 1044 -- upvalues: GetChildren (val), u640 (val)
    local v1 = {}
    for k, v in pairs(GetChildren(p1)) do
        if u640[v.ClassName] and p3[v.Part0] and p3[v.Part1] then
            v1[v] = v.Parent
        end
    end
    return v1
end
function RestoreJoints(p1) -- Line: 1068
    for k, v in pairs(p1) do
        k.Parent = v
    end
end
function PreserveJoints(p1, p2) -- Line: 1078
    local v1 = GetPartJoints(p1, p2)
    for k in pairs(v1) do
        k.Parent = nil
    end
    return v1
end
InitializeUI()
return getfenv(0)