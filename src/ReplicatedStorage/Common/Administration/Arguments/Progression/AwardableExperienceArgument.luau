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
--File: ReplicatedStorage.Common.Administration.Arguments.Progression.AwardableExperienceArgument
--                              Dumped in 0.000399 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u31 = {
    LoreTeamIntenseEvent = "LoreTeamIntenseEvent",
    LoreTeamMission = "LoreTeamMission",
    TraineeCampTraining = "TraineeCampTraining",
    BranchTraining = "BranchTraining",
    SafeMissionBoard = "SafeMissionBoard",
    SafeFlashEvent = "SafeFlashEvent",
    SafeSliceOfLife = "SafeSliceOfLife",
    CombatMissionBoard = "CombatMissionBoard",
    CombatFlashEvent = "CombatFlashEvent",
    GoodRoleplay = "GoodRoleplay",
    ProblemSolving = "ProblemSolving",
}
local function autocomplete(p1, p2) -- Line: 39 -- upvalues: Table (val), u31 (val)
    local v1 = Table.keys(u31)
    local v2 = Table.filter(v1, function(a1) -- Line: 41 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end)
    if not p2 then
        v2 = Table.map(v2, function(p1) -- Line: 46
            return p1:lower()
        end)
    end
    return v2, Color3.fromRGB(255, 122, 122)
end
local function sanitize(p1, p2) -- Line: 59 -- upvalues: autocomplete (val), u31 (val)
    local v1
    if not p2 or p2 == "" then
        return nil
    end
    local v2 = autocomplete(p2, true)
    local v3 = {}
    for k, v in pairs(v2) do
        v1 = u31[v]
        if v1 then
            table.insert(v3, v1)
        end
    end
    return v3[1]
end
return function(p1) -- Line: 84 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The awardable experience"}
end