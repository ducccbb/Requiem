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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.BranchOverviewSticky
--                               Dumped in 0.00181 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Badge = require(Universal_3:WaitForChild("Badge"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives_3 = Components_7:WaitForChild("Primitives")
local Image = require(Primitives_3:WaitForChild("Image"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_2:WaitForChild("useInterfaceState"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
return function(p1) -- Line: 54 -- upvalues: useRem (val), useOrder (val), useInterfaceState (val), react (val), Branches (val), useAsyncEffect (val), Promise (val), Players (val), Form (val), Frame (val), Image (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val), Button (val), Server (val), Signals (val), Branch (val)
    local u23, v1, v2
    local v3 = useRem()
    local v4 = useOrder()
    local black = useInterfaceState("black")
    local teleporting = useInterfaceState("teleporting")
    local quiz = useInterfaceState("quiz")
    local rank_id = p1.Branch.member.rank_id
    v2, u23 = react.useState("There is no current commander.")
    local u28 = p1.Branch.branch_id == Branches.Branches.TRAINEE_CORPS
    local v5 = u28
    if v5 then
        v5 = rank_id == 6
    end
    local member = u28
    if member then
        member = false
        if rank_id == 7 then
            member = p1.Branch.member
            if member then
                member = p1.Branch.member.can_retake == 1
            end
        end
    end
    local member_2 = u28
    if member_2 then
        member_2 = false
        if rank_id == 7 then
            member_2 = p1.Branch.member
            if member_2 then
                local v6 = p1.Branch.member.can_graduate == 1
                member_2 = not v6
            end
        end
    end
    local member_3 = p1.Branch.member
    if member_3 then
        member_3 = p1.Branch.member.can_graduate == 1
    end
    useAsyncEffect(function() -- Line: 80 -- upvalues: Promise (upval), p1 (val), u23 (val), u28 (val), Players (upval)
        return Promise.new(function(a1) -- Line: 81 -- upvalues: p1 (upval), u23 (upval), u28 (upval), Players (upval)
            local v1
            if p1.Branch.commander == 0 or not p1.Branch.commander then
                local v2
                if not u28 then
                    v2 = "There is no current commander."
                else
                    v2 = "There is no current head instructor."
                end
                u23(v2)
                return
            end
            local NameFromUserIdAsync = Players:GetNameFromUserIdAsync(p1.Branch.commander)
            if not u28 then
                v1 = "Commanded by "
            else
                v1 = "Instructed by "
            end
            u23(v1 .. NameFromUserIdAsync)
            a1()
        end)
    end, {p1.Branch.commander})
    local v7 = {Darken = false, Height = "Large", Native = p1.Native}
    local v8 = {}
    local v9 = {}
    local v10 = {BackgroundTransparency = 1}
    local v11 = v3(90)
    v10.Size = UDim2.fromOffset(v11, v3(160))
    v10.Position = UDim2.fromScale(0.025, 0.5)
    v10.AnchorPoint = Vector2.new(0, 0.5)
    v10.LayoutOrder = v4()
    local v12 = {}
    local v13 = {}
    local v14 = v3(90)
    v13.Size = UDim2.fromOffset(v14, v3(90))
    v13.Image = p1.Branch.icon or "rbxassetid://100512912092589"
    local v15 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v12.Image = react.createElement(Image, v13, v15)
    v9.Icon = react.createElement(Frame, v10, v12)
    v10 = {BackgroundTransparency = 1}
    v11 = v3(300)
    v10.Size = UDim2.fromOffset(v11, v3(90))
    v10.LayoutOrder = v4()
    v12 = {}
    v13 = {Wrap = false, Header = p1.Branch.name}
    if not u28 then
        v15 = "You are apart of the branch " .. p1.Branch.name .. "."
    else
        v15 = "You are enlisted within the Trainee Corps."
    end
    v13.Body = v15
    v14 = UDim2.fromScale(0, 0.5)
    v13.Position = v14 + UDim2.fromOffset(0, -v3(25))
    v12.Label = react.createElement(HeaderBodyComponent, v13)
    v13 = {BackgroundTransparency = 1}
    v14 = UDim2.fromScale(0, 0.5)
    v13.Position = v14 + UDim2.fromOffset(0, v3(5))
    v13.Size = UDim2.fromScale(1, 0.5)
    v13.AnchorPoint = Vector2.new(0, 0)
    v15 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}), Members = react.createElement(Badge, {
        Outline = true,
        Text = tostring(p1.Branch.memberCount) .. " Members",
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v4()},
    }), Commander = react.createElement(Badge, {
        Outline = true,
        Text = v2,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v4()},
    })}
    local v16 = {Outline = true}
    local v17 = math.ceil(p1.Branch.member.score or 0)
    if not member_3 then
        v1 = "Exam Score"
    else
        v1 = "Final Score"
    end
    v16.Text = tostring((math.clamp(v17, 0, 100))) .. " " .. v1
    v16.Color = Color3.fromRGB(97, 97, 97)
    v16.TextColor = Color3.fromRGB(183, 183, 183)
    v16.Native = {LayoutOrder = v4(), Visible = u28}
    v15.Score = react.createElement(Badge, v16)
    v15.Graduating = react.createElement(Badge, {
        Text = "Awaiting Graduation",
        Outline = true,
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v4(), Visible = member_3},
    })
    v12.Tags = react.createElement(Frame, v13, v15)
    v9.Frame = react.createElement(Frame, v10, v12)
    v8.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v9)
    v8.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Physical = react.createElement(Button, {
        Text = "Begin Physical Exam",
        Clicked = function() -- Line: 198 -- upvalues: Server (upval), Signals (upval), black (val), Promise (upval), teleporting (val), Branch (upval)
            local v1 = Server.Store.client()
            if v1.event == 1 or v1.event == 2 then
                return Signals.Toast:Fire({message = "You cannot do this while an event is active.", type = "error"})
            end
            black({enabled = true, tween = TweenInfo.new(1)})
            Promise.delay(1):andThen(function() -- Line: 209 -- upvalues: teleporting (upval), black (upval), Branch (upval)
                teleporting(true)
                black({enabled = false, tween = TweenInfo.new(0.5)})
                Branch.Physical.post(1)
            end)
        end,
        Native = {Visible = v5},
    }), Retake = react.createElement(Button, {
        Text = "Retake Exam",
        Clicked = function() -- Line: 223 -- upvalues: Branch (upval)
            Branch.Retake.post(1)
        end,
        Native = {Visible = member},
    }), Quiz = react.createElement(Button, {
        Text = "Take Written",
        Clicked = function() -- Line: 233 -- upvalues: quiz (val)
            quiz({visible = true})
        end,
        Native = {Visible = member_2},
    })})
    return react.createElement(Form.Form, v7, v8)
end