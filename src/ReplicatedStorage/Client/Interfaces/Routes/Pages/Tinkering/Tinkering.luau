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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Tinkering.Tinkering
--                               Dumped in 0.00116 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Tinkers = require(Utilities:WaitForChild("Tinkers"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_6:WaitForChild("Utilities")
local Scaler = require(Utilities_2:WaitForChild("Scaler"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_7:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local HomePage = require(Subpages:WaitForChild("HomePage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local TinkerPage = require(Subpages_2:WaitForChild("TinkerPage"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
return function() -- Line: 42 -- upvalues: useInterfaceState (val), react (val), useStore (val), Gear (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), Tinkers (val), HomePage (val), TinkerPage (val)
    local Home, Home_2, tinkering, tinkering_2, u12, u22, v1, v2
    tinkering, tinkering_2 = useInterfaceState("tinkering")
    local v3 = tinkering_2
    if not v3 then
        v3 = {visible = false}
    end
    local u7 = v3
    v3, u12 = react.useState(u7.visible)
    Home_2, Home = react.useState("Home")
    v2, u22 = react.useState("")
    react.useEffect(function() -- Line: 51 -- upvalues: u12 (val), u7 (ref)
        u12(u7.visible)
    end, {u7.visible})
    local v4 = useStore(Gear.Gear, function(p1) -- Line: 55
        return p1
    end)
    local v5 = {Page = react.createElement(DynamicPage, {Enabled = v3})}
    local v6 = {
        ZIndex = 3,
        Enabled = v3,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v7 = {}
    local v8 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v9 = {}
    local v10 = {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout)}
    local v11 = {Icon = "rbxassetid://12967642498"}
    if not Tinkers.TINKERING_ENABLED then
        v1 = "Gear Station"
    else
        v1 = "Tinkering Station"
    end
    v11.Header = v1
    if not Tinkers.TINKERING_ENABLED then
        v1 = "Upgrade and repair components in your gear."
    else
        v1 = "Modify, tinker, upgrade, and swap components in your gear."
    end
    v11.Body = v1
    function v11.Closed() -- Line: 88 -- upvalues: u7 (ref), tinkering (val), u12 (val)
        u7.visible = false
        tinkering(table.clone(u7))
        u12(false)
    end
    v10.Header = react.createElement(PageHeader, v11)
    v11 = {Size = UDim2.fromScale(1, 0.823)}
    v1 = {}
    local v12 = {}
    local v13 = Home_2 == "Home"
    v12.Enabled = v13
    v12.Gear = v4
    function v12.Selected(p1) -- Line: 103 -- upvalues: u22 (val), Home (val)
        u22(p1)
        Home("Tinker")
    end
    v1.Home = react.createElement(HomePage, v12)
    v12 = {}
    v13 = Home_2 == "Tinker"
    v12.Enabled = v13
    v12.Gear = v4
    v12.Component = v2
    function v12.Returned() -- Line: 113 -- upvalues: Home (val)
        Home("Home")
    end
    v1.Tinker = react.createElement(TinkerPage, v12)
    v10.Content = react.createElement(Frame, v11, v1)
    v9.Scaler = react.createElement(Scaler, {
        Enabled = v3,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v10)
    v7.Content = react.createElement("Frame", v8, v9)
    v5[1] = react.createElement(TransparencyGroup, v6, v7)
    return react.createElement(Frame, {}, v5)
end