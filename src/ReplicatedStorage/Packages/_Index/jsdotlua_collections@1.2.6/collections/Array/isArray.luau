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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Array.isArray
--                              Dumped in 0.000236 seconds
--                          Bytecode version 9  |  2 functions

return function(p1) -- Line: 2
    if typeof(p1) ~= "table" then
        return false
    end
    if next(p1) == nil then
        return true
    end
    if #p1 == 0 then
        return false
    end
    local v1 = 0
    local v2 = 0
    for k in pairs(p1) do
        if typeof(k) ~= "number" then
            return false
        end
        if k % 1 == 0 and k >= 1 then
            v1 = v1 + 1
            v2 = v2 + k
            continue
        end
        return false
    end
    local v3 = v2 == v1 * (v1 + 1) / 2
    return v3
end