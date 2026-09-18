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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.indexOf
--                              Dumped in 0.000229 seconds
--                          Bytecode version 9  |  2 functions

local u9 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p1, p2, p3) -- Line: 9 -- upvalues: u9 (val)
    local v1
    local v2 = #p1
    if p3 == nil then
        v1 = 1
    elseif p3 >= 1 then
        v1 = p3
    else
        v1 = 1
    end
    if #p2 == 0 then
        if v2 < v1 then
            return v2
        end
        return v1
    end
    if v2 < v1 then
        return -1
    end
    local v3 = p2:gsub(u9, "%%%1")
    local v4 = v2
    local v5 = 1
    for i = v1, v4, v5 do
        if string.sub(p1, i, i + #v3 - 1) == v3 then
            return i
        end
    end
    return -1
end