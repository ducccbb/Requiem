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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Crafting.Crafting
--                               Dumped in 0.00159 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Crafting = Common:WaitForChild("Crafting")
local GridRecipeMatch = require(Crafting:WaitForChild("GridRecipeMatch"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_6:WaitForChild("Utilities")
local Scaler = require(Utilities_2:WaitForChild("Scaler"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_7:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local CraftingPage = require(Subpages:WaitForChild("CraftingPage"))
local CraftingStationView = require(v1.Parent:WaitForChild("CraftingStationView"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local u276 = RunService:IsStudio()
return function() -- Line: 48 -- upvalues: useInterfaceState (val), react (val), Inventory (val), useStore (val), Table (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), CraftingStationView (val), CraftingPage (val), GridRecipeMatch (val), u276 (val), HttpService (val)
    local crafting, crafting_2, u11, u12, u16, u17, u21, u22, u26, u27, v1
    crafting, crafting_2 = useInterfaceState("crafting")
    local v2 = crafting_2
    if not v2 then
        v2 = {visible = false}
    end
    local u7 = v2
    u11, u12 = react.useState(false)
    u16, u17 = react.useState(u7.visible)
    u21, u22 = react.useState(nil)
    local v3 = {}
    u26, u27 = react.useState(v3)
    local v4 = react.useCallback(function(p1, p2) -- Line: 59 -- upvalues: u22 (val), u27 (val)
        u22(p1)
        u27(p2)
    end, {})
    local v5 = {u16}
    react.useEffect(function() -- Line: 66 -- upvalues: u16 (val), u11 (val), Inventory (upval), u12 (val)
        if not u16 or u11 then
            return
        end
        Inventory.Index.post(0)
        u12(true)
    end, v5)
    local u43 = useStore(Inventory.Recipes, function(p1) -- Line: 75
        return p1
    end)
    local v6 = react.useMemo(function() -- Line: 79 -- upvalues: u43 (val), Table (upval)
        if not u43 or not u43.index then
            return
        end
        return {index = Table.filter(u43.index, function(p1) -- Line: 85
            local v1 = p1.type == "Crafting"
            return v1
        end), selected = u43.selected}
    end, {u43})
    react.useEffect(function() -- Line: 92 -- upvalues: u17 (val), u7 (ref)
        u17(u7.visible)
    end, {u7.visible})
    react.useEffect(function() -- Line: 96 -- upvalues: u16 (val), u12 (val)
        if not u16 then
            u12(false)
        end
    end, {u16})
    local createElement = react.createElement
    local v7 = {Page = react.createElement(DynamicPage, {Enabled = u16})}
    local createElement_2 = react.createElement
    local v8 = {
        ZIndex = 3,
        Enabled = u16,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v9 = {}
    local createElement_3 = react.createElement
    local v10 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v11 = {}
    local createElement_4 = react.createElement
    local v12 = {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout, {AlignTop = true, TopMargin = 6})}
    local createElement_5 = react.createElement
    local v13 = {Header = "Crafting Station", Body = "Drag items from your inventory onto the grid to match a recipe, then craft.", Icon = "rbxassetid://12967712847"}
    if u21 then
        v1 = nil
    else
        function v1() -- Line: 132 -- upvalues: u7 (ref), crafting (val), u17 (val)
            u7.visible = false
            crafting(table.clone(u7))
            u17(false)
        end
        if not v1 then
            v1 = nil
        end
    end
    v13.Closed = v1
    v12.Header = createElement_5(PageHeader, v13)
    v13 = {Size = UDim2.fromScale(1, 0.823)}
    v1 = {Station = react.createElement(CraftingStationView, {Enabled = not u21, MenuVisible = u16, Recipes = v6, onCraftRecipe = v4})}
    local v14 = {}
    local v15 = u21 ~= nil
    v14.Enabled = v15
    v14.Recipe = u21
    v14.GridLayout = u26
    function v14.Completed() -- Line: 155 -- upvalues: GridRecipeMatch (upval), u26 (val), u21 (val), u276 (upval), HttpService (upval), Inventory (upval), u22 (val), u27 (val)
        local v1, v2, v3, v4
        local DEFAULT_STATION_GRID_SIZE = GridRecipeMatch.DEFAULT_STATION_GRID_SIZE
        local v5 = {}
        local v6 = DEFAULT_STATION_GRID_SIZE * DEFAULT_STATION_GRID_SIZE
        local v7 = 1
        for i = 1, v6, v7 do
            v2 = u26[i]
            if v2 then
                v3 = tostring(i)
                v5[v3] = {id = v2.id, offset = v2.offset}
            end
        end
        local u107 = {
            item = {u21},
            placements = v5,
        }
        v7 = {}
        local v8 = DEFAULT_STATION_GRID_SIZE * DEFAULT_STATION_GRID_SIZE
        v2 = 1
        for j = 1, v8, v2 do
            v4 = v5[tostring(j)]
            if v4 then
                v1 = tostring(v4.id)
                table.insert(v7, string.format("[%d] id=%s offset=%s", j, v1, (tostring(v4.offset))))
            end
        end
        local tags = u21.tags
        if not tags then
            v2 = "nil"
        else
            v2 = table.concat(tags, ", ")
        end
        if u276 then
            local v9 = "results=" .. tostring(u21.results)
            local v10 = "merge_tags=" .. tostring(u21.merge_tags)
            print("[Craft client → server]", v9, v10, "tags=" .. v2, "placements:", table.concat(v7, " "))
            v3, v4 = pcall(function() -- Line: 190 -- upvalues: HttpService (upval), u107 (val)
                return HttpService:JSONEncode(u107)
            end)
            if v3 then
                print("[Craft client → server] JSON:", v4)
            end
        end
        Inventory.Craft.post(u107)
        u22(nil)
        u27({})
    end
    v1.Crafting = react.createElement(CraftingPage, v14)
    v12.Content = react.createElement(Frame, v13, v1)
    v11.Scaler = createElement_4(Scaler, {
        Enabled = u16,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v12)
    v9.Content = createElement_3("Frame", v10, v11)
    v7[1] = createElement_2(TransparencyGroup, v8, v9)
    return createElement(Frame, {}, v7)
end