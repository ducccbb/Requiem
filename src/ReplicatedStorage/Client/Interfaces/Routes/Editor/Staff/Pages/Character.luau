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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Character
--                               Dumped in 0.00291 seconds
--                          Bytecode version 9  |  17 functions

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
local Customization = Common_2:WaitForChild("Customization")
local Extra = require(Customization:WaitForChild("Extra"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Customization_2 = Common_3:WaitForChild("Customization")
local Eyebrows = require(Customization_2:WaitForChild("Eyebrows"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Customization_3 = Common_4:WaitForChild("Customization")
local Eyes = require(Customization_3:WaitForChild("Eyes"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Customization_4 = Common_5:WaitForChild("Customization")
local Mouths = require(Customization_4:WaitForChild("Mouths"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Customization_5 = Common_6:WaitForChild("Customization")
local Pants = require(Customization_5:WaitForChild("Pants"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Customization_6 = Common_7:WaitForChild("Customization")
local Shirts = require(Customization_6:WaitForChild("Shirts"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local CustomizationViewport = require(Universal_3:WaitForChild("CustomizationViewport"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_3 = Components_6:WaitForChild("Editor")
local Universal_4 = Editor_3:WaitForChild("Universal")
local Layouts = Universal_4:WaitForChild("Layouts")
local Divider = require(Layouts:WaitForChild("Divider"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Editor_4 = Components_7:WaitForChild("Editor")
local Universal_5 = Editor_4:WaitForChild("Universal")
local Spacer = require(Universal_5:WaitForChild("Spacer"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Editor_5 = Components_8:WaitForChild("Editor")
local Universal_6 = Editor_5:WaitForChild("Universal")
local Dropdown = require(Universal_6:WaitForChild("Dropdown"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Editor_6 = Components_9:WaitForChild("Editor")
local Universal_7 = Editor_6:WaitForChild("Universal")
local Icon = require(Universal_7:WaitForChild("Icon"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Editor_7 = Components_10:WaitForChild("Editor")
local Universal_8 = Editor_7:WaitForChild("Universal")
local Number = require(Universal_8:WaitForChild("Number"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Editor_8 = Components_11:WaitForChild("Editor")
local Universal_9 = Editor_8:WaitForChild("Universal")
local Slider = require(Universal_9:WaitForChild("Slider"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_12 = Interfaces_12:WaitForChild("Components")
local Editor_9 = Components_12:WaitForChild("Editor")
local Universal_10 = Editor_9:WaitForChild("Universal")
local Text = require(Universal_10:WaitForChild("Text"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks:WaitForChild("useEditorPages"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_13:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_14:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
return react.memo(function() -- Line: 49 -- upvalues: useRem (val), useEditorPages (val), useOrder (val), react (val), Shirts (val), Pants (val), Extra (val), Administration (val), Container (val), CustomizationViewport (val), Number (val), Eyes (val), Mouths (val), Eyebrows (val), Divider (val), Frame (val), Text (val), Slider (val), Spacer (val), Checkbox (val), Dropdown (val), Icon (val), Button (val)
    local u14, u19, u24, u29, u30, u34, u35, u39, u44, u49, u54, u59, u64, u69, u70, u74, u75, u79, u9, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = useRem()
    local v13 = useOrder()
    u9, v9 = react.useState(1)
    u14, v10 = react.useState(1)
    u19, v11 = react.useState(1)
    u24, v1 = react.useState(1)
    u29, u30 = react.useState({R = 255, G = 255, B = 255})
    u34, u35 = react.useState({R = 255, G = 255, B = 255})
    u39, v2 = react.useState("1")
    u44, v3 = react.useState("1")
    u49, v4 = react.useState("1")
    u54, v5 = react.useState("1")
    u59, v6 = react.useState("Rolled White Shirt")
    u64, v7 = react.useState("White Slacks")
    u69, u70 = react.useState(0)
    u74, u75 = react.useState({})
    u79, v8 = react.useState(false)
    react.useEffect(function() -- Line: 73 -- upvalues: u74 (val), u69 (val), u75 (val), u70 (val)
        local v1 = table.clone(u74)
        if table.find(v1, u69) or u69 == 0 then
            return
        end
        table.insert(v1, u69)
        u75(v1)
        u70(0)
    end, {u69, u74})
    local v14 = react.useMemo(function() -- Line: 85 -- upvalues: Shirts (upval)
        local v1 = {}
        for k, v in pairs(Shirts) do
            for k2, i in pairs(v) do
                table.insert(v1, k2)
            end
        end
        return v1
    end)
    local v15 = react.useMemo(function() -- Line: 96 -- upvalues: Pants (upval)
        local v1 = {}
        for k, v in pairs(Pants) do
            for k2, i in pairs(v) do
                table.insert(v1, k2)
            end
        end
        return v1
    end)
    local v16 = react.useMemo(function() -- Line: 107 -- upvalues: Extra (upval)
        local v1 = {}
        for k, v in pairs(Extra.Scars) do
            table.insert(v1, (tostring(k)))
        end
        return v1
    end)
    local v17 = react.useMemo(function() -- Line: 116 -- upvalues: Extra (upval)
        local v1 = {}
        for k, v in pairs(Extra.Burns) do
            table.insert(v1, (tostring(k)))
        end
        return v1
    end)
    local v18 = react.useMemo(function() -- Line: 125 -- upvalues: Extra (upval)
        local v1 = {}
        for k, v in pairs(Extra.Freckles) do
            table.insert(v1, (tostring(k)))
        end
        return v1
    end)
    local v19 = react.useMemo(function() -- Line: 134 -- upvalues: Extra (upval)
        local v1 = {}
        for k, v in pairs(Extra.Moles) do
            table.insert(v1, (tostring(k)))
        end
        return v1
    end)
    local v20 = react.useCallback(function() -- Line: 162 -- upvalues: Administration (upval), u74 (val), u9 (val), u14 (val), u19 (val), u24 (val), u29 (val), u34 (val), u59 (val), u64 (val), u79 (val), u39 (val), u44 (val), u49 (val), u54 (val)
        Administration.Customize.post({
            accessories = u74,
            eyes = u9,
            frame = tonumber(u14) or 1,
            mouth = u19,
            eyebrows = u24,
            eyeColor = u29,
            hairColor = u34,
            shirt = u59,
            pants = u64,
            useHairColor = u79,
            scars = tonumber(u39) or 1,
            burns = tonumber(u44) or 1,
            freckles = tonumber(u49) or 1,
            moles = tonumber(u54) or 1,
        })
    end, {
        u74,
        u9,
        u14,
        u19,
        u24,
        u29,
        u34,
        u59,
        u64,
        u79,
        u39,
        u44,
        u49,
        u54,
    })
    local v21 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v22 = {}
    local v23 = not (not (useEditorPages().Character))
    v22.Visible = v23
    v21.Native = v22
    v22 = {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v12(20)),
        }),
        Character = react.createElement(CustomizationViewport, {
            AccessorySource = "Marketplace",
            Eyes = u9,
            Frame = u14,
            Mouth = u19,
            Eyebrows = u24,
            Shirt = u59,
            Pants = u64,
            Accessories = u74,
            UseHairColor = u79,
            EyeColor = u29,
            HairColor = u34,
            Scars = tonumber(u39) or 1,
            Burns = tonumber(u44) or 1,
            Freckles = tonumber(u49) or 1,
            Moles = tonumber(u54) or 1,
            Native = {LayoutOrder = v13()},
        }),
        Eye = react.createElement(Number, {
            Header = "Eye Selection",
            Default = u9,
            Range = NumberRange.new(1, #Eyes),
            Update = v9,
            Native = {LayoutOrder = v13()},
        }),
        EyeFrames = react.createElement(Number, {
            Header = "Frame Selection",
            Default = 1,
            Range = NumberRange.new(1, #Eyes[u9].Frames),
            Update = v10,
            Native = {LayoutOrder = v13()},
        }),
        Mouth = react.createElement(Number, {
            Header = "Mouth Selection",
            Default = u19,
            Range = NumberRange.new(1, #Mouths.Mouths),
            Update = v11,
            Native = {LayoutOrder = v13()},
        }),
        Eyebrow = react.createElement(Number, {
            Header = "Eyebrow Selection",
            Default = u24,
            Range = NumberRange.new(1, #Eyebrows),
            Update = v1,
            Native = {LayoutOrder = v13()},
        }),
        Divider = react.createElement(Divider, {
            Size = 10,
            Native = {LayoutOrder = v13()},
        }),
    }
    local v24 = {BackgroundTransparency = 1}
    local v25 = v12(300)
    v24.Size = UDim2.fromOffset(v25, 0)
    v24.LayoutOrder = v13()
    v24.AutomaticSize = Enum.AutomaticSize.Y
    v22.Colors = react.createElement(Frame, v24, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }), Eyes = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Label1 = react.createElement(Text, {
            Text = "Eye Color Red",
            Native = {LayoutOrder = v13()},
        }),
        EyeColorR = react.createElement(Slider, {
            Default = u29.R,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 308 -- upvalues: u30 (val), u29 (val)
                u30({R = p1, G = u29.G, B = u29.B})
            end,
            Native = {LayoutOrder = v13()},
        }),
        Label2 = react.createElement(Text, {
            Text = "Eye Color Green",
            Native = {LayoutOrder = v13()},
        }),
        EyeColorG = react.createElement(Slider, {
            Default = u29.G,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 324 -- upvalues: u30 (val), u29 (val)
                u30({R = u29.R, G = p1, B = u29.B})
            end,
            Native = {LayoutOrder = v13()},
        }),
        Label3 = react.createElement(Text, {
            Text = "Eye Color Blue",
            Native = {LayoutOrder = v13()},
        }),
        EyeColorB = react.createElement(Slider, {
            Default = u29.B,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 341 -- upvalues: u30 (val), u29 (val)
                u30({R = u29.R, G = u29.G, B = p1})
            end,
            Native = {LayoutOrder = v13()},
        }),
    }), Spacer = react.createElement(Spacer, {
        Height = 100,
        Width = 1,
        Native = {LayoutOrder = v13()},
    }), Hair = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 4), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4)}),
        Label1 = react.createElement(Text, {
            Text = "Hair Color Red",
            Native = {LayoutOrder = v13()},
        }),
        HairColorR = react.createElement(Slider, {
            Default = u34.R,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 387 -- upvalues: u35 (val), u34 (val)
                u35({R = p1, G = u34.G, B = u34.B})
            end,
            Native = {LayoutOrder = v13()},
        }),
        Label2 = react.createElement(Text, {
            Text = "Hair Color Green",
            Native = {LayoutOrder = v13()},
        }),
        HairColorG = react.createElement(Slider, {
            Default = u34.G,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 403 -- upvalues: u35 (val), u34 (val)
                u35({R = u34.R, G = p1, B = u34.B})
            end,
            Native = {LayoutOrder = v13()},
        }),
        Label3 = react.createElement(Text, {
            Text = "Hair Color Blue",
            Native = {LayoutOrder = v13()},
        }),
        HairColorB = react.createElement(Slider, {
            Default = u34.B,
            Range = NumberRange.new(0, 255),
            Changed = function(p1) -- Line: 420 -- upvalues: u35 (val), u34 (val)
                u35({R = u34.R, G = u34.G, B = p1})
            end,
            Native = {LayoutOrder = v13()},
        }),
    })})
    v22.UseHairColor = react.createElement(Checkbox, {
        Label = "Override Hair Color",
        Default = u79,
        Toggled = v8,
        Native = {LayoutOrder = v13()},
    })
    v24 = {BackgroundTransparency = 1}
    v25 = v12(300)
    v24.Size = UDim2.fromOffset(v25, 0)
    v24.LayoutOrder = v13()
    v24.AutomaticSize = Enum.AutomaticSize.Y
    v22.Features = react.createElement(Frame, v24, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }), Left = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v13(),
    }, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Label = react.createElement(Text, {
            Text = "Scars",
            Native = {LayoutOrder = v13()},
        }),
        Scars = react.createElement(Dropdown, {
            Width = 80,
            Default = u39,
            Options = v16,
            Changed = v2,
            Native = {LayoutOrder = v13()},
        }),
        Label2 = react.createElement(Text, {
            Text = "Burns",
            Native = {LayoutOrder = v13()},
        }),
        Burns = react.createElement(Dropdown, {
            Width = 80,
            Default = u44,
            Options = v17,
            Changed = v3,
            Native = {LayoutOrder = v13()},
        }),
    }), Spacer = react.createElement(Spacer, {
        Height = 100,
        Width = 1,
        Native = {LayoutOrder = v13()},
    }), Right = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v13(),
    }, {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 4), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4)}),
        Label = react.createElement(Text, {
            Text = "Freckles",
            Native = {LayoutOrder = v13()},
        }),
        Freckles = react.createElement(Dropdown, {
            Width = 80,
            Default = u49,
            Options = v18,
            Changed = v4,
            Native = {LayoutOrder = v13()},
        }),
        Label2 = react.createElement(Text, {
            Text = "Moles",
            Native = {LayoutOrder = v13()},
        }),
        Moles = react.createElement(Dropdown, {
            Width = 80,
            Default = u54,
            Options = v19,
            Changed = v5,
            Native = {LayoutOrder = v13()},
        }),
    })})
    v22.Divider3 = react.createElement(Divider, {
        Size = 5,
        Native = {LayoutOrder = v13()},
    })
    v22.Shirt = react.createElement(Dropdown, {
        Header = "Shirt",
        Width = 200,
        Default = u59,
        Options = v14,
        Changed = v6,
        Native = {LayoutOrder = v13()},
    })
    v22.Pants = react.createElement(Dropdown, {
        Header = "Pants",
        Width = 200,
        Default = u64,
        Options = v15,
        Changed = v7,
        Native = {LayoutOrder = v13()},
    })
    v22.Divider4 = react.createElement(Divider, {
        Size = 5,
        Native = {LayoutOrder = v13()},
    })
    v24 = {BackgroundTransparency = 1}
    v25 = v12(300)
    v24.Size = UDim2.fromOffset(v25, 0)
    v24.LayoutOrder = v13()
    v24.AutomaticSize = Enum.AutomaticSize.Y
    local v26 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 15),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }), AddAccessory = react.createElement(Number, {
        Arrows = false,
        Reset = true,
        Header = "Add Accessory",
        Update = u70,
        Native = {LayoutOrder = v13()},
    })}
    local v27 = {
        Image = "rbxassetid://11326877264",
        Clicked = function() -- Line: 619 -- upvalues: u75 (val)
            u75({})
        end,
    }
    local v28 = {LayoutOrder = v13()}
    local v29 = v12(15)
    v28.Size = UDim2.fromOffset(v29, v12(15))
    v27.Native = v28
    v26.Delete = react.createElement(Icon, v27)
    v22.Accessories = react.createElement(Frame, v24, v26)
    v22.Divider5 = react.createElement(Divider, {
        Size = 5,
        Native = {LayoutOrder = v13()},
    })
    v22.Button = react.createElement(Button, {
        Text = "Confirm Outfit",
        Type = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {LayoutOrder = v13()},
        Clicked = v20,
    })
    return react.createElement(Container, v21, v22)
end)