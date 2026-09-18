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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Sacraments
--                               Dumped in 0.00273 seconds
--                          Bytecode version 9  |  10 functions

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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Sacraments = require(Namespaces_2:WaitForChild("Sacraments"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Sacraments_2 = require(Types:WaitForChild("Sacraments"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Charts = Universal_2:WaitForChild("Charts")
local Radar = require(Charts:WaitForChild("Radar"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_2 = Components_5:WaitForChild("Editor")
local Universal_3 = Editor_2:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_6:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_8:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_9:WaitForChild("Hooks")
local useTextScale = require(Hooks_6:WaitForChild("useTextScale"))
local u357 = {
    "Strength",
    "Dexterity",
    "Celerity",
    "Resilience",
    "Precision",
}
local function makeDefaultStore() -- Line: 54 -- upvalues: u357 (val)
    local v1 = {}
    local v2 = {}
    local v3 = u357
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1[j] = 0
        v2[j] = 8
    end
    return {points = 0, locked = 0, sacraments = v1, maximum = v2}
end
local function SacramentRow(p1) -- Line: 70 -- upvalues: useRem (val), useDebuggerTheme (val), Sacraments_2 (val), react (val), Text (val), Button (val), Debugger (val)
    local a
    local v1 = useRem()
    local v2 = useDebuggerTheme()
    local v3 = {BackgroundTransparency = 0.08, BorderSizePixel = 0}
    if p1.Index % 2 ~= 0 then
        a = v2.rows.b
    else
        a = v2.rows.a
    end
    v3.BackgroundColor3 = a
    v3.Size = UDim2.new(1, 0, 0, v1(92))
    v3.LayoutOrder = p1.Index
    local v4 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(6))}), Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v1(10)), PaddingRight = UDim.new(0, v1(10)), PaddingTop = UDim.new(0, v1(10)), PaddingBottom = UDim.new(0, v1(10))})}
    local v5 = {Bold = true, Text = string.format("%s %d / %d", p1.Name, p1.Value, p1.Maximum)}
    local v6 = {AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, 0)}
    local v7 = -v1(130)
    v6.Size = UDim2.new(1, v7, 0, v1(22))
    v6.TextColor3 = v2.accents.attributeBlue
    v6.TextXAlignment = Enum.TextXAlignment.Left
    v6.TextTruncate = Enum.TextTruncate.AtEnd
    v5.Native = v6
    v4.Name = react.createElement(Text, v5)
    v5 = {Text = Sacraments_2.Descriptions[p1.Name] or "No description available."}
    v6 = {TextTransparency = 0.14, TextWrapped = true, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, v1(24))}
    v7 = -v1(130)
    v6.Size = UDim2.new(1, v7, 0, v1(46))
    v6.TextColor3 = v2.text.body
    v6.TextXAlignment = Enum.TextXAlignment.Left
    v6.TextYAlignment = Enum.TextYAlignment.Top
    v5.Native = v6
    v4.Description = react.createElement(Text, v5)
    v5 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5)}
    local v8 = -v1(8)
    v5.Position = UDim2.new(1, v8, 0.5, 0)
    local v9 = v1(112)
    v5.Size = UDim2.fromOffset(v9, v1(26))
    v4.Buttons = react.createElement("Frame", v5, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(8)),
    }), AddPoint = react.createElement(Button, {
        Text = "Add",
        Type = 1,
        Padding = "Medium",
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Height = v1(22),
        Native = {LayoutOrder = 1},
        Clicked = function() -- Line: 150 -- upvalues: Debugger (upval), p1 (val)
            Debugger.Sacraments.post({action = "add", sacrament = p1.Name})
        end,
    })})
    return react.createElement("Frame", v3, v4)
