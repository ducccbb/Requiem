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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Tests
--                               Dumped in 0.00627 seconds
--                          Bytecode version 9  |  35 functions

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
local Cache = require(Common:WaitForChild("Cache"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
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
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Dropdown = require(Universal_3:WaitForChild("Dropdown"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_6:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Editor_5 = Components_7:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Textbox = require(Universal_5:WaitForChild("Textbox"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_10:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local u384 = {
    Character = true,
    Dummy = true,
    Items = true,
    Titans = true,
    Damage = true,
    Proficiencies = true,
}
local function resolveCachedClientModule(p1) -- Line: 78 -- upvalues: Cache (val)
    local Tests = Cache:WaitForChild("Tests", 5)
    if Tests == nil or not (Tests:IsA("Folder")) then
        return nil
    end
    local v1 = Tests:WaitForChild(p1, 5)
    if v1 == nil or not (v1:IsA("ModuleScript")) then
        return nil
    end
    return v1
end
local function runCachedClientTest(p1, p2) -- Line: 99 -- upvalues: resolveCachedClientModule (val)
    local v1, v2, v3, v4
    local v5 = resolveCachedClientModule(p1)
    if v5 == nil then
        warn((("[Tests] No cached client module found for '%*'."):format(p1)))
        return
    end
    v1, v2 = pcall(require, v5)
    if not v1 then
        warn((("[Tests] Failed to require cached client module '%*': %*"):format(p1, v2)))
        return
    end
    if typeof(v2) ~= "table" then
        return
    end
    local onExecuteTest = v2.onExecuteTest
    if typeof(onExecuteTest) ~= "function" then
        warn((("[Tests] Cached client module '%*' has no onExecuteTest handler."):format(p1)))
        return
    end
    v3, v4 = pcall(onExecuteTest, table.unpack(p2))
    if not v3 then
        warn((("[Tests] Client test '%*' raised an error: %*"):format(p1, v4)))
    end
end
local function prettifyName(p1) -- Line: 136
    if p1 == "" then
        return p1
    end
    local v1 = string.gsub(p1, "(%l)(%u)", "%1 %2")
    v1 = string.gsub(v1, "[_%-]+", " ")
    v1 = string.gsub(v1, "%s+", " ")
    return (string.gsub(v1, "(%a)(%w*)", function(...) -- Line: 148
    local v2, v1
    v2, v1 = ...
    return string.upper(v2) .. v1
end))
end
local function sortedOptionKeys(p1) -- Line: 161
    local v1 = {}
    for k in pairs(p1) do
        table.insert(v1, k)
    end
    table.sort(v1)
    return v1
end
local function sortedTestNames(p1) -- Line: 175
    local v1 = {}
    for k in pairs(p1) do
        table.insert(v1, k)
    end
    table.sort(v1)
    return v1
end
local function isOptionVisible(p1, p2) -- Line: 194
    local v1, v2, v3, v4, v5
    local visibleWhen = p1.visibleWhen
    if visibleWhen == nil then
        return true
    end
    local v6 = p2
    for k, v in pairs(visibleWhen) do
        v4 = v6[k]
        if typeof(v) == "table" then
            v5 = false
            v1 = v
            v2 = nil
            v3 = nil
            for i, j in v1, v2, v3 do
                if j == v4 then
                    v5 = true
                    break
                end
            end
            if not v5 then
                return false
            end
        elseif v ~= v4 then
            return false
        end
    end
    return true
end
local function clampNumber(p1, p2) -- Line: 230
    local min = p1
    if typeof(p2.min) == "number" and min < p2.min then
        min = p2.min
    end
    if typeof(p2.max) == "number" and p2.max < min then
        min = p2.max
    end
    return min
end
local function defaultValueFor(p1) -- Line: 247
    if p1.default ~= nil then
        return p1.default
    end
    local type = p1.type
    if type == "number" then
        if typeof(p1.min) == "number" then
            return p1.min
        end
        return 0
    end
    if type == "boolean" then
        return false
    end
    if type == "string" or type ~= "dropdown" or typeof(p1.options) ~= "table" then
        return ""
    end
    if p1.options[1] ~= nil then
        return p1.options[1]
    end
    return ""
end
local function buildDefaultValues(p1) -- Line: 274 -- upvalues: defaultValueFor (val)
    local v1 = {}
    for k, v in pairs(p1.options) do
        v1[k] = defaultValueFor(v)
    end
    return v1
end
local function formatNumberForDisplay(p1) -- Line: 287
    local v1 = math.abs(p1 - math.round(p1))
    if v1 < 1e-09 then
        return (tostring((math.round(p1))))
    end
    return string.format("%.4g", p1)
end
local function NumberField(p1) -- Line: 298 -- upvalues: formatNumberForDisplay (val), react (val), Textbox (val), clampNumber (val)
    local v1 = formatNumberForDisplay(p1.Value)
    return react.createElement(Textbox, {
        ClearOnFocus = false,
        Width = p1.Width,
        Default = v1,
        PlaceholderText = v1,
        Update = function(a1) -- Line: 312 -- upvalues: p1 (val), clampNumber (upval)
            local v1 = tonumber(a1)
            if v1 == nil then
                return
            end
            p1.OnChange(p1.OptionKey, clampNumber(v1, p1.Option))
        end,
    })
end
local function StringField(p1) -- Line: 322 -- upvalues: react (val), Textbox (val)
    return react.createElement(Textbox, {
        ClearOnFocus = false,
        Width = p1.Width,
        Default = p1.Value,
        Update = function(a1) -- Line: 332 -- upvalues: p1 (val)
            p1.OnChange(p1.OptionKey, a1)
        end,
    })
end
local function BooleanField(p1) -- Line: 338 -- upvalues: react (val), Checkbox (val)
    return react.createElement(Checkbox, {
        Upscale = 1.25,
        Default = p1.Value,
        Toggled = function(a1) -- Line: 346 -- upvalues: p1 (val)
            p1.OnChange(p1.OptionKey, a1)
        end,
    })
end
local function OptionDropdownField(p1) -- Line: 352 -- upvalues: react (val), Dropdown (val)
    local options = p1.Option.options
    if not options then
        options = {}
    end
    return react.createElement(Dropdown, {
        Options = options,
        Default = p1.Value,
        Changed = function(a1) -- Line: 364 -- upvalues: p1 (val)
            p1.OnChange(p1.OptionKey, a1)
        end,
        Width = p1.Width,
        Native = {ZIndex = p1.ZIndex},
    })
end
local function buildHintText(p1) -- Line: 382 -- upvalues: formatNumberForDisplay (val)
    local v1
    local type = p1.type
    if type ~= "number" then
        if type == "dropdown" then
            if typeof(p1.options) ~= "table" then
                return type
            end
            local v2 = #p1.options
            if v2 ~= 1 then
                v1 = "s"
            else
                v1 = ""
            end
            return string.format("dropdown, %d choice%s", v2, v1)
        end
        return type
    end
    local min = p1.min
    local max = p1.max
    if typeof(min) ~= "number" then
        if typeof(min) == "number" then
            return string.format("number, min %s", formatNumberForDisplay(min))
        end
        if typeof(max) == "number" then
            return string.format("number, max %s", formatNumberForDisplay(max))
        end
        return "number"
    end
    if typeof(max) == "number" then
        v1 = formatNumberForDisplay(min)
        return string.format("number, %s – %s", v1, formatNumberForDisplay(max))
    end
    if typeof(min) == "number" then
        return string.format("number, min %s", formatNumberForDisplay(min))
    end
    if typeof(max) == "number" then
        return string.format("number, max %s", formatNumberForDisplay(max))
    end
    return "number"
end
local function PropertyRow(p1) -- Line: 408 -- upvalues: useRem (val), useDebuggerTheme (val), buildHintText (val), react (val), NumberField (val), BooleanField (val), OptionDropdownField (val), StringField (val), Text (val), prettifyName (val)
    local Value, a, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useDebuggerTheme()
    if p1.Index % 2 ~= 0 then
        a = v6.rows.b
    else
        a = v6.rows.a
    end
    local type = p1.Option.type
    local v7 = buildHintText(p1.Option)
    local v8 = p1.TotalCount - p1.Index + 1 + 1
    if type == "number" then
        v1 = {OptionKey = p1.OptionKey, Option = p1.Option}
        if typeof(p1.Value) ~= "number" then
            Value = 0
        else
            Value = p1.Value
        end
        v1.Value = Value
        v1.OnChange = p1.OnChange
        v1.Width = 110
        v4 = react.createElement(NumberField, v1)
    elseif type == "boolean" then
        v3 = 32
        v1 = {OptionKey = p1.OptionKey}
        v2 = p1.Value == true
        v1.Value = v2
        v1.OnChange = p1.OnChange
        v4 = react.createElement(BooleanField, v1)
    elseif type ~= "dropdown" then
        local Value_3
        v1 = {OptionKey = p1.OptionKey}
        if typeof(p1.Value) ~= "string" then
            Value_3 = tostring(p1.Value or "")
        else
            Value_3 = p1.Value
        end
        v1.Value = Value_3
        v1.OnChange = p1.OnChange
        v1.Width = 200
        v4 = react.createElement(StringField, v1)
    else
        local Value_2
        v1 = {OptionKey = p1.OptionKey, Option = p1.Option}
        if typeof(p1.Value) ~= "string" then
            Value_2 = ""
        else
            Value_2 = p1.Value
        end
        v1.Value = Value_2
        v1.OnChange = p1.OnChange
        v1.Width = 180
        v1.ZIndex = v8
        v4 = react.createElement(OptionDropdownField, v1)
    end
    local v9 = v5(v3)
    v2 = {
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        BackgroundColor3 = a,
        Size = UDim2.new(1, 0, 0, v5(52)),
        LayoutOrder = p1.Index,
        ZIndex = v8,
    }
    local v10 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v5(6))}), Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(14)), PaddingRight = UDim.new(0, v5(12)), PaddingTop = UDim.new(0, v5(8)), PaddingBottom = UDim.new(0, v5(8))})}
    local v11 = {Bold = true, FontSize = 15, Text = prettifyName(p1.OptionKey)}
    local v12 = {TextTransparency = 0.04, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, 0)}
    local v13 = -(v9 + v5(16))
    v12.Size = UDim2.new(1, v13, 0, v5(18))
    v12.TextColor3 = v6.text.headerTitle
    v12.TextXAlignment = Enum.TextXAlignment.Left
    v12.TextTruncate = Enum.TextTruncate.AtEnd
    v12.AutomaticSize = Enum.AutomaticSize.None
    v11.Native = v12
    v10.Label = react.createElement(Text, v11)
    v11 = {FontSize = 14, Text = v7}
    v12 = {TextTransparency = 0.3, AnchorPoint = Vector2.new(0, 1), Position = UDim2.new(0, 0, 1, 0)}
    v13 = -(v9 + v5(16))
    v12.Size = UDim2.new(1, v13, 0, v5(16))
    v12.TextColor3 = v6.text.sourceMuted
    v12.TextXAlignment = Enum.TextXAlignment.Left
    v12.TextTruncate = Enum.TextTruncate.AtEnd
    v12.AutomaticSize = Enum.AutomaticSize.None
    v11.Native = v12
    v10.Hint = react.createElement(Text, v11)
    v10.Control = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 4,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(v9, v5(24)),
    }, {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder}), Field = v4})
    return react.createElement("Frame", v2, v10)
