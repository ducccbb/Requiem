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
--File: ReplicatedStorage.Common.Administration.Arguments.Universal.CustomizationArgument
--                              Dumped in 0.000338 seconds
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
    mouth = "Mouth",
    eyebrows = "Eyebrows",
    eyeframe = "Eye Frame",
    eyetype = "Eye Type",
    eyecolor = "Eye Color",
    complexion = "Complexion",
    burns = "Burns",
    freckles = "Freckles",
    moles = "Moles",
    scars = "Scars",
    haircolor = "Hair",
}
local function autocomplete(p1) -- Line: 35 -- upvalues: Table (val), u31 (val)
    local v1 = Table.keys(u31)
    return Table.filter(v1, function(a1) -- Line: 38 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(255, 150, 241)
end
local function sanitize(p1, p2) -- Line: 50 -- upvalues: autocomplete (val), u31 (val)
    if not p2 or p2 == "" then
        return nil
    end
    local v1 = autocomplete(p2)
    local v2 = v1[1]
    if not v2 then
        return nil
    end
    return u31[v2]
end
return function(p1) -- Line: 69 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The color you wish to use."}
end