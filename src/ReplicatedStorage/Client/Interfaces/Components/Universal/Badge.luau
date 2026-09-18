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
--         File: ReplicatedStorage.Client.Interfaces.Components.Universal.Badge
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  2 functions

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
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local Utilities_3 = v1.Parent.Parent:WaitForChild("Utilities")
local Stroke = require(Utilities_3:WaitForChild("Stroke"))
return function(p1) -- Line: 48 -- upvalues: useTextScale (val), useConstants (val), useTheme (val), react (val), FillProps (val), Color (val), Stroke (val)
    local v1, v2
    local v3 = useTextScale()
    local v4 = useConstants()
    local v5 = useTheme()
    local v6 = p1.Padding or "Large"
    local v7 = p1.Faded or 1
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v8 = FillProps(Native, {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.XY, Size = UDim2.fromOffset(0, 0)})
    local v9 = {}
    local createElement_2 = react.createElement
    local v10 = {}
    local Weight = p1.Weight
    if not Weight then
        Weight = Enum.FontWeight.Regular
    end
    v10.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Weight)
    v10.AutomaticSize = Enum.AutomaticSize.X
    v10.TextSize = v3(v4.TextSize.Medium * 1.2 * (p1.Scale or 1))
    v10.Text = p1.Text
    v10.Size = UDim2.fromOffset(0, v3(v4.TextSize[v6] * (p1.Ratio or 1.1)))
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = v5.Secondary
    end
    v10.BackgroundColor3 = Color_2
    local TextColor = p1.TextColor
    if not TextColor then
        TextColor = v5.Primary
    end
    v10.TextColor3 = Color.Darken(TextColor, v7)
    if not p1.Outline then
        v1 = 0
    else
        v1 = 1
    end
    v10.BackgroundTransparency = v1
    v1 = {Padding = react.createElement("UIPadding", v4.Padding.Universal[v6]), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    if not p1.Outline then
        v2 = nil
    else
        v2 = react.createElement(Stroke, {Color = p1.Color, Transparency = 1 - v7})
        if not v2 then
            v2 = nil
        end
    end
    v1.Stroke = v2
    v9.Label = createElement_2("TextLabel", v10, v1)
    return createElement("Frame", v8, v9)
end