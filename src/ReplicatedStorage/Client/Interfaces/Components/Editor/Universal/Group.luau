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
--      File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Group
--                               Dumped in 0.00120 seconds
--                          Bytecode version 9  |  11 functions

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
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Icon = require(v1.Parent:WaitForChild("Icon"))
local Text = require(v1.Parent:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return function(p1) -- Line: 53 -- upvalues: useRem (val), react (val), FillProps (val), Text (val), Icon (val)
    local ContentWidthPx, Y, u14, u19, u8, u9, v1, v2, v3, v4, v5
    local u2 = p1.Upscale or 1
    local u4 = useRem()
    u8, u9 = react.useState(false)
    v4, u14 = react.useState(false)
    v5, u19 = react.useBinding(0)
    local u23 = react.useRef(nil)
    local function resolveHeaderWidthPx(a1) -- Line: 66 -- upvalues: p1 (val), u4 (val), u2 (val)
        if p1.ContentWidthPx then
            return p1.ContentWidthPx
        end
        if 0 < a1 then
            return u4(a1 * u2)
        end
        return u4(500)
    end
    local v6 = {}
    local Native = p1.Native
    if Native then
        Native = p1.Native.Visible
    end
    v6[1] = Native
    local u36 = react.useCallback(function(p1) -- Line: 78 -- upvalues: u19 (val)
        local X = p1.AbsoluteSize.X
        if X == 0 then
            return
        end
        u19(X)
    end, v6)
    local v7 = {}
    local Native_2 = p1.Native
    if Native_2 then
        Native_2 = p1.Native.Visible
    end
    v7[1] = Native_2
    v7[2] = u23
    react.useEffect(function() -- Line: 90 -- upvalues: u23 (val), u36 (val)
        if not u23.current then
            return
        end
        u36(u23.current)
    end, v7)
    ContentWidthPx = p1.ContentWidthPx
    v6 = p1.ClipsDescendants ~= false
    local Native_3 = p1.Native
    if not Native_3 then
        Native_3 = {}
    end
    local v8 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.98}
    if not ContentWidthPx then
        v1 = UDim2.fromScale(0.5, 0.5)
    else
        v1 = UDim2.fromOffset(0, 0)
    end
    v8.Position = v1
    if not ContentWidthPx then
        v1 = Vector2.new(0.5, 0.5)
    else
        v1 = Vector2.new(0, 0)
    end
    v8.AnchorPoint = v1
    if not ContentWidthPx then
        v1 = v5:map(function(p1) -- Line: 119 -- upvalues: resolveHeaderWidthPx (val), u4 (val), u2 (val)
            local v1 = resolveHeaderWidthPx(p1)
            return UDim2.fromOffset(v1, u4(24 * u2))
        end)
    else
        v1 = UDim2.fromOffset(ContentWidthPx, u4(24 * u2))
    end
    v8.Size = v1
    v8.AutomaticSize = Enum.AutomaticSize.Y
    v1 = v6
    if v1 then
        v1 = ContentWidthPx ~= nil
    end
    v8.ClipsDescendants = v1
    v8[react.Event.MouseEnter] = function() -- Line: 127 -- upvalues: u14 (val)
        u14(true)
    end
    v8[react.Event.MouseLeave] = function() -- Line: 131 -- upvalues: u14 (val)
        u14(false)
    end
    local v9 = FillProps(Native_3, v8)
    local v10 = {}
    local v11 = {Thickness = 1, Color = Color3.fromRGB(255, 255, 255)}
    if not v4 then
        v2 = 0.9
    else
        v2 = 0.8
    end
    v11.Transparency = v2
    v10.Stroke = react.createElement("UIStroke", v11)
    v10.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v11 = {BackgroundTransparency = 1, TextTransparency = 1, Text = "", Size = v5:map(function(p1) -- Line: 160 -- upvalues: resolveHeaderWidthPx (val), u4 (val), u2 (val)
        local v1 = resolveHeaderWidthPx(p1)
        return UDim2.fromOffset(v1, u4(24 * u2))
    end)}
    v11[react.Event.MouseButton1Click] = function() -- Line: 164 -- upvalues: u9 (val), u8 (val)
        u9(not u8)
    end
    v10.Hitbox = react.createElement("TextButton", v11)
    v11 = {BorderSizePixel = 0, BackgroundTransparency = 0.9, Size = v5:map(function(p1) -- Line: 171 -- upvalues: resolveHeaderWidthPx (val), u4 (val), u2 (val)
        local v1 = resolveHeaderWidthPx(p1)
        return UDim2.fromOffset(v1, u4(24 * u2))
    end)}
    v2 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Text = react.createElement(Text, {Text = p1.Header or ""}), Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, u4(5 * u2)), PaddingBottom = UDim.new(0, u4(5 * u2)), PaddingLeft = UDim.new(0, u4(10 * u2)), PaddingRight = UDim.new(0, u4(10 * u2))})}
    local v12 = {}
    if not u8 then
        v3 = "rbxassetid://11421095840"
    else
        v3 = "rbxassetid://11421092947"
    end
    v12.Image = v3
    v3 = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.5)}
    local v13 = u4(15 * u2)
    v3.Size = UDim2.fromOffset(v13, u4(15 * u2))
    v12.Native = v3
    v2.Arrow = react.createElement(Icon, v12)
    v10.Header = react.createElement("Frame", v11, v2)
    v11 = {}
    if not ContentWidthPx then
        v2 = UDim2.fromScale(0, 0)
    else
        v2 = UDim2.new(1, 0, 0, 0)
    end
    v11.Size = v2
    if not ContentWidthPx then
        local v14 = UDim2.fromScale(0.5, 0)
        local v15 = u4(24 * u2)
        v2 = v14 + UDim2.fromOffset(0, v15 + u4(3 * u2))
    else
        v12 = u4(24 * u2)
        v2 = UDim2.fromOffset(0, v12 + u4(3 * u2))
    end
    v11.Position = v2
    if not ContentWidthPx then
        v2 = Vector2.new(0.5, 0)
    else
        v2 = Vector2.new(0, 0)
    end
    v11.AnchorPoint = v2
    v11.BackgroundTransparency = 1
    v11.Visible = u8
    if not ContentWidthPx then
        Y = Enum.AutomaticSize.XY
    else
        Y = Enum.AutomaticSize.Y
    end
    v11.AutomaticSize = Y
    v11.ClipsDescendants = v6
    v11.ref = u23
    v11[react.Change.AbsoluteSize] = u36
    v2 = {}
    v12 = {FillDirection = Enum.FillDirection.Vertical}
    local HorizontalAlignment = p1.HorizontalAlignment
    if not HorizontalAlignment then
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    end
    v12.HorizontalAlignment = HorizontalAlignment
    v12.SortOrder = Enum.SortOrder.LayoutOrder
    v12.VerticalAlignment = Enum.VerticalAlignment.Top
    v2.Layout = react.createElement("UIListLayout", v12)
    v10.Content = react.createElement("Frame", v11, v2, p1.children)
    return react.createElement("Frame", v9, v10)
end