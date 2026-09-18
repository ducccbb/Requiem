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
--        File: ReplicatedStorage.Client.Interfaces.Components.Menu.SidebarButton
--                              Dumped in 0.000759 seconds
--                          Bytecode version 9  |  4 functions

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
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
return react.memo(function(p1) -- Line: 32 -- upvalues: react (val), useTheme (val), useRem (val), Label (val)
    local BackgroundSelected, u5, v1, v2, v3
    v1, u5 = react.useState(false)
    local v4 = useTheme()
    local v5 = useRem()
    local createElement = react.createElement
    local v6 = {AutoButtonColor = false}
    if p1.Selected then
        BackgroundSelected = v4.SideBar.Button.BackgroundSelected
    elseif not v1 then
        BackgroundSelected = v4.Primary
    else
        BackgroundSelected = v4.SideBar.Button.BackgroundHover
    end
    v6.BackgroundColor3 = BackgroundSelected
    if p1.Selected then
        v3 = 0
    elseif not v1 then
        v3 = 1
    end
    v6.BackgroundTransparency = v3
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v6.BorderSizePixel = 0
    local v7 = v5(120)
    v6.Size = UDim2.fromOffset(v7, v5(120))
    v6.Text = ""
    v6.LayoutOrder = p1.LayoutOrder
    v6[react.Event.MouseButton1Down] = p1.Clicked
    v6[react.Event.MouseEnter] = function() -- Line: 53 -- upvalues: u5 (val)
        u5(true)
    end
    v6[react.Event.MouseLeave] = function() -- Line: 57 -- upvalues: u5 (val)
        u5(false)
    end
    v3 = {}
    local v8 = {BackgroundTransparency = 1, BorderSizePixel = 0, Image = p1.Icon}
    if not p1.Selected then
        v2 = 0.4
    else
        v2 = 0
    end
    v8.ImageTransparency = v2
    v8.ImageColor3 = v4.Primary
    v8.ScaleType = Enum.ScaleType.Fit
    v8.AnchorPoint = Vector2.new(0.5, 0.5)
    v8.BackgroundColor3 = v4.Primary
    v8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v8.Position = UDim2.fromScale(0.5, 0.425)
    v8.Size = UDim2.fromScale(0.35, 0.35)
    v2 = {Scale = react.createElement("UIScale"), AspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}
    v3.Icon = react.createElement("ImageLabel", v8, v2)
    v8 = {TextScaled = true, Text = p1.Label, TextColor3 = v4.Primary}
    if not p1.Selected then
        v2 = 0.5
    else
        v2 = 0
    end
    v8.TextTransparency = v2
    v8.TextXAlignment = Enum.TextXAlignment.Center
    v8.TextYAlignment = Enum.TextYAlignment.Center
    v8.AnchorPoint = Vector2.new(0.5, 1)
    v8.Position = UDim2.fromScale(0.5, 0.85)
    local v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, v5(15))
    v3.Label = react.createElement(Label, v8)
    v8 = {BackgroundColor3 = v4.Bar}
    if not p1.Selected then
        v2 = 1
    else
        v2 = 0
    end
    v8.BackgroundTransparency = v2
    v9 = UDim2.fromScale(0, 1)
    local v10 = v5(3)
    v8.Size = v9 + UDim2.fromOffset(v10, 0)
    v9 = UDim2.fromScale(0, 0.5)
    v10 = -v5(8)
    v8.Position = v9 + UDim2.fromOffset(v10, 0)
    v8.AnchorPoint = Vector2.new(0, 0.5)
    v3.Bar = react.createElement("Frame", v8, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v3.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 6)})
    v3.Ratio = react.createElement("UIAspectRatioConstraint")
    v8 = {}
    v9 = v5(20)
    v8.MinSize = Vector2.new(v9, v5(20))
    v8.MaxSize = Vector2.new(100, 100)
    v3.SizeConstraint = react.createElement("UISizeConstraint", v8)
    return createElement("TextButton", v6, v3)
end)