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
--    File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.concatDeep
--                              Dumped in 0.000230 seconds
--                          Bytecode version 9  |  2 functions

local copyDeep = require(script.Parent.copyDeep)
local None = require(script.Parent.Parent.None)
return function(...) -- Line: 28 -- upvalues: None (val), copyDeep (val)
    local v1
    local v2 = {}
    local v3 = select("#", ...)
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = select(i, ...)
        if type(v1) == "table" then
            for i2, v in ipairs(v1) do
                if v ~= None then
                    if type(v) ~= "table" then
                        table.insert(v2, v)
                    else
                        table.insert(v2, copyDeep(v))
                    end
                end
            end
        end
    end
    return v2
end