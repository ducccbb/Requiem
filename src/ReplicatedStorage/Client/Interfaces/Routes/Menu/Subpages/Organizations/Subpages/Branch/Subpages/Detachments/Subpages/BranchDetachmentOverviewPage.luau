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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.Detachments.Subpages.BranchDetachmentOverviewPage
--                               Dumped in 0.00103 seconds
--                          Bytecode version 9  |  5 functions

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
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
return function(p1) -- Line: 46 -- upvalues: useOrder (val), useRem (val), useAlertPopup (val), Branch (val), react (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Button (val)
    local v1 = useOrder()
    local v2 = useRem()
    local u7 = useAlertPopup(function(a1) -- Line: 50 -- upvalues: Branch (upval), p1 (val)
        local id
        if not a1 then
            return
        end
        local post = Branch.DeleteDetachment.post
        local v1 = {}
        if not p1.Detachment then
            id = 0
        else
            id = p1.Detachment.id
            if not id then
                id = 0
            end
        end
        v1.detachment = id
        post(v1)
        p1.Returned()
    end)
    local v3 = {Visible = p1.Enabled}
    local v4 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v5 = {
        Native = {LayoutOrder = v1()},
        Clicked = function() -- Line: 75 -- upvalues: p1 (val)
            p1.Returned()
        end,
    }
    local v6 = {}
    local v7 = {}
    local v8 = {BackgroundTransparency = 1, Image = "rbxassetid://11422143469", ImageTransparency = 0.4}
    local v9 = v2(18)
    v8.Size = UDim2.fromOffset(v9, v2(18))
    v8.LayoutOrder = v1()
    v7.Arrow = react.createElement("ImageButton", v8)
    v7.Label = react.createElement(HeaderBodyComponent, {
        Header = "Return",
        Wrap = false,
        Position = UDim2.fromScale(0.5, 0.5),
        Native = {LayoutOrder = v1()},
    })
    v6.Left = react.createElement(Form.Divider, {Side = "Left"}, v7)
    v4.Return = react.createElement(Form.Form, v5, v6)
    v5 = {}
    v6 = {}
    local v10 = 10 <= p1.Branch.member.rank_id
    v6.Visible = v10
    v6.LayoutOrder = v1()
    v5.Native = v6
    v4.Delete = react.createElement(Form.Form, v5, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Delete Detachment", Body = "Delete this detachment from your branch.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Button = react.createElement(Button, {
        Text = "Delete Detachment",
        Ratio = -0.1,
        Type = 4,
        Padding = "Large",
        Clicked = function() -- Line: 132 -- upvalues: u7 (val), p1 (val)
            local name
            if not p1.Detachment then
                name = "Detachment"
            else
                name = p1.Detachment.name
                if not name then
                    name = "Detachment"
                end
            end
            local v1 = "Delete " .. tostring(name)
            u7(v1, "Are you sure you wish to delete this detachment from your branch?", Color3.fromRGB(255, 0, 0))
        end,
    })})})
    return react.createElement(Frame, v3, v4)
end