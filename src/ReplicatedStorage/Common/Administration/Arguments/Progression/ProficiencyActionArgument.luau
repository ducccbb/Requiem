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
--File: ReplicatedStorage.Common.Administration.Arguments.Progression.ProficiencyActionArgument
--                              Dumped in 0.000476 seconds
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
    Add = "add",
    Remove = "remove",
    Reset = "reset",
    AwardLevels = "awardlevels",
    AwardExperience = "awardexperience",
}
local function autocomplete(p1) -- Line: 24 -- upvalues: Table (val), u31 (val)
    local v1
    local v2 = Table.keys(u31)
    v1 = Table.filter(v2, function(a1) -- Line: 26 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end)
    return Table.map(v1, function(p1) -- Line: 30 -- upvalues: u31 (upval)
        local v1 = u31[p1]
        if not v1 then
            v1 = p1:lower()
        end
        return v1
    end), Color3.fromRGB(255, 97, 176)
end
local function sanitize(p1, p2) -- Line: 37 -- upvalues: u31 (val)
    if not p2 or p2 == "" then
        return nil
    end
    local v1 = string.lower(p2)
    for k, v in pairs(u31) do
        if v1 == v then
            return v
        end
    end
    return nil
end
return function(p1) -- Line: 52 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The action to perform on the proficiency."}
end