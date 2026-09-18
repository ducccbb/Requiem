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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.BranchPage
--                               Dumped in 0.00179 seconds
--                          Bytecode version 9  |  5 functions

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
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Tabs = Menu:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local Tabs_2 = Menu_2:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_6:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local BranchAcceptancesPage = require(Subpages:WaitForChild("BranchAcceptancesPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local BranchAuditsPage = require(Subpages_2:WaitForChild("BranchAuditsPage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local Detachments = Subpages_3:WaitForChild("Detachments")
local BranchDetachmentsPage = require(Detachments:WaitForChild("BranchDetachmentsPage"))
local Subpages_4 = v1.Parent:WaitForChild("Subpages")
local BranchFinancialPage = require(Subpages_4:WaitForChild("BranchFinancialPage"))
local Subpages_5 = v1.Parent:WaitForChild("Subpages")
local BranchHomePage = require(Subpages_5:WaitForChild("BranchHomePage"))
local Subpages_6 = v1.Parent:WaitForChild("Subpages")
local BranchInvitesPage = require(Subpages_6:WaitForChild("BranchInvitesPage"))
local Subpages_7 = v1.Parent:WaitForChild("Subpages")
local BranchMembersPage = require(Subpages_7:WaitForChild("BranchMembersPage"))
local BranchOverviewSticky = require(v1.Parent:WaitForChild("BranchOverviewSticky"))
local u338 = {"Overview"}
local u340 = {
    "Manage Members",
    "Detachments",
    "Financials",
    "Audit Logs",
    "Acceptances",
}
local u346 = {
    "Manage Members",
    "Manage Scores",
    "Acknowledge Certifications",
    "Financials",
    "Audit Logs",
}
return function(p1) -- Line: 55 -- upvalues: useOrder (val), react (val), u338 (val), useStore (val), Branch (val), Branches (val), Table (val), u346 (val), u340 (val), Tablet (val), Frame (val), BranchInvitesPage (val), VerticalListLayout (val), BranchOverviewSticky (val), TabLayout (val), BranchHomePage (val), BranchMembersPage (val), BranchDetachmentsPage (val), BranchAuditsPage (val), BranchAcceptancesPage (val), BranchFinancialPage (val)
    local Branchless, member, u8, v1, v2, v3, v4
    local v5 = useOrder()
    v4, u8 = react.useState(u338[1])
    Branchless = useStore(Branch.Branch, function(p1) -- Line: 59 -- upvalues: Branches (upval)
        local Branchless = p1
        if not Branchless then
            Branchless = Branches.Branchless
        end
        return Branchless
    end)
    if not Branchless.member then
        Branchless = Branches.Branchless
    elseif Branchless.branch_id then
    end
    member = Branchless
    if member then
        member = Branchless.member
        if member then
            member = Branchless.member.branch_id == Branches.Branches.TRAINEE_CORPS
        end
    end
    local v6 = {}
    local member_2 = Branchless
    if member_2 then
        member_2 = Branchless.member
        if member_2 then
            member_2 = Branchless.member.suspended
        end
    end
    v6[1] = member_2
    react.useEffect(function() -- Line: 69 -- upvalues: Branchless (ref), u8 (val), u338 (upval)
        if Branchless.member.suspended == 1 then
            u8("Suspended")
            return
        end
        u8(u338[1])
    end, v6)
    local member_3 = Branchless
    if member_3 then
        member_3 = Branchless.member
        if member_3 then
            if Branches.Officer[Branchless.branch_id] or 100 <= Branchless.member.rank_id then
                member_3 = true
            else
                member_3 = false
            end
        end
    end
    local v7 = {}
    local join = Table.join
    if not member_3 then
        v1 = {}
    elseif not member then
        v1 = u340
    else
        v1 = u346
    end
    local v8 = join(u338, v1)
    v1 = nil
    local v9 = nil
    local v10 = p1
    for i, j in v8, v1, v9 do
        v2 = {Text = j}
        v3 = v4 == j
        v2.Selected = v3
        v2.LayoutOrder = v5()
        function v2.Clicked(...) -- Line: 91 -- upvalues: u8 (val), j (val)
            u8(j)
        end
        v7[j] = react.createElement(Tablet, v2)
    end
    v9 = {Visible = v10.Enabled}
    local v11 = {}
    local v12 = {}
    v2 = Branchless.member.branch_id == 0
    v12.Enabled = v2
    v12.Invitations = Branchless.invites
    v11.Invites = react.createElement(BranchInvitesPage, v12)
    v12 = {}
    v2 = Branchless.member.branch_id ~= 0
    v12.Visible = v2
    v2 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v13 = Branchless.member.branch_id == 0
    v3 = not v13
    if v3 then
        v3 = react.createElement(BranchOverviewSticky, {
            Enabled = true,
            Branch = Branchless,
            Native = {LayoutOrder = -2},
        })
    end
    v2.Sticky = v3
    v2.Tabs = react.createElement(TabLayout, {LayoutOrder = -1, Subtabs = true}, v7)
    local v14 = {}
    local v15 = v4 == "Overview"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.Home = react.createElement(BranchHomePage, v14)
    v14 = {}
    v15 = v4 == "Manage Members"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.BranchMemberPage = react.createElement(BranchMembersPage, v14)
    v14 = {}
    v15 = v4 == "Detachments"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.BranchDetachmentsPage = react.createElement(BranchDetachmentsPage, v14)
    v14 = {}
    v15 = v4 == "Audit Logs"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.BranchAuditsPage = react.createElement(BranchAuditsPage, v14)
    v14 = {}
    v15 = v4 == "Acceptances"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.BranchAcceptancesPage = react.createElement(BranchAcceptancesPage, v14)
    v14 = {}
    v15 = v4 == "Financials"
    v14.Enabled = v15
    v14.Branch = Branchless
    v14.Selected = v10.Selected
    v2.BranchFinancialPage = react.createElement(BranchFinancialPage, v14)
    v14 = {BackgroundTransparency = 1}
    v15 = v4 == "Suspended"
    v14.Visible = v15
    v14.Size = UDim2.new(1, 0, 1, 0)
    v14.AnchorPoint = Vector2.new(0.5, 0.5)
    v14.Position = UDim2.new(0.5, 0, 0.5, 0)
    v2.Suspended = react.createElement("Frame", v14, {Text = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 24,
        TextTransparency = 0.3,
        Size = UDim2.new(1, 0, 0.5, 0),
        Text = "You are currently suspended from the " .. Branchless.name .. ".",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
    })})
    v11.Branch = react.createElement(Frame, v12, v2)
    return react.createElement(Frame, v9, v11)
end