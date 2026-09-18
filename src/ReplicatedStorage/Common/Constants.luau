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
--                       File: ReplicatedStorage.Common.Constants
--                              Dumped in 0.000578 seconds
--                          Bytecode version 9  |  1 functions

local Studio, Studio_2, v1, v2
script = nil
local v3 = getfenv(0)
v3.script = nil
_G.script = nil
v3 = getfenv(0)
v3.getfenv = nil
local RunService = game:GetService("RunService")
local v4 = {
    Development = 74749613936308,
    SecondaryDevelopment = 130437667662632,
    TetriaryDevelopment = 81527559374732,
    Testing = 73703461716136,
    World = 118528263656126,
    Lobby = 18126170981,
    Supporter = 101741397355453,
    Exam = 83774503107238,
}
local v5 = if game.PlaceId ~= v4.Development then if game.PlaceId ~= v4.SecondaryDevelopment then game.PlaceId == v4.TetriaryDevelopment else true else true
local v6 = if game.PlaceId ~= v4.Development then if game.PlaceId ~= v4.SecondaryDevelopment then if game.PlaceId ~= v4.Testing then game.PlaceId == v4.TetriaryDevelopment else true else true else true
local v7 = game.PlaceId == v4.Supporter
local v8 = game.PlaceId == v4.Testing
if v8 then
    v7 = true
end
if RunService:IsStudio() then
    v5 = true
end
local v9 = {
    Master = 1,
    Game = 1,
    Studio = 1.46,
    Supporter = 1.01,
    Testing = 1,
    Subversions = {
        Admin = 1,
        Slots = 1,
        StaffSlot = 1,
        Plots = 1.1,
        Buildings = 1,
    },
}
local v10 = {}
if not v5 then
    v1 = 172800
else
    v1 = 10
end
v10.BreedingAgeRequirement = v1
if not v5 then
    v1 = 7200
else
    v1 = 10
end
v10.BreedingCooldownLength = v1
if v5 then
    v2 = "s"
elseif v7 then
    v2 = "p"
elseif not v8 then
    v2 = "r"
else
    v2 = "t"
end
local v11 = "." .. v2 .. "." .. v9.Master .. ".R_1.1"
local v12 = {
    Exhaustion = 10,
    Places = v4,
    Inflation = {GlobalInflationRate = 0.02, HorseInflationRate = 0.05, GearInflationRate = 0.2},
    Currency = {Symbol = "₲"},
    Companions = v10,
    Multipliers = {Experience = 1},
    IsDevelopmentPlace = v5,
    IsSupporterPlace = v7,
    IsDebuggingPlace = v6,
    IsTestingPlace = v8,
}
if v5 then
    Studio = v9.Studio
elseif v7 then
    Studio = v9.Supporter
elseif not v8 then
    Studio = v9.Game
else
    Studio = v9.Testing
end
v12.Data = ("%*d%*"):format(Studio, v11)
v12.Slots = ("%*s%*"):format(v9.Subversions.Slots, v11)
v12.StaffSlot = ("%*ss%*"):format(v9.Subversions.StaffSlot, v11)
if v5 then
    Studio_2 = v9.Studio
elseif not v7 then
    Studio_2 = v9.Game
else
    Studio_2 = v9.Supporter
    if not Studio_2 then
        Studio_2 = v9.Game
    end
end
v12.StaffData = ("%*sd%*"):format(Studio_2, v11)
v12.Admin = ("%*a%*"):format(v9.Subversions.Admin, v11)
v12.Plots = ("%*p%*"):format(v9.Subversions.Plots, v11)
v12.Damage = {Titans = 8.5}
v12.Tax = {Royal = 0.15}
v12.Medical = {
    BandageExpirationTime = 21600,
    BleedingExpirationTime = 1200,
    BleedingTickInterval = 60,
    BleedingHealthThreshold = 70,
    BleedingChance = 0,
}
v12.Backpack = {HotbarSlots = 10, Rows = 6, Columns = 10}
return v12