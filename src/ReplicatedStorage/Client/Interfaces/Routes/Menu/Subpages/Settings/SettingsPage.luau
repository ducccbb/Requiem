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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Settings.SettingsPage
--                               Dumped in 0.00341 seconds
--                          Bytecode version 9  |  15 functions

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
local Settings = require(Namespaces:WaitForChild("Settings"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Settings"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useMenuPage = require(Hooks:WaitForChild("useMenuPage"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Providers = Interfaces_4:WaitForChild("Providers")
local SettingProvider = require(Providers:WaitForChild("SettingProvider"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components = Interfaces_5:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Content = require(Primitives:WaitForChild("Content"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_2 = Interfaces_6:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_3 = Interfaces_7:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_4 = Interfaces_8:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_5 = Interfaces_9:WaitForChild("Components")
local Menu = Components_5:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_6 = Interfaces_10:WaitForChild("Components")
local Menu_2 = Components_6:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_7 = Interfaces_11:WaitForChild("Components")
local Menu_3 = Components_7:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_8 = Interfaces_12:WaitForChild("Components")
local Universal = Components_8:WaitForChild("Universal")
local Accordion = require(Universal:WaitForChild("Accordion"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Components_9 = Interfaces_13:WaitForChild("Components")
local Universal_2 = Components_9:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Components_10 = Interfaces_14:WaitForChild("Components")
local Universal_3 = Components_10:WaitForChild("Universal")
local Keybind = require(Universal_3:WaitForChild("Keybind"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Components_11 = Interfaces_15:WaitForChild("Components")
local Editor = Components_11:WaitForChild("Editor")
local Universal_4 = Editor:WaitForChild("Universal")
local Search = require(Universal_4:WaitForChild("Search"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Components_12 = Interfaces_16:WaitForChild("Components")
local Universal_5 = Components_12:WaitForChild("Universal")
local Switch = require(Universal_5:WaitForChild("Switch"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_17 = Client_17:WaitForChild("Interfaces")
local Components_13 = Interfaces_17:WaitForChild("Components")
local Universal_6 = Components_13:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_6:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_18 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_18 = Client_18:WaitForChild("Interfaces")
local Components_14 = Interfaces_18:WaitForChild("Components")
local Inputs = Components_14:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs:WaitForChild("NumberSliderInput"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_19 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_19 = Client_19:WaitForChild("Interfaces")
local Components_15 = Interfaces_19:WaitForChild("Components")
local Inputs_2 = Components_15:WaitForChild("Inputs")
local DropdownInput = require(Inputs_2:WaitForChild("DropdownInput"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_20 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_20 = Client_20:WaitForChild("Interfaces")
local Components_16 = Interfaces_20:WaitForChild("Components")
local Inputs_3 = Components_16:WaitForChild("Inputs")
local TextInput = require(Inputs_3:WaitForChild("TextInput"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_21 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_21 = Client_21:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_21:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local function settingMatchesQuery(p1, p2) -- Line: 46
    if p2 == "" then
        return true
    end
    local item = p1.item
    local v1 = true
    local v2 = string.lower(item.Name)
    if string.find(v2, p2, 1, true) == nil then
        v1 = true
        v2 = string.lower(item.Description)
        if string.find(v2, p2, 1, true) == nil then
            v1 = true
            v2 = string.lower(p1.category)
            if string.find(v2, p2, 1, true) == nil then
                v2 = string.lower(p1.subcategory)
                v1 = string.find(v2, p2, 1, true) ~= nil
            end
        end
    end
    return v1
end
local function collectSettings(p1) -- Line: 56
    local v1 = {}
    for k, v in pairs(p1) do
        for k2, i in pairs(v) do
            for k3, j in pairs(i) do
                table.insert(v1, {category = k, subcategory = k2, item = j})
            end
        end
    end
    table.sort(v1, function(p1, p2) -- Line: 69
        local v1
        if p1.category ~= p2.category then
            v1 = p1.category < p2.category
            return v1
        end
        if p1.subcategory ~= p2.subcategory then
            v1 = p1.subcategory < p2.subcategory
            return v1
        end
        v1 = p1.item.Name < p2.item.Name
        return v1
    end)
    return v1
end
local function getDropdownSelection(p1) -- Line: 84
    local Options = p1.Metadata.Options
    if not Options then
        return nil
    end
    local v1 = Options[p1.Value]
    if not v1 then
        v1 = Options[1]
    end
    return v1
end
local function createSettingElement(p1, p2, p3, p4, p5) -- Line: 92 -- upvalues: react (val), NumberSliderInput (val), Settings (val), Form (val), HeaderBodyComponent (val), TextInput (val), Switch (val), DropdownInput (val), getDropdownSelection (val), Keybind (val)
    local v1
    local v2 = if p4 and p4.forListLayout then {AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0), LayoutOrder = p4.layoutOrder} else nil
    if p1.Metadata.Type == "Slider" then
        local Min = p1.Metadata.Min
        local Max = p1.Metadata.Max
        local u25 = Max - Min
        if 0 >= u25 then
            v1 = 0
        else
            v1 = math.clamp((p1.Value - Min) / u25, 0, 1)
        end
        return react.createElement(NumberSliderInput, {
            Initial = v1,
            Header = p1.Name,
            Body = p1.Description,
            Maximum = Max,
            Minimum = Min,
            Native = v2,
            Update = function(a1) -- Line: 118 -- upvalues: u25 (val), Min (val), Max (val), p1 (val), p2 (val), Settings (upval)
                local v1 = math.clamp(a1 * u25 + Min, Min, Max)
                p1.Value = v1
                if p2 then
                    p2.update()
                end
                if v1 == p1.Value then
                    return
                end
                Settings.Update.post({unique = p1.Unique, value = v1})
            end,
        })
    end
    if p1.Metadata.Type == "Number" then
        return react.createElement(Form.Form, {Native = v2}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = p1.Name, Body = p1.Description, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {TextInput = react.createElement(TextInput, {
            Placeholder = "Enter an asset ID...",
            Changed = function(a1) -- Line: 154 -- upvalues: p3 (val), Settings (upval), p1 (val)
                if not a1 then
                    return p3({message = "Invalid asset ID, ensure it's a number.", type = "error"})
                end
                local v1 = tonumber(a1)
                if not v1 then
                    return p3({message = "Invalid asset ID, ensure it's a number.", type = "error"})
                end
                Settings.Update.post({unique = p1.Unique, value = v1})
            end,
            Native = {BackgroundTransparency = 1},
        })})})
    end
    if p1.Metadata.Type == "Boolean" then
        v1 = {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = p1.Name, Body = p1.Description, Position = UDim2.fromScale(0.5, 0.5)})})}
        local v3 = {}
        local v4 = {}
        local v5 = p1.Value == 1
        v4.Default = v5
        function v4.Toggled(a1) -- Line: 199 -- upvalues: p1 (val), p2 (val), Settings (upval)
            local v1
            if not a1 then
                v1 = 0
            else
                v1 = 1
            end
            p1.Value = v1
            if p2 then
                p2.update()
            end
            if v1 == p1.Value then
                return
            end
            Settings.Update.post({unique = p1.Unique, value = v1})
        end
        v3.Switch = react.createElement(Switch, v4)
        v1.Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, v3)
        return react.createElement(Form.Form, {Native = v2}, v1)
    end
    if p1.Metadata.Type == "Dropdown" then
        return react.createElement(DropdownInput, {
            Visible = true,
            Header = p1.Name,
            Body = p1.Description,
            Default = getDropdownSelection(p1),
            Native = v2,
            Options = p1.Metadata.Options,
            Selected = function(a1) -- Line: 225 -- upvalues: p1 (val), p5 (val), p2 (val), Settings (upval)
                local v1 = table.find(p1.Metadata.Options, a1)
                if not v1 then
                    return
                end
                p1.Value = v1
                if p1.Name == "Theme" and p5 then
                    p5(a1)
                end
                if p2 then
                    p2.update()
                end
                if v1 == p1.Value then
                    return
                end
                Settings.Update.post({unique = p1.Unique, value = v1})
            end,
        })
    end
    if p1.Metadata.Type ~= "Keybind" then
        return nil
    end
    local v6 = {}
    v1 = v2
    if not v1 then
        v1 = {LayoutOrder = p1.Unique}
    end
    v6.Native = v1
    return react.createElement(Form.Form, v6, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Wrap = true, Header = p1.Name, Body = p1.Description, Position = UDim2.fromScale(0.5, 0.5)})}), Right = react.createElement(Form.Divider, {Side = "Right", Padding = "Large"}, {Keybind = react.createElement(Keybind, {
        Default = p1.Value,
        Changed = function(a1) -- Line: 274 -- upvalues: Settings (upval), p1 (val)
            Settings.Update.post({unique = p1.Unique, value = a1.Value})
        end,
    })})})
end
return function(p1) -- Line: 286 -- upvalues: react (val), SettingProvider (val), useMenuPage (val), useRem (val), useToast (val), useTheme (val), collectSettings (val), Tablet (val), settingMatchesQuery (val), createSettingElement (val), Accordion (val), VerticalListLayout (val), TransparencyGroup (val), Content (val), PageLayout (val), TabLayout (val), Search (val), ScrollingFrame (val)
    local Graphics, Graphics_2, settings, u27, u9, v1, v2, v3, v4
    Graphics, Graphics_2 = react.useState("Graphics")
    u9, v4 = react.useState("")
    local u15 = react.useContext(SettingProvider.SettingContext)
    if not u15 then
        settings = {}
    else
        settings = u15.settings
    end
    local Settings = useMenuPage("Settings")
    local v5 = useRem()
    local u24 = useToast()
    _, u27 = useTheme()
    local v6 = react.useMemo(function() -- Line: 295 -- upvalues: collectSettings (upval), settings (val)
        return collectSettings(settings)
    end, {settings})
    local u38 = u9 ~= ""
    local v7 = {
        Graphics,
        settings,
        u15,
        u24,
        u9,
        u38,
        u27,
    }
    local v8 = react.useMemo(function() -- Line: 299 -- upvalues: u9 (val), settings (val), react (upval), Tablet (upval), Graphics (val), Graphics_2 (val), u38 (val), settingMatchesQuery (upval), createSettingElement (upval), u15 (val), u24 (val), u27 (val), Accordion (upval)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = {}
        local v9 = {}
        local v10 = {}
        local v11 = {}
        local v12 = string.lower(u9)
        local v13 = 0
        for k in pairs(settings) do
            table.insert(v11, k)
        end
        table.sort(v11)
        for i, v in ipairs(v11) do
            v1 = {}
            v2 = {Text = v}
            v3 = Graphics == v
            v2.Selected = v3
            v2.LayoutOrder = i
            v3 = i < #v11
            v2.ShowDivider = v3
            function v2.Clicked() -- Line: 318 -- upvalues: Graphics_2 (upval), v (val)
                Graphics_2(v)
            end
            v8[v] = react.createElement(Tablet, v2)
            for k2, i2 in pairs(settings[v]) do
                v5 = {}
                for k3, j in pairs(i2) do
                    v6 = {category = v, subcategory = k2, item = j}
                    if u38 and settingMatchesQuery(v6, v12) then
                        v13 = v13 + 1
                        v7 = tostring(j.Unique)
                        v10[v7] = react.createElement("Frame", {
                            BackgroundTransparency = 1,
                            AnchorPoint = Vector2.new(0, 0),
                            Position = UDim2.fromScale(0, 0),
                            Size = UDim2.new(1, 0, 0, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            LayoutOrder = v13,
                        }, {Setting = createSettingElement(j, u15, u24, {forListLayout = true}, u27)})
                    end
                    v5[j.Name] = createSettingElement(j, u15, u24, nil, u27)
                end
                v1[k2] = react.createElement(Accordion.AccordionItem, {Header = k2}, v5)
            end
            v2 = {}
            v3 = {}
            v4 = not u38
            if v4 then
                v4 = Graphics == v
            end
            v3.Visible = v4
            v2.Native = v3
            v9[v] = react.createElement(Accordion.Accordion, v2, {}, v1)
        end
        return {Tabs = v8, Accordions = v9, SearchResults = v10}
    end, v7)
    local Tabs = v8.Tabs
    v1 = v5(32)
    local v9 = {}
    local v10 = {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}
    v9.Layout = react.createElement(VerticalListLayout, v10)
    if not u38 then
        v2 = v8.Accordions
        v3 = nil
        v10 = nil
        for i, j in v2, v3, v10 do
            v9[i] = j
        end
    else
        v2 = v8.SearchResults
        v3 = nil
        v10 = nil
        for k, n in v2, v3, v10 do
            v9[k] = n
        end
    end
    v10 = {
        Enabled = Settings,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v11 = {}
    local v12 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Tabs = react.createElement(TabLayout, {}, Tabs)}
    local v13 = {BackgroundTransparency = 1}
    local v14 = UDim2.fromScale(1, 1)
    v13.Size = v14 + UDim2.fromOffset(0, -v5(75))
    v14 = UDim2.fromScale(0.5, 0)
    v13.Position = v14 + UDim2.fromOffset(0, v5(75))
    v13.AnchorPoint = Vector2.new(0.5, 0)
    v12.Subpages = react.createElement("Frame", v13, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(6)),
    }), SearchBar = react.createElement(Search, {
        LayoutOrder = 1,
        IsMenu = true,
        Size = UDim2.new(1, 0, 0, v1),
        HeightPx = v1,
        OnQueryChange = v4,
        PlaceholderText = string.format("Search %d settings...", #v6),
    }), Scroll = react.createElement(ScrollingFrame, {LayoutOrder = 2, Size = UDim2.new(1, 0, 1, -(v1 + v5(6))), AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0)}, v9)})
    v11.Content = react.createElement(Content, {}, v12)
    return react.createElement(TransparencyGroup, v10, v11)
end