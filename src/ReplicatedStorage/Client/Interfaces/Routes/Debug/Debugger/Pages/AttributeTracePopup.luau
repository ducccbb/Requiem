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
--File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.AttributeTracePopup
--                               Dumped in 0.00616 seconds
--                          Bytecode version 9  |  24 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_3 = Components_5:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local u270 = Color3.fromRGB(28, 176, 255)
local u275 = Color3.fromRGB(21, 21, 21)
local u280 = Color3.fromRGB(27, 27, 27)
local function isStackEntryStillVisible(p1) -- Line: 80
    if p1.active or typeof(p1.cleanedAt) ~= "number" then
        return true
    end
    local v1 = os.time() - p1.cleanedAt
    local v2 = v1 < 10
    return v2
end
local function formatDisplayValue(p1) -- Line: 92
    local v1, v2
    if p1 == nil then
        return "—"
    end
    if typeof(p1) == "boolean" then
        if p1 then
            return "true"
        end
        return "false"
    end
    if typeof(p1) == "number" then
        v1 = math.round(p1 * 1000) / 1000
        v2 = string.format("%.3f", v1)
        v2 = string.gsub(v2, "(%.%d-)0+$", "%1")
        return (string.gsub(v2, "%.$", ""))
    end
    v1 = tonumber(p1)
    if not v1 then
        return (tostring(p1))
    end
    v2 = math.round(v1 * 1000) / 1000
    local v3 = string.format("%.3f", v2)
    v3 = string.gsub(v3, "(%.%d-)0+$", "%1")
    return (string.gsub(v3, "%.$", ""))
end
local function parseDraftNumber(p1) -- Line: 121
    local v1 = string.gsub(p1, "^%s+", "")
    v1 = string.gsub(v1, "%s+$", "")
    if v1 == "" then
        return nil
    end
    return (tonumber(v1))
