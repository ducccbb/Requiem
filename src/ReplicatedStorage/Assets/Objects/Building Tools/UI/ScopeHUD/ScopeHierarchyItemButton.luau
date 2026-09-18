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
--File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD.ScopeHierarchyItemButton
--                               Dumped in 0.00114 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local TextService = game:GetService("TextService")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local HotkeyTooltip = require(v1.Parent:WaitForChild("HotkeyTooltip"))
local v3 = Roact.PureComponent:extend("ScopeHierarchyItemButton")
function v3.init(p1) -- Line: 25 -- upvalues: Maid (val), Roact (val)
    local v1, v2
    p1.Maid = Maid.new()
    p1.LayoutRef = Roact.createRef()
    v1, v2 = Roact.createBinding(UDim2.new(0, 0, 1, 0))
    p1.ContainerSize = v1
    p1.UpdateContainerSize = v2
    function p1.OnClicked() -- Line: 31 -- upvalues: p1 (val)
        p1.props.SetScopeFromButton(p1.props.Instance)
    end
    p1:UpdateInstanceState()
end
local u54 = {
    Part = Vector2.new(2, 1),
    MeshPart = Vector2.new(4, 8),
    UnionOperation = Vector2.new(4, 8),
    NegateOperation = Vector2.new(3, 8),
    VehicleSeat = Vector2.new(6, 4),
    Seat = Vector2.new(6, 4),
    TrussPart = Vector2.new(2, 1),
    CornerWedgePart = Vector2.new(2, 1),
    WedgePart = Vector2.new(2, 1),
    SpawnLocation = Vector2.new(6, 3),
    Model = Vector2.new(3, 1),
    Folder = Vector2.new(8, 8),
    Tool = Vector2.new(8, 2),
    Workspace = Vector2.new(10, 2),
    Accessory = Vector2.new(3, 4),
    Accoutrement = Vector2.new(3, 4),
}
function v3:UpdateInstanceState() -- Line: 59 -- upvalues: TextService (val)
    local Name = self.props.Instance.Name
    local v1 = Vector2.new(math.huge, math.huge)
    local TextSize = TextService:GetTextSize(Name, 16.5, Enum.Font.SourceSans, v1)
    self:setState({InstanceName = Name, InstanceNameLength = TextSize.X})
end
function v3:StartTrackingInstance() -- Line: 72
    local PropertyChangedSignal = self.props.Instance:GetPropertyChangedSignal("Name")
    local Maid = self.Maid
    Maid.NameListener = PropertyChangedSignal:Connect(function() -- Line: 74 -- upvalues: self (val)
        self:UpdateInstanceState()
    end)
end
function v3.didMount(p1) -- Line: 80
    local current
    p1:UpdateInstanceState()
    p1:StartTrackingInstance()
    if p1.LayoutRef.current then
        current = p1.LayoutRef.current
        local PropertyChangedSignal = current:GetPropertyChangedSignal("AbsoluteContentSize")
        p1.UpdateContainerSize(UDim2.new(0, current.AbsoluteContentSize.X, 0, 19))
        local Maid = p1.Maid
        Maid.LayoutListener = PropertyChangedSignal:Connect(function() -- Line: 89 -- upvalues: p1 (val), current (val)
            p1.UpdateContainerSize(UDim2.new(0, current.AbsoluteContentSize.X, 0, 19))
        end)
    end
end
function v3.willUnmount(p1) -- Line: 96
    p1.Maid:Destroy()
end
function v3.didUpdate(p1, p2, p3) -- Line: 101
    if p2.Instance ~= p1.props.Instance then
        p1:UpdateInstanceState()
        p1:StartTrackingInstance()
    end
