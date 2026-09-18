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
--      File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.findOr
--                              Dumped in 0.000336 seconds
--                          Bytecode version 9  |  2 functions

local u9 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p1, p2, p3) -- Line: 10 -- upvalues: u9 (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = utf8.offset(p1, p3 or 1)
    local v8 = {}
    local v9 = p2
    local v10 = nil
    local v11 = nil
    local v12 = p1
    for i, j in v9, v10, v11 do
        v6 = j:gsub(u9, "%%%1")
        v1, v2 = string.find(v12, v6, v7)
        if v1 then
            v3 = string.sub(v12, 1, v1 - 1)
            v4, v5 = utf8.len(v3)
            if v4 == nil then
                error(("string `%s` has an invalid byte at position %s"):format(v3, (tostring(v5))))
            end
            table.insert(v8, {index = v4 + 1, match = string.sub(v12, v1, v2)})
        end
    end
    if #v8 == 0 then
        return nil
    end
    v9 = nil
    v10 = v8
    v11 = nil
    local v13 = nil
    for k, n in v10, v11, v13 do
        if v9 == nil then
            v9 = n
        end
        if n.index < v9.index then
            v9 = n
        end
    end
    return v9
end