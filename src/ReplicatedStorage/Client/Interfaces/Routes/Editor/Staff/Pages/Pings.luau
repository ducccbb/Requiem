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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Pings
--                               Dumped in 0.00312 seconds
--                          Bytecode version 9  |  27 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Pings = require(Namespaces_2:WaitForChild("Pings"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientTeleportHandler = require(Miscellaneous:WaitForChild("ClientTeleportHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Group = require(Universal_2:WaitForChild("Group"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Text = require(Universal_3:WaitForChild("Text"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Textbox = require(Universal_4:WaitForChild("Textbox"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks_2:WaitForChild("useEditorPages"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useInputPopup = require(Hooks_3:WaitForChild("useInputPopup"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_4:WaitForChild("useOrder"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_11:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_10:WaitForChild("Hooks")
local useStore = require(Hooks_6:WaitForChild("useStore"))
local function PingEntry(p1) -- Line: 70 -- upvalues: useRem (val), useOrder (val), react (val), Pings (val), Players (val), Alive (val), ClientTeleportHandler (val), useInputPopup (val), Administration (val), Text (val), Button (val)
    local u9, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useOrder()
    v4, u9 = react.useState(false)
    local v7 = react.useMemo(function() -- Line: 82 -- upvalues: p1 (val)
        return os.date("%H:%M:%S", p1.Ping.timestamp)
    end, {p1.Ping.timestamp})
    local u24 = react.useCallback(function() -- Line: 86 -- upvalues: Pings (upval), p1 (val)
        Pings.DeletePing.post({id = p1.Ping.id, category = p1.Category})
    end, {p1.Ping.id, p1.Category})
    local v8 = react.useCallback(function() -- Line: 93 -- upvalues: p1 (val), Players (upval), Alive (upval), ClientTeleportHandler (upval)
        local PlayerByUserId = Players:GetPlayerByUserId(p1.Ping.userid)
        if not PlayerByUserId then
            return
        end
        local v1 = Alive.getAliveCharacter(PlayerByUserId)
        if not v1 or not v1.PrimaryPart then
            return
        end
        ClientTeleportHandler.onTeleportClient(v1.PrimaryPart.CFrame)
    end, {p1.Ping.userid})
    local u34 = useInputPopup(function(a1) -- Line: 108 -- upvalues: Administration (upval), p1 (val), u24 (val)
        if not a1 then
            return
        end
        Administration.Message.post({
            {
                isDelayed = 0,
                delayed = 0,
                isCustomName = 0,
                customName = "",
                isMonologue = 0,
                font = 4,
                character = 0,
                isPrivate = 1,
                effect = "None",
                message = a1,
                private = p1.Ping.userid,
            },
        })
        u24()
    end)
    local v9 = react.useCallback(function() -- Line: 138 -- upvalues: u34 (val), p1 (val)
        u34("Reply to " .. p1.Ping.username, "Enter a message to send to " .. p1.Ping.username .. ".", "Message")
    end, {p1.Ping.username, u34})
    local v10 = react.useCallback(function() -- Line: 146 -- upvalues: Pings (upval), p1 (val)
        Pings.Respawn.post({userid = p1.Ping.userid})
    end, {p1.Ping.userid})
    local v11 = react.useCallback(u24, {u24})
    local v12 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if p1.Index % 2 ~= 0 then
        v1 = 0.96
    else
        v1 = 0.99
    end
    v12.BackgroundTransparency = v1
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v12.BorderSizePixel = 0
    local v13 = UDim2.fromScale(1, 0)
    if not p1.Opened then
        v3 = 40
    else
        v3 = 70
    end
    v12.Size = v13 + UDim2.fromOffset(0, v5(v3))
    v12[react.Event.MouseEnter] = function() -- Line: 161 -- upvalues: u9 (val)
        u9(true)
    end
    v12[react.Event.MouseLeave] = function() -- Line: 165 -- upvalues: u9 (val)
        u9(false)
    end
    v12.LayoutOrder = p1.Index
    v1 = {}
    local v14 = {Color = Color3.fromRGB(255, 255, 255)}
    if not v4 then
        v2 = 1
    else
        v2 = 0.8
    end
    v14.Transparency = v2
    v1.Stroke = react.createElement("UIStroke", v14)
    v14 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = ""}
    v14[react.Event.MouseButton1Click] = function() -- Line: 180 -- upvalues: p1 (val)
        p1.Clicked(p1.Ping)
    end
    v1.Hitbox = react.createElement("TextButton", v14)
    v14 = {BackgroundTransparency = 1}
    v3 = UDim2.fromScale(1, 0)
    v14.Size = v3 + UDim2.fromOffset(0, v5(30))
    v2 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(5)),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(10)), PaddingRight = UDim.new(0, v5(10)), PaddingTop = UDim.new(0, v5(5)), PaddingBottom = UDim.new(0, v5(5))}), Time = react.createElement(Text, {
        Text = v7,
        Native = {TextTransparency = 0.4, LayoutOrder = 1, TextColor3 = Color3.fromRGB(150, 150, 150)},
    }), Username = react.createElement(Text, {
        Bold = true,
        Text = p1.Ping.username,
        Native = {TextTransparency = 0.1, LayoutOrder = 2, TextColor3 = Color3.fromRGB(28, 176, 255)},
    })}
    local v15 = {
        Text = p1.Ping.message,
        Native = {TextTransparency = 0.2, BackgroundTransparency = 1, LayoutOrder = 3, TextTruncate = Enum.TextTruncate.AtEnd},
    }
    local v16 = {}
    local v17 = {}
    local v18 = v5(350)
    v17.MaxSize = Vector2.new(v18, v5(250))
    v16.UiSizeConstraint = react.createElement("UISizeConstraint", v17)
    v2.Message = react.createElement(Text, v15, v16)
    v1.TextContents = react.createElement("Frame", v14, v2)
    v14 = {BackgroundTransparency = 1, ZIndex = 5}
    v3 = UDim2.fromScale(1, 0)
    v14.Size = v3 + UDim2.fromOffset(0, v5(30))
    v14.Visible = p1.Opened
    v14.Position = UDim2.fromScale(0, 1)
    v14.AnchorPoint = Vector2.new(0, 1)
    v1.Buttons = react.createElement("Frame", v14, {
        Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(10)), PaddingRight = UDim.new(0, v5(10)), PaddingTop = UDim.new(0, v5(5)), PaddingBottom = UDim.new(0, v5(10))}),
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v5(10)),
        }),
        Goto = react.createElement(Button, {
            Text = "Goto",
            Type = 3,
            Height = 22,
            Outline = Color3.fromRGB(179, 179, 179),
            TextColor = Color3.fromRGB(200, 200, 200),
            Native = {LayoutOrder = v6()},
            Clicked = v8,
        }),
        Reply = react.createElement(Button, {
            Text = "Reply",
            Type = 3,
            Height = 22,
            Outline = Color3.fromRGB(179, 179, 179),
            TextColor = Color3.fromRGB(200, 200, 200),
            Native = {LayoutOrder = v6()},
            Clicked = v9,
        }),
        Respawn = react.createElement(Button, {
            Text = "Respawn",
            Type = 3,
            Height = 22,
            Outline = Color3.fromRGB(179, 179, 179),
            TextColor = Color3.fromRGB(200, 200, 200),
            Native = {LayoutOrder = v6()},
            Clicked = v10,
        }),
        Ignore = react.createElement(Button, {
            Text = "Solve",
            Type = 1,
            Height = 22,
            TextColor = Color3.fromRGB(0, 0, 0),
            Color = Color3.fromRGB(255, 255, 255),
            Native = {LayoutOrder = v6()},
            Clicked = v11,
        }),
    })
    return react.createElement("Frame", v12, v1)
