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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tinkering.Subpages.HomePage
--                               Dumped in 0.00187 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Constants = require(Common_4:WaitForChild("Constants"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Gear_2 = require(Utilities_2:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Number = require(Utilities_3:WaitForChild("Number"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Loading = require(Universal_4:WaitForChild("Loading"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_5 = Components_8:WaitForChild("Universal")
local ItemViewport = require(Universal_5:WaitForChild("ItemViewport"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Utilities_4 = Components_9:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_4:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Gear_3 = Assets:WaitForChild("Gear")
local Boxes = Gear_3:WaitForChild("Boxes")
local Default = Boxes:WaitForChild("Default")
local u470 = {
    Blades = "Adjust your blades, such as their durability and sharpness.",
    Ejector = "Adjust your ejector, such as its power and speed.",
    Grapples = "Adjust your grapples, such as their strength and range.",
    Canisters = "Adjust your canisters, such as their capacity and pressure.",
    Spooling = "Adjust your spooling, such as its reel speed and durability.",
    Turbine = "Adjust your turbine, such as its power and efficiency.",
}
return function(p1) -- Line: 75 -- upvalues: react (val), useToast (val), useConstants (val), useAsyncEffect (val), Promise (val), String (val), u470 (val), Form (val), HeaderBodyComponent (val), Button (val), TransparencyGroup (val), Frame (val), VerticalListLayout (val), Loading (val), Badge (val), Constants (val), Number (val), Gear_2 (val), Gear (val), ItemViewport (val), Default (val)
    local u0, u216, v1
    local v2 = {}
    v1, u216 = react.useState(false)
    local u219 = useToast()
    local v3 = useConstants()
    useAsyncEffect(function() -- Line: 82 -- upvalues: Promise (upval), u216 (val)
        return Promise.delay(2):andThen(function() -- Line: 83 -- upvalues: u216 (upval)
            u216(false)
        end)
    end, {v1})
    if not p1.Gear then
        u0 = p1
    elseif not p1.Gear.components then
        u0 = p1
    else
        local v4, v5, v6, v7, v8
        u0 = p1
        for k, v in pairs(p1.Gear.components) do
            v4 = String.capitalizeAllFirstLetters(string.lower(k))
            if u470[v4] then
                v5 = {}
                v6 = {}
                v7 = {Wrap = true, Header = v4}
                v8 = u470[v4]
                if not v8 then
                    v8 = v.name .. " " .. tostring(v4) .. " Component"
                end
                v7.Body = v8
                v6.Header = react.createElement(HeaderBodyComponent, v7)
                v5.Left = react.createElement(Form.Divider, {Side = "Left"}, v6)
                v5.Right = react.createElement(Form.Divider, {Side = "Right"}, {Header = react.createElement(Button, {
                    Text = "Modify",
                    Clicked = function() -- Line: 116 -- upvalues: u0 (val), k (val)
                        u0.Selected(k)
                    end,
                })})
                v2[k] = react.createElement(Form.Form, {Height = "P_20"}, v5)
            end
        end
    end
    return react.createElement(TransparencyGroup, {
        ZIndex = 3,
        Enabled = u0.Enabled,
        Tween = TweenInfo.new(0.2),
        Delays = {Enabled = 0.2, Disabled = 0},
    }, {Left = react.createElement(Frame, {AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromScale(0.5, 1), Position = UDim2.fromScale(0, 0.5)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top}), react.createElement(Form.Form, {Height = "P_20", LayoutOrder = -1}, {Loading = react.createElement(Loading, {Enabled = v1, Padding = UDim2.fromOffset(v3.Padding.Sizes.Large, v3.Padding.Sizes.P_40)}), Left = react.createElement(Form.Divider, {Side = "Left"}, {Header = react.createElement(HeaderBodyComponent, {Header = "Repair Gear", Body = "Repair your gear for a small fee.", Wrap = true})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Price = react.createElement(Badge, {
        Outline = true,
        Text = Constants.Currency.Symbol .. Number.FormatWithCommas(Gear_2.GEAR_REPAIR_COST),
        Native = {LayoutOrder = -1},
        Color = Color3.fromRGB(59, 92, 59),
        TextColor = Color3.fromRGB(97, 144, 97),
    }), Header = react.createElement(Button, {
        Text = "Repair",
        Color = Color3.fromRGB(42, 70, 42),
        Clicked = function() -- Line: 176 -- upvalues: Gear (upval), u216 (val), u219 (val)
            Gear.Repair.post()
            u216(true)
            u219({message = "Attempting to repair your gear...", type = "info"})
        end,
        Native = {LayoutOrder = 0},
    })})})}, v2), Right = react.createElement(Frame, {AnchorPoint = Vector2.new(1, 0.5), Size = UDim2.fromScale(0.5, 1), Position = UDim2.fromScale(1, 0.5)}, {Viewport = react.createElement(ItemViewport, {
        Spins = true,
        Model = Default,
        Native = {Position = UDim2.fromScale(0.5, 0.3)},
    })})})
end