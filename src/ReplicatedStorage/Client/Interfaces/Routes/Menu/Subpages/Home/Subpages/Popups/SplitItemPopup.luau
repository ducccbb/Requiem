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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.Popups.SplitItemPopup
--                               Dumped in 0.00140 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
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
return function(p1) -- Line: 42 -- upvalues: useOrder (val), react (val), Popup (val), NumberSliderInput (val), TextInput (val), Button (val), Inventory (val)
    local u13, u14, u18, u19, u9, v1
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    local v2 = useOrder()
    v1, u9 = react.useState(0.5)
    u13, u14 = react.useState(0.5)
    u18, u19 = react.useState(0)
    local v3 = {Header = react.createElement(Popup.Header, {Header = "Split Item", Body = "Take your item stack and split it into smaller stacks."})}
    local v4 = {Slider = react.createElement(NumberSliderInput, {
        Header = "Split Amount",
        Body = "How many items would you like to split?",
        Display = true,
        Maximum = p1.Item.meta[1],
        Initial = v1,
        Color = Color3.fromRGB(255, 255, 255),
        Native = {BackgroundTransparency = 1, LayoutOrder = v2()},
        Update = function(p1) -- Line: 79 -- upvalues: u14 (val), u9 (val), u19 (val), u18 (val)
            u14(p1)
            u9(p1)
            u19(u18 + 1)
        end,
    })}
    v4["Text" .. u18] = react.createElement(TextInput, {
        Placeholder = "Enter Amount",
        Outlined = true,
        Color = Color3.fromRGB(255, 255, 255),
        TextBackgroundColor = Color3.fromRGB(24, 25, 28),
        Native = {BackgroundTransparency = 1, LayoutOrder = v2()},
        Changed = function(a1) -- Line: 99 -- upvalues: u9 (val), p1 (val)
            if a1 ~= "" then
                local v1 = tonumber(a1) or 0
                local v2 = tonumber(v1 / p1.Item.meta[1]) or 0
                u9((math.clamp(v2, 0, 1)))
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
        Clicked = closePopup,
    }), Drop = react.createElement(Button, {
        Text = "Drop Items",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = 4 - v2()},
        Clicked = function() -- Line: 131 -- upvalues: u13 (val), p1 (val), Inventory (upval), closePopup (val)
            local v1 = math.round(u13 * p1.Item.meta[1])
            if p1.Item.meta[1] < v1 then
                v1 = p1.Item.meta[1]
            end
            Inventory.Action.post({
                action = 2,
                hash = p1.Item.hash,
                offset = p1.Item.offset,
                data = {tonumber(v1) or 0},
            })
            closePopup()
        end,
    }), Rename = react.createElement(Button, {
        Text = "Split Items",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Native = {LayoutOrder = 4 - v2()},
        Clicked = function() -- Line: 157 -- upvalues: u13 (val), p1 (val), Inventory (upval), closePopup (val)
            local v1 = math.round(u13 * p1.Item.meta[1])
            if p1.Item.meta[1] < v1 then
                v1 = p1.Item.meta[1]
            end
            Inventory.Action.post({
                action = 3,
                hash = p1.Item.hash,
                offset = p1.Item.offset,
                data = {tonumber(v1) or 0},
            })
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v3)
end