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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Refining.Refining
--                               Dumped in 0.00126 seconds
--                          Bytecode version 9  |  9 functions

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
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
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
local MinigamePage = require(Subpages_2:WaitForChild("MinigamePage"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
return function() -- Line: 42 -- upvalues: useInterfaceState (val), react (val), useStore (val), Inventory (val), Table (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), HomePage (val), MinigamePage (val)
    local Home, Home_2, refining, refining_2, u11, u12, u17, v1, v2
    refining, refining_2 = useInterfaceState("refining")
    local v3 = refining_2
    if not v3 then
        v3 = {visible = false}
    end
    local u7 = v3
    u11, u12 = react.useState(nil)
    v2, u17 = react.useState(u7.visible)
    Home_2, Home = react.useState("Home")
    local u27 = useStore(Inventory.Store, function(p1) -- Line: 51
        return p1
    end)
    local v4 = react.useMemo(function() -- Line: 55 -- upvalues: u27 (val), Table (upval)
        if not u27 then
            return
        end
        return Table.filter(u27, function(p1) -- Line: 60
            local tags = p1.tags
            if tags then
                tags = p1.tags[1] == "Crude"
            end
            return tags
        end)
    end, {u27})
    if not v4 then
        v4 = {}
    end
    react.useEffect(function() -- Line: 65 -- upvalues: u17 (val), u7 (ref)
        u17(u7.visible)
    end, {u7.visible})
    local createElement = react.createElement
    local v5 = {Page = react.createElement(DynamicPage, {Enabled = v2})}
    local createElement_2 = react.createElement
    local v6 = {
        ZIndex = 3,
        Enabled = v2,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v7 = {}
    local createElement_3 = react.createElement
    local v8 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v9 = {}
    local createElement_4 = react.createElement
    local v10 = {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout)}
    local createElement_5 = react.createElement
    local v11 = {Header = "Refining Station", Body = "Refine your crude items.", Icon = "rbxassetid://11419701598"}
    if u11 then
        v1 = nil
    else
        function v1() -- Line: 96 -- upvalues: u7 (ref), refining (val), u17 (val)
            u7.visible = false
            refining(table.clone(u7))
            u17(false)
        end
    end
    v11.Closed = v1
    v10.Header = createElement_5(PageHeader, v11)
    v11 = {Size = UDim2.fromScale(1, 0.823)}
    v1 = {}
    local v12 = {}
    local v13 = Home_2 == "Home"
    v12.Enabled = v13
    v12.Refineables = v4
    function v12.Refining(...) -- Line: 111 -- upvalues: u12 (val), Home (val)
        u12(...)
        Home("Minigame")
    end
    v1.Home = react.createElement(HomePage, v12)
    v12 = {}
    v13 = Home_2 == "Minigame"
    v12.Enabled = v13
    v12.Refineables = v4
    function v12.Completed(p1) -- Line: 121 -- upvalues: Home (val), u12 (val), Inventory (upval), u11 (val)
        local v1
        Home("Home")
        u12(nil)
        local v2 = {}
        if not p1 then
            v1 = 0
        else
            v1 = 1
        end
        v2.success = v1
        v2.item = {u11}
        Inventory.Refine.post(v2)
    end
    v1.Minigame = react.createElement(MinigamePage, v12)
    v10.Content = react.createElement(Frame, v11, v1)
    v9.Scaler = createElement_4(Scaler, {
        Enabled = v2,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v10)
    v7.Content = createElement_3("Frame", v8, v9)
    v5[1] = createElement_2(TransparencyGroup, v6, v7)
    return createElement(Frame, {}, v5)
end