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
--       File: ReplicatedStorage.Client.Interfaces.Components.Universal.Pagination
--                               Dumped in 0.00259 seconds
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
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_2:WaitForChild("FillProps"))
local Routes = v1.Parent.Parent.Parent:WaitForChild("Routes")
local Screen = Routes:WaitForChild("Screen")
local ContextMenu = require(Screen:WaitForChild("ContextMenu"))
local Inputs = v1.Parent.Parent:WaitForChild("Inputs")
local DropdownInput = require(Inputs:WaitForChild("DropdownInput"))
local Form = require(v1.Parent:WaitForChild("Form"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local HeaderBodyComponent = require(v1.Parent:WaitForChild("HeaderBodyComponent"))
local Primitives_2 = v1.Parent.Parent:WaitForChild("Primitives")
local Hitbox = require(Primitives_2:WaitForChild("Hitbox"))
local Primitives_3 = v1.Parent.Parent:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_3:WaitForChild("HorizontalListLayout"))
local Primitives_4 = v1.Parent.Parent:WaitForChild("Primitives")
local Image = require(Primitives_4:WaitForChild("Image"))
local Primitives_5 = v1.Parent.Parent:WaitForChild("Primitives")
local Label = require(Primitives_5:WaitForChild("Label"))
local Loading = require(v1.Parent:WaitForChild("Loading"))
local Inputs_2 = v1.Parent.Parent:WaitForChild("Inputs")
local TextInput = require(Inputs_2:WaitForChild("TextInput"))
local Primitives_6 = v1.Parent.Parent:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_6:WaitForChild("VerticalListLayout"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useProfile = require(Hooks_3:WaitForChild("useProfile"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local function PaginationEntry(p1) -- Line: 83 -- upvalues: useProfile (val), useTheme (val), react (val), Frame (val), Image (val), Color (val), Label (val), ContextMenu (val)
    local u2, v1, v2
    u2, v1, v2 = useProfile()
    local v3 = useTheme()
    react.useEffect(function() -- Line: 87 -- upvalues: p1 (val), u2 (val)
        if not p1.UserId then
            return
        end
        u2(p1.UserId)
    end, {p1.UserId})
    local v4 = {BackgroundTransparency = 1, LayoutOrder = p1.Index}
    local v5 = p1.UserId ~= nil
    v4.Visible = v5
    v5 = {Image = react.createElement(Image, {
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(0.775, 0.775),
        Position = UDim2.fromScale(0.5, 0.425),
        Image = v1,
        BackgroundColor3 = Color.Darken(v3.Primary, 0.8),
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}), Label = react.createElement(Label, {
        TextSize = 13,
        Text = v2,
        Position = UDim2.fromScale(0.5, 0.98),
        AnchorPoint = Vector2.new(0.5, 1),
        TextColor3 = Color.Darken(v3.Primary, 0.7),
    })}
    local Contexts = p1.Contexts
    if Contexts then
        Contexts = react.createElement(ContextMenu.ContextMenu, {
            Contexts = p1.Contexts.Labels,
            Callback = function(a1) -- Line: 127 -- upvalues: p1 (val)
                if p1.Contexts.Callback then
                    p1.Contexts.Callback(a1, p1.UserId or 0)
                end
            end,
        })
    end
    v5.Context = Contexts
    return react.createElement(Frame, v4, v5)
end
local function PaginationPageSelector(p1) -- Line: 136 -- upvalues: useRem (val), useOrder (val), useTheme (val), react (val), Frame (val), FillProps (val), HorizontalListLayout (val), Image (val), Color (val), Hitbox (val), Label (val)
    local v1
    local v2 = useRem()
    local v3 = useOrder()
    local v4 = useTheme()
    local Page = p1.Page
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v5 = {BackgroundTransparency = 1}
    local v6 = v2(100)
    v5.Size = UDim2.fromOffset(v6, v2(20))
    v5.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    local v7 = 1 < p1.Pages
    v5.Visible = v7
    local v8 = FillProps(Native, v5)
    local v9 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Center})}
    v6 = {Image = "rbxassetid://11293981980"}
    local v10 = v2(13)
    v6.Size = UDim2.fromOffset(v10, v2(13))
    if Page ~= 1 then
        v1 = 1
    else
        v1 = 0.5
    end
    v6.ImageColor3 = Color.Darken(v4.Primary, v1)
    v6.LayoutOrder = v3()
    local v11 = {}
    local v12 = {}
    local v13 = 1 < Page
    v12.Enabled = v13
    function v12.Clicked() -- Line: 170 -- upvalues: p1 (val), Page (val)
        if p1.Paged then
            p1.Paged(Page - 1)
        end
        return true
    end
    v11.Hitbox = react.createElement(Hitbox, v12)
    v9.Left = react.createElement(Image, v6, v11)
    v6 = {TextTransparency = 0.3, TextSize = 14, Text = "Page " .. tostring(Page)}
    v10 = v2(40)
    v6.Size = UDim2.fromOffset(v10, v2(20))
    v6.LayoutOrder = v3()
    v9.Label = react.createElement(Label, v6)
    v6 = {Image = "rbxassetid://11419703997"}
    v10 = v2(13)
    v6.Size = UDim2.fromOffset(v10, v2(13))
    if Page ~= p1.Pages then
        v1 = 1
    else
        v1 = 0.5
    end
    v6.ImageColor3 = Color.Darken(v4.Primary, v1)
    v6.LayoutOrder = v3()
    v11 = {}
    v12 = {}
    v13 = Page < p1.Pages
    v12.Enabled = v13
    function v12.Clicked() -- Line: 196 -- upvalues: p1 (val), Page (val)
        if p1.Paged then
            p1.Paged(Page + 1)
        end
        return true
    end
    v11.Hitbox = react.createElement(Hitbox, v12)
    v9.Right = react.createElement(Image, v6, v11)
    return react.createElement(Frame, v8, v9)
end
local v3 = {}
function v3.Pagination(p1) -- Line: 211 -- upvalues: useTheme (val), useConstants (val), useRem (val), useOrder (val), react (val), PaginationEntry (val), FillProps (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), DropdownInput (val), TextInput (val), PaginationPageSelector (val), Frame (val), Color (val), Loading (val)
    local Search, u17, u22, v1, v2, v3
    local v4 = useTheme()
    local v5 = useConstants()
    local v6 = useRem()
    local v7 = useOrder()
    local v8 = p1.Width or "Large"
    local v9 = p1.Height or "Large"
    v2, u17 = react.useState(1)
    v3, u22 = react.useState(nil)
    local children = p1.children
    if not children then
        children = {}
    end
    if not p1.children then
        local Maximum = p1.Maximum
        local v10 = 1
        for i = 1, Maximum, v10 do
            children["Frame" .. i] = react.createElement(PaginationEntry, {UserId = p1.Results[i], Contexts = p1.Contexts, Index = i})
        end
    end
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v11 = FillProps(Native, {
        BackgroundColor3 = v4.Container.Background,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v4.PageTransparency,
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    local v12 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Padding = react.createElement("UIPadding", v5.Padding.combine(v5.Padding.Height[v9], v5.Padding.Width[v8])), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v4.Container.Stroke}), Layout = react.createElement(VerticalListLayout, {Spacing = 15})}
    local createElement_2 = react.createElement
    local Form_2 = Form.Form
    local v13 = {Strokeless = true}
    local v14 = {BackgroundTransparency = 1, ZIndex = 3, LayoutOrder = 1, AutomaticSize = Enum.AutomaticSize.None}
    local v15 = UDim2.fromScale(1, 0)
    v14.Size = v15 + UDim2.fromOffset(0, v6(30))
    v13.Native = v14
    v14 = {}
    local v16 = {Label = react.createElement(HeaderBodyComponent, {Header = p1.Header, Position = UDim2.fromScale(0.5, 0.5)})}
    v14.Left = react.createElement(Form.Divider, {Side = "Left"}, v16)
    local createElement_3 = react.createElement
    local Divider = Form.Divider
    local v17 = {Side = "Right"}
    if not p1.Search then
        v16 = "Medium"
    else
        v16 = "Small"
    end
    v17.Padding = v16
    v16 = {}
    local v18 = {}
    local Filters = p1.Filters
    if Filters then
        Filters = false
        v1 = #p1.Filters
        if 0 < v1 then
            Filters = not v3
            if not Filters then
                Filters = v3 == ""
            end
        end
    end
    v18.Visible = Filters
    local v19 = {BackgroundTransparency = 1, LayoutOrder = 3 - v7()}
    v18.Native = v19
    function v18.Selected(...) -- Line: 292 -- upvalues: p1 (val), u17 (val)
        if p1.Filtered then
            p1.Filtered(...)
            u17(1)
        end
    end
    v18.Default = p1.Default
    v18.Options = p1.Filters
    v16.Dropdown = react.createElement(DropdownInput, v18)
    local Subfilters = p1.Subfilters
    if Subfilters then
        v18 = {Default = "None"}
        local Subfilters_2 = p1.Subfilters
        if Subfilters_2 then
            Subfilters_2 = false
            v1 = #p1.Subfilters
            if 0 < v1 then
                Subfilters_2 = not v3
                if not Subfilters_2 then
                    Subfilters_2 = v3 == ""
                end
            end
        end
        v18.Visible = Subfilters_2
        v18.Native = {BackgroundTransparency = 1, LayoutOrder = 3 - v7()}
        function v18.Selected(...) -- Line: 305 -- upvalues: p1 (val), u17 (val)
            if p1.Subfiltered then
                p1.Subfiltered(...)
                u17(1)
            end
        end
        local Subfilters_3 = p1.Subfilters
        if not Subfilters_3 then
            Subfilters_3 = {}
        end
        v18.Options = Subfilters_3
        Subfilters = react.createElement(DropdownInput, v18)
    end
    v16.Subfilters = Subfilters
    Search = p1.Search
    if Search then
        v18 = {Layout = 3, Header = "Search...", Color = v4.PageBackground}
        v19 = {BackgroundTransparency = 1}
        local v20 = UDim2.fromScale(0.45, 0)
        v19.Size = v20 + UDim2.fromOffset(0, v6(70))
        v19.LayoutOrder = 3 - v7()
        v18.Native = v19
        function v18.Changed(a1) -- Line: 326 -- upvalues: u17 (val), u22 (val), p1 (val)
            u17(1)
            u22(a1)
            if p1.Searched then
                p1.Searched(a1)
            end
        end
        Search = react.createElement(TextInput, v18)
    end
    v16.Search = Search
    v16.Page = react.createElement(PaginationPageSelector, {
        Pages = p1.Pages,
        Page = v2,
        Paged = function(a1) -- Line: 340 -- upvalues: p1 (val), u17 (val)
            if p1.Paged then
                p1.Paged(a1)
            end
            u17(a1)
        end,
        Native = {LayoutOrder = 3 - v7()},
    })
    v14.Right = createElement_3(Divider, v17, v16)
    v12.Header = createElement_2(Form_2, v13, v14)
    v13 = {BackgroundTransparency = 0.7, LayoutOrder = 2}
    local v21 = UDim2.fromScale(1, 0)
    v17 = -v6(20)
    v13.Size = v21 + UDim2.fromOffset(v17, 1)
    v12.Splitter = react.createElement(Frame, v13)
    v13 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 3}
    v21 = UDim2.fromScale(1, 0)
    v13.Size = v21 + UDim2.fromOffset(0, v6(p1.Length or 240))
    v13.BackgroundColor3 = Color.Darken(v4.PageBackground, 0.5)
    v14 = {}
    v15 = p1.Loading == nil
    v21 = not v15
    if v21 then
        v21 = react.createElement(Frame, {ZIndex = 4}, {Padding = react.createElement("UIPadding", v5.Padding.combine(v5.Padding.Height.Small, v5.Padding.Width.Large)), Loading = react.createElement(Loading, {Enabled = p1.Loading})})
    end
    v14.Loading = v21
    v17 = {}
    local v22 = p1.Loading == nil
    v16 = not v22
    if v16 then
        v16 = not p1.Loading
    end
    v17.Visible = v16
    v16 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v18 = {}
    local Size = p1.Size
    if not Size then
        Size = UDim2.fromScale(0.0923, 0.5)
    end
    v18.CellSize = Size
    local Padding = p1.Padding
    if not Padding then
        Padding = UDim2.fromScale(0.0085, 0.045)
    end
    v18.CellPadding = Padding
    v18.FillDirection = Enum.FillDirection.Horizontal
    v18.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v18.SortOrder = Enum.SortOrder.LayoutOrder
    v16.Grid = react.createElement("UIGridLayout", v18)
    v16.Padding = react.createElement("UIPadding", v5.Padding.combine(v5.Padding.Height[v9], v5.Padding.Width[v8]))
    v14.Grid = react.createElement(Frame, v17, v16, children)
    v12.Container = react.createElement(Frame, v13, v14)
    return createElement("Frame", v11, v12)
end
v3.PageSelector = PaginationPageSelector
return v3