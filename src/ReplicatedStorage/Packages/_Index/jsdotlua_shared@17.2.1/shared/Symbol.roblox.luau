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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.Symbol.roblox
--                              Dumped in 0.000142 seconds
--                          Bytecode version 9  |  3 functions

return {
    named = function(p1) -- Line: 30
        local v1 = type(p1) == "string"
        assert(v1, "Symbols must be created using a string name!")
        local v2 = newproxy(true)
        local u17 = string.format("Symbol(%s)", p1)
        local v3 = getmetatable(v2)
        function v3.__tostring() -- Line: 37 -- upvalues: u17 (val)
            return u17
        end
        return v2
    end,
}