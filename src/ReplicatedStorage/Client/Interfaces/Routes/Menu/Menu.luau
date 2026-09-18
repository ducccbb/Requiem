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
--              File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Menu
--                               Dumped in 0.00157 seconds
--                          Bytecode version 9  |  11 functions

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
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Administration = require(Namespaces_2:WaitForChild("Administration"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Administration_2 = Common_3:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local CalendarDate = require(Utilities:WaitForChild("CalendarDate"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components:WaitForChild("Utilities")
local Theme = require(Utilities_3:WaitForChild("Theme"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local Label = require(Primitives_2:WaitForChild("Label"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local Page = require(Primitives_3:WaitForChild("Page"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_5:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_6 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_6:WaitForChild("Menu")
local SidebarSelection = require(Menu:WaitForChild("SidebarSelection"))
local Components_7 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_4 = Components_7:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_4:WaitForChild("TransparencyGroup"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_3:WaitForChild("useTextScale"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local Economy = Subpages:WaitForChild("Economy")
local EconomyPage = require(Economy:WaitForChild("EconomyPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local Home = Subpages_2:WaitForChild("Home")
local HomePage = require(Home:WaitForChild("HomePage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local Organizations = Subpages_3:WaitForChild("Organizations")
local OrganizationsPage = require(Organizations:WaitForChild("OrganizationsPage"))
local Subpages_4 = v1.Parent:WaitForChild("Subpages")
local Profile = Subpages_4:WaitForChild("Profile")
local ProfilePage = require(Profile:WaitForChild("ProfilePage"))
local Subpages_5 = v1.Parent:WaitForChild("Subpages")
local Progression = Subpages_5:WaitForChild("Progression")
local ProgressionPage = require(Progression:WaitForChild("ProgressionPage"))
local Subpages_6 = v1.Parent:WaitForChild("Subpages")
local Settings = Subpages_6:WaitForChild("Settings")
local SettingsPage = require(Settings:WaitForChild("SettingsPage"))
local Subpages_7 = v1.Parent:WaitForChild("Subpages")
local Staff = Subpages_7:WaitForChild("Staff")
local StaffPage = require(Staff:WaitForChild("StaffPage"))
return {
    Menu = function(p1) -- Line: 55 -- upvalues: useTheme (val), useRem (val), useTextScale (val), Theme (val), react (val), CalendarDate (val), useStore (val), Administration (val), Player (val), Permissions (val), ClientSettingsHandler (val), State (val), Frame (val), DynamicPage (val), Label (val), TransparencyGroup (val), SidebarSelection (val)
        local Home, Home_2, u14, u15, u22, v1
        local v2 = useTheme()
        local v3 = useRem()
        local v4 = useTextScale()
        local v5 = Theme.getContentLayout(v3)
        u14, u15 = react.useState(false)
        v1, u22 = react.useState(CalendarDate.formatSeasonYear())
        local v6 = useStore(Administration.Store, function(p1) -- Line: 72
            return p1
        end)
        local v7 = useStore(Player.Store, function(p1) -- Line: 77
            return p1
        end)
        local client = v7
        if client then
            client = v7.client
            if client then
                client = v7.client.status == 1
            end
        end
        local v8 = {
            {"Home", "rbxassetid://11433532654"},
            {"Progression", "rbxassetid://12967618029"},
            {"Profile", "rbxassetid://11963361597"},
            {"Organizations", "rbxassetid://11432832657"},
            {"Economy", "rbxassetid://11419719162"},
            {"Settings", "rbxassetid://11293977610"},
        }
        if v6.permission and Permissions.Accessability.Events <= v6.permission and v6.staffSlot == 1 then
            table.insert(v8, {"Admin", "rbxassetid://11422919294"})
        end
        Home, Home_2 = react.useState("Home")
        react.useEffect(function() -- Line: 105 -- upvalues: client (val), u15 (val), ClientSettingsHandler (upval), u14 (val)
            if not client then
                return u15(false)
            end
            local u11 = ClientSettingsHandler.onKeybindPressed("Open Menu"):Connect(function() -- Line: 110 -- upvalues: u15 (upval), u14 (upval)
                u15(not u14)
            end)
            return function() -- Line: 114 -- upvalues: u11 (val)
                u11:Disconnect()
            end
        end, {client, u14})
        react.useEffect(function() -- Line: 119 -- upvalues: u22 (val), CalendarDate (upval)
            (function() -- Line: 120 -- upvalues: u22 (upval), CalendarDate (upval)
                u22(CalendarDate.formatSeasonYear())
            end)()
        end, {})
        react.useEffect(function() -- Line: 127 -- upvalues: State (upval), u14 (val), Home (val)
            State("isMenuOpen")({open = u14, page = Home})
        end, {u14, Home})
        local v9 = {}
        local v10 = {Enabled = p1.Enabled or u14}
        local v11 = {}
        local v12 = {
            BackgroundTransparency = 1,
            Text = Home,
            TextSize = v4(50),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }
        local v13 = UDim2.fromScale(0.5, 0)
        v12.Position = v13 + UDim2.fromOffset(v5.centerOffsetX, v3(70))
        v13 = UDim2.fromScale(1, 0)
        v12.Size = v13 + UDim2.fromOffset(v5.widthOffset, v3(50))
        v12.TextXAlignment = Enum.TextXAlignment.Left
        v12.TextYAlignment = Enum.TextYAlignment.Center
        v11.Header = react.createElement(Label, v12, {Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(Theme.MAX_WIDTH, math.huge)})})
        v12 = {
            Text = v1,
            TextSize = v4(25),
            TextColor3 = v2.Text.Secondary,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }
        v13 = UDim2.fromScale(0.5, 0)
        v12.Position = v13 + UDim2.fromOffset(v5.centerOffsetX, v3(105))
        v13 = UDim2.fromScale(1, 0)
        v12.Size = v13 + UDim2.fromOffset(v5.widthOffset, v3(25))
        v12.TextXAlignment = Enum.TextXAlignment.Left
        v12.TextYAlignment = Enum.TextYAlignment.Center
        v11.Date = react.createElement(Label, v12, {Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(Theme.MAX_WIDTH, math.huge)})})
        v9.Background = react.createElement(DynamicPage, v10, v11)
        v9.Sidebar = react.createElement(TransparencyGroup, {
            ZIndex = 2,
            Enabled = p1.Enabled or u14,
            Tween = TweenInfo.new(0.3),
            Delays = {Enabled = 0.2, Disabled = 0},
        }, {Sidebar = react.createElement(SidebarSelection, {Pages = v8, Clicked = Home_2, Selected = Home})})
        return react.createElement(Frame, {}, v9)
    end,
    Pages = function() -- Line: 214 -- upvalues: react (val), Page (val), HomePage (val), ProgressionPage (val), SettingsPage (val), ProfilePage (val), OrganizationsPage (val), EconomyPage (val), StaffPage (val)
        return react.createElement(react.Fragment, {}, {
            Home = react.createElement(Page, {Name = "Home"}, react.createElement(HomePage)),
            Progression = react.createElement(Page, {Name = "Progression"}, react.createElement(ProgressionPage)),
            Settings = react.createElement(Page, {Name = "Settings"}, react.createElement(SettingsPage)),
            Profile = react.createElement(Page, {Name = "Profile"}, react.createElement(ProfilePage)),
            Organizations = react.createElement(Page, {Name = "Organizations"}, react.createElement(OrganizationsPage)),
            Economy = react.createElement(Page, {Name = "Economy"}, react.createElement(EconomyPage)),
            Admin = react.createElement(Page, {Name = "Admin"}, react.createElement(StaffPage)),
        })
    end,
}