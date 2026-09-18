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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.merge
--                              Dumped in 0.000209 seconds
--                          Bytecode version 9  |  2 functions

local None = require(script.Parent.Parent.None)
return function(...) -- Line: 27 -- upvalues: None (val)
    local v1, v2
    local v3 = {}
    local v4 = select("#", ...)
    local v5 = 1
    for i = 1, v4, v5 do
        v2 = select(i, ...)
        if type(v2) == "table" then
            for k, v in pairs(v2) do
                if v ~= None then
                    v1 = v
                else
                    v1 = nil
                end
                v3[k] = v1
            end
        end
    end
    return v3
end