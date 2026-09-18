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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.ElementKind
--                              Dumped in 0.000344 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Symbol = require(v1.Parent.Symbol)
local strict = require(v1.Parent.strict)
local Portal = require(v1.Parent.Portal)
local u26 = newproxy(true)
local v3 = {
    Portal = Symbol.named("Portal"),
    Host = Symbol.named("Host"),
    Function = Symbol.named("Function"),
    Stateful = Symbol.named("Stateful"),
    Fragment = Symbol.named("Fragment"),
    of = function(p1) -- Line: 32 -- upvalues: u26 (val)
        if typeof(p1) ~= "table" then
            return nil
        end
        return p1[u26]
    end,
}
local u44 = {string = v3.Host}
u44["function"] = v3.Function
u44.table = v3.Stateful
function v3.fromComponent(p1) -- Line: 46 -- upvalues: Portal (val), u26 (val), u44 (val)
    if p1 == Portal then
        return u26.Portal
    end
    return u44[typeof(p1)]
end
getmetatable(u26).__index = v3
strict(v3, "ElementKind")
return u26