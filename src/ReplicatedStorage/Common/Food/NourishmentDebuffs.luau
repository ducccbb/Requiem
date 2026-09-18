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
--                File: ReplicatedStorage.Common.Food.NourishmentDebuffs
--                               Dumped in 0.00122 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    blur = 0,
    saturation = 0,
    brightness = 0,
    contrast = 0,
    vignetteTransparency = 1,
}
local u13 = {}
local v2 = {
    id = "Peckish",
    status = "Peckish",
    threshold = 0.5,
    visuals = {
        blur = 0,
        saturation = -0.15,
        brightness = 0,
        contrast = 0.05,
        vignetteTransparency = 0.92,
    },
    monologues = {"My stomach's starting to rumble.", "I could go for something to eat.", "I'm getting a little peckish."},
}
u13[1] = v2
u13[2] = {
    id = "Hungry",
    status = "Hungry",
    threshold = 0.25,
    visuals = {
        blur = 10,
        saturation = -0.35,
        brightness = -0.05,
        contrast = 0.1,
        vignetteTransparency = 0.82,
    },
    stats = {
        {attribute = "BasePlayerWalkSpeed", mode = "add", value = -1},
    },
    monologues = {"I'm really hungry...", "My stomach won't stop growling.", "I need food soon."},
}
u13[3] = {
    id = "Starving",
    status = "Starving",
    threshold = 0.1,
    visuals = {
        blur = 28,
        saturation = -0.65,
        brightness = -0.15,
        contrast = 0.2,
        vignetteTransparency = 0.55,
    },
    stats = {
        {attribute = "BasePlayerWalkSpeed", mode = "add", value = -3},
        {attribute = "HealthRegenerationMultiplier", mode = "multiply", value = 0.75},
        {attribute = "CanRoll", mode = "set", value = 0},
    },
    monologues = {"I'm starving...", "My legs feel heavy from hunger.", "I can't keep going without food much longer."},
}
local u38 = {}
local v3 = {
    id = "Dehydrated",
    status = "Dehydrated",
    threshold = 0.08,
    visuals = {
        blur = 32,
        saturation = -0.55,
        brightness = -0.12,
        contrast = 0.18,
        vignetteTransparency = 0.5,
    },
    stats = {
        {attribute = "BasePlayerWalkSpeed", mode = "add", value = -4},
        {attribute = "HealthRegenerationMultiplier", mode = "multiply", value = 0.6},
        {attribute = "CanRoll", mode = "set", value = 0},
    },
    monologues = {"I'm severely dehydrated...", "The world is spinning from thirst.", "I need water now."},
}
u38[1] = {
    id = "Thirsty",
    status = "Thirsty",
    threshold = 0.4,
    visuals = {
        blur = 4,
        saturation = -0.1,
        brightness = 0,
        contrast = 0.05,
        vignetteTransparency = 0.9,
    },
    monologues = {"My mouth feels dry.", "I could use a drink.", "I'm getting thirsty."},
}
u38[2] = {
    id = "Parched",
    status = "Parched",
    threshold = 0.2,
    visuals = {
        blur = 14,
        saturation = -0.3,
        brightness = -0.08,
        contrast = 0.12,
        vignetteTransparency = 0.75,
    },
    stats = {
        {attribute = "BasePlayerWalkSpeed", mode = "add", value = -2},
        {attribute = "HealthRegenerationMultiplier", mode = "multiply", value = 0.85},
    },
    monologues = {"My throat is parched.", "I desperately need water.", "I'm so thirsty it hurts."},
}
u38[3] = v3
local v4 = {"I'm completely out of food...", "Everything hurts from hunger.", "I can barely move..."}
local v5 = {"I'm completely dehydrated...", "I can't go on without water...", "My body is shutting down from thirst."}
local u72 = {}
local v6 = {attribute = "BasePlayerWalkSpeed", mode = "multiply", value = 0.5}
local v7 = {attribute = "GearMaxVelocityMultiplier", mode = "multiply", value = 0.5}
u72[1] = v6
u72[2] = v7
u72[3] = {attribute = "GearSwiftnessMultiplier", mode = "multiply", value = 0.5}
local u76 = {attribute = "CanRoll", mode = "set", value = 0}
local function appendStatModifiers(p1, p2) -- Line: 199
    local v1 = p2
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        table.insert(p1, j)
    end
