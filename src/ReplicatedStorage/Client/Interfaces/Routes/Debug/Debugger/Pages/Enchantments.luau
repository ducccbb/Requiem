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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.Enchantments
--                               Dumped in 0.00424 seconds
--                          Bytecode version 9  |  16 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments_2 = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_5:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Debugger = require(Namespaces_2:WaitForChild("Debugger"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Network_3 = Common_4:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Enchantments = require(Namespaces_3:WaitForChild("Enchantments"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_8:WaitForChild("Common")
local Administration_2 = Common_5:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor = Components_2:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_3 = Components_5:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Search = require(Universal_3:WaitForChild("Search"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_4 = Components_6:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Text = require(Universal_4:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_10 = Client_11:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_10:WaitForChild("Hooks")
local useTextScale = require(Hooks_6:WaitForChild("useTextScale"))
local u454 = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythic",
    "Unique",
}
local function discoverEnchantments() -- Line: 64 -- upvalues: u454 (val), ReplicatedStorage (val)
    local Name, Parent, description, v1, v2, v3
    local v4 = {}
    local v5 = u454
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v4[j] = {}
    end
    local Client = ReplicatedStorage:FindFirstChild("Client")
    if not Client then
        warn("[Debugger/Enchantments] Missing ReplicatedStorage.Client")
        return v4
    end
    local Progression = Client:FindFirstChild("Progression")
    if not Progression then
        warn("[Debugger/Enchantments] Missing ReplicatedStorage.Client.Progression")
        return v4
    end
    local Enchantments = Progression:FindFirstChild("Enchantments")
    if not Enchantments then
        warn("[Debugger/Enchantments] Missing ReplicatedStorage.Client.Progression.Enchantments")
        return v4
    end
    local Enchantments_2 = Enchantments:FindFirstChild("Enchantments")
    if not Enchantments_2 then
        warn("[Debugger/Enchantments] Missing rarity folder root at ...Enchantments.Enchantments")
        return v4
    end
    for i2, v in ipairs(Enchantments_2:GetDescendants()) do
        if v:IsA("ModuleScript") then
            Parent = v.Parent
            if not Parent then
                Name = "Common"
            else
                Name = Parent.Name
            end
            if v4[Name] == nil then
                v4[Name] = {}
            end
            v1 = "No description available."
            v2, v3 = pcall(require, v)
            if v2 and typeof(v3) == "table" and typeof(v3.settings) == "table" then
                description = v3.settings.description
                if typeof(description) == "string" and description ~= "" then
                    v1 = description
                end
            end
            table.insert(v4[Name], {name = v.Name, description = v1, rarity = Name})
        end
    end
    for k, k2 in pairs(v4) do
        table.sort(k2, function(p1, p2) -- Line: 122
            local v1 = string.lower(p1.name)
            local v2 = v1 < string.lower(p2.name)
            return v2
        end)
    end
    return v4
end
local function EnchantmentRow(p1) -- Line: 130 -- upvalues: useRem (val), useDebuggerTheme (val), ClientEnchantmentsHandler (val), react (val), Text (val), Button (val), Debugger (val)
    local a
    local v1 = useRem()
    local v2 = useDebuggerTheme()
    local v3 = ClientEnchantmentsHandler.hasEnchantment(p1.Entry.name)
    if p1.Index % 2 ~= 0 then
        a = v2.rows.b
    else
        a = v2.rows.a
    end
    local muted = v2.enchantments.rarity[p1.Entry.rarity]
    if not muted then
        muted = v2.text.muted
    end
    local v4 = {
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        BackgroundColor3 = a,
        Size = UDim2.new(1, 0, 0, v1(84)),
        LayoutOrder = p1.Index,
    }
    local v5 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(4))}), Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, v1(10)), PaddingRight = UDim.new(0, v1(10)), PaddingTop = UDim.new(0, v1(8)), PaddingBottom = UDim.new(0, v1(8))})}
    local v6 = {Bold = true, Text = p1.Entry.name}
    local v7 = {TextTransparency = 0.05, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, 0)}
    local v8 = -v1(180)
    v7.Size = UDim2.new(1, v8, 0, v1(24))
    v7.TextColor3 = muted
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextTruncate = Enum.TextTruncate.AtEnd
    v7.AutomaticSize = Enum.AutomaticSize.None
    v6.Native = v7
    v5.Name = react.createElement(Text, v6)
    v6 = {Text = p1.Entry.description}
    v7 = {TextTransparency = 0.16, TextWrapped = true, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(0, v1(28))}
    v8 = -v1(180)
    v7.Size = UDim2.new(1, v8, 0, v1(44))
    v7.TextColor3 = v2.text.body
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v7.TextYAlignment = Enum.TextYAlignment.Top
    v7.TextTruncate = Enum.TextTruncate.None
    v7.AutomaticSize = Enum.AutomaticSize.None
    v6.Native = v7
    v5.Description = react.createElement(Text, v6)
    v6 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0)}
    local v9 = v1(160)
    v6.Size = UDim2.fromOffset(v9, v1(28))
    v7 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v1(8)),
    })}
    if not v3 then
        v9 = react.createElement(Button, {
            Text = "Add",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Height = v1(22),
            Native = {LayoutOrder = 1},
            Clicked = function() -- Line: 232 -- upvalues: Debugger (upval), p1 (val)
                Debugger.Enchantments.post({action = "add", enchantment = p1.Entry.name})
            end,
        })
    else
        v9 = react.createElement(Button, {
            Text = "Remove",
            Type = 1,
            Padding = "Medium",
            Color = Color3.fromRGB(214, 74, 74),
            TextColor = Color3.fromRGB(255, 255, 255),
            Height = v1(22),
            Native = {LayoutOrder = 1},
            Clicked = function() -- Line: 215 -- upvalues: Debugger (upval), p1 (val)
                Debugger.Enchantments.post({action = "remove", enchantment = p1.Entry.name})
            end,
        })
    end
    v7.Action = v9
    v5.Buttons = react.createElement("Frame", v6, v7)
    return react.createElement("Frame", v4, v5)
