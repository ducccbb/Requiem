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
--    File: ReplicatedStorage.Common.Administration.Arguments.Economy.UpdateArgument
--                              Dumped in 0.000383 seconds
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
    addreputationfactor = "ADD_ORGANIZATION",
    removereputationfactor = "REMOVE_ORGANIZATION",
    createlocation = "CREATE_LOCATION",
    removelocation = "REMOVE_LOCATION",
    updatepopulation = "UPDATE_POPULATION",
    updatebusinesses = "UPDATE_BUSINESSES",
    updateaverageincome = "UPDATE_AVERAGE_INCOME",
    updatehappiness = "UPDATE_HAPPINESS",
    updateoutlook = "UPDATE_OUTLOOK",
    updategovernor = "UPDATE_GOVERNOR",
    updateciviliantax = "UPDATE_CIVILIAN_TAX",
    updateindustrialtax = "UPDATE_INDUSTRIAL_TAX",
    addgovernoraccess = "ADD_GOVERNOR_ACCESS",
    removegovernoraccess = "REMOVE_GOVERNOR_ACCESS",
    updateemploymentrate = "UPDATE_EMPLOYMENT_RATE",
    updatecostofliving = "UPDATE_COST_OF_LIVING",
    updatebusinessincome = "UPDATE_BUSINESS_INCOME",
}
local function autocomplete(p1) -- Line: 46 -- upvalues: Table (val), u31 (val)
    local v1 = Table.keys(u31)
    return Table.filter(v1, function(a1) -- Line: 49 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(255, 150, 241)
end
local function sanitize(p1, p2) -- Line: 61 -- upvalues: autocomplete (val), u31 (val)
    local v1
    if not p2 or p2 == "" then
        return {}
    end
    local v2 = autocomplete(p2)
    local v3 = {}
    for k, v in pairs(v2) do
        v1 = u31[v]
        if v1 then
            table.insert(v3, v1)
        end
    end
    if #v3 == 0 then
        return {(tostring(p2))}
    end
    return v3
end
return function(p1) -- Line: 90 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The change you wish to make to the location."}
end