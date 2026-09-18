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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.BranchAuditsPage
--                               Dumped in 0.00170 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_3 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local DropdownInput = require(Inputs:WaitForChild("DropdownInput"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local Pagination = require(Universal_4:WaitForChild("Pagination"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local function BranchAuditLogEntry(p1) -- Line: 46 -- upvalues: react (val), useAsyncEffect (val), Promise (val), Players (val), Form (val), Badge (val), HeaderBodyComponent (val)
    local u5, v1, v2
    v1, u5 = react.useState("")
    local v3 = DateTime.fromIsoDate(p1.Audit.timestamp):ToLocalTime()
    local v4 = 12 <= v3.Hour
    if not v4 then
        v2 = "AM"
    else
        v2 = "PM"
    end
    local v5 = string.format("%s/%s %s:%s %s", v3.Month, v3.Day, v3.Hour % 12, v3.Minute, v2)
    useAsyncEffect(function() -- Line: 63 -- upvalues: Promise (upval), Players (upval), p1 (val), u5 (val)
        return Promise.new(function(a1) -- Line: 64 -- upvalues: Players (upval), p1 (upval), u5 (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 65 -- upvalues: Players (upval), p1 (upval)
                return Players:GetNameFromUserIdAsync(p1.Audit.user_id)
            end)
            if not v1 then
                u5("Unknown")
                return a1()
            end
            u5(v2 or "Unknown")
            return a1()
        end)
    end, {p1.Audit.user_id})
    return react.createElement(Form.Form, {
        Native = {LayoutOrder = p1.LayoutOrder},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Username = react.createElement(Badge, {Outline = true, Text = v1}), Date = react.createElement(Badge, {Outline = true, Text = v5}), Label = react.createElement(HeaderBodyComponent, {Header = "", Body = p1.Audit.log})})})
end
return function(p1) -- Line: 105 -- upvalues: useOrder (val), react (val), useRem (val), Branches (val), String (val), Branch (val), BranchAuditLogEntry (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), DropdownInput (val), Pagination (val), ScrollingFrame (val)
    local u12, u20, u6, u7, v1, v2, v3
    local v4 = useOrder()
    u6, u7 = react.useState(1)
    v2, u12 = react.useState(1)
    local v5 = useRem()
    v3, u20 = react.useMemo(function() -- Line: 112 -- upvalues: Branches (upval), String (upval)
        local v1
        local v2 = {}
        local v3 = {None = 0}
        for k, v in pairs(Branches.Audits) do
            v1 = String.capitalizeAllFirstLetters(k)
            v2[v] = v1
            v3[v1] = v
        end
        table.insert(v2, 1, "None")
        return v2, v3
    end, {})
    react.useEffect(function() -- Line: 127 -- upvalues: u12 (val), p1 (val)
        u12(p1.Branch.total_audits)
    end, {p1.Branch.total_audits})
    react.useEffect(function() -- Line: 131 -- upvalues: p1 (val), Branch (upval), u6 (val)
        if not p1.Enabled or not p1.Selected then
            return
        end
        Branch.Audits.post({filter = 0, page = u6})
    end, {p1.Enabled, p1.Selected})
    local v6 = {}
    for k, v in pairs(p1.Branch.audits) do
        v1 = tostring(v.id)
        v6[v1] = react.createElement(BranchAuditLogEntry, {Audit = v, LayoutOrder = k})
    end
    local v7 = {Visible = p1.Enabled}
    local v8 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v9 = {}
    local v10 = {ZIndex = 5}
    local v11 = UDim2.fromScale(1, 0)
    v10.Size = v11 + UDim2.fromOffset(0, v5(60))
    v10.AutomaticSize = Enum.AutomaticSize.None
    v9.Native = v10
    v8.Header = react.createElement(Form.Form, v9, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Branch Audit Logs", Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Dropdown = react.createElement(DropdownInput, {
        Visible = true,
        Default = "None",
        Native = {BackgroundTransparency = 1, LayoutOrder = 3 - v4()},
        Selected = function(p1) -- Line: 179 -- upvalues: u20 (val), u7 (val), Branch (upval)
            local v1 = u20[p1]
            u7(1)
            Branch.Audits.post({page = 1, filter = v1 or 0})
        end,
        Options = v3,
    }), Page = react.createElement(Pagination.PageSelector, {
        Pages = v2,
        Page = u6,
        Paged = function(p1) -- Line: 193 -- upvalues: u7 (val)
            u7(p1)
        end,
        Native = {LayoutOrder = v4()},
    })})})
    v8.Body = react.createElement(ScrollingFrame, {Size = UDim2.new(1, 0, 0.8, 0)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v6)
    return react.createElement(Frame, v7, v8)
end