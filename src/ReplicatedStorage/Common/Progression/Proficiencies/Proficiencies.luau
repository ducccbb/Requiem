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
--        File: ReplicatedStorage.Common.Progression.Proficiencies.Proficiencies
--                               Dumped in 0.00170 seconds
--                          Bytecode version 9  |  14 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {"Soldier", "Logistician"}
local v2 = {Soldier = "rbxassetid://16095745392", Logistician = "rbxassetid://11432855214"}
local v3 = {Soldier = "The soldier proficiency, specialized in combat. Includes the subclasses Sentinel, Peacekeeper and more.", Logistician = "The logistician proficiency, specialized in logistics. Includes the subclasses Engineer, Medic and more."}
local u17 = {}
local u18 = {
    Medic = {
        base = 1,
        multiplier = 1.12,
        Actions = {
            Training = {targetLevel = 28, targetActions = 350},
            OpenEnchantment = {targetLevel = 28, targetActions = 8000},
            Assist = {targetLevel = 28, targetActions = 7500},
            Saves = {targetLevel = 28, targetActions = 750},
            Bandage = {targetLevel = 28, targetActions = 3500},
            SelfBandage = {targetLevel = 28, targetActions = 4000},
            Removals = {targetLevel = 28, targetActions = 1500},
            Operation = {targetLevel = 28, targetActions = 40},
            Kill = {targetLevel = 28, targetActions = 350},
        },
    },
    Soldier = {
        base = 3,
        multiplier = 1.09,
        Actions = {
            Training = {targetLevel = 34, targetActions = 250},
            OpenEnchantment = {targetLevel = 34, targetActions = 8000},
            Titan = {targetLevel = 34, targetActions = 1500},
            Assist = {targetLevel = 34, targetActions = 3000},
            Saves = {targetLevel = 34, targetActions = 500},
            Kill = {targetLevel = 34, targetActions = 110},
            Arrest = {targetLevel = 34, targetActions = 125},
            Tackle = {targetLevel = 34, targetActions = 300},
        },
    },
    Logistician = {
        base = 3,
        multiplier = 1.09,
        Actions = {
            Training = {targetLevel = 30, targetActions = 250},
            OpenEnchantment = {targetLevel = 30, targetActions = 8000},
            Titan = {targetLevel = 30, targetActions = 1500},
            Assist = {targetLevel = 30, targetActions = 2600},
            Saves = {targetLevel = 30, targetActions = 400},
            Kill = {targetLevel = 30, targetActions = 70},
            Bandage = {targetLevel = 30, targetActions = 1500},
            Arrest = {targetLevel = 30, targetActions = 50},
            Tackle = {targetLevel = 30, targetActions = 250},
        },
    },
    Peacekeeper = {
        base = 3,
        multiplier = 1.12,
        Actions = {
            Training = {targetLevel = 26, targetActions = 400},
            OpenEnchantment = {targetLevel = 26, targetActions = 8000},
            Titan = {targetLevel = 26, targetActions = 7500},
            Saves = {targetLevel = 26, targetActions = 1000},
            Kill = {targetLevel = 26, targetActions = 250},
            Arrest = {targetLevel = 26, targetActions = 125},
            Tackle = {targetLevel = 26, targetActions = 500},
        },
    },
    Sentinel = {
        base = 7,
        multiplier = 1.12,
        Actions = {
            Training = {targetLevel = 33, targetActions = 450},
            OpenEnchantment = {targetLevel = 33, targetActions = 8000},
            Saves = {targetLevel = 33, targetActions = 1000},
            Titan = {targetLevel = 33, targetActions = 5000},
            Assist = {targetLevel = 33, targetActions = 15000},
            Kill = {targetLevel = 33, targetActions = 400},
            Arrest = {targetLevel = 33, targetActions = 200},
        },
    },
    Leadership = {
        base = 25,
        multiplier = 1.05,
        Actions = {
            Training = {targetLevel = 15, targetActions = 450},
            OpenEnchantment = {targetLevel = 15, targetActions = 8000},
            Titan = {targetLevel = 15, targetActions = 1000},
            Kill = {targetLevel = 15, targetActions = 125},
            Activation = {targetLevel = 15, targetActions = 150},
            Bandage = {targetLevel = 15, targetActions = 1500},
        },
    },
    Skills = {
        base = 1,
        multiplier = 1.025,
        Actions = {
            Training = {targetLevel = 8, targetActions = 12},
            OpenEnchantment = {targetLevel = 8, targetActions = 400},
            Titan = {targetLevel = 8, targetActions = 50},
            Assist = {targetLevel = 8, targetActions = 150},
            Saves = {targetLevel = 8, targetActions = 20},
            Kill = {targetLevel = 8, targetActions = 10},
            Bandage = {targetLevel = 8, targetActions = 100},
            Removals = {targetLevel = 8, targetActions = 50},
            SelfBandage = {targetLevel = 8, targetActions = 75},
            Arrest = {targetLevel = 8, targetActions = 10},
        },
    },
}
local v4 = {base = 25, multiplier = 1.12}
local v5 = {
    Titan = {targetLevel = 15, targetActions = 2500},
    Kill = {targetLevel = 15, targetActions = 150},
}
local v6 = {targetLevel = 15, targetActions = 100}
v5.Enterance = v6
v4.Actions = v5
u18.Flow = v4
local u94 = {base = 25, multiplier = 1.1}
v5 = {}
u94.Actions = v5
local function getExperienceGrowth(p1) -- Line: 505 -- upvalues: u18 (val), u94 (val)
    local v1 = u18[p1]
    if not v1 then
        v1 = u94
    end
    return v1
