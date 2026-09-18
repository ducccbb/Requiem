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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Bloodline.BloodlineOverviewSticky
--                               Dumped in 0.00213 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Bloodline = require(Namespaces:WaitForChild("Bloodline"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
require(Types:WaitForChild("Bloodline"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Badge = require(Universal_3:WaitForChild("Badge"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_3 = Components_6:WaitForChild("Primitives")
local Image = require(Primitives_3:WaitForChild("Image"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs = Components_7:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks_2:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useInputPopup = require(Hooks_3:WaitForChild("useInputPopup"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_11:WaitForChild("Hooks")
local useOrder = require(Hooks_4:WaitForChild("useOrder"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_12:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_13:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
return function(p1) -- Line: 53 -- upvalues: useRem (val), useOrder (val), react (val), useToast (val), useAlertPopup (val), Bloodline (val), useInputPopup (val), Alive (val), Players (val), useAsyncEffect (val), Promise (val), Form (val), Frame (val), Image (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val), Button (val)
    local u12, v1, v2
    local v3 = useRem()
    local v4 = useOrder()
    v1, u12 = react.useState((tostring(p1.Bloodline.head)))
    local u14 = useToast()
    local u17 = useAlertPopup(function(p1) -- Line: 59 -- upvalues: Bloodline (upval)
        if not p1 then
            return
        end
        Bloodline.Leave.post()
    end)
    local u20 = useInputPopup(function(p1) -- Line: 67 -- upvalues: Alive (upval), Players (upval), u14 (val), Bloodline (upval)
        local v1, v2, v3
        if not p1 then
            return
        end
        local Name = nil
        for i, j in Alive.getPlayers() do
            v3 = j.Name:sub(1, #p1):lower()
            if v3 == p1:lower() then
                Name = j.Name
                break
            end
        end
        local u33 = Name or p1
        v1, v2 = pcall(function() -- Line: 85 -- upvalues: Players (upval), u33 (ref)
            return Players:GetUserIdFromNameAsync(u33)
        end)
        if not v1 then
            u14({message = "The user specified does not exist.", type = "error"})
            return
        end
        Bloodline.Invite.post({user = v2})
    end)
    v2 = react.useMemo(function() -- Line: 97 -- upvalues: p1 (val), Players (upval)
        local v1 = p1.Bloodline.head == Players.LocalPlayer.UserId
        return v1
    end, {p1.Bloodline.head})
    useAsyncEffect(function() -- Line: 101 -- upvalues: Promise (upval), Players (upval), p1 (val), u12 (val)
        return Promise.new(function(a1) -- Line: 102 -- upvalues: Players (upval), p1 (upval), u12 (upval)
            local NameFromUserIdAsync = Players:GetNameFromUserIdAsync(p1.Bloodline.head)
            u12("Bloodline Head " .. NameFromUserIdAsync)
            a1()
        end)
    end, {p1.Bloodline.head})
    local v5 = {Darken = false, Height = "Large", Native = p1.Native}
    local v6 = {}
    local v7 = {}
    local v8 = {BackgroundTransparency = 1}
    local v9 = v3(90)
    v8.Size = UDim2.fromOffset(v9, v3(160))
    v8.Position = UDim2.fromScale(0.025, 0.5)
    v8.AnchorPoint = Vector2.new(0, 0.5)
    v8.LayoutOrder = v4()
    local v10 = {}
    local v11 = {Image = "rbxassetid://100512912092589"}
    local v12 = v3(90)
    v11.Size = UDim2.fromOffset(v12, v3(90))
    v10.Image = react.createElement(Image, v11, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v7.Icon = react.createElement(Frame, v8, v10)
    v8 = {BackgroundTransparency = 1}
    v9 = v3(300)
    v8.Size = UDim2.fromOffset(v9, v3(90))
    v8.LayoutOrder = v4()
    v10 = {}
    v11 = {Wrap = false, Header = p1.Bloodline.name .. " Bloodline", Body = "You are apart of the bloodline " .. p1.Bloodline.name .. "."}
    v12 = UDim2.fromScale(0, 0.5)
    v11.Position = v12 + UDim2.fromOffset(0, -v3(25))
    v10.Label = react.createElement(HeaderBodyComponent, v11)
    v11 = {BackgroundTransparency = 1}
    v12 = UDim2.fromScale(0, 0.5)
    v11.Position = v12 + UDim2.fromOffset(0, v3(5))
    v11.Size = UDim2.fromScale(1, 0.5)
    v11.AnchorPoint = Vector2.new(0, 0)
    v10.Tags = react.createElement(Frame, v11, {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}), Head = react.createElement(Badge, {
        Outline = true,
        Text = v1,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v4()},
    }), Location = react.createElement(Badge, {
        Outline = true,
        Text = "Originated from " .. p1.Bloodline.location,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v4()},
    })})
    v7.Frame = react.createElement(Frame, v8, v10)
    v6.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v7)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Invite = react.createElement(Button, {
        Text = "Invite Member",
        Clicked = function() -- Line: 190 -- upvalues: u20 (val)
            u20("Invite Member", "Enter the username of the player you would like to invite.", "Username")
        end,
        Visible = v2,
    }), Leave = react.createElement(Button, {
        Text = "Leave Bloodline",
        Clicked = function() -- Line: 200 -- upvalues: u17 (val), p1 (val)
            u17("Leave Bloodline", "Are you sure you wish to leave the bloodline " .. p1.Bloodline.name .. "?\n\n<b>You will not be able to leave another bloodline for one month!</b>", Color3.fromRGB(255, 0, 0))
        end,
    })})
    return react.createElement(Form.Form, v5, v6)
end