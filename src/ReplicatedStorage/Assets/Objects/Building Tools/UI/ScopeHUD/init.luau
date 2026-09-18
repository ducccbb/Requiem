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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD
--                               Dumped in 0.00140 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local Workspace = game:GetService("Workspace")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local createElement = Roact.createElement
local ScopeHierarchyItemButton = require(v1:WaitForChild("ScopeHierarchyItemButton"))
local HotkeyTooltip = require(v1:WaitForChild("HotkeyTooltip"))
local ModeToggle = require(v1:WaitForChild("ModeToggle"))
local v3 = Roact.PureComponent:extend("ScopeHUD")
function v3.init(p1, p2) -- Line: 30 -- upvalues: Maid (val), Roact (val)
    local v1, v2
    p1.Maid = Maid.new()
    p1.LayoutRef = Roact.createRef()
    v1, v2 = Roact.createBinding(UDim2.new(0, 0, 0, 19))
    p1.ContainerSize = v1
    p1.UpdateContainerSize = v2
    function p1.OnInputBegin(a1, p2, p3) -- Line: 36 -- upvalues: p1 (val)
        if p3 then
            return
        end
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = true})
        elseif p2.UserInputType.Name == "Touch" then
            p1:setState({IsHovering = true})
        end
    end
    function p1.OnInputEnd(a1, p2, p3) -- Line: 51 -- upvalues: p1 (val)
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = false})
        elseif p2.UserInputType.Name == "Touch" then
            p1:setState({IsHovering = false})
        end
    end
    function p1.SetScopeFromButton(a1) -- Line: 61 -- upvalues: p1 (val)
        p1.props.Core.Targeting:SetScope(a1)
    end
    p1:UpdateTargetingState()
    local v3 = {IsHovering = false}
    local v4 = p1.props.Core.Mode == "Tool"
    v3.IsToolModeEnabled = v4
    p1:setState(v3)
end
function v3:UpdateTargetingState() -- Line: 74 -- upvalues: Roact (val)
    local v1, v2
    local Targeting = self.props.Core.Targeting
    local Scope = Targeting.Scope
    v1, v2 = Targeting:UpdateTarget()
    local v3 = {}
    local None = Scope
    if not None then
        None = Roact.None
    end
    v3.Scope = None
    local None_2 = v2
    if not None_2 then
        None_2 = Roact.None
    end
    v3.ScopeTarget = None_2
    local None_3 = v1
    if not None_3 then
        None_3 = Roact.None
    end
    v3.DirectTarget = None_3
    v3.IsScopeLocked = Targeting.IsScopeLocked
    return self:setState(v3)
end
function v3.didMount(p1) -- Line: 87 -- upvalues: Roact (val), ContextActionService (val)
    local current
    p1:UpdateTargetingState()
    local Targeting = p1.props.Core.Targeting
    local Maid = p1.Maid
    Maid.ScopeChangeListener = Targeting.ScopeChanged:Connect(function(a1) -- Line: 92 -- upvalues: Targeting (val), p1 (val), Roact (upval)
        Targeting:UpdateTarget()
        local v1 = {}
        local None = a1
        if not None then
            None = Roact.None
        end
        v1.Scope = None
        p1:setState(v1)
    end)
    local Maid_2 = p1.Maid
    Maid_2.ScopeTargetChangeListener = Targeting.ScopeTargetChanged:Connect(function(a1) -- Line: 98 -- upvalues: p1 (val), Roact (upval)
        local v1 = {}
        local None = a1
        if not None then
            None = Roact.None
        end
        v1.ScopeTarget = None
        p1:setState(v1)
    end)
    local Maid_3 = p1.Maid
    Maid_3.TargetChangeListener = Targeting.TargetChanged:Connect(function(a1) -- Line: 103 -- upvalues: p1 (val), Roact (upval)
        local v1 = {}
        local None = a1
        if not None then
            None = Roact.None
        end
        v1.DirectTarget = None
        p1:setState(v1)
    end)
    local Maid_4 = p1.Maid
    Maid_4.ScopeLockChangeListener = Targeting.ScopeLockChanged:Connect(function(a1) -- Line: 108 -- upvalues: p1 (val)
        p1:setState({IsScopeLocked = a1})
    end)
    ContextActionService:BindAction("BT/ScopeHUD: Scope", function(a1, p2, p3) -- Line: 115 -- upvalues: p1 (val)
        if p2.Name == "Begin" then
            p1:setState({IsAltDown = true})
        elseif p2.Name == "End" then
            p1:setState({IsAltDown = false})
        end
        return Enum.ContextActionResult.Pass
    end, false, Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt)
    if p1.LayoutRef.current then
        current = p1.LayoutRef.current
        local PropertyChangedSignal = current:GetPropertyChangedSignal("AbsoluteContentSize")
        p1.UpdateContainerSize(UDim2.new(0, current.AbsoluteContentSize.X, 0, 19))
        local Maid_5 = p1.Maid
        Maid_5.LayoutListener = PropertyChangedSignal:Connect(function() -- Line: 137 -- upvalues: p1 (val), current (val)
            p1.UpdateContainerSize(UDim2.new(0, current.AbsoluteContentSize.X, 0, 19))
        end)
    end
