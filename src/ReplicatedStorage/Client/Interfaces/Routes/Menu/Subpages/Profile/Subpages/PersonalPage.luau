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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Profile.Subpages.PersonalPage
--                               Dumped in 0.00462 seconds
--                          Bytecode version 9  |  26 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Certifications = require(Namespaces:WaitForChild("Certifications"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Profile = require(Namespaces_2:WaitForChild("Profile"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_3 = Common_3:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Player = require(Namespaces_3:WaitForChild("Player"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local CalendarDate = require(Utilities:WaitForChild("CalendarDate"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Utilities_2 = Components:WaitForChild("Utilities")
local Color = require(Utilities_2:WaitForChild("Color"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Label = require(Primitives:WaitForChild("Label"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local DropdownInput = require(Inputs:WaitForChild("DropdownInput"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal = Components_5:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Universal_2 = Components_6:WaitForChild("Universal")
local Badge = require(Universal_2:WaitForChild("Badge"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_3 = Components_7:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_4 = Components_8:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_4:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Primitives_3 = Components_9:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local OutfitSubslotPicker = require(script.Parent:WaitForChild("OutfitSubslotPicker"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useOrder = require(Hooks:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_14:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local u480 = {Normals = "Normal Titan Kills", Abnormals = "Abnormal Titan Kills", Humans = "Human Kills"}
u480["Titan Assists"] = "Titan Assists"
u480["Titan Saves"] = "Titan Saves"
u480["Bandages Given"] = "Bandages Given"
u480["Bandages Received"] = "Bandages Received"
u480["Bandage Removals"] = "Bandage Removals"
u480["Self Bandages"] = "Self Bandages"
u480.Tackles = "Tackles"
u480.Arrests = "Arrests"
u480["Enchantments Opened"] = "Enchantments Opened"
local u493 = {Normals = 1, Abnormals = 2, Humans = 3}
u493["Titan Assists"] = 4
u493["Titan Saves"] = 5
u493["Bandages Given"] = 6
u493["Bandages Received"] = 7
u493["Bandage Removals"] = 8
u493["Self Bandages"] = 9
u493.Tackles = 10
u493.Arrests = 11
u493["Enchantments Opened"] = 12
local u506 = {}
local v2 = {
    Label = "Titan Assists",
    Keys = {"Titan Assists"},
}
local v3 = {
    Label = "Titan Saves",
    Keys = {"Titan Saves"},
}
local v4 = {Label = "Bandages Received"}
local v5 = {"Bandages Received"}
v4.Keys = v5
u506[1] = {
    Label = "Human Kills",
    Keys = {"Humans"},
}
u506[2] = {
    Label = "Titan Kills",
    Keys = {"Normals", "Abnormals"},
}
u506[3] = v2
u506[4] = v3
u506[5] = {
    Label = "Packs Opened",
    Keys = {"Enchantments Opened"},
}
u506[6] = v4
local u526 = {
    "Winter",
    "Winter",
    "Spring",
    "Spring",
    "Spring",
    "Summer",
    "Summer",
    "Summer",
    "Autumn",
    "Autumn",
    "Autumn",
    "Winter",
}
local v6 = {}
v6["Date of Birth"] = "rbxassetid://6031075938"
v6.Age = "rbxassetid://11963361597"
v6["Current Date"] = "rbxassetid://6031075938"
v6.Status = "rbxassetid://11963361597"
local u544 = {Gear = "You are certified to use the omni-directional movement gear."}
local u546 = {
    Default = {
        shirtCategory = "Civilian",
        shirtName = "White Shirt",
        shirtCustom = "",
        pantsCategory = "Civilian",
        pantsName = "White Slacks",
        pantsCustom = "",
    },
    Civilian = {
        shirtCategory = "Trainee Corps",
        shirtName = "Trainee Corps Jacket",
        shirtCustom = "",
        pantsCategory = "Military",
        pantsName = "White Shirt Brown Skirt",
        pantsCustom = "",
    },
}
local v7 = {
    shirtCategory = "Trainee Corps",
    shirtName = "Trainee Corps Jacket",
    shirtCustom = "",
    pantsCategory = "Military",
    pantsName = "White Shirt Brown Skirt",
    pantsCustom = "",
}
u546.Formal = v7
local u550 = {
    height = 0,
    weight = 0,
    gender = "Male",
    armband = "False",
    activeSubslot = "Default",
    age = 0,
    currentYear = 0,
    dateOfBirth = 0,
    birthMonth = 0,
    birthDay = 0,
    name = {first = "", last = ""},
}
v4 = {}
u550.statistics = v4
u550.outfitSubslots = u546
local function isProfileLoaded(p1) -- Line: 176
    local v1 = if type(p1) == "table" then p1.gender ~= nil else false
    return v1
end
local function resolveOutfitSubslots(p1) -- Line: 180 -- upvalues: u546 (val)
    local v1 = {}
    local Default = p1.Default
    if not Default then
        Default = u546.Default
    end
    v1.Default = Default
    local Civilian = p1.Civilian
    if not Civilian then
        Civilian = u546.Civilian
    end
    v1.Civilian = Civilian
    local Formal = p1.Formal
    if not Formal then
        Formal = u546.Formal
    end
    v1.Formal = Formal
    return v1
end
local function getMutedIconColor(p1) -- Line: 188 -- upvalues: Color (val)
    return Color.Darken(p1.Text.Secondary, 0.92)
end
local function getMutedLabelColor(p1) -- Line: 192 -- upvalues: Color (val)
    return Color.Darken(p1.Text.Secondary, 0.75)
end
local function getStatisticValue(p1, p2, p3) -- Line: 196
    if #p2 == 0 then
        return p3 or 0
    end
    local v1 = {}
    for k, v in pairs(p1) do
        v1[v.name] = v.value
    end
    local v2 = 0
    for i, i2 in ipairs(p2) do
        v2 = v2 + (v1[i2] or 0)
    end
    return v2
end
local function formatDateOfBirthDisplay(p1) -- Line: 214 -- upvalues: u526 (val)
    if not p1.dateOfBirth or not p1.birthMonth then
        return "Unknown"
    end
    local v1 = u526[p1.birthMonth] or "Unknown"
    return (("%*, %*"):format(v1, p1.dateOfBirth))
end
local function formatAgeDisplay(p1) -- Line: 223
    if p1.age ~= nil then
        return (("%* Years"):format(p1.age))
    end
    return "Unknown"
end
local function formatStatusDisplay(p1) -- Line: 231
    if not p1 then
        return "None"
    end
    if p1 ~= "" then
        return p1
    end
    return "None"
end
local function getColumnGridCellSize(p1, p2, p3, p4) -- Line: 239
    if p2 <= 0 then
        return UDim2.fromOffset(120, p3)
    end
    local v1 = math.floor((p2 - p4 * (p1 - 1)) / p1)
    local v2 = math.max(1, v1)
    return UDim2.fromOffset(v2, p3)
end
local function mergeScrollChildren(...) -- Line: 248
    local v1, v2, v3
    local v4 = {}
    local v5 = {...}
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if j then
            v1 = j
            v2 = nil
            v3 = nil
            for k, n in v1, v2, v3 do
                v4[k] = n
            end
        end
    end
    return v4
end
local function StatTile(p1) -- Line: 260 -- upvalues: useRem (val), useTextScale (val), useTheme (val), react (val), Label (val), getMutedLabelColor (val)
    local v1 = useRem()
    local v2 = useTextScale()
    local v3 = useTheme()
    return react.createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = v3.Input.Background, Size = UDim2.fromScale(1, 1), LayoutOrder = p1.LayoutOrder}, {
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(8))}),
        Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v3.Container.Stroke}),
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v1(4)),
        }),
        Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v1(10)), PaddingBottom = UDim.new(0, v1(10)), PaddingLeft = UDim.new(0, v1(8)), PaddingRight = UDim.new(0, v1(8))}),
        Value = react.createElement(Label, {
            LayoutOrder = 1,
            TextScaled = false,
            Text = tostring(p1.Value),
            TextSize = v2(22),
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.new(1, 0, 0, v2(24)),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        }),
        Label = react.createElement(Label, {
            LayoutOrder = 2,
            TextScaled = false,
            Text = p1.Label,
            TextSize = v2(10),
            TextColor3 = getMutedLabelColor(v3),
            TextXAlignment = Enum.TextXAlignment.Center,
            Size = UDim2.new(1, 0, 0, v2(14)),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        }),
    })
end
local function ProfileCard(p1) -- Line: 322 -- upvalues: useRem (val), useTextScale (val), useTheme (val), react (val), VerticalListLayout (val), Label (val)
    local v1, v2
    local v3 = useRem()
    local v4 = useTextScale()
    local v5 = useTheme()
    local v6 = {
        BorderSizePixel = 0,
        BackgroundColor3 = v5.Container.Background,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = p1.LayoutOrder,
    }
    local v7 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v3(10))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v5.Container.Stroke}), Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v3(18)), PaddingBottom = UDim.new(0, v3(18)), PaddingLeft = UDim.new(0, v3(18)), PaddingRight = UDim.new(0, v3(18))})}
    if not p1.Title then
        v2 = nil
    else
        v2 = react.createElement(VerticalListLayout, {Spacing = 16, VerticalAlignment = Enum.VerticalAlignment.Top})
    end
    v7.Layout = v2
    if not p1.Title then
        v2 = nil
    else
        v2 = react.createElement(Label, {
            TextScaled = false,
            LayoutOrder = 0,
            Text = p1.Title,
            TextSize = v4(11),
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, 0, 0, v4(14)),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        })
    end
    v7.Title = v2
    local v8 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v3(p1.ContentHeight))}
    if not p1.Title then
        v1 = nil
    else
        v1 = 1
    end
    v8.LayoutOrder = v1
    local children = p1.children
    if not children then
        children = {}
    end
    v7.Content = react.createElement("Frame", v8, children)
    return react.createElement("Frame", v6, v7)
