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
--  File: ReplicatedStorage.Client.Interfaces.Components.Universal.HeaderBodyComponent
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  5 functions

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
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return react.memo(function(p1) -- Line: 51 -- upvalues: useTextScale (val), useConstants (val), useTheme (val), useMotion (val), react (val), Error (val), FillProps (val), Color (val)
    local Body, Fragment, Header, LayoutOrder, Native, u10, v1, v2, v3, v4, v5, v6
    local v7 = useTextScale()
    local v8 = useConstants()
    local v9 = useTheme()
    v5, u10 = useMotion(0)
    local Position = p1.Position
    if not Position then
        Position = UDim2.fromScale(0.5, 0.5)
    end
    if not p1.Offset then
        v6 = UDim2.fromOffset(0, 0)
    else
        v6 = UDim2.fromOffset(0, v7(p1.Offset))
    end
    if not p1.Wrap then
        v1 = Position
    else
        v1 = UDim2.fromScale(0, 0.5)
    end
    local fromOffset = UDim2.fromOffset
    local v10 = v7(v8.TextSize.Header)
    if not p1.Body then
        v2 = 0
    else
        v2 = v7(v8.TextSize.Paddings.HeaderToBody)
    end
    local v11 = v1 + fromOffset(0, -(v10 + v2) / 4) + v6
    local v12 = v7(v8.TextSize.Paddings.HeaderToBody)
    local v13 = v11 + UDim2.fromOffset(0, v12 + (p1.Padding or 0))
    if p1.AlignBottom and not p1.Body then
        v11 = v11 + UDim2.fromOffset(0, v7(v8.TextSize.Header))
    end
    react.useEffect(function() -- Line: 78 -- upvalues: u10 (val), p1 (val)
        local v1
        if not p1.Underlined then
            v1 = 0
        else
            v1 = 1
        end
        u10:spring(v1)
    end, {p1.Underlined})
    local createElement = react.createElement
    local Boundary = Error.Boundary
    v12 = {}
    local createElement_2 = react.createElement
    if not p1.Wrap then
        Fragment = react.Fragment
    else
        Fragment = "Frame"
    end
    if not p1.Wrap then
        v10 = {}
    else
        Native = p1.Native
        if not Native then
            Native = {}
        end
        local v14 = {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Position = Position, AnchorPoint = Vector2.new(0.5, 0.5)}
        v4 = v7(v8.TextSize.Header)
        v14.Size = UDim2.fromOffset(0, v4 + v7(v8.TextSize.Paddings.HeaderToBody))
        v10 = FillProps(Native, v14)
    end
    v2 = {}
    Body = p1.Body
    if Body then
        local Body_2
        local createElement_3 = react.createElement
        v3 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = p1.Body,
        }
        local Darken = Color.Darken
        if not p1.Colors then
            Body_2 = v9.Primary
        else
            Body_2 = p1.Colors.Body
        end
        v3.TextColor3 = Darken(Body_2, 0.6)
        v3.TextSize = v7(v8.TextSize.Body)
        v3.TextXAlignment = Enum.TextXAlignment.Left
        v3.TextYAlignment = Enum.TextYAlignment.Center
        v3.AnchorPoint = Vector2.new(0, 0.5)
        v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v3.Position = v13
        v4 = UDim2.fromScale(0, 0)
        v3.Size = v4 + UDim2.fromOffset(0, v7(v8.TextSize.Body))
        v3.AutomaticSize = Enum.AutomaticSize.X
        v3.RichText = p1.RichText
        Body = createElement_3("TextLabel", v3)
    end
    v2.Body = Body
    local createElement_4 = react.createElement
    v3 = {BackgroundTransparency = 1, ZIndex = 2, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal), Text = p1.Header}
    local Darken_2 = Color.Darken
    if not p1.Colors then
        Header = v9.Primary
    else
        Header = p1.Colors.Header
    end
    v3.TextColor3 = Darken_2(Header, 0.8)
    v3.TextSize = v7(v8.TextSize.Header)
    v3.TextXAlignment = Enum.TextXAlignment.Left
    v3.TextYAlignment = Enum.TextYAlignment.Center
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v3.Position = v11
    v3.AutomaticSize = Enum.AutomaticSize.X
    if not p1.Native then
        LayoutOrder = 0
    else
        LayoutOrder = p1.Native.LayoutOrder
        if not LayoutOrder then
            LayoutOrder = 0
        end
    end
    v3.LayoutOrder = LayoutOrder
    v3.RichText = p1.RichText
    local v15 = {}
    local v16 = {ZIndex = 1, BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0)}
    local v17 = UDim2.fromScale(0.5, 1)
    v16.Position = v17 + UDim2.fromOffset(0, v7(v8.TextSize.Header - 5))
    v16.Size = v5:map(function(p1) -- Line: 137
        local v1 = UDim2.fromScale(p1, 0)
        return v1 + UDim2.fromOffset(2, 1)
    end)
    v16.Visible = v5:map(function(p1) -- Line: 141
        local v1 = 0.1 < p1
        return v1
    end)
    v16.BackgroundColor3 = Color.Darken(v9.Primary, 4, 0.15, 0.15)
    v15.Frame = react.createElement("Frame", v16)
    v2.Header = createElement_4("TextLabel", v3, v15)
    v12[1] = createElement_2(Fragment, v10, v2)
    return createElement(Boundary, {}, v12)
end)