end
local function getProficiencyXpRequired(p1, p2) -- Line: 529 -- upvalues: getExperienceGrowth (val)
    local v1 = getExperienceGrowth(p1)
    local v2 = math.max(1, (math.floor(p2)))
    local v3 = v1.base * v1.multiplier ^ (v2 - 1)
    return (math.max(1, (math.floor(v3))))
end
local function solveXpPerActionForTarget(p1) -- Line: 557 -- upvalues: u94 (val)
    local v1 = math.max(1, (math.floor(p1.targetActions)))
    local v2 = math.max(1, (math.floor(p1.targetLevel)))
    local base = p1.base
    if not base then
        base = u94.base
    end
    local multiplier = p1.multiplier
    if not multiplier then
        multiplier = u94.multiplier
    end
    local v3 = 0
    local v4 = v2 - 1
    local v5 = 1
    for i = 1, v4, v5 do
        v3 = v3 + math.max(1, (math.floor(base * multiplier ^ (i - 1))))
    end
    return v3 / v1
end
local function getActionTarget(p1, p2) -- Line: 577 -- upvalues: getExperienceGrowth (val)
    local v1
    local v2 = getExperienceGrowth(p1)
    if not v2.Actions then
        return
    end
    for k, v in pairs(v2.Actions) do
        v1 = string.lower(k)
        if v1 == string.lower(p2) then
            return v
        end
    end
end
local function resolveActionExperienceAward(p1, p2) -- Line: 598 -- upvalues: getExperienceGrowth (val), getActionTarget (val), solveXpPerActionForTarget (val)
    local v1 = getExperienceGrowth(p1)
    local v2 = getActionTarget(p1, p2)
    if not v2 then
        return
    end
    local v3 = {base = v1.base, multiplier = v1.multiplier, targetLevel = v2.targetLevel, targetActions = v2.targetActions}
    return (math.max(0, (solveXpPerActionForTarget(v3))))
