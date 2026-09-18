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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Spawner.Titan
--                               Dumped in 0.00464 seconds
--                          Bytecode version 9  |  40 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Administration_2 = require(Namespaces_2:WaitForChild("Administration"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local Types = Titans:WaitForChild("Types")
local Default = Types:WaitForChild("Default")
local DefaultTitanClient = require(Default:WaitForChild("DefaultTitanClient"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local Editor = User:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local UserPlacementHandler = require(Universal:WaitForChild("UserPlacementHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Administration_3 = Common_3:WaitForChild("Administration")
local Permissions = require(Administration_3:WaitForChild("Permissions"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Types_2 = Common_4:WaitForChild("Types")
local Titan = require(Types_2:WaitForChild("Titan"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client_3:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor_2 = Components:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_4:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_3 = Components_2:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Layouts = Universal_3:WaitForChild("Layouts")
local Divider = require(Layouts:WaitForChild("Divider"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_5:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_6:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_4 = Components_4:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Checkbox = require(Universal_4:WaitForChild("Checkbox"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_7:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_5 = Components_5:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Dropdown = require(Universal_5:WaitForChild("Dropdown"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_8:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_6 = Components_6:WaitForChild("Editor")
local Universal_6 = Editor_6:WaitForChild("Universal")
local Group = require(Universal_6:WaitForChild("Group"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_9:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Editor_7 = Components_7:WaitForChild("Editor")
local Universal_7 = Editor_7:WaitForChild("Universal")
local Slider = require(Universal_7:WaitForChild("Slider"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_8 = Client_10:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Editor_8 = Components_8:WaitForChild("Editor")
local Universal_8 = Editor_8:WaitForChild("Universal")
local Icon = require(Universal_8:WaitForChild("Icon"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_9 = Client_11:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_2 = Components_9:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_10 = Client_12:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Editor_9 = Components_10:WaitForChild("Editor")
local Universal_9 = Editor_9:WaitForChild("Universal")
local Text = require(Universal_9:WaitForChild("Text"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_11 = Client_13:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Inputs = Components_11:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks_2:WaitForChild("useEditorTools"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_12 = Client_14:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_13 = Client_15:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_14 = Client_16:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_14:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local function Spawner(p1) -- Line: 61 -- upvalues: useOrder (val), useRem (val), useEditorTools (val), useEditorEnabled (val), react (val), useStore (val), Administration (val), Permissions (val), Administration_2 (val), UserPlacementHandler (val), Container (val), Dropdown (val), Divider (val), Slider (val), Checkbox (val), Group (val), ScrollingFrame (val)
    local Default, Default_2, u17, u18, u22, u23, u27, v1
    local v2 = useOrder()
    local v3 = useRem()
    local u6 = useEditorTools()
    local u8 = useEditorEnabled()
    Default, Default_2 = react.useState("Default")
    u17, u18 = react.useState(50)
    u22, u23 = react.useBinding(5000)
    u27, v1 = react.useState(false)
    local u32 = react.useRef({anger = 50, scaredness = 50, selfishness = 50, interest = 50})
    local v4 = useStore(Administration.Store, function(p1) -- Line: 80
        return p1
    end)
    local u44 = v4
    if u44 then
        u44 = Permissions.Roles.Writer <= v4.permission
    end
    local v5 = react.useMemo(function() -- Line: 86 -- upvalues: u44 (val)
        local v1 = {"Default"}
        if u44 then
            table.insert(v1, 2, "Clicker")
            table.insert(v1, 3, "Ice")
            table.insert(v1, 4, "Abnormal")
            table.insert(v1, 5, "Sprinter")
        end
        return v1
    end, {u44})
    local u65 = react.useCallback(function(p1) -- Line: 99 -- upvalues: Administration_2 (upval), Default (val), u17 (val), u22 (val), u27 (val), u32 (val), UserPlacementHandler (upval)
        local Pivot = p1:GetPivot()
        local v1 = u22:getValue()
        Administration_2.Titan.unreliablePost(Pivot, Default, u17, v1, u27, u32.current)
        UserPlacementHandler.onSuccessfulPlacement()
    end, {Default, u17, u22, u27})
    local v6 = {}
    local v7 = if u6 == "Titan" then u8 else false
    v6[1] = v7
    v6[2] = Default
    v6[3] = p1.Visible
    react.useEffect(function() -- Line: 113 -- upvalues: u8 (val), u6 (val), p1 (val), UserPlacementHandler (upval), Default (val), u65 (val)
        if not u8 or u6 ~= "Titan" or not p1.Visible then
            return
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeLookAt)
        local v1 = UserPlacementHandler.getModelFromAssets("Spawners/Titan")
        if not v1 then
            return warn((("Could not find model for variant %*"):format(Default)))
        end
        local u28 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(u65)
        return function() -- Line: 130 -- upvalues: UserPlacementHandler (upval), u28 (val)
            UserPlacementHandler.onEndModelPlacement()
            u28:Disconnect()
        end
    end, v6)
    local u90 = react.useCallback(function(p1, p2) -- Line: 136 -- upvalues: u32 (val)
        u32.current[p1] = p2
    end, {u32.current})
    v7 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.1, 0.5),
        Native = {Visible = p1.Visible},
    }
    local v8 = {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v3(20)),
        }),
        Variant = react.createElement(Dropdown, {
            Header = "Variant",
            Default = "Default",
            Divider = 150,
            Options = v5,
            Changed = function(p1) -- Line: 165 -- upvalues: Default_2 (val)
                Default_2(p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Divider = react.createElement(Divider, {
            Size = 5,
            Native = {LayoutOrder = v2()},
        }),
        Slider = react.createElement(Slider, {
            Header = "Difficulty",
            Default = 50,
            Divider = 110,
            Range = NumberRange.new(0, 100),
            Native = {LayoutOrder = v2()},
        }),
        Size = react.createElement(Slider, {
            Header = "Size",
            Default = 50,
            Divider = 110,
            Range = NumberRange.new(0, 100),
            Changed = function(p1) -- Line: 195 -- upvalues: u18 (val)
                u18(p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Range = react.createElement(Slider, {
            Header = "Range",
            Default = 5000,
            Divider = 110,
            Range = NumberRange.new(0, 50000),
            Changed = function(p1) -- Line: 209 -- upvalues: u23 (val)
                u23(p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Divider2 = react.createElement(Divider, {
            Size = 5,
            Native = {LayoutOrder = v2()},
        }),
        UseCustomAttributes = react.createElement(Checkbox, {
            Label = "Override Custom Attributes",
            Default = false,
            Native = {LayoutOrder = v2()},
            Toggled = v1,
        }),
    }
    local v9 = {
        Header = "Custom Attributes",
        Native = {Visible = u27, LayoutOrder = v2()},
    }
    local v10 = {}
    local v11 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v12 = v3(300)
    v11.Size = UDim2.fromOffset(v12, v3(120))
    v10.Scrolling = react.createElement(ScrollingFrame, v11, {
        List = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 5),
        }),
        Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)}),
        Anger = react.createElement(Slider, {
            Header = "Anger Levels",
            Default = 50,
            Divider = 130,
            Range = NumberRange.new(0, 100),
            Changed = function(p1) -- Line: 265 -- upvalues: u90 (val)
                u90("anger", p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Scaredness = react.createElement(Slider, {
            Header = "Scaredness Levels",
            Default = 50,
            Divider = 130,
            Range = NumberRange.new(0, 100),
            Changed = function(p1) -- Line: 279 -- upvalues: u90 (val)
                u90("scaredness", p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Selfishness = react.createElement(Slider, {
            Header = "Selfishness Levels",
            Default = 50,
            Divider = 130,
            Range = NumberRange.new(0, 100),
            Changed = function(p1) -- Line: 293 -- upvalues: u90 (val)
                u90("selfishness", p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
        Interest = react.createElement(Slider, {
            Header = "Interest Levels",
            Default = 50,
            Divider = 130,
            Range = NumberRange.new(0, 100),
            Changed = function(p1) -- Line: 307 -- upvalues: u90 (val)
                u90("interest", p1)
            end,
            Native = {LayoutOrder = v2()},
        }),
    })
    v8.Group = react.createElement(Group, v9, v10)
    return react.createElement(Container, v7, v8)
end
local function Point(p1) -- Line: 318 -- upvalues: useRem (val), useOrder (val), react (val), Text (val), Button (val), Administration_2 (val)
    local u9, v1, v2, v3
    local v4 = useRem()
    local v5 = useOrder()
    v2, u9 = react.useState(false)
    local v6 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if p1.Index % 2 ~= 0 then
        v3 = 0.96
    else
        v3 = 0.99
    end
    v6.BackgroundTransparency = v3
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v6.BorderSizePixel = 0
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, v4(30))
    v6[react.Event.MouseEnter] = function() -- Line: 331 -- upvalues: u9 (val)
        u9(true)
    end
    v6[react.Event.MouseLeave] = function() -- Line: 335 -- upvalues: u9 (val)
        u9(false)
    end
    v6.LayoutOrder = p1.Index
    v3 = {}
    local v8 = {Color = Color3.fromRGB(255, 255, 255)}
    if not v2 then
        v1 = 1
    else
        v1 = 0.8
    end
    v8.Transparency = v1
    v3.Stroke = react.createElement("UIStroke", v8)
    v8 = {BackgroundTransparency = 1}
    local v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, v4(20))
    v3.TextContents = react.createElement("Frame", v8, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(3)),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v4(10)), PaddingRight = UDim.new(0, v4(10)), PaddingTop = UDim.new(0, v4(5)), PaddingBottom = UDim.new(0, v4(5))}), Type = react.createElement(Text, {
        Text = "Goal Point",
        Bold = true,
        Native = {TextTransparency = 0.1, LayoutOrder = v5()},
    })})
    v8 = {BackgroundTransparency = 1, Visible = true, ZIndex = 5}
    v9 = UDim2.fromScale(1, 0)
    v8.Size = v9 + UDim2.fromOffset(0, v4(30))
    v8.Position = UDim2.fromScale(0, 1)
    v8.AnchorPoint = Vector2.new(0, 1)
    v3.Buttons = react.createElement("Frame", v8, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v4(10)), PaddingRight = UDim.new(0, v4(10)), PaddingTop = UDim.new(0, v4(5)), PaddingBottom = UDim.new(0, v4(10))}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(10)),
    }), Delete = react.createElement(Button, {
        Text = "Delete",
        Type = 4,
        Height = 22,
        Native = {LayoutOrder = v5()},
        Clicked = function() -- Line: 407 -- upvalues: Administration_2 (upval), p1 (val)
            Administration_2.Goal.unreliablePost(p1.Part)
        end,
    })})
    return react.createElement("Frame", v6, v3)
end
local function Control(p1) -- Line: 415 -- upvalues: useRem (val), useOrder (val), react (val), DefaultTitanClient (val), Administration_2 (val), UserPlacementHandler (val), Titan (val), RunService (val), UserInputService (val), Players (val), Point (val), Container (val), Dropdown (val), Button (val), Group (val), ScrollingFrame (val)
    local Visible, u14, u18, u19, u28, u8, u9, v1, v2, v3
    local v4 = useRem()
    local v5 = useOrder()
    u8, u9 = react.useState(false)
    local v6 = {}
    v3, u14 = react.useState(v6)
    u18, u19 = react.useState(nil)
    local v7 = react.useMemo(function() -- Line: 423 -- upvalues: DefaultTitanClient (upval)
        return DefaultTitanClient.getAllActionNames()
    end, {})
    u28, v1 = react.useState(v7[1])
    react.useEffect(function() -- Line: 429 -- upvalues: p1 (val), u8 (val), Administration_2 (upval), UserPlacementHandler (upval)
        if not p1.Visible or not u8 then
            return
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeSphere)
        local v1 = UserPlacementHandler.getModelFromAssets("Spawners/Titan")
        if not v1 then
            return warn("Could not find model for goal point")
        end
        local u24 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(function(p1) -- Line: 436 -- upvalues: Administration_2 (upval)
            Administration_2.Goal.post(p1:GetPivot())
        end)
        return function() -- Line: 452 -- upvalues: UserPlacementHandler (upval), u24 (val)
            UserPlacementHandler.onEndModelPlacement()
            u24:Disconnect()
        end
    end, {u8, p1.Visible})
    react.useEffect(function() -- Line: 458 -- upvalues: p1 (val), Titan (upval), u14 (val)
        if not p1.Visible then
            return
        end
        local u4 = Titan.getTitanGoals()
        local function onRegisterGoalPart(p1) -- Line: 468 -- upvalues: u4 (val), u14 (upval)
            if not (p1:IsA("BasePart")) then
                return
            end
            p1.Transparency = 0
            local Children = u4:GetChildren()
            u14(Children)
        end
        local u11 = u4.ChildAdded:Connect(onRegisterGoalPart)
        local u16 = u4.ChildRemoved:Connect(function(p1) -- Line: 481 -- upvalues: u4 (val), u14 (upval)
            if not (p1:IsA("BasePart")) then
                return
            end
            local Children = u4:GetChildren()
            u14(Children)
        end)
        for i, j in u4:GetChildren() do
            onRegisterGoalPart(j)
        end
        return function() -- Line: 498 -- upvalues: u11 (val), u16 (val), u4 (val)
            u11:Disconnect()
            u16:Disconnect()
            for i, j in u4:GetChildren() do
                if j:IsA("BasePart") then
                    j.Transparency = 1
                end
            end
        end
    end, {p1.Visible})
    react.useEffect(function() -- Line: 514 -- upvalues: p1 (val), RunService (upval), Titan (upval), UserInputService (upval), Players (upval), u19 (val), Administration_2 (upval)
        local getRootFromInstance
        if not p1.Visible then
            return
        end
        local u2 = nil
        local u3 = nil
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 0
        Highlight.OutlineColor = Color3.fromRGB(125, 197, 255)
        local Highlight_2 = Instance.new("Highlight")
        Highlight_2.FillTransparency = 1
        Highlight_2.OutlineTransparency = 0
        Highlight_2.OutlineColor = Color3.fromRGB(25, 153, 255)
        function getRootFromInstance(p1) -- Line: 539 -- upvalues: getRootFromInstance (val)
            if p1:FindFirstChild("HumanoidRootPart") then
                return p1
            end
            if not p1.Parent then
                return nil
            end
            return getRootFromInstance(p1.Parent)
        end
        local u30 = RunService.RenderStepped:Connect(function() -- Line: 551 -- upvalues: Titan (upval), UserInputService (upval), getRootFromInstance (val), u2 (ref), u3 (ref), Highlight (val)
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Include
            v1.FilterDescendantsInstances = {(Titan.getTitanFolder())}
            local MouseLocation = UserInputService:GetMouseLocation()
            local v2 = workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
            local v3 = workspace:Raycast(v2.Origin, v2.Direction * 50000, v1)
            local v4 = v3
            if v4 then
                v4 = getRootFromInstance(v3.Instance)
            end
            if v4 ~= u2 then
                if u2 and u2 ~= u3 then
                    Highlight.Parent = nil
                    Highlight.Adornee = nil
                end
                u2 = v4
                if u2 and u2 ~= u3 then
                    Highlight.Parent = u2
                    Highlight.Adornee = u2
                end
            end
        end)
        local u36 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 586 -- upvalues: Players (upval), UserInputService (upval), u3 (ref), Highlight_2 (val), u19 (upval), Administration_2 (upval), u2 (ref), Highlight (val)
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v1 = Players.LocalPlayer.PlayerGui:GetGuiObjectsAtPosition(p1.Position.X, p1.Position.Y)
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.Name == "Controlling" then
                    return
                end
            end
            v1 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
            if v1 then
                if v1 and u3 then
                    Administration_2.Goal.unreliablePost(u3, Players.LocalPlayer:GetMouse().Hit.Position)
                end
                return
            end
            if u3 then
                Highlight_2.Parent = nil
                Highlight_2.Adornee = nil
                u19(nil)
                Administration_2.Selected.unreliablePost(nil)
            end
            if not u2 then
                u3 = nil
                u19(nil)
                Administration_2.Selected.unreliablePost(nil)
                return
            end
            u3 = u2
            Highlight_2.Parent = u3
            Highlight_2.Adornee = u3
            Administration_2.Selected.unreliablePost((tonumber(u2.Name)))
            u19(u3)
            if Highlight.Adornee ~= u3 then
                return
            end
            Highlight.Parent = nil
            Highlight.Adornee = nil
        end)
        return function() -- Line: 641 -- upvalues: u30 (val), u36 (val), Highlight (val), Highlight_2 (val), u19 (upval), Administration_2 (upval)
            u30:Disconnect()
            u36:Disconnect()
            Highlight:Destroy()
            Highlight_2:Destroy()
            u19(nil)
            Administration_2.Selected.unreliablePost(nil)
        end
    end, {p1.Visible})
    local v8 = {}
    local v9 = #v3
    local v10 = 1
    for i = 1, v9, v10 do
        v2 = tostring(i)
        v8[v2] = react.createElement(Point, {Index = i, Part = v3[i]})
    end
    v2 = {}
    local v11 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.2)}
    local v12 = {}
    Visible = p1.Visible
    if Visible then
        Visible = u18 ~= nil
    end
    v12.Visible = Visible
    v11.Native = v12
    v12 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(20)),
    }), Variant = react.createElement(Dropdown, {
        Header = "Actions",
        Width = 180,
        Divider = 150,
        Default = v7[1],
        Options = v7,
        Changed = v1,
        Native = {LayoutOrder = v5()},
    })}
    local v13 = {BackgroundTransparency = 1, ZIndex = 5}
    local v14 = v4(350)
    v13.Size = UDim2.fromOffset(v14, v4(30))
    v13.Position = UDim2.fromScale(0, 0.5)
    v13.AnchorPoint = Vector2.new(0, 0.5)
    v13.LayoutOrder = v5()
    v12.Buttons = react.createElement("Frame", v13, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(10)),
    }), Execute = react.createElement(Button, {
        Text = "Execute Action",
        Type = 1,
        Height = 22,
        TextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = v5()},
        Clicked = function() -- Line: 718 -- upvalues: u18 (val), Administration_2 (upval), u28 (val)
            if not u18 then
                return
            end
            local v1 = tonumber(u18.Name)
            Administration_2.Force.unreliablePost(v1, u28)
        end,
    }), Kill = react.createElement(Button, {
        Text = "Kill Titan",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Native = {LayoutOrder = v5()},
        Clicked = function() -- Line: 738 -- upvalues: u18 (val), Administration_2 (upval)
            if not u18 then
                return
            end
            local v1 = tonumber(u18.Name)
            Administration_2.Force.unreliablePost(v1, "DefaultTitanDead")
        end,
    })})
    v2.Controlling = react.createElement(Container, v11, v12)
    v11 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.1, 0.5),
        Native = {Visible = p1.Visible},
    }
    v12 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(20)),
    })}
    v13 = {
        Header = "Goal Points",
        Native = {Visible = true, LayoutOrder = v5()},
    }
    local v15 = {}
    local v16 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v17 = v4(300)
    v16.Size = UDim2.fromOffset(v17, v4(120))
    v15.Scrolling = react.createElement(ScrollingFrame, v16, {List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })}, v8)
    v12.Group = react.createElement(Group, v13, v15)
    v13 = {Type = 1, Height = 22}
    if not u8 then
        v15 = "Add Goal"
    else
        v15 = "Cancel"
    end
    v13.Text = v15
    v13.TextColor = Color3.fromRGB(0, 0, 0)
    v13.Color = Color3.fromRGB(255, 255, 255)
    v13.Native = {LayoutOrder = v5()}
    function v13.Clicked() -- Line: 801 -- upvalues: u9 (val), u8 (val)
        u9(not u8)
    end
    v12.Add = react.createElement(Button, v13)
    v2.Points = react.createElement(Container, v11, v12)
    return react.createElement(react.Fragment, {}, v2)
