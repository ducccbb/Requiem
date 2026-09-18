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
--     File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Textbox
--                               Dumped in 0.00241 seconds
--                          Bytecode version 9  |  12 functions

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
local Checkbox = require(v1.Parent:WaitForChild("Checkbox"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
return function(p1) -- Line: 53 -- upvalues: useRem (val), useTextScale (val), react (val), useOrder (val), FillProps (val), Checkbox (val)
    local Top, XY, u11, u12, u17, u22, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useRem()
    local v10 = useTextScale()
    local v11 = p1.FontSize or 14
    u11, u12 = react.useState(p1.Default or "")
    v7, u17 = react.useState(false)
    v8, u22 = react.useState(false)
    local v12 = p1.Upscale or 1
    react.useEffect(function() -- Line: 66 -- upvalues: p1 (val), u11 (val)
        if p1.Update then
            p1.Update(u11)
        end
    end, {u11})
    local u36 = react.useCallback(function(p1) -- Line: 72 -- upvalues: u12 (val)
        u12(p1.Text)
    end, {u11})
    local Toggleable = p1.Toggleable
    if Toggleable then
        Toggleable = p1.Toggleable.Visible
    end
    local v13 = useOrder()
    local v14 = p1.Divider ~= nil
    local v15 = p1.Large or false
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v16 = {BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    if v15 then
        v1 = UDim2.fromOffset(0, 0)
    elseif not v14 then
        v1 = UDim2.fromOffset(0, v9(24 * v12))
    else
        v1 = UDim2.fromOffset(0, v9(24 * v12))
    end
    v16.Size = v1
    if v15 then
        XY = Enum.AutomaticSize.XY
    elseif not v14 then
        XY = Enum.AutomaticSize.X
    else
        XY = Enum.AutomaticSize.XY
    end
    v16.AutomaticSize = XY
    local v17 = FillProps(Native, v16)
    local v18 = {}
    if not v15 then
        v16 = not v14
        if v16 then
            v16 = react.createElement("UIListLayout", {
                Padding = UDim.new(0, 5 * v12),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            })
        end
    else
        v16 = react.createElement("UIListLayout", {
            Padding = UDim.new(0, 5 * v12),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        })
    end
    v18.List = v16
    local Header = v15
    if Header then
        if Toggleable then
            local createElement_2 = react.createElement
            v2 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
            v3 = {}
            v5 = {
                Padding = UDim.new(0, 5 * v12),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }
            v3.List = react.createElement("UIListLayout", v5)
            v4 = Toggleable
            if v4 then
                local Default
                local createElement_3 = react.createElement
                v5 = {}
                if not p1.Toggleable then
                    Default = false
                else
                    Default = p1.Toggleable.Default
                end
                v5.Default = Default
                function v5.Toggled(a1) -- Line: 136 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v5.Upscale = v12
                v5.Native = {LayoutOrder = 1}
                v4 = createElement_3(Checkbox, v5)
            end
            v3.Checkbox = v4
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
                    TextSize = v10(v11 * v12),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(0, v9(14 * v12)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
            v3.Body = Header_2
            Header = createElement_2("Frame", v2, v3)
        else
            Header = p1.Header
            if not Header then end
        end
    end
    v18.HeaderRow = Header
    local Header_3 = not v15
    if Header_3 then
        Header_3 = v14
        if Header_3 then
            if Toggleable then
                local createElement_4 = react.createElement
                v2 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
                v3 = {}
                v5 = {
                    Padding = UDim.new(0, 5 * v12),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }
                v3.List = react.createElement("UIListLayout", v5)
                v4 = Toggleable
                if v4 then
                    local Default_2
                    local createElement_5 = react.createElement
                    v5 = {}
                    if not p1.Toggleable then
                        Default_2 = false
                    else
                        Default_2 = p1.Toggleable.Default
                    end
                    v5.Default = Default_2
                    function v5.Toggled(a1) -- Line: 186 -- upvalues: p1 (val)
                        if p1.Toggleable and p1.Toggleable.Changed then
                            p1.Toggleable.Changed(a1)
                        end
                    end
                    v5.Upscale = v12
                    v5.Native = {LayoutOrder = 1}
                    v4 = createElement_5(Checkbox, v5)
                end
                v3.Checkbox = v4
                local Header_4 = p1.Header
                if Header_4 then
                    Header_4 = react.createElement("TextLabel", {
                        TextTransparency = 0.32,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        ZIndex = 3,
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                        Text = p1.Header,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = v10(v11 * v12),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Size = UDim2.fromOffset(0, v9(14 * v12)),
                        AutomaticSize = Enum.AutomaticSize.X,
                    })
                end
                v3.Body = Header_4
                Header_3 = createElement_4("Frame", v2, v3)
            else
                Header_3 = p1.Header
                if not Header_3 then end
            end
        end
    end
    v18.LeftColumn = Header_3
    v16 = not v15
    if v16 then
        v16 = not v14
        if v16 then
            v16 = Toggleable
            if v16 then
                local Default_3
                local createElement_6 = react.createElement
                v2 = {}
                if not p1.Toggleable then
                    Default_3 = false
                else
                    Default_3 = p1.Toggleable.Default
                end
                v2.Default = Default_3
                function v2.Toggled(a1) -- Line: 219 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v2.Upscale = v12
                v2.Native = {LayoutOrder = v13()}
                v16 = createElement_6(Checkbox, v2)
            end
        end
    end
    v18.Checkbox = v16
    local Header_5 = not v15
    if Header_5 then
        Header_5 = not v14
        if Header_5 then
            Header_5 = p1.Header
            if Header_5 then
                Header_5 = react.createElement("TextLabel", {
                    TextTransparency = 0.32,
                    BackgroundTransparency = 1,
                    ZIndex = 3,
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Text = p1.Header,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = v10(v11 * v12),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    LayoutOrder = v13(),
                    Size = UDim2.fromOffset(0, v9(14 * v12)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
        end
    end
    v18.Body = Header_5
    v2 = {BackgroundColor3 = Color3.fromRGB(20, 23, 27), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0}
    if v15 then
        v3 = 2
    elseif not v14 then
        v3 = v13()
    else
        v3 = 0
    end
    v2.LayoutOrder = v3
    if v15 then
        v3 = UDim2.fromOffset(0, 0)
    elseif not v14 then
        v3 = UDim2.fromOffset(0, 0)
    else
        v3 = UDim2.fromOffset(p1.Divider or 0, 0)
    end
    v2.Position = v3
    if not v15 then
        v4 = v9((p1.Width or 105) * v12)
        v3 = UDim2.fromOffset(v4, v9(18 * v12))
    else
        v4 = v9(300 * v12)
        v3 = UDim2.fromOffset(v4, v9(100 * v12))
    end
    v2.Size = v3
    v2[react.Event.MouseEnter] = function() -- Line: 261 -- upvalues: u17 (val)
        u17(true)
    end
    v2[react.Event.MouseLeave] = function() -- Line: 265 -- upvalues: u17 (val)
        u17(false)
    end
    v3 = {}
    v5 = {Transparency = 0.58}
    if v8 then
        v6 = Color3.fromRGB(85, 170, 255)
    elseif not v7 then
        v6 = Color3.fromRGB(81, 81, 81)
    else
        v6 = Color3.fromRGB(140, 140, 140)
    end
    v5.Color = v6
    v3.Stroke = react.createElement("UIStroke", v5)
    v3.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * v12)})
    v5 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        PlaceholderColor3 = Color3.fromRGB(99, 99, 99),
        PlaceholderText = p1.PlaceholderText or "",
        Text = p1.Default or "",
        TextColor3 = Color3.fromRGB(157, 157, 157),
        TextSize = v10(v11 * v12),
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    if not v15 then
        Top = Enum.TextYAlignment.Center
    else
        Top = Enum.TextYAlignment.Top
    end
    v5.TextYAlignment = Top
    if not v15 then
        v6 = Vector2.new(0.5, 0.5)
    else
        v6 = Vector2.new(0, 0)
    end
    v5.AnchorPoint = v6
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BackgroundTransparency = 1
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.BorderSizePixel = 0
    if not v15 then
        v6 = UDim2.fromScale(0.341, 0.5)
    else
        v6 = UDim2.fromOffset(0, 0)
    end
    v5.Position = v6
    if not v15 then
        v6 = UDim2.fromScale(0.649, 0.8)
    else
        v6 = UDim2.fromScale(1, 1)
    end
    v5.Size = v6
    v6 = p1.ClearOnFocus ~= false
    v5.ClearTextOnFocus = v6
    v5.TextWrapped = v15
    v5[react.Change.Text] = function(a1) -- Line: 300 -- upvalues: p1 (val)
        if p1.Changed then
            p1.Changed(a1.Text)
        end
    end
    v5[react.Event.Focused] = function() -- Line: 306 -- upvalues: u22 (val), p1 (val)
        u22(true)
        if p1.OnFocused then
            p1.OnFocused()
        end
    end
    v5[react.Event.FocusLost] = function(a1) -- Line: 313 -- upvalues: u22 (val), p1 (val), u36 (val)
        u22(false)
        if p1.OnFocusLost then
            p1.OnFocusLost()
        end
        u36(a1)
    end
    v3.TextBox = react.createElement("TextBox", v5)
    v5 = {PaddingLeft = UDim.new(0, v9(5 * v12))}
    if not v15 then
        v6 = nil
    else
        v6 = UDim.new(0, v9(5 * v12))
    end
    v5.PaddingRight = v6
    if not v15 then
        v6 = nil
    else
        v6 = UDim.new(0, v9(5 * v12))
    end
    v5.PaddingTop = v6
    if not v15 then
        v6 = nil
    else
        v6 = UDim.new(0, v9(5 * v12))
    end
    v5.PaddingBottom = v6
    v3.Padding = react.createElement("UIPadding", v5)
    v18.Input = react.createElement("Frame", v2, v3)
    return createElement("Frame", v17, v18)
end