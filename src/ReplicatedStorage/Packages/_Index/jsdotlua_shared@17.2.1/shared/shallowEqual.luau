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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.shallowEqual
--                              Dumped in 0.000219 seconds
--                          Bytecode version 9  |  2 functions

local objectIs = require(script.Parent:WaitForChild("objectIs"))
return function(p1, p2) -- Line: 18 -- upvalues: objectIs (val)
    if objectIs(p1, p2) then
        return true
    end
    if typeof(p1) ~= "table" or p1 == nil or typeof(p2) ~= "table" or p2 == nil then
        return false
    end
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if not (objectIs(p2[i], j)) then
            return false
        end
    end
    v1 = p2
    v2 = nil
    v3 = nil
    for k, n in v1, v2, v3 do
        if not (objectIs(p1[k], n)) then
            return false
        end
    end
    return true
end