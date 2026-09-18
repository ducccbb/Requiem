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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Permissions
--                               Dumped in 0.00347 seconds
--                          Bytecode version 9  |  22 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Chunk = Common_2:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Screen = Components_2:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs_2 = Components_6:WaitForChild("Inputs")
local TextInput = require(Inputs_2:WaitForChild("TextInput"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSandbox = require(Hooks:WaitForChild("useBuildSandbox"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildZonePermissions = require(Hooks_2:WaitForChild("useBuildZonePermissions"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useInputPopup = require(Hooks_3:WaitForChild("useInputPopup"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local usePopup = require(Hooks_4:WaitForChild("usePopup"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_10:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
local function PermissionMember(p1) -- Line: 40 -- upvalues: react (val), Players (val), Form (val), HeaderBodyComponent (val), Button (val)
    local u5, v1
    v1, u5 = react.useState("")
    react.useEffect(function() -- Line: 43 -- upvalues: Players (upval), p1 (val), u5 (val)
        local v1, v2
        v1, v2 = pcall(function() -- Line: 44 -- upvalues: Players (upval), p1 (upval)
            return Players:GetNameFromUserIdAsync(p1.UserId)
        end)
        if not v1 or not v2 then
            return u5("Unknown")
        end
        u5(v2)
    end, {p1.UserId})
    return react.createElement(Form.Form, {
        Native = {BackgroundTransparency = 1},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = v1})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Label = react.createElement(Button, {
        Text = "Remove Access",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Clicked = p1.Removed,
    })})})
end
local function PermissionPagePopup(p1) -- Line: 89 -- upvalues: useRem (val), useToast (val), react (val), useInputPopup (val), Players (val), Building (val), Zone (val), HttpService (val), PermissionMember (val), Popup (val), Form (val), HeaderBodyComponent (val), Button (val), TextInput (val), ScrollingFrame (val)
    local u16, u8, u9, v1, v2
    local v3 = useRem()
    local u4 = useToast()
    u8, u9 = react.useState(p1.Data)
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    v2, u16 = react.useState(nil)
    local u21 = useInputPopup(function(p1) -- Line: 98 -- upvalues: Players (upval), u4 (val), Building (upval), u8 (val)
        local v1, v2
        if not p1 then
            return
        end
        v1, v2 = pcall(function() -- Line: 103 -- upvalues: Players (upval), p1 (val)
            return Players:GetUserIdFromNameAsync(p1)
        end)
        if not v1 or not v2 then
            return
        end
        u4({type = "info", message = "Successfully sent the server a request to transfer ownership to " .. p1})
        Building.TransferOwnership.post({plot = u8.zone, user = v2})
    end)
    local u27 = react.useCallback(function(p1) -- Line: 128 -- upvalues: Players (upval), u16 (val)
        local v1, v2
        v1, v2 = pcall(function() -- Line: 129 -- upvalues: Players (upval), p1 (val)
            return Players:GetNameFromUserIdAsync(p1.owner)
        end)
        if not v1 or not v2 then
            return u16(nil)
        end
        u16(v2)
    end, {u8})
    react.useEffect(function() -- Line: 145 -- upvalues: u27 (val), u8 (val)
        u27(u8)
    end, {u8})
    react.useEffect(function() -- Line: 150 -- upvalues: Zone (upval), u8 (val), HttpService (upval), u9 (val), u27 (val)
        local u7 = Zone.getZoneRegionFolder():FindFirstChild(u8.zone)
        if not u7 then
            return
        end
        local AttributeChangedSignal = u7:GetAttributeChangedSignal("zone")
        local u15 = AttributeChangedSignal:Connect(function() -- Line: 156 -- upvalues: HttpService (upval), u7 (val), u9 (upval), u27 (upval)
            local v1 = HttpService:JSONDecode(u7:GetAttribute("zone"))
            if not v1 then
                return
            end
            u9(v1)
            u27(v1)
        end)
        return function() -- Line: 166 -- upvalues: u15 (val)
            if u15 then
                u15:Disconnect()
            end
        end
    end, {p1.Data})
    local v4 = react.useCallback(function() -- Line: 173 -- upvalues: u21 (val)
        u21("Transfer Ownership", "Enter the username to transfer ownership to", "Username")
    end, {u21})
    local v5 = {}
    local access = u8.access
    local v6 = nil
    local v7 = nil
    for i, j in access, v6, v7 do
        v1 = tostring(j)
        v5[v1] = react.createElement(PermissionMember, {
            UserId = j,
            Removed = function() -- Line: 181 -- upvalues: u4 (val), Players (upval), j (val), Building (upval), u8 (val)
                u4({type = "info", message = "Successfully sent the server a request to remove " .. Players:GetNameFromUserIdAsync(j) .. " from the plot"})
                Building.RemoveMember.post({plot = u8.zone, user = j})
            end,
        })
    end
    local v8 = {Header = react.createElement(Popup.Header, {Header = "Permission Page", Body = "This is the permission page for the plots."})}
    local createElement = react.createElement
    local v9 = {Form = react.createElement(Form.Form, {
        Native = {BackgroundTransparency = 1},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Owner", Wrap = true, Body = v2 or "No owner found."})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Label = react.createElement(Button, {
        Text = "Transfer Ownership",
        Type = 3,
        Height = 22,
        Outline = Color3.fromRGB(179, 179, 179),
        TextColor = Color3.fromRGB(200, 200, 200),
        Clicked = v4,
    })})}), Add = react.createElement(Form.Form, {
        Darken = false,
        Height = "P_20",
        Native = {LayoutOrder = 2, BackgroundTransparency = 1},
    }, {Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, {Header = react.createElement(HeaderBodyComponent, {Header = "Add Member", Body = "Add a new member to your plot", Wrap = true})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Whitelist = react.createElement(TextInput, {
        Layout = 3,
        Header = "Username",
        Outlined = true,
        Width = "None",
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(0, 0, 0),
        Changed = function(p1) -- Line: 272 -- upvalues: Players (upval), u4 (val), Building (upval), u8 (val)
            local v1, v2
            if not p1 or p1 == "" then
                return
            end
            v1, v2 = pcall(function() -- Line: 277 -- upvalues: Players (upval), p1 (val)
                return Players:GetUserIdFromNameAsync(p1)
            end)
            if not v2 or not v1 then
                return u4({message = "User not found", type = "error"})
            end
            u4({type = "info", message = "Successfully sent the server a request to add " .. p1})
            Building.AddMember.post({plot = u8.zone, user = v2})
        end,
        Native = {BackgroundTransparency = 1},
    })})})}
    local v10 = {LayoutOrder = 3, BackgroundTransparency = 1}
    local v11 = UDim2.fromScale(1, 0)
    v10.Size = v11 + UDim2.fromOffset(0, v3(150))
    v9.Access = react.createElement("Frame", v10, {Scrolling = react.createElement(ScrollingFrame, {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, v3(5)),
    })}, v5)})
    v8.Body = createElement(Popup.Body, {Bottom = 50}, v9)
    v8.Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 326 -- upvalues: closePopup (val), p1 (val)
            closePopup()
            p1.Closed()
        end,
    })})
    return react.createElement(react.Fragment, {}, v8)
