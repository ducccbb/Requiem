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
--            File: ReplicatedStorage.Client.World.Weather.WorldWeatherClient
--                              Dumped in 0.000478 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
require(v1.Parent:WaitForChild("WorldFogBubbleClient"))
local u38 = {}
local Types = v1.Parent:WaitForChild("Types")
u38.rain = require(Types:WaitForChild("Rain"))
local Types_2 = v1.Parent:WaitForChild("Types")
u38.thunderstorm = require(Types_2:WaitForChild("Thunderstorm"))
local Types_3 = v1.Parent:WaitForChild("Types")
u38.fog = require(Types_3:WaitForChild("Fog"))
local Types_4 = v1.Parent:WaitForChild("Types")
u38.tundra = require(Types_4:WaitForChild("Tundra"))
local Types_5 = v1.Parent:WaitForChild("Types")
u38.wind = require(Types_5:WaitForChild("Wind"))
local Types_6 = v1.Parent:WaitForChild("Types")
u38.snow = require(Types_6:WaitForChild("Snow"))
local u105 = {}
local function onUpdateWeather() -- Line: 40 -- upvalues: Table (val), u105 (ref), u38 (val)
    local Attribute = workspace:GetAttribute("Weather")
    if not Attribute then
        return
    end
    local v1 = string.split(Attribute, ",")
    local v2 = Table.filter(v1, function(p1) -- Line: 47
        local v1 = p1 ~= ""
        return v1
    end)
    v2 = Table.compact(Table.filter(v2, function(p1) -- Line: 52
        local v1 = if p1 ~= "" then p1 ~= nil else false
        return v1
    end))
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j] = j
    end
    v4, v5 = Table.diff(u105, v3)
    v6 = v4
    local v7 = nil
    local v8 = nil
    for k, n in v6, v7, v8 do
        u38[n].stop()
    end
    v6 = v5
    v7 = nil
    v8 = nil
    for m, i5 in v6, v7, v8 do
        u38[i5].begin()
    end
    u105 = v3
end
local AttributeChangedSignal = workspace:GetAttributeChangedSignal("Weather")
AttributeChangedSignal:Connect(onUpdateWeather)
onUpdateWeather()
return {}