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
--          File: ReplicatedStorage.Client.Interfaces.Components.Universal.Form
--                               Dumped in 0.00134 seconds
--                          Bytecode version 9  |  3 functions

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
local Error = require(v1.Parent.Parent.Parent:WaitForChild("Error"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local v3 = {
    Form = function(p1) -- Line: 87 -- upvalues: useConstants (val), useTheme (val), react (val), Error (val), FillProps (val)
        local Glassify, None, PageTransparency, children_2, v1
        local v2 = useConstants()
        local v3 = useTheme()
        local v4 = p1.Width or "Large"
        local v5 = p1.Height or "Large"
        if p1.Glassify ~= nil then
            Glassify = p1.Glassify
        else
            Glassify = false
        end
        local Background = v3.Container.Background
        local createElement = react.createElement
        local Boundary = Error.Boundary
        local v6 = {}
        local createElement_2 = react.createElement
        local Native = p1.Native
        if not Native then
            Native = {}
        end
        local v7 = {
            LayoutOrder = p1.LayoutOrder,
            BackgroundColor3 = Background,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }
        if not Glassify then
            PageTransparency = v3.PageTransparency
        else
            PageTransparency = 1
        end
        v7.BackgroundTransparency = PageTransparency
        if not p1.Native then
            None = Enum.AutomaticSize.Y
        elseif p1.Native.Size then
            None = Enum.AutomaticSize.None
        end
        v7.AutomaticSize = None
        local v8 = FillProps(Native, v7)
        local v9 = {}
        local v10 = {CornerRadius = UDim.new(0, 10)}
        v9.Corner = react.createElement("UICorner", v10)
        if p1.Strokeless then
            v7 = nil
        else
            v7 = react.createElement("UIStroke", {Thickness = 1, Color = v3.Container.Stroke})
        end
        v9.Stroke = v7
        local v11 = v2.Padding.Height[v5]
        v9.Padding = react.createElement("UIPadding", v2.Padding.combine(v11, v2.Padding.Width[v4]))
        local Clicked = p1.Clicked
        if Clicked then
            v10 = {BackgroundTransparency = 1}
            v1 = UDim2.fromScale(1, 1)
            v10.Size = v1 + UDim2.fromOffset(v2.Padding.Sizes[v4] * 2, v2.Padding.Sizes[v5] * 2)
            v10.AnchorPoint = Vector2.new(0.5, 0.5)
            v10.Position = UDim2.fromScale(0.5, 0.5)
            v10.Text = ""
            v10.ZIndex = 2
            v10[react.Event.MouseButton1Click] = p1.Clicked
            Clicked = react.createElement("TextButton", v10)
        end
        v9.Hitbox = Clicked
        v7 = Glassify
        if v7 then
            local children
            local createElement_3 = react.createElement
            v10 = {
                Image = "rbxassetid://16255699706",
                ImageTransparency = 0.97,
                BorderSizePixel = 0,
                ImageColor3 = Color3.fromRGB(149, 197, 255),
                ScaleType = Enum.ScaleType.Crop,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Background,
                BackgroundTransparency = v3.PageTransparency,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
            }
            v1 = UDim2.fromScale(1, 1)
            v10.Size = v1 + UDim2.fromOffset(v2.Padding.Sizes[v4] * 2, v2.Padding.Sizes.Large * 2)
            v11 = {UICorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Padding = react.createElement("UIPadding", v2.Padding.combine(v2.Padding.Height.Large, v2.Padding.Width[v4]))}
            if not Glassify then
                children = nil
            else
                children = p1.children
            end
            v7 = createElement_3("ImageLabel", v10, v11, children)
        end
        v9.Menu = v7
        if Glassify then
            children_2 = nil
        else
            children_2 = p1.children
            if not children_2 then
                children_2 = nil
            end
        end
        v6[1] = createElement_2("Frame", v8, v9, children_2)
        return createElement(Boundary, {}, v6)
    end,
}
function v3.Divider(p1) -- Line: 54 -- upvalues: useConstants (val), react (val), FillProps (val)
    local Left, v1, v2
    if p1.Side ~= "Left" then
        v1 = 1
    else
        v1 = 0
    end
    if p1.Side ~= "Left" then
        v2 = 1
    else
        v2 = 0
    end
    local v3 = useConstants()
    local v4 = p1.Padding or "Medium"
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v5 = FillProps(Native, {BackgroundTransparency = 1, Position = UDim2.fromScale(v1, 0.5), Size = UDim2.fromScale(p1.Width or 0.5, 0), AnchorPoint = Vector2.new(v2, 0.5)})
    local v6 = {}
    local createElement_2 = react.createElement
    local v7 = {FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder}
    if p1.Side ~= "Left" then
        Left = Enum.HorizontalAlignment.Right
    else
        Left = Enum.HorizontalAlignment.Left
        if not Left then
            Left = Enum.HorizontalAlignment.Right
        end
    end
    v7.HorizontalAlignment = Left
    local Alignment = p1.Alignment
    if not Alignment then
        Alignment = Enum.VerticalAlignment.Center
    end
    v7.VerticalAlignment = Alignment
    v7.Padding = UDim.new(0, v3.Padding.Sizes[v4])
    v6.Layout = createElement_2("UIListLayout", v7)
    return createElement("Frame", v5, v6, p1.children)
end
return v3