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
--     File: ReplicatedStorage.Client.Interfaces.Components.Inputs.NumberSliderInput
--                               Dumped in 0.00185 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Button = require(v1.Parent:WaitForChild("Button"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
return function(p1) -- Line: 62 -- upvalues: useConstants (val), useTextScale (val), useTheme (val), useRem (val), react (val), UserInputService (val), Color (val), Error (val), FillProps (val), HeaderBodyComponent (val), Label (val), Button (val)
    local Maximum, u12, u13, u17, u18, u22, u23, u27, u28, v1, v2, v3
    local v4 = useConstants()
    local v5 = useTextScale()
    local v6 = useTheme()
    local v7 = useRem()
    u12, u13 = react.useState(p1.Initial)
    u17, u18 = react.useState(nil)
    u22, u23 = react.useState(nil)
    u27, u28 = react.createBinding(u12)
    react.useEffect(function() -- Line: 75 -- upvalues: u13 (val), p1 (val), u28 (val)
        u13(p1.Initial)
        p1.Update(p1.Initial)
        u28(p1.Initial)
    end, {p1.Initial})
    local function disconnect(a1, p2) -- Line: 83 -- upvalues: u17 (val), u22 (val), p1 (val), u27 (val)
        local v1 = p2
        if not v1 then
            v1 = u17
        end
        local v2 = a1
        if not v2 then
            v2 = u22
        end
        if v1 then
            v1:Disconnect()
        end
        if v2 then
            v2:Disconnect()
        end
        p1.Update(u27:getValue())
    end
    local function getAbsoluteBounds(p1) -- Line: 98
        local AbsolutePosition = p1.AbsolutePosition
        local AbsoluteSize = p1.AbsoluteSize
        return AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + 58, AbsolutePosition.Y + AbsoluteSize.Y + 58
    end
    local function updateValueSlider(a1) -- Line: 111 -- upvalues: UserInputService (upval), getAbsoluteBounds (val), u13 (val), u28 (val), disconnect (val), p1 (val), u18 (val), u23 (val)
        local u7, u8
        local MouseLocation = UserInputService:GetMouseLocation()
        u7, u8 = getAbsoluteBounds(a1)
        local v1 = math.clamp((MouseLocation.X - u7) / (u8 - u7), 0, 1)
        u13(v1)
        u28(v1)
        local u26 = nil
        disconnect()
        local u35 = UserInputService.InputChanged:Connect(function(a1) -- Line: 123 -- upvalues: UserInputService (upval), u7 (val), u8 (val), u13 (upval), u28 (upval), p1 (upval)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local v1 = UserInputService:GetMouseLocation().X - u7
                local v2 = math.clamp(v1 / (u8 - u7), 0, 1)
                u13(v2)
                u28(v2)
                if p1.Stepped then
                    p1.Stepped(v2)
                end
            end
        end)
        u26 = UserInputService.InputEnded:Connect(function(p1) -- Line: 138 -- upvalues: disconnect (upval), u35 (ref), u26 (ref)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                disconnect(u35, u26)
            end
        end)
        u18(u35)
        u23(u26)
    end
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = v6.Container.Background
    end
    if not (Color.IsLight(Color_2)) then
        v2 = 0.4
    else
        v2 = -0.25
    end
    local v8 = Color.Brighten(Color_2, v2, 0)
    if p1.Minimum == nil then
        if p1.Maximum == nil then
            v1 = math.round(u12 * 100)
            Maximum = 100
        else
            v1 = math.round(u12 * p1.Maximum)
            Maximum = p1.Maximum
        end
    elseif p1.Maximum ~= nil then
        v1 = math.round(u12 * (p1.Maximum - p1.Minimum) + p1.Minimum)
        Maximum = p1.Maximum
    end
    local v9 = tostring(v1)
    local v10 = v9 .. "/" .. tostring(Maximum)
    local createElement = react.createElement
    local Boundary = Error.Boundary
    local v11 = {}
    local createElement_2 = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v12 = {BackgroundColor3 = Color_2, Position = UDim2.fromScale(0.568, 0.524)}
    local v13 = UDim2.fromScale(1, 0)
    v12.Size = v13 + UDim2.new(0, 0, 0, v7(70))
    v12.BackgroundTransparency = v6.PageTransparency
    local v14 = FillProps(Native, v12)
    local v15 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    if not p1.Header then
        v12 = nil
    elseif p1.Body then
        v12 = react.createElement("UIStroke", {Thickness = 1, Color = v6.Container.Stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
    end
    v15.Stroke = v12
    v15.Padding = react.createElement("UIPadding", v4.Padding.Universal.Large)
    v13 = {Header = p1.Header, Body = p1.Body, RichText = p1.RichText}
    local v16 = UDim2.fromScale(0, 0.5)
    v13.Position = v16 + UDim2.new(0, 0, 0, -v5(15))
    v15.Label = react.createElement(HeaderBodyComponent, v13)
    v13 = {
        TextScaled = false,
        TextTransparency = 0.5,
        Text = v10,
        Visible = p1.Display,
        TextXAlignment = Enum.TextXAlignment.Right,
        Font = Enum.Font.SourceSans,
        TextSize = v5(15),
        AnchorPoint = Vector2.new(1, 0.5),
    }
    v16 = UDim2.fromScale(1, 0.5)
    v13.Position = v16 + UDim2.new(0, 0, 0, -v5(15))
    v16 = UDim2.fromScale(0, 0)
    v13.Size = v16 + UDim2.new(0, 200, 0, v5(15))
    v15.Display = react.createElement(Label, v13)
    local Button_2 = p1.Button
    if Button_2 then
        Button_2 = react.createElement(Button, {
            Text = p1.Button,
            Color = Color3.fromRGB(42, 70, 42),
            Clicked = function() -- Line: 220 -- upvalues: p1 (val), u12 (val)
                if p1.Clicked then
                    p1.Clicked(u12)
                end
            end,
            Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.225)},
        })
    end
    v15.Button = Button_2
    v13 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    if not (Color.IsLight(Color_2)) then
        v3 = 1.7
    else
        v3 = 0.3
    end
    v13.BackgroundColor3 = Color.Darken(Color_2, v3, 0.15, 0.2)
    v13.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v16 = UDim2.fromScale(0.5, 0.5)
    v13.Position = v16 + UDim2.new(0, 0, 0, v5(15))
    v16 = UDim2.fromScale(1, 0)
    v13.Size = v16 + UDim2.new(0, 0, 0, v5(5))
    local v17 = {}
    local v18 = {
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v8,
        Position = u27:map(function(p1) -- Line: 244
            return UDim2.fromScale(p1, 0.5)
        end),
    }
    local v19 = v5(12)
    v18.Size = UDim2.new(0, v19, 0, v5(12))
    v17.Cursor = react.createElement("Frame", v18, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v17.Fill = react.createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = v8, Size = u27:map(function(p1) -- Line: 258
        return UDim2.fromScale(p1, 1)
    end)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v18 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Text = "",
        Size = UDim2.fromScale(1, 5.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v18[react.Event.MouseButton1Down] = updateValueSlider
    v17.Button = react.createElement("TextButton", v18)
    v17.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v15.Value = react.createElement("Frame", v13, v17)
    v11[1] = createElement_2("Frame", v14, v15)
    return createElement(Boundary, {}, v11)
end