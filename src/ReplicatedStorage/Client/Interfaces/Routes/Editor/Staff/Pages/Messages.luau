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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Messages
--                               Dumped in 0.00366 seconds
--                          Bytecode version 9  |  21 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor = Components_3:WaitForChild("Editor")
local Universal_2 = Editor:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_2 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_3:WaitForChild("Container"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_3 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_3:WaitForChild("Universal")
local Layouts = Universal_4:WaitForChild("Layouts")
local Divider = require(Layouts:WaitForChild("Divider"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_6:WaitForChild("Editor")
local Universal_5 = Editor_4:WaitForChild("Universal")
local Dropdown = require(Universal_5:WaitForChild("Dropdown"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives = Components_7:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Editor_5 = Components_8:WaitForChild("Editor")
local Universal_6 = Editor_5:WaitForChild("Universal")
local Group = require(Universal_6:WaitForChild("Group"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Editor_6 = Components_9:WaitForChild("Editor")
local Universal_7 = Editor_6:WaitForChild("Universal")
local Number = require(Universal_7:WaitForChild("Number"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Primitives_2 = Components_10:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Editor_7 = Components_11:WaitForChild("Editor")
local Universal_8 = Editor_7:WaitForChild("Universal")
local Text = require(Universal_8:WaitForChild("Text"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_12 = Interfaces_12:WaitForChild("Components")
local Editor_8 = Components_12:WaitForChild("Editor")
local Universal_9 = Editor_8:WaitForChild("Universal")
local Textbox = require(Universal_9:WaitForChild("Textbox"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks:WaitForChild("useEditorPages"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_13:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_14:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local map = Table.map
local EnumItems = Enum.Font:GetEnumItems()
local u494 = map(EnumItems, function(p1) -- Line: 53
    return p1.Name
end)
local function TrackItem(p1) -- Line: 59 -- upvalues: useRem (val), useOrder (val), react (val), Text (val), Badge (val), Button (val)
    local u9, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = useOrder()
    v4, u9 = react.useState(false)
    local v8 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if p1.Index % 2 ~= 0 then
        v5 = 0.96
    else
        v5 = 0.99
    end
    v8.BackgroundTransparency = v5
    v8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v8.BorderSizePixel = 0
    local v9 = UDim2.fromScale(1, 0)
    if not p1.Opened then
        v2 = 45
    else
        v2 = 65
    end
    v8.Size = v9 + UDim2.fromOffset(0, v6(v2))
    v8[react.Event.MouseEnter] = function() -- Line: 78 -- upvalues: u9 (val)
        u9(true)
    end
    v8[react.Event.MouseLeave] = function() -- Line: 82 -- upvalues: u9 (val)
        u9(false)
    end
    v8.LayoutOrder = p1.Index
    v5 = {}
    local v10 = {Color = Color3.fromRGB(255, 255, 255)}
    if not v4 then
        v1 = 1
    else
        v1 = 0.8
    end
    v10.Transparency = v1
    v5.Stroke = react.createElement("UIStroke", v10)
    v10 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = ""}
    v10[react.Event.MouseButton1Click] = function() -- Line: 97 -- upvalues: p1 (val)
        p1.Clicked(p1.Item)
    end
    v5.Hitbox = react.createElement("TextButton", v10)
    v10 = {BackgroundTransparency = 1}
    v2 = UDim2.fromScale(1, 0)
    v10.Size = v2 + UDim2.fromOffset(0, v6(30))
    v1 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(3)),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v6(10)), PaddingRight = UDim.new(0, v6(10)), PaddingTop = UDim.new(0, v6(5)), PaddingBottom = UDim.new(0, v6(5))})}
    local v11 = {Bold = true}
    if not p1.Item.isMonologue then
        v3 = "Server Message"
    else
        v3 = "Monologue"
    end
    v11.Text = v3
    v11.Native = {TextTransparency = 0.1, LayoutOrder = v7()}
    v1.Type = react.createElement(Text, v11)
    v1.CustomName = react.createElement(Badge, {
        Ratio = 0.8,
        Text = p1.Item.customName,
        Color = Color3.fromRGB(181, 181, 181),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {Visible = p1.Item.isCustomName, LayoutOrder = v7()},
    })
    v1.Delayed = react.createElement(Badge, {
        Ratio = 0.8,
        Outline = true,
        Text = tostring(p1.Item.delayed or 0) .. "s Delay",
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(139, 139, 139),
        Native = {Visible = p1.Item.isDelayed, LayoutOrder = v7()},
    })
    v5.TextContents = react.createElement("Frame", v10, v1)
    v10 = {Text = p1.Item.message}
    v1 = {LayoutOrder = v7()}
    local v12 = v6(10)
    v1.Position = UDim2.fromOffset(v12, v6(32))
    v1.AnchorPoint = Vector2.new(0, 0.5)
    v1.TextXAlignment = Enum.TextXAlignment.Left
    local EnumItems = Enum.Font:GetEnumItems()
    v1.Font = EnumItems[p1.Item.font]
    v10.Native = v1
    v5.Text = react.createElement(Text, v10)
    v10 = {BackgroundTransparency = 1, ZIndex = 5}
    v2 = UDim2.fromScale(1, 0)
    v10.Size = v2 + UDim2.fromOffset(0, v6(62))
    v10.Visible = p1.Opened
    v10.Position = UDim2.fromScale(0, 1)
    v10.AnchorPoint = Vector2.new(0, 1)
    v5.Buttons = react.createElement("Frame", v10, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v6(10)), PaddingRight = UDim.new(0, v6(10)), PaddingTop = UDim.new(0, v6(5)), PaddingBottom = UDim.new(0, v6(10))}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v6(10)),
    }), Delete = react.createElement(Button, {
        Text = "Delete",
        Type = 4,
        Height = 22,
        Native = {LayoutOrder = v7()},
        Clicked = function() -- Line: 203 -- upvalues: p1 (val)
            p1.Deleted(p1.Item)
        end,
    })})
    return react.createElement("Frame", v8, v5)
end
return react.memo(function() -- Line: 211 -- upvalues: useOrder (val), useRem (val), useEditorPages (val), react (val), u494 (val), Table (val), Administration (val), TrackItem (val), Container (val), Textbox (val), Number (val), Checkbox (val), Divider (val), Dropdown (val), Frame (val), Button (val), Group (val), ScrollingFrame (val)
    local None, None_2, u14, u24, u40, u45, u50, u537, u540, u60, u65, u66, u70, u75, u81, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    local v19 = useOrder()
    local v20 = useRem()
    local v21 = useEditorPages()
    v10, v13 = react.useState("")
    u14, u537 = react.useState(false)
    v17, v18 = react.useState("")
    u24, v1 = react.useState(false)
    u540, v2 = react.useState(u494[4])
    None, None_2 = react.useState("None")
    u40, v3 = react.useState(false)
    u45, v4 = react.useState(0)
    u50, v5 = react.useState(false)
    v6, v7 = react.useState(false)
    u60, v8 = react.useState(false)
    u65, u66 = react.useState({})
    u70, v9 = react.useBinding("")
    u75, v11 = react.useBinding("")
    v12, u81 = react.useState(nil)
    local v22 = react.useCallback(function() -- Line: 243 -- upvalues: u65 (val), u66 (val), Table (upval), u60 (val), Administration (upval)
        local v1
        local v2 = table.clone(u65)
        local v3 = {}
        u66(v3)
        v1 = Table.map(v2, function(p1) -- Line: 247 -- upvalues: u60 (upval)
            local v1
            local v2 = {
                isPrivate = 0,
                private = 0,
                message = p1.message,
                delayed = p1.delayed,
                customName = p1.customName,
            }
            if not p1.isCustomName then
                v1 = 0
            else
                v1 = 1
            end
            v2.isCustomName = v1
            if not p1.isDelayed then
                v1 = 0
            else
                v1 = 1
            end
            v2.isDelayed = v1
            if not p1.isMonologue then
                v1 = 0
            else
                v1 = 1
            end
            v2.isMonologue = v1
            v2.font = p1.font or 4
            if not u60 then
                v1 = 0
            else
                v1 = 1
            end
            v2.character = v1
            v2.effect = p1.effect or "None"
            return v2
        end)
        Administration.Message.post(v1)
    end, {u65})
    local v23 = {
        v17,
        v10,
        u40,
        u24,
        u50,
        u45,
        u540,
        u60,
        None,
    }
    local v24 = react.useCallback(function() -- Line: 280 -- upvalues: u70 (val), u45 (val), u75 (val), u24 (val), u40 (val), u50 (val), u494 (upval), u540 (val), u60 (val), None (val), Administration (upval)
        local v1
        local v2 = {
            currentLanguage = "",
            isPrivate = 0,
            private = 0,
            message = u70:getValue(),
            delayed = u45,
            customName = u75:getValue(),
        }
        if not u24 then
            v1 = 0
        else
            v1 = 1
        end
        v2.isCustomName = v1
        if not u40 then
            v1 = 0
        else
            v1 = 1
        end
        v2.isDelayed = v1
        if not u50 then
            v1 = 0
        else
            v1 = 1
        end
        v2.isMonologue = v1
        v2.font = table.find(u494, u540) or 4
        if not u60 then
            v1 = 0
        else
            v1 = 1
        end
        v2.character = v1
        v2.effect = None
        Administration.Message.post({v2})
    end, v23)
    local v25 = react.useCallback(function() -- Line: 302 -- upvalues: u66 (val), u70 (val), u45 (val), u75 (val), u24 (val), u40 (val), u50 (val), u494 (upval), u540 (val), u60 (val), None (val)
        u66(function(p1) -- Line: 303 -- upvalues: u70 (upval), u45 (upval), u75 (upval), u24 (upval), u40 (upval), u50 (upval), u494 (upval), u540 (upval), u60 (upval), None (upval)
            local v1
            local v2 = table.clone(p1)
            local v3 = {
                message = u70:getValue(),
                delayed = u45,
                customName = u75:getValue(),
                isCustomName = u24,
                isDelayed = u40,
                isMonologue = u50,
                font = table.find(u494, u540) or 4,
            }
            if not u60 then
                v1 = 0
            else
                v1 = 1
            end
            v3.character = v1
            v3.effect = None
            table.insert(v2, v3)
            return v2
        end)
    end, v23)
    local v26 = react.useCallback(function() -- Line: 321 -- upvalues: u66 (val)
        u66({})
    end, {})
    local StarterGui = game:GetService("StarterGui")
    react.useEffect(function() -- Line: 327 -- upvalues: u14 (val), StarterGui (val)
        if not u14 then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
        end
        return function() -- Line: 333 -- upvalues: StarterGui (upval)
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        end
    end, {u14})
    local v27 = {}
    local v28 = u65
    local v29 = nil
    local v30 = nil
    for i, j in v28, v29, v30 do
        v14 = tostring(i)
        v15 = {Item = j, Index = i}
        v16 = v12 == j
        v15.Opened = v16
        function v15.Clicked(p1) -- Line: 346 -- upvalues: u81 (val)
            u81(p1)
        end
        function v15.Deleted(p1) -- Line: 350 -- upvalues: u66 (val), i (val)
            u66(function(p1) -- Line: 351 -- upvalues: i (upval)
                local v1 = table.clone(p1)
                table.remove(v1, i)
                return v1
            end)
        end
        v27[v14] = react.createElement(TrackItem, v15)
    end
    v30 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v31 = {}
    local v32 = not (not v21.Messages)
    v31.Visible = v32
    v30.Native = v31
    v31 = {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v20(20)),
        }),
        CustomName = react.createElement(Textbox, {
            Header = "Custom Name",
            PlaceholderText = "Type Name...",
            Divider = 150,
            Toggleable = {Visible = true, Default = false, Changed = v1},
            Update = v18,
            Changed = v11,
            Native = {LayoutOrder = v19()},
        }),
        CustomDelay = react.createElement(Number, {
            Header = "Custom Delay",
            Default = 0,
            Divider = 150,
            Toggleable = {Visible = true, Default = false, Changed = v3},
            Update = v4,
            Native = {LayoutOrder = v19()},
        }),
        ShowCharacter = react.createElement(Checkbox, {
            Label = "Show Character",
            Default = false,
            Toggled = v8,
            Native = {LayoutOrder = v19()},
        }),
        UseMonologue = react.createElement(Checkbox, {
            Label = "Monologue Message",
            Default = false,
            Toggled = v5,
            Native = {LayoutOrder = v19()},
        }),
        Divider = react.createElement(Divider, {
            Size = 5,
            Native = {LayoutOrder = v19()},
        }),
        Effect = react.createElement(Dropdown, {
            Header = "Effect",
            Divider = 70,
            Width = 175,
            Options = {
                "None",
                "Wobble",
                "Shake",
                "Rise",
                "Radio",
                "Zalgo",
            },
            Default = None,
            Changed = None_2,
            Native = {ZIndex = 3, LayoutOrder = v19()},
        }),
        Font = react.createElement(Dropdown, {
            Header = "Font Face",
            Divider = 70,
            Width = 175,
            Options = u494,
            Default = u540,
            Changed = v2,
            Native = {LayoutOrder = v19()},
        }),
    }
    local v33 = {BackgroundTransparency = 0.95}
    v15 = v20(300)
    v33.Size = UDim2.fromOffset(v15, v20(80))
    v33.LayoutOrder = v19()
    v33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v31.FontPreview = react.createElement(Frame, v33, {Stroke = react.createElement("UIStroke", {Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 2)}), Text = react.createElement("TextLabel", {
        Text = "This is an example text.",
        BackgroundTransparency = 1,
        TextSize = 20,
        Font = u540,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
    })})
    v31.Divider2 = react.createElement(Divider, {
        Size = 5,
        Native = {LayoutOrder = v19()},
    })
    v31.Message = react.createElement(Textbox, {
        Header = "Message Box",
        PlaceholderText = "Type your server message...",
        Large = true,
        Divider = 150,
        Update = v13,
        Changed = v9,
        OnFocused = function() -- Line: 504 -- upvalues: u537 (val)
            u537(true)
        end,
        OnFocusLost = function() -- Line: 507 -- upvalues: u537 (val)
            u537(false)
        end,
        Native = {LayoutOrder = v19()},
    })
    v31.Send = react.createElement(Button, {
        Text = "Send",
        Type = 1,
        Height = 22,
        TextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = v19()},
        Clicked = v24,
    })
    v31.Divider3 = react.createElement(Divider, {
        Size = 1,
        Native = {LayoutOrder = v19()},
    })
    v31.UseTrack = react.createElement(Checkbox, {
        Label = "Use Message Track",
        Default = false,
        Native = {LayoutOrder = v19()},
        Toggled = v7,
    })
    v33 = {
        Header = "Message Track",
        Native = {Visible = v6, LayoutOrder = v19()},
    }
    local v34 = {}
    local v35 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v36 = v20(500)
    v35.Size = UDim2.fromOffset(v36, v20(250))
    v34.Scrolling = react.createElement(ScrollingFrame, v35, {List = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}, v27)
    v31.Group = react.createElement(Group, v33, v34)
    v31.TrackButtons = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        LayoutOrder = v19(),
        Visible = v6,
    }, {UIListLayout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    }), SendTrack = react.createElement(Button, {
        Text = "Send Track",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Native = {LayoutOrder = v19()},
        Clicked = v22,
    }), AddToTrack = react.createElement(Button, {
        Text = "Add to Track",
        Type = 1,
        Height = 22,
        TextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = v19()},
        Clicked = v25,
    }), ResetTrack = react.createElement(Button, {
        Text = "Reset Track",
        Type = 4,
        Height = 22,
        Clicked = v26,
        Native = {LayoutOrder = v19()},
    })})
    return react.createElement(Container, v30, v31)
end)