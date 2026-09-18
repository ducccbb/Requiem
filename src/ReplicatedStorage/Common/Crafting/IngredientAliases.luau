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
--               File: ReplicatedStorage.Common.Crafting.IngredientAliases
--                              Dumped in 0.000535 seconds
--                          Bytecode version 9  |  7 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local u12 = {
    "Iron",
    "Gold",
    "Copper",
    "Silver",
    "Platinum",
    "Mythril",
}
local u19 = {}
for i, v in ipairs(u12) do
    v1 = ("%* Ingot"):format(v)
    u19[v1] = {v}
end
local function recipeMatchIdentity(p1, p2) -- Line: 29 -- upvalues: u19 (val)
    local v1
    local v2 = u19[p1]
    if not v2 then
        v1 = p1
    else
        v1 = "Ingot"
    end
    local v3 = {}
    local v4 = {}
    for i, v in ipairs(p2) do
        if not (v4[v]) then
            v4[v] = true
            table.insert(v3, v)
        end
    end
    if v2 then
        for i2, i3 in ipairs(v2) do
            if not (v4[i3]) then
                v4[i3] = true
                table.insert(v3, i3)
            end
        end
    end
    return v1, v3
end
local function isMetalTag(p1) -- Line: 61 -- upvalues: u12 (val)
    for i, v in ipairs(u12) do
        if p1 == v then
            return true
        end
    end
    return false
end
return {
    METALS = u12,
    recipeMatchIdentity = recipeMatchIdentity,
    itemNameMatchesRequirement = function(p1, p2) -- Line: 53 -- upvalues: recipeMatchIdentity (val)
        if p1 == p2 then
            return true
        end
        local v1 = {}
        local v2 = recipeMatchIdentity(p1, v1)
        v1 = v2 == p2
        return v1
    end,
    isMetalTag = isMetalTag,
    distinctMetalCount = function(p1) -- Line: 70 -- upvalues: isMetalTag (val)
        local v1 = {}
        for i, v in ipairs(p1) do
            if isMetalTag(v) then
                v1[v] = true
            end
        end
        local v2 = 0
        for k in pairs(v1) do
            v2 = v2 + 1
        end
        return v2
    end,
    stripMetalTags = function(p1) -- Line: 84 -- upvalues: isMetalTag (val)
        local v1 = {}
        for i, v in ipairs(p1) do
            if not (isMetalTag(v)) then
                table.insert(v1, v)
            end
        end
        return v1
    end,
    dedupeTagsOrderPreserving = function(p1) -- Line: 94
        local v1 = {}
        local v2 = {}
        for i, v in ipairs(p1) do
            if not (v2[v]) then
                v2[v] = true
                table.insert(v1, v)
            end
        end
        return v1
    end,
}