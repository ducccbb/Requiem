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
--   File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.Dictionary.join
--                              Dumped in 0.000240 seconds
--                          Bytecode version 9  |  2 functions

local None = require(script.Parent.Parent.None)
return function(...) -- Line: 12 -- upvalues: None (val)
    local v1, v2
    local v3 = select("#", ...)
    if v3 == 0 then
        return {}
    end
    if v3 == 1 then
        v1 = table.clone(...)
        setmetatable(v1, nil)
        return v1
    end
    v1 = table.clone(select(1, ...))
    setmetatable(v1, nil)
    local v4 = v3
    local v5 = 1
    for i = 2, v4, v5 do
        v2 = select(i, ...)
        for k, v in pairs(v2) do
            if v ~= None then
                v1[k] = v
            else
                v1[k] = nil
            end
        end
    end
    return v1
end