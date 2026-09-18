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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Treasuries.Subpages.TreasuryHomePage
--                               Dumped in 0.00403 seconds
--                          Bytecode version 9  |  22 functions

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
local Treasury = require(Namespaces:WaitForChild("Treasury"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_3 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local Checkbox = require(Universal_2:WaitForChild("Checkbox"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Screen = Components_9:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Inputs_2 = Components_10:WaitForChild("Inputs")
local TextInput = require(Inputs_2:WaitForChild("TextInput"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks = Interfaces_11:WaitForChild("Hooks")
local useInputPopup = require(Hooks:WaitForChild("useInputPopup"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_12:WaitForChild("Hooks")
local usePopup = require(Hooks_2:WaitForChild("usePopup"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_13:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_14:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_4:WaitForChild("useThrottleCallback"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_15:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_16:WaitForChild("Hooks")
local useTooltip = require(Hooks_6:WaitForChild("useTooltip"))
local function TreasuryWithdrawPopup(p1) -- Line: 53 -- upvalues: useRem (val), react (val), Treasury (val), Popup (val), TextInput (val), Button (val)
    local u11, u12, u6, u7
    local v1 = useRem()
    u6, u7 = react.useState(0)
    u11, u12 = react.useState("")
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v2 = react.useCallback(function() -- Line: 61 -- upvalues: closePopup (val), u6 (val), Treasury (upval), p1 (val), u11 (val)
        local v1
        closePopup()
        local v2 = math.abs(tonumber(u6) or 0)
        local v3 = {treasury = p1.Treasury or 1, amount = -v2}
        if u11 ~= "" then
            v1 = u11
            if not v1 then
                v1 = "None"
            end
        else
            v1 = "None"
        end
        v3.reason = v1
        Treasury.Deposit.post(v3)
    end, {u6, u11})
    local v3 = {Header = react.createElement(Popup.Header, {Header = "Withdraw Marcs", Body = "Withdraw marcs from your treasury."})}
    local v4 = {}
    local v5 = {
        Header = "Withdraw Amount",
        Placeholder = "None",
        Layout = 3,
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
    }
    local v6 = {BackgroundTransparency = 1, LayoutOrder = 1}
    local v7 = UDim2.fromScale(0, 0)
    v6.Position = v7 + UDim2.fromOffset(0, v1(70))
    v5.Native = v6
    function v5.Stepped(p1) -- Line: 98 -- upvalues: u7 (val)
        local v1 = math.abs(tonumber(p1) or 0)
        u7(v1)
    end
    v4.Amount = react.createElement(TextInput, v5)
    v5 = {
        Header = "Withdraw Reason",
        Placeholder = "None",
        Layout = 3,
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
    }
    v6 = {BackgroundTransparency = 1, LayoutOrder = 1}
    v7 = UDim2.fromScale(0, 0)
    v6.Position = v7 + UDim2.fromOffset(0, v1(70))
    v5.Native = v6
    function v5.Stepped(p1) -- Line: 120 -- upvalues: u12 (val)
        u12(p1)
    end
    v4.Reason = react.createElement(TextInput, v5)
    v3.Body = react.createElement(Popup.Body, {Padding = 10, Bottom = 30}, v4)
    v3.Buttons = react.createElement(Popup.Buttons, {}, {Withdraw = react.createElement(Button, {
        Text = "Withdraw",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {LayoutOrder = 2},
        Clicked = v2,
    }), Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = 1},
        Clicked = function() -- Line: 147 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v3)
end
local function TreasuryAccessMember(p1) -- Line: 157 -- upvalues: useTooltip (val), react (val), Form (val), HeaderBodyComponent (val), Button (val), Treasury (val), Checkbox (val)
    local u2, u3
    u2, u3 = useTooltip()
    local v1 = p1.Member.characterName or "Unknown"
    local v2 = {
        Darken = false,
        Height = "P_20",
        Native = {LayoutOrder = 2, BackgroundTransparency = 0.875, BackgroundColor3 = Color3.fromRGB(0, 0, 0)},
    }
    local v3 = {Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, {Header = react.createElement(HeaderBodyComponent, {Body = "Treasury Member", Wrap = true, Header = v1})})}
    local v4 = {}
    local v5 = {
        Text = "Remove Member",
        Clicked = function() -- Line: 189 -- upvalues: Treasury (upval), p1 (val)
            Treasury.Remove.post({characterId = p1.Member.characterId, treasury = p1.Treasury.treasuryID})
        end,
    }
    local v6 = {}
    local v7 = p1.Treasury.ownerCharacter == p1.LocalCharacterId
    v6.Visible = v7
    v5.Native = v6
    v4.Remove = react.createElement(Button, v5)
    v5 = {}
    v6 = 0 < p1.Member.withdraw_marc_limit
    v5.Default = v6
    function v5.Toggled(a1) -- Line: 203 -- upvalues: Treasury (upval), p1 (val)
        local v1
        local v2 = {characterId = p1.Member.characterId, treasury = p1.Treasury.treasuryID}
        if not a1 then
            v1 = 0
        else
            v1 = 1
        end
        v2.withdraw = v1
        Treasury.Permission.post(v2)
    end
    v6 = {}
    v7 = p1.Treasury.ownerCharacter == p1.LocalCharacterId
    v6.Visible = v7
    v6.LayoutOrder = 2
    v6[react.Event.MouseEnter] = function(...) -- Line: 215 -- upvalues: u2 (val)
        u2("Withdraw", "Whether or not this user can withdraw from the treasury.", ...)
    end
    v6[react.Event.MouseLeave] = function() -- Line: 219 -- upvalues: u3 (val)
        u3()
    end
    v5.Native = v6
    v4.CanWithdraw = react.createElement(Checkbox, v5)
    v3.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v4)
    return react.createElement(Form.Form, v2, v3)
end
return function(p1) -- Line: 230 -- upvalues: useToast (val), usePopup (val), useRem (val), useInputPopup (val), react (val), Players (val), useThrottleCallback (val), Treasury (val), TreasuryWithdrawPopup (val), TreasuryAccessMember (val), VerticalListLayout (val), Frame (val), Form (val), HeaderBodyComponent (val), Number (val), Button (val), TextInput (val), Alive (val), Accordion (val), ScrollingFrame (val)
    local createElement, u20, u4, u5, v1, v2, v3
    local u2 = useToast()
    u4, u5, v2 = usePopup()
    local v4 = useRem()
    local u10 = useInputPopup()
    v3, u20 = react.useState((Players.LocalPlayer:GetAttribute("Character")))
    react.useEffect(function() -- Line: 241 -- upvalues: Players (upval), u20 (val)
        local AttributeChangedSignal = Players.LocalPlayer:GetAttributeChangedSignal("Character")
        local u9 = AttributeChangedSignal:Connect(function() -- Line: 242 -- upvalues: u20 (upval), Players (upval)
            u20((Players.LocalPlayer:GetAttribute("Character")))
        end)
        return function() -- Line: 246 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    local Treasury_2 = p1.Treasury
    if not Treasury_2 then
        Treasury_2 = {marcs = 0, access = {}}
    end
    local v5 = {}
    local Treasury_3 = p1.Treasury
    if Treasury_3 then
        Treasury_3 = p1.Treasury.treasuryID
    end
    v5[1] = Treasury_3
    local u42 = useThrottleCallback(function() -- Line: 256 -- upvalues: p1 (val), Treasury (upval)
        if not p1.Treasury or not p1.Treasury.treasuryID then
            return
        end
        Treasury.Request.post({treasury = p1.Treasury.treasuryID})
    end, {wait = 20, trailing = false}, v5)
    v5 = {}
    local Treasury_4 = p1.Treasury
    if Treasury_4 then
        Treasury_4 = p1.Treasury.treasuryID
    end
    v5[1] = Treasury_4
    v5[2] = p1.Selected
    v5[3] = p1.Enabled
    react.useEffect(function() -- Line: 265 -- upvalues: p1 (val), u42 (val)
        if not p1.Treasury or not p1.Treasury.treasuryID or not p1.Enabled or not p1.Selected then
            return
        end
        u42.run()
    end, v5)
    local v6 = react.useCallback(function() -- Line: 274 -- upvalues: u10 (val), Treasury (upval), p1 (val)
        u10("Deposit Marcs", "Deposit marcs in to your treasury.", "Deposit Amount", function(a1) -- Line: 275 -- upvalues: Treasury (upval), p1 (upval)
            local treasuryID
            if not a1 then
                return
            end
            local v1 = math.abs(tonumber(a1) or 0)
            local post = Treasury.Deposit.post
            local v2 = {reason = "None"}
            if not p1.Treasury then
                treasuryID = 1
            else
                treasuryID = p1.Treasury.treasuryID
                if not treasuryID then
                    treasuryID = 1
                end
            end
            v2.treasury = treasuryID
            v2.amount = v1
            post(v2)
        end, Color3.fromRGB(105, 255, 60))
    end, {u10, Treasury_2.marcs})
    local v7 = react.useCallback(function() -- Line: 289 -- upvalues: u4 (val), react (upval), TreasuryWithdrawPopup (upval), p1 (val), u5 (val)
        local treasuryID
        local v1 = {}
        local createElement = react.createElement
        local v2 = {}
        if not p1.Treasury then
            treasuryID = 1
        else
            treasuryID = p1.Treasury.treasuryID
            if not treasuryID then
                treasuryID = 1
            end
        end
        v2.Treasury = treasuryID
        v2.closePopup = u5
        v1.Withdraw = createElement(TreasuryWithdrawPopup, v2)
        u4(v1, {color = Color3.fromRGB(226, 67, 67)})
    end, {u10, Treasury_2.marcs, u4, u5})
    v5 = {}
    local access = Treasury_2.access
    if not access then
        access = {}
    end
    for k, v in pairs(access) do
        v5[v.characterId] = react.createElement(TreasuryAccessMember, {Member = v, Treasury = Treasury_2, LocalCharacterId = v3})
    end
    local v8 = {Layout = react.createElement(VerticalListLayout, {Spacing = 0, VerticalAlignment = Enum.VerticalAlignment.Top})}
    for k2, i in pairs(v5) do
        v8[k2] = i
    end
    createElement = react.createElement
    local v9 = {Visible = p1.Enabled}
    local v10 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local createElement_2 = react.createElement
    local Form_2 = Form.Form
    local v11 = {}
    local createElement_3 = react.createElement
    local Divider = Form.Divider
    local v12 = {}
    local createElement_4 = react.createElement
    local v13 = {Body = "Your treasury's current balance", Wrap = true, Header = Number.FormatWithCommas(Treasury_2.marcs) .. " Marcs"}
    local v14 = {}
    if 0 >= Treasury_2.marcs then
        v1 = Color3.fromRGB(231, 115, 115)
    else
        v1 = Color3.fromRGB(142, 231, 115)
    end
    v14.Header = v1
    v13.Colors = v14
    v12.Header = createElement_4(HeaderBodyComponent, v13)
    v11.Left = createElement_3(Divider, {Side = "Left", Padding = "Large"}, v12)
    v12 = {}
    v13 = {Text = "Withdraw", Clicked = v7}
    v14 = {}
    v1 = 0 < Treasury_2.marcs
    v14.Visible = v1
    v13.Native = v14
    v12.Withdraw = react.createElement(Button, v13)
    v12.Deposit = react.createElement(Button, {Text = "Deposit", Clicked = v6})
    v11.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v12)
    v10.Marcs = createElement_2(Form_2, {
        Darken = false,
        Height = "P_30",
        Native = {LayoutOrder = 1},
    }, v11)
    local v15 = {Darken = false, Height = "P_20"}
    v11 = {LayoutOrder = 2}
    local Treasury_5 = p1.Treasury
    if Treasury_5 then
        Treasury_5 = p1.Treasury.ownerCharacter == v3
    end
    v11.Visible = Treasury_5
    v15.Native = v11
    v10.Add = react.createElement(Form.Form, v15, {Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, {Header = react.createElement(HeaderBodyComponent, {Header = "Add Member", Body = "Add a new member to your treasury", Wrap = true})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Whitelist = react.createElement(TextInput, {
        Layout = 3,
        Header = "Username",
        Changed = function(a1) -- Line: 398 -- upvalues: Alive (upval), u2 (val), Treasury (upval), p1 (val)
            local treasuryID, v1
            if not a1 or a1 == "" then
                return
            end
            local v2 = nil
            for i, v in ipairs(Alive.getPlayers()) do
                v1 = v.Name:lower()
                if v1 ~= a1:lower() then
                    v1 = v.DisplayName:lower()
                    if v1 ~= a1:lower() then
                        continue
                    end
                end
                v2 = v
                break
            end
            if not v2 then
                return u2({message = "Player not found in server", type = "error"})
            end
            local Attribute = v2:GetAttribute("Character")
            if not Attribute then
                return u2({message = "Player does not have a character yet", type = "error"})
            end
            u2({type = "info", message = "Successfully sent the server a request to add " .. a1})
            local post = Treasury.Add.post
            local v3 = {characterId = Attribute}
            if not p1.Treasury then
                treasuryID = 1
            else
                treasuryID = p1.Treasury.treasuryID
                if not treasuryID then
                    treasuryID = 1
                end
            end
            v3.treasury = treasuryID
            post(v3)
        end,
        Native = {BackgroundTransparency = 1},
    })})})
    v11 = {}
    v12 = {}
    v13 = {BackgroundTransparency = 1}
    v1 = UDim2.fromScale(1, 0)
    v13.Size = v1 + UDim2.fromOffset(0, v4(240))
    v12.Scroll = react.createElement(ScrollingFrame, v13, v8)
    v11.Invites = react.createElement(Accordion.AccordionItem, {Header = "Treasury Members"}, v12)
    v10.Invites = react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = 3},
    }, v11)
    v10.TreasuryWithdrawPopup = v2
    return createElement(Frame, v9, v10)
end