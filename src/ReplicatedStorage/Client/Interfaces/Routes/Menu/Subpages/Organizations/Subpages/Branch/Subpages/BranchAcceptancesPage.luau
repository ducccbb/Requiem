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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.BranchAcceptancesPage
--                              Dumped in 0.000953 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
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
local Universal = Components_4:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs_2 = Components_6:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs_2:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_7:WaitForChild("Hooks")
local useInputPopup = require(Hooks:WaitForChild("useInputPopup"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_9:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
return function(p1) -- Line: 44 -- upvalues: useRem (val), useToast (val), useInputPopup (val), Players (val), Branch (val), react (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Button (val), NumberSliderInput (val)
    local v1 = useRem()
    local u4 = useToast()
    local u7 = useInputPopup(function(p1) -- Line: 48 -- upvalues: u4 (val), Players (upval), Branch (upval)
        if not p1 then
            return u4({message = "Please enter a username.", type = "error"})
        end
        task.spawn(function() -- Line: 53 -- upvalues: Players (upval), p1 (val), u4 (upval), Branch (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 54 -- upvalues: Players (upval), p1 (upval)
                return Players:GetUserIdFromNameAsync(p1)
            end)
            if not v1 then
                return u4({message = "User not found.", type = "error"})
            end
            Branch.Invite.post({user = v2})
        end)
    end)
    local v2 = {Visible = p1.Enabled}
    local v3 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v4 = {}
    local v5 = {ZIndex = 5}
    local v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.fromOffset(0, v1(60))
    v5.AutomaticSize = Enum.AutomaticSize.None
    v4.Native = v5
    v3.Header = react.createElement(Form.Form, v4, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Invite Member", Body = "Invite a member to join your branch.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Label = react.createElement(Button, {
        Text = "Invite Member",
        Ratio = -0.1,
        Padding = "Large",
        Clicked = function() -- Line: 104 -- upvalues: u7 (val)
            u7("Invite Member", "Enter the username of the member you would like to invite.", "Username")
        end,
    })})})
    v4 = {
        Display = true,
        Header = "Graduation Requirement",
        Body = "The minimum score required for a user to join your branch from graduation.",
        Initial = p1.Branch.score / 100,
        Update = function(p1) -- Line: 113 -- upvalues: Branch (upval)
            Branch.Score.post({score = p1})
        end,
    }
    v5 = {}
    v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.new(0, 0, 0, v1(90))
    local v7 = 10 <= p1.Branch.member.rank_id
    v5.Visible = v7
    v4.Native = v5
    v3.Graduation = react.createElement(NumberSliderInput, v4)
    return react.createElement(Frame, v2, v3)
end