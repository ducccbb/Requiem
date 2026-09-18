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
--        File: ReplicatedStorage.Client.Interfaces.Components.Inputs.ErrorInput
--                              Dumped in 0.000524 seconds
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
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local Universal = v1.Parent.Parent:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
return function(p1) -- Line: 37 -- upvalues: useConstants (val), useTheme (val), react (val), FillProps (val), HeaderBodyComponent (val)
    local v1 = useConstants()
    local v2 = useTheme()
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v3 = FillProps(Native, {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = v2.PageBackground,
        Position = UDim2.fromScale(0.576, 0.655),
        Size = UDim2.fromScale(0.417, 0.101),
    })
    local v4 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Label = react.createElement(HeaderBodyComponent, {Header = p1.Header, Body = p1.Body, Position = UDim2.fromScale(0, 0.5)}), Padding = react.createElement("UIPadding", v1.Padding.Universal.Large)}
    local v5 = {BorderSizePixel = 0}
    local v6 = UDim2.fromScale(0.5, 1)
    v5.Position = v6 + UDim2.fromOffset(0, v1.Padding.Sizes.Large)
    v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.fromOffset(v1.Padding.Sizes.Large * 2, 30)
    local Color = p1.Color
    if not Color then
        Color = Color3.fromRGB(155, 0, 0)
    end
    v5.BackgroundColor3 = Color
    v5.AnchorPoint = Vector2.new(0.5, 1)
    local v7 = {}
    local v8 = {Rotation = 90}
    local v9 = {}
    local v10 = NumberSequenceKeypoint.new(0, 1)
    local v11 = NumberSequenceKeypoint.new(0.85, 1)
    local v12 = NumberSequenceKeypoint.new(0.8501, 0)
    v9[1] = v10
    v9[2] = v11
    v9[3] = v12
    v9[4] = NumberSequenceKeypoint.new(1, 0)
    v8.Transparency = NumberSequence.new(v9)
    v7.Gradient = react.createElement("UIGradient", v8)
    v7.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    v4.Red = react.createElement("Frame", v5, v7)
    return react.createElement("Frame", v3, v4)
end