end
return react.memo(function() -- Line: 161 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), useStore (val), Sacraments (val), makeDefaultStore (val), react (val), u357 (val), Sacraments_2 (val), SacramentRow (val), Container (val), Text (val), Radar (val), ScrollingFrame (val), Button (val), Debugger (val)
    local v1 = useRem()
    local v2 = useTextScale()
    local v3 = useDebuggerTheme()
    local v4 = useOrder()
    local v5 = useDebuggerPages().Sacraments == true
    local u17 = useStore(Sacraments.Store, function(p1) -- Line: 169 -- upvalues: makeDefaultStore (upval)
        local v1 = p1
        if not v1 then
            v1 = makeDefaultStore()
        end
        return v1
    end)
    local v6 = react.useMemo(function() -- Line: 174 -- upvalues: u357 (upval), u17 (val)
        local v1 = 0
        local v2 = u357
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1 = v1 + (u17.sacraments[j] or 0)
        end
        return v1
    end, {u17})
    local v7 = react.useMemo(function() -- Line: 182 -- upvalues: u357 (upval), u17 (val)
        local v1
        local v2 = 8
        local v3 = u357
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v1 = u17.maximum[j] or 8
            if v2 < v1 then
                v2 = v1
            end
        end
        return v2
    end, {u17})
    local v8 = react.useMemo(function() -- Line: 193 -- upvalues: u357 (upval), Sacraments_2 (upval), u17 (val)
        local v1 = {}
        local v2 = u357
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, {
                tooltip = {j, Sacraments_2.Descriptions[j] or "No description available."},
                value = (u17.sacraments[j] or 0) + 1,
                color = Color3.fromRGB(255, 255, 255),
            })
        end
        return v1
    end, {u17})
    local v9 = {}
    local v10 = u357
    local v11 = nil
    local v12 = nil
    for i, j in v10, v11, v12 do
        v9[j] = react.createElement(SacramentRow, {Name = j, Index = i, Value = u17.sacraments[j] or 0, Maximum = u17.maximum[j] or 8})
    end
    v12 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = v5},
    }
    local v13 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(12)),
    }), Summary = react.createElement(Text, {
        Text = string.format("Unspent points: %d. Allocated: %d", u17.points or 0, v6),
        Native = {TextTransparency = 0.4, TextColor3 = v3.text.muted, LayoutOrder = v4()},
    })}
    local v14 = {BackgroundTransparency = 1}
    local v15 = v1(496)
    v14.Size = UDim2.fromOffset(v15, v1(245))
    v14.LayoutOrder = v4()
    v13.RadarPanel = react.createElement("Frame", v14, {Card = react.createElement("Frame", {BackgroundTransparency = 0.12, BorderSizePixel = 0, BackgroundColor3 = v3.chrome.panelSurface, Size = UDim2.fromScale(1, 1)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(8))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v3.chrome.panelStroke}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v1(12)), PaddingRight = UDim.new(0, v1(12)), PaddingTop = UDim.new(0, v1(12)), PaddingBottom = UDim.new(0, v1(12))}), RadarHolder = react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1)}, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1}), Radar = react.createElement(Radar, {Visible = v5, Maximum = v7 + 1, Data = v8})})})})
    v14 = {BackgroundTransparency = 1}
    v15 = v1(496)
    v14.Size = UDim2.fromOffset(v15, v1(280))
    v14.LayoutOrder = v4()
    local v16 = {}
    local v17 = {BackgroundTransparency = 0.12, BorderSizePixel = 0, BackgroundColor3 = v3.chrome.panelSurface, Size = UDim2.fromScale(1, 1)}
    local v18 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(8))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v3.chrome.panelStroke})}
    local v19 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    local v20 = v1(8)
    v19.Position = UDim2.new(0, v20, 0, v1(8))
    v19.ScrollBarThickness = v2(5)
    v19.ScrollBarImageColor3 = v3.chrome.scrollThumb
    v20 = -v1(16)
    v19.Size = UDim2.new(1, v20, 1, -v1(16))
    v18.Scroll = react.createElement(ScrollingFrame, v19, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, v1(4))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(8)),
    })}, v9)})
    v16.Card = react.createElement("Frame", v17, v18)
    v13.ListPanel = react.createElement("Frame", v14, v16)
    v14 = {BackgroundTransparency = 1}
    v15 = v1(496)
    v14.Size = UDim2.fromOffset(v15, v1(28))
    v14.LayoutOrder = v4()
    v13.ButtonsRow = react.createElement("Frame", v14, {Reset = react.createElement(Button, {
        Text = "Reset",
        Type = 1,
        Padding = "Medium",
        Color = Color3.fromRGB(214, 74, 74),
        TextColor = Color3.fromRGB(255, 255, 255),
        Height = v1(24),
        Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0)},
        Clicked = function() -- Line: 349 -- upvalues: Debugger (upval)
            Debugger.Sacraments.post({action = "reset"})
        end,
    })})
    return react.createElement(Container, v12, v13)
end)