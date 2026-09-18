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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Core.Targeting
--                               Dumped in 0.00315 seconds
--                          Bytecode version 9  |  35 functions

local GetVisibleChildren
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Selection = require(u0.Parent.Selection)
local Libraries = u0.Parent.Parent:WaitForChild("Libraries")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Signal = require(Libraries:WaitForChild("Signal"))
local Make = require(Libraries:WaitForChild("Make"))
local InstancePool = require(Libraries:WaitForChild("InstancePool"))
TargetingModule = {}
TargetingModule.TargetingMode = "Scoped"
TargetingModule.TargetingModeChanged = Signal.new()
TargetingModule.Scope = Workspace
TargetingModule.IsScopeLocked = true
TargetingModule.TargetChanged = Signal.new()
TargetingModule.ScopeChanged = Signal.new()
TargetingModule.ScopeTargetChanged = Signal.new()
TargetingModule.ScopeLockChanged = Signal.new()
function TargetingModule.EnableTargeting(p1) -- Line: 31 -- upvalues: SupportLibrary (val), Selection (val)
    local v1 = GetCore()
    local Connections = v1.Connections
    Mouse = v1.Mouse
    Connections.Targeting = Mouse.Move:Connect(function() -- Line: 42 -- upvalues: p1 (val)
        p1:UpdateTarget(p1.Scope)
    end)
    Connections.Selecting = Mouse.Button1Up:Connect(p1.SelectTarget)
    Connections.SiblingSelecting = SupportLibrary.AddUserInputListener("Began", "MouseButton3", true, function() -- Line: 50 -- upvalues: p1 (val), Selection (upval)
        p1.SelectSiblings(Mouse.Target, not Selection.Multiselecting)
    end)
    Connections.RectSelectionStarted = Mouse.Button1Down:Connect(p1.StartRectangleSelecting)
    Connections.RectSelectionFinished = SupportLibrary.AddUserInputListener("Ended", "MouseButton1", true, p1.FinishRectangleSelecting)
    Connections.HideTargetBoxOnDisable = v1.Disabling:Connect(p1.HighlightTarget)
    Connections.CancelSelectionOnDisable = v1.Disabling:Connect(p1.CancelRectangleSelecting)
    p1:EnableScopeSelection()
    p1:EnableScopeAutoReset()
    p1:BindTargetingModeHotkeys()
end
function TargetingModule:SetScope(p2) -- Line: 75
    if self.Scope ~= p2 then
        self.Scope = p2
        self.ScopeChanged:Fire(p2)
    end
end
local function IsVisible(p1) -- Line: 82
    local v1 = p1:IsA("Model")
    if not v1 then
        v1 = p1:IsA("BasePart")
    end
    return v1
end
local function IsTargetable(p1) -- Line: 86
    local v1 = p1:IsA("Model")
    if not v1 then
        v1 = p1:IsA("BasePart")
        if not v1 then
            v1 = p1:IsA("Tool")
            if not v1 then
                v1 = p1:IsA("Accessory")
                if not v1 then
                    v1 = p1:IsA("Accoutrement")
                end
            end
        end
    end
    return v1
end
function TargetingModule:FindTargetInScope(p2, p3) -- Line: 98 -- upvalues: IsTargetable (val)
    if not p2 then
        return nil
    else
        if not p3 then
            return nil
        end
        if self.TargetingMode ~= "Direct" then
            local v1 = {p2}
            local Parent = p2
            while Parent do
                if Parent.Parent == p3 then
                    break
                end
                table.insert(v1, 1, Parent.Parent)
                Parent = Parent.Parent
            end
            for i, v in ipairs(v1) do
                if IsTargetable(v) then
                    return v
                end
            end
            return
        elseif p2:IsDescendantOf(p3) then
            return p2
        end
    end
