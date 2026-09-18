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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Proficiencies
--                               Dumped in 0.00561 seconds
--                          Bytecode version 9  |  32 functions

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
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Proficiencies = require(Namespaces_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Constants = require(Common_3:WaitForChild("Constants"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Progression = Common_4:WaitForChild("Progression")
local Proficiencies_3 = Progression:WaitForChild("Proficiencies")
local Proficiencies_2 = require(Proficiencies_3:WaitForChild("Proficiencies"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Dropdown = require(Universal_2:WaitForChild("Dropdown"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_3 = Components_5:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Search = require(Universal_3:WaitForChild("Search"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_6:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Editor_5 = Components_7:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Textbox = require(Universal_5:WaitForChild("Textbox"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_10:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_11:WaitForChild("Hooks")
local useTextScale = require(Hooks_6:WaitForChild("useTextScale"))
local function sortedActionKeys(p1) -- Line: 63 -- upvalues: Proficiencies_2 (val)
    local v1 = Proficiencies_2.getExperienceGrowth(p1)
    local v2 = {}
    if v1.Actions then
        for k in pairs(v1.Actions) do
            if typeof(k) == "string" then
                table.insert(v2, k)
            end
        end
    end
    table.sort(v2)
    return v2
end
local function levelFromTotalXp(p1, p2) -- Line: 83 -- upvalues: Proficiencies_2 (val)
    local v1 = math.max(0, p2)
    local v2 = 1
    local v3 = 100000
    local v4 = 1
    for i = 1, v3, v4 do
        if Proficiencies_2.getTotalXpToReachLevel(p1, v2 + 1) > v1 then
            break
        end
        v2 = v2 + 1
    end
    return v2
end
local function findProficiency(p1, p2) -- Line: 103
    if not p1 then
        return nil
    end
    local v1 = string.lower(p2)
    for i, v in ipairs(p1) do
        if typeof(v.name) == "string" and string.lower(v.name) == v1 then
            return v
        end
    end
    return nil
end
local function defaultTreeName(p1) -- Line: 121
    for i, v in ipairs(p1) do
        if v == "Skills" then
            return "Skills"
        end
    end
    return p1[1] or ""
end
local function getTreeNodes(p1) -- Line: 136 -- upvalues: Proficiencies_2 (val)
    local v1, v2
    if p1 == "" then
        return {}
    end
    v1, v2 = pcall(Proficiencies_2.getProficiencyTree, p1)
    if not v1 or typeof(v2) ~= "table" then
        return {}
    end
    local v3 = {}
    for i, v in ipairs(v2) do
        if typeof(v) == "table" and typeof(v.Name) == "string" then
            table.insert(v3, v)
        end
    end
    return v3
end
local function isSkillUnlocked(p1, p2) -- Line: 160
    if not p1 or typeof(p1.unlocked) ~= "table" then
        return false
    end
    for i, v in ipairs(p1.unlocked) do
        if v == p2 then
            return true
        end
    end
    return false
end
local function SkillRow(p1) -- Line: 174 -- upvalues: useRem (val), useDebuggerTheme (val), react (val), Text (val), Button (val)
    local a, v1
    local v2 = useRem()
    local v3 = useDebuggerTheme()
    if p1.Index % 2 ~= 0 then
        a = v3.rows.b
    else
        a = v3.rows.a
    end
    local Name = p1.Node.Name
    local v4 = p1.Node.Description or ""
    local v5 = {
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        BackgroundColor3 = a,
        Size = UDim2.new(1, 0, 0, v2(60)),
        LayoutOrder = p1.Index,
    }
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v2(4))}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v2(10)), PaddingRight = UDim.new(0, v2(10)), PaddingTop = UDim.new(0, v2(8)), PaddingBottom = UDim.new(0, v2(8))})}
    local v7 = {Bold = true, Text = Name}
    local v8 = {TextTransparency = 0.05, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, 0)}
    local v9 = -v2(120)
    v8.Size = UDim2.new(1, v9, 0, v2(20))
    v8.TextColor3 = v3.accents.attributeBlue
    v8.TextXAlignment = Enum.TextXAlignment.Left
    v8.TextTruncate = Enum.TextTruncate.AtEnd
    v8.AutomaticSize = Enum.AutomaticSize.None
    v7.Native = v8
    v6.Name = react.createElement(Text, v7)
    v7 = {Text = v4}
    v8 = {TextTransparency = 0.16, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, v2(22))}
    v9 = -v2(120)
    v8.Size = UDim2.new(1, v9, 0, v2(22))
    v8.TextColor3 = v3.text.body
    v8.TextXAlignment = Enum.TextXAlignment.Left
    v8.TextYAlignment = Enum.TextYAlignment.Top
    v8.TextTruncate = Enum.TextTruncate.AtEnd
    v8.AutomaticSize = Enum.AutomaticSize.None
    v7.Native = v8
    v6.Description = react.createElement(Text, v7)
    if not p1.Unlocked then
        v1 = react.createElement(Button, {
            Text = "Add",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Height = v2(22),
            Disabled = not p1.CanAdd,
            Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0)},
            Clicked = function() -- Line: 265 -- upvalues: p1 (val), Name (val)
                if p1.CanAdd then
                    p1.OnAdd(Name)
                end
            end,
        })
    else
        v1 = react.createElement(Button, {
            Text = "Remove",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(214, 74, 74),
            TextColor = Color3.fromRGB(255, 255, 255),
            Height = v2(22),
            Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0)},
            Clicked = function() -- Line: 249 -- upvalues: p1 (val), Name (val)
                p1.OnRemove(Name)
            end,
        })
    end
    v6.Action = v1
    return react.createElement("Frame", v5, v6)
