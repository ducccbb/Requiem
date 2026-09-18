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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Values
--                               Dumped in 0.00274 seconds
--                          Bytecode version 9  |  22 functions

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
local Progression = Common:WaitForChild("Progression")
local Attributes = require(Progression:WaitForChild("Attributes"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Progression_2 = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression_2:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Search = require(Universal_3:WaitForChild("Search"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local AttributeTracePopup = require(v1.Parent:WaitForChild("AttributeTracePopup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_6:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_8:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local u343 = (function() -- Line: 43 -- upvalues: Attributes (val)
    local v1 = {}
    for k, v in pairs(Attributes) do
        if typeof(v) == "table" then
            for k2 in pairs(v) do
                if typeof(k2) == "string" then
                    table.insert(v1, k2)
                end
            end
        end
    end
    table.sort(v1)
    return v1
end)()
local function formatAttributeValue(p1) -- Line: 67
    if p1 == nil then
        return "—"
    end
    if typeof(p1) == "boolean" then
        if p1 then
            return "true"
        end
        return "false"
    end
    if typeof(p1) ~= "number" then
        return (tostring(p1))
    end
    local v1 = math.round(p1 * 10000) / 10000
    local v2 = math.abs(v1 - math.round(v1))
    if v2 < 1e-06 then
        return (tostring((math.round(v1))))
    end
    return string.format("%.4g", v1)
end
local function AttributeRow(p1) -- Line: 87 -- upvalues: useRem (val), useDebuggerTheme (val), react (val), Text (val), Checkbox (val)
    local a
    local v1 = useRem()
    local v2 = useDebuggerTheme()
    local v3 = v1(112)
    local v4 = v1(24)
    local v5 = v1(6)
    local u17 = react.useRef(true)
    local AttributeName = p1.AttributeName
    local WatchChanged = p1.WatchChanged
    local v6 = react.useCallback(function(p1) -- Line: 104 -- upvalues: u17 (val), WatchChanged (val), AttributeName (val)
        if u17.current then
            u17.current = false
            return
        end
        WatchChanged(AttributeName, p1)
    end, {AttributeName, WatchChanged})
    local v7 = {BackgroundTransparency = 0.08, BorderSizePixel = 0}
    if p1.Index % 2 ~= 0 then
        a = v2.rows.b
    else
        a = v2.rows.a
    end
    v7.BackgroundColor3 = a
    v7.Size = UDim2.new(1, 0, 0, v1(26))
    v7.LayoutOrder = p1.Index
    return react.createElement("Frame", v7, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v1(8)), PaddingRight = UDim.new(0, v1(10))}), NameLabel = react.createElement(Text, {
        Bold = true,
        Text = p1.AttributeName,
        Native = {
            TextTransparency = 0.1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 0, 0.5, 0),
            TextColor3 = v2.accents.attributeBlue,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Size = UDim2.new(1, -(v3 + v4 + v5 * 2), 1, 0),
            AutomaticSize = Enum.AutomaticSize.None,
        },
    }), ValueLabel = react.createElement(Text, {
        Text = p1.ValueText,
        Native = {
            TextTransparency = 0.15,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -(v4 + v5), 0.5, 0),
            TextColor3 = v2.text.body,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Size = UDim2.fromOffset(v3, v1(22)),
            AutomaticSize = Enum.AutomaticSize.None,
        },
    }), CheckboxSlot = react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(v4, v4)}, {Checkbox = react.createElement(Checkbox, {
        Upscale = 0.95,
        Default = p1.Watched,
        Toggled = v6,
        Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(v4, v1(14)), AutomaticSize = Enum.AutomaticSize.None},
    })})})
