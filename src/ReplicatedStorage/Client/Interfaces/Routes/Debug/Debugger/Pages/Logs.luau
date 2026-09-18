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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Logs
--                               Dumped in 0.00386 seconds
--                          Bytecode version 9  |  21 functions

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
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientDebuggerLog = require(Miscellaneous:WaitForChild("ClientDebuggerLog"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
require(Common:WaitForChild("Logger"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Dropdown = require(Universal_3:WaitForChild("Dropdown"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_6:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Search = require(Universal_4:WaitForChild("Search"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Editor_5 = Components_7:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Text = require(Universal_5:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_11:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_10:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local function collectFilterOptions(p1) -- Line: 51
    local v1 = {}
    local v2 = {}
    local v3 = {"All Scripts"}
    local v4 = {"All Categories"}
    local v5 = p1
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if typeof(j.source) == "string" and not (v1[j.source]) then
            v1[j.source] = true
            table.insert(v3, j.source)
        end
        if typeof(j.category) == "string" and not (v2[j.category]) then
            v2[j.category] = true
            table.insert(v4, j.category)
        end
    end
    table.sort(v3, function(p1, p2) -- Line: 68
        if p1 == "All Scripts" then
            return true
        end
        if p2 == "All Scripts" then
            return false
        end
        local v1 = p1 < p2
        return v1
    end)
    table.sort(v4, function(p1, p2) -- Line: 77
        if p1 == "All Categories" then
            return true
        end
        if p2 == "All Categories" then
            return false
        end
        local v1 = p1 < p2
        return v1
    end)
    return v3, v4
end
local function entryMatchesFilters(p1, p2, p3, p4, p5, p6) -- Line: 100
    if p1.channel ~= "Server" then
        if p1.channel ~= "Client" then
            if p3 == "All Scripts" then
                local v1, v2, v3, v4, v5
                if p4 == "All Categories" then
                    if p2 ~= "" then
                        v2 = string.lower(p2)
                        v3 = string.lower((tostring(p1.source)))
                        v4 = string.lower((tostring(p1.message)))
                        v5 = string.lower((tostring(p1.category)))
                        v1 = string.lower((tostring(p1.level)))
                        if string.find(v3, v2, 1, true) ~= nil or string.find(v4, v2, 1, true) ~= nil or string.find(v5, v2, 1, true) ~= nil then
                            return true
                        end
                        if string.find(v1, v2, 1, true) == nil then
                            return false
                        end
                        return true
                    end
                    return true
                end
                if p1.category ~= p4 then
                    return false
                end
                if p2 == "" then
                    return true
                end
                v2 = string.lower(p2)
                v3 = string.lower((tostring(p1.source)))
                v4 = string.lower((tostring(p1.message)))
                v5 = string.lower((tostring(p1.category)))
                v1 = string.lower((tostring(p1.level)))
                if string.find(v3, v2, 1, true) ~= nil or string.find(v4, v2, 1, true) ~= nil or string.find(v5, v2, 1, true) ~= nil then
                    return true
                end
                if string.find(v1, v2, 1, true) == nil then
                    return false
                end
                return true
            elseif p1.source ~= p3 then
                return false
            end
        elseif not p6 then
            return false
        end
    elseif not p5 then
        return false
    end
end
local function formatViewerTimestamp(p1) -- Line: 148
    if typeof(p1.unixTimestamp) == "number" then
        return (os.date("%H:%M:%S", p1.unixTimestamp))
    end
    if typeof(p1.timestamp) == "string" then
        return p1.timestamp
    end
    return "--:--:--"
end
local function LogRow(p1) -- Line: 160 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), formatViewerTimestamp (val), react (val), Text (val)
    local a, channelServer, v1, v2, v3
    local v4 = useRem()
    local v5 = useTextScale()
    local v6 = useDebuggerTheme()
    if p1.Index % 2 ~= 0 then
        a = v6.rows.b
    else
        a = v6.rows.a
    end
    if p1.Entry.level == "ERROR" then
        v1 = Color3.fromRGB(255, 118, 118)
    elseif p1.Entry.level ~= "WARN" then
        v1 = Color3.fromRGB(235, 235, 235)
    else
        v1 = Color3.fromRGB(255, 214, 120)
    end
    if p1.Entry.channel ~= "Server" then
        channelServer = v6.logs.channelClient
    else
        channelServer = v6.logs.channelServer
    end
    if typeof(p1.Entry.line) ~= "number" then
        v3 = formatViewerTimestamp(p1.Entry)
        v2 = string.format("%s  •  %s", v3, p1.Entry.category)
    else
        v3 = formatViewerTimestamp(p1.Entry)
        v2 = string.format("%s  •  %s  •  L%d", v3, p1.Entry.category, p1.Entry.line)
    end
    local v7 = {
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        BackgroundColor3 = a,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = p1.Index,
    }
    local v8 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(4))})}
    local v9 = {BackgroundTransparency = 0.08, BorderSizePixel = 0, ZIndex = 3, AnchorPoint = Vector2.new(0, 0.5)}
    local v10 = UDim2.fromScale(0, 0.5)
    local v11 = v4(5)
    v9.Position = v10 - UDim2.fromOffset(v11, 0)
    local v12 = v4(3)
    v10 = UDim2.fromOffset(v12, 0)
    v9.Size = v10 + UDim2.fromScale(0, 1)
    v9.BackgroundColor3 = channelServer
    v8.ChannelAccent = react.createElement("Frame", v9, {AccentCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(4))})})
    v8.Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v4(10)), PaddingRight = UDim.new(0, v4(16)), PaddingTop = UDim.new(0, v4(11)), PaddingBottom = UDim.new(0, v4(11))})
    v9 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0)}
    v10 = v4(5)
    v9.Position = UDim2.fromOffset(v10, 0)
    v9.AutomaticSize = Enum.AutomaticSize.Y
    local v13 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(4)),
    })}
    v11 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, v4(17))}
    local v14 = {HeaderLayout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(8)),
    })}
    local v15 = {
        Bold = true,
        Text = p1.Entry.source,
        Native = {
            TextTransparency = 0.1,
            LayoutOrder = 1,
            TextColor3 = v6.accents.attributeBlue,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v4(17)),
            TextSize = v5(16),
        },
    }
    local v16 = {}
    local v17 = {}
    local v18 = v4(230)
    v17.MaxSize = Vector2.new(v18, v4(17))
    v16.SourceConstraint = react.createElement("UISizeConstraint", v17)
    v14.Source = react.createElement(Text, v15, v16)
    v14.Meta = react.createElement(Text, {
        Text = v2,
        Native = {
            TextTransparency = 0.25,
            LayoutOrder = 2,
            TextColor3 = Color3.fromRGB(168, 168, 168),
            TextSize = v5(14),
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, v4(17)),
        },
    })
    v13.Header = react.createElement("Frame", v11, v14)
    v13.Message = react.createElement("TextLabel", {
        RichText = true,
        TextTransparency = 0.16,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Entry.message,
        TextColor3 = v1,
        TextSize = v5(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    v8.Body = react.createElement("Frame", v9, v13)
    return react.createElement("Frame", v7, v8)
end
return react.memo(function() -- Line: 299 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), react (val), ClientDebuggerLog (val), collectFilterOptions (val), entryMatchesFilters (val), LogRow (val), Text (val), Container (val), Search (val), Dropdown (val), Checkbox (val), ScrollingFrame (val), Button (val)
    local u16, u21, u26, u31, u36, u41, u42, u46, u47, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = useRem()
    local v11 = useTextScale()
    local v12 = useDebuggerTheme()
    local v13 = useOrder()
    local u12 = useDebuggerPages().Logs == true
    u16, v8 = react.useState("")
    u21, v9 = react.useState("All Scripts")
    u26, v1 = react.useState("All Categories")
    u31, v2 = react.useState(true)
    u36, v3 = react.useState(true)
    u41, u42 = react.useState(1)
    u46, u47 = react.useState({})
    react.useEffect(function() -- Line: 315 -- upvalues: ClientDebuggerLog (upval), u47 (val)
        return (ClientDebuggerLog.subscribe(function(p1) -- Line: 316 -- upvalues: u47 (upval)
    local v1
    u47(p1)
    return
end))
    end, {})
    react.useEffect(function() -- Line: 323 -- upvalues: ClientDebuggerLog (upval), u12 (val)
        ClientDebuggerLog.setViewerOpen(u12)
        return function() -- Line: 325 -- upvalues: ClientDebuggerLog (upval)
            ClientDebuggerLog.setViewerOpen(false)
        end
    end, {u12})
    v4, v5 = react.useMemo(function() -- Line: 330 -- upvalues: collectFilterOptions (upval), u46 (val)
        return collectFilterOptions(u46)
    end, {u46})
    local u77 = react.useMemo(function() -- Line: 334 -- upvalues: u46 (val), entryMatchesFilters (upval), u16 (val), u21 (val), u26 (val), u31 (val), u36 (val)
        local v1 = {}
        local v2 = u46
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if entryMatchesFilters(j, u16, u21, u26, u31, u36) then
                table.insert(v1, j)
            end
        end
        return v1
    end, {
        u46,
        u16,
        u21,
        u26,
        u31,
        u36,
    })
    local u78 = #u77
    local u84 = math.max(1, (math.ceil(u78 / 50)))
    react.useEffect(function() -- Line: 347 -- upvalues: u42 (val)
        u42(1)
    end, {
        u16,
        u21,
        u26,
        u31,
        u36,
    })
    react.useEffect(function() -- Line: 351 -- upvalues: u41 (val), u84 (val), u42 (val)
        if u84 < u41 then
            u42(u84)
        end
    end, {u41, u84})
    local v14 = react.useMemo(function() -- Line: 357 -- upvalues: u41 (val), u78 (val), u77 (val)
        local v1 = (u41 - 1) * 50 + 1
        local v2 = {}
        local v3 = math.min(v1 + 50 - 1, u78)
        local v4 = 1
        for i = v1, v3, v4 do
            table.insert(v2, u77[i])
        end
        return v2
    end, {u77, u41, u78})
    local v15 = {}
    local v16 = v14
    local v17 = nil
    local v18 = nil
    for i, j in v16, v17, v18 do
        v7 = tostring(j.channel)
        v6 = string.format("%s:%s", v7, (tostring(j.logId)))
        v15[v6] = react.createElement(LogRow, {Entry = j, Index = i})
    end
    if #v14 == 0 then
        v15.Empty = react.createElement(Text, {
            Text = "No logs match your current filters.",
            Native = {TextTransparency = 0.35, LayoutOrder = 1, TextColor3 = Color3.fromRGB(150, 150, 150)},
        })
    end
    v18 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = u12},
    }
    local v19 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v10(12)),
    }), Search = react.createElement(Search, {
        PlaceholderText = "Filter Logs...",
        WidthPx = v10(520),
        HeightPx = v10(30),
        LayoutOrder = v13(),
        OnQueryChange = v8,
    })}
    local v20 = {BackgroundTransparency = 1}
    local v21 = v10(540)
    v20.Size = UDim2.fromOffset(v21, v10(24))
    v20.LayoutOrder = v13()
    v19.Filters = react.createElement("Frame", v20, {
        H = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v10(10)),
        }),
        ScriptDropdown = react.createElement(Dropdown, {
            Header = "Script",
            Options = v4,
            Default = u21,
            Changed = v9,
            Divider = v10(46),
            Width = v10(170),
            Native = {LayoutOrder = 1, ZIndex = 5},
        }),
        CategoryDropdown = react.createElement(Dropdown, {
            Header = "Category",
            Options = v5,
            Default = u26,
            Changed = v1,
            Divider = v10(62),
            Width = v10(170),
            Native = {LayoutOrder = 2, ZIndex = 5},
        }),
        ShowServer = react.createElement(Checkbox, {
            Label = "Server",
            Default = true,
            Toggled = v2,
            Native = {LayoutOrder = 3},
        }),
        ShowClient = react.createElement(Checkbox, {
            Label = "Client",
            Default = true,
            Toggled = v3,
            Native = {LayoutOrder = 4},
        }),
    })
    v19.CountLine = react.createElement(Text, {
        Text = string.format("Showing %d logs  |  Page %d / %d", u78, u41, u84),
        Native = {TextTransparency = 0.45, TextColor3 = v12.text.muted, LayoutOrder = v13()},
    })
    v20 = {BackgroundTransparency = 0.12, BorderSizePixel = 0, BackgroundColor3 = v12.chrome.panelSurface}
    v21 = v10(580)
    v20.Size = UDim2.fromOffset(v21, v10(320))
    v20.LayoutOrder = v13()
    v7 = {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v10(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v12.chrome.panelStroke})}
    local v22 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    local v23 = v10(8)
    v22.Position = UDim2.new(0, v23, 0, v10(8))
    v22.ScrollBarThickness = v11(5)
    v22.ScrollBarImageColor3 = v12.chrome.scrollThumb
    v23 = -v10(16)
    v22.Size = UDim2.new(1, v23, 1, -v10(16))
    v7.Scroll = react.createElement(ScrollingFrame, v22, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, 0)}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v10(4)),
    })}, v15)})
    v19.ScrollChrome = react.createElement("Frame", v20, v7)
    v20 = {BackgroundTransparency = 1}
    v21 = v10(580)
    v20.Size = UDim2.fromOffset(v21, v10(28))
    v20.LayoutOrder = v13()
    v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v10(10)),
    })}
    v22 = {
        Text = "Previous",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    local v24 = {LayoutOrder = 1}
    local v25 = 1 < u41
    v24.Visible = v25
    v22.Native = v24
    function v22.Clicked() -- Line: 542 -- upvalues: u42 (val)
        u42(function(p1) -- Line: 543
            return (math.max(1, p1 - 1))
        end)
    end
    v7.Previous = react.createElement(Button, v22)
    v7.PageInfo = react.createElement(Text, {
        Text = string.format("Page %d / %d", u41, u84),
        Native = {TextTransparency = 0.3, LayoutOrder = 2},
    })
    v22 = {
        Text = "Next",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    v24 = {LayoutOrder = 3}
    v25 = u41 < u84
    v24.Visible = v25
    v22.Native = v24
    function v22.Clicked() -- Line: 567 -- upvalues: u42 (val), u84 (val)
        u42(function(p1) -- Line: 568 -- upvalues: u84 (upval)
            return (math.min(u84, p1 + 1))
        end)
    end
    v7.Next = react.createElement(Button, v22)
    v19.Pagination = react.createElement("Frame", v20, v7)
    return react.createElement(Container, v18, v19)
end)