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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.SelectionPane
--                              Dumped in 0.000825 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
v2 = v1:FindFirstAncestorWhichIsA("Tool")
local Vendor = v2:WaitForChild("Vendor")
local Libraries = v2:WaitForChild("Libraries")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local SelectionButton = require(v1.Parent:WaitForChild("SelectionButton"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 23 -- upvalues: Maid (val), Roact (val)
    local v1, v2
    p1.Maid = Maid.new()
    v1, v2 = Roact.createBinding(UDim2.new())
    p1.PaneSize = v1
    p1.SetPaneSize = v2
    p1:UpdateHistoryState()
    local Maid_2 = p1.Maid
    Maid_2.TrackHistory = p1.props.Core.History.Changed:Connect(function() -- Line: 28 -- upvalues: p1 (val)
        p1:UpdateHistoryState()
    end)
    p1:UpdateSelectionState()
    local Maid_3 = p1.Maid
    Maid_3.TrackSelection = p1.props.Core.Selection.Changed:Connect(function() -- Line: 33 -- upvalues: p1 (val)
        p1:UpdateSelectionState()
    end)
    p1:UpdateExplorerState()
    local Maid_4 = p1.Maid
    Maid_4.TrackExplorer = p1.props.Core.ExplorerVisibilityChanged:Connect(function() -- Line: 38 -- upvalues: p1 (val)
        p1:UpdateExplorerState()
    end)
end
function v3:UpdateHistoryState() -- Line: 43
    local v1 = {}
    local v2 = 0 < self.props.Core.History.Index
    v1.CanUndo = v2
    v2 = self.props.Core.History.Index ~= #self.props.Core.History.Stack
    v1.CanRedo = v2
    self:setState(v1)
end
function v3:UpdateSelectionState() -- Line: 50
    local v1 = {}
    local v2 = #self.props.Core.Selection.Items == 0
    v1.IsSelectionEmpty = v2
    self:setState(v1)
end
function v3:UpdateExplorerState() -- Line: 56
    self:setState({IsExplorerOpen = self.props.Core.ExplorerVisible})
end
function v3.willUnmount(p1) -- Line: 62
    p1.Maid:Destroy()
end
function v3.render(p1) -- Line: 66 -- upvalues: createElement (val), Roact (val), SelectionButton (val)
    local v1 = {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = p1.PaneSize,
        LayoutOrder = p1.props.LayoutOrder,
    }
    local v2 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), SizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(70, 0)})}
    local v3 = {
        CellPadding = UDim2.new(0, 0, 0, 0),
        CellSize = UDim2.new(0, 35, 0, 35),
        FillDirection = Enum.FillDirection.Horizontal,
        FillDirectionMaxCells = 0,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        StartCorner = Enum.StartCorner.TopLeft,
    }
    v3[Roact.Ref] = function(a1) -- Line: 89 -- upvalues: p1 (val)
        if a1 then
            p1.SetPaneSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
        end
    end
    v3[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 94 -- upvalues: p1 (val)
        p1.SetPaneSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
    end
    v2.Layout = createElement("UIGridLayout", v3)
    v2.UndoButton = createElement(SelectionButton, {
        LayoutOrder = 0,
        IconAssetId = "rbxassetid://141741408",
        TooltipText = "<b>UNDO</b><br />Shift-Z",
        IsActive = p1.state.CanUndo,
        OnActivated = p1.props.Core.History.Undo,
    })
    v2.RedoButton = createElement(SelectionButton, {
        LayoutOrder = 1,
        IconAssetId = "rbxassetid://141741327",
        TooltipText = "<b>REDO</b><br />Shift-Y",
        IsActive = p1.state.CanRedo,
        OnActivated = p1.props.Core.History.Redo,
    })
    v2.DeleteButton = createElement(SelectionButton, {
        LayoutOrder = 2,
        IconAssetId = "rbxassetid://141896298",
        TooltipText = "<b>DELETE</b><br />Shift-X",
        IsActive = not p1.state.IsSelectionEmpty,
        OnActivated = p1.props.Core.DeleteSelection,
    })
    v2.ExportButton = createElement(SelectionButton, {
        LayoutOrder = 3,
        IconAssetId = "rbxassetid://141741337",
        TooltipText = "<b>EXPORT</b><br />Shift-P",
        IsActive = not p1.state.IsSelectionEmpty,
        OnActivated = p1.props.Core.ExportSelection,
    })
    v2.CloneButton = createElement(SelectionButton, {
        LayoutOrder = 4,
        IconAssetId = "rbxassetid://142073926",
        TooltipText = "<b>CLONE</b><br />Shift-C",
        IsActive = not p1.state.IsSelectionEmpty,
        OnActivated = p1.props.Core.CloneSelection,
    })
    v2.ExplorerButton = createElement(SelectionButton, {
        LayoutOrder = 5,
        IconAssetId = "rbxassetid://2326621485",
        TooltipText = "<b>EXPLORER</b><br />Shift-H",
        IsActive = p1.state.IsExplorerOpen,
        OnActivated = p1.props.Core.ToggleExplorer,
    })
    return createElement("Frame", v1, v2)
end
return v3