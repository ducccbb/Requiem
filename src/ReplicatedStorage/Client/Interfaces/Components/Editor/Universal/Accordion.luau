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
--    File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Accordion
--                               Dumped in 0.00161 seconds
--                          Bytecode version 9  |  8 functions

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
return function(p1) -- Line: 42 -- upvalues: useTextScale (val), useRem (val), react (val), useOrder (val), FillProps (val), Checkbox (val)
    local u13, u14, u19, v1, v2, v3, v4, v5, v6, v7
    local v8 = p1.FontSize or 14
    local v9 = p1.Upscale or 1
    local v10 = useTextScale()
    local v11 = useRem()
    u13, u14 = react.useState(p1.DefaultOpen or false)
    v7, u19 = react.useState(false)
    local Toggleable = p1.Toggleable
    if Toggleable then
        Toggleable = p1.Toggleable.Visible
    end
    local v12 = useOrder()
    local v13 = p1.Divider ~= nil
    react.useEffect(function() -- Line: 62 -- upvalues: p1 (val), u13 (val)
        if p1.Changed then
            p1.Changed(u13)
        end
    end, {u13})
    local function toggleAccordion() -- Line: 69 -- upvalues: u14 (val), u13 (val)
        u14(not u13)
    end
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v14 = FillProps(Native, {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
    })
    local v15 = {Layout = react.createElement("UIListLayout", {
        Padding = UDim.new(0, 3 * v9),
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    })}
    local createElement_2 = react.createElement
    local v16 = {BackgroundTransparency = 1, LayoutOrder = 1}
    if not v13 then
        v1 = UDim2.fromOffset(0, v11(24 * v9))
    else
        v1 = UDim2.fromOffset(0, v11(24 * v9))
    end
    v16.Size = v1
    v16.AutomaticSize = Enum.AutomaticSize.X
    v1 = {}
    local v17 = not v13
    if v17 then
        v17 = react.createElement("UIListLayout", {
            Padding = UDim.new(0, 5 * v9),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        })
    end
    v1.List = v17
    local Header = v13
    if Header then
        if Toggleable then
            local createElement_3 = react.createElement
            v2 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.XY}
            v3 = {}
            v5 = {
                Padding = UDim.new(0, 5 * v9),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }
            v3.List = react.createElement("UIListLayout", v5)
            v4 = Toggleable
            if v4 then
                local Default
                local createElement_4 = react.createElement
                v5 = {}
                if not p1.Toggleable then
                    Default = false
                else
                    Default = p1.Toggleable.Default
                end
                v5.Default = Default
                v5.Upscale = v9
                function v5.Toggled(a1) -- Line: 131 -- upvalues: p1 (val)
                    if p1.Toggleable and p1.Toggleable.Changed then
                        p1.Toggleable.Changed(a1)
                    end
                end
                v5.Native = {LayoutOrder = 1}
                v4 = createElement_4(Checkbox, v5)
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
                    TextSize = v10(v8 * v9),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(0, v11(14 * v9)),
                    AutomaticSize = Enum.AutomaticSize.X,
                })
            end
            v3.Body = Header_2
            Header = createElement_3("Frame", v2, v3)
        else
            Header = p1.Header
            if not Header then end
        end
    end
    v1.LeftColumn = Header
    v17 = not v13
    if v17 then
        v17 = Toggleable
        if v17 then
            local Default_2
            local createElement_5 = react.createElement
            v2 = {}
            if not p1.Toggleable then
                Default_2 = false
            else
                Default_2 = p1.Toggleable.Default
            end
            v2.Default = Default_2
            v2.Upscale = v9
            function v2.Toggled(a1) -- Line: 163 -- upvalues: p1 (val)
                if p1.Toggleable and p1.Toggleable.Changed then
                    p1.Toggleable.Changed(a1)
                end
            end
            v2.Native = {LayoutOrder = v12()}
            v17 = createElement_5(Checkbox, v2)
        end
    end
    v1.Checkbox = v17
    local Header_3 = not v13
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
                TextSize = v10(v8 * v9),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                LayoutOrder = v12(),
                Size = UDim2.fromOffset(0, v11(14 * v9)),
                AutomaticSize = Enum.AutomaticSize.X,
            })
        end
    end
    v1.Body = Header_3
    local createElement_6 = react.createElement
    v2 = {BackgroundColor3 = Color3.fromRGB(20, 23, 27), BorderSizePixel = 0}
    if not v13 then
        v3 = v12()
    else
        v3 = 0
    end
    v2.LayoutOrder = v3
    if not v13 then
        v3 = UDim2.fromOffset(0, 0)
    else
        v3 = UDim2.fromOffset(p1.Divider or 0, 0)
    end
    v2.Position = v3
    v4 = v11(18 * v9)
    v2.Size = UDim2.fromOffset(v4, v11(18 * v9))
    v2[react.Event.MouseEnter] = function() -- Line: 198 -- upvalues: u19 (val)
        u19(true)
    end
    v2[react.Event.MouseLeave] = function() -- Line: 202 -- upvalues: u19 (val)
        u19(false)
    end
    v3 = {}
    v5 = {Transparency = 0.58}
    if u13 then
        v6 = Color3.fromRGB(85, 170, 255)
    elseif not v7 then
        v6 = Color3.fromRGB(81, 81, 81)
    else
        v6 = Color3.fromRGB(140, 140, 140)
    end
    v5.Color = v6
    v3.Stroke = react.createElement("UIStroke", v5)
    v3.Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2 * v9)})
    v5 = {BackgroundTransparency = 1, ZIndex = 5}
    if not u13 then
        v6 = "rbxassetid://11421095840"
    else
        v6 = "rbxassetid://11421092947"
    end
    v5.Image = v6
    v5.ImageColor3 = Color3.fromRGB(145, 145, 145)
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.Position = UDim2.fromScale(0.5, 0.5)
    local v18 = v11(11 * v9)
    v5.Size = UDim2.fromOffset(v18, v11(11 * v9))
    v3.Icon = react.createElement("ImageLabel", v5)
    v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = "", ZIndex = 4}
    v5[react.Event.MouseButton1Click] = toggleAccordion
    v3.Hitbox = react.createElement("TextButton", v5)
    v1.ToggleButton = createElement_6("Frame", v2, v3)
    v15.Header = createElement_2("Frame", v16, v1)
    local v19 = u13
    if v19 then
        v19 = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v11(23 * v9))}), ContentWrapper = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, 0), AutomaticSize = Enum.AutomaticSize.Y}, p1.children)})
    end
    v15.Content = v19
    return createElement("Frame", v14, v15)
end