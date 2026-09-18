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
--      File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.substr
--                              Dumped in 0.000182 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 2
    if not p3 then
        local v1
        if not p3 then
            v1 = nil
        else
            v1 = p2 + p3 - 1
            if not v1 then
                v1 = nil
            end
        end
        return (string.sub(p1, p2, v1))
    elseif p3 <= 0 then
        return ""
    end
end