end
local function StackEntryRow(p1) -- Line: 130 -- upvalues: useRem (val), useTextScale (val), u275 (val), u280 (val), react (val), formatDisplayValue (val), Debugger (val), Text (val)
    local u31, v1, v2, v3, v4, v5, v6, v7
    local v8 = useRem()
    local v9 = useTextScale()
    local Entry = p1.Entry
    local v10 = string.format("%s:%d", Entry.sourceShort, Entry.line)
    local v11 = v8(82)
    local v12 = v8(26)
    local v13 = v8(10)
    if p1.Index % 2 ~= 0 then
        v6 = u280
    else
        v6 = u275
    end
    v7, u31 = react.useState(formatDisplayValue(Entry.value))
    react.useEffect(function() -- Line: 147 -- upvalues: u31 (val), formatDisplayValue (upval), Entry (val)
        u31(formatDisplayValue(Entry.value))
        return function() end
    end, {Entry.value, Entry.resultingValue, Entry.id, Entry.active})
    local u48 = react.useCallback(function(a1) -- Line: 152 -- upvalues: Debugger (upval), p1 (val), Entry (val)
        Debugger.Values.post({attribute = p1.AttributeName, stackEntryId = Entry.id, overrideValue = a1})
    end, {p1.AttributeName, Entry.id})
    local v14 = react.useCallback(function() -- Line: 160 -- upvalues: Debugger (upval), p1 (val), Entry (val)
        Debugger.Values.post({revertDebuggerOverride = true, attribute = p1.AttributeName, stackEntryId = Entry.id})
    end, {p1.AttributeName, Entry.id})
    local active = Entry.active
    if active then
        active = Entry.canRevertDebuggerContribution == true
    end
    local v15 = v8(6)
    local v16 = v8(40)
    if not active then
        v1 = v11
    else
        v1 = v11 + v15 + v16
    end
    local createElement = react.createElement
    local v17 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = v6,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = p1.Index,
    }
    local v18 = {RowCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v8(4))}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v8(10)), PaddingRight = UDim.new(0, v8(10)), PaddingTop = UDim.new(0, v8(4)), PaddingBottom = UDim.new(0, v8(4))})}
    local createElement_2 = react.createElement
    local v19 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v20 = {H = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v13),
    })}
    local createElement_3 = react.createElement
    local v21 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, -(v1 + v13), 0, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v22 = {V = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v8(3)),
    })}
    local v23 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v24 = {InLayout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v8(8)),
    })}
    local v25 = {Bold = true}
    if not Entry.active then
        v4 = "CLEANED"
    elseif not p1.StackFrozen then
        v4 = "ACTIVE"
    else
        v4 = "FROZEN"
    end
    v25.Text = v4
    v4 = {TextTransparency = 0.05, LayoutOrder = 1}
    if not Entry.active then
        v5 = Color3.fromRGB(180, 140, 200)
    elseif not p1.StackFrozen then
        v5 = Color3.fromRGB(80, 220, 120)
    else
        v5 = Color3.fromRGB(140, 210, 255)
    end
    v4.TextColor3 = v5
    v25.Native = v4
    v24.Badge = react.createElement(Text, v25)
    v25 = {Text = v10}
    v4 = {TextTransparency = 0.2, LayoutOrder = 2, TextColor3 = Color3.fromRGB(150, 150, 150), TextTruncate = Enum.TextTruncate.AtEnd}
    local v26 = -v8(62)
    v4.Size = UDim2.new(1, v26, 0, v8(20))
    v25.Native = v4
    v24.Site = react.createElement(Text, v25)
    v22.Meta = react.createElement("Frame", v23, v24)
    v23 = {
        TextTransparency = 0.12,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    local v27 = tostring(Entry.mode)
    v25 = formatDisplayValue(Entry.value)
    v4 = formatDisplayValue(Entry.originalValue)
    v5 = formatDisplayValue(Entry.resultingValue)
    v23.Text = string.format("%s  %s  (%s -> %s)  ·  %s", v27, v25, v4, v5, (tostring(Entry.functionName)))
    v23.TextColor3 = Color3.fromRGB(230, 230, 230)
    v23.TextSize = v9(13)
    v23.TextXAlignment = Enum.TextXAlignment.Left
    v23.TextYAlignment = Enum.TextYAlignment.Top
    v23.Size = UDim2.new(1, 0, 0, 0)
    v23.AutomaticSize = Enum.AutomaticSize.Y
    v22.Detail = react.createElement("TextLabel", v23)
    if Entry.active then
        v2 = nil
    else
        local cleanedSourceShort
        if Entry.cleanedSourceShort then
            v2 = react.createElement(Text, {
                Text = string.format("Cleaned @ %s:%s", Entry.cleanedSourceShort, (tostring(Entry.cleanedLine or 0))),
                Native = {TextTransparency = 0.25, LayoutOrder = 3, TextColor3 = Color3.fromRGB(140, 140, 160)},
            })
        end
    end
    v22.Cleanup = v2
    v20.LeftColumn = createElement_3("Frame", v21, v22)
    v21 = {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromOffset(v1, v12)}
    v22 = {}
    v23 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v15),
    }
    v22.HStrip = react.createElement("UIListLayout", v23)
    v2 = active
    if v2 then
        v23 = {
            Text = "Revert",
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            TextColor3 = Color3.fromRGB(155, 155, 165),
            TextSize = v9(12),
            TextTransparency = 0.12,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.fromOffset(v16, v12),
            LayoutOrder = 1,
        }
        v23[react.Event.Activated] = v14
        v2 = react.createElement("TextButton", v23)
    end
    v22.RevertLink = v2
    v23 = {
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        ShowNativeInput = Entry.active,
        Text = v7,
    }
    if not Entry.active then
        v24 = Color3.fromRGB(130, 130, 140)
    else
        v24 = Color3.fromRGB(235, 235, 240)
    end
    v23.TextColor3 = v24
    v23.TextEditable = Entry.active
    v23.TextSize = v9(13)
    v23.TextTruncate = Enum.TextTruncate.AtEnd
    v23.TextWrapped = false
    v23.TextXAlignment = Enum.TextXAlignment.Right
    v23.TextYAlignment = Enum.TextYAlignment.Center
    v23.Size = UDim2.fromOffset(v11, v12)
    v23.LayoutOrder = 2
    if not Entry.active then
        v3 = nil
    else
        function v3(p1) -- Line: 349 -- upvalues: u31 (val)
            u31(p1.Text)
        end
    end
    v23[react.Change.Text] = v3
    if not Entry.active then
        v3 = nil
    else
        function v3(p1) -- Line: 355 -- upvalues: u48 (val)
            u48(p1.Text)
        end
    end
    v23[react.Event.FocusLost] = v3
    v22.OverrideBox = react.createElement("TextBox", v23, {BoxCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v8(3))}), BoxStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.87, Color = Color3.fromRGB(255, 255, 255), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}), BoxPadding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v8(6)), PaddingRight = UDim.new(0, v8(6)), PaddingTop = UDim.new(0, v8(2)), PaddingBottom = UDim.new(0, v8(2))})})
    v20.ControlsStrip = react.createElement("Frame", v21, v22)
    v18.Row = createElement_2("Frame", v19, v20)
    return createElement("Frame", v17, v18)