end
local function appendEmptyPenalties(p1, p2, p3) -- Line: 205 -- upvalues: appendStatModifiers (val), u72 (val), u76 (val)
    if p2 <= 0 then
        appendStatModifiers(p1, u72)
    end
    if p3 <= 0 then
        appendStatModifiers(p1, u72)
        table.insert(p1, u76)
    end
end
local function getRatio(p1, p2) -- Line: 215
    if p2 <= 0 then
        return 1
    end
    return (math.clamp(p1 / p2, 0, 1))
end
local function getActiveTier(p1, p2) -- Line: 223
    local v1 = nil
    local v2 = p1
    local v3 = nil
    local v4 = nil
    local v5 = p2
    for i, j in v2, v3, v4 do
        if v5 <= j.threshold then
            if not v1 then
                v1 = j
            elseif j.threshold >= v1.threshold then
            end
        end
    end
    return v1
end
local function combineVisuals(p1, p2) -- Line: 237
    return {
        blur = math.max(p1.blur, p2.blur),
        saturation = math.min(p1.saturation, p2.saturation),
        brightness = math.min(p1.brightness, p2.brightness),
        contrast = math.max(p1.contrast, p2.contrast),
        vignetteTransparency = math.min(p1.vignetteTransparency, p2.vignetteTransparency),
    }
end
local function collectTierStats(p1) -- Line: 247
    if not p1 or not p1.stats then
        return {}
    end
    return p1.stats
end
local function combineStatModifiers(p1) -- Line: 257
    local v1
    local v2 = {}
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = v2[j.attribute]
        if not v1 then
            v2[j.attribute] = {attribute = j.attribute, mode = j.mode, value = j.value}
        elseif j.mode == "add" then
            v1.value = math.min(v1.value, j.value)
        elseif j.mode == "multiply" then
            v1.value = v1.value * j.value
        elseif j.mode == "set" then
            if v1.mode ~= "set" then
                v1.mode = "set"
                v1.value = j.value
            else
                v1.value = math.min(v1.value, j.value)
            end
        end
    end
    v3 = {}
    v4 = v2
    v5 = nil
    local v6 = nil
    for k, n in v4, v5, v6 do
        table.insert(v3, n)
    end
    return v3
end
local function getTierIndex(p1, p2) -- Line: 293
    if not p2 then
        return 0
    end
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.id == p2 then
            return i
        end
    end
    return 0
end
return {
    HUNGER_TIERS = u13,
    THIRST_TIERS = u38,
    EMPTY_MOVEMENT_PENALTIES = u72,
    EMPTY_NO_ROLL = u76,
    EMPTY_HUNGER_MONOLOGUES = v4,
    EMPTY_THIRST_MONOLOGUES = v5,
    NONE_VISUALS = u12,
    getRatio = getRatio,
    getActiveTier = getActiveTier,
    getTierIndex = getTierIndex,
    isTierWorse = function(p1, p2, p3) -- Line: 307 -- upvalues: getTierIndex (val)
        local v1 = getTierIndex(p1, p2)
        local v2 = getTierIndex(p1, p3) < v1
        return v2
    end,
    getTierMonologues = function(p1) -- Line: 311
        if not p1 or not p1.monologues then
            return nil
        end
        return p1.monologues
    end,
    combineStatModifiers = combineStatModifiers,
    resolveDebuffState = function(p1, p2, p3, p4) -- Line: 319 -- upvalues: getActiveTier (val), u13 (val), getRatio (val), u38 (val), u12 (val), combineVisuals (val), collectTierStats (val), appendEmptyPenalties (val), combineStatModifiers (val)
        local v1 = getActiveTier(u13, getRatio(p1, p2))
        local v2 = getActiveTier(u38, getRatio(p3, p4))
        local v3 = u12
        if v1 then
            v3 = combineVisuals(v3, v1.visuals)
        end
        if v2 then
            v3 = combineVisuals(v3, v2.visuals)
        end
        local v4 = {}
        for i, j in collectTierStats(v1) do
            table.insert(v4, j)
        end
        for k, n in collectTierStats(v2) do
            table.insert(v4, n)
        end
        appendEmptyPenalties(v4, p1, p3)
        local v5 = combineStatModifiers(v4)
        return {visuals = v3, hungerTier = v1, thirstTier = v2, stats = v5}
    end,
}