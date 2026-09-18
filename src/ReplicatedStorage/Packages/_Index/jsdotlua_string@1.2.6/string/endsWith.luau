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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.endsWith
--                              Dumped in 0.000168 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 2
    local v1 = p2:len()
    if v1 == 0 then
        return true
    end
    local v2 = p1:len()
    local v3 = p3 or v2
    if v2 < v3 then
        v3 = v2
    end
    if v3 < 1 then
        return false
    end
    local v4 = v3 - v1 + 1
    local v5 = p1:find(p2, v4, true) == v4
    return v5
end