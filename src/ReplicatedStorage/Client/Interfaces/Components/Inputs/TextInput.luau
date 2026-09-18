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
--         File: ReplicatedStorage.Client.Interfaces.Components.Inputs.TextInput
--                               Dumped in 0.00222 seconds
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
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
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
local v3 = {Default = 1, Left = 2, Dynamic = 3}
return function(p1) -- Line: 64 -- upvalues: useTextScale (val), useRem (val), useTheme (val), useConstants (val), react (val), useMotion (val), Color (val), Error (val), FillProps (val), HeaderBodyComponent (val)
    local Header, Override_2, PageTransparency, Placeholder, u12, u13, u21, u22, u234, u41, u50, u63, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local u2 = useTextScale()
    local v12 = useRem()
    local u6 = useTheme()
    local u8 = useConstants()
    u12, u13 = react.useState("")
    local Override = p1.Override
    if Override then
        Override = p1.Override ~= ""
    end
    u21, u22 = react.useState(false)
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = u6.Container.Background
    end
    local v13 = -u2(5)
    v1, u41 = useMotion(UDim2.new(0, v13, 0.5, 0))
    v2, u50 = useMotion(Color.Darken(u6.Primary, 0.5))
    v3, u63 = useMotion(Color.Darken(p1.Color or Color_2, 2, 0.15, 0.15))
    local u65 = p1.Layout or 1
    if u65 == 1 then
        v6 = UDim2.fromScale(0.5, 0.5)
        local fromOffset = UDim2.fromOffset
        v8 = 0
        if not p1.Header then
            v9 = 0
        else
            v9 = u2(20)
        end
        v5 = v6 + fromOffset(v8, v9)
        local fromOffset_2 = UDim2.fromOffset
        if not p1.Body then
            v8 = 0
        else
            v8 = u2(6)
        end
        v4 = v5 + fromOffset_2(0, v8)
    elseif u65 ~= 2 then
        v4 = UDim2.fromScale(0.5, 0.5)
    else
        v4 = UDim2.fromScale(1, 0.5)
    end
    if u65 == 1 then
        v5 = UDim2.fromScale(1, 0)
    elseif u65 ~= 2 then
        v5 = UDim2.fromScale(1, 0)
    else
        v5 = UDim2.fromScale(0.5, 0)
    end
    if u65 == 1 then
        v6 = Vector2.new(0.5, 0.5)
    elseif u65 ~= 2 then
        v6 = Vector2.new(0.5, 0.5)
    else
        v6 = Vector2.new(1, 0.5)
    end
    if u65 == 1 then
        local v14
        v8 = UDim2.fromScale(0, 0.5)
        local fromOffset_3 = UDim2.fromOffset
        if not p1.Header then
            v14 = 10
        elseif p1.Body then
            v14 = 20
        end
        v7 = v8 + fromOffset_3(0, -u2(v14))
    elseif u65 ~= 2 then
        v7 = UDim2.fromScale(0.5, 0.5)
    else
        v7 = UDim2.fromScale(0, 0.5)
    end
    v8 = p1.Width or "Large"
    v9 = if p1.Icon ~= nil then p1.Icon ~= "" else false
    local v15 = u2(16)
    if not v9 then
        u234 = 0
    else
        u234 = v15 + u2(6)
    end
    react.useEffect(function() -- Line: 112 -- upvalues: u21 (val), u12 (val), u63 (val), Color (upval), u6 (val), Color_2 (val), u65 (val), u41 (val), u2 (val), u8 (val), u50 (val)
        local v1
        local v2 = u21
        if not v2 then
            local v3 = u12 == ""
            v2 = not v3
        end
        if not v2 then
            v1 = Color.Darken(Color_2, 2, 0.15, 0.15)
        else
            v1 = Color.Darken(u6.Primary, 0.5, 0.15, 0.15)
        end
        local v4 = {frequency = 0.2}
        u63:spring(v1, v4)
        if u65 == 3 then
            if not v2 then
                local v5 = -u2(5)
                v1 = UDim2.new(0, v5, 0.5, 0)
            else
                v4 = -u2(5)
                v1 = UDim2.fromOffset(v4, -u8.Padding.Sizes.Small)
            end
            u41:spring(v1, {frequency = 0.2})
            if not v2 then
                v1 = Color.Darken(u6.Primary, 0.5)
            else
                v1 = Color.Darken(u6.Primary, 0.8)
                if not v1 then
                    v1 = Color.Darken(u6.Primary, 0.5)
                end
            end
            u50:spring(v1, {frequency = 0.2})
        end
    end, {u21, u6.Primary, Color_2})
    local createElement = react.createElement
    local Boundary = Error.Boundary
    local v16 = {}
    local createElement_2 = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v17 = {BackgroundColor3 = Color_2, Position = UDim2.fromScale(0.576, 0.655)}
    if not p1.Length then
        v10 = 1
    else
        v10 = 0
    end
    local v18 = UDim2.fromScale(v10, 0)
    local v19 = v12(p1.Length or 0)
    v17.Size = v18 + UDim2.fromOffset(v19, v12(p1.Height or 70))
    if not p1.Outlined then
        PageTransparency = u6.PageTransparency
    else
        PageTransparency = 1
    end
    v17.BackgroundTransparency = PageTransparency
    local v20 = FillProps(Native, v17)
    local v21 = {Padding = react.createElement("UIPadding", u8.Padding.combine(u8.Padding.Height.Large, u8.Padding.Width[v8])), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    Header = p1.Header
    if Header then
        local v22 = u65 == 3
        Header = not v22
        if Header then
            Header = react.createElement(HeaderBodyComponent, {Header = p1.Header, Body = p1.Body, Position = v7})
        end
    end
    v21.Header = Header
    local createElement_3 = react.createElement
    v18 = {AnchorPoint = v6, Position = v4, Size = v5 + UDim2.fromOffset(0, u2(30)), BackgroundColor3 = u6.Input.Background}
    if not p1.Outlined then
        v10 = 0
    else
        v10 = 1
    end
    v18.BackgroundTransparency = v10
    v10 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    local v23 = {Transparency = 0, Color = v3}
    v10.Stroke = react.createElement("UIStroke", v23)
    v10.Padding = react.createElement("UIPadding", u8.Padding.combine(u8.Padding.Height.Small, u8.Padding.Width.Large))
    v19 = v9
    if v19 then
        v19 = react.createElement("ImageLabel", {
            ImageTransparency = 0,
            BackgroundTransparency = 1,
            Image = p1.Icon,
            ImageColor3 = Color.Darken(u6.Primary, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(v15, v15),
        }, {AspectRatioConstraint = react.createElement("UIAspectRatioConstraint")})
    end
    v10.Icon = v19
    v19 = false
    if u65 == 3 then
        local v24
        local createElement_4 = react.createElement
        v23 = {
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Text = p1.Header or "Input Text",
            TextSize = u2(14),
            TextColor3 = v2,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = p1.TextBackgroundColor or Color_2,
        }
        if not v9 then
            v24 = v1
        else
            v24 = v1:map(function(p1) -- Line: 217 -- upvalues: u234 (val)
                return p1 + UDim2.fromOffset(u234, 0)
            end)
        end
        v23.Position = v24
        v11 = UDim2.fromScale(0, 0)
        v23.Size = v11 + UDim2.fromOffset(0, u2(2))
        v23.BackgroundTransparency = v1:map(function(p1) -- Line: 222
            if p1.Y.Scale == 0.5 then
                return 1
            end
            return 0
        end)
        v23.TextXAlignment = Enum.TextXAlignment.Left
        v23.TextYAlignment = Enum.TextYAlignment.Center
        v23.AutomaticSize = Enum.AutomaticSize.X
        v19 = createElement_4("TextLabel", v23, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, u2(5)), PaddingRight = UDim.new(0, u2(5))})})
    end
    v10.DynamicLabel = v19
    local createElement_5 = react.createElement
    v23 = {FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)}
    if u65 == 3 then
        Placeholder = nil
    else
        Placeholder = p1.Placeholder
    end
    v23.PlaceholderText = Placeholder
    if Override then
        Override_2 = p1.Override
    elseif u65 == 3 then
        Override_2 = u12
        if not Override_2 then
            Override_2 = ""
        end
    elseif not p1.Placeholder then
        Override_2 = p1.Body
        if not Override_2 then
            Override_2 = p1.Header
            if not Override_2 then
                Override_2 = "Input Text"
            end
        end
    else
        Override_2 = u12
        if not Override_2 then
            Override_2 = p1.Body
            if not Override_2 then
                Override_2 = p1.Header
                if not Override_2 then
                    Override_2 = "Input Text"
                end
            end
        end
    end
    v23.Text = Override_2
    v23.TextColor3 = Color.Darken(u6.Primary, 0.65)
    v23.PlaceholderColor3 = Color.Darken(u6.Primary, 0.5)
    v23.TextSize = u2(14)
    v23.TextWrapped = true
    v23.TextXAlignment = Enum.TextXAlignment.Left
    v23.TextYAlignment = Enum.TextYAlignment.Center
    v23.AnchorPoint = Vector2.new(0, 0.5)
    v23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v23.BackgroundTransparency = 1
    v11 = UDim2.fromScale(0, 0.5)
    v23.Position = v11 + UDim2.fromOffset(u234, 0)
    v11 = UDim2.fromScale(1, 0)
    v23.Size = v11 + UDim2.fromOffset(-u234, u2(25))
    v23[react.Change.Text] = function(a1) -- Line: 267 -- upvalues: u13 (val), p1 (val)
        u13(a1.Text)
        if p1.Stepped then
            p1.Stepped(a1.Text)
        end
    end
    v23[react.Event.Focused] = function() -- Line: 275 -- upvalues: u22 (val)
        u22(true)
    end
    v23[react.Event.FocusLost] = function(a1, p2) -- Line: 279 -- upvalues: u22 (val), u13 (val), p1 (val)
        u22(false)
        u13(a1.Text)
        if p1.Changed then
            p1.Changed(a1.Text)
        end
    end
    v10.Body = createElement_5("TextBox", v23)
    v21.Input = createElement_3("Frame", v18, v10)
    v16[1] = createElement_2("Frame", v20, v21)
    return createElement(Boundary, {}, v16)
end