end
function v3.render(p1) -- Line: 108 -- upvalues: u54 (val), createElement (val), Roact (val), HotkeyTooltip (val)
    local v1, v2
    local v3 = u54[p1.props.Instance.ClassName]
    if not v3 then
        v3 = Vector2.new(1, 1)
    end
    local v4 = if p1.props.LayoutOrder == 2 then nil else true
    local v5 = {BackgroundTransparency = 1, ImageTransparency = 1, Size = p1.ContainerSize, LayoutOrder = p1.props.LayoutOrder}
    v5[Roact.Event.InputBegan] = p1.OnInputBegin
    v5[Roact.Event.InputEnded] = p1.OnInputEnd
    v5[Roact.Event.Activated] = p1.OnClicked
    local v6 = {}
    local v7 = {}
    v7[Roact.Ref] = p1.LayoutRef
    v7.FillDirection = Enum.FillDirection.Horizontal
    v7.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v7.VerticalAlignment = Enum.VerticalAlignment.Center
    v7.SortOrder = Enum.SortOrder.LayoutOrder
    v7.Padding = UDim.new(0, 2.5)
    v6.Layout = createElement("UIListLayout", v7)
    local v8 = v4
    if v8 then
        v8 = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 0, Size = UDim2.new(0, 19, 0, 19)}, {Arrow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://2244452978",
            ImageTransparency = 0,
            Rotation = 90,
            Size = UDim2.new(1, 0, 1, 0),
            ImageRectOffset = Vector2.new(42, 0) * 2,
            ImageRectSize = Vector2.new(14, 14) * 2,
        })})
    end
    v6.ArrowWrapper = v8
    v7 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(0, p1.state.InstanceNameLength + 14 + 5, 1, 0)}
    local v9 = {}
    local v10 = {BackgroundTransparency = 1, Image = "rbxassetid://2245672825", LayoutOrder = 0}
    local v11 = v3 - Vector2.new(1, 1)
    v10.ImageRectOffset = v11 * Vector2.new(16, 16)
    v10.ImageRectSize = Vector2.new(16, 16)
    if not p1.props.IsTarget then
        v1 = 0
    else
        v1 = 0.5
    end
    v10.ImageTransparency = v1
    v10.AnchorPoint = Vector2.new(0, 0.5)
    v10.Position = UDim2.new(0, 0, 0.5, 0)
    v10.Size = UDim2.new(0, 14, 0, 14)
    v9.InstanceIcon = createElement("ImageLabel", v10)
    v10 = {
        BackgroundTransparency = 1,
        TextSize = 16.5,
        LayoutOrder = 1,
        Size = UDim2.new(0, p1.state.InstanceNameLength, 0, 14),
        Position = UDim2.new(0, 19, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Font = Enum.Font.SourceSans,
        Text = p1.state.InstanceName,
    }
    if not p1.props.IsTarget then
        v1 = 0
    else
        v1 = 0.5
    end
    v10.TextTransparency = v1
    v10.TextYAlignment = Enum.TextYAlignment.Center
    v10.TextColor3 = Color3.fromRGB(255, 255, 255)
    v1 = {}
    local v12 = {
        BackgroundTransparency = 1,
        TextSize = 16.5,
        TextStrokeTransparency = 0.77,
        ZIndex = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 1),
        Font = Enum.Font.SourceSans,
        Text = p1.state.InstanceName,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextColor3 = Color3.fromRGB(112, 112, 112),
        TextStrokeColor3 = Color3.fromRGB(112, 112, 112),
    }
    if not p1.props.IsTarget then
        v2 = 0.77
    else
        v2 = 1
    end
    v12.TextTransparency = v2
    v1.TextShadow = createElement("TextLabel", v12)
    v9.InstanceName = createElement("TextLabel", v10, v1)
    v6.InstanceInfo = createElement("Frame", v7, v9)
    v6.Tooltip = createElement(HotkeyTooltip, {
        IsScopeParent = p1.props.IsScopeParent,
        IsScope = p1.props.IsScope,
        IsScopable = p1.props.IsScopable,
        IsScopeLocked = p1.props.IsScopeLocked,
        IsAltDown = p1.props.IsAltDown,
    })
    return createElement("ImageButton", v5, v6)
end
return v3