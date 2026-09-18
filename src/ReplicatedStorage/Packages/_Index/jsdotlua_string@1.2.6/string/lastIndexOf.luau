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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.lastIndexOf
--                              Dumped in 0.000228 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 2
    local v1, v2, v3, v4
    local v5 = string.len(p1)
    if not p3 then
        v1 = v5
    else
        v1 = p3
    end
    if p3 and p3 < 1 then
        v1 = 1
    end
    if p3 and v5 < p3 then
        v1 = v5
    end
    if p2 == "" then
        return v1
    end
    local v6 = nil
    local v7 = 0
    while true do
        v2 = v6
        v3, v4 = string.find(p1, p2, v7 + 1, true)
        v6 = v3
        v7 = v4
        if v6 == nil or v1 < v6 then
            break
        end
    end
    if v2 == nil then
        return -1
    end
    return v2
end