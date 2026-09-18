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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.BranchMembersPage
--                               Dumped in 0.00371 seconds
--                          Bytecode version 9  |  27 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local String = require(Utilities_2:WaitForChild("String"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local Image = require(Primitives_2:WaitForChild("Image"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local Label = require(Primitives_3:WaitForChild("Label"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_4 = Components_5:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal = Components_6:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs = Components_7:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Routes = Interfaces_8:WaitForChild("Routes")
local Screen = Routes:WaitForChild("Screen")
local ContextMenu = require(Screen:WaitForChild("ContextMenu"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_8 = Interfaces_9:WaitForChild("Components")
local Inputs_2 = Components_8:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_9 = Interfaces_10:WaitForChild("Components")
local Universal_2 = Components_9:WaitForChild("Universal")
local Loading = require(Universal_2:WaitForChild("Loading"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_10 = Interfaces_11:WaitForChild("Components")
local Universal_3 = Components_10:WaitForChild("Universal")
local Pagination = require(Universal_3:WaitForChild("Pagination"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_11 = Interfaces_12:WaitForChild("Components")
local Screen_2 = Components_11:WaitForChild("Screen")
local Popup = require(Screen_2:WaitForChild("Popup"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks = Interfaces_13:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_14:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks_2:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_15:WaitForChild("Hooks")
local useConstants = require(Hooks_3:WaitForChild("useConstants"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_16:WaitForChild("Hooks")
local useOrder = require(Hooks_4:WaitForChild("useOrder"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_17 = Client_17:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_17:WaitForChild("Hooks")
local usePopup = require(Hooks_5:WaitForChild("usePopup"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_18 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_18 = Client_18:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_18:WaitForChild("Hooks")
local useProfile = require(Hooks_6:WaitForChild("useProfile"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_19 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_19 = Client_19:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_19:WaitForChild("Hooks")
local useRem = require(Hooks_7:WaitForChild("useRem"))
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local Client_20 = ReplicatedStorage_26:WaitForChild("Client")
local Interfaces_20 = Client_20:WaitForChild("Interfaces")
local Hooks_8 = Interfaces_20:WaitForChild("Hooks")
local useTheme = require(Hooks_8:WaitForChild("useTheme"))
local ReplicatedStorage_27 = game:GetService("ReplicatedStorage")
local Client_21 = ReplicatedStorage_27:WaitForChild("Client")
local Interfaces_21 = Client_21:WaitForChild("Interfaces")
local Hooks_9 = Interfaces_21:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_9:WaitForChild("useThrottleCallback"))
local function UpdateMemberDetachmentPopup(p1) -- Line: 56 -- upvalues: useRem (val), react (val), Popup (val), DropdownInput (val), Branch (val), Button (val)
    local u13, v1
    local closePopup = p1.closePopup
    if not closePopup then
        function closePopup() end
    end
    v1, u13 = react.useMemo(function() -- Line: 64 -- upvalues: p1 (val)
        local v1 = {"None"}
        local v2 = {}
        for i, v in ipairs(p1.branch.detachments) do
            v2[v.name] = v.id
            v1[#v1 + 1] = v.name
        end
        return v1, v2
    end, {p1.branch.detachments})
    local v2 = {Header = react.createElement(Popup.Header, {Header = "Assign Detachment", Body = "Assign a branch member a new detachment."})}
    local v3 = {}
    local v4 = {
        Visible = true,
        Center = true,
        Full = true,
        Color = Color3.fromRGB(20, 20, 20),
        Default = p1.member.detachment.detachment_name,
        Options = v1,
        Selected = function(a1) -- Line: 96 -- upvalues: u13 (val), Branch (upval), p1 (val)
            Branch.AssignDetachment.post({user = p1.member.user_id, detachment = u13[a1]})
        end,
    }
    local v5 = {BackgroundTransparency = 1}
    local v6 = UDim2.fromScale(1, 0)
    v5.Size = v6 + UDim2.fromOffset(0, useRem()(70))
    v4.Native = v5
    v3.Dropdown = react.createElement(DropdownInput, v4)
    v2.Body = react.createElement(Popup.Body, {Padding = 30, Bottom = 30}, v3)
    v2.Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Type = 3,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        Clicked = function() -- Line: 120 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v2)
end
local function BranchMemberManagement(p1) -- Line: 128 -- upvalues: useTheme (val), useConstants (val), useRem (val), useProfile (val), useAlertPopup (val), Branch (val), react (val), useAsyncEffect (val), Promise (val), Branches (val), Table (val), String (val), Frame (val), Loading (val), ContextMenu (val), UpdateMemberDetachmentPopup (val), Image (val), Color (val), Label (val), Badge (val), DropdownInput (val)
    local Primary, u19, u20, u8, v1, v2, v3
    local v4 = useTheme()
    local v5 = useConstants()
    local v6 = useRem()
    u8, v2, v3 = useProfile()
    local openPopup = p1.openPopup
    local closePopup = p1.closePopup
    local u15 = useAlertPopup(function(a1) -- Line: 146 -- upvalues: Branch (upval), p1 (val)
        if not a1 then
            return
        end
        Branch.Action.post({action = 2, user = p1.member.user_id})
    end)
    u19, u20 = react.useState(false)
    react.useEffect(function() -- Line: 159 -- upvalues: u8 (val), p1 (val)
        u8(p1.member.user_id)
    end, {p1.member.user_id})
    useAsyncEffect(function() -- Line: 163 -- upvalues: u19 (val), Promise (upval), u20 (val)
        if not u19 then
            return
        end
        return Promise.delay(0.5):andThen(function() -- Line: 168 -- upvalues: u20 (upval)
            u20(false)
        end)
    end, {u19})
    local v7 = Table.inverse(Branches.BranchRanks[p1.member.branch_id])
    local v8 = String.capitalizeAllFirstLetters(v7[p1.member.rank_id] or "None")
    local v9 = Color3.fromRGB(p1.member.detachment.r, p1.member.detachment.g, p1.member.detachment.b)
    local createElement = react.createElement
    local v10 = {BackgroundTransparency = 0, BackgroundColor3 = v4.Container.Background, ZIndex = 12 - p1.order, LayoutOrder = p1.order}
    local v11 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v4.Container.Stroke})}
    local enabled = p1.enabled
    if enabled then
        enabled = react.createElement(Loading, {Corner = 4, Padding = "Medium", Enabled = u19})
    end
    v11.Loading = enabled
    local v12 = {}
    local v13 = {}
    local v14 = {label = "Discharge Member"}
    local v15 = {}
    if p1.member.suspended ~= 0 then
        v1 = "Unsuspend Member"
    else
        v1 = "Suspend Member"
    end
    v15.label = v1
    v13[1] = {label = "Update Detachment"}
    v13[2] = v14
    v13[3] = v15
    v12.Contexts = v13
    function v12.Callback(a1) -- Line: 212 -- upvalues: openPopup (val), p1 (val), react (upval), UpdateMemberDetachmentPopup (upval), closePopup (val), u15 (val), Branch (upval)
        if a1 == 1 then
            local v1 = {}
            v1["Detachment$" .. p1.member.user_id] = react.createElement(UpdateMemberDetachmentPopup, {member = p1.member, branch = p1.branch, closePopup = closePopup})
            openPopup(v1)
            return
        end
        if a1 == 2 then
            u15("Discharge Member", "Are you sure you want to discharge this member?", Color3.fromRGB(255, 0, 0))
            return
        end
        Branch.Action.post({user = p1.member.user_id, action = a1})
    end
    v11.Context = react.createElement(ContextMenu.ContextMenu, v12)
    v11.Padding = react.createElement("UIPadding", v5.Padding.Universal.Medium)
    v12 = {BackgroundTransparency = 0}
    local v16 = v6(57)
    v12.Size = UDim2.fromOffset(v16, v6(57))
    v16 = v6(15)
    v12.Position = UDim2.fromOffset(v16, 0)
    v12.Image = v2
    v12.AnchorPoint = Vector2.new(0, 0)
    v12.BackgroundColor3 = Color.Darken(v4.Primary, 0.8)
    v13 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    v11.Image = react.createElement(Image, v12, v13)
    local createElement_2 = react.createElement
    local v17 = Label
    v12 = {TextSize = 14, Text = p1.member.lore_name}
    v16 = v6(80)
    v12.Position = UDim2.fromOffset(v16, v6(3))
    v12.AnchorPoint = Vector2.new(0, 0)
    local Darken = Color.Darken
    if p1.member.suspended ~= 0 then
        Primary = Color3.fromRGB(255, 0, 0)
    else
        Primary = v4.Primary
    end
    v12.TextColor3 = Darken(Primary, 0.8)
    v12.TextXAlignment = Enum.TextXAlignment.Left
    v11.LoreName = createElement_2(v17, v12)
    v12 = {TextSize = 12, Text = "@" .. v3}
    v16 = v6(80)
    v12.Position = UDim2.fromOffset(v16, v6(19))
    v12.AnchorPoint = Vector2.new(0, 0)
    v12.TextColor3 = Color.Darken(v4.Primary, 0.6)
    v12.TextXAlignment = Enum.TextXAlignment.Left
    v11.Username = react.createElement(Label, v12)
    v17 = p1.member.detachment.abbreviation == "N/A"
    local v18 = not v17
    if v18 then
        v17 = p1.member.suspended == 1
        v18 = not v17
        if v18 then
            v12 = {
                Scale = 0.85,
                Ratio = 1.05,
                Text = tostring(p1.member.detachment.abbreviation),
                Weight = Enum.FontWeight.Bold,
                Color = v9,
            }
            v13 = {}
            v14 = v6(80)
            v13.Position = UDim2.fromOffset(v14, v6(38))
            v12.Native = v13
            v18 = react.createElement(Badge, v12)
        end
    end
    v11.Detachment = v18
    v18 = false
    if p1.member.suspended == 1 then
        v12 = {
            Text = "Suspended",
            Scale = 0.85,
            Ratio = 1.05,
            Weight = Enum.FontWeight.Bold,
            Color = Color3.fromRGB(142, 4, 4),
        }
        v13 = {}
        v14 = v6(80)
        v13.Position = UDim2.fromOffset(v14, v6(38))
        v12.Native = v13
        v18 = react.createElement(Badge, v12)
    end
    v11.Suspended = v18
    local adjustable = p1.adjustable
    if adjustable then
        adjustable = react.createElement(DropdownInput, {
            Visible = true,
            Padding = "None",
            Center = true,
            Darken = 0.7,
            Default = v8,
            Radius = UDim.new(0, 8),
            Options = p1.lower,
            Selected = function(a1) -- Line: 311 -- upvalues: u20 (val), Branch (upval), p1 (val)
                u20(true)
                Branch.Promote.post({user = p1.member.user_id, rank = a1})
            end,
            Native = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromScale(0.5, 1.15)},
        })
    end
    v11.Dropdown = adjustable
    return createElement(Frame, v10, v11)
end
return function(p1) -- Line: 331 -- upvalues: useOrder (val), react (val), usePopup (val), Branches (val), Table (val), String (val), useAsyncEffect (val), Promise (val), useThrottleCallback (val), Branch (val), BranchMemberManagement (val), Frame (val), VerticalListLayout (val), Pagination (val)
    local Enabled, None, None_2, None_3, None_4, Recruit, Recruit_2, u194, u205, u210, u30, u7, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = useOrder()
    v3, u7 = react.useState({})
    v7, v8, v9 = usePopup()
    Recruit, Recruit_2 = react.useState("Recruit")
    None, None_2 = react.useState("None")
    u194, u205 = react.useState(false)
    u30, u210 = react.useState(1)
    None_3, None_4 = react.useState("None")
    v1, v2 = react.useMemo(function() -- Line: 345 -- upvalues: Branches (upval), p1 (val), Table (upval), String (upval)
        local v1
        local v2 = Branches.BranchRanks[p1.Branch.branch_id]
        if not v2 then
            v2 = {}
        end
        local u7 = {}
        v2 = Table.inverse(v2)
        v1 = Table.map(v2, function(a1, p2) -- Line: 350 -- upvalues: String (upval), p1 (upval), u7 (val)
            local v1 = String.capitalizeAllFirstLetters(a1)
            if p2 < p1.Branch.member.rank_id then
                u7[p2] = v1
            end
            return v1
        end)
        table.insert(v1, 1, "None")
        return v1, u7
    end, {p1.Branch.branch_id, p1.Branch.member.rank_id})
    local v11 = react.useMemo(function() -- Line: 366 -- upvalues: p1 (val)
        local v1 = {"None"}
        local v2 = {}
        for i, v in ipairs(p1.Branch.detachments) do
            v2[v.name] = v.id
            v1[#v1 + 1] = v.name
        end
        return v1, v2
    end, {p1.Branch.detachments})
    useAsyncEffect(function() -- Line: 379 -- upvalues: u7 (val), p1 (val), Promise (upval), u205 (val)
        u7(p1.Branch.pagination)
        return Promise.delay(0.5):andThen(function() -- Line: 382 -- upvalues: u205 (upval)
            u205(false)
        end)
    end, {p1.Branch.pagination})
    local u69 = useThrottleCallback(function() -- Line: 387 -- upvalues: u205 (val), Branch (upval), u30 (val), Recruit (val), None_3 (val), None (val)
        u205(true)
        Branch.Paginate.post({
            limit = 12,
            page = u30,
            filter = Recruit,
            search = None_3,
            subfilter = None,
        })
    end, {wait = 20, trailing = false}, {u30, Recruit, None_3, None})
    react.useEffect(function() -- Line: 392 -- upvalues: p1 (val), u69 (val)
        if not p1.Enabled or not p1.Selected then
            return
        end
        u69.run()
    end, {p1.Enabled, p1.Selected, u69})
    useAsyncEffect(function() -- Line: 400 -- upvalues: u194 (val), Promise (upval), u205 (val)
        if not u194 then
            return
        end
        return Promise.delay(0.5):andThen(function() -- Line: 406 -- upvalues: u205 (upval)
            u205(false)
        end)
    end, {u194})
    local v12 = {}
    local u125 = p1
    for i, v in ipairs(v3) do
        if 12 < i then
            break
        end
        v4 = tostring(v.user_id)
        v5 = {member = v, ranks = v1, lower = v2, order = v10()}
        Enabled = u125.Enabled
        if Enabled then
            Enabled = u125.Selected
        end
        v5.enabled = Enabled
        v6 = v.rank_id < u125.Branch.member.rank_id
        v5.adjustable = v6
        v5.branch = u125.Branch
        v5.openPopup = v7
        v5.closePopup = v8
        v12[v4] = react.createElement(BranchMemberManagement, v5)
    end
    local v13 = {Visible = u125.Enabled}
    local v14 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    v4 = {
        Header = "Branch Members",
        Default = "Recruit",
        Width = "Medium",
        Length = 405,
        Maximum = 12,
        Search = true,
        Subfilters = v11,
        Filters = v1,
        Results = {},
        Native = {LayoutOrder = v10()},
        Size = UDim2.new(0.24271844660194175, 0, 0.3205128205128205, 0),
        Pages = u125.Branch.pages,
    }
    local Enabled_2 = u194
    if Enabled_2 then
        Enabled_2 = u125.Enabled
        if Enabled_2 then
            Enabled_2 = u125.Selected
        end
    end
    v4.Loading = Enabled_2
    function v4.Paged(p1) -- Line: 461 -- upvalues: u205 (val), u210 (val)
        u205(true)
        u210(p1)
    end
    function v4.Filtered(p1) -- Line: 474 -- upvalues: u205 (val), Recruit_2 (val)
        u205(true)
        Recruit_2(p1)
    end
    function v4.Subfiltered(p1) -- Line: 481 -- upvalues: u205 (val), Branch (upval), Recruit (val), None_2 (val)
        u205(true)
        Branch.Paginate.post({
            page = 1,
            search = "None",
            limit = 12,
            filter = Recruit,
            subfilter = p1,
        })
        None_2(p1)
    end
    function v4.Searched(p1) -- Line: 488 -- upvalues: Recruit_2 (val), None_2 (val), None_4 (val), u205 (val)
        local None, v1
        if p1 ~= "" then
            v1 = p1
        else
            v1 = "None"
        end
        local v2 = v1
        if v2 and v2 == "None" then
            Recruit_2("Recruit")
            None_2("None")
        end
        None_4(v2)
        u205(true)
    end
    v14.Members = react.createElement(Pagination.Pagination, v4, v12)
    v14.MemberPopup = v9
    return react.createElement(Frame, v13, v14)
end