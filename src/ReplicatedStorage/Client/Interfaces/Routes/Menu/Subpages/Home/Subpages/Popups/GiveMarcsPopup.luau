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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.Popups.GiveMarcsPopup
--                              Dumped in 0.000927 seconds
--                          Bytecode version 9  |  7 functions

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
local Signals = require(Common:WaitForChild("Signals"))
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
local Screen = Components_2:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Inputs_2 = Components_3:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs_2:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs_3 = Components_4:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
return function(p1) -- Line: 28 -- upvalues: useOrder (val), State (val), react (val), Popup (val), NumberSliderInput (val), TextInput (val), Button (val), Signals (val)
    local maximumAmount_2, u14, u18, u19, u23, u24, v1
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v2 = useOrder()
    _, maximumAmount_2 = State("maximumAmount")
    local u9 = maximumAmount_2 or 0
    v1, u14 = react.useState(0.5)
    u18, u19 = react.useState(0.5)
    u23, u24 = react.useState(0)
    local v3 = {Header = react.createElement(Popup.Header, {Header = "Give Marcs", Body = "Give marcs to a player."})}
    local v4 = {Slider = react.createElement(NumberSliderInput, {
        Header = "Amount",
        Body = "How many marcs would you like to give?",
        Display = true,
        Maximum = u9,
        Initial = v1,
        Color = Color3.fromRGB(255, 255, 255),
        Native = {BackgroundTransparency = 1, LayoutOrder = v2()},
        Update = function(p1) -- Line: 68 -- upvalues: u19 (val), u14 (val), u24 (val), u23 (val)
            u19(p1)
            u14(p1)
            u24(u23 + 1)
        end,
    })}
    v4["Text" .. u23] = react.createElement(TextInput, {
        Placeholder = "Enter Amount",
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
        Native = {BackgroundTransparency = 1, LayoutOrder = v2()},
        Changed = function(p1) -- Line: 88 -- upvalues: u9 (val), u14 (val)
            if p1 ~= "" and 0 < u9 then
                local v1 = tonumber(p1) or 0
                local v2 = tonumber(v1 / u9) or 0
                u14((math.clamp(v2, 0, 1)))
            end
        end,
    })
    v3.Body = react.createElement(Popup.Body, {Bottom = 50}, v4)
    v3.Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Native = {LayoutOrder = 4 - v2()},
        Clicked = function() -- Line: 106 -- upvalues: closePopup (val), Signals (upval)
            closePopup()
            Signals.GiveMarcs:Fire(0, "close")
        end,
    }), Confirm = react.createElement(Button, {
        Text = "Confirm",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = 4 - v2()},
        Clicked = function() -- Line: 121 -- upvalues: u18 (val), u9 (val), Signals (upval), closePopup (val)
            local v1 = math.round(u18 * u9)
            if u9 < v1 then
                v1 = u9
            end
            Signals.GiveMarcs:Fire(v1)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v3)
end