end
local function LabeledField(p1) -- Line: 276 -- upvalues: useRem (val), useTextScale (val), react (val)
    local v1 = useRem()
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(p1.Width, v1(46)), LayoutOrder = p1.LayoutOrder, ZIndex = p1.ZIndex}, {V = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(4)),
    }), Label = react.createElement("TextLabel", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        TextTransparency = 0.42,
        Size = UDim2.new(1, 0, 0, v1(14)),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Label,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextSize = useTextScale()(13),
    }), FieldRow = react.createElement("Frame", {LayoutOrder = 2, BackgroundTransparency = 1, Size = UDim2.fromOffset(p1.Width, v1(28)), ZIndex = p1.ZIndex}, {H = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder}), Inner = p1.Field})})
end
local function StatRow(p1) -- Line: 332 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), react (val), Text (val)
    local v1 = useTextScale()
    local v2 = useDebuggerTheme()
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, useRem()(20)), LayoutOrder = p1.LayoutOrder or 0}, {Key = react.createElement(Text, {
        Text = p1.Label,
        Native = {
            TextTransparency = 0.22,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(0.55, 0, 1, 0),
            TextColor3 = v2.text.muted,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextSize = v1(13),
        },
    }), Value = react.createElement(Text, {
        Text = p1.Value,
        Native = {
            TextTransparency = 0.05,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.new(0.45, 0, 1, 0),
            TextColor3 = v2.text.body,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextSize = v1(13),
        },
    })})