end
local function RaritySection(p1) -- Line: 243 -- upvalues: useRem (val), useDebuggerTheme (val), react (val), ClientEnchantmentsHandler (val), Text (val), EnchantmentRow (val)
    local u357, v1, v2, v3
    local v4 = useRem()
    local v5 = useDebuggerTheme()
    v3, u357 = react.useState(false)
    local v6 = string.lower(p1.SearchQuery)
    local v7 = {}
    local Items = p1.Items
    local v8 = nil
    local v9 = nil
    local v10 = p1
    for i, j in Items, v8, v9 do
        if not v10.OwnedOnly then
            if v6 ~= "" then
                v1 = string.lower(j.name .. " " .. j.description)
                if string.find(v1, v6, 1, true) ~= nil then
                    table.insert(v7, j)
                end
            else
                table.insert(v7, j)
            end
        elseif not (ClientEnchantmentsHandler.hasEnchantment(j.name)) then
        end
    end
    local v11 = v10.SearchQuery ~= ""
    v8 = v3 or v11
    local muted = v5.enchantments.rarity[v10.Rarity]
    if not muted then
        muted = v5.text.muted
    end
    local v12 = {}
    if #v7 ~= 0 then
        local v13 = v7
        v1 = nil
        v2 = nil
        for k, n in v13, v1, v2 do
            v12["E_" .. n.name] = react.createElement(EnchantmentRow, {Entry = n, Index = k})
        end
    else
        v12.Empty = react.createElement(Text, {
            Text = "No enchantments in this rarity match your search.",
            Native = {
                TextTransparency = 0.32,
                LayoutOrder = 1,
                TextColor3 = v5.text.muted,
                Size = UDim2.new(1, 0, 0, v4(24)),
                TextXAlignment = Enum.TextXAlignment.Left,
            },
        })
    end
    v2 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = v10.Index}
    local v14 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(8)),
    })}
    local v15 = {
        Text = "",
        AutoButtonColor = false,
        BackgroundColor3 = v5.chrome.headerSurface,
        BackgroundTransparency = 0.14,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, v4(32)),
        LayoutOrder = 1,
    }
    v15[react.Event.Activated] = function() -- Line: 319 -- upvalues: u357 (val)
        u357(function(p1) -- Line: 320
            return not p1
        end)
    end
    local v16 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(5))}), Stroke = react.createElement("UIStroke", {Transparency = 0.65, Thickness = 1, Color = muted})}
    local v17 = {BackgroundTransparency = 0.08, BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0.5)}
    local v18 = v4(8)
    v17.Position = UDim2.new(0, v18, 0.5, 0)
    local v19 = v4(3)
    v17.Size = UDim2.fromOffset(v19, v4(18))
    v17.BackgroundColor3 = muted
    v16.Accent = react.createElement("Frame", v17, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(4))})})
    v17 = {Bold = true, Text = string.format("%s (%d)", v10.Rarity, #v7)}
    local v20 = {TextTransparency = 0.08, AnchorPoint = Vector2.new(0, 0.5)}
    local v21 = v4(32)
    v20.Position = UDim2.new(0, v21, 0.5, 0)
    v21 = -v4(38)
    v20.Size = UDim2.new(1, v21, 1, 0)
    v20.TextColor3 = muted
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v20.TextTruncate = Enum.TextTruncate.AtEnd
    v17.Native = v20
    v16.Title = react.createElement(Text, v17)
    v17 = {ImageTransparency = 0.2, BackgroundTransparency = 1, BorderSizePixel = 0}
    if not v8 then
        v20 = "rbxassetid://11419703997"
    else
        v20 = "rbxassetid://11421095840"
    end
    v17.Image = v20
    v17.ImageColor3 = Color3.fromRGB(170, 170, 170)
    v17.AnchorPoint = Vector2.new(0, 0.5)
    v18 = v4(16)
    v17.Position = UDim2.new(0, v18, 0.5, 0)
    v19 = v4(12)
    v17.Size = UDim2.fromOffset(v19, v4(12))
    v16.Caret = react.createElement("ImageLabel", v17)
    v14.Header = react.createElement("TextButton", v15, v16)
    v14.Body = react.createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = v8,
    }, {List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v4(6)),
    })}, v12)
    return react.createElement("Frame", v2, v14)
