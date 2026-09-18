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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tinkering.Subpages.TinkerPage
--                               Dumped in 0.00257 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Gear = require(Utilities:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Tinkers = require(Utilities_2:WaitForChild("Tinkers"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local String = require(Utilities_3:WaitForChild("String"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_4 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_4:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_3 = Components_4:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_4 = Components_5:WaitForChild("Universal")
local Progress = require(Universal_4:WaitForChild("Progress"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Utilities_5 = Components_7:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_5:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_10:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local function GearTinkerModifier(p1) -- Line: 55 -- upvalues: react (val), Gear (val), useToast (val), Progress (val), Accordion (val), NumberSliderInput (val), Constants (val), Gear_2 (val)
    local createElement, createElement_2, u175, u177, v1, v2, v3
    u175, u177 = react.useState(p1.Tinker.Value)
    local v4 = react.useState(p1.Tinker.Value)
    local v5 = Gear.getPriceOfTinker(u175, v4)
    local u181 = useToast()
    local v6 = {}
    local u173 = p1
    for k, v in pairs(p1.Tinker.Decreases) do
        v1 = 0.5 + (v - u175)
        createElement_2 = react.createElement
        v2 = {Value = v1, Header = k}
        if 0.5 > v1 then
            v3 = Color3.fromRGB(44, 15, 15)
        else
            v3 = Color3.fromRGB(12, 40, 12)
        end
        v2.Color = v3
        v2.Native = {BackgroundTransparency = 1, LayoutOrder = 3}
        v6[k] = createElement_2(Progress, v2)
    end
    for k2, i in pairs(u173.Tinker.Increases) do
        v1 = i + u175 - 0.5
        createElement = react.createElement
        v2 = {Value = v1, Header = k2}
        if 0.5 > v1 then
            v3 = Color3.fromRGB(44, 15, 15)
        else
            v3 = Color3.fromRGB(12, 40, 12)
        end
        v2.Color = v3
        v2.Native = {BackgroundTransparency = 1, LayoutOrder = 2}
        v6[k2] = createElement(Progress, v2)
    end
    return react.createElement(Accordion.AccordionItem, {Padding = "Medium", LayoutGap = -20, Header = u173.Tinker.Name}, {Slider = react.createElement(NumberSliderInput, {
        Display = false,
        Header = "Adjust " .. u173.Tinker.Name,
        Body = "Adjust the " .. u173.Tinker.Name .. " of your gear.",
        Initial = u173.Tinker.Value,
        Update = function() end,
        Stepped = function(p1) -- Line: 104 -- upvalues: u177 (val)
            u177(p1)
        end,
        Button = "Purchase Tinker " .. Constants.Currency.Symbol .. v5,
        Clicked = function() -- Line: 109 -- upvalues: Gear_2 (upval), u173 (val), u175 (val), u181 (val)
            Gear_2.Tinker.post({component = u173.Component, tinker = u173.Tinker.Name, value = u175})
            u181({message = "Sent a request to the server to tinker your gear.", type = "info"})
        end,
        Native = {BackgroundTransparency = 1},
    })}, v6)
end
return function(p1) -- Line: 131 -- upvalues: useOrder (val), useRem (val), useToast (val), String (val), react (val), Gear (val), Table (val), GearTinkerModifier (val), TransparencyGroup (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Accordion (val), Progress (val), Tinkers (val), Constants (val), Gear_2 (val)
    local v1, v2, v3, value
    local v4 = useOrder()
    local v5 = useRem()
    local u6 = useToast()
    local u10 = String.capitalizeAllFirstLetters(p1.Component)
    local Gear_3 = p1.Gear
    if Gear_3 then
        Gear_3 = p1.Gear.components
        if Gear_3 then
            Gear_3 = p1.Gear.components[string.upper(p1.Component)]
        end
    end
    v2 = react.useMemo(function() -- Line: 139 -- upvalues: p1 (val), Gear_3 (val), Gear (upval), u10 (val), Table (upval), react (upval), GearTinkerModifier (upval)
        local v1 = {}
        if p1.Gear and Gear_3 then
            local v2, v3, v4, value
            for k, v in pairs(Gear.getTinkersOfComponent(u10)) do
                v2 = table.clone(v)
                v3 = Table.find(Gear_3.tinkers, function(p1) -- Line: 145 -- upvalues: v (val)
                    local v1 = p1.name == v.Name
                    return v1
                end)
                if not v3 then
                    value = 0.5
                else
                    value = Gear_3.tinkers[v3].value
                end
                v2.Value = value
                v4 = tostring(k) .. v.Name
                v1[v4] = react.createElement(GearTinkerModifier, {Tinker = v2, Component = p1.Component})
            end
        end
        return v1
    end, {p1.Gear, Gear_3})
    local createElement = react.createElement
    v3 = {
        ZIndex = 3,
        Enabled = p1.Enabled,
        Tween = TweenInfo.new(0.2),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v6 = {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v7 = {
        Native = {LayoutOrder = v4()},
        Clicked = function() -- Line: 179 -- upvalues: p1 (val)
            p1.Returned()
        end,
    }
    local v8 = {}
    local v9 = {}
    local v10 = {BackgroundTransparency = 1, Image = "rbxassetid://11422143469", ImageTransparency = 0.4}
    local v11 = v5(18)
    v10.Size = UDim2.fromOffset(v11, v5(18))
    v10.LayoutOrder = v4()
    v9.Arrow = react.createElement("ImageButton", v10)
    v10 = {Header = "Return", Wrap = false, Position = UDim2.fromScale(0.5, 0.5)}
    local v12 = {LayoutOrder = v4()}
    v10.Native = v12
    v9.Label = react.createElement(HeaderBodyComponent, v10)
    v8.Left = react.createElement(Form.Divider, {Side = "Left"}, v9)
    v6.Return = react.createElement(Form.Form, v7, v8)
    local createElement_2 = react.createElement
    local Accordion_2 = Accordion.Accordion
    v7 = {
        Native = {LayoutOrder = v4()},
    }
    v8 = {}
    local createElement_3 = react.createElement
    local AccordionItem = Accordion.AccordionItem
    v9 = {}
    local createElement_4 = react.createElement
    v10 = {Segments = 5}
    if not Gear_3 then
        value = 1
    else
        value = Gear_3.value
    end
    v10.Value = value
    v10.Header = "Overall " .. u10 .. " Level"
    if not Tinkers.TINKERING_ENABLED then
        v12 = "Upgrade your " .. string.lower(u10) .. " to improve its performance."
    else
        v12 = "Upgrades all " .. string.lower(u10) .. " modifiers, and reduces the drawbacks outlined in the tinkers."
    end
    v10.Body = v12
    if not Gear_3 then
        v12 = nil
    elseif Gear_3.value >= 5 then
        v12 = nil
    else
        local value_2
        local Symbol = Constants.Currency.Symbol
        local getGearUpgradePrice = Gear.getGearUpgradePrice
        if not Gear_3 then
            value_2 = 1
        else
            value_2 = Gear_3.value
        end
        v12 = "Upgrade " .. Symbol .. getGearUpgradePrice(value_2)
        if not v12 then
            v12 = nil
        end
    end
    v10.Button = v12
    function v10.Clicked() -- Line: 233 -- upvalues: Gear_2 (upval), p1 (val), u6 (val)
        Gear_2.Upgrade.post(p1.Component)
        u6({message = "Sent a request to the server to upgrade your gear.", type = "info"})
    end
    v10.Native = {BackgroundTransparency = 1}
    v9.Level = createElement_4(Progress, v10)
    v8.Upgrade = createElement_3(AccordionItem, {Padding = "None", Header = "Upgrade " .. u10}, v9)
    v6.Upgrade = createElement_2(Accordion_2, v7, v8)
    if not Tinkers.TINKERING_ENABLED then
        v1 = nil
    else
        v1 = react.createElement(Accordion.Accordion, {
            Native = {LayoutOrder = v4()},
        }, {}, v2)
    end
    v6.Tinker = v1
    return createElement(TransparencyGroup, v3, v6)
end