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
--File: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Registry.global
--                              Dumped in 0.000138 seconds
--                          Bytecode version 9  |  3 functions

local Symbol = require(script.Parent:WaitForChild("Symbol"))
local u8 = {}
return {
    getOrInit = function(p1) -- Line: 6 -- upvalues: u8 (ref), Symbol (val)
        if u8[p1] == nil then
            u8[p1] = Symbol.new(p1)
        end
        return u8[p1]
    end,
    __clear = function() -- Line: 14 -- upvalues: u8 (ref)
        u8 = {}
    end,
}