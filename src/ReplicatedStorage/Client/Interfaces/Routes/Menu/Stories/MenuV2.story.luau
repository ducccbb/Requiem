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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.MenuV2.story
--                               Dumped in 0.00103 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local SidebarSelection = require(Menu:WaitForChild("SidebarSelection"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_4:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local Label = require(Primitives_2:WaitForChild("Label"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_6:WaitForChild("Utilities")
local QuickStory = require(Utilities_2:WaitForChild("QuickStory"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_7:WaitForChild("Utilities")
local Theme = require(Utilities_3:WaitForChild("Theme"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_4 = Common:WaitForChild("Utilities")
local State = require(Utilities_4:WaitForChild("State"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local Refactor = v1.Parent:WaitForChild("Refactor")
local V2HomePage = require(Refactor:WaitForChild("V2HomePage"))
local Refactor_2 = v1.Parent:WaitForChild("Refactor")
local V2ProfilePage = require(Refactor_2:WaitForChild("V2ProfilePage"))
local v3 = {Enabled = true, Instant = false, Speed = 1, Theme = Theme.getThemeChooseControl()}
local u244 = {}
local v4 = {"Home", "rbxassetid://11433532654"}
local v5 = {"Profile", "rbxassetid://11963361597"}
u244[1] = v4
u244[2] = {"Progression", "rbxassetid://12967618029"}
u244[3] = v5
u244[4] = {"Factions", "rbxassetid://11432832657"}
u244[5] = {"Economy", "rbxassetid://11419719162"}
u244[6] = {"Settings", "rbxassetid://11293977610"}
local function MenuV2(p1) -- Line: 59 -- upvalues: react (val), useTheme (val), useRem (val), useTextScale (val), Theme (val), State (val), Frame (val), DynamicPage (val), Label (val), TransparencyGroup (val), SidebarSelection (val), u244 (val), V2HomePage (val), V2ProfilePage (val)
    local Home, Home_2
    local u4 = react.useState(true)
    Home, Home_2 = react.useState("Home")
    local v1 = useRem()
    local v2 = useTextScale()
    local v3 = Theme.getContentLayout(v1)
    react.useEffect(function() -- Line: 68 -- upvalues: State (upval), u4 (val), Home (val)
        State("isMenuOpen")({open = u4, page = Home})
    end, {u4, Home})
    local v4 = {}
    local v5 = {Enabled = p1.Enabled or u4}
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        Text = Home,
        TextSize = v2(50),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v8 = UDim2.fromScale(0.5, 0)
    v7.Position = v8 + UDim2.fromOffset(v3.centerOffsetX, v1(70))
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(v3.widthOffset, v1(50))
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextYAlignment = Enum.TextYAlignment.Center
    v6.Header = react.createElement(Label, v7, {Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(Theme.MAX_WIDTH, math.huge)})})
    v7 = {
        Text = "Winter, 848",
        TextSize = v2(25),
        TextColor3 = useTheme().Text.Secondary,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v8 = UDim2.fromScale(0.5, 0)
    v7.Position = v8 + UDim2.fromOffset(v3.centerOffsetX, v1(105))
    v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(v3.widthOffset, v1(25))
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextYAlignment = Enum.TextYAlignment.Center
    v6.Date = react.createElement(Label, v7, {Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(Theme.MAX_WIDTH, math.huge)})})
    v4.Background = react.createElement(DynamicPage, v5, v6)
    v4.Sidebar = react.createElement(TransparencyGroup, {
        ZIndex = 2,
        Enabled = p1.Enabled or u4,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }, {Sidebar = react.createElement(SidebarSelection, {Pages = u244, Clicked = Home_2, Selected = Home})})
    v4.Content = react.createElement(react.Fragment, {}, {Home = react.createElement(V2HomePage), Profile = react.createElement(V2ProfilePage)})
    return react.createElement(Frame, {}, v4)
end
return QuickStory(v3, function(p1) -- Line: 154 -- upvalues: react (val), MenuV2 (val), Lighting (val)
    local v1 = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://74853599096735",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Content = react.createElement(MenuV2, p1)})
    return v1, function() -- Line: 166 -- upvalues: Lighting (upval)
        local __RequiemBlurEffect = Lighting:FindFirstChild("__RequiemBlurEffect")
        if __RequiemBlurEffect then
            __RequiemBlurEffect:Destroy()
        end
    end
end)