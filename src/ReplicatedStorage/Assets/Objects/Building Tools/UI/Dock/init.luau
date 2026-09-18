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
--             File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock
--                              Dumped in 0.000458 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Vendor = v1:FindFirstAncestorWhichIsA("Tool"):WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local ToolList = require(v1:WaitForChild("ToolList"))
local SelectionPane = require(v1:WaitForChild("SelectionPane"))
local AboutPane = require(v1:WaitForChild("AboutPane"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 23 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(UDim2.new())
    p1.DockSize = v1
    p1.SetDockSize = v2
end
function v3.render(p1) -- Line: 27 -- upvalues: createElement (val), Roact (val), ToolList (val), SelectionPane (val), AboutPane (val)
    local v1 = {
        Active = true,
        BackgroundTransparency = 1,
        ZIndex = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.6, 0),
        Size = p1.DockSize,
    }
    local v2 = {}
    local v3 = {
        Padding = UDim.new(0, 1),
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }
    v3[Roact.Ref] = function(a1) -- Line: 42 -- upvalues: p1 (val)
        if a1 then
            p1.SetDockSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
        end
    end
    v3[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 47 -- upvalues: p1 (val)
        p1.SetDockSize(UDim2.fromOffset(a1.AbsoluteContentSize.X, a1.AbsoluteContentSize.Y))
    end
    v2.Layout = createElement("UIListLayout", v3)
    v2.ToolList = createElement(ToolList, {LayoutOrder = 0, Tools = p1.props.Tools, Core = p1.props.Core})
    v2.SelectionPane = createElement(SelectionPane, {LayoutOrder = 1, Core = p1.props.Core})
    v2.AboutPane = createElement(AboutPane, {LayoutOrder = 2, Core = p1.props.Core})
    return createElement("Frame", v1, v2)
end
return v3