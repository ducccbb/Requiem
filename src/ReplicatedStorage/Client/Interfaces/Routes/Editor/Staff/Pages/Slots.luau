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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Slots
--                               Dumped in 0.00238 seconds
--                          Bytecode version 9  |  19 functions

local Slot
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
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
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
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
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks_2:WaitForChild("useEditorEnabled"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks_3:WaitForChild("useEditorPages"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_7:WaitForChild("Hooks")
local useInputPopup = require(Hooks_4:WaitForChild("useInputPopup"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_5:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_6:WaitForChild("useRem"))
function Slot(p1) -- Line: 33 -- upvalues: react (val), useOrder (val), useRem (val), useAlertPopup (val), Administration (val), useInputPopup (val), Text (val), Button (val)
    local slot, u5, v1, v2, v3
    v1, u5 = react.useState(false)
    local v4 = useOrder()
    local v5 = useRem()
    local u12 = useAlertPopup(function(a1) -- Line: 39 -- upvalues: Administration (upval), p1 (val)
        if not a1 then
            return
        end
        Administration.DeleteSlot.post({slot = p1.Slot.slot})
    end)
    local u15 = useInputPopup(function(a1) -- Line: 50 -- upvalues: Administration (upval), p1 (val)
        if not a1 then
            return
        end
        Administration.RenameSlot.post({slot = p1.Slot.slot, name = a1})
    end)
    local v6 = react.useCallback(function() -- Line: 62 -- upvalues: Administration (upval), p1 (val)
        Administration.LoadSlot.post(p1.Slot.slot)
    end, {p1.Slot.slot})
    local v7 = react.useCallback(function() -- Line: 66 -- upvalues: u12 (val)
        u12("Delete Slot", "Are you sure you want to delete this slot?", Color3.fromRGB(255, 0, 0))
    end, {u12})
    local v8 = react.useCallback(function() -- Line: 70 -- upvalues: u15 (val)
        u15("Rename Slot", "Enter a new name for the slot", "New Name")
    end, {u15})
    local createElement = react.createElement
    local v9 = {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
    if p1.Index % 2 ~= 0 then
        v2 = 0.96
    else
        v2 = 0.99
    end
    v9.BackgroundTransparency = v2
    v9.BorderSizePixel = 0
    local v10 = UDim2.fromScale(1, 0)
    v9.Size = v10 + UDim2.fromOffset(0, v5(40))
    v9[react.Event.MouseEnter] = function() -- Line: 80 -- upvalues: u5 (val)
        u5(true)
    end
    v9[react.Event.MouseLeave] = function() -- Line: 84 -- upvalues: u5 (val)
        u5(false)
    end
    v9.LayoutOrder = p1.Index
    v2 = {}
    local v11 = {Color = Color3.fromRGB(255, 255, 255)}
    if not v1 then
        v3 = 1
    else
        v3 = 0.8
    end
    v11.Transparency = v3
    v2.Stroke = react.createElement("UIStroke", v11)
    local createElement_2 = react.createElement
    v11 = {BackgroundTransparency = 1}
    local v12 = UDim2.fromScale(1, 0)
    v11.Size = v12 + UDim2.fromOffset(0, v5(30))
    v3 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(2)),
    }), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(10)), PaddingRight = UDim.new(0, v5(10)), PaddingTop = UDim.new(0, v5(5)), PaddingBottom = UDim.new(0, v5(5))})}
    local createElement_3 = react.createElement
    local v13 = {Bold = true}
    local name = p1.Slot.name
    if p1.Slot.slot == 0 then
        slot = "Default"
    else
        slot = p1.Slot.slot
    end
    v13.Text = name .. (" <font transparency=\"0.6\">(%*)</font>"):format(slot)
    v13.Native = {TextTransparency = 0.1, RichText = true}
    v3.Username = createElement_3(Text, v13)
    v2.TextContents = createElement_2("Frame", v11, v3)
    v11 = {BackgroundTransparency = 1, ZIndex = 5}
    v12 = UDim2.fromScale(1, 0)
    v11.Size = v12 + UDim2.fromOffset(0, v5(30))
    v11.Position = UDim2.fromScale(0, 0.5)
    v11.AnchorPoint = Vector2.new(0, 0.5)
    v3 = {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v5(10)), PaddingRight = UDim.new(0, v5(10)), PaddingTop = UDim.new(0, v5(5)), PaddingBottom = UDim.new(0, v5(10))}), Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(10)),
    }), Load = react.createElement(Button, {
        Text = "Load",
        Type = 1,
        Height = 22,
        TextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = v4()},
        Clicked = v6,
    })}
    v13 = {
        Text = "Rename",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
    }
    local v14 = {LayoutOrder = v4()}
    v13.Native = v14
    v13.Clicked = v8
    v14 = p1.Slot.slot ~= 0
    v13.Visible = v14
    v3.Rename = react.createElement(Button, v13)
    v13 = {Text = "Delete", Type = 4, Height = 22}
    v14 = {LayoutOrder = v4()}
    v13.Native = v14
    v13.Clicked = v7
    v14 = p1.Slot.slot ~= 0
    v13.Visible = v14
    v3.Delete = react.createElement(Button, v13)
    v2.Buttons = react.createElement("Frame", v11, v3)
    return createElement("Frame", v9, v2)
