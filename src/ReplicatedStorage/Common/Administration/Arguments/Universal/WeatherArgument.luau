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
--   File: ReplicatedStorage.Common.Administration.Arguments.Universal.WeatherArgument
--                              Dumped in 0.000505 seconds
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
    rain = "rain",
    wind = "wind",
    thunderstorm = "thunderstorm",
    fog = "fog",
    tundra = "tundra",
    snow = "snow",
    clear = "clear",
}
local function autocomplete(p1, p2) -- Line: 31 -- upvalues: Table (val), u31 (val)
    local v1 = Table.keys(u31)
    local v2 = Table.filter(v1, function(a1) -- Line: 34 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end)
    if not p2 then
        v2 = Table.map(v2, function(p1) -- Line: 39
            return p1:lower()
        end)
    end
    return v2, Color3.fromRGB(255, 97, 176)
end
local function sanitize(p1, p2) -- Line: 52 -- upvalues: autocomplete (val), u31 (val)
    local v1
    if not p2 or p2 == "" then
        return nil
    end
    local v2 = autocomplete(p2, true)
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = u31[j]
        if v1 then
            table.insert(v3, v1)
        end
    end
    return v3[1]
end
return function(p1) -- Line: 77 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The action to perform on the disciplines."}
end