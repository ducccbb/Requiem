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
--                File: ReplicatedStorage.Common.Crafting.GridRecipeMatch
--                               Dumped in 0.00158 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local IngredientAliases = require(script.Parent:WaitForChild("IngredientAliases"))
local function tagsToStrings(p1) -- Line: 22
    local v1 = {}
    if not p1 then
        return v1
    end
    for i, v in ipairs(p1) do
        table.insert(v1, (tostring(v)))
    end
    return v1
end
local function trimPattern(p1) -- Line: 48
    local v1, v2, v3, v4, v5, v6
    local v7 = #p1
    if v7 == 0 then
        return {}, 0, 0
    end
    local v8 = 0
    for i, v in ipairs(p1) do
        v8 = math.max(v8, #v)
    end
    if v8 == 0 then
        return {}, 0, 0
    end
    local v9 = v7 + 1
    local v10 = 0
    local v11 = v8 + 1
    local v12 = 0
    local v13 = v7
    local v14 = 1
    local v15 = p1
    for i2 = 1, v13, v14 do
        v1 = v15[i2]
        v2 = v8
        v3 = 1
        for j = 1, v2, v3 do
            v5 = v1
            if v5 then
                v5 = v1[j]
            end
            if v5 ~= nil and v5 ~= "" then
                v9 = math.min(v9, i2)
                v10 = math.max(v10, i2)
                v11 = math.min(v11, j)
                v12 = math.max(v12, j)
            end
        end
    end
    if v10 < v9 then
        return {}, 0, 0
    end
    v13 = {}
    v14 = v10
    local v16 = 1
    for k = v9, v14, v16 do
        v2 = v15[k]
        v3 = {}
        v4 = v12
        v5 = 1
        for n = v11, v4, v5 do
            v6 = v2
            if v6 then
                v6 = v2[n]
            end
            if v6 == "" then
                v6 = nil
            end
            table.insert(v3, v6)
        end
        table.insert(v13, v3)
    end
    v2 = v13[1]
    if not v2 then
        v2 = {}
    end
    return v13, #v13, #v2
end
local function cellSatisfiesPattern(p1, p2, p3) -- Line: 97 -- upvalues: IngredientAliases (val)
    local v1
    if p3 == nil or p3 == "" then
        v1 = p2 == nil
        return v1
    end
    if p3 == "Blank" then
        if not p2 then
            return true
        end
        local v2 = p1(p2.id) == "Blank"
        return v2
    end
    if not p2 then
        return false
    end
    v1 = p1(p2.id)
    if not v1 or v1 == "" then
        return false
    end
    return IngredientAliases.itemNameMatchesRequirement(v1, p3)
end
local function slotIndex(p1, p2, p3) -- Line: 124
    return (p2 - 1) * p1 + p3
end
local function matchPatternAtOffset(p1, p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 129 -- upvalues: slotIndex (val), cellSatisfiesPattern (val), IngredientAliases (val), tagsToStrings (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    local v19 = p1
    local v20 = 1
    v1, v2, v10, v13, v14, v15, v16, v17, v18 = p1, p2, p3, p4, p5, p6, p7, p8, p9
    for i = 1, v19, v20 do
        v3 = v1
        v4 = 1
        for j = 1, v3, v4 do
            v6 = v2[slotIndex(v1, i, j)]
            v7 = if v16 <= i then if i < v16 + v14 then if v17 <= j then j < v17 + v15 else false else false else false
            if v7 then
                v8 = i - v16 + 1
                v9 = j - v17 + 1
                v11 = v13[v8]
                if v11 then
                    v11 = v13[v8][v9]
                end
                if not (cellSatisfiesPattern(v10, v6, v11)) then
                    return nil
                end
            elseif v6 ~= nil and v10(v6.id) ~= "Blank" then
                return nil
            end
        end
    end
    v19 = {}
    v20 = {}
    local v21 = {}
    v3 = v1
    v4 = 1
    for k = 1, v3, v4 do
        v5 = v1
        v6 = 1
        for n = 1, v5, v6 do
            v8 = slotIndex(v1, k, n)
            v9 = v2[v8]
            if v9 then
                table.insert(v19, v8)
                if v18 then
                    v11 = v10(v9.id) or ""
                    _, v12 = IngredientAliases.recipeMatchIdentity(v11, tagsToStrings(v9.tags))
                    for i2, v in ipairs(v12) do
                        if not (v21[v]) then
                            v21[v] = true
                            table.insert(v20, v)
                        end
                    end
                end
            end
        end
    end
    return v19, v20
end
function matchShapedPlacements(p1, p2, p3, p4, p5) -- Line: 192 -- upvalues: trimPattern (val), matchPatternAtOffset (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    v9, v10, v11 = trimPattern(p4)
    if v10 == 0 or v11 == 0 or p1 < v10 or p1 < v11 then
        return nil, nil
    end
    local v12 = p1 - v10 + 1
    local v13 = 1
    v1, v2, v7, v8 = p1, p2, p3, p5
    for i = 1, v12, v13 do
        v3 = v1 - v11 + 1
        v4 = 1
        for j = 1, v3, v4 do
            v5, v6 = matchPatternAtOffset(v1, v2, v7, v9, v10, v11, i, j, v8)
            if v5 then
                return v5, v6
            end
        end
    end
    return nil, nil
end
function tallyRequirementItems(p1) -- Line: 220 -- upvalues: IngredientAliases (val)
    local v1, v2, v3, v4
    local v5 = {}
    for i, v in ipairs(p1) do
        v3 = #v
        v4 = 1
        for i2 = 1, v3, v4 do
            v1 = v[i2]
            if v1 ~= nil and v1 ~= "" then
                v2 = IngredientAliases.recipeMatchIdentity(v1, {})
                if v2 ~= "Blank" then
                    v5[v2] = (v5[v2] or 0) + 1
                end
            end
        end
    end
    local v6 = {}
    for k, j in pairs(v5) do
        table.insert(v6, {item = k, amount = j})
    end
    return v6
end
function tallyIngredientAmountsForPricing(p1) -- Line: 244
    local v1, v2, v3
    local v4 = {}
    for i, v in ipairs(p1) do
        v2 = #v
        v3 = 1
        for i2 = 1, v2, v3 do
            v1 = v[i2]
            if v1 ~= nil and v1 ~= "" and v1 ~= "Blank" then
                v4[v1] = (v4[v1] or 0) + 1
            end
        end
    end
    local v5 = {}
    for k, j in pairs(v4) do
        table.insert(v5, {item = k, amount = j})
    end
    return v5
end
return {
    DEFAULT_STATION_GRID_SIZE = 5,
    trimPattern = trimPattern,
    matchShapedPlacements = matchShapedPlacements,
    tallyRequirementItems = tallyRequirementItems,
    tallyIngredientAmountsForPricing = tallyIngredientAmountsForPricing,
    tagsToStrings = tagsToStrings,
    isEmptyCell = function(p1) -- Line: 34
        local v1
        if p1 == nil then
            return true
        end
        if type(p1) == "string" then
            v1 = string.match(p1, "^%s*$") ~= nil
            return v1
        end
        if type(p1) ~= "table" then
            return false
        end
        v1 = next(p1) == nil
        return v1
    end,
}