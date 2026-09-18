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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Refactor.V2ProfilePage
--                              Dumped in 0.000897 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Menu_3 = Components_5:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local Subpages = script.Parent.Parent.Parent:WaitForChild("Subpages")
local Profile = Subpages:WaitForChild("Profile")
local Subpages_2 = Profile:WaitForChild("Subpages")
local PersonalPage = require(Subpages_2:WaitForChild("PersonalPage"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local u237 = {"Personal", "Companions", "Vouchers"}
return function() -- Line: 39 -- upvalues: react (val), u237 (val), useMenuPage (val), useRem (val), Tablet (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), PersonalPage (val)
    local u5, v1, v2, v3
    v1, u5 = react.useState(u237[1])
    local Profile = useMenuPage("Profile")
    local v4 = useRem()
    local v5 = {}
    for i, v in ipairs(u237) do
        v2 = {Text = v}
        v3 = v1 == v
        v2.Selected = v3
        v2.LayoutOrder = i
        v3 = i < #u237
        v2.ShowDivider = v3
        function v2.Clicked() -- Line: 53 -- upvalues: u5 (val), v (val)
            u5(v)
        end
        v5[v] = react.createElement(Tablet, v2)
    end
    local v6 = {
        Enabled = Profile,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v7 = {}
    v2 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Tabs = react.createElement(TabLayout, {}, v5)}
    local v8 = {BackgroundTransparency = 1}
    local v9 = UDim2.fromScale(1, 1)
    v8.Size = v9 + UDim2.fromOffset(0, -v4(75))
    v9 = UDim2.fromScale(0.5, 0)
    v8.Position = v9 + UDim2.fromOffset(0, v4(75))
    v8.AnchorPoint = Vector2.new(0.5, 0)
    local v10 = {}
    local v11 = {}
    local v12 = Profile
    if v12 then
        v12 = v1 == "Personal"
    end
    v11.Enabled = v12
    v10.Personal = react.createElement(PersonalPage, v11)
    v2.Subpages = react.createElement("Frame", v8, v10)
    v7.Content = react.createElement(Content, {}, v2)
    return react.createElement(TransparencyGroup, v6, v7)
end