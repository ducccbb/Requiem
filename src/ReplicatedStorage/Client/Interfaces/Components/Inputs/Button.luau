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
--          File: ReplicatedStorage.Client.Interfaces.Components.Inputs.Button
--                               Dumped in 0.00165 seconds
--                          Bytecode version 9  |  13 functions

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
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local v3 = {Primary = 1, Secondary = 2, Outline = 3, Danger = 4}
return react.memo(function(p1) -- Line: 70 -- upvalues: useTextScale (val), useConstants (val), useTheme (val), useMotion (val), react (val), Color (val), Error (val), FillProps (val)
    local Color_2, Medium, Medium_2, Outline, TextColor_2, u10, u14, u18, u19, u77, v1, v2, v3
    local u2 = useTextScale()
    local v4 = useConstants()
    local u6 = useTheme()
    v2, u10 = useMotion(0)
    v3, u14 = useMotion(0)
    u18, u19 = react.useState(false)
    local u21 = p1.Type or 1
    local u23 = p1.Brightness or 0.75
    if u21 == 4 then
        p1.Color = Color3.fromRGB(147, 4, 4)
    end
    p1.Bounce = p1.Bounce or 5
    if not p1.Padding then
        Medium = v4.Padding.Universal.Medium
    else
        Medium = v4.Padding.Universal[p1.Padding]
    end
    if not p1.Padding then
        Medium_2 = v4.Padding.Sizes.Medium
    else
        Medium_2 = v4.Padding.Sizes[p1.Padding]
    end
    local function getButtonColor() -- Line: 92 -- upvalues: p1 (val), u21 (val), u6 (val), Color (upval), u23 (val)
        local Color_2 = p1.Color
        if not Color_2 then
            if u21 == 1 then
                Color_2 = u6.Secondary
            elseif u21 ~= 2 then
                Color_2 = u6.Primary
            else
                Color_2 = u6.Accent
                if not Color_2 then
                    Color_2 = u6.Primary
                end
            end
        end
        return Color.Darken(Color_2, u23)
    end
    local u73 = getButtonColor()
    v1, u77 = useMotion(u73)
    react.useEffect(function() -- Line: 104 -- upvalues: u73 (ref), getButtonColor (val), u77 (val)
        u73 = getButtonColor()
        u77:immediate(u73)
    end, {u6})
    react.useEffect(function() -- Line: 109 -- upvalues: p1 (val), u10 (val), u18 (val), u14 (val)
        local Enlarge
        if p1.Hover then
            local v1
            if not u18 then
                v1 = 0
            else
                v1 = -p1.Hover
            end
            u10:spring(v1)
        end
        if not u18 then
            Enlarge = 0
        else
            Enlarge = p1.Enlarge
            if not Enlarge then
                Enlarge = 0
            end
        end
        u14:spring(Enlarge)
    end, {u18, p1.Hover})
    local createElement = react.createElement
    local Boundary = Error.Boundary
    local v5 = {}
    local createElement_2 = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v6 = FillProps(Native, {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.XY, Visible = p1.Visible})
    local v7 = {}
    local createElement_3 = react.createElement
    local v8 = {Text = p1.Text, AutomaticSize = Enum.AutomaticSize.X, Size = v3:map(function(a1) -- Line: 129 -- upvalues: u2 (val), p1 (val), Medium_2 (val)
        local Height = p1.Height
        if not Height then
            Height = 25 + Medium_2 * (p1.Ratio or 0.5)
        end
        local v1 = UDim2.fromOffset(0, u2(Height))
        return v1 + UDim2.fromOffset(0, a1)
    end)}
    local v9 = not p1.Disabled
    if v9 then
        v9 = not p1.Bounce
    end
    v8.AutoButtonColor = v9
    v8.Position = v2:map(function(p1) -- Line: 136
        return UDim2.fromOffset(0, p1)
    end)
    local Weight = p1.Weight
    if not Weight then
        Weight = Enum.FontWeight.SemiBold
    end
    v8.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Weight)
    v8.TextSize = u2(v4.TextSize.Body)
    if u21 ~= 3 then
        v9 = p1.Transparency or 0
    else
        v9 = 1
    end
    v8.BackgroundTransparency = v9
    v8.TextTransparency = p1.Transparency or 0
    if not p1.Disabled then
        TextColor_2 = p1.TextColor
        if not TextColor_2 then
            if Color.IsDark(u73) then
                TextColor_2 = u6.Primary
            elseif Color.IsLight(u73) then
                TextColor_2 = Color.Brighten(u6.Primary, 0.5)
            end
        end
    else
        local TextColor = p1.TextColor
        if not TextColor then
            TextColor = u6.Primary
        end
        TextColor_2 = Color.Darken(TextColor, 0.4)
    end
    v8.TextColor3 = TextColor_2
    if not p1.Disabled then
        v9 = v1
    else
        Color_2 = p1.Color
        if not Color_2 then
            Color_2 = u6.Secondary
        end
        local v10 = Color.Desaturate(Color_2, 0.7)
        v9 = Color.Darken(v10, 0.3)
    end
    v8.BackgroundColor3 = v9
    v8[react.Event.MouseEnter] = function() -- Line: 165 -- upvalues: u19 (val)
        u19(true)
    end
    v8[react.Event.MouseLeave] = function() -- Line: 169 -- upvalues: u19 (val)
        u19(false)
    end
    v8[react.Event.MouseButton1Down] = function() -- Line: 173 -- upvalues: p1 (val), u10 (val), u77 (val), Color (upval), u73 (ref)
        if not p1.Disabled and p1.Clicked then
            p1.Clicked()
        end
        if p1.Bounce then
            u10:spring(p1.Bounce, {tension = 600, friction = 34, mass = 0.7})
        end
        u77:spring(Color.Brighten(u73, 0.3))
    end
    v8[react.Event.MouseButton1Up] = function() -- Line: 185 -- upvalues: p1 (val), u10 (val), u18 (val), u77 (val), u73 (ref)
        if p1.Bounce then
            local v1
            if not p1.Hover then
                v1 = 0
            elseif not u18 then
                v1 = 0
            else
                v1 = -p1.Hover
                if not v1 then
                    v1 = 0
                end
            end
            u10:spring(v1, {tension = 600, friction = 34, mass = 0.7})
        end
        u77:spring(u73)
    end
    v9 = {Padding = react.createElement("UIPadding", {PaddingTop = Medium.PaddingTop, PaddingBottom = Medium.PaddingBottom, PaddingLeft = v3:map(function(p1) -- Line: 201 -- upvalues: Medium (val)
        return Medium.PaddingLeft + UDim.new(0, p1 / 2)
    end), PaddingRight = v3:map(function(p1) -- Line: 205 -- upvalues: Medium (val)
        return Medium.PaddingRight + UDim.new(0, p1 / 2)
    end)})}
    local v11 = {CornerRadius = UDim.new(0, p1.Corner or 6)}
    v9.Corner = react.createElement("UICorner", v11)
    if u21 == 3 then
        local Outline_3
        local createElement_4 = react.createElement
        v11 = {Thickness = 1}
        if not p1.Disabled then
            Outline_3 = p1.Outline
            if not Outline_3 then
                Outline_3 = p1.Color
                if not Outline_3 then
                    Outline_3 = u6.Primary
                end
            end
        else
            local Outline_2 = p1.Outline
            if not Outline_2 then
                Outline_2 = p1.Color
                if not Outline_2 then
                    Outline_2 = u6.Primary
                end
            end
            Outline_3 = Color.Darken(Outline_2, 0.5, 0.2, 0.2)
        end
        v11.Color = Outline_3
        v11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Outline = createElement_4("UIStroke", v11)
    else
        Outline = p1.Outline
        if not Outline then end
    end
    v9.Stroke = Outline
    v7.TextButton = createElement_3("TextButton", v8, v9)
    v5.Button = createElement_2("Frame", v6, v7)
    return createElement(Boundary, {}, v5)
end)