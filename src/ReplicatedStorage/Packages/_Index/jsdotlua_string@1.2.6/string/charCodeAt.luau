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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.charCodeAt
--                              Dumped in 0.000239 seconds
--                          Bytecode version 9  |  2 functions

local NaN = require(script.Parent.Parent:WaitForChild("number")).NaN
return function(p1, p2) -- Line: 8 -- upvalues: NaN (val)
    local v1
    if type(p2) == "number" then
        v1 = p2
    else
        v1 = 1
    end
    local v2 = string.len(p1)
    if v1 < 1 or v2 < v1 then
        return NaN
    end
    local v3 = utf8.offset(p1, v1)
    if v3 == nil or v2 < v3 then
        return NaN
    end
    local v4 = utf8.codepoint(p1, v3, v3)
    if v4 == nil then
        return NaN
    end
    return v4
end