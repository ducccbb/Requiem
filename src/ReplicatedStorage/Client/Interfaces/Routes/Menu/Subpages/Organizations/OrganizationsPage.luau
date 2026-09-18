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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.OrganizationsPage
--                               Dumped in 0.00114 seconds
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
local Subpages = v1.Parent:WaitForChild("Subpages")
local Bloodline = Subpages:WaitForChild("Bloodline")
local BloodlinePage = require(Bloodline:WaitForChild("BloodlinePage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local Branch = Subpages_2:WaitForChild("Branch")
local BranchPage = require(Branch:WaitForChild("BranchPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local Treasuries = Subpages_3:WaitForChild("Treasuries")
local TreasuryPage = require(Treasuries:WaitForChild("TreasuryPage"))
local u307 = {"Military Branch", "Bloodline", "Treasuries"}
return function(p1) -- Line: 48 -- upvalues: react (val), u307 (val), useMenuPage (val), useRem (val), Tablet (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), ScrollingFrame (val), Error (val), BranchPage (val), BloodlinePage (val), TreasuryPage (val)
    local u6, v1, v2, v3
    v1, u6 = react.useState(u307[1])
    local Organizations = useMenuPage("Organizations")
    local v4 = useRem()
    local v5 = {}
    for i, v in ipairs(u307) do
        v2 = {Text = v}
        v3 = v1 == v
        v2.Selected = v3
        v2.LayoutOrder = i
        v3 = i < #u307
        v2.ShowDivider = v3
        function v2.Clicked() -- Line: 63 -- upvalues: u6 (val), v (val)
            u6(v)
        end
        v5[v] = react.createElement(Tablet, v2)
    end
    local v6 = {
        Enabled = Organizations,
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
    local v11 = {Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}
    local v12 = {}
    local v13 = {}
    local v14 = {}
    local v15 = v1 == "Military Branch"
    v14.Enabled = v15
    v14.Selected = Organizations
    v13.Branch = react.createElement(BranchPage, v14)
    v12.Branch = react.createElement(Error.Boundary, {}, v13)
    v13 = {}
    v14 = {}
    v15 = Organizations
    if v15 then
        v15 = v1 == "Bloodline"
    end
    v14.Enabled = v15
    v13.Bloodline = react.createElement(BloodlinePage, v14)
    v12.Bloodline = react.createElement(Error.Boundary, {}, v13)
    v13 = {}
    v14 = {}
    v15 = v1 == "Treasuries"
    v14.Enabled = v15
    v14.Selected = Organizations
    v13.Treasuries = react.createElement(TreasuryPage, v14)
    v12.Treasuries = react.createElement(Error.Boundary, {}, v13)
    v10.Scroll = react.createElement(ScrollingFrame, v11, v12)
    v2.Subpages = react.createElement("Frame", v8, v10)
    v7.Content = react.createElement(Content, {}, v2)
    return react.createElement(TransparencyGroup, v6, v7)
end