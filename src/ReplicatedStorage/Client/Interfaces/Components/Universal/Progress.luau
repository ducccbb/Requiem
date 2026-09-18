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
--        File: ReplicatedStorage.Client.Interfaces.Components.Universal.Progress
--                               Dumped in 0.00255 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local Hooks_6 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_6:WaitForChild("useTheme"))
local Inputs = v1.Parent.Parent:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local HeaderBodyComponent = require(v1.Parent:WaitForChild("HeaderBodyComponent"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
local function Segment(p1) -- Line: 71 -- upvalues: useTheme (val), useMotion (val), Color (val), useAsyncEffect (val), Promise (val), react (val)
    local u13, v1
    local u2 = useTheme()
    v1, u13 = useMotion(Color.Darken(u2.Container.Background, 1.7, 0.15, 0.2))
    useAsyncEffect(function() -- Line: 76 -- upvalues: p1 (val), Color (upval), u2 (val), u13 (val), Promise (upval)
        local Color_2
        if not p1.Enabled then
            Color_2 = Color.Darken(u2.Container.Background, 1.7, 0.15, 0.2)
        else
            Color_2 = p1.Color
        end
        if p1.Color and not p1.Enabled then
            Color_2 = Color.Darken(p1.Color, 0.4)
        end
        if p1.Animated then
            return Promise.delay((p1.Index - 1) * 0.07):andThen(function() -- Line: 88 -- upvalues: p1 (upval), u13 (upval), Color_2 (ref)
                if p1.Animated then
                    u13:spring(Color_2, {tension = 150, friction = 20, frequency = 1.5})
                end
            end)
        end
        u13:immediate(Color_2)
    end, {p1.Enabled, p1.Color})
    return react.createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = v1, Size = UDim2.fromScale(0, 1), LayoutOrder = p1.Index}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
end
return function(p1) -- Line: 108 -- upvalues: useConstants (val), useTextScale (val), useTheme (val), useRem (val), useMotion (val), react (val), Color (val), Segment (val), Error (val), FillProps (val), HeaderBodyComponent (val), Label (val), Button (val)
    local Max, Min, Range, Value, createElement, u54, v1, v2, v3, v4, v5
    local v6 = useConstants()
    local v7 = useTextScale()
    local v8 = useTheme()
    local v9 = useRem()
    local v10 = p1.Padding or "Large"
    local v11 = typeof(p1.Value) == "number"
    local v12 = not v11
    if not v12 then
        Value = p1.Value
    else
        Value = p1.Value:getValue()
    end
    if not p1.Range then
        Min = 0
    else
        Min = p1.Range.Min
    end
    if not p1.Range then
        Max = 1
    else
        Max = p1.Range.Max
    end
    local u44 = (Value - Min) / Max
    if not p1.Animated then
        v1 = u44
    else
        v1 = 0
    end
    v5, u54 = useMotion(v1)
    local v13 = {}
    Range = p1.Range
    if Range then
        Range = p1.Range.Max
    end
    v13[1] = p1.Value
    v13[2] = p1.Range
    v13[3] = u44
    v13[4] = Range
    v13[5] = Value
    react.useEffect(function() -- Line: 124 -- upvalues: p1 (val), u44 (val), u54 (val)
        if not p1.Animated or p1.Segments then
            if not p1.Segments then
                u54:immediate(u44)
            end
            return
        end
        if u44 ~= u44 then
            return
        end
        u54:spring(u44, {tension = 150, friction = 20, frequency = 1.5})
    end, v13)
    v13 = {p1.Enabled}
    react.useEffect(function() -- Line: 136 -- upvalues: p1 (val), u54 (val)
        if p1.Enabled == nil then
            return
        end
        if not p1.Enabled then
            u54:immediate(0)
        end
    end, v13)
    local Color_3 = p1.Color
    if not Color_3 then
        Color_3 = v8.PageBackground
    end
    local Color_4 = p1.Color
    if not Color_4 then
        Color_4 = v8.PageBackground
    end
    if not (Color.IsLight(Color_4)) then
        v13 = 0.4
    else
        v13 = -0.4
    end
    local Color_2 = if p1.Color then p1.Color else Color.Brighten(Color_3, v13, 0)
    local v14 = react.useMemo(function() -- Line: 156 -- upvalues: p1 (val), react (upval), Segment (upval), Value (val), Color_2 (ref)
        local Segments
        local v1 = {}
        if p1.Segments then
            local createElement, v2, v3, v4, v5
            Segments = p1.Segments
            local v6 = 1
            for i = 1, Segments, v6 do
                v2 = tostring(i)
                createElement = react.createElement
                v3 = {}
                v4 = false
                if i <= Value then
                    v5 = p1.Enabled == false
                    v4 = not v5
                end
                v3.Enabled = v4
                v3.Index = i
                v3.Color = Color_2
                v3.Animated = p1.Animated
                v1[v2] = createElement(Segment, v3)
            end
        end
        return v1
    end, {
        p1.Segments,
        p1.Enabled,
        p1.Animated,
        Value,
        p1.Range,
    })
    createElement = react.createElement
    local Boundary = Error.Boundary
    local v15 = {}
    local createElement_2 = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v16 = {BackgroundColor3 = v8.Container.Background, Position = UDim2.fromScale(0.568, 0.524)}
    local v17 = UDim2.fromScale(1, 0)
    v16.Size = v17 + UDim2.fromOffset(0, v9(p1.Height or 90))
    v16.BackgroundTransparency = v8.PageTransparency
    local v18 = FillProps(Native, v16)
    local v19 = {}
    v17 = {CornerRadius = UDim.new(0, 10)}
    v19.Corner = react.createElement("UICorner", v17)
    v19.Padding = react.createElement("UIPadding", v6.Padding.Universal[v10])
    local Header = p1.Header
    if Header then
        v17 = {AlignBottom = true, Header = p1.Header, Body = p1.Body, RichText = p1.RichText}
        v2 = UDim2.fromScale(0, 0.5)
        if not p1.Body then
            v4 = 20
        else
            v4 = 15
        end
        v17.Position = v2 + UDim2.new(0, 0, 0, -v7(v4))
        Header = react.createElement(HeaderBodyComponent, v17)
    end
    v19.Label = Header
    local Display = p1.Display
    if Display then
        local Max_2, Max_3
        local createElement_3 = react.createElement
        v17 = {TextTransparency = 0.46}
        if not p1.Range then
            Max_2 = 1
        else
            Max_2 = p1.Range.Max
        end
        v2 = tostring((math.floor(u44 * Max_2)))
        if not p1.Range then
            Max_3 = 1
        else
            Max_3 = p1.Range.Max
        end
        v17.Text = v2 .. " / " .. tostring(Max_3)
        v17.AnchorPoint = Vector2.new(1, 0.5)
        v17.TextXAlignment = Enum.TextXAlignment.Right
        v17.TextYAlignment = Enum.TextYAlignment.Bottom
        v2 = UDim2.fromScale(1, 0)
        if not p1.Body then
            v4 = 8
        else
            v4 = -20
        end
        v17.Position = v2 + UDim2.new(0, 0, 0, -v7(v4))
        Display = createElement_3(Label, v17)
    end
    v19.Displayed = Display
    local Button_2 = p1.Button
    if Button_2 then
        v17 = {Text = p1.Button, Clicked = p1.Clicked, Type = p1.ButtonType or nil}
        local ButtonColor = p1.ButtonColor
        if not ButtonColor then
            ButtonColor = Color3.fromRGB(42, 70, 42)
        end
        v17.Color = ButtonColor
        v17.TextColor = p1.ButtonTextColor or nil
        v17.Brightness = p1.ButtonBrightness or nil
        v17.Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.25)}
        Button_2 = react.createElement(Button, v17)
    end
    v19.Button = Button_2
    v17 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0)}
    v2 = UDim2.fromScale(1, 0.5)
    if not p1.Body then
        v4 = 20
    else
        v4 = 15
    end
    v17.Position = v2 + UDim2.new(0, 0, 0, -v7(v4))
    v2 = UDim2.fromScale(0.7, 0)
    v17.Size = v2 + UDim2.fromOffset(0, v7(22))
    local v20 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}
    v19.Child = react.createElement("Frame", v17, v20, p1.children)
    local createElement_4 = react.createElement
    v17 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color.Darken(v8.PageBackground, 1.7, 0.15, 0.2), BorderColor3 = Color3.fromRGB(0, 0, 0)}
    v2 = UDim2.fromScale(0.5, 0.5)
    local new = UDim2.new
    local v21 = 0
    if not p1.Header then
        v3 = 0
    else
        local v22
        if not p1.Body then
            v22 = 10
        else
            v22 = 15
        end
        v3 = v7(v22)
    end
    v17.Position = v2 + new(0, v21, 0, v3)
    v2 = UDim2.fromScale(1, 0)
    v17.Size = v2 + UDim2.new(0, 0, 0, v7(5))
    if not p1.Segments then
        v20 = 0
    else
        v20 = 1
    end
    v17.BackgroundTransparency = v20
    v20 = {}
    local createElement_5 = react.createElement
    local v23 = {BorderSizePixel = 0, BackgroundColor3 = Color_2}
    if p1.Segments then
        v21 = UDim2.fromScale(1, 1)
    elseif not v12 then
        v21 = v5:map(function(p1) -- Line: 266
            return UDim2.fromScale(p1, 1)
        end)
    else
        v21 = p1.Value:map(function(p1) -- Line: 260
            local v1 = (function(p1, p2, p3) -- Line: 261
                return p1 + (p2 - p1) * p3
            end)(0, 1, p1)
            return UDim2.fromScale(v1, 1)
        end)
        if not v21 then
            v21 = v5:map(function(p1) -- Line: 266
                return UDim2.fromScale(p1, 1)
            end)
        end
    end
    v23.Size = v21
    if not p1.Segments then
        v21 = 0
    else
        v21 = 1
    end
    v23.BackgroundTransparency = v21
    v20.Fill = createElement_5("Frame", v23, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        SortOrder = Enum.SortOrder.LayoutOrder,
        ItemLineAlignment = Enum.ItemLineAlignment.Automatic,
        Padding = UDim.new(0, 5),
    })}, v14)
    v20.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v19.Value = createElement_4("Frame", v17, v20)
    v15[1] = createElement_2("Frame", v18, v19)
    return createElement(Boundary, {}, v15)
end