end
return react.memo(function() -- Line: 538 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), react (val), Debugger (val), runCachedClientTest (val), sortedTestNames (val), Constants (val), u384 (val), buildDefaultValues (val), sortedOptionKeys (val), isOptionVisible (val), PropertyRow (val), Text (val), Container (val), Dropdown (val), ScrollingFrame (val), Button (val)
    local u20, u21, u25, u26, u30, u31, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = useRem()
    local v11 = useTextScale()
    local v12 = useDebuggerTheme()
    local v13 = useOrder()
    local u12 = useDebuggerPages().Tests == true
    local v14 = v10(560)
    u20, u21 = react.useState(nil)
    u25, u26 = react.useState("")
    u30, u31 = react.useState({})
    local u35 = react.useRef(false)
    react.useEffect(function() -- Line: 555 -- upvalues: Debugger (upval), u21 (val), runCachedClientTest (upval)
        return (Debugger.Tests.listen(function(p1) -- Line: 556 -- upvalues: u21 (upval), runCachedClientTest (upval)
    local args, v1, v2
    if typeof(p1) == "table" then
        if typeof(p1.snapshot) ~= "table" then
            if p1.execute ~= true then
                return
            elseif typeof(p1.test) ~= "string" then
                return
            else
                if typeof(p1.args) ~= "table" then
                    args = {}
                else
                    args = p1.args
                end
                runCachedClientTest(p1.test, args)
                return
            end
        else
            u21(p1.snapshot)
            return
        end
    else
        return
    end
end))
    end, {})
    react.useEffect(function() -- Line: 577 -- upvalues: u12 (val), u35 (val), Debugger (upval)
        if not u12 then
            return function() end
        end
        if u35.current then
            return function() end
        end
        u35.current = true
        Debugger.Tests.post({list = true})
        return function() end
    end, {u12})
    local u53 = react.useMemo(function() -- Line: 593 -- upvalues: u20 (val), sortedTestNames (upval), Constants (upval), u384 (upval)
        if u20 == nil then
            return {}
        end
        local v1 = sortedTestNames(u20)
        if not Constants.IsSupporterPlace or Constants.IsTestingPlace then
            return v1
        end
        local v2 = {}
        local v3 = v1
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if u384[j] then
                table.insert(v2, j)
            end
        end
        return v2
    end, {u20})
    react.useEffect(function() -- Line: 612 -- upvalues: u20 (val), u25 (val), u53 (val), u26 (val), u31 (val), buildDefaultValues (upval)
        local v1
        if u20 == nil then
            return
        end
        if u25 == "" then
            if u53[1] == nil then
                u26("")
                u31({})
                return
            end
            v1 = u53[1]
            u26(v1)
            u31(buildDefaultValues(u20[v1]))
            return
        end
        if table.find(u53, u25) ~= nil then
            return
        end
        if u53[1] == nil then
            u26("")
            u31({})
            return
        end
        v1 = u53[1]
        u26(v1)
        u31(buildDefaultValues(u20[v1]))
    end, {u20, u53})
    local v15 = react.useCallback(function(p1) -- Line: 630 -- upvalues: u26 (val), u20 (val), u31 (val), buildDefaultValues (upval)
        if p1 == "No tests available" then
            return
        end
        u26(p1)
        if u20 ~= nil then
            local v1 = u20[p1]
            if v1 ~= nil then
                u31(buildDefaultValues(v1))
            end
        end
    end, {u20})
    local v16 = {}
    local v17 = react.useCallback(function(p1, p2) -- Line: 643 -- upvalues: u31 (val)
        u31(function(a1) -- Line: 644 -- upvalues: p1 (val), p2 (val)
            local v1 = table.clone(a1)
            v1[p1] = p2
            return v1
        end)
    end, v16)
    local v18 = {u25, u30}
    local v19 = react.useCallback(function() -- Line: 651 -- upvalues: u25 (val), Debugger (upval), u30 (val)
        if u25 == "" or u25 == "No tests available" then
            return
        end
        Debugger.Tests.post({execute = true, test = u25, options = u30})
    end, v18)
    if 0 >= #u53 then
        v16 = {"No tests available"}
    else
        v16 = u53
    end
    if u25 == "" then
        v18 = v16[1]
    else
        v18 = u25
    end
    local v20 = if u20 ~= nil and u25 ~= "" then u20[u25] else nil
    if v20 == nil then
        v1 = {}
    else
        v1 = sortedOptionKeys(v20.options)
    end
    local v21 = {}
    if v20 ~= nil then
        v2 = v1
        v3 = nil
        v4 = nil
        for i, j in v2, v3, v4 do
            if isOptionVisible(v20.options[j], u30) then
                table.insert(v21, j)
            end
        end
    end
    local v22 = {}
    if v20 == nil then
        if u20 == nil then
            v2 = "Loading tests from the server..."
        elseif #u53 == 0 then
            v2 = "No tests registered on the server."
        elseif v20 == nil then
            v2 = "Select a test to view its properties."
        elseif #v1 ~= 0 then
            v2 = "No properties match the current selection."
        else
            v2 = "This test has no configurable properties."
        end
        v22.Empty = react.createElement(Text, {
            Text = v2,
            Native = {TextTransparency = 0.4, LayoutOrder = 1, TextColor3 = v12.text.muted},
        })
    elseif 0 < #v21 then
        v3 = v21
        v4 = nil
        v5 = nil
        for k, n in v3, v4, v5 do
            v6 = ("opt_%*"):format(n)
            v22[v6] = react.createElement(PropertyRow, {
                OptionKey = n,
                Option = v20.options[n],
                Value = u30[n],
                Index = k,
                TotalCount = #v21,
                OnChange = v17,
            })
        end
    end
    v2 = v20 ~= nil
    if u20 == nil then
        v3 = "Loading tests from the server..."
    elseif #u53 == 0 then
        v3 = "No tests registered on the server."
    else
        local v23
        if v20 == nil then
            if #u53 ~= 1 then
                v23 = "s"
            else
                v23 = ""
            end
            v3 = string.format("%d test%s registered", #u53, v23)
        else
            if #u53 ~= 1 then
                v23 = "s"
            else
                v23 = ""
            end
            if #v1 ~= 1 then
                v8 = "ies"
            else
                v8 = "y"
            end
            v3 = string.format("%d test%s. %s has %d propert%s", #u53, v23, u25, #v1, v8)
        end
    end
    if v20 == nil then
        v4 = "—"
    elseif #v21 == #v1 then
        if #v1 ~= 1 then
            v6 = "ies"
        else
            v6 = "y"
        end
        v4 = string.format("%d propert%s", #v1, v6)
    else
        if #v1 ~= 1 then
            v7 = "ies"
        else
            v7 = "y"
        end
        v4 = string.format("%d of %d propert%s", #v21, #v1, v7)
    end
    v5 = nil
    if v20 ~= nil then
        local description = v20.description
        if typeof(description) == "string" and description ~= "" then
            v5 = description
        end
    end
    v6 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = u12},
    }
    v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v10(10)),
    }), Summary = react.createElement(Text, {
        Text = v3,
        Native = {TextTransparency = 0.45, TextColor3 = v12.text.muted, LayoutOrder = v13()},
    })}
    local v24 = {BackgroundTransparency = 1, ZIndex = 10, Size = UDim2.fromOffset(v14, v10(30)), LayoutOrder = v13()}
    local v25 = {}
    local v26 = {
        Header = "Test",
        Upscale = 1.05,
        Options = v16,
        Default = v18,
        Changed = v15,
        Divider = v10(42),
        Width = v10(260),
        Native = {LayoutOrder = 1, ZIndex = 15, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5)},
    }
    v25.TestDropdown = react.createElement(Dropdown, v26)
    v7.Toolbar = react.createElement("Frame", v24, v25)
    if v5 == nil then
        v8 = nil
    else
        v24 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(v14, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = v13()}
        v25 = {}
        v26 = {
            TextTransparency = 0.18,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular),
            Text = v5,
            TextColor3 = v12.text.body,
            TextSize = v11(14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
        }
        v9 = v10(12)
        v26.Position = UDim2.new(0, v9, 0, 0)
        v9 = -v10(12)
        v26.Size = UDim2.new(1, v9, 0, 0)
        v26.AutomaticSize = Enum.AutomaticSize.Y
        v25.Body = react.createElement("TextLabel", v26)
        v8 = react.createElement("Frame", v24, v25)
    end
    v7.Description = v8
    v24 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundColor3 = v12.chrome.panelSurface,
        Size = UDim2.fromOffset(v14, v10(290)),
        LayoutOrder = v13(),
    }
    v25 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v10(8))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v12.chrome.panelStroke})}
    v26 = {BackgroundTransparency = 1}
    v9 = -v10(24)
    v26.Size = UDim2.new(1, v9, 0, v10(22))
    v9 = v10(12)
    v26.Position = UDim2.new(0, v9, 0, v10(10))
    local v27 = {}
    local v28 = {Text = "Properties", Bold = true}
    local v29 = {
        TextTransparency = 0.1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        TextColor3 = v12.text.headerTitle,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    local v30 = -v10(140)
    v29.Size = UDim2.new(1, v30, 1, 0)
    v28.Native = v29
    v27.Title = react.createElement(Text, v28)
    v28 = {Text = v4}
    v29 = {
        TextTransparency = 0.45,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        TextColor3 = v12.text.muted,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextSize = v11(12),
    }
    local v31 = v10(140)
    v29.Size = UDim2.fromOffset(v31, v10(16))
    v29.AutomaticSize = Enum.AutomaticSize.None
    v28.Native = v29
    v27.Counter = react.createElement(Text, v28)
    v25.SectionHeader = react.createElement("Frame", v26, v27)
    v26 = {BackgroundTransparency = 0.55, BorderSizePixel = 0, BackgroundColor3 = v12.chrome.panelStroke}
    v9 = v10(12)
    v26.Position = UDim2.new(0, v9, 0, v10(40))
    v9 = -v10(24)
    v26.Size = UDim2.new(1, v9, 0, 1)
    v25.Divider = react.createElement("Frame", v26)
    v26 = {BackgroundTransparency = 1, ClipsDescendants = false, AnchorPoint = Vector2.new(0, 0)}
    v9 = v10(10)
    v26.Position = UDim2.new(0, v9, 0, v10(48))
    v26.ScrollBarThickness = v11(5)
    v26.ScrollBarImageColor3 = v12.chrome.scrollThumb
    v9 = -v10(20)
    v26.Size = UDim2.new(1, v9, 1, -v10(58))
    v25.Scroll = react.createElement(ScrollingFrame, v26, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v10(4)), PaddingRight = UDim.new(0, v10(4)), PaddingBottom = UDim.new(0, v10(4))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v10(6)),
    })}, v22)})
    v7.PropertiesPanel = react.createElement("Frame", v24, v25)
    v7.Actions = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v14, v10(30)), LayoutOrder = v13()}, {Execute = react.createElement(Button, {
        Text = "Execute",
        Type = 1,
        Padding = "Medium",
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Height = v10(26),
        Disabled = not v2,
        Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0)},
        Clicked = v19,
    })})
    return react.createElement(Container, v6, v7)
end)