end
return function() -- Line: 335 -- upvalues: useBuildZonePermissions (val), useBuildSandbox (val), usePopup (val), react (val), Zone (val), HttpService (val), Players (val), PermissionPagePopup (val)
    local u1, u2, u6, u7, v1
    u1, u2 = useBuildZonePermissions()
    local u4 = useBuildSandbox()
    u6, u7, v1 = usePopup()
    react.useEffect(function() -- Line: 343 -- upvalues: u1 (val), Zone (upval), u2 (val), HttpService (upval), u4 (val), Players (upval), u6 (val), react (upval), PermissionPagePopup (upval), u7 (val)
        local v1
        if not u1 then
            return
        end
        local v2 = Zone.getZoneRegionFolder():FindFirstChild(u1)
        if not v2 then
            return u2(nil)
        end
        local v3 = HttpService:JSONDecode(v2:GetAttribute("zone"))
        if not v3 then
            return u2(nil)
        end
        if u4 then
            v1 = {}
            v1[u1] = react.createElement(PermissionPagePopup, {
                Closed = function() -- Line: 368 -- upvalues: u2 (upval)
                    u2(nil)
                end,
                Data = v3,
                closePopup = u7,
            })
            u6(v1)
            return
        end
        if v3.owner ~= Players.LocalPlayer.UserId then
            return u2(nil)
        end
        v1 = {}
        v1[u1] = react.createElement(PermissionPagePopup, {
            Closed = function() -- Line: 368 -- upvalues: u2 (upval)
                u2(nil)
            end,
            Data = v3,
            closePopup = u7,
        })
        u6(v1)
    end, {u1, u4, u6, u7})
    return react.createElement(react.Fragment, {}, {PopupPortal = v1})
end