end
return react.memo(function() -- Line: 809 -- upvalues: useOrder (val), useRem (val), useEditorEnabled (val), useEditorTools (val), react (val), Frame (val), Container (val), Icon (val), Spawner (val), Control (val)
    local Titan, Titan_2
    local v1 = useOrder()
    local v2 = useRem()
    Titan_2, Titan = react.useState("Titan")
    local v3 = if useEditorTools() == "Titan" then useEditorEnabled() else false
    local u22 = react.useCallback(function(p1) -- Line: 819 -- upvalues: Titan (val)
        if not p1 then
            return
        end
        Titan(p1)
    end, {Titan_2})
    local v4 = {}
    local v5 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0)}
    local v6 = UDim2.fromScale(0.5, 0)
    v5.Position = v6 + UDim2.fromOffset(0, v2(125))
    v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.fromOffset(0, v2(300))
    v5.Visible = v3
    local v7 = {Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}
    local v8 = {}
    local v9 = {
        Image = "rbxassetid://11295291707",
        Clicked = function() -- Line: 850 -- upvalues: u22 (val)
            u22("Titan")
        end,
    }
    local v10 = Titan_2 == "Titan"
    v9.Selected = v10
    v10 = {Visible = true, LayoutOrder = v1()}
    v9.Native = v10
    v8.Spawner = react.createElement(Icon, v9)
    v9 = {
        Image = "rbxassetid://11326876816",
        Clicked = function() -- Line: 862 -- upvalues: u22 (val)
            u22("Control")
        end,
    }
    v10 = Titan_2 == "Control"
    v9.Selected = v10
    v9.Native = {Visible = true, LayoutOrder = v1()}
    v8.Control = react.createElement(Icon, v9)
    v7.Selections = react.createElement(Container, {Padding = "Large", Layout = "Horizontal", Spacing = 20}, v8)
    v4.Header = react.createElement(Frame, v5, v7)
    v5 = {}
    v7 = v3
    if v7 then
        v7 = Titan_2 == "Titan"
    end
    v5.Visible = v7
    v4.Spawner = react.createElement(Spawner, v5)
    v5 = {}
    v7 = v3
    if v7 then
        v7 = Titan_2 == "Control"
    end
    v5.Visible = v7
    v4.Control = react.createElement(Control, v5)
    return react.createElement(react.Fragment, {}, v4)
end)