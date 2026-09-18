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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau
--                              Dumped in 0.000121 seconds
--                          Bytecode version 9  |  2 functions

local Symbol = require(script:WaitForChild("Symbol"))
local v1 = require(script:WaitForChild("Registry.global"))
local v2 = setmetatable({}, {
    __call = function(p1, p2) -- Line: 15 -- upvalues: Symbol (val)
        return Symbol.new(p2)
    end,
})
v2.for_ = v1.getOrInit
return v2