end
local function ExperiencePreview(p1) -- Line: 375 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), react (val), Text (val), StatRow (val)
    local Outcome, v1
    local v2 = useRem()
    local v3 = useTextScale()
    local v4 = useDebuggerTheme()
    if p1.Outcome.kind == "message" then
        return react.createElement(Text, {
            Text = p1.Outcome.text,
            Native = {
                TextWrapped = true,
                TextTransparency = 0.18,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                TextColor3 = v4.text.muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextSize = v3(13),
            },
        })
    end
    Outcome = p1.Outcome
    if 0 >= Outcome.needNext then
        v1 = 1
    else
        v1 = math.clamp(Outcome.xpInBar / Outcome.needNext, 0, 1)
    end
    local v5 = math.floor(v1 * 100 + 0.5)
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {
        V = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v2(10))}),
        Hero = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, v2(54))}, {LevelLabel = react.createElement(Text, {
            Text = "Simulated level",
            Native = {
                TextTransparency = 0.3,
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromOffset(0, 0),
                Size = UDim2.new(1, 0, 0, v2(14)),
                TextColor3 = v4.text.muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextSize = v3(11),
            },
        }), LevelNumber = react.createElement(Text, {
            Bold = true,
            Text = tostring(Outcome.levelAfter),
            Native = {
                TextTransparency = 0.02,
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.new(0, 0, 0, v2(16)),
                Size = UDim2.new(0.5, 0, 0, v2(38)),
                TextColor3 = v4.accents.attributeBlue,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = v3(32),
            },
        }), PctLabel = react.createElement(Text, {
            Text = "Progress to next",
            Native = {
                TextTransparency = 0.3,
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.new(0.5, 0, 0, v2(14)),
                TextColor3 = v4.text.muted,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextSize = v3(11),
            },
        }), PctNumber = react.createElement(Text, {
            Bold = true,
            Text = string.format("%d%%", v5),
            Native = {
                TextTransparency = 0.05,
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.new(1, 0, 0, v2(16)),
                Size = UDim2.new(0.5, 0, 0, v2(38)),
                TextColor3 = v4.text.headerTitle,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = v3(32),
            },
        })}),
        Track = react.createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            BackgroundColor3 = v4.chrome.searchStrokeIdle,
            Size = UDim2.new(1, 0, 0, v2(10)),
        }, {Round = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Fill = react.createElement("Frame", {BackgroundTransparency = 0.05, BorderSizePixel = 0, BackgroundColor3 = v4.accents.attributeBlue, Size = UDim2.new(v1, 0, 1, 0)}, {R2 = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})}),
        Divider = react.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            LayoutOrder = 3,
            BackgroundColor3 = v4.chrome.panelStroke,
            Size = UDim2.new(1, 0, 0, 1),
        }),
        Stats = react.createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {SV = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v2(2))}), Cumulative = react.createElement(StatRow, {LayoutOrder = 1, Label = "Cumulative XP", Value = string.format("%.4g", Outcome.totalXp)}), Gained = react.createElement(StatRow, {LayoutOrder = 2, Label = "Gained from actions", Value = string.format("+%.4g  (%d x %.4g)", Outcome.gainedXp, Outcome.actionsCount, Outcome.xpPerAction)}), ToNext = react.createElement(StatRow, {LayoutOrder = 3, Label = "To next level", Value = string.format("%.4g / %.4g", Outcome.xpInBar, Outcome.needNext)})}),
    })
