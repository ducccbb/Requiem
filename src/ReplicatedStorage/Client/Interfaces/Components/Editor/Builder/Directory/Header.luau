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
-- File: ReplicatedStorage.Client.Interfaces.Components.Editor.Builder.Directory.Header
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  6 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Editor"))
local Primitives = v1.Parent.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Layouts = Universal:WaitForChild("Layouts")
local Horizontal = require(Layouts:WaitForChild("Horizontal"))
local Universal_2 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Icon = require(Universal_2:WaitForChild("Icon"))
local Universal_3 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local Item = require(v1.Parent:WaitForChild("Item"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Routes = Interfaces:WaitForChild("Routes")
local Editor_2 = Routes:WaitForChild("Editor")
local Hooks = Editor_2:WaitForChild("Hooks")
local useBuildSelection = require(Hooks:WaitForChild("useBuildSelection"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
return function(p1) -- Line: 38 -- upvalues: useRem (val), react (val), useBuildSelection (val), Item (val), Frame (val), Horizontal (val), Text (val), Icon (val)
    local Content, u10, u15, u19, u20, u6, u7, v1, v2, v3, v4, v5, v6
    local v7 = useRem()
    u6, u7 = react.useState(false)
    v5, u10 = useBuildSelection()
    v6, u15 = react.useState(false)
    u19, u20 = react.useState(0)
    local v8 = v5 == p1.Path
    if v8 then
        v1 = Color3.fromRGB(0, 100, 200)
    elseif not v6 then
        v1 = Color3.fromRGB(24, 26, 31)
    else
        v1 = Color3.fromRGB(35, 38, 45)
    end
    local v9 = react.useCallback(function() -- Line: 60 -- upvalues: u15 (val)
        u15(true)
    end, {})
    local v10 = react.useCallback(function() -- Line: 64 -- upvalues: u15 (val)
        u15(false)
    end, {})
    local v11 = react.useCallback(function(a1, p2) -- Line: 68 -- upvalues: u19 (val), u10 (val), p1 (val), u7 (val), u6 (val), u20 (val)
        if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        local v1 = tick()
        local v2 = v1 - u19
        if v2 >= 0.3 then
            u10(p1.Path)
        else
            u10(p1.Path)
            u7(not u6)
        end
        u20(v1)
    end, {
        u10,
        u7,
        u20,
        p1.Path,
        u6,
        u19,
    })
    local v12 = {}
    if p1.Content then
        Content = p1.Content
        local v13 = nil
        v2 = nil
        for i, j in Content, v13, v2 do
            v12[j.name] = react.createElement(Item, {Item = j, Label = j.name})
        end
    end
    local createElement = react.createElement
    v2 = {Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v14 = {}
    local createElement_2 = react.createElement
    local v15 = {BackgroundColor3 = v1}
    local v16 = UDim2.fromScale(1, 0)
    v15.Size = v16 + UDim2.fromOffset(0, v7(30))
    v15.AnchorPoint = Vector2.new(0, 0)
    v15.Position = UDim2.fromScale(0, 0)
    v15.ZIndex = 3
    v15.BackgroundTransparency = 0.5
    v15[react.Event.MouseEnter] = v9
    v15[react.Event.MouseLeave] = v10
    v15[react.Event.InputBegan] = v11
    local v17 = {Layout = react.createElement(Horizontal, {
        Spacing = 5,
        Native = {HorizontalAlignment = Enum.HorizontalAlignment.Left},
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5)})}
    local v18 = {Text = p1.Label}
    local v19 = {}
    if not v8 then
        v3 = 0.32
    else
        v3 = 0
    end
    v19.TextTransparency = v3
    v18.Native = v19
    v17.Label = react.createElement(Text, v18)
    local createElement_3 = react.createElement
    v18 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.049, 0.5), Size = UDim2.fromScale(0.061, 0.45)}
    v19 = {}
    local createElement_4 = react.createElement
    local v20 = {
        Image = "rbxassetid://11421095840",
        Clicked = function() -- Line: 140 -- upvalues: u7 (val), u6 (val)
            u7(not u6)
        end,
    }
    local v21 = {}
    local v22 = v7(15)
    v21.Size = UDim2.fromOffset(v22, v7(15))
    v21.Position = UDim2.fromScale(0.5, 0.5)
    v21.AnchorPoint = Vector2.new(0.5, 0.5)
    if not v8 then
        v4 = nil
    else
        v4 = Color3.fromRGB(255, 255, 255)
        if not v4 then
            v4 = nil
        end
    end
    v21.ImageColor3 = v4
    if not u6 then
        v4 = -90
    else
        v4 = 0
    end
    v21.Rotation = v4
    v20.Native = v21
    v19.Icon = createElement_4(Icon, v20, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize, DominantAxis = Enum.DominantAxis.Height})})
    v17.Dropdown = createElement_3(Frame, v18, v19)
    v14.Header = createElement_2(Frame, v15, v17)
    v15 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0), AnchorPoint = Vector2.new(0.5, 0)}
    v16 = UDim2.fromScale(0.5, 0)
    v15.Position = v16 + UDim2.fromOffset(0, v7(33))
    v15.AutomaticSize = Enum.AutomaticSize.Y
    v15.Visible = u6
    v14.Content = react.createElement(Frame, v15, {Layout = react.createElement(Horizontal, {Spacing = 5}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v7(10))})}, v12, p1.children)
    return createElement(Frame, v2, v14)
end