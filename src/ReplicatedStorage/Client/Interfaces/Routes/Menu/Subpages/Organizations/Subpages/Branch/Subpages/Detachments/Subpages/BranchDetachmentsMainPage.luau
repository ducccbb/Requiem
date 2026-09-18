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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.Detachments.Subpages.BranchDetachmentsMainPage
--                               Dumped in 0.00194 seconds
--                          Bytecode version 9  |  11 functions

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
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
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
local Inputs_2 = Components_5:WaitForChild("Inputs")
local ColorPickerInput = require(Inputs_2:WaitForChild("ColorPickerInput"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Screen = Components_7:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Inputs_3 = Components_8:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_3 = Components_9:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local usePopup = require(Hooks_2:WaitForChild("usePopup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local function CreateDetachmentPagePopup(p1) -- Line: 51 -- upvalues: useOrder (val), useRem (val), useTextScale (val), react (val), Popup (val), Frame (val), VerticalListLayout (val), TextInput (val), ColorPickerInput (val), Button (val), Branch (val)
    local u16, u17, u21, u22, u26, u27
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v1 = useOrder()
    local v2 = useTextScale()
    u16, u17 = react.useState(Color3.fromRGB(125, 125, 125))
    u21, u22 = react.useState("")
    u26, u27 = react.useState("")
    local v3 = {Header = react.createElement(Popup.Header, {Header = "Create Detachment", Body = "Create a new detachment for this branch."})}
    local v4 = {}
    local v5 = {LayoutOrder = 1, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0)}
    local v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.fromOffset(0, useRem()(200))
    local v7 = {}
    local v8 = {LayoutOrder = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(0.5, 1)}
    local v9 = {Layout = react.createElement(VerticalListLayout, {Spacing = 0, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v10 = {
        Header = "Detachment Name",
        Placeholder = "None",
        Layout = 3,
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
    }
    local v11 = {BackgroundTransparency = 1, LayoutOrder = 1}
    local v12 = UDim2.fromScale(0, 0)
    v11.Position = v12 + UDim2.fromOffset(0, v2(70))
    v10.Native = v11
    function v10.Changed(p1) -- Line: 105 -- upvalues: u22 (val)
        u22(p1)
    end
    v9.Text = react.createElement(TextInput, v10)
    v10 = {
        Header = "Detachment Abbreviation",
        Placeholder = "None",
        Layout = 3,
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
    }
    v11 = {BackgroundTransparency = 1, LayoutOrder = 2}
    v12 = UDim2.fromScale(0, 0)
    v11.Position = v12 + UDim2.fromOffset(0, v2(70))
    v10.Native = v11
    function v10.Changed(p1) -- Line: 126 -- upvalues: u27 (val)
        u27(p1)
    end
    v9.Abbreviation = react.createElement(TextInput, v10)
    v7.Left = react.createElement(Frame, v8, v9)
    v7.Right = react.createElement(Frame, {LayoutOrder = 2, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromScale(0.5, 1)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Center, HorizontalAlignment = Enum.HorizontalAlignment.Right}), Color = react.createElement(ColorPickerInput, {
        Simple = true,
        Updated = function(p1) -- Line: 145 -- upvalues: u17 (val)
            u17(p1)
        end,
        Default = Color3.fromRGB(125, 125, 125),
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1.05)},
    })})
    v4.Container = react.createElement(Frame, v5, v7)
    v3.Body = react.createElement(Popup.Body, {Padding = 30, Bottom = 30}, v4)
    v3.Buttons = react.createElement(Popup.Buttons, {}, {Create = react.createElement(Button, {
        Text = "Create",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {LayoutOrder = 4 - v1()},
        Clicked = function() -- Line: 170 -- upvalues: closePopup (val), Branch (upval), u26 (val), u21 (val), u16 (val)
            closePopup()
            Branch.CreateDetachment.post({
                abbreviation = u26,
                name = u21,
                color = {r = u16.R, g = u16.G, b = u16.B},
            })
        end,
    }), Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = 4 - v1()},
        Clicked = function() -- Line: 195 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v3)
end
return function(p1) -- Line: 205 -- upvalues: usePopup (val), useOrder (val), react (val), Form (val), HeaderBodyComponent (val), ScrollingFrame (val), VerticalListLayout (val), Button (val), CreateDetachmentPagePopup (val)
    local u168, u170, v1, v2, v3, v4, v5, v6, v7
    u168, u170, v7 = usePopup()
    local v8 = useOrder()
    local v9 = {}
    local u166 = p1
    for k, v in pairs(p1.Branch.detachments) do
        v1 = string.match(v.name, "Detachment$")
        if not v1 then
            v1 = string.match(v.name, "Squadron$")
        end
        v2 = {
            Height = "P_30",
            LayoutOrder = v8(),
            Clicked = function() -- Line: 220 -- upvalues: u166 (val), v (val)
                u166.Clicked(v)
            end,
        }
        v3 = {}
        v4 = {}
        v5 = {Wrap = true}
        if not v1 then
            v6 = " Detachment"
        else
            v6 = ""
        end
        v5.Header = v.name .. v6
        v5.Body = v.players .. " Members"
        v5.Position = UDim2.fromScale(0.5, 0.5)
        v4.Label = react.createElement(HeaderBodyComponent, v5)
        v3.Left = react.createElement(Form.Divider, {Side = "Left"}, v4)
        v9[v.name] = react.createElement(Form.Form, v2, v3)
    end
    local v10 = {Visible = u166.Enabled, Size = UDim2.fromScale(1, 0.8)}
    local v11 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v12 = {LayoutOrder = v8()}
    local v13 = {}
    local v14 = 10 <= u166.Branch.member.rank_id
    v13.Visible = v14
    v12.Native = v13
    v11.Create = react.createElement(Form.Form, v12, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Create Detachment", Body = "Create a new detachment for this branch.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Label = react.createElement(Button, {
        Text = "Create Detachment",
        Ratio = -0.1,
        Padding = "Large",
        Clicked = function() -- Line: 277 -- upvalues: u168 (val), react (upval), CreateDetachmentPagePopup (upval), u170 (val)
            u168({Detachment = react.createElement(CreateDetachmentPagePopup, {closePopup = u170})})
        end,
    })})})
    v11.CreateDetachmentPopup = v7
    return react.createElement(ScrollingFrame, v10, v11, v9)
end