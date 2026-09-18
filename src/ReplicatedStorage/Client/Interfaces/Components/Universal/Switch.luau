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
--         File: ReplicatedStorage.Client.Interfaces.Components.Universal.Switch
--                               Dumped in 0.00151 seconds
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
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives:WaitForChild("Hitbox"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Stroke = require(Utilities_2:WaitForChild("Stroke"))
local Utilities_3 = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return function(p1) -- Line: 47 -- upvalues: useTextScale (val), react (val), useConstants (val), useTheme (val), Color (val), useMotion (val), FillProps (val), Hitbox (val), Stroke (val)
    local Primary, u10, u11, u120, u142, u166, v1, v2, v3, v4, v5
    local v6 = useTextScale()
    local Override = p1.Override
    if not Override then
        Override = p1.Default
        if not Override then
            Override = false
        end
    end
    u10, u11 = react.useState(Override)
    react.useEffect(function() -- Line: 52 -- upvalues: p1 (val), u11 (val)
        if p1.Override ~= nil then
            u11(p1.Override)
        end
    end, {p1.Override})
    local v7 = useConstants()
    local v8 = useTheme()
    local u23 = {frequency = 0.3}
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = v8.PageBackground
    end
    local v9 = not Color.IsLight(Color_2, 0.125)
    local u38 = Color.Brighten(Color_2, 0.1)
    if not v9 then
        v1 = -0.03
    else
        v1 = 0.105
    end
    local u47 = Color.Brighten(Color_2, v1)
    local v10 = UDim2.fromScale(0, 0.5)
    local v11 = v6(25)
    local v12 = v11 - v6(2)
    local u65 = v10 + UDim2.fromOffset(v12, 0)
    v10 = UDim2.fromScale(0, 0.5)
    v12 = v6(2)
    local u76 = v10 + UDim2.fromOffset(v12, 0)
    local u83 = Color.Brighten(Color_2, 0.7)
    if not v9 then
        if not v9 then
            v11 = 0.1
        else
            v11 = -0.1
        end
        Primary = Color.Brighten(Color_2, v11)
    else
        Primary = v8.Primary
    end
    if not p1.Default then
        v11 = u47
    else
        v11 = u38
    end
    v12, u120 = useMotion(v11)
    if not p1.Default then
        v3 = u76
    else
        v3 = u65
    end
    v2, u142 = useMotion(v3)
    if not p1.Default then
        v5 = Primary
    else
        v5 = u83
        if not v5 then
            v5 = Primary
        end
    end
    v4, u166 = useMotion(v5)
    react.useEffect(function() -- Line: 82 -- upvalues: u120 (val), u10 (val), u38 (val), u47 (val), u23 (val), u142 (val), u65 (val), u76 (val), u166 (val), u83 (val), Primary (val)
        local v1
        if not u10 then
            v1 = u47
        else
            v1 = u38
        end
        u120:spring(v1, u23)
        if not u10 then
            v1 = u76
        else
            v1 = u65
        end
        u142:spring(v1, u23)
        if not u10 then
            v1 = Primary
        else
            v1 = u83
            if not v1 then
                v1 = Primary
            end
        end
        u166:spring(v1, u23)
    end, {u10, v8})
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v13 = {ClipsDescendants = true, BackgroundTransparency = 1, BackgroundColor3 = v8.PageBackground, Position = UDim2.fromScale(0.5, 0.5)}
    local v14 = v6(50)
    v13.Size = UDim2.fromOffset(v14, 0)
    v13.AnchorPoint = Vector2.new(0.5, 0.5)
    v13.AutomaticSize = Enum.AutomaticSize.Y
    local v15 = FillProps(Native, v13)
    local v16 = {Hitbox = react.createElement(Hitbox, {
        Enabled = true,
        Native = {Size = UDim2.fromScale(1.2, 1.5)},
        Clicked = function() -- Line: 107 -- upvalues: u11 (val), u10 (val), p1 (val)
            u11(not u10)
            if p1.Toggled then
                p1.Toggled(not u10)
            end
        end,
    }), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Padding = react.createElement("UIPadding", v7.Padding.combine(v7.Padding.Height.Medium, v7.Padding.Width.Small))}
    v14 = {ClipsDescendants = true, ZIndex = 2, BackgroundColor3 = v4, Position = v2}
    local v17 = v6(16)
    v14.Size = UDim2.fromOffset(v17, v6(16))
    v14.AnchorPoint = Vector2.new(0, 0.5)
    v14.AutomaticSize = Enum.AutomaticSize.Y
    v16.Circle = react.createElement("Frame", v14, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v14 = {ClipsDescendants = true, BackgroundColor3 = v12, Position = UDim2.fromScale(0, 0.5)}
    v17 = UDim2.fromScale(1, 0)
    v14.Size = v17 + UDim2.fromOffset(0, v6(20))
    v14.AnchorPoint = Vector2.new(0, 0.5)
    v14.AutomaticSize = Enum.AutomaticSize.Y
    v16.Inner = react.createElement("Frame", v14, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement(Stroke)})
    return react.createElement("Frame", v15, v16)
end