end
local function PersonalInfoField(p1) -- Line: 382 -- upvalues: useRem (val), useTextScale (val), useTheme (val), react (val), getMutedIconColor (val), Label (val), getMutedLabelColor (val)
    local v1 = useRem()
    local v2 = useTextScale()
    local v3 = useTheme()
    local v4 = v1(28)
    local v5 = {BackgroundTransparency = 1}
    local AnchorPoint = p1.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0, 0)
    end
    v5.AnchorPoint = AnchorPoint
    local Position = p1.Position
    if not Position then
        Position = UDim2.new(0, 0, 0, 0)
    end
    v5.Position = Position
    local Size = p1.Size
    if not Size then
        local v6 = -v1(8)
        Size = UDim2.new(0.25, v6, 1, 0)
    end
    v5.Size = Size
    local v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(12)),
    }), Icon = react.createElement("ImageLabel", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Image = p1.Icon,
        ImageColor3 = getMutedIconColor(v3),
        Size = UDim2.fromOffset(v4, v4),
    })}
    local v8 = {LayoutOrder = 2, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.Y}
    local v9 = -(v4 + v1(12))
    v8.Size = UDim2.new(1, v9, 0, 0)
    v7.Text = react.createElement("Frame", v8, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(2)),
    }), Label = react.createElement(Label, {
        LayoutOrder = 1,
        TextScaled = false,
        Text = p1.Label,
        TextSize = v2(12),
        TextColor3 = getMutedLabelColor(v3),
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, v2(14)),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
    }), Value = react.createElement(Label, {
        LayoutOrder = 2,
        TextScaled = false,
        Text = p1.Value,
        TextSize = v2(12),
        TextColor3 = v3.Text.Primary,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, v2(14)),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
    })})
    return react.createElement("Frame", v5, v7)
