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
--File: ReplicatedStorage.Common.Administration.Arguments.Progression.ProficiencyArgument
--                              Dumped in 0.000353 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local Proficiencies_2 = Progression:WaitForChild("Proficiencies")
local Proficiencies = require(Proficiencies_2:WaitForChild("Proficiencies"))
local function autocomplete(p1, p2) -- Line: 15 -- upvalues: Proficiencies (val), Table (val)
    local v1 = Table.filter(Proficiencies.getProficiencyNames(), function(a1) -- Line: 18 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end)
    if not p2 then
        v1 = Table.map(v1, function(p1) -- Line: 23
            return p1:lower()
        end)
    end
    return v1, Color3.fromRGB(255, 97, 176)
end
local function sanitize(p1, p2) -- Line: 31 -- upvalues: autocomplete (val)
    if not p2 or p2 == "" then
        return nil
    end
    return autocomplete(p2, true)[1]
end
return function(p1) -- Line: 40 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The proficiency to modify."}
end