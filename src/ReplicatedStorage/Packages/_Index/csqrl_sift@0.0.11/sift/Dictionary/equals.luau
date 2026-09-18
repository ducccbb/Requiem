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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.equals
--                              Dumped in 0.000272 seconds
--                          Bytecode version 9  |  3 functions

local Parent = script.Parent.Parent
local Util = require(Parent.Util)
require(Parent.Types)
local function compare(p1, p2) -- Line: 7
    if type(p1) ~= "table" or type(p2) ~= "table" then
        local v1 = p1 == p2
        return v1
    end
    for k, v in pairs(p1) do
        if p2[k] ~= v then
            return false
        end
    end
    for k2, i in pairs(p2) do
        if p1[k2] ~= i then
            return false
        end
    end
    return true
end
return function(...) -- Line: 45 -- upvalues: Util (val), compare (val)
    local v1
    if Util.equalObjects(...) then
        return true
    end
    local v2 = select("#", ...)
    local v3 = select(1, ...)
    local v4 = v2
    local v5 = 1
    for i = 2, v4, v5 do
        v1 = select(i, ...)
        if not (compare(v3, v1)) then
            return false
        end
    end
    return true
end