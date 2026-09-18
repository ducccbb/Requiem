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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Economy.Subpages.Reputation.ReputationPage
--                               Dumped in 0.00132 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Locations = require(Types:WaitForChild("Locations"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Reputation = require(Namespaces:WaitForChild("Reputation"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local String = require(Utilities_2:WaitForChild("String"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types_2 = Common_5:WaitForChild("Types")
local Reputations = require(Types_2:WaitForChild("Reputations"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal_2 = Components_2:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_3 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal_4 = Components_4:WaitForChild("Universal")
local Progress = require(Universal_4:WaitForChild("Progress"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_8:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local function ReputationEntryItem(p1) -- Line: 47 -- upvalues: Reputations (val), react (val), Form (val), HeaderBodyComponent (val), String (val), Progress (val)
    local reputation = p1.Entry.reputation
    local v1 = Reputations.getReputationString(reputation)
    return react.createElement(Form.Form, {
        Native = {BackgroundTransparency = 1, LayoutOrder = p1.Entry.id},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = String.capitalizeAllFirstLetters(string.lower(p1.Entry.name)), Body = ("%*"):format((string.format(v1, String.capitalizeAllFirstLetters(string.lower(p1.Entry.name))))), Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Progress = react.createElement(Progress, {
        Height = 5,
        Value = reputation,
        Range = {Min = 0, Max = 100},
        Native = {BackgroundTransparency = 1},
    })})})
end
local function ReputationItem(p1) -- Line: 95 -- upvalues: useOrder (val), Locations (val), react (val), ReputationEntryItem (val), Accordion (val), String (val), Progress (val), Number (val)
    local v1 = useOrder()
    local Reputation = p1.Reputation
    local v2 = {}
    local reputation = Reputation.reputation
    if not reputation then
        reputation = {}
    end
    for i, v in ipairs(reputation) do
        if v.id ~= Locations.Locations.DEVELOPMENT then
            v2[v.name] = react.createElement(ReputationEntryItem, {Entry = v})
        end
    end
    return react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = v1()},
    }, {Reputations = react.createElement(Accordion.AccordionItem, {Header = String.capitalizeAllFirstLetters(Reputation.location.name)}, {Header = react.createElement(Progress, {
        Header = "Civilian Happiness",
        Body = ("A general consensus of how the %* civilians feel about local aspects."):format((Number.FormatWithCommas(Reputation.location.population))),
        Value = Reputation.location.happiness,
        Range = {Min = 0, Max = 100},
        Native = {BackgroundTransparency = 1, LayoutOrder = v1()},
    })}, {Reputations = react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = v1()},
    }, {Reputations = react.createElement(Accordion.AccordionItem, {Header = "Reputations"}, v2)})})})
end
return function(p1) -- Line: 151 -- upvalues: useStore (val), Reputation (val), react (val), ReputationItem (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1 = useStore(Reputation.Store, function(p1) -- Line: 152
        return p1
    end)
    local v2 = {}
    local v3 = v1
    if not v3 then
        v3 = {}
    end
    for i, v in ipairs(v3) do
        v2[v.location.name] = react.createElement(ReputationItem, {Reputation = v})
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v2)
end