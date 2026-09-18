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
--           File: ReplicatedStorage.Common.Utilities.Ripple.solvers.immediate
--                              Dumped in 0.000189 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
require(v1.Parent.Parent.types)
local intermediate = require(v1.Parent.Parent.utils.intermediate)
return function(p1) -- Line: 11 -- upvalues: intermediate (val)
    local u4 = intermediate.to(p1)
    return function(p1, p2) -- Line: 14 -- upvalues: intermediate (upval), u4 (val)
        local v1 = intermediate.index(u4, p1)
        if not v1 then
            return false
        end
        p2.complete = true
        p2.value = v1
    end
end