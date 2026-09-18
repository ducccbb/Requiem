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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Smithing.Smithing
--                               Dumped in 0.00218 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
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
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_3 = Components_8:WaitForChild("Menu")
local Tabs = Menu_3:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_4 = Components_9:WaitForChild("Menu")
local Tabs_2 = Menu_4:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_4 = Common_3:WaitForChild("Utilities")
local Cutscene = require(Utilities_4:WaitForChild("Cutscene"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local HomePage = require(Subpages:WaitForChild("HomePage"))
local Crafting = v1.Parent.Parent:WaitForChild("Crafting")
local Subpages_2 = Crafting:WaitForChild("Subpages")
local IndexPage = require(Subpages_2:WaitForChild("IndexPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local MinigamePage = require(Subpages_3:WaitForChild("MinigamePage"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_8:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u399 = {"Home", "Smithing Index"}
local u415 = CFrame.new(-0.300018311, -3.5, 1.99095154, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1)
local u429 = CFrame.new(-0.299987793, -0.53630209, 2, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local function attachSmithingHammer() -- Line: 63 -- upvalues: Players (val), ReplicatedStorage (val)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return nil, nil
    end
    local v1 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Hammer"):Clone()
    v1.Parent = Character
    local RightHand = Character:FindFirstChild("RightHand")
    v1:PivotTo(RightHand.CFrame)
    local Handle = v1:FindFirstChild("Handle")
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = RightHand
    WeldConstraint.Part1 = Handle
    WeldConstraint.Parent = Handle
    return v1, WeldConstraint
end
return function() -- Line: 89 -- upvalues: useInterfaceState (val), react (val), u399 (val), Tablet (val), Inventory (val), useStore (val), Table (val), ClientStateHandler (val), Players (val), u429 (val), Cutscene (val), u415 (val), useAnimatorObserver (val), Cinematics (val), attachSmithingHammer (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Ratio (val), Scaler (val), PageLayout (val), PageHeader (val), TabLayout (val), HomePage (val), IndexPage (val), MinigamePage (val)
    local Home, Home_2, root, smithing, smithing_2, u143, u184, u325, u326, u327, u328, v1, v2
    smithing, smithing_2 = useInterfaceState("smithing")
    local v3 = smithing_2
    if not v3 then
        v3 = {visible = false}
    end
    local u260 = v3
    u143, u325 = react.useState(nil)
    u326, u327 = react.useState(false)
    u328, u184 = react.useState(u260.visible)
    Home_2, Home = react.useState("Home")
    local v4 = {}
    for i, v in ipairs(u399) do
        v1 = {Text = v}
        v2 = Home_2 == v
        v1.Selected = v2
        function v1.Clicked() -- Line: 107 -- upvalues: Home (val), v (val)
            Home(v)
        end
        v4[v] = react.createElement(Tablet, v1)
    end
    react.useEffect(function() -- Line: 113 -- upvalues: u328 (val), u326 (val), Inventory (upval), u327 (val)
        if not u328 or u326 then
            return
        end
        Inventory.Index.post(0)
        u327(true)
    end, {u328})
    local u54 = useStore(Inventory.Recipes, function(p1) -- Line: 122
        return p1
    end)
    local v5 = react.useMemo(function() -- Line: 126 -- upvalues: u54 (val), Table (upval)
        if not u54 or not u54.index then
            return
        end
        return {index = Table.filter(u54.index, function(p1) -- Line: 132
            local v1 = p1.type == "Smithing"
            return v1
        end), selected = u54.selected}
    end, {u54})
    react.useEffect(function() -- Line: 139 -- upvalues: u184 (val), u260 (ref), ClientStateHandler (upval), Players (upval), u429 (upval), Cutscene (upval), u415 (upval), useAnimatorObserver (upval), Cinematics (upval), attachSmithingHammer (upval)
        u184(u260.visible)
        local u4 = nil
        if u260.visible then
            ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, true)
        end
        task.spawn(function() -- Line: 148 -- upvalues: u260 (upval), Players (upval), u429 (upval), Cutscene (upval), u415 (upval), useAnimatorObserver (upval), Cinematics (upval), attachSmithingHammer (upval), u4 (ref), ClientStateHandler (upval)
            local u80, u81
            local root = u260.root
            local Character = Players.LocalPlayer.Character
            if not u260.visible or not root or not Character then
                return
            end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                HumanoidRootPart.CFrame = root.CFrame * u429
                HumanoidRootPart.Anchored = true
            end
            local u78 = Cutscene.createCameraRig()
            u78.RootPart.CFrame = root.CFrame * u415
            local u79 = useAnimatorObserver.play(Cinematics.BeginSmithingScene, 0.2)
            if not u79 then
                return
            end
            u80, u81 = attachSmithingHammer()
            local u82 = Cutscene.playAnimationOnRig(u78, "rbxassetid://126784377508491")
            local v1 = tick()
            while true do
                task.wait()
                if 0 < u82.Length and 0 < u79.Length then
                    break
                end
            end
            v1 = tick() - v1
            local u56 = Cutscene.lockCameraToRig(u78, 1.5)
            task.delay(u79.Length - v1 - 0.05, function() -- Line: 176 -- upvalues: u79 (val)
                u79:AdjustSpeed(0)
            end)
            task.wait(u82.Length - v1 - 0.05)
            u82:AdjustSpeed(0)
            function u4() -- Line: 183 -- upvalues: u56 (val), u78 (val), u82 (val), u79 (val), ClientStateHandler (upval), HumanoidRootPart (val), u80 (val), u81 (val)
                u56()
                u78:Destroy()
                u82:Stop(0)
                u82:Destroy()
                u79:Stop(0)
                u79:Destroy()
                ClientStateHandler.updateState(ClientStateHandler.States.CUTSCENE, false)
                HumanoidRootPart.Anchored = false
                if u80 then
                    u80:Destroy()
                end
                if u81 then
                    u81:Destroy()
                end
            end
        end)
        return function() -- Line: 207 -- upvalues: u4 (ref)
            if u4 then
                u4()
                return
            end
            task.delay(0.2, function() -- Line: 211 -- upvalues: u4 (upval)
                if u4 then
                    u4()
                end
            end)
        end
    end, {u260.visible})
    local createElement = react.createElement
    local v6 = {Page = react.createElement(DynamicPage, {Enabled = u328})}
    local createElement_2 = react.createElement
    v2 = {
        ZIndex = 3,
        Enabled = u328,
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
    local v9 = {Ratio = react.createElement(Ratio, {Ratio = 1.241})}
    local v10 = {Enabled = u328}
    local v11 = {Enabled = 0.2, Disabled = 0}
    v10.Delay = v11
    v9.Scaler = react.createElement(Scaler, v10)
    v9.Layout = react.createElement(PageLayout)
    local createElement_4 = react.createElement
    v10 = {Header = "Smithing Station", Body = "Smith new item components from ingots.", Icon = "rbxassetid://11419701598"}
    if u143 then
        v11 = nil
    else
        function v11() -- Line: 248 -- upvalues: u260 (ref), smithing (val), u184 (val)
            u260.visible = false
            smithing(table.clone(u260))
            u184(false)
        end
    end
    v10.Closed = v11
    v9.Header = createElement_4(PageHeader, v10)
    v9.Tabs = react.createElement(TabLayout, {Subtabs = true, Visible = not u143}, v4)
    v10 = {Size = UDim2.fromScale(1, 0.823)}
    v11 = {}
    local v12 = {}
    local v13 = Home_2 == "Home"
    v12.Enabled = v13
    v12.Recipes = v5
    function v12.Smithing(...) -- Line: 269 -- upvalues: u325 (val), Home (val), u184 (val)
        u325(...)
        Home("Minigame")
        u184(false)
    end
    v11.Home = react.createElement(HomePage, v12)
    v12 = {}
    v13 = Home_2 == "Smithing Index"
    v12.Enabled = v13
    v12.Recipes = v5
    v11.Index = react.createElement(IndexPage, v12)
    v9.Content = react.createElement(Frame, v10, v11)
    v7.Content = createElement_3("Frame", v8, v9)
    v6.Group = createElement_2(TransparencyGroup, v2, v7)
    v2 = {}
    v7 = Home_2 == "Minigame"
    v2.Enabled = v7
    v2.Recipes = v5
    root = u260
    if root then
        root = u260.root
    end
    v2.Root = root
    v2.Smithing = u143
    function v2.Completed(p1) -- Line: 306 -- upvalues: Home (val), Inventory (upval), u143 (val), u325 (val), u184 (val), u260 (ref)
        Home("Home")
        local v1 = {}
        local v2 = {u143}
        v1.recipe = v2
        if not p1 then
            v2 = 0
        else
            v2 = 1
        end
        v1.success = v2
        Inventory.Smith.post(v1)
        u325(nil)
        u184(u260.visible)
    end
    v6.Cutscene = react.createElement(MinigamePage, v2)
    return createElement(Frame, {}, v6)
end