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
--       File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set.filter
--                              Dumped in 0.000153 seconds
--                          Bytecode version 9  |  2 functions

local Util = require(script.Parent.Parent.Util)
return function(p1, p2) -- Line: 24 -- upvalues: Util (val)
    local truthy
    local v1 = {}
    if type(p2) ~= "function" then
        truthy = Util.func.truthy
    else
        truthy = p2
    end
    for k, v in pairs(p1) do
        if truthy(k, p1) then
            v1[k] = true
        end
    end
    return v1
end