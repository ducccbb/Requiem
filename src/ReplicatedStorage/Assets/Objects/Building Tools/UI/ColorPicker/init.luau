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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ColorPicker
--                               Dumped in 0.00260 seconds
--                          Bytecode version 9  |  37 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
v2 = v1:FindFirstAncestorWhichIsA("Tool")
local Libraries = v2:WaitForChild("Libraries")
local Vendor = v2:WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local fastSpawn = require(Libraries:WaitForChild("fastSpawn"))
local createElement = Roact.createElement
local Slider = require(v1:WaitForChild("Slider"))
local u53 = Roact.PureComponent:extend(v1.Name)
function u53.init(p1) -- Line: 24 -- upvalues: Maid (val), Roact (val)
    local v1, v2, v3, v4, v5
    p1.Maid = Maid.new()
    local InitialColor = p1.props.InitialColor
    if not InitialColor then
        InitialColor = Color3.fromHSV(0, 0.5, 1)
    end
    v1, v2, v3 = InitialColor:ToHSV()
    v4, v5 = Roact.createBinding({H = v1, S = v2, V = v3})
    p1.HSV = v4
    p1._SetHSV = v5
end
function u53.didUpdate(p1, p2) -- Line: 36
    local InitialColor
    if p2.InitialColor ~= p1.props.InitialColor then
        local v1, v2, v3
        InitialColor = p1.props.InitialColor
        if not InitialColor then
            InitialColor = Color3.fromHSV(0, 0.5, 1)
        end
        v1, v2, v3 = InitialColor:ToHSV()
        p1._SetHSV({H = v1, S = v2, V = v3})
    end
end
function u53:SetHSV(p2) -- Line: 49 -- upvalues: fastSpawn (val)
    self._SetHSV(p2)
    if self.props.SetPreviewColor then
        fastSpawn(function() -- Line: 52 -- upvalues: self (val), p2 (val)
            self.props.SetPreviewColor(Color3.fromHSV(p2.H, p2.S, p2.V))
        end)
    end
end
function u53:Finish() -- Line: 58 -- upvalues: fastSpawn (val)
    if self.props.SetPreviewColor then
        fastSpawn(function() -- Line: 60 -- upvalues: self (val)
            self.props.SetPreviewColor(nil)
        end)
    end
    if self.props.OnConfirm then
        local v1 = self.HSV:getValue()
        local u17 = Color3.fromHSV(v1.H, v1.S, v1.V)
        fastSpawn(function() -- Line: 67 -- upvalues: self (val), u17 (val)
            self.props.OnConfirm(u17)
        end)
    end
end
function u53:Cancel() -- Line: 73 -- upvalues: fastSpawn (val)
    if self.props.SetPreviewColor then
        fastSpawn(function() -- Line: 75 -- upvalues: self (val)
            self.props.SetPreviewColor(nil)
        end)
    end
    if self.props.OnCancel then
        fastSpawn(function() -- Line: 80 -- upvalues: self (val)
            self.props.OnCancel()
        end)
    end
