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
--      File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.update
--                              Dumped in 0.000235 seconds
--                          Bytecode version 9  |  3 functions

local Util = require(script.Parent.Parent.Util)
local copy = require(script.Parent.copy)
local function call(p1, p2) -- Line: 10
    if type(p1) == "function" then
        return p1(p2)
    end
end
return function(p1, p2, p3, p4) -- Line: 44 -- upvalues: copy (val), Util (val)
    local returned, v1, v2
    local v3 = copy(p1)
    if p2 >= 1 then
        v1 = p2
    else
        v1 = p2 + #p1
    end
    if type(p3) ~= "function" then
        returned = Util.func.returned
    else
        returned = p3
    end
    if v3[v1] ~= nil then
        v3[v1] = returned(v3[v1], v1)
        return v3
    end
    if type(p4) ~= "function" then
        v2 = nil
    else
        v2 = p4(v1)
    end
    v3[v1] = v2
    return v3
end