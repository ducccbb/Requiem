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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.Subpages.VowsPage
--                               Dumped in 0.00267 seconds
--                          Bytecode version 9  |  8 functions

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
local Vows = require(Namespaces:WaitForChild("Vows"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local Vows_3 = Progression:WaitForChild("Vows")
local Vows_2 = require(Vows_3:WaitForChild("Vows"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_3 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Utilities = Components_4:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Menu = Components_5:WaitForChild("Menu")
local Progression_2 = Menu:WaitForChild("Progression")
local Vow = Progression_2:WaitForChild("Vow")
local VowCategory = require(Vow:WaitForChild("VowCategory"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Menu_2 = Components_6:WaitForChild("Menu")
local Progression_3 = Menu_2:WaitForChild("Progression")
local Vow_2 = Progression_3:WaitForChild("Vow")
local VowItem = require(Vow_2:WaitForChild("VowItem"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Menu_3 = Components_7:WaitForChild("Menu")
local PageLayout = require(Menu_3:WaitForChild("PageLayout"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Menu_4 = Components_8:WaitForChild("Menu")
local Tabs = Menu_4:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Menu_5 = Components_9:WaitForChild("Menu")
local Tabs_2 = Menu_5:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local useToast = require(Hooks_4:WaitForChild("useToast"))
local u432 = {
    TOP = {"Noble", "Caregiver", "Illuminator", "Marathoner"},
    BOTTOM = {"Unyielding", "Artificer", "Unyielding", "Preservationist"},
}
return function(p1) -- Line: 53 -- upvalues: useRem (val), useToast (val), useTheme (val), useStore (val), Vows (val), react (val), Vows_2 (val), Tablet (val), u432 (val), VowItem (val), Frame (val), PageLayout (val), Color (val), HorizontalListLayout (val), VerticalListLayout (val), VowCategory (val), TabLayout (val)
    local points, u22, u668, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local v14 = useRem()
    local u796 = useToast()
    local v15 = useTheme()
    local u658 = useStore(Vows.Store, react.useCallback(function(p1) -- Line: 61
        return {categories = p1.categories, points = p1.points}
    end, {}))
    u668, u22 = react.useState(Vows_2.Categories.Fortitude)
    local v16 = {}
    local v17 = {}
    local v18 = Vows_2.Vows[u668]
    local v19 = {}
    local v20 = react.useCallback(function(p1) -- Line: 84 -- upvalues: u22 (val)
        return function() -- Line: 85 -- upvalues: u22 (upval), p1 (val)
            u22(p1)
        end
    end, {})
    local v21 = p1
    for k, v in pairs(Vows_2.Categories) do
        v3 = {Text = "Vow of " .. v}
        v4 = u668 == v
        v3.Selected = v4
        v3.Clicked = v20(v)
        v19[v] = react.createElement(Tablet, v3)
    end
    v1, v2 = react.useMemo(function() -- Line: 98 -- upvalues: u658 (val), u668 (val), u432 (upval)
        local categories, v1
        local v2 = 0
        local v3 = 0
        local v4 = pairs
        if not u658 then
            categories = {}
        else
            categories = u658.categories
        end
        for k, v in v4(categories) do
            v1 = string.lower(k)
            if v1 == string.lower(u668) then
                v1 = 1
                for k2, i in pairs(v) do
                    for k3, j in pairs(i) do
                        if 0 < j then
                            if not (table.find(u432.TOP, k2)) then
                                v2 = v2 + 1
                            else
                                v3 = v3 + 1
                            end
                        end
                    end
                    v1 = v1 + 1
                end
            end
        end
        return v2, v3
    end, {u658, u668})
    local v22 = 0
    local v23 = string.split(u668, " ")
    local v24 = v23[#v23]
    local v25 = react.useCallback(function(p1, p2, p3) -- Line: 135 -- upvalues: u658 (val), u796 (val), Vows (upval)
        return function() -- Line: 136 -- upvalues: u658 (upval), u796 (upval), Vows (upval), p1 (val), p2 (val), p3 (val)
            if u658.points <= 0 then
                u796({message = "You do not have enough vow points to unlock this.", type = "error"})
                return false
            end
            Vows.Upgrade.post({category = p1, subcategory = p2, index = p3})
            return true
        end
    end, {u658.points})
    for k2, i in pairs(v18) do
        v22 = v22 + 1
        v5 = string.split(k2, " ")
        v6 = v5[#v5]
        v7 = 0
        for k3, j in pairs(i) do
            if v22 ~= 1 then
                v9 = "Bottom"
            else
                v9 = "Top"
            end
            v8 = v9 .. tostring(v7)
            v7 = v7 + 1
            if not u658 then
                v9 = -1
            elseif u658.categories and u658.categories[v24] and u658.categories[v24][v6] then
                v9 = u658.categories[v24][v6][k3]
            end
            if v22 ~= 1 then
                v10 = v2
            else
                v10 = v1
            end
            if v22 ~= 1 then
                v11 = v17
            else
                v11 = v16
            end
            v12 = {Label = k2, Descriptions = j, Enabled = v21.Enabled}
            v13 = 4 - v10 < v7
            v12.Blocked = v13
            v12.Level = v9
            v13 = v22 == 1
            v12.IsTopLayer = v13
            v12.Position = v7
            v13 = v9 == 0
            v12.Locked = v13
            v12.Clicked = v25(v24, v6, k3)
            v11[v8] = react.createElement(VowItem, v12)
        end
    end
    local createElement = react.createElement
    v4 = {Visible = v21.Enabled}
    local v26 = {Layout = react.createElement(PageLayout, {Ratio = false})}
    local createElement_2 = react.createElement
    v7 = {}
    local createElement_3 = react.createElement
    local v27 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    v8 = v14(97)
    v27.Position = UDim2.new(0, v8, 0.2, 0)
    v8 = v14(60)
    v27.Size = UDim2.new(0, v8, 0, v14(60))
    v27.BackgroundColor3 = v15.PageBackground
    local Enabled = v21.Enabled
    if Enabled then
        Enabled = u658
        if Enabled then
            Enabled = 0 < u658.points
        end
    end
    v27.Visible = Enabled
    local v28 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), UIStroke = react.createElement("UIStroke", {Thickness = 2, Color = v15.Stroke}), Stroke = react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, 15, 1, 15)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), UIStroke = react.createElement("UIStroke", {Thickness = 2, Color = Color.Brighten(v15.Stroke, 0.075)})})}
    local createElement_4 = react.createElement
    v9 = {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.35,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
    }
    if not u658 then
        points = 0
    else
        points = u658.points
        if not points then
            points = 0
        end
    end
    v9.Text = tostring(points)
    v9.TextColor3 = v15.Primary
    v9.TextYAlignment = Enum.TextYAlignment.Bottom
    v9.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.AutomaticSize = Enum.AutomaticSize.X
    v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v9.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v9.Position = UDim2.fromScale(0.5, 0.5)
    v9.Size = UDim2.fromScale(0.8, 0.8)
    v28.Label = createElement_4("TextLabel", v9)
    v7.Points = createElement_3(Frame, v27, v28)
    v28 = {Layout = react.createElement(HorizontalListLayout, {Spacing = 20, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center})}
    v9 = {LayoutOrder = -1}
    local v29 = v14(202)
    v9.Size = UDim2.new(0, v29, 1, 0)
    v28.Category = react.createElement(Frame, v9, {Layout = react.createElement(VerticalListLayout, {Spacing = 0, VerticalAlignment = Enum.VerticalAlignment.Center, HorizontalAlignment = Enum.HorizontalAlignment.Center}), Category = react.createElement(VowCategory, {Label = u668, Enabled = v21.Enabled})})
    v28.Vows = react.createElement(Frame, {Size = UDim2.new(1, 0, 1, 0)}, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Center, HorizontalAlignment = Enum.HorizontalAlignment.Left}), Top = react.createElement(Frame, {Size = UDim2.new(1, 0, 0.5, 0)}, {Layout = react.createElement(HorizontalListLayout, {Spacing = 30, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center})}, v16), Bottom = react.createElement(Frame, {Size = UDim2.new(1, 0, 0.5, 0)}, {Layout = react.createElement(HorizontalListLayout, {Spacing = 30, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center})}, v17)})
    v7.Container = react.createElement(Frame, {}, v28)
    v26.Vows = createElement_2(Frame, {}, v7)
    v26.Tabs = react.createElement(TabLayout, {LayoutOrder = 2}, v19)
    return createElement(Frame, v4, v26)
end