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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ToolManualWindow
--                              Dumped in 0.000617 seconds
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
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 18 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(UDim2.new(1, 0, 0, 0))
    p1.CanvasSize = v1
    p1.SetCanvasSize = v2
end
function v3.render(p1) -- Line: 22 -- upvalues: createElement (val), Roact (val)
    local v1 = {ZIndexBehavior = Enum.ZIndexBehavior.Sibling}
    local v2 = {}
    local v3 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(61, 61, 61),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = p1.CanvasSize:map(function(p1) -- Line: 32
            return UDim2.fromOffset(420, p1.Y.Offset + 10)
        end),
    }
    local v4 = {SizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(math.huge, 300)}), Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), ColorBar = createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = p1.props.ThemeColor, Size = UDim2.new(0, 3, 1, 0)}, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)})})}
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = p1.CanvasSize,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollingDirection = Enum.ScrollingDirection.Y,
    }
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.Gotham,
        LineHeight = 1.2,
        RichText = true,
        Text = p1.props.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    }
    v7[Roact.Change.TextBounds] = function(a1) -- Line: 77 -- upvalues: p1 (val)
        p1.SetCanvasSize(UDim2.new(1, 0, 0, a1.TextBounds.Y + 20))
    end
    v6.Text = createElement("TextLabel", v7, {Padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 0), PaddingLeft = UDim.new(0, 25), PaddingRight = UDim.new(0, 25), PaddingTop = UDim.new(0, 15)})})
    v4.Content = createElement("ScrollingFrame", v5, v6)
    v2.Window = createElement("Frame", v3, v4)
    return createElement("ScreenGui", v1, v2)
end
return v3