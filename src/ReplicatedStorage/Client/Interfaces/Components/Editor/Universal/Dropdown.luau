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
--    File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Dropdown
--                               Dumped in 0.00307 seconds
--                          Bytecode version 9  |  19 functions

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
local UserInputService = game:GetService("UserInputService")
local Checkbox = require(v1.Parent:WaitForChild("Checkbox"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
return react.memo(function(p1) -- Line: 52 -- upvalues: useTextScale (val), useRem (val), react (val), useOrder (val), UserInputService (val), FillProps (val), Checkbox (val)
    local None, u17, u18, u22, u23, u28, u32, u33, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local u2 = p1.FontSize or 14
    local u4 = p1.Upscale or 1
    local u6 = useTextScale()
    local u8 = useRem()
    local Default = p1.Default
    if not Default then
        Default = p1.Options[1] or "Dropdown"
    end
    u17, u18 = react.useState(Default)
    u22, u23 = react.useState(false)
    v9, u28 = react.useState(false)
    u32, u33 = react.useState(nil)
    local u37 = react.useRef(nil)
    local u41 = react.useRef(nil)
    local u45 = react.useRef(false)
    local v10 = {p1.Default}
    react.useEffect(function() -- Line: 68 -- upvalues: p1 (val), u45 (val), u18 (val)
        if p1.Default ~= nil then
            u45.current = true
            u18(p1.Default)
        end
    end, v10)
    local Toggleable = p1.Toggleable
    if Toggleable then
        Toggleable = p1.Toggleable.Visible
    end
    local v11 = useOrder()
    v10 = p1.Divider ~= nil
    local v12 = p1.FillWidth == true
    if not v10 then
        v1 = 0
    else
        v1 = u8((p1.Divider or 0) * u4)
    end
    local u86 = react.useRef(true)
    react.useEffect(function() -- Line: 91 -- upvalues: u86 (val), u45 (val), p1 (val), u17 (val)
        if u86.current then
            u86.current = false
            return
        end
        if u45.current then
            u45.current = false
            return
        end
        if p1.Changed then
            p1.Changed(u17)
        end
    end, {u17})
    local v13 = react.useCallback(function() -- Line: 107 -- upvalues: u23 (val)
        u23(function(p1) -- Line: 108
            return not p1
        end)
    end, {})
    local u119 = react.useCallback(function(p1) -- Line: 114 -- upvalues: u45 (val), u18 (val), u23 (val)
        u45.current = false
        u18(p1)
        u23(false)
    end, {})
    local v14 = react.useCallback(function() -- Line: 121 -- upvalues: u28 (val)
        u28(true)
    end, {})
    local v15 = react.useCallback(function() -- Line: 125 -- upvalues: u28 (val)
        u28(false)
    end, {})
    react.useEffect(function() -- Line: 130 -- upvalues: u22 (val), UserInputService (upval), u37 (val), u41 (val), u23 (val)
        if not u22 then
            return
        end
        local u6 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 135 -- upvalues: UserInputService (upval), u37 (upval), u41 (upval), u23 (upval)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                task.defer(function() -- Line: 138 -- upvalues: UserInputService (upval), u37 (upval), u41 (upval), u23 (upval)
                    local GuiInset = game:GetService("GuiService"):GetGuiInset()
                    local MouseLocation = UserInputService:GetMouseLocation()
                    local v1 = MouseLocation.Y - GuiInset.Y
                    local v2 = true
                    local current = u37.current
                    if current then
                        local AbsolutePosition = current.AbsolutePosition
                        local AbsoluteSize = current.AbsoluteSize
                        local v3 = if AbsolutePosition.X <= MouseLocation.X then if MouseLocation.X <= AbsolutePosition.X + AbsoluteSize.X then if AbsolutePosition.Y <= v1 then v1 <= AbsolutePosition.Y + AbsoluteSize.Y else false else false else false
                        if v3 then
                            v2 = false
                        end
                    end
                    if v2 then
                        local current_2 = u41.current
                        if current_2 then
                            local AbsolutePosition_2 = current_2.AbsolutePosition
                            local AbsoluteSize_2 = current_2.AbsoluteSize
                            local v4 = if AbsolutePosition_2.X <= MouseLocation.X then if MouseLocation.X <= AbsolutePosition_2.X + AbsoluteSize_2.X then if AbsolutePosition_2.Y <= v1 then v1 <= AbsolutePosition_2.Y + AbsoluteSize_2.Y else false else false else false
                            if v4 then
                                v2 = false
                            end
                        end
                    end
                    if v2 then
                        u23(false)
                    end
                end)
            end
        end)
        return function() -- Line: 188 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, {u22})
    local v16 = react.useMemo(function() -- Line: 194 -- upvalues: p1 (val), u17 (val), u32 (val), react (upval), u8 (val), u4 (val), u33 (val), u119 (val), u6 (val), u2 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        local Options = p1.Options
        local v10 = nil
        local v11 = nil
        for i, j in Options, v10, v11 do
            v7 = j == u17
            v8 = u32 == j
            v1 = {}
            if v7 then
                v2 = Color3.fromRGB(85, 170, 255)
            elseif not v8 then
                v2 = Color3.fromRGB(50, 50, 50)
            else
                v2 = Color3.fromRGB(70, 70, 70)
            end
            v1.BackgroundColor3 = v2
            if v7 then
                v2 = 0.3
            elseif v8 then
                v2 = 0.5
            elseif i % 2 ~= 0 then
                v2 = 0.7
            else
                v2 = 0.9
            end
            v1.BackgroundTransparency = v2
            v1.Size = UDim2.new(1, 0, 0, u8(20 * u4))
            v1.Text = ""
            v1.LayoutOrder = i
            v1[react.Event.MouseEnter] = function() -- Line: 214 -- upvalues: u33 (upval), j (val)
                u33(j)
            end
            v1[react.Event.MouseLeave] = function() -- Line: 218 -- upvalues: u33 (upval)
                u33(nil)
            end
            v1[react.Event.MouseButton1Click] = function() -- Line: 222 -- upvalues: u119 (upval), j (val)
                u119(j)
            end
            v2 = {}
            v3 = {BackgroundTransparency = 1, ZIndex = 3, Text = j, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")}
            if not v7 then
                v4 = Color3.fromRGB(200, 200, 200)
            else
                v4 = Color3.fromRGB(255, 255, 255)
            end
            v3.TextColor3 = v4
            v3.TextSize = u6(u2 * u4)
            v3.TextXAlignment = Enum.TextXAlignment.Left
            v3.TextYAlignment = Enum.TextYAlignment.Center
            v3.TextTruncate = Enum.TextTruncate.AtEnd
            v3.AnchorPoint = Vector2.new(0, 0)
            v6 = -u8(16 * u4)
            v3.Size = UDim2.new(1, v6, 1, 0)
            v5 = u8(8 * u4)
            v3.Position = UDim2.fromOffset(v5, 0)
            if not v7 then
                v4 = 0.32
            else
                v4 = 0
            end
            v3.TextTransparency = v4
            v2.Label = react.createElement("TextLabel", v3)
            v9[j] = react.createElement("TextButton", v1, v2)
        end
        return v9
    end, {
        p1.Options,
        u17,
        u32,
        u4,
        u2,
        u119,
        v12,
    })
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v17 = {BackgroundTransparency = 1, ClipsDescendants = false, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if not v12 then
        v2 = UDim2.fromScale(0.5, 0.5)
    else
        v2 = UDim2.fromOffset(0, 0)
    end
    v17.Position = v2
    if not v12 then
        v2 = Vector2.new(0.5, 0.5)
    else
        v2 = Vector2.new(0, 0)
    end
    v17.AnchorPoint = v2
    if not v12 then
        v2 = UDim2.fromOffset(0, u8(24 * u4))
    else
        v2 = UDim2.new(1, 0, 1, 0)
    end
    v17.Size = v2
    if not v12 then
        None = Enum.AutomaticSize.X
    else
        None = Enum.AutomaticSize.None
    end
    v17.AutomaticSize = None
    local v18 = FillProps(Native, v17)
    local v19 = {}
    v17 = not v10
    if v17 then
        v17 = not v12
        if v17 then
            v17 = react.createElement("UIListLayout", {
                Padding = UDim.new(0, u8(5 * u4)),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            })
        end
    end
    v19.List = v17
    local Header = v10
    if Header then
        if Toggleable then
            local createElement_2 = react.createElement
            v3 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
            v4 = {}
            v6 = {
                Padding = UDim.new(0, u8(5 * u4)),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }
            v4.List = react.createElement("UIListLayout", v6)
            v5 = Toggleable
            if v5 then
                local Default_2
                local createElement_3 = react.createElement
                v6 = {}
                if not p1.Toggleable then
                    Default_2 = false
                else
                    Default_2 = p1.Toggleable.Default
                end
                v6.Default = Default_2
                v6.Upscale = u4
                function v6.Toggled(a1) -- Line: 288 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v6.Native = {LayoutOrder = 1}
                v5 = createElement_3(Checkbox, v6)
            end
            v4.Checkbox = v5
            local Header_2 = p1.Header
            if Header_2 then
                Header_2 = react.createElement("TextLabel", {
                    TextTransparency = 0.32,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Text = p1.Header,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = u6(u2 * u4),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(0, u8(14 * u4)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
            v4.Body = Header_2
            Header = createElement_2("Frame", v3, v4)
        else
            Header = p1.Header
            if not Header then end
        end
    end
    v19.LeftColumn = Header
    v17 = not v10
    if v17 then
        v17 = Toggleable
        if v17 then
            local Default_3
            local createElement_4 = react.createElement
            v3 = {}
            if not p1.Toggleable then
                Default_3 = false
            else
                Default_3 = p1.Toggleable.Default
            end
            v3.Default = Default_3
            v3.Upscale = u4
            function v3.Toggled(a1) -- Line: 320 -- upvalues: p1 (val)
                if p1.Toggleable and p1.Toggleable.Changed then
                    p1.Toggleable.Changed(a1)
                end
            end
            v3.Native = {LayoutOrder = v11()}
            v17 = createElement_4(Checkbox, v3)
        end
    end
    v19.Checkbox = v17
    local Header_3 = not v10
    if Header_3 then
        Header_3 = p1.Header
        if Header_3 then
            Header_3 = react.createElement("TextLabel", {
                TextTransparency = 0.32,
                BackgroundTransparency = 1,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                Text = p1.Header,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = u6(u2 * u4),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                LayoutOrder = v11(),
                Size = UDim2.fromOffset(0, u8(14 * u4)),
                AutomaticSize = Enum.AutomaticSize.X,
            })
        end
    end
    v19.Body = Header_3
    local createElement_5 = react.createElement
    v3 = {BackgroundColor3 = Color3.fromRGB(20, 23, 27), BorderSizePixel = 0}
    if not v10 then
        v4 = v11()
    else
        v4 = 0
    end
    v3.LayoutOrder = v4
    if v12 then
        v4 = UDim2.fromOffset(v1, 0)
    elseif not v10 then
        v4 = UDim2.fromScale(0.456, 0.125)
    else
        v4 = UDim2.fromOffset(p1.Divider or 0, 0)
    end
    v3.Position = v4
    if not v12 then
        v5 = u8((p1.Width or 105) * u4)
        v4 = UDim2.fromOffset(v5, u8(18 * u4))
    else
        v4 = UDim2.new(1, -v1, 1, 0)
    end
    v3.Size = v4
    v3.ClipsDescendants = false
    v3.ref = u37
    v3[react.Event.MouseEnter] = v14
    v3[react.Event.MouseLeave] = v15
    v4 = {}
    v6 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 4}
    v6[react.Event.MouseButton1Click] = v13
    v4.Hitbox = react.createElement("TextButton", v6)
    v6 = {Transparency = 0.58}
    if u22 then
        v7 = Color3.fromRGB(85, 170, 255)
    elseif not v9 then
        v7 = Color3.fromRGB(81, 81, 81)
    else
        v7 = Color3.fromRGB(140, 140, 140)
    end
    v6.Color = v7
    v4.Stroke = react.createElement("UIStroke", v6)
    v6 = {CornerRadius = UDim.new(0, 2 * u4)}
    v4.Corner = react.createElement("UICorner", v6)
    v5 = u22
    if v5 then
        v6 = {BackgroundTransparency = 0, ZIndex = 10, BackgroundColor3 = Color3.fromRGB(15, 18, 21)}
        if not v12 then
            v8 = UDim2.fromScale(0.5, 1)
            v7 = v8 + UDim2.fromOffset(-3 * u4, 3 * u4)
        else
            v7 = UDim2.new(0, 0, 1, u8(3 * u4))
        end
        v6.Position = v7
        if not v12 then
            v7 = Vector2.new(0.5, 0)
        else
            v7 = Vector2.new(0, 0)
        end
        v6.AnchorPoint = v7
        if not v12 then
            v8 = UDim2.fromScale(1, 0)
            v7 = v8 + UDim2.fromOffset(5 * u4, u8(#p1.Options * 20 * u4))
        else
            v7 = UDim2.new(1, 0, 0, u8(#p1.Options * 20 * u4))
        end
        v6.Size = v7
        v6.ref = u41
        v5 = react.createElement("Frame", v6, {Stroke = react.createElement("UIStroke", {Transparency = 0.58, Color = Color3.fromRGB(81, 81, 81)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * u4)}), Scrolling = react.createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.fromOffset(0, 0),
            ScrollBarThickness = 2 * u4,
        }, {Layout = react.createElement("UIListLayout", {
            Padding = UDim.new(0, 1 * u4),
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        })}, v16), Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(math.huge, u8(200 * u4))})})
    end
    v4.Content = v5
    v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = u17,
        TextColor3 = Color3.fromRGB(157, 157, 157),
        TextSize = u6(u2 * u4),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    v8 = u8(8 * u4)
    v6.Position = UDim2.fromOffset(v8, 0)
    local v20 = -u8(24 * u4)
    v6.Size = UDim2.new(1, v20, 1, 0)
    v4.Selection = react.createElement("TextLabel", v6)
    v6 = {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 5}
    if not u22 then
        v7 = "rbxassetid://11421095840"
    else
        v7 = "rbxassetid://11421092947"
    end
    v6.Image = v7
    v6.ImageColor3 = Color3.fromRGB(145, 145, 145)
    v6.AnchorPoint = Vector2.new(1, 0.5)
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v20 = -u8(8 * u4)
    v6.Position = UDim2.new(1, v20, 0.5, 0)
    v8 = u8(11 * u4)
    v6.Size = UDim2.fromOffset(v8, u8(11 * u4))
    v4.ToggleButton = react.createElement("ImageLabel", v6)
    v19.Input = createElement_5("Frame", v3, v4)
    return createElement("Frame", v18, v19)
end)