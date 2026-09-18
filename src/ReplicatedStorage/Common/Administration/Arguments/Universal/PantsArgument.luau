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
--    File: ReplicatedStorage.Common.Administration.Arguments.Universal.PantsArgument
--                              Dumped in 0.000499 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Pants = require(Customization:WaitForChild("Pants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u81 = {}
for k, v in pairs(Pants) do
    for k2, i in pairs(v) do
        u81[k2] = k2
    end
end
local function autocomplete(p1, p2) -- Line: 32 -- upvalues: Table (val), u81 (val)
    local v1 = Table.keys(u81)
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
    return v2, Color3.fromRGB(255, 122, 122)
end
local function sanitize(p1, p2) -- Line: 52 -- upvalues: autocomplete (val), u81 (val)
    if not p2 then
        return nil
    else
        local v1
        if p2 == "" then
            return nil
        end
        if not (tonumber(p2)) then
            local v2
            v1 = autocomplete(p2, true)
            local v3 = {}
            for k, v in pairs(v1) do
                v2 = u81[v]
                if v2 then
                    table.insert(v3, v2)
                end
            end
            return v3[1]
        else
            v1 = tonumber(p2)
            if 0 < v1 then
                return (tonumber(p2))
            end
        end
    end
end
return function(p1) -- Line: 81 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The pants"}
end