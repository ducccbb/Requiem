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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Treasuries.Subpages.TreasuryAuditPage
--                               Dumped in 0.00137 seconds
--                          Bytecode version 9  |  3 functions

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
require(Namespaces:WaitForChild("Treasury"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Treasury = require(Types:WaitForChild("Treasury"))
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
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local function TreasuryAuditLogEntry(p1) -- Line: 36 -- upvalues: Number (val), Treasury (val), react (val), Form (val), Badge (val), HeaderBodyComponent (val)
    local reason_2, v1, v2
    local v3 = Number.ConvertIsoTimestampToLocalTime(p1.Audit.timestamp)
    local v4 = p1.Audit.characterName or "Unknown"
    local reason = p1.Audit.reason
    if reason then
        reason = p1.Audit.reason ~= ""
    end
    local v5 = type(p1.Audit.detail) == "string"
    local v6 = Treasury.Actions[p1.Audit.actionID] == "Updated Access"
    local v7 = Treasury.Actions[p1.Audit.actionID] == "Added Income Source"
    local createElement = react.createElement
    local Form_2 = Form.Form
    local v8 = {
        Native = {LayoutOrder = p1.LayoutOrder},
    }
    local v9 = {}
    local createElement_2 = react.createElement
    local Divider = Form.Divider
    local v10 = {}
    local createElement_3 = react.createElement
    local v11 = {Outline = true}
    if not v5 then
        if 0 >= p1.Audit.detail then
            v2 = ""
        else
            v2 = "+"
        end
        v1 = tostring(v2 .. Number.FormatWithCommas(p1.Audit.detail) .. " Marcs")
    else
        v1 = ""
    end
    v11.Text = v1
    if v5 then
        v1 = Color3.fromRGB(95, 127, 95)
        if not v1 then
            v1 = Color3.fromRGB(127, 95, 95)
        end
    elseif 0 >= p1.Audit.detail then
    end
    v11.Color = v1
    if v5 then
        v1 = Color3.fromRGB(115, 169, 115)
        if not v1 then
            v1 = Color3.fromRGB(169, 115, 115)
        end
    elseif 0 >= p1.Audit.detail then
    end
    v11.TextColor = v1
    v1 = {LayoutOrder = -1}
    local v12 = not v7
    if v12 then
        v12 = not v5
        if v12 then
            v2 = p1.Audit.detail == 0
            v12 = not v2
        end
    end
    v1.Visible = v12
    v11.Native = v1
    v10.Changed = createElement_3(Badge, v11)
    v10.Username = react.createElement(Badge, {Outline = true, Text = v4})
    local createElement_4 = react.createElement
    v11 = {Header = ""}
    if v7 then
        reason_2 = "Added an income source with identifer #" .. p1.Audit.detail
    elseif v6 then
        reason_2 = "Updated the treasury access"
    elseif v5 then
        reason_2 = tostring(p1.Audit.detail)
    elseif not reason then
        reason_2 = "No reason provided"
    else
        reason_2 = p1.Audit.reason
        if not reason_2 then
            reason_2 = "No reason provided"
        end
    end
    v11.Body = reason_2
    v10.Label = createElement_4(HeaderBodyComponent, v11)
    v9.Left = createElement_2(Divider, {Side = "Left"}, v10)
    v9.Right = react.createElement(Form.Divider, {Side = "Right"}, {Action = react.createElement(Badge, {Outline = true, Text = Treasury.Actions[p1.Audit.actionID]}), Date = react.createElement(Badge, {Outline = true, Text = v3})})
    return createElement(Form_2, v8, v9)
end
return function(p1) -- Line: 106 -- upvalues: react (val), TreasuryAuditLogEntry (val), Frame (val), VerticalListLayout (val), ScrollingFrame (val)
    local v1 = {}
    if p1.Treasury and p1.Treasury.audits then
        local v2
        for k, v in pairs(p1.Treasury.audits) do
            v2 = tostring(v.actionID .. v.detail .. v.timestamp)
            v1[v2] = react.createElement(TreasuryAuditLogEntry, {Audit = v, LayoutOrder = #p1.Treasury.audits - k})
        end
    end
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), Body = react.createElement(ScrollingFrame, {Size = UDim2.new(1, 0, 0.8, 0)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)})
end