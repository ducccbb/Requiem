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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.startsWith
--                              Dumped in 0.000164 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 2
    local v1
    if string.len(p2) == 0 then
        return true
    end
    if p3 == nil then
        v1 = 1
    elseif p3 >= 1 then
        v1 = p3
    else
        v1 = 1
    end
    if string.len(p1) < v1 then
        return false
    end
    local v2 = p1:find(p2, v1, true) == v1
    return v2
end