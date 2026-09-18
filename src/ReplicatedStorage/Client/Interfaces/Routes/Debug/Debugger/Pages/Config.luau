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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Config
--                               Dumped in 0.00471 seconds
--                          Bytecode version 9  |  32 functions

local countDescendantConstants, mergeNodeIntoTree, nodeMatchesQuery
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
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Search = require(Universal_2:WaitForChild("Search"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_6:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_7:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_11:WaitForChild("Common")
local Debugger_2 = require(Common_3:WaitForChild("Logger"))("Debugger")
local function valueColor(p1, p2) -- Line: 58
    local v1 = typeof(p2)
    if v1 == "number" then
        return p1.accents.statusActive
    end
    if v1 == "boolean" then
        if p2 then
            return p1.accents.statusActive
        end
        return (Color3.fromRGB(255, 118, 118))
    end
    if v1 == "string" then
        return p1.accents.categoryBlocking
    end
    if v1 == "table" then
        return p1.text.muted
    end
    return p1.text.body
end
local function formatValue(p1) -- Line: 81
    local v1, v2
    local v3 = typeof(p1)
    if v3 == "string" then
        return string.format("\"%s\"", p1)
    end
    if v3 == "boolean" then
        if p1 then
            return "true"
        end
        return "false"
    end
    if v3 == "number" then
        v1 = math.abs(p1 - math.round(p1))
        if v1 < 1e-06 then
            return (tostring((math.round(p1))))
        end
        return string.format("%.4g", p1)
    end
    if p1 == nil then
        return "nil"
    end
    if v3 ~= "table" then
        return (tostring(p1))
    end
    v1 = 0
    for k in pairs(p1) do
        v1 = v1 + 1
    end
    if v1 ~= 1 then
        v2 = "items"
    else
        v2 = "item"
    end
    return string.format("{ %d %s }", v1, v2)
end
function nodeMatchesQuery(p1, p2) -- Line: 115 -- upvalues: formatValue (val), nodeMatchesQuery (val)
    local v1, v2
    if p2 == "" then
        return true
    end
    local v3 = string.lower(p1.name)
    if string.find(v3, p2, 1, true) then
        return true
    end
    for k, v in pairs(p1.constants) do
        v2 = string.lower(k)
        if string.find(v2, p2, 1, true) then
            return true
        end
        v1 = string.lower(formatValue(v))
        if string.find(v1, p2, 1, true) then
            return true
        end
    end
    for k2, i in pairs(p1.children) do
        if nodeMatchesQuery(i, p2) then
            return true
        end
    end
    return false
end
local function sortedKeys(p1) -- Line: 148
    local v1 = {}
    for k in pairs(p1) do
        table.insert(v1, k)
    end
    table.sort(v1)
    return v1
end
function countDescendantConstants(p1) -- Line: 163 -- upvalues: countDescendantConstants (val)
    local v1 = 0
    for k in pairs(p1.constants) do
        v1 = v1 + 1
    end
    for k2, v in pairs(p1.children) do
        v1 = v1 + countDescendantConstants(v)
    end
    return v1
end
local function cloneConstants(p1) -- Line: 179
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
local function splitNodeNamePath(p1) -- Line: 193
    local v1 = {}
    local v2 = string.gsub(p1, "\\", "/")
    v2 = string.gsub(v2, "^ServerScriptService[/.]", "")
    v2 = string.gsub(v2, "^ReplicatedStorage[/.]", "")
    v2 = string.gsub(v2, "^StarterPlayer[/.]", "")
    v2 = string.gsub(v2, "^StarterGui[/.]", "")
    v2 = string.gsub(v2, "%.", "/")
    for i in string.gmatch(v2, "[^/]+") do
        table.insert(v1, i)
    end
    if #v1 == 0 then
        table.insert(v1, p1)
    end
    return v1
end
function mergeNodeIntoTree(p1, p2) -- Line: 220 -- upvalues: splitNodeNamePath (val), mergeNodeIntoTree (val)
    local v1
    local v2 = p1
    local v3 = splitNodeNamePath(p2.name)
    local v4 = p2
    for i, v in ipairs(v3) do
        v1 = v2.children[v]
        if v1 == nil then
            v2.children[v] = {name = v, path = {}, constants = {}, children = {}}
        end
        v2 = v1
    end
    local v5 = #v4.path
    if 0 < v5 then
        v2.path = table.clone(v4.path)
    end
    for k, i2 in pairs(v4.constants) do
        v2.constants[k] = i2
    end
    for k2, j in pairs(v4.children) do
        mergeNodeIntoTree(v2, j)
    end
end
local function normalizeTreeForDisplay(p1) -- Line: 259 -- upvalues: cloneConstants (val), mergeNodeIntoTree (val)
    local v1 = {name = p1.name, path = table.clone(p1.path), constants = cloneConstants(p1.constants), children = {}}
    for k, v in pairs(p1.children) do
        mergeNodeIntoTree(v1, v)
    end
    return v1
end
local function hasAnyContent(p1) -- Line: 279
    if next(p1.constants) ~= nil or next(p1.children) ~= nil then
        return true
    end
    return false
end
local function wrapTreeWithSource(p1, p2) -- Line: 294 -- upvalues: cloneConstants (val)
    return {
        name = p1,
        path = {p1},
        constants = cloneConstants(p2.constants),
        children = p2.children,
    }
end
local function trim(p1) -- Line: 308
    return string.match(p1, "^%s*(.-)%s*$") or ""
end
local function parseEditedValue(p1) -- Line: 318 -- upvalues: trim (val)
    local v1 = trim(p1)
    local v2 = string.lower(v1)
    if v2 == "nil" then
        return nil
    end
    if v2 == "true" then
        return true
    end
    if v2 == "false" then
        return false
    end
    local v3 = tonumber(v1)
    if v3 ~= nil then
        return v3
    end
    local v4 = string.match(v1, "^\"(.*)\"$")
    if v4 ~= nil then
        return v4
    end
    local v5 = string.match(v1, "^'(.*)'$")
    if v5 ~= nil then
        return v5
    end
    return v1
end
local function ConstantRow(p1) -- Line: 354 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), formatValue (val), react (val), parseEditedValue (val), Text (val), valueColor (val)
    local a, u24, u25, u29, u30, v1
    local v2 = useRem()
    local v3 = useTextScale()
    local v4 = useDebuggerTheme()
    local v5 = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular)
    if p1.Index % 2 ~= 0 then
        a = v4.rows.b
    else
        a = v4.rows.a
    end
    local u20 = formatValue(p1.Value)
    u24, u25 = react.useState(false)
    u29, u30 = react.useState(u20)
    react.useEffect(function() -- Line: 372 -- upvalues: u24 (val), u30 (val), u20 (val)
        if not u24 then
            u30(u20)
        end
    end, {u20, u24})
    local u47 = react.useCallback(function() -- Line: 378 -- upvalues: u25 (val), p1 (val), parseEditedValue (upval), u29 (val)
        u25(false)
        p1.OnCommit(p1.Scope, p1.Path, p1.Name, parseEditedValue(u29))
    end, {
        p1.Scope,
        p1.Path,
        p1.Name,
        p1.OnCommit,
        u29,
    })
    local v6 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = a,
        Size = UDim2.new(1, 0, 0, v2(22)),
        LayoutOrder = p1.Index,
    }
    local v7 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v2(3))}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v2(p1.Indent * 14 + 12)), PaddingRight = UDim.new(0, v2(12))}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v2(8)),
    }), Key = react.createElement(Text, {
        Bold = true,
        Text = p1.Name,
        Native = {
            TextTransparency = 0.05,
            LayoutOrder = 1,
            TextColor3 = v4.accents.configConstantKey,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v2(16)),
        },
    })}
    local v8 = {
        Text = "=",
        Native = {TextTransparency = 0.3, LayoutOrder = 2, TextColor3 = Color3.fromRGB(120, 120, 120)},
    }
    v7.Equals = react.createElement(Text, v8)
    if not u24 then
        v8 = {
            BackgroundTransparency = 1,
            AutoButtonColor = false,
            Text = u20,
            FontFace = v5,
            TextSize = v3(14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = valueColor(v4, p1.Value),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v2(16)),
            LayoutOrder = 3,
        }
        v8[react.Event.Activated] = function() -- Line: 475 -- upvalues: u25 (val)
            u25(true)
        end
        v1 = react.createElement("TextButton", v8)
    else
        v8 = {
            BackgroundColor3 = Color3.fromRGB(34, 36, 44),
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            Text = u29,
            FontFace = v5,
            TextSize = v3(14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = valueColor(v4, p1.Value),
            ClearTextOnFocus = false,
            AutomaticSize = Enum.AutomaticSize.X,
        }
        local v9 = v2(110)
        v8.Size = UDim2.fromOffset(v9, v2(18))
        v8.LayoutOrder = 3
        v8[react.Change.Text] = function(p1) -- Line: 443 -- upvalues: u30 (val)
            u30(p1.Text)
        end
        v8[react.Event.FocusLost] = function(p1, p2) -- Line: 446 -- upvalues: u47 (val), u25 (val), u30 (val), u20 (val)
            if p2 then
                u47()
                return
            end
            u25(false)
            u30(u20)
        end
        v1 = react.createElement("TextBox", v8, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v2(3))}), Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v2(6)), PaddingRight = UDim.new(0, v2(6))})})
    end
    v7.Value = v1
    return react.createElement("Frame", v6, v7)
