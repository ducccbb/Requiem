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
--               File: ReplicatedStorage.Common.Network.Namespaces.Server
--                              Dumped in 0.000237 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {name = Parent.string, value = Parent.array(Parent.number("i16"))}
local HWPOnlaJ = Parent.store().struct({
    event = Parent.number("i8"),
    locked = Parent.number("i8"),
    cannonsSpawned = Parent.number("i8"),
    gearDisabled = Parent.number("i8"),
    deadzone = Parent.number("i8"),
    freeEscape = Parent.number("i8"),
    queue = Parent.number("i8"),
    queueInterval = Parent.number("i16"),
    latency = Parent.array(v2),
    networking = Parent.array(v2),
    name = Parent.string,
}).id("HWPOnlaJ")
local EpTC0gad = Parent.event().guard(Parent.number("i8")).id("EpTC0gad")
local HciHBa3s = Parent.event().guard(Parent.number("i8")).id("HciHBa3s")
local U79eolHJ = Parent.event().guard(Parent.number("i8")).id("U79eolHJ")
local v3 = Parent.event().guard(Parent.any).id("7yBShCSp")
return {
    Store = HWPOnlaJ,
    Event = EpTC0gad,
    Players = HciHBa3s,
    Queue = U79eolHJ,
    Frames = v3,
}