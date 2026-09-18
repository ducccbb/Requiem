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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Treasuries.Subpages.TreasuryIncomePage
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  13 functions

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
local Treasury = require(Namespaces:WaitForChild("Treasury"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
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
local Types = Common_6:WaitForChild("Types")
local Treasury_2 = require(Types:WaitForChild("Treasury"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_3 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local Loading = require(Universal_4:WaitForChild("Loading"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_13:WaitForChild("Hooks")
local useTooltip = require(Hooks_5:WaitForChild("useTooltip"))
local function TreasuryIncomeSource(p1) -- Line: 49 -- upvalues: useOrder (val), useRem (val), useConstants (val), useTooltip (val), react (val), Table (val), Treasury_2 (val), String (val), Treasury (val), useAsyncEffect (val), Promise (val), Number (val), Form (val), Loading (val), Frame (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val), Button (val)
    local u13, u14, u8, u9, v1, v2
    local v3 = useOrder()
    local v4 = useRem()
    local v5 = useConstants()
    u8, u9 = useTooltip()
    u13, u14 = react.useState(false)
    local v6 = react.useMemo(function() -- Line: 57 -- upvalues: Table (upval), Treasury_2 (upval), p1 (val), String (upval)
        local v1 = Table.inverse(Treasury_2.IncomeSourceTypes)[p1.Source.type]
        return {
            Name = String.capitalizeAllFirstLetters(v1),
            Cycles = Treasury_2.getAmountOfRedeemableIncome(p1.Source),
            Redeemable = Treasury_2.isIncomeSourceRedeemable(p1.Source),
            LastRedeemed = Treasury_2.getIncomeSourceLastRedeemed(p1.Source),
            Available = Treasury_2.getIncomeSourceClaimableAmount(p1.Source),
        }
    end, {p1.Source, p1.Refresh})
    local v7 = react.useCallback(function() -- Line: 71 -- upvalues: u13 (val), u14 (val), Treasury (upval), p1 (val)
        if u13 then
            return
        end
        u14(true)
        Treasury.Claim.post({treasury = p1.Source.TreasuryID, source = p1.Source.UniqueID})
    end, {u13})
    useAsyncEffect(function() -- Line: 84 -- upvalues: u13 (val), Promise (upval), u14 (val)
        if u13 then
            return Promise.delay(1):andThen(function() -- Line: 86 -- upvalues: u14 (upval)
                u14(false)
            end)
        end
    end, {u13})
    local LastRedeemed = v6.LastRedeemed
    if LastRedeemed then
        LastRedeemed = Number.ConvertUnixTimestampToLocalTime(v6.LastRedeemed)
    end
    local createElement = react.createElement
    local Form_2 = Form.Form
    local v8 = {
        Darken = false,
        Height = "P_30",
        Native = {LayoutOrder = p1.Index + 1},
    }
    local v9 = {Loading = react.createElement(Loading, {Enabled = u13, Padding = UDim2.fromOffset(v5.Padding.Sizes.Large * 2, v5.Padding.Sizes.P_30 * 2)})}
    local createElement_2 = react.createElement
    local Divider = Form.Divider
    local v10 = {}
    local createElement_3 = react.createElement
    local v11 = {BackgroundTransparency = 1}
    local v12 = v4(300)
    v11.Size = UDim2.fromOffset(v12, v4(90))
    v11.LayoutOrder = v3()
    local v13 = {}
    local createElement_4 = react.createElement
    local v14 = {Wrap = false, Header = v6.Name .. " Payout"}
    if not LastRedeemed then
        v1 = "Income Source has yet to be claimed."
    else
        v1 = "Last claimed on " .. LastRedeemed
    end
    v14.Body = v1
    local v15 = UDim2.fromScale(0, 0.5)
    v14.Position = v15 + UDim2.fromOffset(0, -v4(25))
    v13.Label = createElement_4(HeaderBodyComponent, v14)
    local createElement_5 = react.createElement
    v14 = {BackgroundTransparency = 1}
    v15 = UDim2.fromScale(0, 0.5)
    v14.Position = v15 + UDim2.fromOffset(0, v4(5))
    v14.Size = UDim2.fromScale(1, 0.5)
    v14.AnchorPoint = Vector2.new(0, 0)
    v1 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local createElement_6 = react.createElement
    local v16 = {Outline = true}
    if not v6.Available then
        v2 = "No Payouts Available"
    else
        v2 = "+" .. Number.FormatWithCommas(v6.Available) .. " Marcs"
        if not v2 then
            v2 = "No Payouts Available"
        end
    end
    v16.Text = v2
    v16.Color = Color3.fromRGB(95, 127, 95)
    v16.TextColor = Color3.fromRGB(115, 169, 115)
    v16.Native = {LayoutOrder = v3(), Visible = v6.Redeemable}
    v1.Amount = createElement_6(Badge, v16)
    v16 = {Outline = true, Text = string.format("x%d Payouts Available", v6.Cycles), Color = Color3.fromRGB(97, 97, 97), TextColor = Color3.fromRGB(183, 183, 183)}
    v2 = {LayoutOrder = v3()}
    v2[react.Event.MouseEnter] = function(...) -- Line: 158 -- upvalues: Treasury_2 (upval), p1 (val), Number (upval), u8 (val)
        local v1 = Number.FormatTimeString(Treasury_2.IncomeSourceRefreshRate[p1.Source.type])
        u8("Rate", v1, ...)
    end
    v2[react.Event.MouseLeave] = function() -- Line: 165 -- upvalues: u9 (val)
        u9()
    end
    v16.Native = v2
    v1.Available = react.createElement(Badge, v16)
    v16 = {Outline = true, Text = string.format("Level %d", p1.Source.level), Color = Color3.fromRGB(97, 97, 97), TextColor = Color3.fromRGB(183, 183, 183)}
    v2 = {LayoutOrder = v3()}
    v2[react.Event.MouseEnter] = function(...) -- Line: 181 -- upvalues: u8 (val)
        u8("Level", "(Base * Claimable) x Level", ...)
    end
    v2[react.Event.MouseLeave] = function() -- Line: 185 -- upvalues: u9 (val)
        u9()
    end
    v16.Native = v2
    v1.Level = react.createElement(Badge, v16)
    v13.Tags = createElement_5(Frame, v14, v1)
    v10.Frame = createElement_3(Frame, v11, v13)
    v9.Left = createElement_2(Divider, {Side = "Left", Padding = "Large"}, v10)
    v9.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Claim = react.createElement(Button, {Text = "Claim", Clicked = v7})})
    return createElement(Form_2, v8, v9)
end
return function(p1) -- Line: 207 -- upvalues: react (val), TreasuryIncomeSource (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Button (val)
    local income, u8, u9, v1
    local Treasury = p1.Treasury
    if not Treasury then
        Treasury = {marcs = 0, treasuryID = -1, access = {}, income = {}}
    end
    u8, u9 = react.useState(false)
    react.useEffect(function() -- Line: 216 -- upvalues: u8 (val), u9 (val)
        if u8 then
            u9(false)
        end
    end, {u8})
    local v2 = {}
    local v3 = pairs
    if not Treasury then
        income = {}
    else
        income = Treasury.income
    end
    for k, v in v3(income) do
        v1 = tostring(v.UniqueID)
        v2[v1] = react.createElement(TreasuryIncomeSource, {Source = v, Refresh = u8, Index = k})
    end
    local v4 = {Visible = p1.Enabled}
    local v5 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v6 = {}
    local v7 = {}
    local v8 = {Header = "Refresh Income Sources"}
    local v9 = UDim2.fromScale(0, 0.5)
    v8.Position = v9 + UDim2.fromOffset(0, -25)
    v7.Label = react.createElement(HeaderBodyComponent, v8)
    v6.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v7)
    v6.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Claim = react.createElement(Button, {
        Text = "Refresh",
        Clicked = function() -- Line: 259 -- upvalues: u9 (val)
            u9(true)
        end,
    })})
    v5.Refresh = react.createElement(Form.Form, {
        Darken = false,
        Native = {LayoutOrder = -1},
    }, v6)
    return react.createElement(Frame, v4, v5, v2)
end