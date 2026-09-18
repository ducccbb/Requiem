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
--               File: ReplicatedStorage.Common.Network.Namespaces.Animal
--                              Dumped in 0.000289 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    id = Parent.number("i32"),
    variant = Parent.string,
    scale = Parent.number("i8"),
    height = Parent.number("i16"),
    state = Parent.number("i8"),
    nearestPlayers = Parent.array(Parent.number("i8")),
}
local v3 = {id = Parent.number("i32"), ownership = Parent.number("i8")}
local ndcChntE = Parent.event().guard(v2).id("ndcChntE")
local SEWkJ4mE = Parent.event().guard(Parent.array(v2)).id("SEWkJ4mE")
local U6NNfAC4 = Parent.event().guard(v2).id("U6NNfAC4")
local GmSNJCaL = Parent.event().guard(v3).id("GmSNJCaL")
local v4 = Parent.event().guard(Parent.number("i32")).id("9XYfC2am")
local v5 = Parent.event().guard(Parent.any).id("56DTyFtw")
local v6 = Parent.event().guard(Parent.any).id("38R0OqCE")
local Hux0nf0O = Parent.event().guard(Parent.any).id("Hux0nf0O")
local AIYQY1Kv = Parent.event().guard(Parent.any).id("AIYQY1Kv")
local QNC4JJrf = Parent.event().guard(Parent.any).id("QNC4JJrf")
local v7 = Parent.event().guard(Parent.number("i32")).id("0CdoWNQj")
local POssJRT1 = Parent.event().guard(Parent.number("i32")).id("POssJRT1")
return {
    Event = ndcChntE,
    Batch = SEWkJ4mE,
    Create = U6NNfAC4,
    Ownership = GmSNJCaL,
    State = v4,
    Respond = v5,
    Animate = v6,
    Action = Hux0nf0O,
    ProximityUpdate = AIYQY1Kv,
    StateUpdate = QNC4JJrf,
    Destroy = v7,
    Skinned = POssJRT1,
}