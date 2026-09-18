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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.forwardRef
--                              Dumped in 0.000204 seconds
--                          Bytecode version 9  |  3 functions

local assign = require(script.Parent.assign)
local None = require(script.Parent.None)
local Ref = require(script.Parent.PropMarkers.Ref)
local u22 = require(script.Parent.GlobalConfig).get()
local u23 = {}
u23[Ref] = None
return function(p1) -- Line: 15 -- upvalues: u22 (val), Ref (val), assign (val), u23 (val)
    local v1
    if u22.typeChecks then
        v1 = typeof(p1) == "function"
        assert(v1, "Expected arg #1 to be a function")
    end
    return function(a1) -- Line: 20 -- upvalues: Ref (upval), assign (upval), u23 (upval), p1 (val)
        local v1 = a1[Ref]
        local v2 = assign({}, a1, u23)
        return p1(v2, v1)
    end
end