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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Treasuries.TreasuryOverviewSticky
--                               Dumped in 0.00167 seconds
--                          Bytecode version 9  |  4 functions

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
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_3 = Components_3:WaitForChild("Primitives")
local Image = require(Primitives_3:WaitForChild("Image"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Inputs = Components_5:WaitForChild("Inputs")
local DropdownInput = require(Inputs:WaitForChild("DropdownInput"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local u285 = {}
u285["Scouting Legion Treasury"] = "Owned by the Royal Monarch"
u285["Military Police Treasury"] = "Owned by the Royal Monarch"
u285["Stationary Guard Treasury"] = "Owned by the Royal Monarch"
u285["Trainee Corps Treasury"] = "Owned by the Royal Monarch"
u285["Royal Treasury"] = "Owned by the Royal Monarch"
local u291 = {}
u291["Royal Treasury"] = "Located in the Royal Palace"
u291["Scouting Legion Treasury"] = "Located in the Royal Palace"
u291["Military Police Treasury"] = "Located in the Royal Palace"
u291["Stationary Guard Treasury"] = "Located in the Royal Palace"
u291["Trainee Corps Treasury"] = "Located in the Royal Palace"
return function(p1) -- Line: 61 -- upvalues: useRem (val), useOrder (val), react (val), Form (val), Frame (val), Image (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val), u285 (val), u291 (val), DropdownInput (val)
    local v1 = useRem()
    local v2 = useOrder()
    local Treasury = p1.Treasury
    if not Treasury then
        Treasury = {
            name = "Unknown",
            ownerCharacter = "",
            ownerCharacterName = "Unknown",
            marcs = 0,
            treasuryID = -1,
            access = {},
            income = {},
            audits = {},
        }
    end
    p1.Treasury = Treasury
    local v3 = react.useMemo(function() -- Line: 78 -- upvalues: p1 (val)
        local v1 = {}
        for i, v in ipairs(p1.Treasuries) do
            table.insert(v1, v[1])
        end
        return v1
    end, {p1.Treasuries})
    local v4 = {Darken = false, Height = "Large", Native = p1.Native}
    local v5 = {}
    local v6 = {}
    local v7 = {BackgroundTransparency = 1}
    local v8 = v1(90)
    v7.Size = UDim2.fromOffset(v8, v1(160))
    v7.Position = UDim2.fromScale(0.025, 0.5)
    v7.AnchorPoint = Vector2.new(0, 0.5)
    v7.LayoutOrder = v2()
    local v9 = {}
    local v10 = {Image = "rbxassetid://100512912092589"}
    local v11 = v1(90)
    v10.Size = UDim2.fromOffset(v11, v1(90))
    v9.Image = react.createElement(Image, v10, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v6.Icon = react.createElement(Frame, v7, v9)
    v7 = {BackgroundTransparency = 1}
    v8 = v1(300)
    v7.Size = UDim2.fromOffset(v8, v1(90))
    v7.LayoutOrder = v2()
    v9 = {}
    v10 = {Wrap = false, RichText = true, Header = (p1.Treasury.name or "Unknown") .. " <font transparency=\"0.8\">#" .. (p1.Treasury.treasuryID or "N/A") .. "</font>", Body = "You have access to the " .. (p1.Treasury.name or "Unknown") .. " treasury."}
    v11 = UDim2.fromScale(0, 0.5)
    v10.Position = v11 + UDim2.fromOffset(0, -v1(25))
    v9.Label = react.createElement(HeaderBodyComponent, v10)
    v10 = {BackgroundTransparency = 1}
    v11 = UDim2.fromScale(0, 0.5)
    v10.Position = v11 + UDim2.fromOffset(0, v1(5))
    v10.Size = UDim2.fromScale(1, 0.5)
    v10.AnchorPoint = Vector2.new(0, 0)
    local v12 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v13 = {Outline = true}
    local v14 = u285[p1.Treasury.name]
    if not v14 then
        v14 = "Owned by " .. (p1.Treasury.ownerCharacterName or "Unknown")
    end
    v13.Text = v14
    v13.Color = Color3.fromRGB(97, 97, 97)
    v13.TextColor = Color3.fromRGB(183, 183, 183)
    v13.Native = {LayoutOrder = v2()}
    v12.Head = react.createElement(Badge, v13)
    v12.Location = react.createElement(Badge, {
        Outline = true,
        Text = u291[p1.Treasury.name] or "Located in Trost",
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v2()},
    })
    v9.Tags = react.createElement(Frame, v10, v12)
    v6.Frame = react.createElement(Frame, v7, v9)
    v5.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v6)
    v5.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Medium"}, {Dropdown = react.createElement(DropdownInput, {
        Visible = true,
        Native = {BackgroundTransparency = 1, LayoutOrder = 3 - v2()},
        Selected = function(...) -- Line: 174 -- upvalues: p1 (val)
            p1.Selected(...)
        end,
        Default = p1.Treasury.name,
        Options = v3,
    })})
    return react.createElement(Form.Form, v4, v5)
end