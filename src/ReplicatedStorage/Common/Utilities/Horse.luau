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
--                    File: ReplicatedStorage.Common.Utilities.Horse
--                               Dumped in 0.00169 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Companions"))
local Constants = require(v1.Parent.Parent:WaitForChild("Constants"))
local Types = v1.Parent.Parent:WaitForChild("Types")
local Names = require(Types:WaitForChild("Names"))
local String = require(v1.Parent:WaitForChild("String"))
local u70 = {
    Excellent = 5,
    Great = 4,
    Good = 3,
    Fair = 2,
    Poor = 1,
}
local u71 = {}
u71[u70.Excellent] = 7
u71[u70.Great] = 10
u71[u70.Good] = 20
u71[u70.Fair] = 35
u71[u70.Poor] = 28
local u82 = {}
u82[u70.Excellent] = 75
u82[u70.Great] = 60
u82[u70.Good] = 40
u82[u70.Fair] = 35
u82[u70.Poor] = 10
local u93 = {}
u93[u70.Excellent] = 1
u93[u70.Great] = 0.9
u93[u70.Good] = 0.8
u93[u70.Fair] = 0.7
u93[u70.Poor] = 0.5
local u104 = {}
u104[u70.Excellent] = 5000
u104[u70.Great] = 4000
u104[u70.Good] = 3000
u104[u70.Fair] = 1500
u104[u70.Poor] = 500
local u115 = {}
local v3 = Color3.fromRGB(81, 81, 81)
local v4 = Color3.fromRGB(173, 173, 173)
local v5 = Color3.fromRGB(255, 255, 255)
local v6 = Color3.fromRGB(16, 16, 16)
local v7 = Color3.fromRGB(71, 55, 37)
local v8 = Color3.fromRGB(72, 42, 22)
u115[1] = v3
u115[2] = v4
u115[3] = v5
u115[4] = v6
u115[5] = v7
u115[6] = v8
u115[7] = Color3.fromRGB(115, 79, 55)
local u151 = {
    SPEED = 2,
    TURNSPEED = 3,
    JUMP = 4,
    STAMINA = 5,
    HEALTH = 6,
}
local function getRandomHorseColorHex() -- Line: 74 -- upvalues: u115 (val)
    local v1 = u115[Random.new():NextInteger(1, #u115)]
    return string.format("#%02X%02X%02X", v1.R * 255, v1.G * 255, v1.B * 255)
end
local function getRandomHorseRarity(p1) -- Line: 81 -- upvalues: u70 (val), u71 (val)
    local v1 = p1:NextInteger(1, 100)
    for k, v in pairs(u71) do
        if v1 <= v then
            return k
        end
        v1 = v1 - v
    end
    return u70.Poor
end
local function createHorseChildStatistics(p1, p2) -- Line: 135 -- upvalues: u151 (val)
    local v1 = {}
    for k, v in pairs(u151) do
        v1[v] = (function(p1, p2) -- Line: 136
            local v1 = math.min(p1, p2)
            local v2 = math.max(p1, p2)
            local v3 = math.floor((v1 + (v2 + v2 / 4)) / 2.05 * (math.random(80, 110) / 100))
            return (math.clamp(v3, 0, 100))
        end)(p1.metadata[v], p2.metadata[v])
    end
    return v1
end
local function getRandomHorseName(p1) -- Line: 195 -- upvalues: Names (val), String (val)
    local Male, v1
    local v2 = Random.new()
    if p1 ~= 1 then
        Male = Names.Female
    else
        Male = Names.Male
        if not Male then
            Male = Names.Female
        end
    end
    local v3 = Male[v2:NextInteger(1, #Male)]
    if p1 ~= 1 then
        v1 = " Mare"
    else
        v1 = " Stallion"
    end
    return String.capitalizeAllFirstLetters(string.lower(v3)) .. " the" .. v1
end
return {
    createHorseFromRandom = function(p1) -- Line: 207 -- upvalues: Names (val), String (val), getRandomHorseRarity (val), u104 (val), Constants (val), u93 (val), u82 (val)
        local Male, v1
        local v2 = p1:NextInteger(1, 2)
        if v2 ~= 1 then
            Male = Names.Female
        else
            Male = Names.Male
        end
        local v3 = Male[p1:NextInteger(1, #Male)]
        if v2 ~= 1 then
            v1 = " Mare"
        else
            v1 = " Stallion"
        end
        v3 = String.capitalizeAllFirstLetters(string.lower(v3)) .. " the" .. v1
        local v4 = getRandomHorseRarity(p1)
        local v5 = u104[v4] * (1 + Constants.Inflation.GlobalInflationRate) * (1 + Constants.Inflation.HorseInflationRate)
        local v6 = u93[v4]
        local v7 = u82[v4]
        local v8 = math.floor(p1:NextInteger(1, 100 - v7) * v6 + v7)
        local v9 = math.floor(p1:NextInteger(1, 100 - v7) * v6 + v7)
        local v10 = math.floor(p1:NextInteger(1, 100 - v7) * v6 + v7)
        local v11 = math.floor(p1:NextInteger(1, 100 - v7) * v6 + v7)
        local v12 = math.floor(p1:NextInteger(1, 100 - v7) * v6 + v7)
        local v13 = (v8 + v9 + v10 + v11 + v12) / 5
        v5 = v5 + (v8 + v9 + v10 + v11 + v12) * 10
        local v14 = p1:NextInteger(100000, 999999)
        local v15 = {}
        if 80 <= v13 then
            table.insert(v15, "Excellent")
        elseif v13 >= 80 then
            if v13 >= 60 then
                if v13 >= 40 then
                    table.insert(v15, "Poor")
                elseif 20 <= v13 then
                    table.insert(v15, "Fair")
                end
            elseif 40 <= v13 then
                table.insert(v15, "Good")
            end
        elseif 60 <= v13 then
            table.insert(v15, "Great")
        end
        if 80 <= v8 then
            table.insert(v15, "Strong Legs")
        end
        if v8 < 80 and 60 <= v8 then
            table.insert(v15, "Good Legs")
        end
        if 80 <= v9 then
            table.insert(v15, "Excellent Reflexes")
        end
        if v9 < 80 and 60 <= v9 then
            table.insert(v15, "Great Reflexes")
        end
        if 80 <= v11 then
            table.insert(v15, "Longlasting Endurance")
        end
        if v11 < 80 and 60 <= v11 then
            table.insert(v15, "Great Endurance")
        end
        return {
            name = v3,
            price = math.floor(v5),
            tags = v15,
            meta = {
                v2,
                v8,
                v9,
                v10,
                v11,
                v12,
            },
            id = v14,
        }
    end,
    createHorseModel = function(p1) -- Line: 106 -- upvalues: ReplicatedStorage (val), HttpService (val)
        local v1 = ReplicatedStorage.Assets.Entities.Horse:Clone()
        v1.Name = p1.name
        local Seat = v1:WaitForChild("Seat")
        Seat:SetAttribute("Data", HttpService:JSONEncode(p1))
        return v1, Seat
    end,
    isHorseOldEnoughToBreed = function(p1) -- Line: 127 -- upvalues: Workspace (val), Constants (val)
        if not p1 then
            return false
        end
        local ServerTimeNow = Workspace:GetServerTimeNow()
        local v1 = ServerTimeNow - p1.age
        local v2 = Constants.Companions.BreedingAgeRequirement <= v1
        return v2
    end,
    isHorseOnBreedingCooldown = function(p1) -- Line: 116 -- upvalues: Constants (val), Workspace (val)
        if not p1 then
            return false
        end
        local v1 = p1.metadata[1]
        local v2 = Workspace:GetServerTimeNow() - v1 < Constants.Companions.BreedingCooldownLength
        return v2
    end,
    createChildHorseFrom = function(p1, p2) -- Line: 155 -- upvalues: Names (val), String (val), createHorseChildStatistics (val), Workspace (val)
        local Male, v1
        local v2 = Random.new()
        local v3 = v2:NextInteger(1, 2)
        if v3 ~= 1 then
            Male = Names.Female
        else
            Male = Names.Male
            if not Male then
                Male = Names.Female
            end
        end
        local v4 = Male[v2:NextInteger(1, #Male)]
        if v3 ~= 1 then
            v1 = " Mare"
        else
            v1 = " Stallion"
        end
        v4 = String.capitalizeAllFirstLetters(string.lower(v4)) .. " the" .. v1
        local v5 = createHorseChildStatistics(p1, p2)
        v5[1] = Workspace:GetServerTimeNow()
        local v6 = Color3.fromHex(p1.color)
        local v7 = v6:Lerp(Color3.fromHex(p2.color), 0.5)
        return {
            type = 1,
            active = 0,
            favorite = 0,
            id = v2:NextInteger(100000, 999999),
            name = v4,
            age = Workspace:GetServerTimeNow(),
            gender = v3,
            metadata = v5,
            color = (function(p1) -- Line: 176
                return string.format("#%02X%02X%02X", p1.R * 255, p1.G * 255, p1.B * 255)
            end)(v7),
        }
    end,
    updateModelAttributes = function(p1, p2) -- Line: 99 -- upvalues: HttpService (val)
        local Seat = p1:FindFirstChild("Seat")
        if Seat then
            Seat:SetAttribute("Data", HttpService:JSONEncode(p2))
        end
    end,
    getRandomHorseColorHex = getRandomHorseColorHex,
    getRandomHorseName = getRandomHorseName,
    createStarterHorse = function() -- Line: 292 -- upvalues: getRandomHorseName (val), getRandomHorseColorHex (val)
        local v1 = math.random(1, 2)
        local v2 = getRandomHorseName(v1)
        local v3 = {}
        local v4 = math.random(20, 40)
        local v5 = math.random(20, 40)
        local v6 = math.random(20, 40)
        local v7 = math.random(20, 40)
        v3[1] = 0
        v3[2] = v4
        v3[3] = v5
        v3[4] = v6
        v3[5] = v7
        v3[6] = math.random(20, 40)
        local v8 = tick() - math.random(500, 1000)
        v4 = {}
        v7 = {}
        local v9 = math.random(1, 500000)
        v7[1] = v2
        v7[2] = v8
        v7[3] = v1
        v7[4] = v3
        v7[5] = v9
        v7[6] = true
        v7[7] = false
        v4[1] = 1
        v4[2] = getRandomHorseColorHex()
        v4[3] = v7
        return v4
    end,
    HorseRarity = u70,
    Rarities = u71,
    RarityOffsets = u82,
    RarityWeights = u93,
    PriceOffsets = u104,
    Colors = u115,
}