end
local u312 = nil
u312 = react.memo(function(p1) -- Line: 484 -- upvalues: useRem (val), useDebuggerTheme (val), react (val), countDescendantConstants (val), Text (val), sortedKeys (val), ConstantRow (val), nodeMatchesQuery (val), u312 (ref)
    local name, u23, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useDebuggerTheme()
    local Node = p1.Node
    local v7 = next(Node.children) ~= nil
    local v8 = next(Node.constants) ~= nil
    v4, u23 = react.useState(p1.DefaultExpanded)
    local v9 = v4
    if not v9 then
        v9 = p1.Query ~= ""
    end
    local v10 = react.useMemo(function() -- Line: 504 -- upvalues: countDescendantConstants (upval), Node (val)
        return countDescendantConstants(Node)
    end, {Node})
    local v11 = react.useCallback(function() -- Line: 508 -- upvalues: u23 (val)
        u23(function(p1) -- Line: 509
            return not p1
        end)
    end, {})
    local v12 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(6)),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(p1.Depth * 14 + 6)), PaddingRight = UDim.new(0, v5(12))})}
    local v13 = {ImageTransparency = 0.2, BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 1}
    if not v9 then
        v2 = "rbxassetid://11419703997"
    else
        v2 = "rbxassetid://11421095840"
    end
    v13.Image = v2
    v13.ImageColor3 = Color3.fromRGB(170, 170, 170)
    local v14 = v5(12)
    v13.Size = UDim2.fromOffset(v14, v5(12))
    v12.Caret = react.createElement("ImageLabel", v13)
    v13 = {
        Image = "rbxassetid://11295287370",
        ImageTransparency = 0.1,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
    }
    v14 = v5(13)
    v13.Size = UDim2.fromOffset(v14, v5(13))
    v12.Folder = react.createElement("ImageLabel", v13)
    v13 = {Bold = true}
    if Node.name ~= "" then
        name = Node.name
    else
        name = "<root>"
    end
    v13.Text = name
    v13.Native = {
        TextTransparency = 0.1,
        LayoutOrder = 3,
        TextColor3 = v6.accents.attributeBlue,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, v5(16)),
    }
    v12.Name = react.createElement(Text, v13)
    v13 = {}
    if v10 ~= 1 then
        v3 = "constants"
    else
        v3 = "constant"
    end
    v13.Text = string.format("(%d %s)", v10, v3)
    v13.Native = {TextTransparency = 0.3, LayoutOrder = 4, TextColor3 = Color3.fromRGB(150, 150, 150)}
    v12.Count = react.createElement(Text, v13)
    local v15 = {}
    local v16 = 1
    if not v9 then
        v1 = p1
    else
        if v8 then
            for i, j in sortedKeys(Node.constants) do
                v15["k_" .. j] = react.createElement(ConstantRow, {
                    Name = j,
                    Value = Node.constants[j],
                    Index = v16,
                    Indent = p1.Depth + 1,
                    Scope = p1.Scope,
                    Path = Node.path,
                    OnCommit = p1.OnCommit,
                })
                v16 = v16 + 1
            end
        end
        if not v7 then
            v1 = p1
        else
            local v17, v18, v19
            v1 = p1
            for k, n in sortedKeys(Node.children) do
                v17 = Node.children[n]
                if nodeMatchesQuery(v17, v1.Query) then
                    v18 = {Node = v17, Depth = v1.Depth + 1, Index = v16, Query = v1.Query}
                    v19 = v1.Query ~= ""
                    v18.DefaultExpanded = v19
                    v18.Scope = v1.Scope
                    v18.OnCommit = v1.OnCommit
                    v15["c_" .. n] = react.createElement(u312, v18)
                    v16 = v16 + 1
                end
            end
        end
    end
    v14 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = v1.Index}
    local v20 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(2)),
    })}
    local v21 = {
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Size = UDim2.new(1, 0, 0, v5(24)),
        LayoutOrder = 1,
    }
    v21[react.Event.Activated] = v11
    v20.Header = react.createElement("TextButton", v21, {HeaderCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v5(4))}), HeaderContents = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, v12)})
    v20.Children = react.createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = v9,
    }, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(2)),
    })}, v15)
    return react.createElement("Frame", v14, v20)