end
return {
    Medic = u18.Medic,
    Soldier = u18.Soldier,
    Logistician = u18.Logistician,
    Peacekeeper = u18.Peacekeeper,
    Sentinel = u18.Sentinel,
    Leadership = u18.Leadership,
    Skills = u18.Skills,
    Flow = u18.Flow,
    getProficiencyTree = function(p1) -- Line: 489 -- upvalues: u17 (val), u0 (val)
        local v1 = u17[p1]
        if not v1 then
            v1 = require(u0.Parent.Types:FindFirstChild(p1, true))
        end
        if not v1 then
            error((("No proficiency tree found for name: %*"):format(p1)))
        end
        u17[p1] = v1
        return v1
    end,
    getExperienceGrowth = getExperienceGrowth,
    getProficiencyNames = function() -- Line: 513 -- upvalues: u18 (val)
        local v1 = {}
        for k, v in pairs(u18) do
            table.insert(v1, k)
        end
        table.sort(v1)
        return v1
    end,
    getProficiencyXpRequired = getProficiencyXpRequired,
    getTotalXpToReachLevel = function(p1, p2) -- Line: 542 -- upvalues: getProficiencyXpRequired (val)
        local v1 = math.max(1, (math.floor(p2)))
        local v2 = 0
        local v3 = v1 - 1
        local v4 = 1
        for i = 1, v3, v4 do
            v2 = v2 + getProficiencyXpRequired(p1, i)
        end
        return v2
    end,
    solveXpPerActionForTarget = solveXpPerActionForTarget,
    solveGrowthForTarget = function(p1) -- Line: 698 -- upvalues: u94 (val)
        local v1
        local base = p1.base
        if not base then
            base = u94.base
        end
        local u10 = math.max(1, (math.floor(p1.targetLevel)))
        local v2 = math.max(1, (math.floor(p1.targetActions)))
        local v3 = math.max(0, v2 * (p1.xpPerAction or 1))
        local function totalForGrowth(p1) -- Line: 705 -- upvalues: u10 (val), base (val)
            local v1 = 0
            local v2 = u10 - 1
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = v1 + math.max(1, (math.floor(base * p1 ^ (i - 1))))
            end
            return v1
        end
        local v4 = 1
        local v5 = 5
        local v6 = 50
        local v7 = 1
        for i = 1, v6, v7 do
            v1 = (v4 + v5) / 2
            if totalForGrowth(v1) >= v3 then
                v5 = v1
            else
                v4 = v1
            end
        end
        return (v4 + v5) / 2
    end,
    getActionTarget = getActionTarget,
    resolveActionExperienceAward = resolveActionExperienceAward,
    getActionTargetFromReward = function(p1) -- Line: 620 -- upvalues: u18 (val)
        local Actions
        if not p1 then
            return
        end
        local v1 = p1
        for k, v in pairs(u18) do
            Actions = v.Actions
            if Actions then
                for k2, i in pairs(Actions) do
                    if i == v1 then
                        return i
                    end
                end
            end
        end
    end,
    resolveActionExperienceAwardFromReward = function(p1) -- Line: 646 -- upvalues: u18 (val), resolveActionExperienceAward (val)
        local Actions
        if not p1 then
            return
        end
        local v1 = p1
        for k, v in pairs(u18) do
            Actions = v.Actions
            if Actions then
                for k2, i in pairs(Actions) do
                    if i == v1 then
                        return resolveActionExperienceAward(k, k2)
                    end
                end
            end
        end
    end,
    getRewardContextFromAction = function(p1) -- Line: 672 -- upvalues: u18 (val)
        local Actions
        if not p1 then
            return nil, nil
        end
        local v1 = p1
        for k, v in pairs(u18) do
            Actions = v.Actions
            if Actions then
                for k2, i in pairs(Actions) do
                    if i == v1 then
                        return k, k2
                    end
                end
            end
        end
        return nil, nil
    end,
    Constants = {CORE_PROFICIENCIES = v1, PROFICIENCY_ICONS = v2, PROFICIENCY_DESCRIPTIONS = v3},
}