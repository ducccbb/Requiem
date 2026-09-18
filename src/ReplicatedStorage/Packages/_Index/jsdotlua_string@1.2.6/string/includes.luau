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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.includes
--                              Dumped in 0.000265 seconds
--                          Bytecode version 9  |  2 functions

local u9 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p1, p2, p3) -- Line: 6 -- upvalues: u9 (val)
    local v1, v2
    v1, v2 = utf8.len(p1)
    local v3 = v1 ~= nil
    assert(v3, ("string `%s` has an invalid byte at position %s"):format(p1, (tostring(v2))))
    if v1 == 0 then
        return false
    end
    if #p2 == 0 then
        return true
    end
    local v4 = 1
    if p3 == nil then
        if v4 < 1 then
            v4 = 1
        end
        v3 = utf8.offset(p1, v4)
        local v5 = p2:gsub(u9, "%%%1")
        local v6 = string.find(p1, v5, v3)
        local v7 = v6 ~= nil
        return v7
    else
        v4 = tonumber(p3) or 1
        if v1 < v4 then
            return false
        end
    end
end