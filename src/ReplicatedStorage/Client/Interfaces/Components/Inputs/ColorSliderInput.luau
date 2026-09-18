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
--     File: ReplicatedStorage.Client.Interfaces.Components.Inputs.ColorSliderInput
--                               Dumped in 0.00135 seconds
--                          Bytecode version 9  |  8 functions

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
require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
return function(p1) -- Line: 53 -- upvalues: useTextScale (val), useTheme (val), useConstants (val), react (val), UserInputService (val), FillProps (val), HeaderBodyComponent (val)
    local Max, Min, u10, u11, u16, u17, u20, u21, u48, u49, u53, u54, v1
    local v2 = useTextScale()
    local v3 = useTheme()
    local v4 = useConstants()
    u10, u11 = react.useState(p1.Initial)
    u16, u17 = react.useState(p1.DefaultPercent or 0)
    u20, u21, v1 = Color3.toHSV(u10)
    if not p1.Range then
        Min = 0
    else
        Min = p1.Range.Min
    end
    if not p1.Range then
        Max = 1
    else
        Max = p1.Range.Max
        if not Max then
            Max = 1
        end
    end
    u48, u49 = react.useState(nil)
    u53, u54 = react.useState(nil)
    react.useEffect(function() -- Line: 68 -- upvalues: u48 (val), p1 (val), u10 (val), u16 (val)
        if u48 then
            return
        end
        p1.Update(u10, u16)
    end, {u10, u48})
    local function disconnect(p1, p2) -- Line: 76 -- upvalues: u48 (val), u53 (val), u49 (val)
        local v1 = p2
        if not v1 then
            v1 = u48
        end
        local v2 = p1
        if not v2 then
            v2 = u53
        end
        if v1 then
            v1:Disconnect()
        end
        if v2 then
            v2:Disconnect()
        end
        u49(nil)
    end
    local function getAbsoluteBounds(p1) -- Line: 91
        local AbsolutePosition = p1.AbsolutePosition
        local AbsoluteSize = p1.AbsoluteSize
        return AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + 58, AbsolutePosition.Y + AbsoluteSize.Y + 58
    end
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v5 = FillProps(Native, {
        BorderSizePixel = 0,
        BackgroundColor3 = v3.Container.Background,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.568, 0.524),
        Size = UDim2.fromScale(0.417, 0.133),
        BackgroundTransparency = v3.PageTransparency,
    })
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Padding = react.createElement("UIPadding", v4.Padding.Universal.Large)}
    local v7 = {Header = p1.Header, Body = p1.Body}
    local v8 = UDim2.fromScale(0, 0.5)
    v7.Position = v8 + UDim2.new(0, 0, 0, -v2(15))
    v6.Label = react.createElement(HeaderBodyComponent, v7)
    v7 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = p1.Initial, BorderColor3 = Color3.fromRGB(0, 0, 0)}
    v8 = UDim2.fromScale(0.5, 0.5)
    v7.Position = v8 + UDim2.new(0, 0, 0, v2(22.5))
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.new(0, 0, 0, v2(8))
    local v9 = {Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v3.Container.Stroke})}
    local v10 = {}
    local v11 = {}
    local v12 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
    v11[1] = v12
    v11[2] = ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    v10.Color = ColorSequence.new(v11)
    v9.Gradient = react.createElement("UIGradient", v10)
    v10 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u10,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1 - math.clamp(v1, Min, Max), 0.5),
    }
    v12 = v2(4)
    v10.Size = UDim2.new(0, v12, 0, v2(15))
    v9.Cursor = react.createElement("Frame", v10, {uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v10 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
    }
    v10[react.Event.MouseButton1Down] = function(a1) -- Line: 104 -- upvalues: UserInputService (upval), getAbsoluteBounds (val), p1 (val), u17 (val), u11 (val), u20 (val), u21 (val), disconnect (val), u49 (val), u54 (val)
        local Max, Min, u7, u8
        local MouseLocation = UserInputService:GetMouseLocation()
        u7, u8 = getAbsoluteBounds(a1)
        local v1 = 1 - math.clamp((MouseLocation.X - u7) / (u8 - u7), 0, 1)
        if not p1.Range then
            Min = 0
        else
            Min = p1.Range.Min
        end
        if not p1.Range then
            Max = 1
        else
            Max = p1.Range.Max
            if not Max then
                Max = 1
            end
        end
        v1 = math.clamp(v1, Min, Max)
        u17(v1)
        u11(Color3.fromHSV(u20, u21, v1))
        local u55 = nil
        disconnect()
        local u62 = Color3.fromHSV(u20, u21, v1)
        local u63 = v1
        local u78 = UserInputService.InputChanged:Connect(function(a1) -- Line: 121 -- upvalues: UserInputService (upval), u7 (val), u8 (val), p1 (upval), u17 (upval), u11 (upval), u20 (upval), u21 (upval), u62 (ref), u63 (ref)
            if a1.UserInputType == Enum.UserInputType.MouseMovement then
                local Max, Min
                local v1 = UserInputService:GetMouseLocation().X - u7
                local v2 = v1 / (u8 - u7)
                local v3 = 1 - math.clamp(v2, 0, 1)
                if not p1.Range then
                    Min = 0
                else
                    Min = p1.Range.Min
                end
                if not p1.Range then
                    Max = 1
                else
                    Max = p1.Range.Max
                    if not Max then
                        Max = 1
                    end
                end
                v3 = math.clamp(v3, Min, Max)
                u17(v3)
                u11(Color3.fromHSV(u20, u21, v3))
                u62 = Color3.fromHSV(u20, u21, v3)
                u63 = v3
                if p1.Stepped then
                    v2 = Color3.fromHSV(u20, u21, v3)
                    p1.Stepped(v2, v3)
                end
            end
        end)
        u55 = UserInputService.InputEnded:Connect(function(a1) -- Line: 142 -- upvalues: disconnect (upval), u78 (ref), u55 (ref), p1 (upval), u62 (ref), u63 (ref)
            if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                disconnect(u78, u55)
                p1.Update(u62, u63)
                if p1.Stepped then
                    p1.Stepped(u62, u63)
                end
            end
        end)
        u49(u78)
        u54(u55)
    end
    v9.Button = react.createElement("TextButton", v10)
    v9.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v6.Value = react.createElement("Frame", v7, v9)
    return react.createElement("Frame", v5, v6)
end