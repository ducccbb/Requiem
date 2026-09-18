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
--         File: ReplicatedStorage.Client.Interfaces.Components.Screen.Tooltips
--                               Dumped in 0.00131 seconds
--                          Bytecode version 9  |  8 functions

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
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Stroke = require(Utilities_2:WaitForChild("Stroke"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local TooltipProvider = require(Providers:WaitForChild("TooltipProvider"))
return function() -- Line: 31 -- upvalues: react (val), TooltipProvider (val), useTextScale (val), useConstants (val), useTheme (val), useMotion (val), useAsyncEffect (val), Color (val), Stroke (val)
    local X, Y, u18, u23, u27, v1, v2, v3
    local u4 = react.useContext(TooltipProvider.TooltipContext)
    if not u4 then
        error("Tooltips must be used within a TooltipProvider")
    end
    local v4 = useTextScale()
    local v5 = useConstants()
    local v6 = useTheme()
    v1, u18 = react.useState(nil)
    v2, u23 = react.useState(false)
    v3, u27 = useMotion(0)
    local Large = v5.Padding.Universal.Large
    react.useEffect(function() -- Line: 49 -- upvalues: u4 (val), u18 (val)
        local position
        if not u4.position then
            return
        end
        position = u4.position
        u18(Vector2.new(position.x, position.y))
    end, {u4, u4.position})
    useAsyncEffect(function() -- Line: 58 -- upvalues: u23 (val), u4 (val), u27 (val)
        local v1
        u23(u4.visible)
        if not u4.visible then
            v1 = -20
        else
            v1 = 15
        end
        u27:spring(v1, {frequency = 0.3})
    end, {u4.visible})
    local v7 = Color.Darken(v6.PageBackground, 0.8)
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v8 = {}
    local createElement_2 = react.createElement
    local v9 = {BackgroundTransparency = 1, ZIndex = 300, Visible = v2}
    local fromOffset = UDim2.fromOffset
    if not v1 then
        X = 0
    else
        X = v1.X
    end
    if not v1 then
        Y = 0
    else
        Y = v1.Y
        if not Y then
            Y = 0
        end
    end
    v9.Position = fromOffset(X, Y)
    v9.AnchorPoint = Vector2.new(0.5, 1)
    v9.AutomaticSize = Enum.AutomaticSize.XY
    local v10 = {}
    local v11 = {Size = UDim2.fromScale(0, 0), AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = v7}
    local v12 = {Padding = react.createElement("UIPadding", {PaddingTop = v3:map(function(p1) -- Line: 84 -- upvalues: Large (val)
        return Large.PaddingTop + UDim.new(0, p1 / 2)
    end), PaddingBottom = v3:map(function(p1) -- Line: 88 -- upvalues: Large (val)
        return Large.PaddingBottom + UDim.new(0, p1 / 2)
    end), PaddingLeft = v3:map(function(p1) -- Line: 92 -- upvalues: Large (val)
        return Large.PaddingLeft + UDim.new(0, p1 / 2)
    end), PaddingRight = v3:map(function(p1) -- Line: 96 -- upvalues: Large (val)
        return Large.PaddingRight + UDim.new(0, p1 / 2)
    end)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}
    local v13 = {
        BackgroundTransparency = 1,
        TextScaled = false,
        TextTransparency = 0.2,
        RichText = true,
        Text = u4.header,
    }
    local v14 = UDim2.fromScale(0, 0)
    v13.Size = v14 + UDim2.fromOffset(0, 24)
    v13.AutomaticSize = Enum.AutomaticSize.X
    v13.TextSize = v4(v5.TextSize.Header)
    v13.TextXAlignment = Enum.TextXAlignment.Left
    v13.TextColor3 = v6.Primary
    v13.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v12.Header = react.createElement("TextLabel", v13)
    v13 = {
        BackgroundTransparency = 1,
        TextTransparency = 0.4,
        TextScaled = false,
        TextWrapped = true,
        RichText = true,
        Text = u4.body,
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = v6.Primary,
        TextSize = v4(v5.TextSize.Body),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    local v15 = {}
    local v16 = {}
    local v17 = v4(200)
    v16.MaxSize = Vector2.new(v17, math.huge)
    v15.Size = react.createElement("UISizeConstraint", v16)
    v12.Body = react.createElement("TextLabel", v13, v15)
    v12.Stroke = react.createElement(Stroke, {
        Power = 15,
        Range = {Min = -1, Max = 0.2},
    })
    v10.Content = react.createElement("Frame", v11, v12)
    v11 = {
        BackgroundTransparency = 0,
        Rotation = 45,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(10, 10),
        AnchorPoint = Vector2.new(0.5, 0),
    }
    local v18 = UDim2.fromScale(0.5, 1)
    v11.Position = v18 + UDim2.fromOffset(0, -5)
    v11.BackgroundColor3 = v7
    v12 = {}
    v13 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    v15 = {}
    local v19 = {}
    local v20 = {Rotation = 223}
    local v21 = {}
    local v22 = NumberSequenceKeypoint.new(0, 0)
    local v23 = NumberSequenceKeypoint.new(0.499, 0)
    local v24 = NumberSequenceKeypoint.new(0.5, 1)
    v21[1] = v22
    v21[2] = v23
    v21[3] = v24
    v21[4] = NumberSequenceKeypoint.new(1, 1)
    v20.Transparency = NumberSequence.new(v21)
    v19.Gradient = react.createElement("UIGradient", v20)
    v15.Stroke = react.createElement(Stroke, {
        Power = 15,
        Range = {Min = -1, Max = 0.2},
    }, v19)
    v12.Offset = react.createElement("Frame", v13, v15)
    v10.Triangle = react.createElement("Frame", v11, v12)
    v8.Tooltip = createElement_2("Frame", v9, v10)
    return createElement(Fragment, {}, v8)
end