end
function TargetingModule:UpdateTarget(p2, p3) -- Line: 126
    local Scope = p2
    if not Scope then
        Scope = self.Scope
    end
    local Target = Mouse.Target
    local v1 = self:FindTargetInScope(Target, Scope)
    if self.LastTarget ~= Target then
        self.LastTarget = Target
        self.TargetChanged:Fire(Target)
        local v2 = GetCore()
        local v3 = {Target}
        if not (v2.IsSelectable(v3)) then
            self.HighlightTarget(nil)
            self.LastTarget = nil
            self.LastScopeTarget = nil
            self.TargetChanged:Fire(nil)
            self.ScopeTargetChanged:Fire(nil)
            return
        end
        if self.LastScopeTarget ~= v1 then
            self.LastScopeTarget = v1
            self.ScopeTargetChanged:Fire(v1)
            if not (v2.Selection.IsSelected(v1)) then
                self.HighlightTarget(v1)
            end
            return Target, v1
        end
        if not p3 then
            return Target, v1
        end
        self.LastScopeTarget = v1
        self.ScopeTargetChanged:Fire(v1)
        if not (v2.Selection.IsSelected(v1)) then
            self.HighlightTarget(v1)
        end
        return Target, v1
    elseif not p3 then
        return Target, v1
    end
