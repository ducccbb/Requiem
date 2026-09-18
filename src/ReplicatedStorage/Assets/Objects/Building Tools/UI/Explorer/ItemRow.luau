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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Explorer.ItemRow
--                               Dumped in 0.00166 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local UI = Parent:WaitForChild("UI")
local UserInputService = game:GetService("UserInputService")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local Frame = require(UI:WaitForChild("Frame"))
local ImageLabel = require(UI:WaitForChild("ImageLabel"))
local ImageButton = require(UI:WaitForChild("ImageButton"))
local TextLabel = require(UI:WaitForChild("TextLabel"))
local TextBox = require(UI:WaitForChild("TextBox"))
local u85 = Roact.PureComponent:extend("ItemRow")
function u85.init(p1) -- Line: 30 -- upvalues: Roact (val)
    function p1.OnActivated() -- Line: 33 -- upvalues: p1 (val)
        p1:HandleSelection()
    end
    function p1.OnArrowActivated() -- Line: 38 -- upvalues: p1 (val)
        p1:ToggleExpand()
    end
    function p1.OnLockActivated() -- Line: 43 -- upvalues: p1 (val)
        p1:ToggleLock()
    end
    function p1.OnNameActivated(a1) -- Line: 48 -- upvalues: p1 (val)
        local v1 = tick()
        if not p1.LastNameClick then
            p1.LastNameClick = v1
            p1:HandleSelection()
            return
        end
        local v2 = v1 - p1.LastNameClick
        if v2 <= 0.25 then
            p1:setState({EditingName = true})
            return
        end
        p1.LastNameClick = v1
        p1:HandleSelection()
    end
    function p1.OnNameInputBlur(a1, p2) -- Line: 59 -- upvalues: p1 (val), Roact (upval)
        local v1 = #a1.Text
        if 0 < v1 then
            p1:SetName(a1.Text)
        end
        p1:setState({EditingName = Roact.None})
    end
