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
--       File: ReplicatedStorage.Client.Interfaces.Components.Inputs.DropdownInput
--                               Dumped in 0.00235 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local function DropdownInputEntry(p1) -- Line: 63 -- upvalues: useTextScale (val), useConstants (val), useTheme (val), react (val), Color (val)
    local v1, v2
    local v3 = useTextScale()
    local v4 = useConstants()
    local v5 = useTheme()
    local v6 = p1.Index % 2 == 0
    local createElement = react.createElement
    local v7 = {}
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = v5.PageBackground
    end
    if not v6 then
        v1 = 0.875
    else
        v1 = 0.95
    end
    if not v6 then
        v2 = 0
    else
        v2 = 0.05
    end
    v7.BackgroundColor3 = Color.Darken(Color_2, v1, v2)
    v7.BackgroundTransparency = 0
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v7.BorderSizePixel = 0
    local v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, v3(30))
    v7.Text = p1.Label
    v7.TextSize = v3(v4.TextSize.Small)
    v7.TextWrapped = true
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextYAlignment = Enum.TextYAlignment.Center
    v7.ZIndex = 2
    v7.LayoutOrder = p1.Index
    local Darken = Color.Darken
    local Primary = v5.Primary
    if not v6 then
        v1 = 0.8
    else
        v1 = 0.7 * (p1.Darken or 1)
        if not v1 then
            v1 = 0.8
        end
    end
    v7.TextColor3 = Darken(Primary, v1)
    v7[react.Event.MouseButton1Click] = function() -- Line: 96 -- upvalues: p1 (val)
        p1.Selected()
    end
    return createElement("TextButton", v7, {Padding = react.createElement("UIPadding", v4.Padding.Universal.Medium), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})
