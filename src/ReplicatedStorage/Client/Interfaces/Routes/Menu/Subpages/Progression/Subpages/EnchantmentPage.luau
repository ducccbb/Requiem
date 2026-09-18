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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.Subpages.EnchantmentPage
--                               Dumped in 0.00400 seconds
--                          Bytecode version 9  |  23 functions

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
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal_2 = Components:WaitForChild("Universal")
local Progress = require(Universal_2:WaitForChild("Progress"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Menu = Components_2:WaitForChild("Menu")
local Progression = Menu:WaitForChild("Progression")
local Effects_2 = Progression:WaitForChild("Effects")
local Cards = Effects_2:WaitForChild("Cards")
local Effects = require(Cards:WaitForChild("Effects"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Menu_2 = Components_3:WaitForChild("Menu")
local Progression_2 = Menu_2:WaitForChild("Progression")
local Enchantment = require(Progression_2:WaitForChild("Enchantment"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Universal_3 = Components_5:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_4 = Components_7:WaitForChild("Universal")
local Form = require(Universal_4:WaitForChild("Form"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_5 = Components_8:WaitForChild("Universal")
local Keybind = require(Universal_5:WaitForChild("Keybind"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Screen = Components_9:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Editor = Components_10:WaitForChild("Editor")
local Universal_6 = Editor:WaitForChild("Universal")
local Search = require(Universal_6:WaitForChild("Search"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks = Interfaces_11:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_12:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_13:WaitForChild("Hooks")
local usePopup = require(Hooks_3:WaitForChild("usePopup"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_14:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_20:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local State = require(Utilities_3:WaitForChild("State"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_15:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_16:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_23:WaitForChild("Client")
local Progression_3 = Client_17:WaitForChild("Progression")
local Enchantments_2 = Progression_3:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_24:WaitForChild("Common")
local Progression_4 = Common_6:WaitForChild("Progression")
local Enchantments_3 = Progression_4:WaitForChild("Enchantments")
local Rarities = require(Enchantments_3:WaitForChild("Rarities"))
local function EnchantmentPagePopup(p1) -- Line: 83 -- upvalues: useOrder (val), useRem (val), useToast (val), useStore (val), Enchantments (val), ClientEnchantmentsHandler (val), Table (val), useAlertPopup (val), Sounds (val), Universal (val), react (val), Popup (val), Form (val), HeaderBodyComponent (val), Button (val), Keybind (val), Progress (val), Rarities (val)
    local closePopup = p1.closePopup
    local v1 = useOrder()
    local v2 = useRem()
    local u7 = useToast()
    local EnchantmentName = p1.EnchantmentName
    local v3 = useStore(Enchantments.Store, function(p1) -- Line: 96 -- upvalues: ClientEnchantmentsHandler (upval), EnchantmentName (val)
        local hash, keybind, v1
        local v2 = p1
        if not v2 then
            v2 = {}
        end
        for k, v in pairs(v2) do
            hash = v
            if hash then
                hash = v.hash
                if hash then
                    hash = ClientEnchantmentsHandler.getEnchantmentFromHash(v.hash)
                end
            end
            if hash and hash.Name == EnchantmentName then
                v1 = {}
                keybind = v.keybind
                if not keybind then
                    keybind = Enum.KeyCode.Unknown.Value
                end
                v1.keybind = keybind
                v1.hotbar = v.hotbar or -1
                return v1
            end
        end
        return {hotbar = -1, keybind = Enum.KeyCode.Unknown.Value}
    end)
    local u20 = Table.merge(p1.BaseEnchantment, {Keybind = v3.keybind, Hotbar = v3.hotbar})
    local u23 = useAlertPopup(function(p1) -- Line: 115 -- upvalues: Sounds (upval), Universal (upval), Enchantments (upval), u20 (val), closePopup (val)
        if not p1 then
            return
        end
        Sounds.playGlobalSoundEffect(Universal.ForsakeEnchant, 0.1, 0.6, 4)
        Enchantments.Forsake.post(u20.Name)
        closePopup()
    end)
    local u26 = useAlertPopup(function(p1) -- Line: 125 -- upvalues: Sounds (upval), Universal (upval), Enchantments (upval), u20 (val), closePopup (val)
        if not p1 then
            return
        end
        Sounds.playGlobalSoundEffect(Universal.BurnEnchant, 0.1, 1, 4)
        Enchantments.Burn.post(u20.Name)
        closePopup()
    end)
    local v4 = {Header = react.createElement(Popup.Header, {Header = u20.Name, Body = u20.Description or "No description available."})}
    local v5 = {}
    local v6 = {
        Strokeless = true,
        Native = {BackgroundTransparency = 1, LayoutOrder = v1(), Visible = not u20.passive},
    }
    local v7 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {
        Header = "Bindings",
        Body = "Adjust the keybind by clicking the keybind button.",
        Wrap = true,
        Position = UDim2.fromScale(0.5, 0.5),
        Native = {BackgroundTransparency = 1, LayoutOrder = v1()},
    })})}
    local v8 = {
        Side = "Right",
        Native = {Visible = not u20.passive},
    }
    local v9 = {}
    local v10 = {Type = 3}
    local v11 = {LayoutOrder = v1()}
    v10.Native = v11
    if -1 >= u20.Hotbar then
        v11 = "Add to Hotbar"
    else
        v11 = "Remove from Hotbar"
    end
    v10.Text = v11
    v10.Outline = Color3.fromRGB(179, 179, 179)
    v10.TextColor = Color3.fromRGB(200, 200, 200)
    function v10.Clicked() -- Line: 184 -- upvalues: Enchantments (upval), u20 (val)
        local v1
        local v2 = {name = u20.Name}
        if -1 >= u20.Hotbar then
            v1 = 1
        else
            v1 = 0
        end
        v2.added = v1
        Enchantments.Hotbar.post(v2)
    end
    v9.Hotbar = react.createElement(Button, v10)
    v10 = {Text = "Remove Keybind", Type = 4}
    v11 = {LayoutOrder = v1()}
    local v12 = u20.Keybind ~= Enum.KeyCode.Unknown.Value
    v11.Visible = v12
    v10.Native = v11
    function v10.Clicked() -- Line: 198 -- upvalues: p1 (val), Enchantments (upval), u20 (val)
        if not p1 then
            return
        end
        Enchantments.Bind.post({name = u20.Name, keybind = Enum.KeyCode.Unknown.Value})
    end
    v9.Remove = react.createElement(Button, v10)
    v10 = {PopupType = true}
    local Keybind_2 = u20.Keybind
    if not Keybind_2 then
        Keybind_2 = Enum.KeyCode.Unknown.Value
    end
    v10.Default = Keybind_2
    v10.Native = {LayoutOrder = v1()}
    function v10.Changed(a1) -- Line: 216 -- upvalues: p1 (val), Enchantments (upval), u20 (val)
        if not p1 then
            return
        end
        Enchantments.Bind.post({name = u20.Name, keybind = a1.Value})
    end
    v9.Keybind = react.createElement(Keybind, v10)
    v7.Right = react.createElement(Form.Divider, v8, v9)
    v5.Overview = react.createElement(Form.Form, v6, v7)
    v5.Breaker = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v2(20)), LayoutOrder = v1()})
    v5.Drawbacks = react.createElement(Form.Form, {
        Strokeless = true,
        Native = {BackgroundTransparency = 1, LayoutOrder = v1(), Visible = u20.drawbacks or false},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {
        Header = "Drawbacks",
        Wrap = true,
        Body = u20.drawbacks or "Unknown",
        Position = UDim2.fromScale(0.5, 0.5),
        Native = {LayoutOrder = v1()},
    })}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
        Text = "Purify",
        Brightness = 1,
        Native = {LayoutOrder = v1()},
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 271 -- upvalues: u7 (val)
            u7({type = "error", message = "You do not have the required items to purify this enchantment."})
        end,
    })})})
    v5.Upgrade = react.createElement(Progress, {
        Header = "Enchantment Progression",
        Body = "Upgrade your enchantment for increased effects, and less drawbacks.",
        Segments = 5,
        Value = 0,
        Button = "Upgrade",
        ButtonBrightness = 1,
        ButtonColor = Color3.fromRGB(255, 255, 255),
        ButtonTextColor = Color3.fromRGB(0, 0, 0),
        Color = Color3.fromRGB(255, 255, 255),
        Native = {BackgroundTransparency = 1, LayoutOrder = v1(), Visible = u20.upgradable},
        Clicked = function() -- Line: 297 -- upvalues: u7 (val)
            u7({type = "error", message = "You do not have the required items to upgrade this enchantment."})
        end,
    })
    v4.Body = react.createElement(Popup.Body, {Bottom = 50}, v5)
    v4.Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 313 -- upvalues: closePopup (val)
            closePopup()
        end,
    }), Forsake = react.createElement(Button, {
        Text = "Forsake",
        Type = 4,
        Clicked = function() -- Line: 322 -- upvalues: u20 (val), Rarities (upval), u7 (val), u23 (val)
            if u20.Rarity == Rarities.Rarities.Unique or u20.forsakable == false then
                u7({type = "error", message = "You cannot forsake this enchantment."})
                return
            end
            u23("Forsake Enchantment", "Are you sure you wish to forsake this enchantment? This action is irreversible, and this enchantment will be lost.", Color3.fromRGB(255, 0, 0))
        end,
    }), Burn = react.createElement(Button, {
        Text = "Burn",
        Type = 4,
        Clicked = function() -- Line: 343 -- upvalues: u20 (val), Rarities (upval), u7 (val), u26 (val)
            if u20.Rarity == Rarities.Rarities.Unique or u20.burnable == false then
                u7({type = "error", message = "You cannot burn this enchantment."})
                return
            end
            u26("Burn Enchantment", "Are you sure you wish to burn this enchantment? This action is irreversible, and this enchantment will be lost, you will never be able to roll it again.", Color3.fromRGB(255, 0, 0))
        end,
    })})
    return react.createElement(react.Fragment, {}, v4)
