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
--      File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.slice
--                              Dumped in 0.000240 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 2
    local v1, v2
    v1, v2 = utf8.len(p1)
    local v3 = v1 ~= nil
    assert(v3, ("string `%s` has an invalid byte at position %s"):format(p1, (tostring(v2))))
    local v4 = tonumber(p2)
    local v5 = typeof(v4) == "number"
    assert(v5, "startIndexStr should be a number")
    if v4 + v1 < 0 then
        v4 = 1
    end
    if v1 < v4 then
        return ""
    end
    v3 = if p3 ~= nil then tonumber(p3) or (0 / 0) else v1 + 1
    local v6 = typeof(v3) == "number"
    assert(v6, "lastIndexStr should convert to number")
    if v1 < v3 then
        v3 = v1 + 1
    end
    v5 = utf8.offset(p1, v4)
    return (string.sub(p1, v5, utf8.offset(p1, v3) - 1))
end