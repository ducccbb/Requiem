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
--       File: ReplicatedStorage.Client.Interfaces.Components.Universal.Accordion
--                               Dumped in 0.00171 seconds
--                          Bytecode version 9  |  14 functions

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
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local HeaderBodyComponent = require(v1.Parent:WaitForChild("HeaderBodyComponent"))
local Primitives_2 = v1.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives_2:WaitForChild("Hitbox"))
local v3 = {
    Accordion = function(p1) -- Line: 180 -- upvalues: useConstants (val), useTheme (val), useTextScale (val), FillProps (val), react (val), Color (val)
        local v1
        local v2 = useConstants()
        local v3 = useTheme()
        local v4 = useTextScale()
        local v5 = p1.MaxSize ~= nil
        local v6 = p1.FillHeight == true
        local Native = p1.Native
        if not Native then
            Native = {}
        end
        local v7 = {BackgroundColor3 = v3.Container.Background, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = v3.PageTransparency}
        local v8 = FillProps(Native, v7)
        local v9 = {UILayout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v2.Padding.Sizes.Large)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Padding = react.createElement("UIPadding", v2.Padding.Universal.Large), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v3.Container.Stroke})}
        local v10 = {
            BackgroundTransparency = 1,
            LayoutOrder = -5,
            Size = UDim2.fromScale(1, 0),
            Text = p1.Header,
            Font = Enum.Font.SourceSansBold,
            TextSize = v4(15),
            TextColor3 = Color.Darken(v3.Primary, 0.5),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
        }
        local v11 = p1.Header ~= nil
        v10.Visible = v11
        v9.Header = react.createElement("TextLabel", v10)
        v10 = {BorderSizePixel = 0, BackgroundTransparency = 1, LayoutOrder = -4}
        local v12 = UDim2.fromScale(1, 0)
        v10.Size = v12 + UDim2.fromOffset(0, 1)
        v10.AnchorPoint = Vector2.new(0.5, 1)
        v10.Position = UDim2.fromScale(0.5, 1)
        v11 = p1.Header ~= nil
        v10.Visible = v11
        v9.Divider = react.createElement("Frame", v10)
        if v5 then
            if not v6 then
                v1 = UDim2.fromScale(1, 0)
                v7 = v1 + UDim2.fromOffset(0, p1.MaxSize)
            else
                v7 = UDim2.fromScale(1, 1)
            end
            v11 = FillProps(v8, {
                ScrollBarThickness = 6,
                BorderSizePixel = 0,
                Size = v7,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.fromScale(0, 0),
                ScrollBarImageColor3 = v3.Primary,
            })
            return react.createElement("ScrollingFrame", v11, v9, p1.children)
        end
        if not v6 then
            v10 = FillProps(v8, {Size = UDim2.fromScale(1, 0), AutomaticSize = Enum.AutomaticSize.Y})
            return react.createElement("Frame", v10, v9, p1.children)
        end
        if not v6 then
            v1 = UDim2.fromScale(1, 0)
            v7 = v1 + UDim2.fromOffset(0, p1.MaxSize)
        else
            v7 = UDim2.fromScale(1, 1)
        end
        v11 = FillProps(v8, {
            ScrollBarThickness = 6,
            BorderSizePixel = 0,
            Size = v7,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.fromScale(0, 0),
            ScrollBarImageColor3 = v3.Primary,
        })
        return react.createElement("ScrollingFrame", v11, v9, p1.children)
    end,
}
function v3.AccordionItem(p1) -- Line: 52 -- upvalues: react (val), useConstants (val), useTheme (val), useMotion (val), useTextScale (val), HeaderBodyComponent (val), Frame (val), Hitbox (val), Color (val)
    local u17, u23, u24, u28, u32, u36, u37, u4, u5, v1, v2, v3
    u4, u5 = react.useState(false)
    local v4 = useConstants()
    local v5 = useTheme()
    local u13 = react.useRef(nil)
    v3, u17 = useMotion(0)
    local u19 = useTextScale()
    u23, u24 = react.useState(false)
    v1, u28 = useMotion(0.5)
    v2, u32 = useMotion(0)
    u36, u37 = react.useState(0)
    react.useEffect(function() -- Line: 68 -- upvalues: u17 (val), u4 (val), u28 (val), u32 (val), u36 (val)
        local v1
        if not u4 then
            v1 = 0
        else
            v1 = 180
        end
        u17:spring(v1)
        if not u4 then
            v1 = 0.5
        else
            v1 = 0
        end
        u28:spring(v1)
        if not u4 then
            v1 = 0
        else
            v1 = u36
            if not v1 then
                v1 = 0
            end
        end
        u32:spring(v1)
    end, {u4, u36, u13})
    react.useEffect(function() -- Line: 75 -- upvalues: u28 (val), u4 (val), u23 (val)
        local v1
        if u4 then
            v1 = 0
        elseif not u23 then
            v1 = 0.5
        else
            v1 = 0
        end
        u28:spring(v1)
    end, {u23})
    react.useEffect(function() -- Line: 79 -- upvalues: u13 (val), u37 (val)
        if not u13.current then
            return
        end
        u37(u13.current.AbsoluteSize.Y)
    end, {u13})
    local v6 = {BackgroundTransparency = 1, LayoutOrder = p1.LayoutOrder, Size = v2:map(function(p1) -- Line: 90 -- upvalues: u19 (val)
        local v1 = UDim2.fromScale(1, 0)
        local v2 = v1 + UDim2.fromOffset(0, p1)
        return v2 + UDim2.fromOffset(0, u19(30))
    end)}
    local v7 = {}
    local v8 = {Header = p1.Header, Position = UDim2.fromOffset(0, u19(15))}
    local v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, u19(30))
    v8.Underlined = u23
    v7.Header = react.createElement(HeaderBodyComponent, v8)
    v8 = {BackgroundTransparency = 1, Image = "rbxassetid://11421095840"}
    v9 = u19(15)
    v8.Size = UDim2.fromOffset(v9, u19(15))
    v9 = UDim2.fromScale(1, 0)
    local v10 = -u19(15)
    v8.Position = v9 + UDim2.fromOffset(v10, u19(12))
    v8.AnchorPoint = Vector2.new(1, 0.5)
    v8.Rotation = v3
    v7.Arrow = react.createElement("ImageLabel", v8)
    v8 = {}
    v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, u19(30))
    v9 = UDim2.fromScale(0.5, 0)
    v8.Position = v9 + UDim2.fromOffset(0, u19(15))
    v8[react.Event.MouseEnter] = function() -- Line: 115 -- upvalues: u24 (val)
        u24(true)
    end
    v8[react.Event.MouseLeave] = function() -- Line: 119 -- upvalues: u24 (val)
        u24(false)
    end
    v7.Frame = react.createElement(Frame, v8, {Hitbox = react.createElement(Hitbox, {
        Enabled = true,
        Clicked = function() -- Line: 124 -- upvalues: u5 (val), u4 (val)
            u5(not u4)
        end,
    })})
    v8 = {BackgroundTransparency = 1, Size = v2:map(function(p1) -- Line: 134
        local v1 = UDim2.fromScale(1, 0)
        return v1 + UDim2.fromOffset(0, p1)
    end)}
    v9 = UDim2.fromScale(0.5, 0)
    v8.Position = v9 + UDim2.fromOffset(0, u19(25))
    v8.AnchorPoint = Vector2.new(0.5, 0)
    v8.Visible = v2:map(function(p1) -- Line: 139
        local v1 = 0 < p1
        return v1
    end)
    v8.ClipsDescendants = v2:map(function(p1) -- Line: 143 -- upvalues: u36 (val)
        local v1 = p1 < u36 - 5
        return v1
    end)
    local v11 = {}
    v10 = {}
    local v12 = UDim2.fromScale(1, 0)
    local v13 = -u19(15)
    v10.Size = v12 + UDim2.fromOffset(v13, 0)
    v10.Position = UDim2.fromScale(0.5, 0)
    v10.AnchorPoint = Vector2.new(0.5, 0)
    v10.AutomaticSize = Enum.AutomaticSize.Y
    v10.BackgroundTransparency = 1
    v10[react.Change.AbsoluteSize] = function(p1) -- Line: 154 -- upvalues: u37 (val)
        u37(p1.AbsoluteSize.Y)
    end
    v10.ref = u13
    local v14 = {Padding = react.createElement("UIPadding", v4.Padding.Universal[p1.Padding or "Large"])}
    v13 = {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder}
    local LayoutGap = p1.LayoutGap
    if not LayoutGap then
        LayoutGap = v4.Padding.Sizes.Large
    end
    v13.Padding = UDim.new(0, LayoutGap)
    v14.UILayout = react.createElement("UIListLayout", v13)
    v11.Content = react.createElement("Frame", v10, v14, p1.children)
    v7.Clip = react.createElement("Frame", v8, v11)
    v8 = {BorderSizePixel = 0}
    v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, 1)
    v8.BackgroundColor3 = Color.Darken(v5.PageBackground, 2, 0.15, 0.15)
    v8.AnchorPoint = Vector2.new(0.5, 1)
    v8.Position = UDim2.fromScale(0.5, 1)
    v8.BackgroundTransparency = v1
    v7.Line = react.createElement("Frame", v8)
    return react.createElement("Frame", v6, v7)
end
return v3