end
function v3.willUnmount(p1) -- Line: 144
    p1.Maid:Destroy()
end
function v3.render(p1) -- Line: 148 -- upvalues: createElement (val), Roact (val), SupportLibrary (val), ModeToggle (val)
    local v1
    local v2 = {Active = true, Draggable = true}
    if not p1.state.IsToolModeEnabled then
        v1 = UDim2.new(0, 5, 0, 4)
    else
        v1 = UDim2.new(0, 5, 1, -4)
    end
    v2.Position = v1
    if not p1.state.IsToolModeEnabled then
        v1 = Vector2.new(0, 0)
    else
        v1 = Vector2.new(0, 1)
        if not v1 then
            v1 = Vector2.new(0, 0)
        end
    end
    v2.AnchorPoint = v1
    v2.Size = p1.ContainerSize
    v2.BackgroundTransparency = 1
    v2[Roact.Event.InputBegan] = p1.OnInputBegin
    v2[Roact.Event.InputEnded] = p1.OnInputEnd
    local v3 = p1:BuildScopeHierarchyButtons()
    local v4 = {}
    local v5 = {}
    v5[Roact.Ref] = p1.LayoutRef
    v5.FillDirection = Enum.FillDirection.Horizontal
    v5.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v5.VerticalAlignment = Enum.VerticalAlignment.Center
    v5.SortOrder = Enum.SortOrder.LayoutOrder
    v5.Padding = UDim.new(0, 2.5)
    v4.Layout = createElement("UIListLayout", v5)
    v4.ModeToggle = createElement(ModeToggle, {Core = p1.props.Core, IsToolModeEnabled = p1.state.IsToolModeEnabled})
    return createElement("Frame", v2, SupportLibrary.Merge(v3, v4))
end
local function IsItemScopable(p1) -- Line: 181
    local BasePart = p1:IsA("Model")
    if not BasePart then
        BasePart = p1:IsA("Folder")
        if not BasePart then
            BasePart = p1:IsA("Tool")
            if not BasePart then
                BasePart = p1:IsA("Accessory")
                if not BasePart then
                    BasePart = p1:IsA("Accoutrement")
                    if not BasePart then
                        BasePart = p1:IsA("BasePart")
                        if BasePart then
                            BasePart = p1:FindFirstChildWhichIsA("BasePart", true)
                        end
                    end
                end
            end
        end
    end
    return BasePart
end
function v3:BuildScopeHierarchyButtons() -- Line: 192 -- upvalues: Workspace (val), createElement (val), ScopeHierarchyItemButton (val), IsItemScopable (val), HotkeyTooltip (val), UserInputService (val)
    local Scope, v1, v2
    local v3 = {}
    local v4 = {}
    local ScopeTarget = self.state.ScopeTarget
    if not ScopeTarget then
        ScopeTarget = self.state.Scope
    end
    while ScopeTarget ~= nil do
        if ScopeTarget == Workspace.Parent then
            break
        end
        table.insert(v3, 1, ScopeTarget)
        ScopeTarget = ScopeTarget.Parent
    end
    local v5 = self
    for i, v in ipairs(v3) do
        v1 = {Instance = v}
        v2 = v5.state.ScopeTarget == v
        v1.IsTarget = v2
        Scope = v5.state.Scope
        if Scope then
            Scope = v5.state.Scope.Parent == v
        end
        v1.IsScopeParent = Scope
        v2 = v5.state.Scope == v
        v1.IsScope = v2
        v2 = if v5.state.ScopeTarget == v then IsItemScopable(v) else false
        v1.IsScopable = v2
        v1.IsScopeLocked = v5.state.IsScopeLocked
        v1.SetScopeFromButton = v5.SetScopeFromButton
        v1.IsAltDown = v5.state.IsAltDown
        v1.LayoutOrder = i + 1
        v4[i] = createElement(ScopeHierarchyItemButton, v1)
    end
    if not v5.state.IsAltDown then
        v4[#v3 + 1] = createElement(HotkeyTooltip, {IsAltDown = false, DisplayAltHotkey = UserInputService.KeyboardEnabled, LayoutOrder = #v3 + 2})
    end
    return v4
end
return v3