end
return react.memo(function() -- Line: 535 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), Constants (val), react (val), Proficiencies_2 (val), defaultTreeName (val), useStore (val), Proficiencies (val), findProficiency (val), getTreeNodes (val), sortedActionKeys (val), levelFromTotalXp (val), Button (val), Debugger (val), Container (val), Dropdown (val), Text (val), Search (val), ScrollingFrame (val), SkillRow (val), isSkillUnlocked (val), LabeledField (val), Textbox (val), ExperiencePreview (val)
    local u34, u39, u40, u44, u87, u88, v1, v2, v3, v4
    local u1 = useRem()
    local u3 = useTextScale()
    local u5 = useDebuggerTheme()
    local v5 = useOrder()
    local v6 = useDebuggerPages().Proficiency == true
    local v7 = not Constants.IsSupporterPlace
    local v8 = u1(580)
    local v9 = u1(600)
    local v10 = u1(28)
    local v11 = react.useMemo(function() -- Line: 549 -- upvalues: Proficiencies_2 (upval)
        local v1 = Proficiencies_2.getProficiencyNames()
        table.sort(v1)
        return v1
    end, {})
    u34, v1 = react.useState(function() -- Line: 555 -- upvalues: defaultTreeName (upval), Proficiencies_2 (upval)
        return defaultTreeName(Proficiencies_2.getProficiencyNames())
    end)
    u39, u40 = react.useState("100")
    u44, v2 = react.useState("")
    local u50 = useStore(Proficiencies.Store, function(p1) -- Line: 562
        return p1
    end)
    local u57 = react.useMemo(function() -- Line: 566 -- upvalues: findProficiency (upval), u50 (val), u34 (val)
        return findProficiency(u50, u34)
    end, {u50, u34})
    local u63 = react.useMemo(function() -- Line: 570 -- upvalues: getTreeNodes (upval), u34 (val)
        return getTreeNodes(u34)
    end, {u34})
    local u70 = react.useMemo(function() -- Line: 574 -- upvalues: u44 (val), u63 (val)
        local v1
        local v2 = string.lower(u44):gsub("^%s+", "")
        local v3 = v2:gsub("%s+$", "")
        if v3 == "" then
            return u63
        end
        v2 = {}
        for i, v in ipairs(u63) do
            v1 = string.lower((v.Name or "") .. " " .. (v.Description or ""))
            if string.find(v1, v3, 1, true) ~= nil then
                table.insert(v2, v)
            end
        end
        return v2
    end, {u63, u44})
    local v12 = react.useMemo(function() -- Line: 590 -- upvalues: u57 (val)
        if not u57 or typeof(u57.unlocked) ~= "table" then
            return 0
        end
        return #u57.unlocked
    end, {u57})
    local u82 = react.useMemo(function() -- Line: 597 -- upvalues: sortedActionKeys (upval), u34 (val)
        return sortedActionKeys(u34)
    end, {u34})
    u87, u88 = react.useState(u82[1] or "")
    react.useEffect(function() -- Line: 603 -- upvalues: sortedActionKeys (upval), u34 (val), u88 (val)
        local v1 = sortedActionKeys(u34)
        u88(v1[1] or "")
    end, {u34})
    local v13 = {
        u34,
        u82,
        u87,
        u39,
        u57,
    }
    local v14 = react.useMemo(function() -- Line: 608 -- upvalues: u34 (val), u82 (val), u87 (val), u39 (val), Proficiencies_2 (upval), u57 (val), levelFromTotalXp (upval)
        local v1, v2
        if u34 == "" then
            return {kind = "message", text = "No proficiency selected."}
        end
        if #u82 == 0 or u87 == "" then
            return {kind = "message", text = "No actions configured for this proficiency in Proficiencies experience growth."}
        end
        local v3 = tonumber(u39)
        if v3 == nil then
            return {kind = "message", text = "Enter a valid number of actions."}
        end
        v3 = math.max(0, (math.floor(v3)))
        local v4 = Proficiencies_2.resolveActionExperienceAward(u34, u87)
        if v4 == nil then
            return {kind = "message", text = "Could not resolve XP per action for this pair."}
        end
        local v5 = 0
        if u57 then
            v1 = math.max(1, (math.floor(tonumber(u57.level) or 1)))
            v2 = tonumber(u57.experience) or 0
            v5 = Proficiencies_2.getTotalXpToReachLevel(u34, v1) + v2
        end
        v1 = v4 * v3
        v2 = v5 + v1
        local v6 = levelFromTotalXp(u34, v2)
        local v7 = Proficiencies_2.getTotalXpToReachLevel(u34, v6)
        local v8 = math.max(0, v2 - v7)
        local v9 = Proficiencies_2.getProficiencyXpRequired(u34, v6)
        return {
            kind = "ok",
            levelAfter = v6,
            xpInBar = v8,
            needNext = v9,
            totalXp = v2,
            xpPerAction = v4,
            actionsCount = v3,
            gainedXp = v1,
        }
    end, v13)
    if not u57 then
        v3 = string.format("%s Not unlocked", u34)
    else
        v13 = math.floor(tonumber(u57.level) or 1)
        local v15 = tonumber(u57.experience) or 0
        v3 = string.format("%s Unlocked. Level %d. In-bar XP %.4g", u34, v13, v15)
    end
    v13 = {H = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, u1(8)),
    })}
    if not u57 then
        v13.AddTree = react.createElement(Button, {
            Text = "Add proficiency",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Height = v10,
            Native = {LayoutOrder = 1},
            Clicked = function() -- Line: 745 -- upvalues: Debugger (upval), u34 (val)
                Debugger.Proficiencies.post({action = "add", name = u34})
            end,
        })
    else
        v13.AddPoints = react.createElement(Button, {
            Text = "Add points",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Height = v10,
            Native = {LayoutOrder = 1},
            Clicked = function() -- Line: 690 -- upvalues: Debugger (upval), u34 (val)
                Debugger.Proficiencies.post({action = "addPoints", amount = 1, name = u34})
            end,
        })
        v13.Remove = react.createElement(Button, {
            Text = "Remove",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Height = v10,
            Native = {LayoutOrder = 2},
            Clicked = function() -- Line: 709 -- upvalues: Debugger (upval), u34 (val)
                Debugger.Proficiencies.post({action = "remove", name = u34})
            end,
        })
        v13.Reset = react.createElement(Button, {
            Text = "Reset",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(214, 74, 74),
            TextColor = Color3.fromRGB(255, 255, 255),
            Height = v10,
            Native = {LayoutOrder = 3},
            Clicked = function() -- Line: 727 -- upvalues: Debugger (upval), u34 (val)
                Debugger.Proficiencies.post({action = "reset", name = u34})
            end,
        })
    end
    local v16 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = v6},
    }
    local v17 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, u1(12)),
    })}
    local v18 = {BackgroundTransparency = 1, ZIndex = 7}
    local v19 = u1(280)
    v18.Size = UDim2.fromOffset(v19, u1(28))
    v18.LayoutOrder = v5()
    local v20 = {}
    local v21 = {}
    if 0 >= #v11 then
        v4 = {"(none)"}
    else
        v4 = v11
    end
    v21.Options = v4
    v21.Default = u34
    v21.Changed = v1
    v21.Width = u1(280)
    v21.Native = {ZIndex = 7, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5)}
    v20.Dropdown = react.createElement(Dropdown, v21)
    v17.ProficiencyRow = react.createElement("Frame", v18, v20)
    v17.CountLine = react.createElement(Text, {
        Text = v3,
        Native = {TextTransparency = 0.45, TextColor3 = u5.text.muted, LayoutOrder = v5()},
    })
    v17.SkillsSearch = react.createElement(Search, {
        PlaceholderText = "Filter skills by name or description...",
        WidthPx = v8,
        HeightPx = u1(30),
        LayoutOrder = v5(),
        OnQueryChange = v2,
    })
    v17.SkillsCountLine = react.createElement(Text, {
        Text = string.format("Skills: %d total. %d unlocked", #u63, v12),
        Native = {TextTransparency = 0.45, TextColor3 = u5.text.muted, LayoutOrder = v5()},
    })
    v18 = {
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        BackgroundColor3 = u5.chrome.panelSurface,
        Size = UDim2.fromOffset(v9, u1(240)),
        LayoutOrder = v5(),
    }
    v20 = {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, u1(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = u5.chrome.panelStroke})}
    v21 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    local v22 = u1(8)
    v21.Position = UDim2.new(0, v22, 0, u1(8))
    v21.ScrollBarThickness = u3(5)
    v21.ScrollBarImageColor3 = u5.chrome.scrollThumb
    v22 = -u1(16)
    v21.Size = UDim2.new(1, v22, 1, -u1(16))
    v4 = {}
    local v23 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}
    v4.Content = react.createElement("Frame", v23, (function() -- Line: 845 -- upvalues: react (upval), u3 (val), u1 (val), u63 (val), Text (upval), u34 (val), u5 (val), u70 (val), u57 (val), SkillRow (upval), isSkillUnlocked (upval), Debugger (upval)
        local v1 = {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, u3(6))}), List = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, u1(6)),
        })}
        if #u63 == 0 then
            v1.Empty = react.createElement(Text, {
                Text = string.format("%s has no skill nodes defined.", u34),
                Native = {
                    TextTransparency = 0.32,
                    LayoutOrder = 1,
                    TextColor3 = u5.text.muted,
                    Size = UDim2.new(1, 0, 0, u1(24)),
                    TextXAlignment = Enum.TextXAlignment.Left,
                },
            })
            return v1
        end
        if #u70 == 0 then
            v1.Empty = react.createElement(Text, {
                Text = "No skills match your search.",
                Native = {
                    TextTransparency = 0.32,
                    LayoutOrder = 1,
                    TextColor3 = u5.text.muted,
                    Size = UDim2.new(1, 0, 0, u1(24)),
                    TextXAlignment = Enum.TextXAlignment.Left,
                },
            })
            return v1
        end
        local v2 = u57 ~= nil
        for i, v in ipairs(u70) do
            v1["S_" .. v.Name] = react.createElement(SkillRow, {
                Node = v,
                Index = i,
                Unlocked = isSkillUnlocked(u57, v.Name),
                CanAdd = v2,
                OnAdd = function(p1) -- Line: 889 -- upvalues: Debugger (upval), u34 (upval)
                    Debugger.Proficiencies.post({action = "addSkill", name = u34, node = p1})
                end,
                OnRemove = function(p1) -- Line: 896 -- upvalues: Debugger (upval), u34 (upval)
                    Debugger.Proficiencies.post({action = "removeSkill", name = u34, node = p1})
                end,
            })
        end
        return v1
    end)())
    v20.Scroll = react.createElement(ScrollingFrame, v21, v4)
    v17.SkillsChrome = react.createElement("Frame", v18, v20)
    v18 = {
        BackgroundTransparency = 1,
        ZIndex = 6,
        Size = UDim2.fromOffset(v8, u1(46)),
        LayoutOrder = v5(),
        Visible = v7,
    }
    v20 = {H = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, u1(12)),
    })}
    v21 = {Label = "Action", LayoutOrder = 1, ZIndex = 6, Width = u1(220)}
    v22 = {}
    if 0 >= #u82 then
        v23 = {"—"}
    else
        v23 = u82
    end
    v22.Options = v23
    v22.Default = u87
    v22.Changed = u88
    v22.Width = u1(220)
    v22.Native = {ZIndex = 6}
    v21.Field = react.createElement(Dropdown, v22)
    v20.ActionField = react.createElement(LabeledField, v21)
    v20.ActionsField = react.createElement(LabeledField, {Label = "Actions", LayoutOrder = 2, Width = u1(140), Field = react.createElement(Textbox, {
        Width = 140,
        ClearOnFocus = false,
        PlaceholderText = "100",
        Default = u39,
        Changed = function(p1) -- Line: 953 -- upvalues: u40 (val)
            u40(p1)
        end,
    })})
    v17.SimToolbar = react.createElement("Frame", v18, v20)
    v17.ScrollChrome = react.createElement("Frame", {
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        BackgroundColor3 = u5.chrome.panelSurface,
        Size = UDim2.fromOffset(v9, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = v5(),
        Visible = v7,
    }, {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, u1(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = u5.chrome.panelStroke}), Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, u1(16)), PaddingRight = UDim.new(0, u1(16)), PaddingTop = UDim.new(0, u1(14)), PaddingBottom = UDim.new(0, u1(14))}), Body = react.createElement(ExperiencePreview, {Outcome = v14})})
    v17.ButtonsRow = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v9, v10), LayoutOrder = v5()}, {ButtonsWrap = react.createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromOffset(0, v10),
        AutomaticSize = Enum.AutomaticSize.X,
    }, v13)})
    return react.createElement(Container, v16, v17)
end)