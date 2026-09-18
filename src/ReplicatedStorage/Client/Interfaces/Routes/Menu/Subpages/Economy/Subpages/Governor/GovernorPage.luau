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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Economy.Subpages.Governor.GovernorPage
--                               Dumped in 0.00419 seconds
--                          Bytecode version 9  |  18 functions

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
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Governor = require(Namespaces:WaitForChild("Governor"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Inputs_2 = Components_3:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_11:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Number = require(Utilities_3:WaitForChild("Number"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_4 = Components_6:WaitForChild("Universal")
local Progress = require(Universal_4:WaitForChild("Progress"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives = Components_7:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Inputs_3 = Components_8:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs_3:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_2 = Components_9:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local function getColorForNumber(p1, p2) -- Line: 43
    local v1 = p1 / p2.Max
    if 0.8 <= v1 then
        return Color3.fromRGB(42, 90, 42)
    end
    if 0.6 <= v1 then
        return Color3.fromRGB(90, 108, 44)
    end
    if 0.4 <= v1 then
        return Color3.fromRGB(133, 107, 59)
    end
    return Color3.fromRGB(134, 51, 51)
end
return function(p1) -- Line: 64 -- upvalues: Constants (val), react (val), ScrollingFrame (val), useOrder (val), useRem (val), useStore (val), Governor (val), String (val), Table (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), DropdownInput (val), Accordion (val), Number (val), Progress (val), getColorForNumber (val), NumberSliderInput (val), Button (val)
    local u21, u22, u26, u27, u32, u37, v1, v2, v3
    if Constants.IsSupporterPlace then
        return react.createElement(ScrollingFrame, {Visible = p1.Enabled})
    end
    local v4 = useOrder()
    local v5 = useRem()
    local u17 = useStore(Governor.Store, function(p1) -- Line: 74
        return p1
    end)
    u21, u22 = react.useState(nil)
    u26, u27 = react.useState(nil)
    v3, u32 = react.useBinding(0)
    v1, u37 = react.useBinding(0)
    local v6 = react.useMemo(function() -- Line: 84 -- upvalues: u17 (val), String (upval)
        local v1 = {}
        local v2 = u17
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, String.capitalizeAllFirstLetters(j.name))
        end
        return v1
    end, {u17})
    react.useEffect(function() -- Line: 93 -- upvalues: u17 (val), u22 (val), String (upval)
        local v1 = #u17
        if 0 < v1 and u17[1] then
            u22(String.capitalizeAllFirstLetters(u17[1].name))
        end
    end, {u17})
    react.useEffect(function() -- Line: 99 -- upvalues: u21 (val), Table (upval), u17 (val), String (upval), u27 (val), u32 (val), u37 (val)
        if u21 then
            local v1 = Table.find(u17, function(p1) -- Line: 101 -- upvalues: String (upval), u21 (upval)
                local v1 = String.capitalizeAllFirstLetters(p1.name)
                local v2 = v1 == String.capitalizeAllFirstLetters(u21)
                return v2
            end)
            if v1 then
                u27(u17[v1])
                u32(u17[v1].civilian_tax / 100)
                u37(u17[v1].industrial_tax / 100)
            end
        end
    end, {u21, u17})
    local v7 = {Visible = p1.Enabled}
    local v8 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v9 = {}
    local v10 = {ZIndex = 10}
    local v11 = UDim2.fromScale(1, 0)
    v10.Size = v11 + UDim2.fromOffset(0, v5(60))
    v10.LayoutOrder = v4()
    v9.Native = v10
    v10 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Governor Page", Body = "View all information about the governor of the location.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})})}
    local v12 = {}
    local v13 = {
        Visible = true,
        Default = v6[1] or "None",
        Options = v6,
        Selected = function(p1) -- Line: 148 -- upvalues: u22 (val)
            u22(p1)
        end,
    }
    local v14 = {BackgroundTransparency = 1, LayoutOrder = 3 - v4()}
    v13.Native = v14
    v12.Dropdown = react.createElement(DropdownInput, v13)
    v10.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v12)
    v8.Header = react.createElement(Form.Form, v9, v10)
    v9 = {
        Native = {LayoutOrder = v4()},
    }
    v10 = {}
    v12 = {}
    local v15 = u26
    if v15 then
        v13 = {}
        v14 = {}
        v2 = UDim2.fromScale(1, 0)
        v14.Size = v2 + UDim2.fromOffset(0, v5(60))
        v14.LayoutOrder = v4()
        v13.Native = v14
        v15 = react.createElement(Form.Form, v13, {Left = react.createElement(Form.Divider, {Side = "Left"}, {react.createElement(HeaderBodyComponent, {
            Header = "Population",
            Wrap = true,
            Body = ("There are currently %* civilians."):format((Number.FormatWithCommas(u26.population))),
            Native = {BackgroundTransparency = 1},
        }, {})})})
    end
    v12.Population = v15
    v15 = u26
    if v15 then
        v15 = react.createElement(Progress, {
            Header = "Civilian Happiness",
            Body = ("A general consensus of how the %* civilians feel about local aspects."):format((Number.FormatWithCommas(u26.population))),
            Value = u26.happiness,
            Range = {Min = 0, Max = 100},
            Color = getColorForNumber(u26.happiness, NumberRange.new(0, 100)),
            Native = {LayoutOrder = v4()},
        })
    end
    v12.Happiness = v15
    v15 = u26
    if v15 then
        v15 = react.createElement(Progress, {
            Header = "Outlook",
            Body = ("A general consensus of how the %* civilians feel about the future of the location."):format((Number.FormatWithCommas(u26.population))),
            Value = u26.outlook,
            Range = {Min = 0, Max = 100},
            Color = getColorForNumber(u26.outlook, NumberRange.new(0, 100)),
            Native = {LayoutOrder = v4()},
        })
    end
    v12.Outlook = v15
    v10.Reputations = react.createElement(Accordion.AccordionItem, {Header = "Location Information"}, v12)
    v12 = {}
    v15 = u26
    if v15 then
        v13 = {}
        v14 = {}
        v2 = UDim2.fromScale(1, 0)
        v14.Size = v2 + UDim2.fromOffset(0, v5(60))
        v14.LayoutOrder = v4()
        v13.Native = v14
        v15 = react.createElement(Form.Form, v13, {Left = react.createElement(Form.Divider, {Side = "Left"}, {react.createElement(HeaderBodyComponent, {
            Header = "Businesses",
            Wrap = true,
            Body = ("There are currently %* businesses operating in the location."):format((Number.FormatWithCommas(u26.businesses))),
            Native = {BackgroundTransparency = 1},
        }, {})})})
    end
    v12.Businesses = v15
    v15 = u26
    if v15 then
        local average_income
        v15 = react.createElement(Progress, {
            Header = "Average Weekly Income",
            Display = true,
            Body = ("The average weekly income of a civilian is %*%* per week."):format(Constants.Currency.Symbol, (Number.FormatWithCommas(u26.average_income))),
            Value = u26.average_income,
            Range = {Min = 0, Max = 75},
            Color = getColorForNumber(u26.average_income, NumberRange.new(0, 75)),
            Native = {LayoutOrder = v4()},
        })
    end
    v12.Income = v15
    v15 = u26
    if v15 then
        local business_income
        v15 = react.createElement(Progress, {
            Header = "Business Weekly Income",
            Display = true,
            Body = ("Each business averages %*%* per week."):format(Constants.Currency.Symbol, (Number.FormatWithCommas(u26.business_income))),
            Value = u26.business_income,
            Range = {Min = 0, Max = 5000},
            Color = getColorForNumber(u26.business_income, NumberRange.new(0, 5000)),
            Native = {LayoutOrder = v4()},
        })
    end
    v12.BusinessIncome = v15
    v15 = u26
    if v15 then
        local employment_rate
        v13 = {Header = "Employment Rate", Display = true}
        v2 = Number.FormatWithCommas((math.floor(u26.population * (u26.employment_rate / 100))))
        v13.Body = ("Currently %* out of %* civilians are employed"):format(v2, (Number.FormatWithCommas(u26.population)))
        v13.Value = u26.employment_rate
        v13.Range = {Min = 0, Max = 100}
        v13.Color = getColorForNumber(u26.employment_rate, NumberRange.new(0, 100))
        v13.Native = {LayoutOrder = v4()}
        v15 = react.createElement(Progress, v13)
    end
    v12.EmploymentRate = v15
    v15 = u26
    if v15 then
        v13 = {Header = "Cost of Living", Display = true}
        local v16 = Number.FormatWithCommas(u26.cost_of_living)
        v13.Body = ("The average cost of living per citizen is %*%* per week. Total weekly: %*%*."):format(Constants.Currency.Symbol, v16, Constants.Currency.Symbol, (Number.FormatWithCommas(u26.population * u26.cost_of_living)))
        v13.Value = u26.cost_of_living
        v13.Range = {Min = 0, Max = 15}
        v13.Color = getColorForNumber(15 - u26.cost_of_living, NumberRange.new(0, 15))
        v13.Native = {LayoutOrder = v4()}
        v15 = react.createElement(Progress, v13)
    end
    v12.CostOfLiving = v15
    v10.Economy = react.createElement(Accordion.AccordionItem, {Header = "Location Economics"}, v12)
    v8.Information = react.createElement(Accordion.Accordion, v9, v10)
    local v17 = u26
    if v17 then
        v9 = {
            Body = "Adjust the civilian tax of the location.",
            Button = "Update Tax",
            RichText = true,
            Display = false,
            Header = v3:map(function(p1) -- Line: 338
                return (("Civilian Tax <font transparency=\"0.6\">(%*%%)</font>"):format((math.floor(p1 * 100))))
            end),
            Initial = u26.civilian_tax / 100,
            Update = function() end,
            Stepped = function(p1) -- Line: 344 -- upvalues: u32 (val)
                u32(p1)
            end,
            Clicked = function(p1) -- Line: 349 -- upvalues: Governor (upval), u26 (val)
                local id
                local post = Governor.Update.post
                local v1 = {unique = 1, value = math.floor(p1 * 100)}
                if not u26 then
                    id = 0
                else
                    id = u26.id
                    if not id then
                        id = 0
                    end
                end
                v1.location = id
                post(v1)
            end,
        }
        v10 = {LayoutOrder = v4()}
        v11 = UDim2.fromScale(1, 0)
        v10.Size = v11 + UDim2.new(0, 0, 0, v5(90))
        v9.Native = v10
        v17 = react.createElement(NumberSliderInput, v9)
    end
    v8.CivilianTax = v17
    v17 = u26
    if v17 then
        v9 = {
            Body = "Adjust the business tax of the location.",
            Button = "Update Tax",
            RichText = true,
            Display = false,
            Header = v1:map(function(p1) -- Line: 366
                return (("Business Tax <font transparency=\"0.6\">(%*%%)</font>"):format((math.floor(p1 * 100))))
            end),
            Initial = u26.industrial_tax / 100,
            Update = function() end,
            Stepped = function(p1) -- Line: 372 -- upvalues: u37 (val)
                u37(p1)
            end,
            Clicked = function(p1) -- Line: 377 -- upvalues: Governor (upval), u26 (val)
                local id
                local post = Governor.Update.post
                local v1 = {unique = 2, value = math.floor(p1 * 100)}
                if not u26 then
                    id = 0
                else
                    id = u26.id
                    if not id then
                        id = 0
                    end
                end
                v1.location = id
                post(v1)
            end,
        }
        v10 = {LayoutOrder = v4()}
        v11 = UDim2.fromScale(1, 0)
        v10.Size = v11 + UDim2.new(0, 0, 0, v5(90))
        v9.Native = v10
        v17 = react.createElement(NumberSliderInput, v9)
    end
    v8.BusinessTax = v17
    v8.Create = react.createElement(Form.Form, {
        Native = {LayoutOrder = v4()},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Request Taxes", Body = "Request taxes to be paid to the location governor.", Wrap = true, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Button = react.createElement(Button, {
        Text = "Request Taxes",
        Padding = "Large",
        Type = 1,
        Clicked = function() -- Line: 419 -- upvalues: Governor (upval), u26 (val)
            local id
            local post = Governor.Update.post
            local v1 = {unique = 3, value = 0}
            if not u26 then
                id = 0
            else
                id = u26.id
                if not id then
                    id = 0
                end
            end
            v1.location = id
            post(v1)
        end,
    })})})
    return react.createElement(ScrollingFrame, v7, v8)
end