end
function u85:GetParts() -- Line: 68
    local Instance = self.props.Instance
    if Instance:IsA("BasePart") then
        return {Instance}
    end
    local v1 = {}
    for k, v in pairs(Instance:GetDescendants()) do
        if v:IsA("BasePart") then
            v1[#v1 + 1] = v
        end
    end
    return v1
end
function u85:ToggleLock() -- Line: 87 -- upvalues: SupportLibrary (val)
    local props = self.props
    local Parts = self:GetParts()
    local v1 = {
        Parts = Parts,
        BeforeLocked = SupportLibrary.GetListMembers(Parts, "Locked"),
        AfterLocked = not props.IsLocked,
        Unapply = function(p1) -- Line: 98 -- upvalues: props (val)
            props.Core.SyncAPI:Invoke("SetLocked", p1.Parts, p1.BeforeLocked)
        end,
        Apply = function(self) -- Line: 102 -- upvalues: props (val)
            props.Core.SyncAPI:Invoke("SetLocked", self.Parts, self.AfterLocked)
        end,
    }
    v1:Apply()
    props.Core.History.Add(v1)
end
function u85:SetName(p2) -- Line: 114
    local props = self.props
    local v1 = {
        Items = {props.Instance},
        BeforeName = props.Instance.Name,
        AfterName = p2,
        Unapply = function(p1) -- Line: 124 -- upvalues: props (val)
            props.Core.SyncAPI:Invoke("SetName", p1.Items, p1.BeforeName)
        end,
        Apply = function(self) -- Line: 128 -- upvalues: props (val)
            props.Core.SyncAPI:Invoke("SetName", self.Items, self.AfterName)
        end,
    }
    v1:Apply()
    props.Core.History.Add(v1)
end
function u85:HandleSelection() -- Line: 140 -- upvalues: UserInputService (val)
    local props = self.props
    local Selection = props.Core.Selection
    local v1 = UserInputService:IsKeyDown("LeftAlt")
    if not v1 then
        v1 = UserInputService:IsKeyDown("RightAlt")
    end
    if v1 then
        props.Core.Targeting:SetScope(props.Instance)
        return
    end
    local v2 = UserInputService:IsKeyDown("LeftControl")
    if not v2 then
        v2 = UserInputService:IsKeyDown("RightControl")
    end
    if not v2 then
        Selection.Replace({props.Instance}, true)
        return
    end
    if not (Selection.IsSelected(props.Instance)) then
        Selection.Add({props.Instance}, true)
        return
    end
    Selection.Remove({props.Instance}, true)
end
function u85:ToggleExpand() -- Line: 171
    self.props.ToggleExpand(self.props.Id)
end
function u85.didMount(p1) -- Line: 175 -- upvalues: Maid (val), Roact (val)
    p1.Maid = Maid.new()
    local Instance = p1.props.Instance
    local Maid_2 = p1.Maid
    Maid_2.TargetListener = p1.props.Core.Targeting.ScopeTargetChanged:Connect(function(a1) -- Line: 182 -- upvalues: p1 (val), Instance (val), Roact (upval)
        local Targeted = p1.state.Targeted
        if Targeted then
            if Targeted and a1 ~= Instance then
                p1:setState({Targeted = Roact.None})
            end
            return
        end
        if a1 == Instance then
            p1:setState({Targeted = true})
            return
        end
        if Targeted and a1 ~= Instance then
            p1:setState({Targeted = Roact.None})
        end
    end)
end
function u85.willUnmount(p1) -- Line: 192
    p1.Maid = p1.Maid:Destroy()
end
u85.ClassIcons = {
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
function u85.render(p1) -- Line: 215 -- upvalues: u85 (val), createElement (val), Frame (val), ImageLabel (val), ImageButton (val), Roact (val), TextLabel (val), TextBox (val)
    local v1, v2
    local props = p1.props
    local state = p1.state
    local v3 = u85.ClassIcons[props.Class]
    if not v3 then
        v3 = Vector2.new(1, 1)
    end
    local v4 = {StartSpacer = createElement(Frame, {LayoutOrder = 0, AspectRatio = (5 + 10 * props.Depth) / 18})}
    local v5 = {AspectRatio = 1, Image = "rbxassetid://2245672825", LayoutOrder = 1}
    local v6 = v3 - Vector2.new(1, 1)
    v5.ImageRectOffset = v6 * Vector2.new(16, 16)
    v5.ImageRectSize = Vector2.new(16, 16)
    v5.Size = UDim2.new(1, 0, 0.6666666666666666, 0)
    v4.Icon = createElement(ImageLabel, v5)
    v4.IconSpacer = createElement(Frame, {AspectRatio = 0.2777777777777778, LayoutOrder = 2})
    v5 = {Layout = "List", Width = "WRAP_CONTENT", LayoutOrder = 3}
    v5[Roact.Event.Activated] = p1.OnNameActivated
    local v7 = {}
    v6 = not state.EditingName
    if v6 then
        v6 = createElement(TextLabel, {TextSize = 13, TextColor = "FFFFFF", Width = "WRAP_CONTENT", Text = props.Name})
    end
    v7.Name = v6
    local EditingName = state.EditingName
    if EditingName then
        local v8 = {TextSize = 13, TextColor = "FFFFFF", Text = props.Name, Width = "WRAP_CONTENT"}
        v8[Roact.Event.FocusLost] = p1.OnNameInputBlur
        EditingName = createElement(TextBox, v8)
    end
    v7.NameInput = EditingName
    v4.NameContainer = createElement(ImageButton, v5, v7)
    local v9 = createElement(Frame, {Layout = "List", LayoutDirection = "Horizontal", VerticalAlignment = "Center"}, v4)
    v4 = {
        Layout = "List",
        LayoutDirection = "Horizontal",
        HorizontalAlignment = "Right",
        VerticalAlignment = "Center",
        Width = "WRAP_CONTENT",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
    }
    local v10 = {}
    v7 = {AspectRatio = 1, DominantAxis = "Height", Image = "rbxassetid://2244452978"}
    if not props.IsLocked then
        v2 = 1
    else
        v2 = 2
    end
    v7.ImageRectOffset = Vector2.new(14 * v2, 0) * 2
    v7.ImageRectSize = Vector2.new(14, 14) * 2
    v7.Size = UDim2.new(1, 0, 0.6666666666666666, 0)
    if not props.IsLocked then
        v1 = 0.15
    else
        v1 = 0.75
    end
    v7.ImageTransparency = 1 - v1
    v7.LayoutOrder = 0
    v7[Roact.Event.Activated] = p1.OnLockActivated
    v10.Lock = createElement(ImageButton, v7)
    v7 = {LayoutOrder = 1, AspectRatio = 0.1}
    v10.Spacer = createElement(Frame, v7)
    local v11 = next(props.Children)
    if v11 then
        v7 = {AspectRatio = 1, LayoutOrder = 2, Size = UDim2.new(1, 0, 0.7777777777777778, 0)}
        v6 = {}
        local v12 = {Image = "rbxassetid://2244452978", ImageRectOffset = Vector2.new(42, 0) * 2, ImageRectSize = Vector2.new(14, 14) * 2}
        if not props.Expanded then
            v2 = 90
        else
            v2 = 180
        end
        v12.Rotation = v2
        v12.ImageTransparency = 0.85
        v12[Roact.Event.Activated] = p1.OnArrowActivated
        v6.Arrow = createElement(ImageButton, v12)
        v11 = createElement(Frame, v7, v6)
    end
    v10.ArrowWrapper = v11
    v10.EndSpacer = createElement(Frame, {LayoutOrder = 3, AspectRatio = 0.05})
    local v13 = createElement(Frame, v4, v10)
    local v14 = 1
    if props.Selected then
        v14 = 0.85
    elseif state.Targeted then
        v14 = 0.95
    end
    v11 = {
        LayoutOrder = props.Order,
        Size = UDim2.new(1, 0, 0, props.Height),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = v14,
    }
    v11[Roact.Event.Activated] = p1.OnActivated
    return createElement(ImageButton, v11, {Metadata = v9, Buttons = v13})
end
return u85