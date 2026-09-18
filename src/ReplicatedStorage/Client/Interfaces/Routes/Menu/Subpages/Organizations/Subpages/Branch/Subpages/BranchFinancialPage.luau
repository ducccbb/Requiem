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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.BranchFinancialPage
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
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
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useInputPopup = require(Hooks:WaitForChild("useInputPopup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local function BranchWageEntry(p1) -- Line: 45 -- upvalues: String (val), Table (val), Branches (val), useInputPopup (val), react (val), Form (val), HeaderBodyComponent (val), Constants (val), Number (val), Button (val), Branch (val)
    local capitalizeAllFirstLetters = String.capitalizeAllFirstLetters
    local v1 = Table.inverse(Branches.BranchRanks[p1.Branch])
    local u13 = capitalizeAllFirstLetters(v1[p1.Wage.rank_id])
    local u15 = useInputPopup()
    return react.createElement(Form.Form, {Height = "P_20", LayoutOrder = p1.Order}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = u13 .. " Wage", Body = Constants.Currency.Symbol .. Number.FormatWithCommas(p1.Wage.wage) .. " per hour in event.", Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
        Text = "Edit Wage",
        Clicked = function() -- Line: 71 -- upvalues: u15 (val), u13 (val), Branch (upval), p1 (val)
            u15("Edit Wage", "Enter the new wage for the " .. u13 .. " rank.", "Wage", function(a1) -- Line: 72 -- upvalues: Branch (upval), p1 (upval)
                if not a1 or not (tonumber(a1)) then
                    return
                end
                local v1 = tonumber(a1)
                if v1 < 0 then
                    return
                end
                v1 = tonumber(a1)
                if 10000 < v1 then
                    return
                end
                Branch.Wages.post({rank_id = p1.Wage.rank_id, wage = a1})
            end, Color3.fromRGB(3, 123, 17))
        end,
    })})})
end
return function(p1) -- Line: 89 -- upvalues: useStore (val), Branch (val), react (val), BranchWageEntry (val), ScrollingFrame (val), VerticalListLayout (val)
    local u5 = useStore(Branch.Branch, function(p1) -- Line: 90
        return p1.wages
    end)
    react.useEffect(function() -- Line: 95 -- upvalues: p1 (val), Branch (upval)
        if not p1.Enabled or not p1.Selected then
            return
        end
        Branch.Wages.post()
    end, {p1.Enabled, p1.Selected})
    local v1 = react.useMemo(function() -- Line: 103 -- upvalues: u5 (val), react (upval), BranchWageEntry (upval), p1 (val)
        local v1
        local v2 = {}
        for i, v in ipairs(u5) do
            v1 = tostring(v.rank_id)
            v2[v1] = react.createElement(BranchWageEntry, {Wage = v, Order = v.rank_id, Branch = p1.Branch.branch_id})
        end
        return v2
    end)
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled, Size = UDim2.fromScale(1, 0.823)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)
end