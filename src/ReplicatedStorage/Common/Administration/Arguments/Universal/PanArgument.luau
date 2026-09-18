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
--     File: ReplicatedStorage.Common.Administration.Arguments.Universal.PanArgument
--                              Dumped in 0.000438 seconds
--                          Bytecode version 9  |  5 functions

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
    arc = "arc",
    between = "between",
    dolly = "dolly",
    drift = "drift",
    focus = "focus",
    follow = "follow",
    hero = "hero",
    impact = "impact",
    lead = "lead",
    mirror = "mirror",
    orbit = "orbit",
    ots = "ots",
    profile = "profile",
    sky = "sky",
    static = "static",
    topdown = "topdown",
    world = "world",
}
local function autocomplete(p1) -- Line: 41 -- upvalues: Table (val), u31 (val)
    local v1 = Table.keys(u31)
    return Table.filter(v1, function(a1) -- Line: 44 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(255, 150, 241)
end
local function sanitize(p1, p2) -- Line: 57 -- upvalues: u31 (val), autocomplete (val)
    if not p2 or p2 == "" then
        return nil
    end
    local v1 = p2:lower()
    for k, v in pairs(u31) do
        if k:lower() ~= v1 and v:lower() ~= v1 then
            continue
        end
        return v
    end
    for k2, i in pairs(u31) do
        if k2:lower():sub(1, #v1) ~= v1 and i:lower():sub(1, #v1) ~= v1 then
            continue
        end
        return i
    end
    local v2 = autocomplete(v1)
    local v3 = v2[1]
    if v3 then
        return u31[v3]
    end
    return nil
end
return function(p1) -- Line: 93 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The pans to use."}
end