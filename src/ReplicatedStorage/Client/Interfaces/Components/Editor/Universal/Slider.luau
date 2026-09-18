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
--     File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Slider
--                               Dumped in 0.00224 seconds
--                          Bytecode version 9  |  20 functions

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
local UserInputService = game:GetService("UserInputService")
local Checkbox = require(v1.Parent:WaitForChild("Checkbox"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
return react.memo(function(p1) -- Line: 47 -- upvalues: useTextScale (val), useRem (val), react (val), useOrder (val), UserInputService (val), FillProps (val), Checkbox (val)
    local XY, u25, u32, u33, u38, v1, v2, v3, v4, v5, v6
    local Range = p1.Range
    if not Range then
        Range = NumberRange.new(0, 100)
    end
    local u8 = p1.Increment or 1
    local v7 = p1.FontSize or 14
    local v8 = p1.Upscale or 1
    local v9 = useTextScale()
    local v10 = useRem()
    local Default = p1.Default
    if not Default then
        Default = Range.Min
    end
    v6, u25 = react.useBinding(Default)
    local v11 = p1.ValueBinding or v6
    u32, u33 = react.useState(false)
    _, u38 = react.useState(false)
    local u42 = react.useRef(nil)
    local Toggleable = p1.Toggleable
    if Toggleable then
        Toggleable = p1.Toggleable.Visible
    end
    local v12 = useOrder()
    local v13 = p1.Divider ~= nil
    react.useEffect(function() -- Line: 72 -- upvalues: p1 (val), u25 (val)
        if not p1.ValueBinding and p1.Default then
            u25(p1.Default)
        end
    end, {p1.Default})
    local function roundNumber(p1) -- Line: 79
        return math.floor(p1 * 10000000000 + 0.5) / 10000000000
    end
    local function processValue(p1) -- Line: 86 -- upvalues: Range (val), u8 (val), roundNumber (val)
        local v1 = math.clamp(p1, Range.Min, Range.Max) - Range.Min
        local v2 = math.floor(v1 / u8 + 0.5)
        return roundNumber(v2 * u8 + Range.Min)
    end
    local function updateFromPosition(a1) -- Line: 95 -- upvalues: u42 (val), processValue (val), Range (val), p1 (val), u25 (val)
        local current = u42.current
        if not current then
            return
        end
        local v1 = math.clamp((a1.X - current.AbsolutePosition.X) / current.AbsoluteSize.X, 0, 1)
        local v2 = processValue(Range.Min + (Range.Max - Range.Min) * v1)
        if p1.ValueBinding then
            if not p1.Changed then
                return
            end
            p1.Changed(v2)
            return
        end
        u25(v2)
        if p1.Changed then
            p1.Changed(v2)
        end
    end
    react.useEffect(function() -- Line: 123 -- upvalues: u32 (val), UserInputService (upval), updateFromPosition (val), u33 (val)
        if not u32 then
            return
        end
        local u6 = UserInputService.InputChanged:Connect(function(p1) -- Line: 128 -- upvalues: updateFromPosition (upval)
            if p1.UserInputType == Enum.UserInputType.MouseMovement then
                updateFromPosition(p1.Position)
            end
        end)
        local u12 = UserInputService.InputEnded:Connect(function(p1) -- Line: 134 -- upvalues: u33 (upval)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                u33(false)
            end
        end)
        return function() -- Line: 140 -- upvalues: u6 (val), u12 (val)
            u6:Disconnect()
            u12:Disconnect()
        end
    end, {u32})
    local v14 = v11:map(function(p1) -- Line: 147 -- upvalues: Range (val)
        return (p1 - Range.Min) / (Range.Max - Range.Min)
    end)
    local v15 = v14:map(function(p1) -- Line: 150
        return UDim2.fromScale(p1, 1)
    end)
    local v16 = v14:map(function(p1) -- Line: 153
        return UDim2.fromScale(p1, 0.5)
    end)
    local v17 = v11:map(function(p1) -- Line: 156
        return "    " .. tostring(p1)
    end)
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v18 = {BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    if not v13 then
        v1 = UDim2.fromOffset(0, v10(24 * v8))
    else
        v1 = UDim2.fromOffset(0, v10(24 * v8))
    end
    v18.Size = v1
    if not v13 then
        XY = Enum.AutomaticSize.X
    else
        XY = Enum.AutomaticSize.XY
    end
    v18.AutomaticSize = XY
    local v19 = FillProps(Native, v18)
    local v20 = {}
    v18 = not v13
    if v18 then
        v18 = react.createElement("UIListLayout", {
            Padding = UDim.new(0, 5 * v8),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        })
    end
    v20.List = v18
    local Header = v13
    if Header then
        if Toggleable then
            local createElement_2 = react.createElement
            v2 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
            v3 = {}
            v5 = {
                Padding = UDim.new(0, 5 * v8),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }
            v3.List = react.createElement("UIListLayout", v5)
            v4 = Toggleable
            if v4 then
                local Default_2
                local createElement_3 = react.createElement
                v5 = {}
                if not p1.Toggleable then
                    Default_2 = false
                else
                    Default_2 = p1.Toggleable.Default
                end
                v5.Default = Default_2
                v5.Upscale = v8
                function v5.Toggled(a1) -- Line: 200 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v5.Native = {LayoutOrder = 1}
                v4 = createElement_3(Checkbox, v5)
            end
            v3.Checkbox = v4
            local Header_2 = p1.Header
            if Header_2 then
                Header_2 = react.createElement("TextLabel", {
                    TextTransparency = 0.32,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Text = p1.Header,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = v9(v7 * v8),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(0, v10(14 * v8)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
            v3.Body = Header_2
            Header = createElement_2("Frame", v2, v3)
        else
            Header = p1.Header
            if not Header then end
        end
    end
    v20.LeftColumn = Header
    v18 = not v13
    if v18 then
        v18 = Toggleable
        if v18 then
            local Default_3
            local createElement_4 = react.createElement
            v2 = {}
            if not p1.Toggleable then
                Default_3 = false
            else
                Default_3 = p1.Toggleable.Default
            end
            v2.Default = Default_3
            v2.Upscale = v8
            function v2.Toggled(a1) -- Line: 232 -- upvalues: p1 (val)
                if p1.Toggleable and p1.Toggleable.Changed then
                    p1.Toggleable.Changed(a1)
                end
            end
            v2.Native = {LayoutOrder = v12()}
            v18 = createElement_4(Checkbox, v2)
        end
    end
    v20.Checkbox = v18
    local Header_3 = not v13
    if Header_3 then
        Header_3 = p1.Header
        if Header_3 then
            Header_3 = react.createElement("TextLabel", {
                TextTransparency = 0.32,
                BackgroundTransparency = 1,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                Text = p1.Header,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = v9(v7 * v8),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                LayoutOrder = v12(),
                Size = UDim2.fromOffset(0, v10(14 * v8)),
                AutomaticSize = Enum.AutomaticSize.X,
            })
        end
    end
    v20.Body = Header_3
    local createElement_5 = react.createElement
    v2 = {BackgroundTransparency = 1}
    if not v13 then
        v3 = v12()
    else
        v3 = 0
    end
    v2.LayoutOrder = v3
    if not v13 then
        v3 = UDim2.fromOffset(0, 0)
    else
        v3 = UDim2.fromOffset(p1.Divider or 0, 0)
        if not v3 then
            v3 = UDim2.fromOffset(0, 0)
        end
    end
    v2.Position = v3
    v4 = v10(150 * v8)
    v2.Size = UDim2.fromOffset(v4, v10(18 * v8))
    v2.AutomaticSize = Enum.AutomaticSize.Y
    v3 = {Layout = react.createElement("UIListLayout", {
        Padding = UDim.new(0, 3 * v8),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })}
    v5 = {BackgroundColor3 = Color3.fromRGB(20, 23, 27), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 0)}
    local v21 = v10(105 * v8)
    v5.Size = UDim2.fromOffset(v21, v10(6 * v8))
    v5.LayoutOrder = 1
    v5.ref = u42
    v5[react.Event.MouseEnter] = function() -- Line: 285 -- upvalues: u38 (val)
        u38(true)
    end
    v5[react.Event.MouseLeave] = function() -- Line: 289 -- upvalues: u38 (val)
        u38(false)
    end
    local v22 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * v8)}), Fill = react.createElement("Frame", {BorderSizePixel = 0, ZIndex = 2, BackgroundColor3 = Color3.fromRGB(43, 177, 255), Size = v15}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * v8)})})}
    local v23 = {
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v16,
    }
    local v24 = v10(12 * v8)
    v23.Size = UDim2.fromOffset(v24, v10(12 * v8))
    local v25 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v26 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 4}
    v26[react.Event.MouseButton1Down] = function() -- Line: 328 -- upvalues: u33 (val)
        u33(true)
    end
    v25.Hitbox = react.createElement("TextButton", v26)
    v22.Handle = react.createElement("Frame", v23, v25)
    v23 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 1}
    v23[react.Event.MouseButton1Down] = function(p1) -- Line: 341 -- upvalues: UserInputService (upval), updateFromPosition (val), u33 (val)
        local MouseLocation = UserInputService:GetMouseLocation()
        updateFromPosition(MouseLocation)
        u33(true)
    end
    v22.BarHitbox = react.createElement("TextButton", v23)
    v3.SliderBar = react.createElement("Frame", v5, v22)
    v3.ValueDisplay = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = v17,
        TextColor3 = Color3.fromRGB(157, 157, 157),
        TextSize = v9(v7 * v8),
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.fromOffset(0, v10(14 * v8)),
        AutomaticSize = Enum.AutomaticSize.X,
    })
    v20.SliderContainer = createElement_5("Frame", v2, v3)
    return createElement("Frame", v19, v20)
end)