end
return function(p1) -- Line: 459 -- upvalues: useOrder (val), useRem (val), useTheme (val), react (val), getColumnGridCellSize (val), useStore (val), Profile (val), isProfileLoaded (val), u550 (val), Player (val), resolveOutfitSubslots (val), Certifications (val), CalendarDate (val), u506 (val), StatTile (val), getStatisticValue (val), Form (val), u493 (val), HeaderBodyComponent (val), u480 (val), u544 (val), Badge (val), ScrollingFrame (val), mergeScrollChildren (val), VerticalListLayout (val), OutfitSubslotPicker (val), ProfileCard (val), PersonalInfoField (val), formatDateOfBirthDisplay (val), formatAgeDisplay (val), formatStatusDisplay (val), DropdownInput (val), Accordion (val)
    local name, name_2, u53, u657, u660, v1, v2, v3, v4, v5, v6
    local v7 = useOrder()
    local v8 = useRem()
    local v9 = useTheme()
    u657, u660 = react.useState(0)
    local v10 = v8(12)
    local v11 = v8(76)
    local v12 = getColumnGridCellSize(3, u657, v11, v10)
    local v13 = useStore(Profile.Store, function(p1) -- Line: 469 -- upvalues: isProfileLoaded (upval), u550 (upval)
        if isProfileLoaded(p1) then
            return p1
        end
        return u550
    end)
    local v14 = useStore(Player.Store, function(p1) -- Line: 477
        if not p1 then
            return "None"
        end
        if p1.client then
            return p1.client.tier
        end
        return "None"
    end)
    local statistics = v13.statistics
    local v15 = resolveOutfitSubslots(v13.outfitSubslots)
    local activeSubslot = v13.activeSubslot
    local v16 = useStore(Certifications.Store, function(p1) -- Line: 488
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return v1
    end)
    v1, u53 = react.useState(CalendarDate.formatSeasonYear())
    react.useEffect(function() -- Line: 493 -- upvalues: p1 (val), u53 (val), CalendarDate (upval)
        if not p1.Enabled then
            return
        end
        local function updateCurrentDate() -- Line: 498 -- upvalues: u53 (upval), CalendarDate (upval)
            u53(CalendarDate.formatSeasonYear())
        end
        updateCurrentDate()
        local u7 = task.spawn(function() -- Line: 504 -- upvalues: updateCurrentDate (val)
            while true do
                task.wait(30)
                updateCurrentDate()
            end
        end)
        return function() -- Line: 511 -- upvalues: u7 (val)
            pcall(task.cancel, u7)
        end
    end, {p1.Enabled})
    local v17 = {}
    local v18 = {}
    for i, v in ipairs(u506) do
        v18[v.Label] = react.createElement(StatTile, {Label = v.Label, Value = getStatisticValue(statistics, v.Keys), LayoutOrder = i})
    end
    for k, i2 in pairs(statistics) do
        v2 = {LayoutOrder = u493[i2.name] or 0}
        v3 = {}
        v4 = {}
        v5 = {Wrap = true}
        name = u480[i2.name]
        if not name then
            name = i2.name
        end
        v5.Header = name
        v6 = tostring(i2.value)
        name_2 = v6 .. " " .. u480[i2.name]
        if not name_2 then
            name_2 = i2.name
        end
        v5.Body = name_2
        v5.Position = UDim2.fromScale(0.5, 0.5)
        v4.Label = react.createElement(HeaderBodyComponent, v5)
        v3.Left = react.createElement(Form.Divider, {Side = "Left"}, v4)
        v17[i2.name] = react.createElement(Form.Form, v2, v3)
    end
    local v19 = {}
    for k2, j in pairs(v16) do
        v19[j.name] = react.createElement(Form.Form, {Darken = false}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = j.name, Body = u544[j.name] or "No description available."})}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Date = react.createElement(Badge, {Text = "Certified"})})})
    end
    local v20 = {Visible = u645.Enabled}
    local v21 = {Layout = react.createElement(VerticalListLayout, {Spacing = 16, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local v22 = {}
    v3 = {
        BorderSizePixel = 0,
        BackgroundColor3 = v9.Container.Background,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v7(),
    }
    local v23 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v8(10))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v9.Container.Stroke}), Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, v8(18)), PaddingBottom = UDim.new(0, v8(18)), PaddingLeft = UDim.new(0, v8(18)), PaddingRight = UDim.new(0, v8(18))})}
    v4 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v11 * 2 + v10 * 1), LayoutOrder = 1}
    v4[react.Change.AbsoluteSize] = function(p1) -- Line: 613 -- upvalues: u657 (val), u660 (val)
        local X = p1.AbsoluteSize.X
        if X ~= u657 then
            u660(X)
        end
    end
    v23.Grid = react.createElement("Frame", v4, {Layout = react.createElement("UIGridLayout", {
        FillDirectionMaxCells = 3,
        CellPadding = UDim2.fromOffset(v10, v10),
        CellSize = v12,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })}, v18)
    v22.ServiceRecord = react.createElement("Frame", v3, v23)
    local v24 = {Outfits = react.createElement(OutfitSubslotPicker, {
        Enabled = u645.Enabled,
        LayoutOrder = v7(),
        Subslots = v15,
        ActiveSubslot = activeSubslot,
        OnSelect = function(p1) -- Line: 638 -- upvalues: Profile (upval)
            Profile.Subslot.post(p1)
        end,
    })}
    v23 = {ContentHeight = 60, LayoutOrder = v7()}
    local v25 = {DividerLeft = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.25, 0, 0.5, 0),
        BackgroundColor3 = v9.Container.Stroke,
        Size = UDim2.new(0, 1, 0, v8(36)),
    }), DividerMiddle = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = v9.Container.Stroke,
        Size = UDim2.new(0, 1, 0, v8(36)),
    }), DividerRight = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.75, 0, 0.5, 0),
        BackgroundColor3 = v9.Container.Stroke,
        Size = UDim2.new(0, 1, 0, v8(36)),
    })}
    local v26 = {Label = "Date of Birth", Icon = "rbxassetid://6031075938", AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0)}
    local v27 = -v8(8)
    v26.Size = UDim2.new(0.25, v27, 1, 0)
    v26.Value = formatDateOfBirthDisplay(v13)
    v25.DateOfBirth = react.createElement(PersonalInfoField, v26)
    v26 = {Label = "Current Date", Icon = "rbxassetid://6031075938", AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.25, 0, 0.5, 0)}
    v27 = -v8(8)
    v26.Size = UDim2.new(0.25, v27, 1, 0)
    v26.Value = v1
    v25.CurrentDate = react.createElement(PersonalInfoField, v26)
    v26 = {Label = "Age", Icon = "rbxassetid://11963361597", AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0)}
    v27 = -v8(8)
    v26.Size = UDim2.new(0.25, v27, 1, 0)
    v26.Value = formatAgeDisplay(v13)
    v25.Age = react.createElement(PersonalInfoField, v26)
    v26 = {Label = "Status", Icon = "rbxassetid://11963361597", AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.75, 0, 0.5, 0)}
    v27 = -v8(8)
    v26.Size = UDim2.new(0.25, v27, 1, 0)
    v26.Value = formatStatusDisplay(v14)
    v25.Status = react.createElement(PersonalInfoField, v26)
    v24.PersonalInformation = react.createElement(ProfileCard, v23, v25)
    v24.Gender = react.createElement(DropdownInput, {
        Header = "Gender",
        Body = "Your character's gender.",
        Visible = u645.Enabled,
        Options = {"Male", "Female"},
        Default = v13.gender,
        Selected = function(p1) -- Line: 714 -- upvalues: Profile (upval)
            Profile.Gender.post(p1)
        end,
        Native = {LayoutOrder = v7()},
    })
    v23 = {Header = "Armband", Body = "If you are wearing your armband.", Visible = u645.Enabled}
    v25 = {"True", "False"}
    v23.Options = v25
    if v13.armband ~= "True" then
        v25 = "False"
    else
        v25 = "True"
    end
    v23.Default = v25
    function v23.Selected(p1) -- Line: 726 -- upvalues: Profile (upval)
        Profile.Armband.post(p1)
    end
    v23.Native = {LayoutOrder = v7()}
    v24.Armband = react.createElement(DropdownInput, v23)
    v24.StatisticsAccordion = react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = v7()},
    }, {Statistics = react.createElement(Accordion.AccordionItem, {Header = "Statistics"}, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top})}, v17)})
    v24.CertificationsAccordion = react.createElement(Accordion.Accordion, {
        Native = {LayoutOrder = v7()},
    }, {Certifications = react.createElement(Accordion.AccordionItem, {Header = "Certifications"}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v19)})
    return react.createElement(ScrollingFrame, v20, mergeScrollChildren(v21, v22, v24))
end