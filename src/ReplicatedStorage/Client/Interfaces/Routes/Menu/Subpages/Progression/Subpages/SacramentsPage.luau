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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.Subpages.SacramentsPage
--                               Dumped in 0.00202 seconds
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
local Sacraments = require(Namespaces:WaitForChild("Sacraments"))
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
local Sacraments_2 = require(Types:WaitForChild("Sacraments"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local Progress = require(Universal_2:WaitForChild("Progress"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local Charts = Universal_3:WaitForChild("Charts")
local Radar = require(Charts:WaitForChild("Radar"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks = Interfaces_7:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_8:WaitForChild("Hooks")
local useToast = require(Hooks_2:WaitForChild("useToast"))
local u300 = {
    Dexterity = 1,
    Resilience = 2,
    Precision = 3,
    Strength = 4,
    Celerity = 5,
}
return function(p1) -- Line: 55 -- upvalues: useToast (val), react (val), useStore (val), Sacraments (val), Sacraments_2 (val), Form (val), u300 (val), Progress (val), Button (val), Frame (val), Radar (val), VerticalListLayout (val), Number (val)
    local sacraments, u244, v1, v2, v3, v4, v5
    local u2 = useToast()
    local v6 = {hidden = false, clicked = 0, timestamp = 0}
    local u6 = react.useRef(v6)
    local u263 = useStore(Sacraments.Store, function(p1) -- Line: 64
        local v1 = p1
        if not v1 then
            v1 = {points = 0, sacraments = {}, maximum = {}}
        end
        return v1
    end)
    u244, v5 = react.useMemo(function() -- Line: 72 -- upvalues: u263 (val)
        local sacraments
        if not u263.sacraments then
            return 0, 0
        end
        local v1 = 0
        sacraments = u263.sacraments
        local v2 = nil
        local v3 = nil
        for i, j in sacraments, v2, v3 do
            v1 = v1 + j
        end
        return u263.points, v1
    end, {u263})
    local v7 = react.useMemo(function() -- Line: 85 -- upvalues: u263 (val), Sacraments_2 (upval)
        local sacraments
        if not u263.sacraments then
            return {}
        end
        local v1 = {}
        sacraments = u263.sacraments
        local v2 = nil
        local v3 = nil
        for i, j in sacraments, v2, v3 do
            v1[Sacraments_2.Enum[i]] = {
                tooltip = {i, Sacraments_2.Descriptions[i]},
                value = j + 1,
                color = Color3.fromRGB(255, 255, 255),
            }
        end
        return v1
    end, {u263})
    local v8 = react.useMemo(function() -- Line: 103 -- upvalues: u263 (val)
        local maximum, v1
        if not u263.maximum then
            return 8
        end
        local v2 = 0
        maximum = u263.maximum
        local v3 = nil
        local v4 = nil
        for i, j in maximum, v3, v4 do
            if v2 < j then
                v2 = j
            end
        end
        if 0 >= v2 then
            v1 = 8
        else
            v1 = v2
            if not v1 then
                v1 = 8
            end
        end
        return v1
    end, {u263})
    local v9 = {}
    sacraments = u263.sacraments
    if not sacraments then
        sacraments = {}
    end
    local v10 = nil
    local v11 = nil
    v1 = p1
    for i, j in sacraments, v10, v11 do
        if not u263.maximum then
            v2 = 8
        else
            v2 = u263.maximum[i]
        end
        u177 = j < v2 - u263.locked
        v3 = j < v2
        v4 = Color3.fromRGB(255, 255, 255)
        v9[i] = react.createElement(Form.Form, {
            Native = {LayoutOrder = u300[i]},
        }, {Left = react.createElement(Form.Divider, {Side = "Left", Width = 0.85}, {Progress = react.createElement(Progress, {
            Padding = "None",
            Header = i,
            Body = Sacraments_2.Descriptions[i],
            Value = j,
            Color = v4,
            Segments = v2,
            Native = {BackgroundTransparency = 1},
        })}), Right = react.createElement(Form.Divider, {
            Side = "Right",
            Width = 0.1,
            Native = {Visible = v3},
        }, {Button = react.createElement(Button, {
            Text = "Add",
            Clicked = function() -- Line: 162 -- upvalues: u6 (val), u2 (val), u244 (val), u177 (val), Sacraments (upval), i (val)
                local current = u6.current
                local v1 = tick() - current.timestamp
                if v1 < 1 and 2 <= current.clicked and not current.hidden then
                    current.hidden = true
                    u2({message = "Hiding future notifications in regards to upgrading your sacrament...", type = "info"})
                end
                current.clicked = current.clicked + 1
                current.timestamp = tick()
                if u244 > 0 then
                    if u177 then
                        if not current.hidden then
                            u2({message = "Sent a request to the server to upgrade your sacrament.", type = "info"})
                        end
                        Sacraments.Upgrade.post(i)
                        return
                    end
                    if not current.hidden then
                        u2({message = "This sacrament is at it's maximum level with your current progression.", type = "error"})
                        return
                    end
                    if not current.hidden then
                        u2({message = "Sent a request to the server to upgrade your sacrament.", type = "info"})
                    end
                    Sacraments.Upgrade.post(i)
                    return
                elseif not current.hidden then
                    u2({message = "You do not have enough points to upgrade your sacrament.", type = "error"})
                    return
                end
            end,
        })})})
    end
    v11 = {Visible = v1.Enabled}
    local v12 = {}
    local v13 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(0.5, 1)}
    v3 = {}
    local v14 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0.025), Size = UDim2.fromScale(0.95, 1)}
    local v15 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    local v16 = {Visible = v1.Enabled, Maximum = v8 + 1, Data = v7}
    v15.Radar = react.createElement(Radar, v16)
    v3.Tree = react.createElement(Frame, v14, v15)
    v12.Left = react.createElement(Frame, v13, v3)
    v13 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.75, 0), Size = UDim2.fromScale(0.5, 1)}
    v3 = {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}
    v14 = {Header = "Allocation", Display = true, RichText = true}
    local v17 = Number.NumberToText(u244)
    if u244 == 1 then
        v16 = ""
    else
        v16 = "s"
    end
    v14.Body = ("You have <b>%*</b> point%* remaining to allocate to your sacraments."):format(v17, v16)
    v14.Value = v5
    v14.Range = {Min = 0, Max = v5 + u244}
    v3.Allocation = react.createElement(Progress, v14)
    v12.Right = react.createElement(Frame, v13, v3, v9)
    return react.createElement(Frame, v11, v12)
end