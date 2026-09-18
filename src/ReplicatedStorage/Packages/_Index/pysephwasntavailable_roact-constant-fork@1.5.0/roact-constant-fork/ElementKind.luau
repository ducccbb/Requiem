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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.ElementKind
--                              Dumped in 0.000217 seconds
--                          Bytecode version 9  |  3 functions

local Symbol = require(script.Parent.Symbol)
local strict = require(script.Parent.strict)
local Portal = require(script.Parent.Portal)
local u17 = newproxy(true)
local v1 = {
    Portal = Symbol.named("Portal"),
    Host = Symbol.named("Host"),
    Function = Symbol.named("Function"),
    Stateful = Symbol.named("Stateful"),
    Fragment = Symbol.named("Fragment"),
    of = function(p1) -- Line: 25 -- upvalues: u17 (val)
        if typeof(p1) ~= "table" then
            return nil
        end
        return p1[u17]
    end,
}
local u35 = {string = v1.Host}
u35["function"] = v1.Function
u35.table = v1.Stateful
function v1.fromComponent(p1) -- Line: 39 -- upvalues: Portal (val), u17 (val), u35 (val)
    if p1 == Portal then
        return u17.Portal
    end
    return u35[typeof(p1)]
end
getmetatable(u17).__index = v1
strict(v1, "ElementKind")
return u17