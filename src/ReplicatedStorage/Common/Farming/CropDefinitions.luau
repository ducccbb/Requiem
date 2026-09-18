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
--                File: ReplicatedStorage.Common.Farming.CropDefinitions
--                              Dumped in 0.000490 seconds
--                          Bytecode version 9  |  3 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local u17 = {}
local v3 = {stageCount = 4, idealTempMin = 64, idealTempMax = 82}
if not (RunService:IsStudio()) then
    v1 = 21600
else
    v1 = 20
end
v3.maturitySeconds = v1
u17.Tomato = v3
v3 = {stageCount = 4, idealTempMin = 52, idealTempMax = 72}
if not (RunService:IsStudio()) then
    v1 = 21600
else
    v1 = 20
end
v3.maturitySeconds = v1
u17.Potato = v3
v3 = {stageCount = 4, idealTempMin = 50, idealTempMax = 68}
if not (RunService:IsStudio()) then
    v1 = 21600
else
    v1 = 20
end
v3.maturitySeconds = v1
u17.Carrot = v3
v3 = {stageCount = 4, idealTempMin = 52, idealTempMax = 78}
if not (RunService:IsStudio()) then
    v1 = 21600
else
    v1 = 20
end
v3.maturitySeconds = v1
u17.Onion = v3
v3 = {stageCount = 4, idealTempMin = 52, idealTempMax = 74}
if not (RunService:IsStudio()) then
    v1 = 21600
else
    v1 = 20
end
v3.maturitySeconds = v1
u17.Wheat = v3
local v4 = {
    DEFINITIONS = u17,
    getConfig = function(p1) -- Line: 64 -- upvalues: u17 (val)
        return u17[p1]
    end,
}
function v4.getTemperatureGrowthMultiplier(p1, p2) -- Line: 70 -- upvalues: u17 (val)
    local v1, v2
    local v3 = u17[p1]
    if not v3 then
        return 1
    end
    local idealTempMin = v3.idealTempMin
    local idealTempMax = v3.idealTempMax
    if idealTempMin > p2 then
        if p2 >= idealTempMin then
            v1 = p2 - idealTempMax
        else
            v1 = idealTempMin - p2
        end
        v2 = math.clamp(v1 / 22, 0, 1)
        return (math.max(0.22, 1 - v2 * 0.78))
    end
    if p2 <= idealTempMax then
        v1 = idealTempMax - idealTempMin
        if v1 <= 0 then
            return 1
        end
        local v4 = math.abs(p2 - (idealTempMin + idealTempMax) / 2)
        return math.clamp(1 - v4 / (v1 / 2), 0, 1) * 0.12 + 1
    end
    if p2 >= idealTempMin then
        v1 = p2 - idealTempMax
    else
        v1 = idealTempMin - p2
    end
    v2 = math.clamp(v1 / 22, 0, 1)
    return (math.max(0.22, 1 - v2 * 0.78))
end
return v4