end
return react.memo(function() -- Line: 190 -- upvalues: useOrder (val), useRem (val), useEditorPages (val), useEditorEnabled (val), react (val), useInputPopup (val), Administration (val), Slot (val), Container (val), Button (val), Group (val), ScrollingFrame (val)
    local u12, v1, v2
    local v3 = useOrder()
    local v4 = useRem()
    local u5 = useEditorPages()
    local u7 = useEditorEnabled()
    v2, u12 = react.useState({})
    local u15 = useInputPopup(function(p1) -- Line: 200 -- upvalues: Administration (upval)
        if not p1 or not p1 then
            return
        end
        Administration.CreateSlot.post({name = p1})
    end)
    local u18 = useInputPopup(function(p1) -- Line: 217 -- upvalues: Administration (upval)
        local v1 = tonumber(p1)
        if not p1 or not v1 then
            return
        end
        Administration.LoadSlot.post(v1)
    end)
    local u21 = useInputPopup(function(p1) -- Line: 228 -- upvalues: Administration (upval)
        if not p1 then
            return
        end
        Administration.RequestSlots.post({username = p1})
    end)
    local v5 = react.useCallback(function() -- Line: 237 -- upvalues: u18 (val)
        u18("Load Slot", "Enter the ID of the slot to load", "ID")
    end, {u18})
    local v6 = react.useCallback(function() -- Line: 241 -- upvalues: u15 (val)
        u15("Create Slot", "Enter a name for the slot", "Name")
    end, {u15})
    local v7 = react.useCallback(function() -- Line: 245 -- upvalues: u21 (val)
        u21("Request Slots", "Enter the username to request slots for", "Username")
    end, {})
    react.useEffect(function() -- Line: 249 -- upvalues: Administration (upval), u12 (val)
        Administration.GetSlots.listen(function(p1) -- Line: 251 -- upvalues: u12 (upval)
            local v1 = {}
            for i, v in ipairs(p1) do
                table.insert(v1, v)
            end
            table.insert(v1, 1, {slot = 0, name = "Default"})
            u12(v1)
        end)
    end, {})
    react.useEffect(function() -- Line: 266 -- upvalues: u7 (val), u5 (val), Administration (upval)
        if not u7 or not u5.Slots then
            return
        end
        Administration.GetSlots.post({})
    end, {u5.Slots, u7})
    local v8 = {}
    local v9 = v2
    local v10 = nil
    local v11 = nil
    for i, j in v9, v10, v11 do
        v1 = tostring(i)
        v8[v1] = react.createElement(Slot, {Slot = j, Index = i})
    end
    v11 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v12 = {}
    local v13 = not (not u5.Slots)
    v12.Visible = v13
    v11.Native = v12
    v12 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(20)),
    })}
    local v14 = {BackgroundTransparency = 1, ZIndex = 5}
    local v15 = UDim2.fromScale(1, 0)
    v14.Size = v15 + UDim2.fromOffset(0, v4(30))
    v14.Position = UDim2.fromScale(0, 0.5)
    v14.AnchorPoint = Vector2.new(0, 0.5)
    v12.Buttons = react.createElement("Frame", v14, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(10)),
    }), Create = react.createElement(Button, {
        Text = "Create Slot",
        Type = 1,
        Height = 22,
        TextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = v3()},
        Clicked = v6,
    }), SlotById = react.createElement(Button, {
        Text = "Load Slot",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Native = {LayoutOrder = v3()},
        Clicked = v5,
    }), RequestSlots = react.createElement(Button, {
        Text = "Request Slots",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Native = {LayoutOrder = v3()},
        Clicked = v7,
    })})
    local v16 = {}
    local v17 = {BackgroundTransparency = 1, ScrollBarThickness = 2, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v18 = v4(500)
    v17.Size = UDim2.fromOffset(v18, v4(250))
    v16.Scroll = react.createElement(ScrollingFrame, v17, {List = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder})}, v8)
    v12.Group = react.createElement(Group, {Header = "Slots"}, v16)
    return react.createElement(Container, v11, v12)
end)