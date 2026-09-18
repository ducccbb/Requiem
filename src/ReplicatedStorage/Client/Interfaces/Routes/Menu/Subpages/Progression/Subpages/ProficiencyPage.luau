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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.Subpages.ProficiencyPage
--                               Dumped in 0.0109 seconds
--                          Bytecode version 9  |  61 functions

local u835
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
local Proficiencies = require(Namespaces:WaitForChild("Proficiencies"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Cache = require(Common_4:WaitForChild("Cache"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Progression_2 = Common_5:WaitForChild("Progression")
local Proficiencies_3 = Progression_2:WaitForChild("Proficiencies")
local Proficiencies_2 = require(Proficiencies_3:WaitForChild("Proficiencies"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Tabs = Menu:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_4 = Client_5:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local Tabs_2 = Menu_2:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Utilities = Components_5:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_3 = Components_6:WaitForChild("Primitives")
local Label = require(Primitives_3:WaitForChild("Label"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_7 = Client_8:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Primitives_4 = Components_7:WaitForChild("Primitives")
local Shadow = require(Primitives_4:WaitForChild("Shadow"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_15:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_16:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_8 = Client_9:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_2 = Components_8:WaitForChild("Universal")
local Progress = require(Universal_2:WaitForChild("Progress"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_9 = Client_10:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Universal_3 = Components_9:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_10 = Client_11:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Inputs = Components_10:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_11 = Client_12:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Universal_4 = Components_11:WaitForChild("Universal")
local Form = require(Universal_4:WaitForChild("Form"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_12 = Client_13:WaitForChild("Interfaces")
local Components_12 = Interfaces_12:WaitForChild("Components")
local Universal_5 = Components_12:WaitForChild("Universal")
local Keybind = require(Universal_5:WaitForChild("Keybind"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_13 = Client_14:WaitForChild("Interfaces")
local Components_13 = Interfaces_13:WaitForChild("Components")
local Screen = Components_13:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_14 = Client_15:WaitForChild("Interfaces")
local Hooks = Interfaces_14:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_15 = Client_16:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_15:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks_2:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_16 = Client_17:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_16:WaitForChild("Hooks")
local useDebounceCallback = require(Hooks_3:WaitForChild("useDebounceCallback"))
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local v2 = ReplicatedStorage_26:WaitForChild("Client")
v2 = v2:WaitForChild("Interfaces")
v2 = v2:WaitForChild("Hooks")
local useDebounceState = require(v2:WaitForChild("useDebounceState"))
local v3 = game:GetService("ReplicatedStorage")
v3 = v3:WaitForChild("Client")
v3 = v3:WaitForChild("Interfaces")
v3 = v3:WaitForChild("Hooks")
local useMotion = require(v3:WaitForChild("useMotion"))
local v4 = game:GetService("ReplicatedStorage")
v4 = v4:WaitForChild("Client")
v4 = v4:WaitForChild("Interfaces")
v4 = v4:WaitForChild("Hooks")
local useOrder = require(v4:WaitForChild("useOrder"))
local v5 = game:GetService("ReplicatedStorage")
v5 = v5:WaitForChild("Client")
v5 = v5:WaitForChild("Interfaces")
v5 = v5:WaitForChild("Hooks")
local usePopup = require(v5:WaitForChild("usePopup"))
local v6 = game:GetService("ReplicatedStorage")
v6 = v6:WaitForChild("Client")
v6 = v6:WaitForChild("Interfaces")
v6 = v6:WaitForChild("Hooks")
local useRem = require(v6:WaitForChild("useRem"))
local v7 = game:GetService("ReplicatedStorage")
v7 = v7:WaitForChild("Client")
v7 = v7:WaitForChild("Interfaces")
v7 = v7:WaitForChild("Hooks")
local useStore = require(v7:WaitForChild("useStore"))
local v8 = game:GetService("ReplicatedStorage")
v8 = v8:WaitForChild("Client")
v8 = v8:WaitForChild("Interfaces")
v8 = v8:WaitForChild("Hooks")
local useTheme = require(v8:WaitForChild("useTheme"))
local v9 = game:GetService("ReplicatedStorage")
v9 = v9:WaitForChild("Client")
v9 = v9:WaitForChild("Interfaces")
v9 = v9:WaitForChild("Hooks")
local useToast = require(v9:WaitForChild("useToast"))
local v10 = game:GetService("ReplicatedStorage")
v10 = v10:WaitForChild("Client")
v10 = v10:WaitForChild("Interfaces")
v10 = v10:WaitForChild("Hooks")
local useTooltip = require(v10:WaitForChild("useTooltip"))
local v11 = game:GetService("ReplicatedStorage")
v11 = v11:WaitForChild("Common")
v11 = v11:WaitForChild("Statistics")
_, u835 = require(v11:WaitForChild("useFieldOfView"))()
local u836 = {tension = 680, friction = 52}
local function computeDepthByName(p1) -- Line: 183
    local Unlocks, Unlocks_2, v1, v2, v3
    local v4 = {}
    local v5 = p1
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v4[j.Name] = j
    end
    v5 = {}
    v6 = p1
    v7 = nil
    local v8 = nil
    local v9 = p1
    for k, n in v6, v7, v8 do
        Unlocks_2 = n.Unlocks
        v3 = nil
        v1 = nil
        for m, i5 in Unlocks_2, v3, v1 do
            v5[i5] = true
        end
    end
    v6 = {}
    v7 = {}
    v8 = v9
    local v10 = nil
    local v11 = nil
    for i6, i7 in v8, v10, v11 do
        if not (v5[i7.Name]) then
            v6[i7.Name] = 1
            table.insert(v7, i7.Name)
        end
    end
    if #v7 == 0 and 0 < #v9 then
        v6[v9[1].Name] = 1
        table.insert(v7, v9[1].Name)
    end
    while 0 < #v7 do
        v8 = table.remove(v7, 1)
        if not v8 then
            break
        end
        v10 = v6[v8]
        v11 = v4[v8]
        if v11 then
            Unlocks = v11.Unlocks
            v3 = nil
            v1 = nil
            for i8, i9 in Unlocks, v3, v1 do
                if v4[i9] then
                    v2 = v10 + 1
                    if not (v6[i9]) then
                        v6[i9] = v2
                        table.insert(v7, i9)
                    elseif v2 >= v6[i9] then
                    end
                end
            end
        end
    end
    v8 = v9
    v10 = nil
    v11 = nil
    for i10, i11 in v8, v10, v11 do
        if not (v6[i11.Name]) then
            v6[i11.Name] = 999
        end
    end
    return v6
end
local function computeHiddenByBlockers(p1, p2) -- Line: 247
    local Blocks, v1, v2, v3, v4
    local v5 = {}
    local v6 = p1
    local v7 = nil
    local v8 = nil
    local v9 = p2
    for i, j in v6, v7, v8 do
        Blocks = j.Blocks
        v4 = if v9 ~= "" then j.Name == v9 else false
        if Blocks and 0 < #Blocks then
            if j.Unlocked then
                v1 = Blocks
                v2 = nil
                v3 = nil
                for k, n in v1, v2, v3 do
                    v5[n] = true
                end
            elseif not v4 then
            end
        end
    end
    return v5
end
local function isEntireTreeUnlocked(p1, p2, p3, p4) -- Line: 274
    local v1, v2, v3
    local v4 = {}
    if p3 then
        v1 = p3
        v2 = nil
        v3 = nil
        for i, j in v1, v2, v3 do
            v4[j] = true
        end
    end
    if p4 then
        v1 = p4
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            v4[n] = true
        end
    end
    v1 = p1
    v2 = nil
    v3 = nil
    for m, i5 in v1, v2, v3 do
        if i5.Name ~= p2 and not (v4[i5.Name]) and not i5.Unlocked then
            return false
        end
    end
    return true
end
local function isUnlockExemptFromEntireTreeRequirement(p1, p2) -- Line: 312
    local Unlocks, v1, v2
    local v3 = p1
    local v4 = nil
    local v5 = nil
    local v6 = p2
    for i, j in v3, v4, v5 do
        if j.RequiresEntireTree == true then
            Unlocks = j.Unlocks
            v1 = nil
            v2 = nil
            for k, n in Unlocks, v1, v2 do
                if n == v6 then
                    return true
                end
            end
        end
    end
    return false
end
local function getEnchantmentCountForNode(p1, p2) -- Line: 335 -- upvalues: Cache (val)
    if p1 == "" or p2 == "" then
        return 0
    end
    local Proficiencies = Cache:FindFirstChild("Proficiencies")
    if not Proficiencies then
        return 0
    end
    local v1 = Proficiencies:FindFirstChild(p1)
    if not v1 then
        return 0
    end
    local v2 = v1:FindFirstChild(p2)
    if not v2 then
        return 0
    end
    if v2:IsA("NumberValue") then
        return v2.Value
    end
    return 0
end
local function hasUnlockedConnectionOrRoot(p1, p2) -- Line: 364
    local Unlocks, v1, v2, v3, v4, v5, v6, v7
    local v8 = 0
    local v9 = 0
    local v10 = 0
    local v11 = p1
    local v12 = nil
    local v13 = nil
    v1, v2 = p1, p2
    for i, j in v11, v12, v13 do
        Unlocks = j.Unlocks
        v3 = nil
        v4 = nil
        for k, n in Unlocks, v3, v4 do
            if n == v2 then
                v8 = v8 + 1
                if j.Unlocked then
                    v9 = v9 + 1
                end
            end
            if j.Name == v2 and n ~= v2 then
                v5 = v1
                v6 = nil
                v7 = nil
                for m, i5 in v5, v6, v7 do
                    if i5.Name == n and i5.Unlocked then
                        v10 = v10 + 1
                        break
                    end
                end
            end
        end
    end
    if v8 == 0 then
        return true
    end
    v11 = if 0 >= v9 then 0 < v10 else true
    return v11
end
local function ProficiencyPagePopup(p1) -- Line: 401 -- upvalues: useOrder (val), useRem (val), useToast (val), useStore (val), Proficiencies (val), react (val), Popup (val), Form (val), HeaderBodyComponent (val), Button (val), Keybind (val)
    local hotbar, keybind, meta, v1
    local closePopup = p1.closePopup
    local v2 = useOrder()
    useRem()
    useToast()
    local Name = p1.SelectedProficiency.Name
    v1 = useStore(Proficiencies.Store, function(a1) -- Line: 413 -- upvalues: p1 (val), Name (val)
        local Value_2, hotbars_2, keybinds_2, meta_2, v1, v2
        local v3 = a1
        if not v3 then
            v3 = {}
        end
        for k, v in pairs(v3) do
            v1 = string.lower(v.name)
            if v1 == string.lower(p1.ProficiencyName) then
                keybinds_2 = v.keybinds
                if not keybinds_2 then
                    keybinds_2 = {}
                end
                hotbars_2 = v.hotbars
                if not hotbars_2 then
                    hotbars_2 = {}
                end
                v2 = {}
                meta_2 = v.meta
                if meta_2 then
                    meta_2 = v.meta[Name]
                end
                v2.meta = meta_2
                Value_2 = keybinds_2[Name]
                if not Value_2 then
                    Value_2 = Enum.KeyCode.Unknown.Value
                end
                v2.keybind = Value_2
                v2.hotbar = hotbars_2[Name] or -1
                return v2
            end
        end
        local keybinds = p1.BaseProficiency.keybinds
        if not keybinds then
            keybinds = {}
        end
        local hotbars = p1.BaseProficiency.hotbars
        if not hotbars then
            hotbars = {}
        end
        local v4 = {}
        local meta = p1.BaseProficiency.meta
        if meta then
            meta = p1.BaseProficiency.meta[Name]
        end
        v4.meta = meta
        local Value = keybinds[Name]
        if not Value then
            Value = Enum.KeyCode.Unknown.Value
        end
        v4.keybind = Value
        v4.hotbar = hotbars[Name] or -1
        return v4
    end)
    meta = v1
    if meta then
        meta = v1.meta
    end
    if not v1 then
        keybind = Enum.KeyCode.Unknown.Value
    else
        keybind = v1.keybind
    end
    if not v1 then
        hotbar = -1
    else
        hotbar = v1.hotbar
    end
    local v3 = meta
    if v3 then
        v3 = if type(meta.cooldown) == "number" then 0 < meta.cooldown else false
    end
    local v4 = if p1.SelectedProficiency.Label ~= "I" then p1.SelectedProficiency.Label == "X" else true
    local v5 = (v3 or false) and v4
    local v6 = {Header = react.createElement(Popup.Header, {Header = p1.SelectedProficiency.Name, Body = p1.SelectedProficiency.Description or "No description available."})}
    local v7 = {}
    local v8 = {
        Strokeless = true,
        Native = {BackgroundTransparency = 1, LayoutOrder = v2(), Visible = v5},
    }
    local v9 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {
        Header = "Bindings",
        Body = "Adjust the keybind by clicking the keybind button.",
        Wrap = true,
        Position = UDim2.fromScale(0.5, 0.5),
        Native = {BackgroundTransparency = 1, LayoutOrder = v2()},
    })})}
    local v10 = {}
    local v11 = {Type = 3}
    local v12 = {Visible = true, LayoutOrder = v2()}
    v11.Native = v12
    if -1 >= hotbar then
        v12 = "Add to Hotbar"
    else
        v12 = "Remove from Hotbar"
    end
    v11.Text = v12
    v11.Outline = Color3.fromRGB(179, 179, 179)
    v11.TextColor = Color3.fromRGB(200, 200, 200)
    function v11.Clicked() -- Line: 492 -- upvalues: Proficiencies (upval), p1 (val), Name (val), hotbar (val)
        local v1
        local v2 = {name = p1.ProficiencyName, node = Name}
        if -1 >= hotbar then
            v1 = 1
        else
            v1 = 0
        end
        v2.added = v1
        Proficiencies.Hotbar.post(v2)
    end
    v10.Hotbar = react.createElement(Button, v11)
    v11 = {Text = "Remove Keybind", Type = 4}
    v12 = {LayoutOrder = v2()}
    local v13 = keybind ~= Enum.KeyCode.Unknown.Value
    v12.Visible = v13
    v11.Native = v12
    function v11.Clicked() -- Line: 510 -- upvalues: p1 (val), Proficiencies (upval), Name (val)
        if not p1 then
            return
        end
        Proficiencies.Bind.post({name = p1.ProficiencyName, node = Name, keybind = Enum.KeyCode.Unknown.Value})
    end
    v10.Remove = react.createElement(Button, v11)
    v10.Keybind = react.createElement(Keybind, {
        PopupType = true,
        Default = keybind,
        Changed = function(a1) -- Line: 528 -- upvalues: p1 (val), Proficiencies (upval), Name (val)
            if not p1 then
                return
            end
            Proficiencies.Bind.post({name = p1.ProficiencyName, node = Name, keybind = a1.Value})
        end,
    })
    v9.Right = react.createElement(Form.Divider, {
        Side = "Right",
        Native = {Visible = v5},
    }, v10)
    v7.Overview = react.createElement(Form.Form, v8, v9)
    v6.Body = react.createElement(Popup.Body, {Bottom = 50}, v7)
    v6.Buttons = react.createElement(Popup.Buttons, {}, {Close = react.createElement(Button, {
        Text = "Close",
        Brightness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        Clicked = function() -- Line: 551 -- upvalues: closePopup (val)
            closePopup()
        end,
    })})
    return react.createElement(react.Fragment, {}, v6)
end
local function ProficiencySkillEdge(p1) -- Line: 564 -- upvalues: useMotion (val), react (val), useAsyncEffect (val), Promise (val), u836 (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(0)
    local v3 = math.deg((math.atan2(p1.Delta.Y, p1.Delta.X)))
    local u20 = react.useRef(false)
    local u24 = react.useRef(false)
    useAsyncEffect(function() -- Line: 573 -- upvalues: p1 (val), u24 (val), u8 (val), Promise (upval), u836 (upval)
        local ChildUnlocked = p1.ChildUnlocked
        if ChildUnlocked then
            ChildUnlocked = p1.ParentUnlocked
            if ChildUnlocked then
                ChildUnlocked = not p1.BlockedHidden
            end
        end
        u24.current = ChildUnlocked
        if not ChildUnlocked or u24.current then
            return Promise.resolve()
        end
        u8:immediate(1)
        return Promise.delay(0.06):andThen(function() -- Line: 580 -- upvalues: u8 (upval), u836 (upval)
            u8:spring(0, u836)
        end)
    end, {p1.ChildUnlocked, p1.ParentUnlocked, p1.BlockedHidden})
    useAsyncEffect(function() -- Line: 588 -- upvalues: p1 (val), u20 (val), u4 (val), Promise (upval), u836 (upval)
        if not p1.Enabled then
            u20.current = false
            u4:immediate(0)
            return Promise.resolve()
        end
        if not p1.BlockedHidden then
            if u20.current then
                return Promise.resolve()
            end
            return Promise.delay(p1.ChildDepth * p1.Speed + 0.05):andThen(function() -- Line: 619 -- upvalues: u4 (upval), u836 (upval), u20 (upval)
                u4:spring(1, u836)
                u20.current = true
            end)
        end
        if u20.current then
            local v1 = math.max(0, p1.MaxDepth - math.max(p1.ParentDepth, p1.ChildDepth))
            return Promise.delay(v1 * (p1.Speed + 0.05) + 0.05):andThen(function() -- Line: 600 -- upvalues: u20 (upval), u4 (upval), u836 (upval)
                u20.current = false
                u4:spring(0, u836)
            end)
        end
        u4:immediate(0)
        return Promise.resolve()
    end, {
        p1.Enabled,
        p1.BlockedHidden,
        p1.ParentDepth,
        p1.ChildDepth,
        p1.Speed,
        p1.Length,
    })
    if not p1.ChildUnlocked then
        local v4
        local LineTransparency = p1.LineTransparency
        local v5 = {}
        local v6 = 0
        local v7 = 0
        while v6 + 6 <= p1.Length do
            if v7 >= 50 then
                break
            end
            v7 = v7 + 1
            local u89 = v6
            v4 = v6 + 3
            v6 = v6 + 11
            v5["Dash_" .. v7] = react.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = p1.LineColor,
                Position = UDim2.fromOffset(p1.ParentPixel.X + p1.Delta.X / p1.Length * v4, p1.ParentPixel.Y + p1.Delta.Y / p1.Length * v4),
                Rotation = v3,
                Size = UDim2.fromOffset(6, 2),
                BackgroundTransparency = v1:map(function(a1) -- Line: 690 -- upvalues: p1 (val), u89 (val), LineTransparency (val)
                    local v1 = p1.Length * a1
                    if v1 < math.min(2, p1.Length) then
                        return 1
                    end
                    if u89 <= v1 then
                        return LineTransparency
                    end
                    return 1
                end),
            })
        end
        return react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,
            Selectable = false,
            Active = false,
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 1),
        }, v5)
    elseif p1.ParentUnlocked then
        return react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v2:map(function(a1) -- Line: 636 -- upvalues: p1 (val)
                local v1 = Color3.fromRGB(255, 255, 255)
                return p1.LineColor:Lerp(v1, (math.clamp(a1 * 0.45, 0, 1)))
            end),
            BackgroundTransparency = v1:map(function(a1) -- Line: 640 -- upvalues: p1 (val)
                local v1 = p1.Length * a1
                if math.min(2, p1.Length) <= v1 then
                    return p1.LineTransparency
                end
                return 1
            end),
            Position = v1:map(function(a1) -- Line: 646 -- upvalues: p1 (val)
                local v1 = a1 / 2
                return UDim2.fromOffset(p1.ParentPixel.X + p1.Delta.X * v1, p1.ParentPixel.Y + p1.Delta.Y * v1)
            end),
            Rotation = v3,
            Size = v1:map(function(a1) -- Line: 654 -- upvalues: p1 (val)
                return UDim2.fromOffset(p1.Length * a1, 2)
            end),
        })
    end
end
local function ProficencySkillNode(p1) -- Line: 718 -- upvalues: useRem (val), useTheme (val), useMotion (val), useTooltip (val), react (val), useAsyncEffect (val), Promise (val), u836 (val), Sounds (val), Universal (val), Signals (val), u835 (val), Frame (val), Color (val), getEnchantmentCountForNode (val), Shadow (val)
    local Enabled, u12, u16, u20, u22, u23, u8, v1, v2, v3, v4, v5
    local u2 = useRem()
    local u4 = useTheme()
    v2, u8 = useMotion(0)
    v3, u12 = useMotion(1)
    v4, u16 = useMotion(1)
    v5, u20 = useMotion(0)
    u22, u23 = useTooltip()
    local u27 = react.useRef(false)
    local u31 = react.useRef(p1.IsUnlocked)
    useAsyncEffect(function() -- Line: 731 -- upvalues: p1 (val), u27 (val), u8 (val), u12 (val), u16 (val), Promise (upval), u836 (upval)
        if not p1.Enabled then
            u27.current = false
            u8:immediate(0)
            u12:immediate(1)
            u16:immediate(1)
            return Promise.resolve()
        end
        if not p1.BlockedHidden then
            if u27.current then
                return Promise.resolve()
            end
            local v1 = Promise.delay(p1.Depth * p1.Speed):andThen(function() -- Line: 763 -- upvalues: u8 (upval), u836 (upval), u12 (upval), Promise (upval)
                u8:spring(60, u836)
                u12:spring(0.1, u836)
                return Promise.delay(0.225)
            end)
            return v1:andThen(function() -- Line: 769 -- upvalues: u16 (upval), u836 (upval), u27 (upval)
                u16:spring(0, u836)
                u27.current = true
            end)
        end
        if u27.current then
            local v2 = math.max(0, p1.MaxDepth - p1.Depth)
            return Promise.delay(v2 * p1.Speed):andThen(function() -- Line: 744 -- upvalues: u27 (upval), u16 (upval), u836 (upval), u8 (upval), u12 (upval)
                u27.current = false
                u16:spring(1, u836)
                u8:spring(0, u836)
                u12:spring(1, u836)
            end)
        end
        u8:immediate(0)
        u12:immediate(1)
        u16:immediate(1)
        return Promise.resolve()
    end, {p1.Enabled, p1.BlockedHidden, p1.Depth, p1.Speed})
    useAsyncEffect(function() -- Line: 780 -- upvalues: u31 (val), p1 (val), u20 (val), Sounds (upval), Universal (upval), Signals (upval), u835 (upval), Promise (upval), u836 (upval)
        u31.current = p1.IsUnlocked
        if not p1.IsUnlocked or u31.current or not p1.Enabled or p1.BlockedHidden then
            return Promise.resolve()
        end
        u20:immediate(1)
        Sounds.playGlobalSoundEffect(Universal.Proficiency, 0.1, 1.35)
        Sounds.playGlobalSoundEffect(Universal.LevelUp, 0.1, 0.5)
        Signals.Monologue:Fire((("Ymir, you have given me a proficiency in %*."):format(p1.Node.Name)))
        task.delay(0.2, function() -- Line: 795 -- upvalues: Signals (upval)
            Signals.Monologue:Fire("I will repay you, O'Lady, one day, or to the grave.")
        end)
        local u54 = u835("proficiency", 20, "subtract", 5, TweenInfo.new(0.2))
        task.delay(0.2, function() -- Line: 800 -- upvalues: u54 (val)
            u54(TweenInfo.new(2, Enum.EasingStyle.Back))
        end)
        return Promise.delay(0.06):andThen(function() -- Line: 804 -- upvalues: u20 (upval), u836 (upval)
            u20:spring(0, u836)
        end)
    end, {p1.IsUnlocked, p1.Enabled, p1.BlockedHidden})
    Enabled = p1.Enabled
    if Enabled then
        Enabled = not p1.BlockedHidden
    end
    local createElement = react.createElement
    local v6 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(p1.Position.X, p1.Position.Y),
        Size = v2:map(function(p1) -- Line: 817 -- upvalues: u2 (val)
            local v1 = u2(p1)
            return UDim2.fromOffset(v1, u2(p1))
        end),
        ZIndex = p1.ZIndex or 2,
        Active = Enabled,
    }
    local v7 = {}
    local createElement_2 = react.createElement
    local v8 = {
        BackgroundColor3 = v5:map(function(p1) -- Line: 825 -- upvalues: Color (upval), u4 (val)
            return Color.Brighten(u4.PageBackground, p1 * 0.2 + 0.02)
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = v3,
        Active = Enabled,
    }
    if not Enabled then
        v1 = nil
    else
        function v1(...) -- Line: 834 -- upvalues: p1 (val), getEnchantmentCountForNode (upval), u22 (val)
            local v1
            local Blocks = p1.Node.Blocks
            if Blocks and 0 < #Blocks then
                p1.SetBlockerHover(p1.Node.Name, true)
            end
            local v2 = p1.Node.Name or "Skill"
            local v3 = p1.Node.Price or 1
            if v3 ~= 1 then
                v1 = "s"
            else
                v1 = ""
            end
            v2 = v2 .. ("  <font transparency=\"0.5\">%* Point%*</font>"):format(p1.Node.Price or 1, v1)
            local v4 = getEnchantmentCountForNode(p1.ProficiencyName, p1.Node.Name)
            local v5 = p1.Node.Description or "Unknown description..."
            if 0 < v4 then
                local v6
                if v4 ~= 1 then
                    v6 = "s"
                else
                    v6 = ""
                end
                v5 = v5 .. ("\n\n<font transparency=\"0.65\" size=\"14\">Unlocks %* Enchantment%*.</font>"):format(v4, v6)
            end
            u22(v2, v5, ...)
        end
    end
    v8[react.Event.MouseEnter] = v1
    if not Enabled then
        v1 = nil
    else
        function v1() -- Line: 861 -- upvalues: p1 (val), u23 (val)
            local Blocks = p1.Node.Blocks
            if Blocks and 0 < #Blocks then
                p1.SetBlockerHover(p1.Node.Name, false)
            end
            u23()
        end
    end
    v8[react.Event.MouseLeave] = v1
    local InputBegan = react.Event.InputBegan
    if not Enabled then
        if not p1.IsUnlocked then
            v1 = nil
        else
            function v1(a1, p2) -- Line: 881 -- upvalues: p1 (val)
                if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end
                p1.OnClickedProficiency(p1.Node.Name)
            end
        end
    elseif p1.IsUnlocked then
        if not p1.IsUnlocked then
            v1 = nil
        else
            function v1(a1, p2) -- Line: 881 -- upvalues: p1 (val)
                if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end
                p1.OnClickedProficiency(p1.Node.Name)
            end
        end
    elseif p1.CanRequestUnlock then
        function v1(a1, p2) -- Line: 874 -- upvalues: p1 (val)
            if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            p1.OnRequestUnlock(p1.Node.Name)
        end
    elseif not p1.IsUnlocked then
        v1 = nil
    else
        function v1(a1, p2) -- Line: 881 -- upvalues: p1 (val)
            if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            p1.OnClickedProficiency(p1.Node.Name)
        end
    end
    v8[InputBegan] = v1
    v7.Node = createElement_2(Frame, v8, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Label = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Node.Label or "?",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v3:map(function(a1) -- Line: 901 -- upvalues: p1 (val)
            local v1 = math.clamp((a1 - 0.1) / 0.9, 0, 1) * 0.7 + 0.3
            if p1.IsUnlocked then
                return v1
            end
            local v2 = 1 - (1 - v1) * 0.2
            return (math.clamp(v2, 0, 1))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6),
    }), Stroke = react.createElement("UIStroke", {Color = Color.Brighten(u4.PageBackground, 0.3), Transparency = v3:map(function(p1) -- Line: 918
        return math.clamp((p1 - 0.1) / 0.9, 0, 1) * 0.15000000000000002 + 0.85
    end), Thickness = v5:map(function(p1) -- Line: 921
        return p1 * 0.9 + 1
    end), BorderOffset = UDim.new(0.1, 0)})})
    v7.Shadow = react.createElement(Shadow, {
        Blur = 0.7,
        Position = 0,
        Size = 1,
        ZIndex = -1,
        Color = Color3.fromRGB(0, 0, 0),
        Transparency = v4,
    })
    return createElement(Frame, v6, v7)
end
local function ProficencySkillTree(p1) -- Line: 944 -- upvalues: useDebounceState (val), useTheme (val), react (val), useDebounceCallback (val), computeHiddenByBlockers (val), computeDepthByName (val), Color (val), ProficiencySkillEdge (val), hasUnlockedConnectionOrRoot (val), isUnlockExemptFromEntireTreeRequirement (val), isEntireTreeUnlocked (val), ClientEnchantmentsHandler (val), ProficencySkillNode (val), Frame (val)
    local u14, u15, u7, u8, v1, v2
    local v3 = Vector2.new(0, 0)
    local v4 = {wait = 0.5, leading = true}
    u7, u8 = useDebounceState(v3, v4)
    local u10 = useTheme()
    u14, u15 = react.useState("")
    local v5 = {wait = 0.045, leading = true, trailing = true}
    local v6 = useDebounceCallback(function(p1) -- Line: 950 -- upvalues: u15 (val)
        u15(p1)
    end, v5)
    local u23 = react.useRef(v6)
    u23.current = v6
    local u28 = react.useCallback(function(p1, p2) -- Line: 961 -- upvalues: u23 (val), u15 (val)
        local current = u23.current
        if p2 then
            current.run(p1)
            return
        end
        current.cancel()
        u15("")
    end, {})
    v2 = react.useMemo(function() -- Line: 972 -- upvalues: p1 (val), computeHiddenByBlockers (upval), u14 (val), computeDepthByName (upval), Color (upval), u10 (val), u7 (val), react (upval), ProficiencySkillEdge (upval), hasUnlockedConnectionOrRoot (upval), isUnlockExemptFromEntireTreeRequirement (upval), isEntireTreeUnlocked (upval), ClientEnchantmentsHandler (upval), ProficencySkillNode (upval), u28 (val)
        local Enchantment, Unlocks, createElement, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
        local v16 = {}
        local v17 = {}
        local Contents = p1.Contents
        local v18 = nil
        local v19 = nil
        for i, j in Contents, v18, v19 do
            v17[j.Name] = j
        end
        local v20 = computeHiddenByBlockers(p1.Contents, u14)
        v18 = computeDepthByName(p1.Contents)
        v19 = Color.Brighten(u10.PageBackground, 0.3)
        local v21 = Color3.fromRGB(255, 255, 255)
        local v22 = 1
        local v23 = v20
        local v24 = nil
        local v25 = nil
        for k, n in v23, v24, v25 do
            if n then
                v22 = math.max(v22, v18[k] or 1)
            end
        end
        local Contents_2 = p1.Contents
        v24 = nil
        v25 = nil
        for m, i5 in Contents_2, v24, v25 do
            v1 = v18[i5.Name] or 1
            Unlocks = i5.Unlocks
            v3 = nil
            v4 = nil
            for i6, i7 in Unlocks, v3, v4 do
                v6 = v17[i7]
                if v6 and 1 < u7.X and 1 < u7.Y then
                    v7 = i5.Position.X * u7.X
                    v8 = i5.Position.Y * u7.Y
                    v9 = v6.Position.X * u7.X - v7
                    v10 = v6.Position.Y * u7.Y - v8
                    v11 = math.sqrt(v9 * v9 + v10 * v10)
                    if 1 <= v11 then
                        v12 = v20[i5.Name]
                        if not v12 then
                            v12 = v20[i7]
                        end
                        v13 = "Line_" .. i5.Name .. "_" .. i7
                        createElement = react.createElement
                        v14 = {Speed = 0.15, ParentPixel = Vector2.new(v7, v8), Delta = Vector2.new(v9, v10), Length = v11}
                        if not v6.Unlocked then
                            v15 = v19
                        elseif i5.Unlocked then
                            v15 = v21
                        end
                        v14.LineColor = v15
                        if not v6.Unlocked then
                            v15 = 0.8
                        else
                            v15 = 0.7
                        end
                        v14.LineTransparency = v15
                        v14.ChildUnlocked = v6.Unlocked
                        v14.ParentUnlocked = i5.Unlocked
                        v14.ParentDepth = v1
                        v14.ChildDepth = v18[i7] or 1
                        v14.Enabled = p1.Enabled
                        v14.BlockedHidden = v12
                        v14.MaxDepth = v22
                        v16[v13] = createElement(ProficiencySkillEdge, v14)
                    end
                end
            end
        end
        local Contents_3 = p1.Contents
        v24 = nil
        v25 = nil
        for i8, i9 in Contents_3, v24, v25 do
            v1 = i9.Price or 1
            v2 = hasUnlockedConnectionOrRoot(p1.Contents, i9.Name)
            v3 = i9.RequiresEntireTree == true
            v4 = not v3
            if not v4 then
                v4 = isUnlockExemptFromEntireTreeRequirement(p1.Contents, i9.Name)
                if not v4 then
                    v4 = isEntireTreeUnlocked(p1.Contents, i9.Name, i9.Unlocks, i9.Except)
                end
            end
            Enchantment = i9.Enchantment
            v5 = not Enchantment
            if not v5 then
                v5 = if Enchantment ~= "" then ClientEnchantmentsHandler.hasEnchantment(Enchantment) else true
            end
            if not v3 then
                if v3 then
                    v6 = v4
                elseif not Enchantment then
                    v6 = true
                elseif Enchantment ~= "" then
                    v6 = v5
                end
            elseif Enchantment and Enchantment ~= "" then
                v6 = v5 or v4
            end
            v7 = not i9.Unlocked
            if v7 then
                v7 = not v20[i9.Name]
                if v7 then
                    v7 = v2
                    if v7 then
                        v7 = v6
                        if v7 then
                            v7 = v1 <= p1.AvailablePoints
                        end
                    end
                end
            end
            v16[i9.Name] = react.createElement(ProficencySkillNode, {
                ZIndex = 2,
                Speed = 0.15,
                Node = i9,
                Position = i9.Position,
                ProficiencyName = p1.ProficiencyName,
                Enabled = p1.Enabled,
                Depth = v18[i9.Name] or 1,
                BlockedHidden = v20[i9.Name],
                MaxDepth = v22,
                SetBlockerHover = u28,
                OnRequestUnlock = p1.OnRequestUnlock,
                OnClickedProficiency = p1.OnClickedProficiency,
                CanRequestUnlock = v7,
                IsUnlocked = i9.Unlocked,
            })
        end
        return v16
    end, {
        p1.Contents,
        u7,
        u10,
        p1.Enabled,
        p1.ProficiencyName,
        u14,
        u28,
        p1.OnClickedProficiency,
    })
    v1 = {Size = UDim2.fromScale(1, 0.75)}
    v1[react.Change.AbsoluteSize] = function(p1) -- Line: 1096 -- upvalues: u8 (val)
        u8(p1.AbsoluteSize)
    end
    return react.createElement(Frame, v1, v2)
end
local function ProficiencySelection(p1) -- Line: 1107 -- upvalues: useTheme (val), useRem (val), react (val), useAlertPopup (val), Proficiencies (val), Proficiencies_2 (val), Frame (val), Label (val)
    local u10, u9, v1, v2, v3, v4, v5, v6
    local v7 = {}
    local v8 = useTheme()
    local v9 = useRem()
    u9, u10 = react.useBinding("")
    local u13 = useAlertPopup(function(p1) -- Line: 1116 -- upvalues: u9 (val), Proficiencies (upval)
        if not p1 or u9:getValue() == "" then
            return
        end
        Proficiencies.Primary.post({name = u9:getValue()})
    end)
    local CORE_PROFICIENCIES = Proficiencies_2.Constants.CORE_PROFICIENCIES
    local v10 = nil
    local v11 = nil
    for i, j in CORE_PROFICIENCIES, v10, v11 do
        v1 = {BackgroundTransparency = 0, BackgroundColor3 = v8.PageBackground}
        v3 = UDim2.fromScale(1, 0)
        v1.Size = v3 + UDim2.fromOffset(0, v9(120))
        v2 = {Stroke = react.createElement("UIStroke", {Transparency = 0.5, Thickness = 1, Color = v8.Stroke}), Corner = react.createElement("UICorner")}
        v4 = {BackgroundTransparency = 1, ImageTransparency = 0.3, Image = Proficiencies_2.Constants.PROFICIENCY_ICONS[j], AnchorPoint = Vector2.new(0, 0.5)}
        v5 = UDim2.fromScale(0, 0.5)
        v6 = v9(30)
        v4.Position = v5 + UDim2.fromOffset(v6, 0)
        v5 = v9(50)
        v4.Size = UDim2.fromOffset(v5, v9(50))
        v2.Icon = react.createElement("ImageLabel", v4)
        v4 = {TextTransparency = 1, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
        v4[react.Event.MouseButton1Click] = function() -- Line: 1154 -- upvalues: u10 (val), j (val), u13 (val)
            u10(j)
            local v1 = ("%* Proficiency"):format(j)
            local v2 = ("Upon confirming this action, you will become proficient in the %* proficiency. You will not be able to change this choice later."):format(j)
            u13(v1, v2, Color3.fromRGB(255, 0, 0))
        end
        v2.Button = react.createElement("TextButton", v4)
        v4 = {TextScaled = true, TextTransparency = 0.3, Text = j}
        v5 = UDim2.fromScale(0.5, 0)
        v4.Size = v5 + UDim2.fromOffset(0, v9(22))
        v5 = UDim2.fromScale(0, 0.5)
        v6 = v9(100)
        v4.Position = v5 + UDim2.fromOffset(v6, -v9(15))
        v4.AnchorPoint = Vector2.new(0, 0.5)
        v4.TextXAlignment = Enum.TextXAlignment.Left
        v4.Font = Enum.Font.SourceSansBold
        v2.Header = react.createElement(Label, v4)
        v4 = {TextScaled = true, TextTransparency = 0.5, Text = Proficiencies_2.Constants.PROFICIENCY_DESCRIPTIONS[j]}
        v5 = UDim2.fromScale(0.5, 0)
        v4.Size = v5 + UDim2.fromOffset(0, v9(15))
        v5 = UDim2.fromScale(0, 0.5)
        v6 = v9(120)
        v4.Position = v5 + UDim2.fromOffset(v6, v9(10))
        v4.AnchorPoint = Vector2.new(0, 0.5)
        v4.TextXAlignment = Enum.TextXAlignment.Left
        v4.Font = Enum.Font.SourceSans
        v2.Body = react.createElement(Label, v4)
        v4 = {Image = "rbxassetid://11422155687", BackgroundTransparency = 1, ImageTransparency = 0.5, AnchorPoint = Vector2.new(0, 0.5)}
        v5 = v9(15)
        v4.Size = UDim2.fromOffset(v5, v9(15))
        v5 = UDim2.fromScale(0, 0.5)
        v6 = v9(100)
        v4.Position = v5 + UDim2.fromOffset(v6, v9(10))
        v2.Info = react.createElement("ImageLabel", v4)
        v4 = {Image = "rbxassetid://11422142913", BackgroundTransparency = 1, ImageTransparency = 0.7, AnchorPoint = Vector2.new(1, 0.5)}
        v5 = UDim2.fromScale(1, 0.5)
        v6 = -v9(30)
        v4.Position = v5 + UDim2.fromOffset(v6, 0)
        v5 = v9(30)
        v4.Size = UDim2.fromOffset(v5, v9(30))
        v2.Arrow = react.createElement("ImageLabel", v4)
        v7[j] = react.createElement(Frame, v1, v2)
    end
    return react.createElement(react.Fragment, {}, v7)
end
return function(p1) -- Line: 1217 -- upvalues: usePopup (val), useToast (val), useStore (val), Proficiencies (val), react (val), Proficiencies_2 (val), Tablet (val), ProficiencyPagePopup (val), hasUnlockedConnectionOrRoot (val), isUnlockExemptFromEntireTreeRequirement (val), isEntireTreeUnlocked (val), ClientEnchantmentsHandler (val), Frame (val), VerticalListLayout (val), ProficiencySelection (val), TabLayout (val), ProficencySkillTree (val), Progress (val)
    local u217, u218, u22, u221, u226, v1, v2, v3, v4, v5, v6
    u217, u218, v6 = usePopup()
    local u220 = useToast()
    local u11 = useStore(Proficiencies.Store, function(p1) -- Line: 1222
        return p1
    end)
    local u17 = react.useMemo(function() -- Line: 1227 -- upvalues: u11 (val)
        local v1 = {}
        if not u11 then
            return v1
        end
        local v2 = u11
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, j.name)
        end
        return v1
    end, {u11})
    u221, u22 = react.useState(u17[1])
    local v7 = {}
    react.useEffect(function() -- Line: 1244 -- upvalues: u17 (val), u221 (val), u22 (val)
        if #u17 == 0 then
            return
        end
        local v1 = table.find(u17, u221) ~= nil
        if not v1 then
            u22(u17[1] or "Medic")
        end
    end, {u17, u221})
    local v8 = react.useMemo(function() -- Line: 1255 -- upvalues: Proficiencies_2 (upval), u17 (val)
        local v1 = Proficiencies_2.Constants.CORE_PROFICIENCIES
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if table.find(u17, j) ~= nil then
                return true
            end
        end
        return false
    end, {u17})
    local u223 = react.useMemo(function() -- Line: 1267 -- upvalues: u11 (val), u221 (val)
        local v1
        if not u11 or u221 == nil or u221 == "" then
            return nil
        end
        local v2 = u11
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1 = string.lower(j.name)
            if v1 == string.lower(u221) then
                return j
            end
        end
        return nil
    end, {u11, u221})
    v2, v3, u226 = react.useMemo(function() -- Line: 1282 -- upvalues: u223 (val), Proficiencies_2 (upval)
        if not u223 then
            return 1, 0, 0
        end
        local v1 = Proficiencies_2.getProficiencyXpRequired(u223.name, u223.level)
        local v2 = math.max(v1, 1)
        local v3 = math.max(u223.experience, 0)
        return v2, v3, (math.max(u223.points, 0))
    end, {u223})
    v1 = p1
    for i, v in ipairs(u17) do
        v4 = {Text = v}
        v5 = u221 == v
        v4.Selected = v5
        function v4.Clicked(...) -- Line: 1299 -- upvalues: u22 (val), v (val)
            u22(v)
        end
        v7[v] = react.createElement(Tablet, v4)
    end
    local u72 = react.useMemo(function() -- Line: 1305 -- upvalues: u221 (val), Proficiencies_2 (upval), u223 (val)
        local v1, v2
        if u221 == nil or u221 == "" then
            return {}
        end
        local v3 = Proficiencies_2.getProficiencyTree(u221)
        if not u223 then
            return v3
        end
        local v4 = {}
        local unlocked = u223.unlocked
        local v5 = nil
        local v6 = nil
        for i, j in unlocked, v5, v6 do
            v4[j] = true
        end
        local v7 = {}
        v5 = v3
        v6 = nil
        local v8 = nil
        for k, n in v5, v6, v8 do
            v1 = {Name = n.Name, Description = n.Description, Label = n.Label}
            v2 = v4[n.Name] == true
            v1.Unlocked = v2
            v1.Unlocks = n.Unlocks
            v1.Position = n.Position
            v1.Price = n.Price
            v1.Blocks = n.Blocks
            v1.RequiresEntireTree = n.RequiresEntireTree
            v1.Except = n.Except
            v1.Enchantment = n.Enchantment
            table.insert(v7, v1)
        end
        return v7
    end, {u221, u223})
    local v9 = react.useCallback(function(p1) -- Line: 1341 -- upvalues: u223 (val), u72 (val), u217 (val), react (upval), ProficiencyPagePopup (upval), u218 (val)
        if not u223 then
            return
        end
        local v1 = nil
        local v2 = u72
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if j.Name == p1 then
                v1 = j
                break
            end
        end
        if not v1 then
            return
        end
        v3 = {}
        v3["Proficiency_" .. p1] = react.createElement(ProficiencyPagePopup, {
            key = p1,
            ProficiencyName = u223.name,
            BaseProficiency = u223,
            SelectedProficiency = v1,
            closePopup = u218,
        })
        u217(v3, {color = Color3.fromRGB(102, 196, 255)})
    end, {u223, u72, u217, u218})
    local v10 = react.useCallback(function(p1) -- Line: 1372 -- upvalues: u221 (val), u72 (val), u226 (val), hasUnlockedConnectionOrRoot (upval), isUnlockExemptFromEntireTreeRequirement (upval), isEntireTreeUnlocked (upval), ClientEnchantmentsHandler (upval), u220 (val), Proficiencies (upval)
        if not u221 or u221 == "" then
            return
        end
        local v1 = nil
        local v2 = u72
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if j.Name == p1 then
                v1 = j
                break
            end
        end
        if not v1 or v1.Unlocked then
            return
        end
        v2 = v1.Price or 1
        if u226 < v2 or not (hasUnlockedConnectionOrRoot(u72, p1)) then
            return
        end
        local Enchantment = v1.Enchantment
        v4 = v1.RequiresEntireTree == true
        local v5 = not v4
        if not v5 then
            v5 = isUnlockExemptFromEntireTreeRequirement(u72, p1)
            if not v5 then
                v5 = isEntireTreeUnlocked(u72, p1, v1.Unlocks, v1.Except)
            end
        end
        if not Enchantment or Enchantment == "" then
            if v4 then
                if not v5 then
                    u220({message = "All other nodes must be unlocked first.", type = "error"})
                    return
                end
                Proficiencies.Unlock.post(u221, p1)
                return
            end
            Proficiencies.Unlock.post(u221, p1)
            return
        end
        local v6 = ClientEnchantmentsHandler.hasEnchantment(Enchantment)
        if not v4 then
            if not v6 then
                u220({type = "error", message = ("You need the %* enchantment to unlock this node."):format(Enchantment)})
                return
            end
            Proficiencies.Unlock.post(u221, p1)
            return
        end
        if v6 then
            Proficiencies.Unlock.post(u221, p1)
            return
        end
        if not v5 then
            u220({message = "Requires all enchantment nodes to be unlocked, or a maxed skill tree.", type = "error"})
            return
        end
        Proficiencies.Unlock.post(u221, p1)
    end, {u221, u72, u226, u220})
    local createElement = react.createElement
    local v11 = {Visible = v1.Enabled}
    local v12 = {ProficiencyPopup = v6, Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    if v8 then
        local v13 = {Tabs = react.createElement(TabLayout, {Subtabs = true}, v7), Tree = react.createElement(ProficencySkillTree, {
            Enabled = v1.Enabled,
            Contents = u72,
            AvailablePoints = u226,
            ProficiencyName = u221 or "",
            OnRequestUnlock = v10,
            OnClickedProficiency = v9,
        }), Spacer = react.createElement(Frame, {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromScale(1, 0.05)})}
        local v14 = u221
        if v14 then
            v14 = if u221 ~= "" then react.createElement(Progress, {
    Animated = true,
    Header = ("%* Experience"):format(u221),
    Body = ("You have %* points to spend on your %* proficiencies."):format(u226, (string.lower(u221))),
    Value = v3 / v2,
    Range = {Min = 0, Max = 1},
    Enabled = v1.Enabled,
    Native = {BackgroundTransparency = 1, LayoutOrder = 3},
}) else false
        end
        v13.Progress = v14
        v4 = react.createElement(react.Fragment, {}, v13)
    else
        v4 = react.createElement(ProficiencySelection, {}, {})
    end
    v12.Selection = v4
    return createElement(Frame, v11, v12)
end