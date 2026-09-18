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
--                    File: ReplicatedStorage.Common.Types.Locations
--                               Dumped in 0.00153 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local u36 = {
    SHIGANSHINA = 1,
    QUINTA = 2,
    HOLST = 3,
    ACRITA = 4,
    TROST = 5,
    KARANES = 6,
    KROLVA = 7,
    UTOPIA = 8,
    EHRMICH = 9,
    YARKEL = 10,
    ORVUD = 11,
    STOHESS = 12,
    ROYAL_PALACE = 13,
    TRAINEE_CAMP = 14,
    COURT_HOUSE = 15,
    TUNDRA = 16,
    SOUTHERN_WARD = 17,
    DEVELOPMENT = 99,
    LOBBY = 100,
    DEMO = 101,
    SUPPORTER = 102,
    EXAM = 103,
    CEREMONIAL = 104,
    SECONDARY_DEVELOPMENT = 105,
    TERTIARY_DEVELOPMENT = 106,
    LORE_TEAM_ONLY = 107,
    TESTING = 108,
    WALL_MARIA_SEGMENT_1 = 200,
    WALL_ROSE_SEGMENT_1 = 215,
    WALL_SINA_SEGMENT_1 = 216,
    WALL_MARIA_WILDERNESS_1 = 250,
    WALL_MARIA_WILDERNESS_2 = 253,
    WALL_MARIA_WILDERNESS_3 = 254,
    WALL_ROSE_WILDERNESS_1 = 251,
    WALL_SINA_WILDERNESS_1 = 252,
    SOUTHERN_WILDERNESS_1 = 300,
    SOUTHERN_WILDERNESS_2 = 301,
    SOUTHERN_WILDERNESS_3 = 302,
    NORTHERN_WILDERNESS_1 = 310,
    NORTHERN_WILDERNESS_2 = 311,
    NORTHERN_WILDERNESS_3 = 312,
}
local u78 = {}
u78[u36.SHIGANSHINA] = 75
u78[u36.ACRITA] = 55
u78[u36.QUINTA] = 65
u78[u36.HOLST] = 65
u78[u36.TRAINEE_CAMP] = 65
u78[u36.TROST] = 70
u78[u36.UTOPIA] = 60
u78[u36.KARANES] = 65
u78[u36.KROLVA] = 65
u78[u36.EHRMICH] = 65
u78[u36.YARKEL] = 65
u78[u36.ORVUD] = 65
u78[u36.STOHESS] = 65
u78[u36.SOUTHERN_WARD] = 65
u78[u36.ROYAL_PALACE] = 65
u78[u36.DEVELOPMENT] = 65
u78[u36.SECONDARY_DEVELOPMENT] = 65
u78[u36.TERTIARY_DEVELOPMENT] = 65
u78[u36.TESTING] = 65
u78[u36.COURT_HOUSE] = 65
u78[u36.LOBBY] = 65
u78[u36.DEMO] = 65
u78[u36.SUPPORTER] = 65
u78[u36.EXAM] = 65
u78[u36.CEREMONIAL] = 65
u78[u36.TUNDRA] = -60
u78[u36.LORE_TEAM_ONLY] = 65
u78[u36.WALL_MARIA_SEGMENT_1] = 60
u78[u36.WALL_ROSE_SEGMENT_1] = 60
u78[u36.WALL_SINA_SEGMENT_1] = 60
u78[u36.WALL_MARIA_WILDERNESS_1] = 60
u78[u36.WALL_MARIA_WILDERNESS_2] = 60
u78[u36.WALL_MARIA_WILDERNESS_3] = 60
u78[u36.WALL_ROSE_WILDERNESS_1] = 60
u78[u36.WALL_SINA_WILDERNESS_1] = 60
u78[u36.SOUTHERN_WILDERNESS_1] = 60
u78[u36.SOUTHERN_WILDERNESS_2] = 60
u78[u36.SOUTHERN_WILDERNESS_3] = 60
u78[u36.NORTHERN_WILDERNESS_1] = 60
u78[u36.NORTHERN_WILDERNESS_2] = -60
u78[u36.NORTHERN_WILDERNESS_3] = -60
local v3 = {MARIA = 1, ROSE = 2, SINA = 3}
local u162 = {}
u162[u36.SHIGANSHINA] = 73885602012704
u162[u36.ACRITA] = 128960426095828
u162[u36.TROST] = 140036995112622
u162[u36.EHRMICH] = 119103949688468
u162[u36.TRAINEE_CAMP] = 118528263656126
u162[u36.TUNDRA] = 77871730168115
u162[u36.KROLVA] = 105910236595004
u162[u36.KARANES] = 132951089622846
u162[u36.STOHESS] = 116612213895449
u162[u36.SOUTHERN_WARD] = 131936062145280
u162[u36.ROYAL_PALACE] = 116891883794028
u162[u36.DEVELOPMENT] = 74749613936308
u162[u36.LOBBY] = 18126170981
u162[u36.COURT_HOUSE] = 70371691786144
u162[u36.DEMO] = 132882838713925
u162[u36.SUPPORTER] = 101741397355453
u162[u36.EXAM] = 83774503107238
u162[u36.CEREMONIAL] = 75828551060471
u162[u36.SECONDARY_DEVELOPMENT] = 130437667662632
u162[u36.TERTIARY_DEVELOPMENT] = 81527559374732
u162[u36.TESTING] = 73703461716136
u162[u36.LORE_TEAM_ONLY] = 135345168740104
u162[u36.WALL_MARIA_SEGMENT_1] = 92736531891608
u162[u36.WALL_ROSE_SEGMENT_1] = 125461238111248
u162[u36.WALL_SINA_SEGMENT_1] = 86481178990721
u162[u36.WALL_MARIA_WILDERNESS_1] = 97054141077590
u162[u36.WALL_MARIA_WILDERNESS_2] = 137068340910417
u162[u36.WALL_MARIA_WILDERNESS_3] = 139574611599181
u162[u36.WALL_ROSE_WILDERNESS_1] = 115067344497751
u162[u36.WALL_SINA_WILDERNESS_1] = 72751977851387
u162[u36.SOUTHERN_WILDERNESS_1] = 102100271099331
u162[u36.SOUTHERN_WILDERNESS_2] = 103535589110219
u162[u36.SOUTHERN_WILDERNESS_3] = 123677914311516
u162[u36.NORTHERN_WILDERNESS_1] = 99133531810663
u162[u36.NORTHERN_WILDERNESS_2] = 136780146823776
u162[u36.NORTHERN_WILDERNESS_3] = 124507333757748
local u235 = {}
u235[u36.SHIGANSHINA] = true
u235[u36.ACRITA] = true
u235[u36.TROST] = true
u235[u36.EHRMICH] = true
u235[u36.KROLVA] = true
u235[u36.KARANES] = true
u235[u36.TRAINEE_CAMP] = true
u235[u36.TUNDRA] = true
u235[u36.CEREMONIAL] = true
u235[u36.WALL_MARIA_SEGMENT_1] = true
u235[u36.WALL_ROSE_SEGMENT_1] = true
u235[u36.WALL_SINA_SEGMENT_1] = true
u235[u36.WALL_MARIA_WILDERNESS_1] = true
u235[u36.WALL_MARIA_WILDERNESS_2] = true
u235[u36.WALL_ROSE_WILDERNESS_1] = true
u235[u36.WALL_SINA_WILDERNESS_1] = true
local v4 = {
    {u36.SHIGANSHINA, u36.QUINTA, u36.HOLST, u36.ACRITA},
    {u36.TROST, u36.KARANES, u36.KROLVA, u36.UTOPIA},
    {
        u36.EHRMICH,
        u36.YARKEL,
        u36.ORVUD,
        u36.STOHESS,
        u36.ROYAL_PALACE,
        u36.COURT_HOUSE,
    },
}
local v5 = {
    u36.SHIGANSHINA,
    u36.QUINTA,
    u36.HOLST,
    u36.ACRITA,
    u36.TROST,
    u36.KARANES,
    u36.KROLVA,
    u36.UTOPIA,
    u36.EHRMICH,
    u36.YARKEL,
    u36.ORVUD,
    u36.STOHESS,
}
local function getLocationEnumFromDisplayName(p1) -- Line: 297 -- upvalues: String (val), u36 (val)
    return u36[String.toUpperUnderscores(p1)]
