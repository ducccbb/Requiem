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
--      File: ReplicatedStorage.Client.User.Equipment.Tools.ClientInventoryHandler
--                               Dumped in 0.00290 seconds
--                          Bytecode version 9  |  29 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Crafting = Common:WaitForChild("Crafting")
local IngredientAliases = require(Crafting:WaitForChild("IngredientAliases"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
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
local Network = require(Common_5:WaitForChild("Network"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Network_2 = Common_6:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local State = u0.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u146 = {}
local u147 = {}
local function getItemNameFromHash(p1) -- Line: 62 -- upvalues: u146 (val)
    for k, v in pairs(u146) do
        if v.hash == p1 then
            return k
        end
    end
end
local function onUnequipHotbarTool(p1) -- Line: 223 -- upvalues: getItemNameFromHash (val), u146 (val), ClientStateHandler (val), States (val)
    local module
    local v1 = getItemNameFromHash(p1)
    if v1 and u146[v1] and u146[v1].module then
        module = require(u146[v1].module)
        if module and module.unequipped then
            module.unequipped()
            ClientStateHandler.updateState(States.TOOL, false)
        end
    end
end
local function onHandHeldToolChanged(p1, p2) -- Line: 241 -- upvalues: onUnequipHotbarTool (val), getItemNameFromHash (val), u146 (val), Inventory (val), Players (val), Table (val), ClientStateHandler (val), States (val)
    local hash, module
    if p1.hash == p2.hash then
        return
    end
    if p1.hash == 0 then
        if p2.hash ~= 0 then
            onUnequipHotbarTool(p2.hash)
        end
        return
    end
    if p1.hash ~= p2.hash then
        onUnequipHotbarTool(p2.hash)
    end
    local v1 = getItemNameFromHash(p1.hash)
    if v1 and u146[v1] and u146[v1].module then
        module = require(u146[v1].module)
        hash = p1.hash
        local offset = p1.offset
        local v2 = Inventory.Store.get(Players.LocalPlayer)
        local v3 = Table.find(v2, function(p1) -- Line: 277 -- upvalues: hash (val)
            local v1 = p1.id == hash
            return v1
        end)
        local v4 = v3
        if v4 then
            v4 = v2[v3]
        end
        if module and module.equipped then
            module.equipped(function(...) -- Line: 272 -- upvalues: Inventory (upval), hash (val), offset (val)
                Inventory.Use.unreliablePost(hash, offset, ...)
            end, v4)
            ClientStateHandler.updateState(States.TOOL, true)
        end
    end
end
local function onInventoryContentsChanged(p1, p2) -- Line: 297 -- upvalues: Table (val), getItemNameFromHash (val), u146 (val)
    local u6, u7, v1, v2
    u6, u7 = Table.diff(p1, p2)
    v1, v2 = pcall(function() -- Line: 302 -- upvalues: u6 (val), getItemNameFromHash (upval), u146 (upval), u7 (val)
        local module, module_2, v1
        for i, v in ipairs(u6) do
            v1 = getItemNameFromHash(v.id)
            if v1 and u146[v1] and u146[v1].module then
                module_2 = require(u146[v1].module)
                if module_2 and module_2.added then
                    module_2.added()
                end
            end
        end
        for i2, i3 in ipairs(u7) do
            v1 = getItemNameFromHash(i3.id)
            if v1 and u146[v1] and u146[v1].module then
                module = require(u146[v1].module)
                if module and module.removed then
                    module.removed()
                end
            end
        end
    end)
    if not v1 then
        warn("Failed to call inventory contents changed", v2)
    end
end
local function getItemModelFromName(p1) -- Line: 340 -- upvalues: ReplicatedStorage (val)
    local Assets = ReplicatedStorage:WaitForChild("Assets")
    local Tools = Assets:WaitForChild("Tools")
    for k, v in pairs(Tools:GetChildren()) do
        for k2, i in pairs(v:GetChildren()) do
            if i.Name == v1 then
                return i
            end
        end
    end
    return nil
end
Network.loaded:andThen(function() -- Line: 530 -- upvalues: Inventory (val), Players (val), onInventoryContentsChanged (val), onHandHeldToolChanged (val), u147 (val)
    local u5 = Inventory.Tool.get(Players.LocalPlayer)
    local u11 = Inventory.Store.get(Players.LocalPlayer)
    if u11 then
        onInventoryContentsChanged(u11, {})
    end
    Inventory.Tool.observe(Players.LocalPlayer, function() -- Line: 538 -- upvalues: Inventory (upval), Players (upval), onHandHeldToolChanged (upval), u5 (ref)
        local v1 = Inventory.Tool.get(Players.LocalPlayer)
        onHandHeldToolChanged(v1, u5)
        u5 = v1
    end)
    Inventory.Store.observe(Players.LocalPlayer, function() -- Line: 545 -- upvalues: Inventory (upval), Players (upval), onInventoryContentsChanged (upval), u11 (ref)
        local v1 = Inventory.Store.get(Players.LocalPlayer)
        onInventoryContentsChanged(v1, u11)
        u11 = v1
    end)
    Inventory.Request.listen(function(p1) -- Line: 553 -- upvalues: u147 (upval)
        if u147[p1.id] then
            u147[p1.id].__resolver(p1.result)
            u147[p1.id] = nil
        end
    end)
end)
;(function() -- Line: 565 -- upvalues: u0 (val), String (val), u146 (val)
    local v1
    for i, v in ipairs(u0.Parent:GetDescendants()) do
        if v:IsA("ModuleScript") and v ~= u0 then
            v1 = String.hashToInt16(v.Name)
            if u146[v1] then
                warn("Collision @", v1, v.Name)
            end
            u146[v.Name] = {module = v, hash = v1}
        end
    end
end)()
local v2 = {
    getItemModel = function(p1) -- Line: 361 -- upvalues: getItemNameFromHash (val), getItemModelFromName (val)
        local v1 = getItemNameFromHash(p1)
        if not v1 then
            return
        end
        return getItemModelFromName(v1)
    end,
    getItemNameFromHash = getItemNameFromHash,
    getItemModelFromName = getItemModelFromName,
}
function v2.getListOfCraftables(p1, p2) -- Line: 99 -- upvalues: getItemNameFromHash (val), IngredientAliases (val)
    local generateCombinations, requirements, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = {}
    local v13 = p1
    for k, v in pairs(p2.index) do
        requirements = v.requirements
        v11 = true
        v1 = {}
        for k2, i in pairs(requirements) do
            v3 = {}
            for k3, j in pairs(v13) do
                v6 = getItemNameFromHash(j.id)
                if v6 then
                    v7 = {}
                    if j.tags then
                        for i2, k4 in ipairs(j.tags) do
                            table.insert(v7, (tostring(k4)))
                        end
                    end
                    v8, v9 = IngredientAliases.recipeMatchIdentity(v6, v7)
                    if v8 == i.item then
                        table.insert(v3, {item = j, tags = v9})
                    end
                end
            end
            if #v3 < i.amount then
                v11 = false
                break
            end
            table.insert(v1, v3)
        end
        if v11 then
            if not v.merge_tags then
                table.insert(v12, v)
            else
                function generateCombinations(p1, p2) -- Line: 143
                    local combine
                    local u2 = {}
                    function combine(a1, a2, p3) -- Line: 149 -- upvalues: p2 (val), u2 (val), p1 (val), combine (val)
                        if p3 == p2 then
                            table.insert(u2, table.clone(a1))
                            return
                        end
                        local v1 = #p1
                        local v2 = 1
                        for i = a2, v1, v2 do
                            a1[p3 + 1] = p1[i]
                            combine(a1, i + 1, p3 + 1)
                        end
                    end
                    combine({}, 1, 0)
                    return u2
                end
                v2 = {{}}
                for i3, n in ipairs(requirements) do
                    v4 = {}
                    v5 = generateCombinations(v1[i3], n.amount)
                    for i4, m in ipairs(v2) do
                        for i5, i52 in ipairs(v5) do
                            v10 = table.clone(m)
                            for i6, i62 in ipairs(i52) do
                                table.insert(v10, i62)
                            end
                            table.insert(v4, v10)
                        end
                    end
                    v2 = v4
                end
                for i7, i72 in ipairs(v2) do
                    v4 = {}
                    for i8, i82 in ipairs(i72) do
                        for i9, i92 in ipairs(i82.tags) do
                            table.insert(v4, (tostring(i92)))
                        end
                    end
                    v4 = IngredientAliases.dedupeTagsOrderPreserving(v4)
                    if v.results == "Ingot" then
                        v5 = table.clone(v)
                        v5.tags = v4
                        table.insert(v12, v5)
                    else
                        v5 = IngredientAliases.distinctMetalCount(v4)
                        if 2 > v5 then
                            v4 = IngredientAliases.stripMetalTags(v4)
                        end
                    end
                end
            end
        end
    end
    return v12
end
function v2.onRenderItemModel(p1, p2) -- Line: 514 -- upvalues: u146 (val)
    local module
    local Name = p2.Name
    if Name and u146[Name] and u146[Name].module then
        module = require(u146[Name].module)
        if module and module.render then
            if p1.Tags then
                p1.tags = p1.Tags
            end
            local v1 = p1
            if not v1 then
                v1 = {tags = {}}
            end
            module.render(v1, p2)
        end
    end
end
function v2.getItemCategoryFromName(p1) -- Line: 390 -- upvalues: u146 (val)
    local category, module
    if not p1 or not (u146[p1]) or not (u146[p1].module) then
        return "Other"
    end
    module = require(u146[p1].module)
    if not module.data then
        category = "Other"
    else
        category = module.data.category
        if not category then
            category = "Other"
        end
    end
    return category
end
function v2.getItemDataFromName(p1) -- Line: 376 -- upvalues: u146 (val)
    if not p1 or not (u146[p1]) then
        return nil
    end
    if u146[p1].module then
        return require(u146[p1].module).data
    end
    return nil
end
function v2.getItemCategoriesInInventory() -- Line: 403 -- upvalues: Inventory (val), Players (val), getItemNameFromHash (val), u146 (val)
    local module, v1
    local v2 = Inventory.Store.get(Players.LocalPlayer)
    if not v2 then
        return {}
    end
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = getItemNameFromHash(j.id)
        if v1 and u146[v1] and u146[v1].module then
            module = require(u146[v1].module)
            if not module then
                if not (table.find(v3, "Other")) then
                    table.insert(v3, "Other")
                end
            elseif module.data and module.data.category and not (table.find(v3, module.data.category)) then
                table.insert(v3, module.data.category)
            end
        end
    end
    return v3
end
function v2.getPlayerInventory() -- Line: 434 -- upvalues: Inventory (val), Players (val)
    local v1 = Inventory.Store.get(Players.LocalPlayer)
    if not v1 then
        v1 = {}
    end
    return v1
end
function v2.getItemCountByNamesFromSnapshot(p1, p2) -- Line: 445 -- upvalues: getItemNameFromHash (val)
    local v1, v2
    local v3 = {}
    local v4 = p2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j] = 0
    end
    v4 = p1
    v5 = nil
    v6 = nil
    for k, n in v4, v5, v6 do
        v1 = getItemNameFromHash(n.id)
        if v1 and v3[v1] ~= nil then
            if n.stack ~= 1 then
                v3[v1] = v3[v1] + 1
            else
                if not (n.meta[1]) then
                    v2 = 1
                elseif typeof(n.meta[1]) == "number" then
                    v2 = n.meta[1]
                end
                v3[v1] = v3[v1] + v2
            end
        end
    end
    return v3
end
function v2.requestItemInformation(p1, p2) -- Line: 473 -- upvalues: Inventory (val), Promise (val), u147 (val)
    local u5 = math.random(1, 5000000)
    Inventory.Request.post({hash = p1.hash, offset = p1.offset, request = p2, id = u5})
    return Promise.new(function(p1, a2) -- Line: 485 -- upvalues: u147 (upval), u5 (val), p2 (val)
        u147[u5] = {request = p2, id = u5, __resolver = p1}
    end)
end
function v2.addItemEquipCooldown(p1) -- Line: 500 -- upvalues: ClientStateHandler (val), States (val)
    ClientStateHandler.updateState(States.NO_ITEM_EQUIPPING, true)
    task.delay(p1, function() -- Line: 504 -- upvalues: ClientStateHandler (upval), States (upval)
        ClientStateHandler.updateState(States.NO_ITEM_EQUIPPING, false)
    end)
end
function v2.hasItemByName(p1) -- Line: 77 -- upvalues: Inventory (val), Players (val), getItemNameFromHash (val)
    local v1 = Inventory.Store.get(Players.LocalPlayer)
    if not v1 then
        return false
    end
    local v2 = v1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if getItemNameFromHash(j.id) == p1 then
            return true
        end
    end
    return false
end
return v2