end
return react.memo(function() -- Line: 392 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), useStore (val), Administration (val), Enchantments (val), Permissions (val), react (val), discoverEnchantments (val), u454 (val), Constants (val), RaritySection (val), Container (val), Search (val), Text (val), Checkbox (val), Button (val), Debugger (val), ScrollingFrame (val)
    local u43, v1, v2, v3, v4, v5, v6
    local v7 = useRem()
    local v8 = useTextScale()
    local v9 = useDebuggerTheme()
    local v10 = useOrder()
    local v11 = useDebuggerPages().Enchants == true
    local v12 = useStore(Administration.Store, function(p1) -- Line: 400
        return p1
    end)
    local v13 = useStore(Enchantments.Store, function(p1) -- Line: 404
        return p1
    end)
    local v14 = false
    if v12 ~= nil then
        v6 = v12.permission or 0
        v14 = Permissions.Roles.Developer <= v6
    end
    if v13 == nil then
        v6 = 0
    else
        v6 = #v13
    end
    v1, v2 = react.useState("")
    v3, u43 = react.useState(false)
    local v15 = react.useMemo(function() -- Line: 413 -- upvalues: discoverEnchantments (upval)
        return discoverEnchantments()
    end, {})
    local u52 = react.useRef(true)
    local v16 = react.useCallback(function(p1) -- Line: 417 -- upvalues: u52 (val), u43 (val)
        if u52.current then
            u52.current = false
            return
        end
        u43(p1)
    end, {})
    local v17 = {}
    local v18 = 0
    local v19 = u454
    local v20 = nil
    local v21 = nil
    for i, j in v19, v20, v21 do
        if j ~= "Mythic" then
            if j == "Legendary" then
                if not Constants.IsSupporterPlace then
                    v4 = v15[j]
                    if not v4 then
                        v4 = {}
                    end
                    v18 = v18 + 1
                    v17["R_" .. j] = react.createElement(RaritySection, {
                        Rarity = j,
                        Items = v4,
                        SearchQuery = v1,
                        OwnedOnly = v3,
                        Index = v18,
                    })
                elseif not Constants.IsTestingPlace then
                end
            elseif j ~= "Unique" then
            end
        elseif v14 and Constants.IsSupporterPlace then
        end
    end
    v21 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = v11},
    }
    local v22 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v7(12)),
    }), Search = react.createElement(Search, {
        PlaceholderText = "Filter enchantments by name or description...",
        WidthPx = v7(595),
        HeightPx = v7(30),
        LayoutOrder = v10(),
        OnQueryChange = v2,
    })}
    local v23 = {}
    if not v3 then
        v5 = string.format("Grouped enchantments by rarity. Owned: %d", v6)
    else
        v5 = string.format("Grouped enchantments by rarity. Showing owned enchantments only. Owned: %d", v6)
    end
    v23.Text = v5
    v23.Native = {TextTransparency = 0.45, TextColor3 = v9.text.muted, LayoutOrder = v10()}
    v22.CountLine = react.createElement(Text, v23)
    v23 = {BackgroundTransparency = 1}
    local v24 = v7(595)
    v23.Size = UDim2.fromOffset(v24, v7(28))
    v23.LayoutOrder = v10()
    v5 = {OwnedOnly = react.createElement(Checkbox, {
        Label = "Owned only",
        Upscale = 1,
        Default = v3,
        Toggled = v16,
        Native = {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0)},
    })}
    local v25 = {
        Text = "Reset All",
        Type = 1,
        Padding = "Medium",
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Height = v7(24),
    }
    local v26 = {AnchorPoint = Vector2.new(1, 0.5)}
    local v27 = v7(4)
    v26.Position = UDim2.new(1, v27, 0.5, 0)
    v25.Native = v26
    function v25.Clicked() -- Line: 517 -- upvalues: Debugger (upval)
        Debugger.Enchantments.post({clear = true})
    end
    v5.ResetAll = react.createElement(Button, v25)
    v25 = {Text = "Refresh", Type = 3, Padding = "Medium", Height = v7(24)}
    v26 = {AnchorPoint = Vector2.new(1, 0.5)}
    v27 = -v7(60)
    v26.Position = UDim2.new(1, v27, 0.5, 0)
    v25.Native = v26
    function v25.Clicked() -- Line: 533 -- upvalues: Debugger (upval)
        Debugger.Enchantments.post({refresh = true})
    end
    v5.Refresh = react.createElement(Button, v25)
    v22.OwnedOnlyRow = react.createElement("Frame", v23, v5)
    v23 = {BackgroundTransparency = 0.12, BorderSizePixel = 0, BackgroundColor3 = v9.chrome.panelSurface}
    v24 = v7(600)
    v23.Size = UDim2.fromOffset(v24, v7(420))
    v23.LayoutOrder = v10()
    v5 = {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v7(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v9.chrome.panelStroke})}
    v25 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    local v28 = v7(8)
    v25.Position = UDim2.new(0, v28, 0, v7(8))
    v25.ScrollBarThickness = v8(5)
    v25.ScrollBarImageColor3 = v9.chrome.scrollThumb
    v28 = -v7(16)
    v25.Size = UDim2.new(1, v28, 1, -v7(16))
    v5.Scroll = react.createElement(ScrollingFrame, v25, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v8(6))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v7(10)),
    })}, v17)})
    v22.ScrollChrome = react.createElement("Frame", v23, v5)
    return react.createElement(Container, v21, v22)
end)