end
return react.memo(function() -- Line: 176 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), react (val), Debugger (val), ClientAttributesHandler (val), u343 (val), AttributeRow (val), formatAttributeValue (val), Container (val), Search (val), Text (val), ScrollingFrame (val), AttributeTracePopup (val)
    local u13, u19, u24, u29, u34, u361, u362, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = useTextScale()
    local v8 = useDebuggerTheme()
    local v9 = useOrder()
    local u360 = useDebuggerPages()
    u13, u361 = react.useState("")
    _, u19 = react.useState(0)
    u362, u24 = react.useState({})
    v1, u29 = react.useState({})
    v2, u34 = react.useState(nil)
    react.useEffect(function() -- Line: 189 -- upvalues: Debugger (upval), u29 (val)
        return (Debugger.Values.listen(function(p1) -- Line: 190 -- upvalues: u29 (upval)
    local v1
    if typeof(p1) ~= "table" then
        return
    elseif typeof(p1.attribute) == "string" then
        u29(function(a1) -- Line: 195 -- upvalues: p1 (val)
            local v1
            v1 = table.clone(a1)
            v1[p1.attribute] = p1
            return v1
        end)
        return
    else
        return
    end
end))
    end, {})
    react.useEffect(function() -- Line: 205 -- upvalues: u360 (val), u362 (val), Debugger (upval), u24 (val), u29 (val), u34 (val)
        if u360.Values then
            return
        end
        for k in pairs(u362) do
            Debugger.Values.post({watch = false, attribute = k})
        end
        if next(u362) ~= nil then
            u24({})
            u29({})
        end
        u34(function(p1) -- Line: 221
            return nil
        end)
    end, {u360.Values, u362})
    local v10 = react.useCallback(function(p1, p2) -- Line: 226 -- upvalues: Debugger (upval), u24 (val), u34 (val), u29 (val)
        Debugger.Values.post({attribute = p1, watch = p2})
        u24(function(a1) -- Line: 232 -- upvalues: p2 (val), p1 (val)
            local v1 = table.clone(a1)
            if p2 then
                v1[p1] = true
                return v1
            end
            v1[p1] = nil
            return v1
        end)
        if p2 then
            u34(function(a1) -- Line: 243 -- upvalues: p1 (val)
                return p1
            end)
            return
        end
        u34(function(a1) -- Line: 247 -- upvalues: p1 (val)
            if a1 == p1 then
                return nil
            end
            return a1
        end)
        u29(function(a1) -- Line: 250 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            v1[p1] = nil
            return v1
        end)
    end, {})
    react.useEffect(function() -- Line: 258 -- upvalues: ClientAttributesHandler (upval), u19 (val)
        local u5 = ClientAttributesHandler.Changed:Connect(function() -- Line: 259 -- upvalues: u19 (upval)
            u19(function(p1) -- Line: 260
                return p1 + 1
            end)
        end)
        return function() -- Line: 265 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v11 = react.useMemo(function() -- Line: 270 -- upvalues: u13 (val), u343 (upval)
        local v1
        local v2 = string.lower(u13)
        if v2 == "" then
            return u343
        end
        local v3 = {}
        local v4 = u343
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v1 = string.lower(j)
            if string.find(v1, v2, 1, true) ~= nil then
                table.insert(v3, j)
            end
        end
        return v3
    end, {u13})
    local v12 = {}
    local v13 = v11
    local v14 = nil
    local v15 = nil
    for i, j in v13, v14, v15 do
        v3 = ClientAttributesHandler.getAttribute(j)
        v4 = {AttributeName = j, ValueText = formatAttributeValue(v3), Index = i}
        v5 = u362[j] == true
        v4.Watched = v5
        v4.WatchChanged = v10
        v12[j] = react.createElement(AttributeRow, v4)
    end
    if not v2 then
        v13 = nil
    else
        v13 = v1[v2]
    end
    if not v2 then
        v14 = "—"
    else
        v14 = formatAttributeValue(ClientAttributesHandler.getAttribute(v2))
    end
    v3 = {}
    v4 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.08, 0.18)}
    v5 = {}
    local v16 = u360.Values == true
    v5.Visible = v16
    v4.Native = v5
    v5 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(12)),
    }), SearchBox = react.createElement(Search, {
        PlaceholderText = "Filter Attributes...",
        WidthPx = v6(520),
        HeightPx = v6(30),
        LayoutOrder = v9(),
        OnQueryChange = function(p1) -- Line: 323 -- upvalues: u361 (val)
            u361(p1)
        end,
    }), CountLine = react.createElement(Text, {
        Text = string.format("Showing %d of %d", #v11, #u343),
        Native = {TextTransparency = 0.45, TextColor3 = v8.text.muted, LayoutOrder = v9()},
    })}
    local v17 = {BackgroundTransparency = 0.12, BorderSizePixel = 0, BackgroundColor3 = v8.chrome.panelSurface}
    local v18 = v6(540)
    v17.Size = UDim2.fromOffset(v18, v6(280))
    v17.LayoutOrder = v9()
    local v19 = {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v8.chrome.panelStroke})}
    local v20 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    local v21 = v6(8)
    v20.Position = UDim2.new(0, v21, 0, v6(8))
    v20.ScrollBarThickness = v7(5)
    v20.ScrollBarImageColor3 = v8.chrome.scrollThumb
    v21 = -v6(16)
    v20.Size = UDim2.new(1, v21, 1, -v6(16))
    v19.Scroll = react.createElement(ScrollingFrame, v20, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v7(6))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
    })}, v12)})
    v5.ScrollChrome = react.createElement("Frame", v17, v19)
    v3.Main = react.createElement(Container, v4, v5)
    v4 = {}
    v5 = if u360.Values == true then v2 ~= nil else false
    v4.Visible = v5
    v4.AttributeName = v2 or ""
    v4.ClientValue = v14
    v4.Payload = v13
    v3.TracePopup = react.createElement(AttributeTracePopup, v4)
    return react.createElement(react.Fragment, {}, v3)
end)