end)
return react.memo(function() -- Line: 667 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), react (val), Debugger (val), normalizeTreeForDisplay (val), Config (val), hasAnyContent (val), wrapTreeWithSource (val), Debugger_2 (val), Text (val), sortedKeys (val), nodeMatchesQuery (val), u312 (ref), Container (val), Search (val), ScrollingFrame (val)
    local u21, u22, u26, u27, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useTextScale()
    local v7 = useDebuggerTheme()
    local v8 = useOrder()
    local u12 = useDebuggerPages().Config == true
    v3, v4 = react.useState("")
    u21, u22 = react.useState(nil)
    u26, u27 = react.useState(nil)
    react.useEffect(function() -- Line: 679 -- upvalues: Debugger (upval), u22 (val), normalizeTreeForDisplay (upval)
        return (Debugger.Config.listen(function(p1) -- Line: 680 -- upvalues: u22 (upval), normalizeTreeForDisplay (upval)
    local v1
    if typeof(p1) == "table" then
        if typeof(p1.snapshot) == "table" then
            u22(normalizeTreeForDisplay(p1.snapshot))
        end
        return
    else
        return
    end
end))
    end, {})
    react.useEffect(function() -- Line: 692 -- upvalues: u12 (val), u27 (val), normalizeTreeForDisplay (upval), Config (upval), Debugger (upval)
        if not u12 then
            return function() end
        end
        u27(normalizeTreeForDisplay((Config.getTree())))
        Debugger.Config.post({open = true})
        return function() end
    end, {u12})
    local v9 = react.useMemo(function() -- Line: 706 -- upvalues: u26 (val), hasAnyContent (upval), wrapTreeWithSource (upval), u21 (val)
        local v1 = {name = "", path = {}, constants = {}, children = {}}
        if u26 ~= nil and hasAnyContent(u26) then
            v1.children.Client = wrapTreeWithSource("Client", u26)
        end
        if u21 ~= nil and hasAnyContent(u21) then
            v1.children.Server = wrapTreeWithSource("Server", u21)
        end
        return v1
    end, {u26, u21})
    local v10 = {}
    local v11 = react.useCallback(function(p1, p2, p3, p4) -- Line: 725 -- upvalues: Config (upval), Debugger_2 (upval), u27 (val), normalizeTreeForDisplay (upval), Debugger (upval)
        if p1 ~= "Client" then
            Debugger.Config.post({
                update = {path = p2, key = p3, value = p4},
            })
            return
        end
        if Config.setValueAtPath(p2, p3, p4) then
            local v1 = Debugger_2.info("Client updated a configuration value")
            v1.append((("Path: %*"):format((table.concat(p2, "/")))))
            v1.append((("Key: %*"):format(p3))).color("yellow")
            v1.append((("Value: %*"):format(p4))).color("green")
            u27(normalizeTreeForDisplay((Config.getTree())))
        end
    end, v10)
    local v12 = {}
    if u21 ~= nil then
        v10 = false
        for i, j in sortedKeys(v9.children) do
            v2 = v9.children[j]
            if nodeMatchesQuery(v2, string.lower(v3)) then
                v10 = true
                v12["c_" .. j] = react.createElement(u312, {
                    Depth = 0,
                    DefaultExpanded = false,
                    Node = v2,
                    Index = i,
                    Query = string.lower(v3),
                    Scope = j,
                    OnCommit = v11,
                })
            end
        end
        if not v10 then
            local v13
            v1 = {}
            if v3 ~= "" then
                v13 = "No constants match your search."
            else
                v13 = "No constants registered yet."
            end
            v1.Text = v13
            v1.Native = {TextTransparency = 0.35, LayoutOrder = 1, TextColor3 = v7.text.muted}
            v12.Empty = react.createElement(Text, v1)
        end
    elseif u26 == nil then
        v12.Loading = react.createElement(Text, {
            Text = "Loading config tree...",
            Native = {TextTransparency = 0.35, LayoutOrder = 1, TextColor3 = v7.text.muted},
        })
    end
    local v14 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = u12},
    }
    v1 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(12)),
    }), Search = react.createElement(Search, {
        PlaceholderText = "Filter constants...",
        WidthPx = v5(520),
        HeightPx = v5(30),
        LayoutOrder = v8(),
        OnQueryChange = v4,
    })}
    v2 = {BackgroundTransparency = 1}
    local v15 = v5(580)
    v2.Size = UDim2.fromOffset(v15, v5(380))
    v2.LayoutOrder = v8()
    v1.ScrollRegion = react.createElement("Frame", v2, {Scroll = react.createElement(ScrollingFrame, {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        ScrollBarThickness = v6(4),
        Size = UDim2.fromScale(1, 1),
    }, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v6(6))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(4)),
    })}, v12)})})
    return react.createElement(Container, v14, v1)
end)