end
local function CategorySection(p1) -- Line: 320 -- upvalues: useRem (val), useOrder (val), react (val), PingEntry (val), Group (val), ScrollingFrame (val), Button (val), Text (val)
    local u9, v1, v2, v3, v4
    local v5 = useRem()
    local v6 = useOrder()
    v4, u9 = react.useState(nil)
    local v7 = {}
    local pings = p1.Data.pings
    local v8 = nil
    local v9 = nil
    local u251 = p1
    for i, j in pings, v8, v9 do
        v1 = tostring(j.id)
        v2 = {Ping = j, Index = i, Category = u251.Category}
        v3 = v4 == j
        v2.Opened = v3
        function v2.Clicked(p1) -- Line: 342 -- upvalues: u9 (val)
            u9(p1)
        end
        v7[v1] = react.createElement(PingEntry, v2)
    end
    v9 = {
        Collapsible = true,
        Header = u251.Title .. " (" .. u251.Data.totalPings .. ")",
        Collapsed = not u251.Expanded,
        OnToggle = u251.OnToggle,
        Native = {LayoutOrder = u251.LayoutOrder},
    }
    local v10 = {}
    local v11 = {BackgroundTransparency = 1}
    v2 = v5(500)
    v11.Size = UDim2.fromOffset(v2, v5(280))
    local v12 = {}
    local v13 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v14 = v5(500)
    v13.Size = UDim2.fromOffset(v14, v5(250))
    v12.Scroll = react.createElement(ScrollingFrame, v13, {List = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}, v7)
    v13 = {BackgroundTransparency = 1}
    v14 = UDim2.fromScale(1, 0)
    v13.Size = v14 + UDim2.fromOffset(0, v5(30))
    v13.Position = UDim2.fromScale(0, 1)
    v13.AnchorPoint = Vector2.new(0, 1)
    local v15 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(10)),
    })}
    local v16 = {
        Text = "Previous",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    local v17 = {LayoutOrder = v6()}
    local v18 = 1 < u251.Data.page
    v17.Visible = v18
    v16.Native = v17
    function v16.Clicked() -- Line: 400 -- upvalues: u251 (val)
        u251.OnPageChange(u251.Data.page - 1)
    end
    v15.Previous = react.createElement(Button, v16)
    v15.PageInfo = react.createElement(Text, {
        Text = "Page " .. u251.Data.page .. " / " .. u251.Data.totalPages,
        Native = {TextTransparency = 0.3, LayoutOrder = v6()},
    })
    v16 = {
        Text = "Next",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    v17 = {LayoutOrder = v6()}
    v18 = u251.Data.page < u251.Data.totalPages
    v17.Visible = v18
    v16.Native = v17
    function v16.Clicked() -- Line: 423 -- upvalues: u251 (val)
        u251.OnPageChange(u251.Data.page + 1)
    end
    v15.Next = react.createElement(Button, v16)
    v12.Pagination = react.createElement("Frame", v13, v15)
    v10.Content = react.createElement("Frame", v11, v12)
    return react.createElement(Group, v9, v10)
end
return react.memo(function() -- Line: 432 -- upvalues: useRem (val), useEditorPages (val), useEditorEnabled (val), useOrder (val), useStore (val), Pings (val), react (val), Container (val), Textbox (val), CategorySection (val)
    local u24, u29, v1, v2
    local v3 = useRem()
    local u3 = useEditorPages()
    local u5 = useEditorEnabled()
    local v4 = useOrder()
    local v5 = useStore(Pings.Store, function(p1) -- Line: 440
        return p1
    end)
    react.useEffect(function() -- Line: 445 -- upvalues: u3 (val), Pings (upval), u5 (val)
        local v1 = u3.Pings == true
        Pings.UpdatePageState.post({pingsPageOpen = v1, editorEnabled = u5})
        if v1 and u5 then
            Pings.RequestPage.post({category = "pings", page = 1})
            Pings.RequestPage.post({category = "actions", page = 1})
        end
    end, {u3.Pings, u5})
    v1, u24 = react.useState({pings = true, actions = true})
    v2, u29 = react.useState("")
    local u35 = react.useCallback(function(p1, p2) -- Line: 471 -- upvalues: u5 (val), Pings (upval)
        if not u5 then
            return
        end
        Pings.RequestPage.post({category = p1, page = p2})
    end, {u5})
    local u41 = react.useCallback(function(p1) -- Line: 483 -- upvalues: u29 (val), u5 (val), Pings (upval)
        u29(p1)
        if not u5 then
            return
        end
        Pings.Search.post({query = p1})
    end, {u5})
    local u47 = react.useCallback(function(p1) -- Line: 497 -- upvalues: u5 (val), u24 (val)
        if not u5 then
            return
        end
        u24(function(a1) -- Line: 502 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            v1[p1] = not v1[p1]
            return v1
        end)
    end, {u5})
    local v6 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v7 = {}
    local v8 = not (not u3.Pings)
    v7.Visible = v8
    v6.Native = v7
    v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v3(15)),
    })}
    local v9 = {Header = "Search", Placeholder = "Search by username, message, or userid...", Width = v3(480), Text = v2}
    local v10 = {}
    local v11 = v3(480)
    v10.Size = UDim2.fromOffset(v11, v3(30))
    v10.Position = UDim2.fromScale(0.5, 0.5)
    v10.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.LayoutOrder = v4()
    v9.Native = v10
    function v9.Update(p1) -- Line: 543 -- upvalues: u41 (val)
        u41(p1)
    end
    v7.SearchBox = react.createElement(Textbox, v9)
    v7.Pings = react.createElement(CategorySection, {
        Title = "Pings",
        Category = "pings",
        Data = v5.pings,
        Expanded = v1.pings,
        OnToggle = function() -- Line: 553 -- upvalues: u47 (val)
            u47("pings")
        end,
        OnPageChange = function(p1) -- Line: 556 -- upvalues: u35 (val)
            u35("pings", p1)
        end,
        LayoutOrder = v4(),
    })
    v7.Actions = react.createElement(CategorySection, {
        Title = "Actions",
        Category = "actions",
        Data = v5.actions,
        Expanded = v1.actions,
        OnToggle = function() -- Line: 568 -- upvalues: u47 (val)
            u47("actions")
        end,
        OnPageChange = function(p1) -- Line: 571 -- upvalues: u35 (val)
            u35("actions", p1)
        end,
        LayoutOrder = v4(),
    })
    return react.createElement(Container, v6, v7)
end)