end
return function(p1) -- Line: 107 -- upvalues: useTextScale (val), useConstants (val), useTheme (val), useRem (val), react (val), useMotion (val), DropdownInputEntry (val), FillProps (val), Color (val), HeaderBodyComponent (val)
    local BackgroundTransparency, Header, Italic, Small, X, u13, u17, u18, u29, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useTextScale()
    local v10 = useConstants()
    local v11 = useTheme()
    local v12 = useRem()
    v7, u13 = react.useState(p1.Default)
    u17, u18 = react.useState(false)
    react.useEffect(function() -- Line: 119 -- upvalues: p1 (val), u13 (val)
        if not p1.Default then
            return
        end
        u13(function(a1) -- Line: 124 -- upvalues: p1 (upval)
            if a1 == p1.Default then
                return a1
            end
            if not a1 then
                return p1.Default
            end
            if table.find(p1.Options, a1) then
                return a1
            end
            return p1.Default
        end)
    end, {p1.Default, p1.Options})
    v8, u29 = useMotion(0.95)
    local v13 = {}
    local v14 = p1.Length or 250
    for i, v in ipairs(p1.Options) do
        v13[v] = react.createElement(DropdownInputEntry, {
            Label = v,
            Index = i,
            Color = p1.Color,
            Selected = function() -- Line: 146 -- upvalues: u13 (val), v (val), u18 (val), p1 (val)
                u13(v)
                u18(false)
                p1.Selected(v)
            end,
        })
    end
    react.useEffect(function() -- Line: 155 -- upvalues: p1 (val), u18 (val), u17 (val), u29 (val)
        if not p1.Visible then
            u18(false)
        end
        if p1.Opened then
            p1.Opened(u17)
        end
        if not u17 then
            u29:immediate(0.95)
            return
        end
        u29:spring(1, {frequency = 0.2})
    end, {u17, p1.Visible})
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v15 = {
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundColor3 = v11.Container.Background,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.576, 0.655),
    }
    if p1.Header then
        v1 = 1
    else
        v1 = 0
    end
    local v16 = UDim2.fromScale(v1, 0)
    local fromOffset = UDim2.fromOffset
    if p1.Header then
        v2 = 0
    else
        v2 = v12(v14 + 20)
    end
    v15.Size = v16 + fromOffset(v2, v12(70))
    v15.Visible = p1.Visible
    v15.BackgroundTransparency = v11.PageTransparency
    if p1.Header then
        X = Enum.AutomaticSize.None
    else
        X = Enum.AutomaticSize.X
    end
    v15.AutomaticSize = X
    local v17 = FillProps(Native, v15)
    local v18 = {}
    local createElement_2 = react.createElement
    if not p1.Full then
        Small = v10.Padding.Universal[p1.Padding or "Large"]
    else
        Small = v10.Padding.Universal.Small
    end
    v18.Padding = createElement_2("UIPadding", Small)
    v18.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    if not p1.Header then
        v15 = nil
    else
        v15 = react.createElement("UIStroke", {Thickness = 1, Color = v11.Container.Stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
    end
    v18.Stroke = v15
    local createElement_4 = react.createElement
    v16 = {}
    if not p1.Center then
        v1 = Vector2.new(1, 0.5)
    else
        v1 = Vector2.new(0.5, 0.5)
    end
    v16.AnchorPoint = v1
    if not p1.Center then
        v1 = UDim2.fromScale(1, 0.5)
    else
        v1 = UDim2.fromScale(0.5, 0.5)
    end
    v16.Position = v1
    if p1.Full then
        v3 = 1
    elseif p1.Header then
        v3 = 0.5
    else
        v3 = 0
    end
    v2 = UDim2.fromScale(v3, 0)
    local fromOffset_2 = UDim2.fromOffset
    if p1.Header then
        v4 = 0
    elseif not p1.Full then
        v4 = v12(v14)
    end
    v16.Size = v2 + fromOffset_2(v4, v9(30))
    v16.BackgroundColor3 = v11.Input.Background
    if not p1.Native then
        BackgroundTransparency = 0
    else
        BackgroundTransparency = p1.Native.BackgroundTransparency
    end
    v16.BackgroundTransparency = BackgroundTransparency
    v1 = {}
    v4 = {}
    local Radius = p1.Radius
    if not Radius then
        Radius = UDim.new(0, 4)
    end
    v4.CornerRadius = Radius
    v1.Corner = react.createElement("UICorner", v4)
    local createElement_5 = react.createElement
    v4 = {Transparency = 0}
    local OutlineColor = p1.OutlineColor
    if not OutlineColor then
        v6 = 2.7 * (p1.Darken or 1)
        v5 = Color.Darken(v11.PageBackground, v6, 0.15, 0.15)
        if not u17 then
            v6 = 0
        else
            v6 = 0.3
        end
        OutlineColor = Color.Brighten(v5, v6 * (p1.Darken or 1))
    end
    v4.Color = OutlineColor
    v1.Stroke = createElement_5("UIStroke", v4)
    v1.Padding = react.createElement("UIPadding", v10.Padding.combine(v10.Padding.Height.Small, v10.Padding.Width.Large))
    local createElement_6 = react.createElement
    v4 = {TextWrapped = true, BackgroundTransparency = 1}
    local new = Font.new
    local Regular = Enum.FontWeight.Regular
    if v7 then
        Italic = Enum.FontStyle.Normal
    else
        Italic = Enum.FontStyle.Italic
    end
    v4.FontFace = new("rbxasset://fonts/families/SourceSansPro.json", Regular, Italic)
    v4.Text = v7 or "Select an option..."
    if v7 then
        v6 = 0.8
    else
        v6 = 0.7
    end
    v4.TextColor3 = Color.Darken(v11.Primary, v6 * (p1.Darken or 1))
    v4.TextSize = v9(14)
    v4.TextXAlignment = Enum.TextXAlignment.Left
    v4.TextYAlignment = Enum.TextYAlignment.Center
    v4.AnchorPoint = Vector2.new(0, 0.5)
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v4.Position = UDim2.fromScale(0, 0.5)
    v4.Size = UDim2.fromScale(0.931, 0.191)
    v1.Body = createElement_6("TextLabel", v4)
    v4 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0)}
    v5 = UDim2.fromScale(0.5, 1)
    v4.Position = v5 + UDim2.fromOffset(0, v9(8))
    local v19 = UDim2.fromScale(1, 0)
    local v20 = v9(30)
    local v21 = v20 * math.clamp(#p1.Options, 1, 7) + 10
    v5 = v19 + UDim2.fromOffset(0, v21 + (#p1.Options - 1) * 5)
    v4.Size = v5 + UDim2.fromOffset(v10.Padding.Sizes.Large * 2, 0)
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = v11.PageBackground
    end
    v4.BackgroundColor3 = Color.Darken(Color_2, 0.8)
    v4.Visible = u17
    v1.Contents = react.createElement("Frame", v4, {UIScale = react.createElement("UIScale", {Scale = v8}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 7)}), Scrolling = react.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        Size = UDim2.fromScale(1, 1),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.fromOffset(0, 0),
        ScrollBarImageColor3 = Color.Darken(v11.PageBackground, 1.5),
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 5),
    })}, v13)})
    v1.Arrow = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://11421095840",
        ImageTransparency = 0.1,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.1, 0.5),
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v4 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 3}
    v4[react.Event.MouseButton1Click] = function() -- Line: 318 -- upvalues: u18 (val), u17 (val)
        u18(not u17)
    end
    v1.Button = react.createElement("TextButton", v4)
    v18.Dropdown = createElement_4("Frame", v16, v1)
    Header = p1.Header
    if Header then
        Header = p1.Body
        if Header then
            Header = react.createElement(HeaderBodyComponent, {Header = p1.Header, Body = p1.Body, Position = UDim2.fromScale(0, 0.5)})
        end
    end
    v18.Label = Header
    return createElement("Frame", v17, v18)
end