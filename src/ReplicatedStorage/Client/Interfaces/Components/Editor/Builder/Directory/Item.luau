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
--  File: ReplicatedStorage.Client.Interfaces.Components.Editor.Builder.Directory.Item
--                               Dumped in 0.00151 seconds
--                          Bytecode version 9  |  6 functions

local Item
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
local Universal_4 = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Layouts_2 = Universal_4:WaitForChild("Layouts")
local Vertical = require(Layouts_2:WaitForChild("Vertical"))
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
function Item(p1) -- Line: 39 -- upvalues: useRem (val), react (val), useBuildSelection (val), Item (val), Frame (val), Horizontal (val), Text (val), Icon (val), Vertical (val)
    local content, u10, u15, u19, u20, u6, u7, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useRem()
    u6, u7 = react.useState(false)
    v7, u10 = useBuildSelection()
    v8, u15 = react.useState(false)
    u19, u20 = react.useState(0)
    local v10 = v7 == p1.Item.path
    if v10 then
        v1 = Color3.fromRGB(0, 100, 200)
        v2 = 0.5
    elseif not v8 then
        v1 = Color3.fromRGB(24, 26, 31)
        v2 = 1
    else
        v1 = Color3.fromRGB(35, 38, 45)
        v2 = 0.5
    end
    local folder = p1.Item.folder
    if folder then
        v3 = #p1.Item.content
        folder = 0 < v3
    end
    v3 = react.useCallback(function() -- Line: 68 -- upvalues: u15 (val)
        u15(true)
    end, {})
    local v11 = react.useCallback(function() -- Line: 72 -- upvalues: u15 (val)
        u15(false)
    end, {})
    local v12 = react.useCallback(function(a1, p2) -- Line: 76 -- upvalues: u19 (val), u10 (val), p1 (val), u7 (val), u6 (val), u20 (val)
        if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        local v1 = tick()
        local v2 = v1 - u19
        if v2 >= 0.3 then
            u10(p1.Item.path)
        else
            u10(p1.Item.path)
            u7(not u6)
        end
        u20(v1)
    end, {
        u10,
        u7,
        u20,
        p1.Item.path,
        u6,
        u19,
    })
    local v13 = {}
    if p1.Item.folder and p1.Item.content then
        content = p1.Item.content
        local v14 = nil
        v4 = nil
        for i, j in content, v14, v4 do
            v13[j.name] = react.createElement(Item, {Item = j, Label = j.name})
        end
    end
    local createElement = react.createElement
    v4 = {Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v15 = {}
    local createElement_2 = react.createElement
    local v16 = {}
    local v17 = UDim2.fromScale(1, 0)
    v16.Size = v17 + UDim2.fromOffset(0, v9(30))
    v16.AnchorPoint = Vector2.new(0, 0)
    v16.Position = UDim2.fromScale(0, 0)
    v16[react.Event.MouseEnter] = v3
    v16[react.Event.MouseLeave] = v11
    v16[react.Event.InputBegan] = v12
    local v18 = {}
    local v19 = {ZIndex = 1, BackgroundColor3 = v1}
    local v20 = UDim2.fromScale(2, 1)
    local v21 = v9(100)
    v19.Size = v20 + UDim2.fromOffset(v21, 0)
    v19.AnchorPoint = Vector2.new(0, 0)
    v19.Position = UDim2.fromScale(-1, 0)
    v19.BackgroundTransparency = v2
    v18.Background = react.createElement(Frame, v19)
    local createElement_3 = react.createElement
    v19 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
    }
    local v22 = {Layout = react.createElement(Horizontal, {
        Spacing = 5,
        Native = {HorizontalAlignment = Enum.HorizontalAlignment.Left},
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5)})}
    v21 = {Text = p1.Label}
    local v23 = {LayoutOrder = 3}
    if not v10 then
        v5 = 0.32
    else
        v5 = 0
    end
    v23.TextTransparency = v5
    v21.Native = v23
    v22.Label = react.createElement(Text, v21)
    v21 = {Static = true}
    if not p1.Item.folder then
        v23 = "http://www.roblox.com/asset/?id=12324727174"
    else
        v23 = "http://www.roblox.com/asset/?id=12332380167"
    end
    v21.Image = v23
    v23 = {LayoutOrder = 2}
    local v24 = v9(15)
    v23.Size = UDim2.fromOffset(v24, v9(15))
    v23.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v21.Native = v23
    v22.Icon = react.createElement(Icon, v21)
    local createElement_4 = react.createElement
    v21 = {LayoutOrder = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.049, 0.5), Size = UDim2.fromScale(0.061, 0.45)}
    v23 = {}
    local createElement_5 = react.createElement
    local v25 = {
        Image = "rbxassetid://11421095840",
        Static = not folder,
        Clicked = function() -- Line: 178 -- upvalues: u7 (val), u6 (val)
            u7(not u6)
        end,
    }
    local v26 = {}
    local v27 = v9(15)
    v26.Size = UDim2.fromOffset(v27, v9(15))
    v26.Position = UDim2.fromScale(0.5, 0.5)
    v26.AnchorPoint = Vector2.new(0.5, 0.5)
    if not v10 then
        v6 = nil
    else
        v6 = Color3.fromRGB(255, 255, 255)
    end
    v26.ImageColor3 = v6
    if not u6 then
        v6 = -90
    else
        v6 = 0
    end
    v26.Rotation = v6
    if not folder then
        v6 = 1
    else
        v6 = 0
    end
    v26.ImageTransparency = v6
    v25.Native = v26
    v23.Icon = createElement_5(Icon, v25, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize, DominantAxis = Enum.DominantAxis.Height})})
    v22.Dropdown = createElement_4(Frame, v21, v23)
    v18.Content = createElement_3(Frame, v19, v22)
    v15.Header = createElement_2(Frame, v16, v18)
    v16 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0), AnchorPoint = Vector2.new(0.5, 0)}
    v17 = UDim2.fromScale(0.5, 0)
    v16.Position = v17 + UDim2.fromOffset(0, v9(33))
    v16.AutomaticSize = Enum.AutomaticSize.Y
    v16.Visible = u6 and folder
    v15.Content = react.createElement(Frame, v16, {Layout = react.createElement(Vertical, {Spacing = 5}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v9(10))})}, v13, p1.children)
    return createElement(Frame, v4, v15)
end
return Item