end
function u53.render(p1) -- Line: 86 -- upvalues: createElement (val), Roact (val), u53 (val), Slider (val)
    local v1 = {DisplayOrder = 1}
    local v2 = {}
    local v3 = {Active = true, Draggable = true, ZIndex = 0, AnchorPoint = Vector2.new(1, 0.5)}
    local DefaultPosition = p1.DefaultPosition
    if not DefaultPosition then
        DefaultPosition = UDim2.new(1, -110, 0.5, 0)
    end
    v3.Position = DefaultPosition
    v3.BackgroundTransparency = 1
    v3.Size = UDim2.fromOffset(240, 0)
    v3[Roact.Change.Position] = function(p1) -- Line: 98 -- upvalues: u53 (upval)
        u53.DefaultPosition = p1.Position
    end
    local v4 = {}
    local v5 = {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder}
    v5[Roact.Change.AbsoluteContentSize] = function(p1) -- Line: 105
        p1.Parent.Size = UDim2.fromOffset(240, p1.AbsoluteContentSize.Y)
    end
    v4.Layout = createElement("UIListLayout", v5)
    v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 0, Size = UDim2.new(1, 0, 0, 0)}
    local v6 = {}
    local v7 = {Padding = UDim.new(0, 10), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder}
    v7[Roact.Change.AbsoluteContentSize] = function(p1) -- Line: 119
        p1.Parent.Size = UDim2.new(1, 0, 0, p1.AbsoluteContentSize.Y)
    end
    v6.Layout = createElement("UIListLayout", v7)
    v6.Color = createElement("Frame", {BorderSizePixel = 0, Size = UDim2.new(0.25, 0, 1, 0), BackgroundColor3 = p1.HSV:map(function(p1) -- Line: 126
        return Color3.fromHSV(p1.H, p1.S, p1.V)
    end)}, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v7 = {BackgroundTransparency = 1, Position = UDim2.new(0.25, 5, 0, 0), Size = UDim2.new(0.75, 0, 0, 0)}
    local v8 = {}
    local v9 = {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }
    v9[Roact.Change.AbsoluteContentSize] = function(p1) -- Line: 148
        p1.Parent.Size = UDim2.new(0.75, 0, 0, p1.AbsoluteContentSize.Y)
    end
    v8.Layout = createElement("UIListLayout", v9)
    v8.HueSlider = createElement(Slider, {
        LayoutOrder = 0,
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Value = p1.HSV:map(function(p1) -- Line: 156
            return p1.H
        end),
        OnValueChanged = function(a1) -- Line: 159 -- upvalues: p1 (val)
            local v1 = p1.HSV:getValue()
            p1:SetHSV({H = a1, S = v1.S, V = v1.V})
        end,
    }, {Gradient = createElement("UIGradient", {Color = p1.HSV:map(function(p1) -- Line: 169
        local v1 = {}
        local v2 = ColorSequenceKeypoint.new(0, Color3.fromHSV(0, p1.S, p1.V))
        local v3 = ColorSequenceKeypoint.new(0.16666666666666666, Color3.fromHSV(0.16666666666666666, p1.S, p1.V))
        local v4 = ColorSequenceKeypoint.new(0.3333333333333333, Color3.fromHSV(0.3333333333333333, p1.S, p1.V))
        local v5 = ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, p1.S, p1.V))
        local v6 = ColorSequenceKeypoint.new(0.6666666666666666, Color3.fromHSV(0.6666666666666666, p1.S, p1.V))
        local v7 = ColorSequenceKeypoint.new(0.8333333333333334, Color3.fromHSV(0.8333333333333334, p1.S, p1.V))
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        v1[4] = v5
        v1[5] = v6
        v1[6] = v7
        v1[7] = ColorSequenceKeypoint.new(1, Color3.fromHSV(1, p1.S, p1.V))
        return ColorSequence.new(v1)
    end)})})
    v8.SaturationSlider = createElement(Slider, {
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Value = p1.HSV:map(function(p1) -- Line: 186
            return p1.S
        end),
        OnValueChanged = function(a1) -- Line: 189 -- upvalues: p1 (val)
            local v1 = p1.HSV:getValue()
            p1:SetHSV({H = v1.H, S = a1, V = v1.V})
        end,
    }, {Gradient = createElement("UIGradient", {Color = p1.HSV:map(function(p1) -- Line: 199
        local v1 = Color3.fromHSV(p1.H, 0, p1.V)
        return ColorSequence.new(v1, Color3.fromHSV(p1.H, 1, p1.V))
    end)})})
    v8.BrightnessSlider = createElement(Slider, {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Value = p1.HSV:map(function(p1) -- Line: 211
            return p1.V
        end),
        OnValueChanged = function(a1) -- Line: 214 -- upvalues: p1 (val)
            local v1 = p1.HSV:getValue()
            p1:SetHSV({H = v1.H, S = v1.S, V = a1})
        end,
    }, {Gradient = createElement("UIGradient", {Color = p1.HSV:map(function(p1) -- Line: 224
        local v1 = Color3.fromHSV(p1.H, p1.S, 0)
        return ColorSequence.new(v1, Color3.fromHSV(p1.H, p1.S, 1))
    end)})})
    v6.Sliders = createElement("Frame", v7, v8)
    v4.Picker = createElement("Frame", v5, v6)
    v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 34)}
    v6 = {}
    v7 = {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 7),
        Font = Enum.Font.GothamBlack,
        Text = "HSV: ",
        TextSize = 11,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeTransparency = 0.95,
    }
    v7[Roact.Change.TextBounds] = function(p1) -- Line: 248
        p1.Size = UDim2.fromOffset(p1.TextBounds.X, p1.TextBounds.Y)
    end
    v8 = {}
    v9 = {
        BackgroundTransparency = 1,
        Position = UDim2.new(1, 0, 0, 0),
        ClearTextOnFocus = false,
        Font = Enum.Font.Gotham,
        Text = p1.HSV:map(function(p1) -- Line: 257
            local v1 = tostring((math.floor(p1.H * 360))) .. "°"
            local v2 = tostring((math.floor(p1.S * 100))) .. "%"
            local v3 = tostring((math.floor(p1.V * 100))) .. "%"
            return v1 .. ", " .. v2 .. ", " .. v3
        end),
        TextSize = 11,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeTransparency = 0.95,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    v9[Roact.Change.TextBounds] = function(p1) -- Line: 267
        p1.Size = UDim2.fromOffset(p1.TextBounds.X, p1.TextBounds.Y)
    end
    v9[Roact.Event.FocusLost] = function(a1) -- Line: 270 -- upvalues: p1 (val)
        local v1, v2, v3
        v1, v2, v3 = a1.Text:match("([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)")
        if v1 and v2 and v3 then
            local v4 = {}
            local v5 = tonumber(v1) / 360
            v4.H = math.clamp(v5, 0, 1)
            v5 = tonumber(v2) / 100
            v4.S = math.clamp(v5, 0, 1)
            v5 = tonumber(v3) / 100
            v4.V = math.clamp(v5, 0, 1)
            p1:SetHSV(v4)
        end
    end
    v8.HSVInput = createElement("TextBox", v9)
    v6.HSVLabel = createElement("TextLabel", v7, v8)
    v7 = {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 22),
        Font = Enum.Font.GothamBlack,
        Text = "RGB: ",
        TextSize = 11,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeTransparency = 0.95,
    }
    v7[Roact.Change.TextBounds] = function(p1) -- Line: 290
        p1.Size = UDim2.fromOffset(p1.TextBounds.X, p1.TextBounds.Y)
    end
    v8 = {}
    v9 = {
        BackgroundTransparency = 1,
        Position = UDim2.new(1, 0, 0, 0),
        ClearTextOnFocus = false,
        Font = Enum.Font.Gotham,
        Text = p1.HSV:map(function(p1) -- Line: 299
            local v1 = Color3.fromHSV(p1.H, p1.S, p1.V)
            local v2 = tostring((math.round(v1.R * 255)))
            local v3 = tostring((math.round(v1.G * 255)))
            return v2 .. ", " .. v3 .. ", " .. tostring((math.round(v1.B * 255)))
        end),
        TextSize = 11,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeTransparency = 0.95,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    v9[Roact.Change.TextBounds] = function(p1) -- Line: 310
        p1.Size = UDim2.fromOffset(p1.TextBounds.X, p1.TextBounds.Y)
    end
    v9[Roact.Event.FocusLost] = function(a1) -- Line: 313 -- upvalues: p1 (val)
        local v1, v2, v3
        v1, v2, v3 = a1.Text:match("([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)")
        if v1 and v2 and v3 then
            local v4 = tonumber(v1)
            local v5 = math.clamp(v4, 0, 255)
            local v6 = tonumber(v2)
            v4 = math.clamp(v6, 0, 255)
            local v7 = tonumber(v3)
            v5, v4, v6 = Color3.fromRGB(v5, v4, (math.clamp(v7, 0, 255))):ToHSV()
            p1:SetHSV({H = v5, S = v4, V = v6})
        end
    end
    v8.RGBInput = createElement("TextBox", v9)
    v6.RGBLabel = createElement("TextLabel", v7, v8)
    v7 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 23, 0, 23),
        Position = UDim2.new(1, 0, 1, 0),
        AnchorPoint = Vector2.new(1, 1),
        Image = "rbxassetid://2132729935",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 34, 34),
        SliceScale = 0.5,
    }
    v7[Roact.Event.Activated] = function(a1) -- Line: 341 -- upvalues: p1 (val)
        p1:Finish()
    end
    v6.ConfirmButton = createElement("ImageButton", v7, {Label = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "✔",
        TextSize = 12,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.GothamSemibold,
        TextColor3 = Color3.fromRGB(0, 0, 0),
    })})
    v7 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 25, 0, 23),
        Position = UDim2.new(1, -30, 1, 0),
        AnchorPoint = Vector2.new(1, 1),
        Image = "rbxassetid://2218340938",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 34, 34),
        SliceScale = 0.5,
    }
    v7[Roact.Event.Activated] = function(a1) -- Line: 363 -- upvalues: p1 (val)
        p1:Cancel()
    end
    v8 = {}
    v9 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Text = "Cancel",
        Font = Enum.Font.GothamSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextStrokeTransparency = 0.95,
    }
    v9[Roact.Change.TextBounds] = function(p1) -- Line: 375
        p1.Parent.Size = UDim2.new(0, p1.TextBounds.X + 10, 0, 23)
    end
    v8.Label = createElement("TextLabel", v9)
    v6.CancelButton = createElement("ImageButton", v7, v8)
    v4.Bottom = createElement("Frame", v5, v6)
    v2.Dialog = createElement("Frame", v3, v4)
    return createElement("ScreenGui", v1, v2)
end
return u53