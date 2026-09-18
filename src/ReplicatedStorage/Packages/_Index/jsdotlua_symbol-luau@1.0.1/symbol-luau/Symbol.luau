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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Symbol
--                              Dumped in 0.000189 seconds
--                          Bytecode version 9  |  3 functions

return {
    new = function(p1) -- Line: 15
        local v1 = newproxy(true)
        local u10 = if p1 then ("Symbol(%s)"):format(p1) else "Symbol()"
        local v2 = getmetatable(v1)
        function v2.__tostring() -- Line: 23 -- upvalues: u10 (ref)
            return u10
        end
        return v1
    end,
}