end
local function getLocationNameFromPlace(p1) -- Line: 331 -- upvalues: Table (val), u162 (val), u36 (val), String (val)
    local v1 = Table.inverse(u162)
    local v2 = Table.inverse(u36)[v1[p1]]
    return String.capitalizeAllFirstLetters(v2)
end
return {
    Locations = u36,
    Walls = v4,
    Districts = v5,
    Temperatures = u78,
    Places = u162,
    Manageable = u235,
    getServersAverageTemperature = function() -- Line: 343 -- upvalues: getLocationNameFromPlace (val), u36 (val), u78 (val)
        local v1 = getLocationNameFromPlace(game.PlaceId)
        if not v1 then
            return 60
        end
        local v2 = u36[string.upper(v1)]
        return u78[v2] or 60
    end,
    getSimpleRatingString = function(p1) -- Line: 268
        if 0 > p1 then
            if 26 > p1 then
                if 51 > p1 then
                    if 76 <= p1 then
                        if p1 <= 100 then
                            return "Excellent"
                        end
                        return "Unknown"
                    end
                    return "Unknown"
                end
                if p1 <= 75 then
                    return "Good"
                end
                if 76 > p1 then
                    return "Unknown"
                end
                if p1 <= 100 then
                    return "Excellent"
                end
                return "Unknown"
            elseif p1 <= 50 then
                return "Average"
            end
        elseif p1 <= 25 then
            return "Poor"
        end
    end,
    getLocationName = function(p1) -- Line: 287 -- upvalues: Table (val), u36 (val), String (val)
        local v1 = Table.inverse(u36)
        return String.capitalizeAllFirstLetters(v1[p1])
    end,
    getLocationNameFromPlace = getLocationNameFromPlace,
    getLocationIdFromName = function(p1) -- Line: 321 -- upvalues: String (val), u162 (val), u36 (val)
        return u162[u36[String.toUpperUnderscores(p1)]]
    end,
    getLocationEnumFromDisplayName = getLocationEnumFromDisplayName,
    isManageableDisplayName = function(p1) -- Line: 307 -- upvalues: getLocationEnumFromDisplayName (val), u235 (val)
        local v1 = getLocationEnumFromDisplayName(p1)
        if v1 == nil then
            return false
        end
        local v2 = u235[v1] == true
        return v2
    end,
}