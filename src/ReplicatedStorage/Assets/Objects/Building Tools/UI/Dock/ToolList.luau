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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.ToolList
--                              Dumped in 0.000634 seconds
--                          Bytecode version 9  |  7 functions

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
local ToolButton = require(v1.Parent:WaitForChild("ToolButton"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 23 -- upvalues: Maid (val), Roact (val)
    local v1, v2
    p1.Maid = Maid.new()
    v1, v2 = Roact.createBinding(UDim2.new())
    p1.CanvasSize = v1
    p1.SetCanvasSize = v2
    p1:setState({CurrentTool = p1.props.Core.CurrentTool})
    local Maid_2 = p1.Maid
    Maid_2.CurrentTool = p1.props.Core.ToolChanged:Connect(function(a1) -- Line: 31 -- upvalues: p1 (val)
        p1:setState({CurrentTool = a1})
    end)
end
function v3.render(p1) -- Line: 38 -- upvalues: createElement (val), Roact (val), ToolButton (val)
    local v1
    local v2 = {}
    local v3 = {
        CellPadding = UDim2.new(0, 0, 0, 0),
        CellSize = UDim2.new(0, 35, 0, 35),
        FillDirection = Enum.FillDirection.Horizontal,
        FillDirectionMaxCells = 2,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        StartCorner = Enum.StartCorner.TopLeft,
    }
    v3[Roact.Ref] = function(a1) -- Line: 49 -- upvalues: p1 (val)
        if a1 then
            p1.SetCanvasSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
        end
    end
    v3[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 54 -- upvalues: p1 (val)
        p1.SetCanvasSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
    end
    v2.Layout = createElement("UIGridLayout", v3)
    for i, v in ipairs(p1.props.Tools) do
        v1 = tostring(i)
        v2[v1] = createElement(ToolButton, {
            CurrentTool = p1.state.CurrentTool,
            IconAssetId = v.IconAssetId,
            HotkeyLabel = v.HotkeyLabel,
            Tool = v.Tool,
            Core = p1.props.Core,
        })
    end
    v3 = {
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = p1.props.LayoutOrder,
        Size = p1.CanvasSize:map(function(p1) -- Line: 76
            return UDim2.fromOffset(p1.X.Offset, 245)
        end),
    }
    local v4 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), SizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(70, 0)})}
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = p1.CanvasSize,
        ScrollBarThickness = 1,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
    }
    v5[Roact.Children] = v2
    v4.List = createElement("ScrollingFrame", v5)
    return createElement("Frame", v3, v4)
end
return v3