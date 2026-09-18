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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.BranchHomePage
--                               Dumped in 0.00189 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Branch = require(Namespaces:WaitForChild("Branch"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Pagination = require(Universal:WaitForChild("Pagination"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_3:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_2 = Components_5:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Badge = require(Universal_4:WaitForChild("Badge"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Primitives_4 = Components_8:WaitForChild("Primitives")
local Image = require(Primitives_4:WaitForChild("Image"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks = Interfaces_9:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_12:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_4:WaitForChild("useThrottleCallback"))
local function BranchMemberOverview(p1) -- Line: 54 -- upvalues: useOrder (val), useRem (val), react (val), Branches (val), Players (val), useAsyncEffect (val), Promise (val), Form (val), Frame (val), Image (val), HeaderBodyComponent (val), HorizontalListLayout (val), Badge (val)
    local u9, v1, v2
    local v3 = useOrder()
    local v4 = useRem()
    v2, u9 = react.useState("")
    local detachment_name = p1.member.detachment.detachment_name
    local v5 = p1.member.branch_id == Branches.Branches.TRAINEE_CORPS
    local v6 = react.useMemo(function() -- Line: 62 -- upvalues: Players (upval)
        return Players.LocalPlayer.Name
    end, {})
    useAsyncEffect(function() -- Line: 66 -- upvalues: Promise (upval), Players (upval), u9 (val)
        return Promise.new(function(p1) -- Line: 67 -- upvalues: Players (upval), u9 (upval)
            local v1 = tonumber(Players.LocalPlayer.UserId)
            local UserThumbnailAsync = Players:GetUserThumbnailAsync(v1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            u9(UserThumbnailAsync)
            p1()
        end)
    end, {})
    local v7 = {}
    local v8 = {}
    local v9 = {BackgroundTransparency = 1}
    local v10 = v4(90)
    v9.Size = UDim2.fromOffset(v10, v4(160))
    v9.Position = UDim2.fromScale(0.025, 0.5)
    v9.AnchorPoint = Vector2.new(0, 0.5)
    v9.LayoutOrder = v3()
    local v11 = {}
    local v12 = {}
    local v13 = v4(90)
    v12.Size = UDim2.fromOffset(v13, v4(90))
    v12.Image = v2
    local v14 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v11.Image = react.createElement(Image, v12, v14)
    v8.Icon = react.createElement(Frame, v9, v11)
    v9 = {BackgroundTransparency = 1}
    v10 = v4(300)
    v9.Size = UDim2.fromOffset(v10, v4(90))
    v9.LayoutOrder = v3()
    v11 = {}
    v12 = {Wrap = false, Header = v6}
    if not v5 then
        v14 = "Branch Member"
    else
        v14 = "Enlisted Trainee Member"
    end
    v12.Body = v14
    v13 = UDim2.fromScale(0, 0.5)
    v12.Position = v13 + UDim2.fromOffset(0, -v4(25))
    v11.Label = react.createElement(HeaderBodyComponent, v12)
    v12 = {BackgroundTransparency = 1}
    v13 = UDim2.fromScale(0, 0.5)
    v12.Position = v13 + UDim2.fromOffset(0, v4(5))
    v12.Size = UDim2.fromScale(1, 0.5)
    v12.AnchorPoint = Vector2.new(0, 0)
    v14 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}), Rank = react.createElement(Badge, {
        Outline = true,
        Text = tostring(p1.member.rank),
        Color = Color3.fromRGB(97, 97, 97),
        TextColor = Color3.fromRGB(183, 183, 183),
        Native = {LayoutOrder = v3()},
    })}
    local v15 = {Outline = true}
    if detachment_name ~= "None" then
        v1 = detachment_name .. " Detachment"
    else
        v1 = "Detachmentless"
    end
    v15.Text = tostring(v1)
    v15.Color = Color3.fromRGB(97, 97, 97)
    v15.TextColor = Color3.fromRGB(183, 183, 183)
    v15.Native = {LayoutOrder = v3(), Visible = not v5}
    v14.Detachment = react.createElement(Badge, v15)
    v11.Tags = react.createElement(Frame, v12, v14)
    v8.Frame = react.createElement(Frame, v9, v11)
    v7.Left = react.createElement(Form.Divider, {Side = "Left", Padding = "Large"}, v8)
    return react.createElement(Form.Form, {Darken = false, Height = "Large"}, v7)
end
return function(p1) -- Line: 153 -- upvalues: useOrder (val), react (val), Branches (val), Table (val), String (val), useThrottleCallback (val), Branch (val), useAsyncEffect (val), Promise (val), Frame (val), VerticalListLayout (val), BranchMemberOverview (val), Pagination (val)
    local None, None_2, Recruit, Recruit_2, u12, u21, u22, u26, u27, v1
    Recruit, Recruit_2 = react.useState("Recruit")
    v1, u12 = react.useState({})
    None, None_2 = react.useState("None")
    u21, u22 = react.useState(1)
    u26, u27 = react.useState(true)
    local v2 = react.useMemo(function() -- Line: 163 -- upvalues: p1 (val)
        local v1 = {"None"}
        local v2 = {}
        for i, v in ipairs(p1.Branch.detachments) do
            v2[v.name] = v.id
            v1[#v1 + 1] = v.name
        end
        return v1, v2
    end, {p1.Branch.detachments})
    local v3 = react.useMemo(function() -- Line: 176 -- upvalues: Branches (upval), p1 (val), Table (upval), String (upval)
        local v1 = Branches.BranchRanks[p1.Branch.branch_id]
        if not v1 then
            v1 = {}
        end
        v1 = Table.inverse(v1)
        local v2 = Table.map(v1, function(p1) -- Line: 180 -- upvalues: String (upval)
            return String.capitalizeAllFirstLetters(p1)
        end)
        table.insert(v2, 1, "None")
        return v2
    end, {p1.Branch.branch_id})
    local u49 = useThrottleCallback(function() -- Line: 189 -- upvalues: u27 (val), Branch (upval), u21 (val), Recruit (val), None (val)
        u27(true)
        Branch.Paginate.post({
            limit = 20,
            search = "None",
            page = u21,
            filter = Recruit,
            subfilter = None,
        })
    end, {wait = 15, trailing = false}, {u21, Recruit, None})
    useAsyncEffect(function() -- Line: 194 -- upvalues: p1 (val), u49 (val), Promise (upval), u27 (val)
        if not p1.Enabled or not p1.Selected then
            return
        end
        u49.run()
        return Promise.delay(0.5):andThen(function() -- Line: 200 -- upvalues: u27 (upval)
            u27(false)
        end)
    end, {p1.Enabled, p1.Selected, u49})
    useAsyncEffect(function() -- Line: 205 -- upvalues: Table (upval), p1 (val), u12 (val), Promise (upval), u27 (val)
        local v1 = Table.map(p1.Branch.pagination, function(p1) -- Line: 206
            return p1.user_id
        end)
        u12(v1)
        return Promise.delay(0.5):andThen(function() -- Line: 212 -- upvalues: u27 (upval)
            u27(false)
        end)
    end, {p1.Branch.pagination})
    useAsyncEffect(function() -- Line: 217 -- upvalues: u26 (val), Promise (upval), u27 (val)
        if not u26 then
            return
        end
        return Promise.delay(0.5):andThen(function() -- Line: 223 -- upvalues: u27 (upval)
            u27(false)
        end)
    end, {u26})
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top}), Overview = react.createElement(BranchMemberOverview, {member = p1.Branch.member}), Members = react.createElement(Pagination.Pagination, {
        Header = "Branch Members",
        Default = "Recruit",
        Maximum = 20,
        Width = "None",
        Filters = v3,
        Results = v1,
        Subfilters = v2,
        Native = {LayoutOrder = useOrder()()},
        Pages = p1.Branch.pages,
        Loading = u26,
        Paged = function(p1) -- Line: 258 -- upvalues: u27 (val), u22 (val)
            u27(true)
            u22(p1)
        end,
        Subfiltered = function(p1) -- Line: 271 -- upvalues: u27 (val), None_2 (val)
            u27(true)
            None_2(p1)
        end,
        Filtered = function(p1) -- Line: 278 -- upvalues: u27 (val), Recruit_2 (val)
            u27(true)
            Recruit_2(p1)
        end,
    })})
end