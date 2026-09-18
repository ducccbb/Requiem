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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.6.number.toExponential
--                              Dumped in 0.000233 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2) -- Line: 3
    local v1
    local v2 = if typeof(p1) == "string" then tonumber(p1) or (0 / 0) else p1
    if typeof(v2) ~= "number" then
        return "nan"
    end
    if p2 ~= nil then
        if typeof(p2) ~= "number" then
            error("TypeError: fractionDigits must be a number between 0 and 100")
        end
        if p2 < 0 then
            error("RangeError: fractionDigits must be between 0 and 100")
        elseif 100 < p2 then
            error("RangeError: fractionDigits must be between 0 and 100")
        end
    end
    if p2 ~= nil then
        v1 = "%." .. tostring(p2) .. "e"
    else
        v1 = "%e"
    end
    local v3 = string.format(v1, v2)
    v3 = v3:gsub("%+0", "+")
    v3 = v3:gsub("%-0", "-")
    return (v3:gsub("0*e", "e"))
end