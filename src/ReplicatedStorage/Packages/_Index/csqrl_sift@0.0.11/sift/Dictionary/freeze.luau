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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Dictionary.freeze
--                              Dumped in 0.0000973 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Types)
local copy = require(script.Parent.copy)
return function(p1) -- Line: 23 -- upvalues: copy (val)
    local v1 = copy(p1)
    table.freeze(v1)
    return v1
end