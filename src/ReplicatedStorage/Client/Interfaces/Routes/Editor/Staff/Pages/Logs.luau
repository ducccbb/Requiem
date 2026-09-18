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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Logs
--                               Dumped in 0.00309 seconds
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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Logs = require(Namespaces:WaitForChild("Logs"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Group = require(Universal_2:WaitForChild("Group"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Textbox = require(Universal_4:WaitForChild("Textbox"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks_2:WaitForChild("useEditorPages"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_10:WaitForChild("Hooks")
local useTextScale = require(Hooks_6:WaitForChild("useTextScale"))
local function LogEntry(p1) -- Line: 60 -- upvalues: useRem (val), useTextScale (val), react (val), Text (val)
    local u9, v1, v2, v3
    local v4 = useRem()
    local v5 = useTextScale()
    v2, u9 = react.useState(false)
    local v6 = react.useMemo(function() -- Line: 69 -- upvalues: p1 (val)
        return os.date("%H:%M:%S", p1.Log.timestamp)
    end, {p1.Log.timestamp})
    local v7 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if p1.Index % 2 ~= 0 then
        v3 = 0.96
    else
        v3 = 0.99
    end
    v7.BackgroundTransparency = v3
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v7.BorderSizePixel = 0
    v7.Size = UDim2.new(1, 0, 0, 0)
    v7.AutomaticSize = Enum.AutomaticSize.Y
    v7[react.Event.MouseEnter] = function() -- Line: 81 -- upvalues: u9 (val)
        u9(true)
    end
    v7[react.Event.MouseLeave] = function() -- Line: 85 -- upvalues: u9 (val)
        u9(false)
    end
    v7.LayoutOrder = p1.Index
    v3 = {}
    local v8 = {Color = Color3.fromRGB(255, 255, 255)}
    if not v2 then
        v1 = 1
    else
        v1 = 0.9
    end
    v8.Transparency = v1
    v3.Stroke = react.createElement("UIStroke", v8)
    v3.Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v4(10)), PaddingRight = UDim.new(0, v4(10)), PaddingTop = UDim.new(0, v4(5)), PaddingBottom = UDim.new(0, v4(5))})
    v3.Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(2)),
    })
    v3.Header = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, v4(18))}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(5)),
    }), Time = react.createElement(Text, {
        Text = v6,
        Native = {TextTransparency = 0.4, LayoutOrder = 2, TextColor3 = Color3.fromRGB(150, 150, 150)},
    }), Username = react.createElement(Text, {
        Bold = true,
        Text = p1.Log.username,
        Native = {TextTransparency = 0.1, LayoutOrder = 1, TextColor3 = Color3.fromRGB(28, 176, 255)},
    })})
    v3.Message = react.createElement("TextBox", {
        TextTransparency = 0.2,
        TextWrapped = true,
        TextEditable = false,
        ClearTextOnFocus = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Log.message,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v5(14),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.new(1, 0, 0, v4(14)),
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    return react.createElement("Frame", v7, v3)
end
local function CategorySection(p1) -- Line: 169 -- upvalues: useRem (val), useOrder (val), react (val), LogEntry (val), Group (val), ScrollingFrame (val), Button (val), Text (val)
    local v1
    local v2 = useRem()
    local v3 = useOrder()
    local v4 = {}
    local logs = p1.Data.logs
    local v5 = nil
    local v6 = nil
    for i, j in logs, v5, v6 do
        v1 = tostring(j.id)
        v4[v1] = react.createElement(LogEntry, {Log = j, Index = i})
    end
    v6 = {
        Collapsible = true,
        Header = p1.Title .. " (" .. p1.Data.totalLogs .. ")",
        Collapsed = not p1.Expanded,
        OnToggle = p1.OnToggle,
        Native = {LayoutOrder = p1.LayoutOrder},
    }
    local v7 = {}
    local v8 = {BackgroundTransparency = 1}
    local v9 = v2(500)
    v8.Size = UDim2.fromOffset(v9, v2(280))
    local v10 = {}
    local v11 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v12 = v2(500)
    v11.Size = UDim2.fromOffset(v12, v2(250))
    v10.Scroll = react.createElement(ScrollingFrame, v11, {List = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}, v4)
    v11 = {BackgroundTransparency = 1}
    v12 = UDim2.fromScale(1, 0)
    v11.Size = v12 + UDim2.fromOffset(0, v2(30))
    v11.Position = UDim2.fromScale(0, 1)
    v11.AnchorPoint = Vector2.new(0, 1)
    local v13 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v2(10)),
    })}
    local v14 = {
        Text = "Previous",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    local v15 = {LayoutOrder = v3()}
    local v16 = 1 < p1.Data.page
    v15.Visible = v16
    v14.Native = v15
    function v14.Clicked() -- Line: 241 -- upvalues: p1 (val)
        p1.OnPageChange(p1.Data.page - 1)
    end
    v13.Previous = react.createElement(Button, v14)
    v13.PageInfo = react.createElement(Text, {
        Text = "Page " .. p1.Data.page .. " / " .. p1.Data.totalPages,
        Native = {TextTransparency = 0.3, LayoutOrder = v3()},
    })
    v14 = {
        Text = "Next",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    v15 = {LayoutOrder = v3()}
    v16 = p1.Data.page < p1.Data.totalPages
    v15.Visible = v16
    v14.Native = v15
    function v14.Clicked() -- Line: 264 -- upvalues: p1 (val)
        p1.OnPageChange(p1.Data.page + 1)
    end
    v13.Next = react.createElement(Button, v14)
    v10.Pagination = react.createElement("Frame", v11, v13)
    v7.Content = react.createElement("Frame", v8, v10)
    return react.createElement(Group, v6, v7)
end
return react.memo(function() -- Line: 273 -- upvalues: useRem (val), useEditorPages (val), useEditorEnabled (val), useOrder (val), useStore (val), Logs (val), react (val), Container (val), Textbox (val), CategorySection (val)
    local u24, u29, v1, v2
    local v3 = useRem()
    local u3 = useEditorPages()
    local u5 = useEditorEnabled()
    local v4 = useOrder()
    local v5 = useStore(Logs.Store, function(p1) -- Line: 281
        return p1
    end)
    react.useEffect(function() -- Line: 286 -- upvalues: u3 (val), Logs (upval), u5 (val)
        local v1 = u3.Logs == true
        Logs.UpdatePageState.post({logsPageOpen = v1, editorEnabled = u5})
        if v1 and u5 then
            Logs.RequestPage.post({category = "chat", page = 1})
            Logs.RequestPage.post({category = "commands", page = 1})
            Logs.RequestPage.post({category = "thoughts", page = 1})
        end
    end, {u3.Logs, u5})
    v1, u24 = react.useState({chat = true, commands = true, thoughts = true})
    v2, u29 = react.useState("")
    local u35 = react.useCallback(function(p1, p2) -- Line: 314 -- upvalues: u5 (val), Logs (upval)
        if not u5 then
            return
        end
        Logs.RequestPage.post({category = p1, page = p2})
    end, {u5})
    local u41 = react.useCallback(function(p1) -- Line: 326 -- upvalues: u29 (val), u5 (val), Logs (upval)
        u29(p1)
        if not u5 then
            return
        end
        Logs.Search.post({query = p1})
    end, {u5})
    local u47 = react.useCallback(function(p1) -- Line: 340 -- upvalues: u5 (val), u24 (val)
        if not u5 then
            return
        end
        u24(function(a1) -- Line: 345 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            v1[p1] = not v1[p1]
            return v1
        end)
    end, {u5})
    local v6 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v7 = {}
    local v8 = not (not u3.Logs)
    v7.Visible = v8
    v6.Native = v7
    v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v3(15)),
    })}
    local v9 = {Header = "Search", Placeholder = "Search by username or message...", Width = v3(480), Text = v2}
    local v10 = {}
    local v11 = v3(480)
    v10.Size = UDim2.fromOffset(v11, v3(30))
    v10.Position = UDim2.fromScale(0.5, 0.5)
    v10.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.LayoutOrder = v4()
    v9.Native = v10
    function v9.Update(p1) -- Line: 383 -- upvalues: u41 (val)
        u41(p1)
    end
    v7.SearchBox = react.createElement(Textbox, v9)
    v7.Chat = react.createElement(CategorySection, {
        Title = "Chat",
        Category = "chat",
        Data = v5.chat,
        Expanded = v1.chat,
        OnToggle = function() -- Line: 393 -- upvalues: u47 (val)
            u47("chat")
        end,
        OnPageChange = function(p1) -- Line: 396 -- upvalues: u35 (val)
            u35("chat", p1)
        end,
        LayoutOrder = v4(),
    })
    v7.Commands = react.createElement(CategorySection, {
        Title = "Commands",
        Category = "commands",
        Data = v5.commands,
        Expanded = v1.commands,
        OnToggle = function() -- Line: 408 -- upvalues: u47 (val)
            u47("commands")
        end,
        OnPageChange = function(p1) -- Line: 411 -- upvalues: u35 (val)
            u35("commands", p1)
        end,
        LayoutOrder = v4(),
    })
    v7.Thoughts = react.createElement(CategorySection, {
        Title = "Thoughts",
        Category = "thoughts",
        Data = v5.thoughts,
        Expanded = v1.thoughts,
        OnToggle = function() -- Line: 423 -- upvalues: u47 (val)
            u47("thoughts")
        end,
        OnPageChange = function(p1) -- Line: 426 -- upvalues: u35 (val)
            u35("thoughts", p1)
        end,
        LayoutOrder = v4(),
    })
    return react.createElement(Container, v6, v7)
end)