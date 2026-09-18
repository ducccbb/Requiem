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
--     File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.flatten
--                              Dumped in 0.000223 seconds
--                          Bytecode version 9  |  2 functions

local flatten
function flatten(p1, p2) -- Line: 24 -- upvalues: flatten (val)
    local v1, v2
    if type(p2) ~= "number" then
        v1 = (1 / 0)
    else
        v1 = p2
    end
    local v3 = {}
    for i, v in ipairs(p1) do
        if type(v) ~= "table" then
            table.insert(v3, v)
        elseif 0 < v1 then
            v2 = flatten(v, v1 - 1)
            for i2, i3 in ipairs(v2) do
                table.insert(v3, i3)
            end
        end
    end
    return v3
end
return flatten