end
function GetVisibleChildren(p1, p2) -- Line: 169 -- upvalues: IsVisible (val), GetVisibleChildren (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    for k, v in pairs(p1:GetChildren()) do
        if not (IsVisible(v)) then
            GetVisibleChildren(v, v1)
        else
            v1[#v1 + 1] = v
        end
    end
    return v1
end
local u96 = InstancePool.new(60, function() -- Line: 186 -- upvalues: Make (val)
    local SelectionBox = Make("SelectionBox")
    return SelectionBox({
        Name = "BTTargetBox",
        LineThickness = 0.025,
        Transparency = 0.5,
        Parent = GetCore().UI,
        Color = BrickColor.new("Institutional white"),
    })
end)
function u96.Cleanup(p1) -- Line: 197
    p1.Adornee = nil
    p1.Visible = nil
end
function TargetingModule.HighlightTarget(p1) -- Line: 202 -- upvalues: u96 (val), SupportLibrary (val), IsVisible (val), GetVisibleChildren (val)
    local v1
    u96:ReleaseAll()
    if not p1 then
        return
    end
    local v2 = if not (IsVisible(p1)) then SupportLibrary.FlipTable(GetVisibleChildren(p1)) else SupportLibrary.FlipTable({p1})
    for k in pairs(v2) do
        v1 = u96:Get()
        v1.Adornee = k
        v1.Visible = true
    end
end
local function IsAncestorSelected(p1) -- Line: 227 -- upvalues: Selection (val)
    while p1 do
        if p1 == TargetingModule.Scope then
            break
        end
        if Selection.IsSelected(p1) then
            return true
        end
    end
end
function TargetingModule.SelectTarget(p1) -- Line: 237 -- upvalues: Selection (val), IsAncestorSelected (val)
    local v1, v2
    v1, v2 = TargetingModule:UpdateTarget(TargetingModule.Scope, true)
    if p1 then
        if Selection.Multiselecting then
            local v3 = {v1}
            if not (GetCore().IsSelectable(v3)) then
                Selection.Clear(true)
                return
            end
            if not Selection.Multiselecting then
                if Selection.Multiselecting then
                    Selection.Add({v2}, true)
                    Selection.SetFocus(v2)
                    return
                end
                Selection.Replace({v2}, true)
                Selection.SetFocus(v2)
                return
            end
            if Selection.IsSelected(v2) then
                Selection.Remove({v2}, true)
                return
            end
            if Selection.Multiselecting then
                Selection.Add({v2}, true)
                Selection.SetFocus(v2)
                return
            end
            Selection.Replace({v2}, true)
            Selection.SetFocus(v2)
            return
        elseif Selection.IsSelected(v2) then
            Selection.SetFocus(v2)
            return
        elseif IsAncestorSelected(v2) then
            Selection.SetFocus(v2)
            return
        end
    elseif SelectionCancelled then
        SelectionCancelled = false
        return
    end
end
function TargetingModule.SelectSiblings(p1, p2) -- Line: 280 -- upvalues: Selection (val), SupportLibrary (val)
    local Focus = p1
    if not Focus then
        Focus = Selection.Focus
    end
    if not Focus or Focus.Parent == TargetingModule.Scope then
        return
    end
    local v1 = SupportLibrary.GetDescendantsWhichAreA(Focus.Parent, "BasePart")
    if not (GetCore().IsSelectable(v1)) then
        return
    end
    if p2 then
        Selection.Replace(v1, true)
        return
    end
    Selection.Add(v1, true)
end
function TargetingModule.StartRectangleSelecting() -- Line: 308
    if SelectionCancelled then
        return
    end
    RectangleSelectStart = Vector2.new(Mouse.X, Mouse.Y)
    GetCore().Connections.WatchRectangleSelection = Mouse.Move:Connect(function() -- Line: 319
        if RectangleSelecting then
            TargetingModule.UpdateSelectionRectangle()
            return
        end
        if RectangleSelectStart then
            local v1 = Vector2.new(Mouse.X, Mouse.Y)
            if 10 <= (v1 - RectangleSelectStart).magnitude then
                RectangleSelecting = true
                SelectionCancelled = true
            end
        end
    end)
end
function TargetingModule.UpdateSelectionRectangle() -- Line: 335 -- upvalues: Make (val)
    if not RectangleSelecting then
        return
    end
    local v1 = GetCore()
    if not SelectionRectangle then
        local Frame = Make("Frame")
        SelectionRectangle = Frame({
            Name = "SelectionRectangle",
            BackgroundTransparency = 0.5,
            BorderSizePixel = 1,
            Parent = v1.UI,
            BackgroundColor3 = Color3.fromRGB(100, 100, 100),
            BorderColor3 = Color3.new(0, 0, 0),
        })
    end
    local v2 = math.min(RectangleSelectStart.X, Mouse.X)
    local v3 = Vector2.new(v2, (math.min(RectangleSelectStart.Y, Mouse.Y)))
    local v4 = math.max(RectangleSelectStart.X, Mouse.X)
    v2 = Vector2.new(v4, (math.max(RectangleSelectStart.Y, Mouse.Y)))
    SelectionRectangle.Parent = v1.UI
    SelectionRectangle.Position = UDim2.new(0, v3.X, 0, v3.Y)
    SelectionRectangle.Size = UDim2.new(0, v2.X - v3.X, 0, v2.Y - v3.Y)
end
function TargetingModule.CancelRectangleSelecting() -- Line: 373
    RectangleSelectStart = nil
    RectangleSelecting = false
    local Connections = GetCore().Connections
    if Connections.WatchRectangleSelection then
        Connections.WatchRectangleSelection:Disconnect()
        Connections.WatchRectangleSelection = nil
    end
    if SelectionRectangle then
        SelectionRectangle.Parent = nil
    end
end
function TargetingModule.CancelSelecting() -- Line: 395
    SelectionCancelled = true
    TargetingModule.CancelRectangleSelecting()
end
function TargetingModule.FinishRectangleSelecting() -- Line: 400 -- upvalues: SupportLibrary (val), Workspace (val), Selection (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = GetCore()
    local v11 = RectangleSelectStart
    TargetingModule.CancelRectangleSelecting()
    if not RectangleSelecting or not TargetingModule.Scope then
        return
    end
    local v12 = math.min(v11.X, Mouse.X)
    local v13 = Vector2.new(v12, (math.min(v11.Y, Mouse.Y)))
    local v14 = math.max(v11.X, Mouse.X)
    v12 = Vector2.new(v14, (math.max(v11.Y, Mouse.Y)))
    v14 = {}
    local v15 = SupportLibrary.GetDescendantsWhichAreA(TargetingModule.Scope, "BasePart")
    for k, v in pairs(v15) do
        v1, v2 = Workspace.CurrentCamera:WorldToScreenPoint(v.Position)
        if v2 then
            v3 = v13.X <= v1.X
            v4 = v1.X <= v12.X
            v5 = v13.Y <= v1.Y
            v6 = v1.Y <= v12.Y
            if v3 and v4 and v5 and v6 then
                v8 = {v}
                if v10.IsSelectable(v8) then
                    v7 = TargetingModule:FindTargetInScope(v, TargetingModule.Scope)
                    v14[v7] = true
                end
            end
        end
    end
    if Selection.Multiselecting then
        v9 = SupportLibrary.Keys(v14)
        Selection.Add(v9, true)
        return
    end
    v9 = SupportLibrary.Keys(v14)
    Selection.Replace(v9, true)
end
function TargetingModule.PrismSelect() -- Line: 458 -- upvalues: Selection (val), Workspace (val), SupportLibrary (val)
    local TouchingParts
    if #Selection.Items == 0 then
        return
    end
    local v1 = GetCore()
    local v2 = require(v1.Tool.Core.BoundingBox).CalculateExtents(Selection.Items, nil, true)
    local v3 = Region3.new(v2.Min, v2.Max)
    local v4 = Workspace:FindPartsInRegion3WithIgnoreList(v3, Selection.Items, math.huge)
    local v5 = {}
    for k, v in pairs(v4) do
        v5[v] = {Anchored = v.Anchored, CanCollide = v.CanCollide}
        v.Anchored = true
        v.CanCollide = true
    end
    local v6 = {}
    for k2, i in pairs(Selection.Items) do
        TouchingParts = i:GetTouchingParts()
        for k3, j in pairs(TouchingParts) do
            if not (Selection.IsSelected(j)) then
                v6[j] = true
            end
        end
    end
    for k4, k5 in pairs(v5) do
        k4.CanCollide = k5.CanCollide
        k4.Anchored = k5.Anchored
    end
    v1.DeleteSelection()
    local v7 = SupportLibrary.Keys(v6)
    Selection.Replace(v7, true)
end
function TargetingModule.EnableScopeSelection(p1) -- Line: 508 -- upvalues: UserInputService (val), ContextActionService (val)
    local u1 = false
    local u2 = nil
    ContextActionService:BindAction("BT: Scope", function(a1, p2, p3) -- Line: 515 -- upvalues: UserInputService (upval), u1 (ref), p1 (val), u2 (ref)
        local Scope, v1
        if p2.Name ~= "Begin" then
            if p2.Name ~= "End" then
                v1 = p3
            elseif not u1 then
                v1 = p3
            elseif not (p3.KeyCode.Name:match("Alt")) then
                v1 = p3
            else
                if p1.Scope == u1 then
                    p1:SetScope(u2)
                    p1.IsScopeLocked = true
                    p1.ScopeLockChanged:Fire(true)
                end
                p1:UpdateTarget(p1.Scope, true)
                u1 = nil
                u2 = nil
                v1 = p3
            end
            if u1 and v1.UserInputType.Name == "Focus" then
                if p1.Scope == u1 then
                    p1:SetScope(u2)
                    p1.IsScopeLocked = true
                    p1.ScopeLockChanged:Fire(true)
                end
                p1:UpdateTarget(p1.Scope, true)
                u1 = nil
                u2 = nil
            end
            return Enum.ContextActionResult.Pass
        else
            local v2, v3
            local v4 = UserInputService:IsKeyDown("LeftAlt")
            if not v4 then
                v4 = UserInputService:IsKeyDown("RightAlt")
            end
            local v5 = UserInputService:IsKeyDown("LeftShift")
            if not v5 then
                v5 = UserInputService:IsKeyDown("RightShift")
            end
            if u1 then
                if not u1 then
                    if not u1 then
                        if not u1 then
                            v1 = p3
                        elseif not v4 then
                            v1 = p3
                        else
                            if p3.KeyCode.Name == "F" then
                                u1 = true
                                p1.IsScopeLocked = true
                                p1.ScopeLockChanged:Fire(true)
                                return Enum.ContextActionResult.Sink
                            end
                            v1 = p3
                        end
                    elseif v4 and p3.KeyCode.Name == "Z" then
                        v2, v3 = p1:UpdateTarget(p1.Scope, true)
                        if v2 ~= v3 then
                            local Scope_2 = v3
                            if not Scope_2 then
                                Scope_2 = p1.Scope
                            end
                            p1:SetScope(Scope_2)
                            p1:UpdateTarget(p1.Scope, true)
                            p1.IsScopeLocked = false
                            p1.ScopeLockChanged:Fire(false)
                            u1 = p1.Scope
                        end
                        return Enum.ContextActionResult.Sink
                    end
                elseif v4 and v5 and p3.KeyCode.Name == "Z" then
                    local Parent = p1.Scope.Parent
                    if not Parent then
                        Parent = u2
                    end
                    if GetCore().Security.IsLocationAllowed(Parent, GetCore().Player) then
                        p1:SetScope(Parent)
                        p1:UpdateTarget(p1.Scope, true)
                        p1.IsScopeLocked = false
                        p1.ScopeLockChanged:Fire(false)
                        u1 = p1.Scope
                    end
                    return Enum.ContextActionResult.Sink
                end
            elseif p3.KeyCode.Name:match("Alt") then
                u1 = p1.Scope
                u2 = p1.Scope
                v2, v3 = p1:UpdateTarget(p1.Scope, true)
                if v2 == v3 then
                    v1 = p3
                else
                    Scope = v3
                    if not Scope then
                        Scope = p1.Scope
                    end
                    p1:SetScope(Scope)
                    p1:UpdateTarget(p1.Scope, true)
                    p1.IsScopeLocked = false
                    p1.ScopeLockChanged:Fire(false)
                    u1 = p1.Scope
                    v1 = p3
                end
            end
        end
    end, false, Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt, Enum.KeyCode.Z, Enum.KeyCode.F, Enum.UserInputType.Focus)
    GetCore().Disabling:Connect(function() -- Line: 609 -- upvalues: ContextActionService (upval)
        ContextActionService:UnbindAction("BT: Scope")
    end)
end
function TargetingModule:EnableScopeAutoReset() -- Line: 615 -- upvalues: Workspace (val)
    local u1 = nil
    local u2 = nil
    GetCore().UIMaid.ScopeReset = self.ScopeChanged:Connect(function(p1) -- Line: 621 -- upvalues: u1 (ref), u2 (ref), Workspace (upval), self (val)
        local v1 = u1
        if v1 then
            v1 = u1:Disconnect()
        end
        u1 = v1
        if not p1 then
            return
        end
        u2 = {}
        local Parent = p1.Parent
        while Parent:IsDescendantOf(Workspace) do
            table.insert(u2, Parent)
            Parent = Parent.Parent
        end
        u1 = p1.AncestryChanged:Connect(function(a1, p2) -- Line: 640 -- upvalues: u2 (upval), Workspace (upval), self (upval), p1 (val)
            if p2 ~= nil then
                u2 = {}
                local Parent = p1.Parent
                while Parent:IsDescendantOf(Workspace) do
                    table.insert(u2, Parent)
                    Parent = Parent.Parent
                end
                return
            end
            local v1 = nil
            if u2 then
                for i, v in ipairs(u2) do
                    if v:IsDescendantOf(Workspace) then
                        v1 = v
                        break
                    end
                end
            end
            if v1 then
                self:SetScope(v1)
                return
            end
            self:SetScope(Workspace, true)
        end)
    end)
end
function TargetingModule:SetTargetingMode(p2) -- Line: 677
    if p2 == "Scoped" then
        self.TargetingMode = p2
        self.TargetingModeChanged:Fire(p2)
        return
    end
    if p2 ~= "Direct" then
        error("Invalid targeting mode", 2)
        return
    end
    self.TargetingMode = p2
    self.TargetingModeChanged:Fire(p2)
end
function TargetingModule:ToggleTargetingMode() -- Line: 688
    if self.TargetingMode == "Scoped" then
        self:SetTargetingMode("Direct")
        return
    end
    if self.TargetingMode == "Direct" then
        self:SetTargetingMode("Scoped")
    end
end
function TargetingModule.BindTargetingModeHotkeys(p1) -- Line: 698 -- upvalues: UserInputService (val), ContextActionService (val)
    ContextActionService:BindAction("BT: Toggle Targeting Mode", function(a1, p2, p3) -- Line: 699 -- upvalues: UserInputService (upval), p1 (val)
        if p2.Name == "End" then
            return Enum.ContextActionResult.Pass
        end
        local KeysPressed = UserInputService:GetKeysPressed()
        local v1 = p3:IsModifierKeyDown(Enum.ModifierKey.Shift)
        if #KeysPressed ~= 2 or not v1 then
            return Enum.ContextActionResult.Pass
        end
        p1:ToggleTargetingMode()
        p1:UpdateTarget(nil, true)
        return Enum.ContextActionResult.Sink
    end, false, Enum.KeyCode.T)
    local v1 = GetCore()
    v1.Connections.UnbindTargetingModeHotkeys = v1.Disabling:Connect(function() -- Line: 724 -- upvalues: ContextActionService (upval)
        ContextActionService:UnbindAction("BT: Toggle Targeting Mode")
    end)
end
function GetCore() -- Line: 729 -- upvalues: u0 (val)
    return require(u0.Parent)
end
return TargetingModule