end
return react.memo(function(p1) -- Line: 381 -- upvalues: useRem (val), useTextScale (val), useOrder (val), formatDisplayValue (val), react (val), Debugger (val), parseDraftNumber (val), isStackEntryStillVisible (val), StackEntryRow (val), Text (val), Container (val), u270 (val), Checkbox (val), Button (val), ScrollingFrame (val)
    local diminishingConfig, diminishingPreview, u215, u216, u220, u221, u226, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = useTextScale()
    local v8 = useOrder()
    local v9 = v6(418)
    local u15 = if p1.Payload ~= nil then p1.Payload.stackFrozen == true else false
    if not p1.Payload then
        diminishingConfig = nil
    else
        diminishingConfig = p1.Payload.diminishingConfig
    end
    if not p1.Payload then
        diminishingPreview = {}
    elseif p1.Payload.diminishingPreview then
        diminishingPreview = p1.Payload.diminishingPreview
    end
    if diminishingConfig == nil then
        v5 = nil
    elseif 0 < #diminishingPreview then
        local diminished, diminished_2, diminished_3, diminished_4, raw, raw_2, raw_3, raw_4
        local format = string.format
        if not (diminishingPreview[1]) then
            raw = 0.1
        else
            raw = diminishingPreview[1].raw
        end
        local v10 = formatDisplayValue(raw)
        if not (diminishingPreview[1]) then
            diminished = 0.1
        else
            diminished = diminishingPreview[1].diminished
        end
        local v11 = formatDisplayValue(diminished)
        if not (diminishingPreview[2]) then
            raw_2 = 0.25
        else
            raw_2 = diminishingPreview[2].raw
        end
        local v12 = formatDisplayValue(raw_2)
        if not (diminishingPreview[2]) then
            diminished_2 = 0.25
        else
            diminished_2 = diminishingPreview[2].diminished
        end
        v1 = formatDisplayValue(diminished_2)
        if not (diminishingPreview[3]) then
            raw_3 = 0.5
        else
            raw_3 = diminishingPreview[3].raw
        end
        local v13 = formatDisplayValue(raw_3)
        if not (diminishingPreview[3]) then
            diminished_3 = 0.5
        else
            diminished_3 = diminishingPreview[3].diminished
        end
        local v14 = formatDisplayValue(diminished_3)
        if not (diminishingPreview[4]) then
            raw_4 = 1
        else
            raw_4 = diminishingPreview[4].raw
        end
        local v15 = formatDisplayValue(raw_4)
        if not (diminishingPreview[4]) then
            diminished_4 = 1
        else
            diminished_4 = diminishingPreview[4].diminished
        end
        v5 = format("%s->%s | %s->%s | %s->%s | %s->%s", v10, v11, v12, v1, v13, v14, v15, formatDisplayValue(diminished_4))
    end
    u215, u216 = react.useState("")
    u220, u221 = react.useState("")
    v1, u226 = react.useState(false)
    local u230 = react.useRef(true)
    local u256 = react.useCallback(function(a1) -- Line: 414 -- upvalues: Debugger (upval), p1 (val)
        Debugger.Values.post({attribute = p1.AttributeName, freezeMutations = a1})
    end, {p1.AttributeName})
    react.useEffect(function() -- Line: 421 -- upvalues: diminishingConfig (val), u216 (val), u221 (val)
        if diminishingConfig == nil then
            u216("")
            u221("")
            return function() end
        end
        u216(string.format("%.4g", diminishingConfig.cap))
        u221(string.format("%.4g", diminishingConfig.k))
        return function() end
    end, {diminishingConfig})
    local u287 = react.useCallback(function() -- Line: 432 -- upvalues: parseDraftNumber (upval), u215 (val), Debugger (upval), p1 (val)
        local v1 = parseDraftNumber(u215)
        if v1 == nil then
            return
        end
        Debugger.Values.post({attribute = p1.AttributeName, setDiminishingCap = v1})
    end, {p1.AttributeName, u215})
    local u294 = react.useCallback(function() -- Line: 443 -- upvalues: parseDraftNumber (upval), u220 (val), Debugger (upval), p1 (val)
        local v1 = parseDraftNumber(u220)
        if v1 == nil then
            return
        end
        Debugger.Values.post({attribute = p1.AttributeName, setDiminishingK = v1})
    end, {p1.AttributeName, u220})
    local v16 = react.useCallback(function(p1) -- Line: 454 -- upvalues: u230 (val), u226 (val)
        if u230.current then
            u230.current = false
            return
        end
        u226(p1)
    end, {})
    local v17 = {}
    local stack = {}
    if p1.Payload and p1.Payload.stack then
        stack = p1.Payload.stack
    end
    local v18 = {}
    local v19 = stack
    local v20 = nil
    local v21 = nil
    for i, j in v19, v20, v21 do
        if isStackEntryStillVisible(j) then
            table.insert(v18, j)
        end
    end
    v19 = #v18
    v20 = 0
    v21 = v18
    local v22 = nil
    local v23 = nil
    for k, n in v21, v22, v23 do
        if n.active then
            v20 = v20 + 1
        end
    end
    v21 = v18
    v22 = nil
    v23 = nil
    for m, i5 in v21, v22, v23 do
        v2 = tostring(i5.id)
        v17[v2] = react.createElement(StackEntryRow, {Entry = i5, Index = m, AttributeName = p1.AttributeName, StackFrozen = u15})
    end
    v21 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(4))}), Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v6(4)), PaddingRight = UDim.new(0, v6(4)), PaddingTop = UDim.new(0, v6(4)), PaddingBottom = UDim.new(0, v6(4))})}
    local v24 = {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v6(2))}
    v21.List = react.createElement("UIListLayout", v24)
    if 0 >= #v18 then
        v21.Empty = react.createElement(Text, {
            Text = "No recorded mutations on the server for this attribute.",
            Native = {TextTransparency = 0.35, LayoutOrder = 1, TextColor3 = Color3.fromRGB(150, 150, 150)},
        })
    else
        v22 = v17
        v23 = nil
        v24 = nil
        for i6, i7 in v22, v23, v24 do
            v21[i6] = i7
        end
    end
    local createElement = react.createElement
    v24 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.52, 0.14),
        Native = {Visible = p1.Visible},
    }
    local v25 = {}
    local createElement_2 = react.createElement
    local v26 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(v9, 0), AutomaticSize = Enum.AutomaticSize.Y}
    local v27 = {V = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(12)),
    }), Title = react.createElement(Text, {
        Bold = true,
        Text = p1.AttributeName,
        Native = {
            TextTransparency = 0.08,
            TextColor3 = u270,
            Size = UDim2.new(1, 0, 0, v6(26)),
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = v8(),
        },
    })}
    local v28 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v6(20)), LayoutOrder = v8()}
    local v29 = {H = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v6(6))})}
    local v30 = {Text = "Server stack", Bold = true}
    local v31 = {TextTransparency = 0.28, LayoutOrder = 1, TextColor3 = Color3.fromRGB(175, 175, 175)}
    v30.Native = v31
    v29.SubtitleBold = react.createElement(Text, v30)
    v30 = {}
    if not p1.Payload then
        v31 = "waiting for server..."
    else
        v31 = string.format("%d entries · %d active", v19, v20)
    end
    v30.Text = v31
    v30.Native = {TextTransparency = 0.42, LayoutOrder = 2, TextColor3 = Color3.fromRGB(150, 150, 150)}
    v29.SubtitleRest = react.createElement(Text, v30)
    v27.SubtitleRow = react.createElement("Frame", v28, v29)
    v28 = {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(28, 36, 52),
        Size = UDim2.new(1, 0, 0, v6(34)),
        LayoutOrder = v8(),
    }
    v29 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(4))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.6, Color = u270, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v6(10)), PaddingRight = UDim.new(0, v6(10))})}
    v30 = {Text = "Effective", Bold = true}
    v31 = {
        TextTransparency = 0.04,
        LayoutOrder = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        TextColor3 = Color3.fromRGB(170, 195, 230),
    }
    v30.Native = v31
    v29.Label = react.createElement(Text, v30)
    v30 = {Bold = true}
    if not p1.Payload then
        v31 = "..."
    else
        v31 = formatDisplayValue(p1.Payload.diminishedValue)
    end
    v30.Text = v31
    v30.Native = {
        TextTransparency = 0.02,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        TextColor3 = u270,
        TextXAlignment = Enum.TextXAlignment.Right,
    }
    v29.Value = react.createElement(Text, v30)
    v27.EffectiveHero = react.createElement("Frame", v28, v29)
    v27.ValuesSectionLabel = react.createElement(Text, {
        Text = "Values",
        Bold = true,
        Native = {TextTransparency = 0.12, LayoutOrder = v8()},
    })
    v28 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = v8()}
    v29 = {V = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, v6(3)), SortOrder = Enum.SortOrder.LayoutOrder}), ClientHeader = react.createElement(Text, {
        Text = "Client",
        Bold = true,
        Native = {TextTransparency = 0.18, LayoutOrder = 1, TextColor3 = Color3.fromRGB(210, 210, 210)},
    }), ClientValue = react.createElement(Text, {
        Text = formatDisplayValue(p1.ClientValue),
        Native = {TextTransparency = 0.12, LayoutOrder = 2},
    })}
    v30 = {Text = "Server", Bold = true}
    v31 = {TextTransparency = 0.18, LayoutOrder = 3, TextColor3 = Color3.fromRGB(210, 210, 210)}
    v30.Native = v31
    v29.ServerGroupHeader = react.createElement(Text, v30)
    v30 = {}
    if not p1.Payload then
        v31 = "Raw ...  ->  Effective ..."
    else
        v4 = formatDisplayValue(p1.Payload.value)
        v31 = string.format("Raw %s  ->  Effective %s", v4, formatDisplayValue(p1.Payload.diminishedValue))
    end
    v30.Text = v31
    v30.Native = {TextTransparency = 0.12, LayoutOrder = 4}
    v29.ServerValuesCompact = react.createElement(Text, v30)
    v27.ValuesBlock = react.createElement("Frame", v28, v29)
    v28 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v6(20)), LayoutOrder = v8()}
    v29 = {H = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v6(8))})}
    v30 = {Upscale = 0.9, Default = v1, Toggled = v16}
    v31 = {LayoutOrder = 1}
    v4 = v6(22)
    v31.Size = UDim2.fromOffset(v4, v6(14))
    v30.Native = v31
    v29.Toggle = react.createElement(Checkbox, v30)
    v30 = {Text = "Show Diminishing Tuning"}
    v31 = {TextTransparency = 0.12, LayoutOrder = 2, TextColor3 = Color3.fromRGB(170, 170, 170)}
    v30.Native = v31
    v29.Label = react.createElement(Text, v30)
    v27.DiminishToggle = react.createElement("Frame", v28, v29)
    if not v1 then
        v3 = nil
    else
        v3 = react.createElement(Text, {
            Text = "Diminishing Tuning",
            Bold = true,
            Native = {TextTransparency = 0.18, LayoutOrder = v8()},
        })
    end
    v27.DiminishLabel = v3
    if not v1 then
        v3 = nil
    else
        v28 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v6(26)), LayoutOrder = v8()}
        v29 = {H = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v6(8))})}
        v30 = {Text = "cap", Bold = true}
        v31 = {LayoutOrder = 1, TextColor3 = Color3.fromRGB(170, 170, 170)}
        v30.Native = v31
        v29.CapLabel = react.createElement(Text, v30)
        v30 = {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            BorderSizePixel = 0,
            ClearTextOnFocus = false,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = u215,
            TextColor3 = Color3.fromRGB(230, 230, 235),
        }
        v31 = diminishingConfig ~= nil
        v30.TextEditable = v31
        v30.TextSize = v7(13)
        v30.TextXAlignment = Enum.TextXAlignment.Right
        local v32 = v6(62)
        v30.Size = UDim2.fromOffset(v32, v6(24))
        v30.LayoutOrder = 2
        v30[react.Change.Text] = function(p1) -- Line: 773 -- upvalues: u216 (val)
            u216(p1.Text)
        end
        v30[react.Event.FocusLost] = function() -- Line: 776 -- upvalues: u287 (val)
            u287()
        end
        v29.CapInput = react.createElement("TextBox", v30, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(3))}), BoxStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.87, Color = Color3.fromRGB(255, 255, 255), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})})
        v30 = {Text = "k", Bold = true}
        v31 = {LayoutOrder = 3, TextColor3 = Color3.fromRGB(170, 170, 170)}
        v30.Native = v31
        v29.KLabel = react.createElement(Text, v30)
        v30 = {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            BorderSizePixel = 0,
            ClearTextOnFocus = false,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = u220,
            TextColor3 = Color3.fromRGB(230, 230, 235),
        }
        v31 = diminishingConfig ~= nil
        v30.TextEditable = v31
        v30.TextSize = v7(13)
        v30.TextXAlignment = Enum.TextXAlignment.Right
        v32 = v6(62)
        v30.Size = UDim2.fromOffset(v32, v6(24))
        v30.LayoutOrder = 4
        v30[react.Change.Text] = function(p1) -- Line: 812 -- upvalues: u221 (val)
            u221(p1.Text)
        end
        v30[react.Event.FocusLost] = function() -- Line: 815 -- upvalues: u294 (val)
            u294()
        end
        v29.KInput = react.createElement("TextBox", v30, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(3))}), BoxStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.87, Color = Color3.fromRGB(255, 255, 255), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})})
        v3 = react.createElement("Frame", v28, v29)
    end
    v27.DiminishControls = v3
    if not v1 then
        v3 = nil
    else
        v3 = react.createElement(Text, {
            Text = "cap = max effective.  higher k = slower approach.",
            Native = {TextTransparency = 0.16, TextColor3 = Color3.fromRGB(145, 145, 155), LayoutOrder = v8()},
        })
    end
    v27.DiminishHelp = v3
    if not v1 then
        v3 = nil
    else
        v28 = {}
        if diminishingConfig ~= nil then
            v29 = v5 or "..."
        else
            v29 = "No diminishing config for this attribute."
        end
        v28.Text = v29
        v28.Native = {
            TextTransparency = 0.1,
            TextWrapped = true,
            TextColor3 = Color3.fromRGB(150, 150, 165),
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = v8(),
        }
        v3 = react.createElement(Text, v28)
    end
    v27.DiminishPreviewLine = v3
    v27.StackLabel = react.createElement(Text, {
        Text = "Mutation trace",
        Bold = true,
        Native = {TextTransparency = 0.18, LayoutOrder = v8()},
    })
    v28 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v6(26)), LayoutOrder = v8()}
    v29 = {}
    v30 = {Padding = "Small"}
    if not u15 then
        v31 = "Freeze"
    else
        v31 = "Unfreeze"
    end
    v30.Text = v31
    v30.Color = Color3.fromRGB(255, 255, 255)
    v30.TextColor = Color3.fromRGB(0, 0, 0)
    v31 = p1.Payload == nil
    v30.Disabled = v31
    function v30.Clicked() -- Line: 875 -- upvalues: u256 (val), u15 (val)
        u256(not u15)
    end
    v30.Native = {Size = UDim2.fromScale(1, 1)}
    v29.FreezeButton = react.createElement(Button, v30)
    v27.StackFreeze = react.createElement("Frame", v28, v29)
    v27.StackScroll = react.createElement(ScrollingFrame, {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(22, 24, 28),
        ScrollBarThickness = v7(4),
        Size = UDim2.new(1, 0, 0, v6(280)),
        LayoutOrder = v8(),
    }, v21)
    v25.Content = createElement_2("Frame", v26, v27)
    return createElement(Container, v24, v25)
end)