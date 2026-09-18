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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Explorer.ItemList
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  8 functions

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
local UI = Parent:WaitForChild("UI")
game:GetService("RunService")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local Frame = require(UI:WaitForChild("Frame"))
local ScrollingFrame = require(UI:WaitForChild("ScrollingFrame"))
local ItemRow = require(v1.Parent:WaitForChild("ItemRow"))
local v3 = Roact.Component:extend("ItemList")
v3.defaultProps = {MaxHeight = 300}
function v3.init(p1, p2) -- Line: 31
    p1:setState({Min = 0, Max = p2.MaxHeight, CanvasPosition = Vector2.new()})
    function p1.UpdateBoundaries(a1) -- Line: 39 -- upvalues: p1 (val)
        if p1.Mounted then
            p1:setState({CanvasPosition = a1.CanvasPosition, Min = a1.CanvasPosition.Y - a1.AbsoluteSize.Y, Max = a1.CanvasPosition.Y + a1.AbsoluteSize.Y})
        end
    end
end
function v3.didMount(p1) -- Line: 50
    p1.Mounted = true
end
function v3.willUnmount(p1) -- Line: 54
    p1.Mounted = false
end
function v3.didUpdate(p1, p2, p3) -- Line: 58
    local ScrollTo = p1.props.ScrollTo
    if ScrollTo then
        ScrollTo = p2.ScrollTo ~= p1.props.ScrollTo
    end
    if p2.Scope ~= p1.props.Scope and not ScrollTo then
        p1:setState({Min = 0, CanvasPosition = Vector2.new(0, 0), Max = p1.props.MaxHeight})
    end
end
function v3.render(p1) -- Line: 72 -- upvalues: SupportLibrary (val), createElement (val), ItemRow (val), ScrollingFrame (val), Roact (val), Frame (val)
    local CanvasPosition, Parent, v1, v2, v3, v4, v5, v6, v7
    local props = p1.props
    local state = p1.state
    local v8 = 0
    local v9 = 0
    local v10 = nil
    local v11 = {}
    local v12 = 0
    local v13 = SupportLibrary.Values(props.Items)
    table.sort(v13, function(p1, p2) -- Line: 88
        local v1 = p1.Order < p2.Order
        return v1
    end)
    local v14 = #v13
    local v15 = 1
    for i = 1, v14, v15 do
        v2 = v13[i]
        Parent = v2.Parent
        if Parent then
            Parent = props.IdMap[v2.Parent]
        end
        v3 = Parent
        if v3 then
            v3 = props.Items[Parent]
        end
        v4 = true
        v5 = 0
        if Parent then
            v6 = v3
            while v6 do
                if not v6.Expanded then
                    v4 = nil
                    break
                end
                v5 = v5 + 1
                v6 = props.Items[props.IdMap[v6.Parent]]
            end
        end
        if v2.Id == props.ScrollTo and v1.ScrolledTo ~= props.ScrollTo then
            v6 = v12 * props.RowHeight
            if v6 < state.CanvasPosition.Y then
                v10 = Vector2.new(0, v6)
                v1.ScrolledTo = v2.Id
            elseif state.CanvasPosition.Y + props.MaxHeight >= v6 then
            end
        end
        if v4 then
            v12 = v12 + 1
            v6 = (v12 - 1) * props.RowHeight
            if v6 < state.Min then
                v8 = v8 + 1
                v4 = nil
            elseif state.Max < v6 then
                v9 = v9 + 1
                v4 = nil
            end
        end
        v7 = v4
        if v7 then
            v7 = createElement(ItemRow, SupportLibrary.Merge({}, v2, {Depth = v5, Core = props.Core, ToggleExpand = props.ToggleExpand, Height = props.RowHeight}))
        end
        v11[v2.Id] = v7
    end
    local v16 = {Layout = "List", LayoutDirection = "Vertical", CanvasSize = UDim2.new(1, -2, 0, v12 * props.RowHeight), Size = UDim2.new(1, 0, 0, v12 * props.RowHeight)}
    CanvasPosition = v10
    if not CanvasPosition then
        CanvasPosition = state.CanvasPosition
    end
    v16.CanvasPosition = CanvasPosition
    v16.ScrollBarThickness = 4
    v16.ScrollBarImageTransparency = 0.6
    v16.VerticalScrollBarInset = "ScrollBar"
    v16[Roact.Change.CanvasPosition] = v1.UpdateBoundaries
    v16[Roact.Children] = SupportLibrary.Merge(v11, {TopSpacer = createElement(Frame, {LayoutOrder = 0, Size = UDim2.new(0, 0, 0, v8 * props.RowHeight)}), BottomSpacer = createElement(Frame, {Size = UDim2.new(0, 0, 0, v9 * props.RowHeight), LayoutOrder = #v13 + 1}), SizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(0, 20), MaxSize = Vector2.new(math.huge, props.MaxHeight)})})
    return createElement(ScrollingFrame, v16)
end
return v3