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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.ProgressionPage
--                               Dumped in 0.00138 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Error = require(Interfaces:WaitForChild("Error"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components = Interfaces_2:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_4:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_5:WaitForChild("Components")
local Menu = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_6:WaitForChild("Components")
local Menu_2 = Components_5:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_7:WaitForChild("Components")
local Menu_3 = Components_6:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local EnchantmentPage = require(Subpages:WaitForChild("EnchantmentPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local ProficiencyPage = require(Subpages_2:WaitForChild("ProficiencyPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local SacramentsPage = require(Subpages_3:WaitForChild("SacramentsPage"))
local Subpages_4 = v1.Parent:WaitForChild("Subpages")
require(Subpages_4:WaitForChild("BlessingPage"))
local Subpages_5 = v1.Parent:WaitForChild("Subpages")
require(Subpages_5:WaitForChild("DisciplinesPage"))
local Subpages_6 = v1.Parent:WaitForChild("Subpages")
require(Subpages_6:WaitForChild("VowsPage"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks = Interfaces_8:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local u328 = {}
local v3 = {Name = "Enchantments", Label = "Enchantments", Color = Color3.fromRGB(93, 158, 255)}
local v4 = {Name = "Sacraments", Label = "Sacraments", Color = Color3.fromRGB(115, 255, 102)}
local v5 = {Name = "Proficiencies", Label = "Proficiencies", Color = Color3.fromRGB(255, 118, 118)}
u328[1] = v3
u328[2] = v4
u328[3] = v5
return function(p1) -- Line: 60 -- upvalues: react (val), u328 (val), useMenuPage (val), useRem (val), Tablet (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), ScrollingFrame (val), Error (val), EnchantmentPage (val), SacramentsPage (val), ProficiencyPage (val)
    local u7, v1, v2, v3
    v1, u7 = react.useState(u328[1].Name)
    local Progression = useMenuPage("Progression")
    local v4 = useRem()
    local v5 = {}
    for i, v in ipairs(u328) do
        v2 = {Text = v.Label}
        v3 = v1 == v.Name
        v2.Selected = v3
        v2.LayoutOrder = i
        v3 = i < #u328
        v2.ShowDivider = v3
        function v2.Clicked() -- Line: 75 -- upvalues: u7 (val), v (val)
            u7(v.Name)
        end
        v5[v.Name] = react.createElement(Tablet, v2)
    end
    local v6 = {
        Enabled = Progression,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v7 = {}
    local v8 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Tabs = react.createElement(TabLayout, {}, v5)}
    local v9 = {BackgroundTransparency = 1}
    local v10 = UDim2.fromScale(1, 1)
    v9.Size = v10 + UDim2.fromOffset(0, -v4(75))
    v10 = UDim2.fromScale(0.5, 0)
    v9.Position = v10 + UDim2.fromOffset(0, v4(75))
    v9.AnchorPoint = Vector2.new(0.5, 0)
    local v11 = {}
    local v12 = {ClipsDescendants = false, Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v13 = {}
    local v14 = {}
    local v15 = {}
    local v16 = if v1 == "Enchantments" then Progression else false
    v15.Enabled = v16
    v14.Enchantments = react.createElement(EnchantmentPage, v15)
    v13.Enchantments = react.createElement(Error.Boundary, {}, v14)
    v14 = {}
    v15 = {}
    v16 = v1 == "Sacraments"
    v15.Enabled = v16
    v14.Sacraments = react.createElement(SacramentsPage, v15)
    v13.Sacraments = react.createElement(Error.Boundary, {}, v14)
    v14 = {}
    v15 = {}
    v16 = v1 == "Proficiencies"
    v15.Enabled = v16
    v14.Proficiencies = react.createElement(ProficiencyPage, v15)
    v13.Proficiencies = react.createElement(Error.Boundary, {}, v14)
    v11.Scroll = react.createElement(ScrollingFrame, v12, v13)
    v8.Subpages = react.createElement("Frame", v9, v11)
    v7.Content = react.createElement(Content, {}, v8)
    return react.createElement(TransparencyGroup, v6, v7)
end