end
local function mergeGridChildren(...) -- Line: 371
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
local function hasCustomArt(p1) -- Line: 383
    local v1 = if p1.Art ~= nil then p1.Art ~= "" else false
    return v1
end
local function compareVisibleEnchantments(p1, p2) -- Line: 389 -- upvalues: hasCustomArt (val)
    local v1
    if p1.Claimed ~= p2.Claimed then
        return not p1.Claimed
    end
    if p1.Rarity ~= p2.Rarity then
        v1 = p2.Rarity < p1.Rarity
        return v1
    end
    v1 = hasCustomArt(p1)
    if v1 ~= hasCustomArt(p2) then
        return not v1
    end
    local v2 = p1.Label < p2.Label
    return v2
end
local function getCardCellSize(p1, p2) -- Line: 410
    local v1
    local v2 = p2(8)
    if p1 <= 0 then
        v1 = p2(120)
        return UDim2.fromOffset(v1, (math.floor(v1 / 0.715)))
    end
    v1 = math.floor((p1 - v2 * 5) / 6)
    local v3 = math.floor(v1 / 0.715)
    local v4 = math.max(1, v1)
    return UDim2.fromOffset(v4, (math.max(1, v3)))
end
return function(p1) -- Line: 424 -- upvalues: usePopup (val), react (val), useRem (val), getCardCellSize (val), State (val), Rarities (val), EnchantmentPagePopup (val), useStore (val), Enchantments (val), Table (val), ClientEnchantmentsHandler (val), compareVisibleEnchantments (val), Enchantment (val), Frame (val), Search (val), Effects (val), mergeGridChildren (val)
    local u2, u294, u295, u3, v1, v2, v3, v4, v5, v6, v7
    u2, u3, v5 = usePopup()
    local v8 = {}
    v6, v7 = react.useState("")
    local v9 = useRem()
    u294, u295 = react.useState(0)
    local v10 = getCardCellSize(u294, v9)
    local u27 = react.useCallback(function(p1, p2) -- Line: 433 -- upvalues: State (upval), Rarities (upval), u2 (val), react (upval), EnchantmentPagePopup (upval), u3 (val)
        local enchant, enchant_2
        if p1.claimed == 1 then
            local v1 = Rarities.Colors[p2.Rarity]
            local v2 = {}
            v2["Enchantment_" .. p2.Name] = react.createElement(EnchantmentPagePopup, {key = p2.Name, EnchantmentName = p2.Name, BaseEnchantment = p2, closePopup = u3})
            u2(v2, {color = v1})
            return
        end
        enchant, enchant_2 = State("enchant")
        if not enchant_2 then
            enchant({visible = true, enchantment = p2, id = math.random(1, 50000)})
            return
        end
        if enchant_2.visible then
            return
        end
        enchant({visible = true, enchantment = p2, id = math.random(1, 50000)})
    end, {u2})
    local v11 = useStore(Enchantments.Store, function(a1) -- Line: 463 -- upvalues: Table (upval), ClientEnchantmentsHandler (upval), p1 (val), u27 (val)
        local v1 = a1
        if not v1 then
            v1 = {}
        end
        return Table.map(v1, function(a1, p2) -- Line: 464 -- upvalues: ClientEnchantmentsHandler (upval), p1 (upval), u27 (upval)
            local Art, Embers, Glow, Icon, Name, Rarity, v1
            local hash = a1
            if hash then
                hash = a1.hash
                if hash then
                    hash = ClientEnchantmentsHandler.getEnchantmentFromHash(a1.hash)
                end
            end
            local v2 = {Proficiency = false, Index = p2}
            if not hash then
                Name = "Unknown"
            else
                Name = hash.Name
            end
            v2.Label = Name
            if not hash then
                Rarity = 0
            else
                Rarity = hash.Rarity
            end
            v2.Rarity = Rarity
            v2.Enabled = p1.Enabled
            local keybind = a1.keybind
            if not keybind then
                keybind = Enum.KeyCode.Unknown.Value
            end
            v2.Keybind = keybind
            if not hash then
                Icon = nil
            else
                Icon = hash.Icon
            end
            v2.Icon = Icon
            if not hash then
                Art = nil
            else
                Art = hash.Art
            end
            v2.Art = Art
            if not hash then
                Glow = nil
            else
                Glow = hash.Glow
            end
            v2.Glow = Glow
            if not hash then
                Embers = nil
            else
                Embers = hash.Embers
            end
            v2.Embers = Embers
            if not hash then
                v1 = false
            else
                v1 = not (hash.Pulse ~= true)
            end
            v2.Pulse = v1
            v1 = a1.claimed == 1
            v2.Claimed = v1
            v2.Id = a1.id
            v2.Hotbar = a1.hotbar
            function v2.Clicked() -- Line: 485 -- upvalues: u27 (upval), a1 (val), hash (val)
                u27(a1, hash)
            end
            return v2
        end)
    end)
    local v12 = string.lower(v6)
    local v13 = {}
    local u289 = p1
    for i, v in ipairs(v11) do
        if v12 == "" then
            table.insert(v13, v)
        else
            v1 = string.lower(v.Label)
            if not (string.find(v1, v12, 1, true)) then end
        end
    end
    table.sort(v13, compareVisibleEnchantments)
    local v14 = false
    for i2, i3 in ipairs(v13) do
        if not i3.Glow and not i3.Embers then
            continue
        end
        v14 = true
        break
    end
    local v15 = #v13
    for i4, j in ipairs(v13) do
        if v15 > 1 then
            v2 = (i4 - 1) / (v15 - 1) * 0.2
        else
            v2 = 0
        end
        v3 = j.Label .. tostring(j.Id)
        v4 = {EffectId = j.Label .. tostring(j.Id), Enabled = u289.Enabled, Index = i4, EntranceDelay = v2}
        v8[v3] = react.createElement(Enchantment.Card, (Table.merge(j, v4)))
    end
    local v16 = v9(32)
    local v17 = {Visible = u289.Enabled}
    v1 = {EnchantmentPopup = v5, Layout = react.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, VerticalAlignment = Enum.VerticalAlignment.Top, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, v9(6))}), Search = react.createElement(Search, {
        LayoutOrder = 1,
        IsMenu = true,
        Size = UDim2.new(1, 0, 0, v16),
        HeightPx = v16,
        OnQueryChange = v7,
        PlaceholderText = string.format("Search %d enchantments...", #v11),
    })}
    local v18 = {LayoutOrder = 2, ScrollBarThickness = 3, Enabled = u289.Enabled and v14, Size = UDim2.new(1, 0, 1, -(v16 + v9(6)))}
    local v19 = {}
    v4 = {BackgroundTransparency = 1, Size = UDim2.new(1, -3, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}
    v4[react.Change.AbsoluteSize] = function(p1) -- Line: 561 -- upvalues: u294 (val), u295 (val)
        local X = p1.AbsoluteSize.X
        if X ~= u294 then
            u295(X)
        end
    end
    local v20 = {}
    local v21 = {FillDirectionMaxCells = 6}
    local v22 = v9(8)
    v21.CellPadding = UDim2.fromOffset(v22, v9(8))
    v21.CellSize = v10
    v21.FillDirection = Enum.FillDirection.Horizontal
    v21.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v21.SortOrder = Enum.SortOrder.LayoutOrder
    v20.Grid = react.createElement("UIGridLayout", v21)
    v19.Container = react.createElement("Frame", v4, mergeGridChildren(v20, v8))
    v1.Home = react.createElement(Effects.Provider, v18, v19)
    return react.createElement(Frame, v17, v1)
end