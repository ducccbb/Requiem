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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dropdown
--                               Dumped in 0.00106 seconds
--                          Bytecode version 9  |  10 functions

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
local Cryo = require(Libraries:WaitForChild("Cryo"))
local createElement = Roact.createElement
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 20 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(Vector2.new())
    p1.Size = v1
    p1.SetSize = v2
    p1:setState({AreOptionsVisible = false})
end
function v3:BuildButtonList() -- Line: 27 -- upvalues: createElement (val), Roact (val)
    local v1, v2
    local v3 = {}
    local u52 = self
    for i, v in ipairs(self.props.Options) do
        v1 = {}
        if u52.props.CurrentOption ~= v then
            v2 = 1
        else
            v2 = 0.1
        end
        v1.BackgroundTransparency = v2
        v1.BackgroundColor3 = Color3.fromRGB(0, 145, 255)
        v1.BorderSizePixel = 0
        v1.Font = Enum.Font.GothamBold
        v1.Text = v
        v1.TextColor3 = Color3.fromRGB(255, 255, 255)
        v1.TextSize = 10
        v1.TextXAlignment = Enum.TextXAlignment.Left
        v1.TextYAlignment = Enum.TextYAlignment.Center
        v1.ZIndex = 3
        v1[Roact.Event.MouseEnter] = function(p1) -- Line: 41
            p1.BackgroundTransparency = 0.2
        end
        v1[Roact.Event.InputEnded] = function(p1) -- Line: 44 -- upvalues: u52 (val), v (val)
            local v1
            if u52.props.CurrentOption ~= v then
                v1 = 1
            else
                v1 = 0.1
            end
            p1.BackgroundTransparency = v1
        end
        v1[Roact.Event.Activated] = function(p1) -- Line: 47 -- upvalues: u52 (val), v (val)
            u52:setState({AreOptionsVisible = false})
            u52.props.OnOptionSelected(v)
        end
        table.insert(v3, createElement("TextButton", v1, {Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6)}), Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}))
    end
    return v3
end
function v3.render(p1) -- Line: 66 -- upvalues: createElement (val), Roact (val), Cryo (val)
    local MaxRows
    local v1 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Position = p1.props.Position,
        Size = p1.props.Size,
        Image = "",
    }
    v1[Roact.Change.AbsoluteSize] = function(a1) -- Line: 74 -- upvalues: p1 (val)
        p1.SetSize(a1.AbsoluteSize)
    end
    v1[Roact.Event.Activated] = function(a1) -- Line: 77 -- upvalues: p1 (val)
        p1:setState({AreOptionsVisible = not p1.state.AreOptionsVisible})
    end
    local v2 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), CurrentOption = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        Text = p1.props.CurrentOption or "*",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Position = UDim2.new(0, 6, 0, 0),
        Size = UDim2.new(1, -32, 1, 0),
    }), Arrow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://134367382",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -3, 0.5, 0),
        Size = UDim2.new(0, 20, 0, 20),
    })}
    local v3 = {
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 2,
        Visible = p1.state.AreOptionsVisible,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 0, 1, 1),
    }
    local new = UDim2.new
    local v4 = math.ceil(#p1.props.Options / p1.props.MaxRows)
    local v5 = #p1.props.Options
    if p1.props.MaxRows >= v5 then
        MaxRows = #p1.props.Options
    else
        MaxRows = p1.props.MaxRows
        if not MaxRows then
            MaxRows = #p1.props.Options
        end
    end
    v3.Size = new(v4, 0, MaxRows, 0)
    v4 = p1:BuildButtonList()
    v2.Options = createElement("Frame", v3, Cryo.Dictionary.join(v4, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Layout = createElement("UIGridLayout", {
        CellPadding = UDim2.new(),
        CellSize = p1.Size:map(function(p1) -- Line: 121
            return UDim2.fromOffset(p1.X, p1.Y)
        end),
        FillDirection = Enum.FillDirection.Vertical,
        FillDirectionMaxCells = p1.props.MaxRows,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        StartCorner = Enum.StartCorner.TopLeft,
    })}))
    return createElement("ImageButton", v1, v2)
end
return v3