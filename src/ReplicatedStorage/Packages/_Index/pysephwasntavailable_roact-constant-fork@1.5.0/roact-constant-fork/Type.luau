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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Type
--                              Dumped in 0.000217 seconds
--                          Bytecode version 9  |  4 functions

local Symbol = require(script.Parent.Symbol)
local strict = require(script.Parent.strict)
local u12 = newproxy(true)
local u13 = {}
local function addType(p1) -- Line: 19 -- upvalues: u13 (val), Symbol (val)
    u13[p1] = Symbol.named("Roact" .. p1)
end
u13.Binding = Symbol.named("RoactBinding")
u13.Element = Symbol.named("RoactElement")
u13.HostChangeEvent = Symbol.named("RoactHostChangeEvent")
u13.HostEvent = Symbol.named("RoactHostEvent")
u13.StatefulComponentClass = Symbol.named("RoactStatefulComponentClass")
u13.StatefulComponentInstance = Symbol.named("RoactStatefulComponentInstance")
u13.VirtualNode = Symbol.named("RoactVirtualNode")
u13.VirtualTree = Symbol.named("RoactVirtualTree")
function u13.of(p1) -- Line: 32 -- upvalues: u12 (val)
    if typeof(p1) ~= "table" then
        return nil
    end
    return p1[u12]
end
getmetatable(u12).__index = u13
local v1 = getmetatable(u12)
function v1.__tostring() -- Line: 42
    return "RoactType"
end
strict(u13, "Type")
return u12