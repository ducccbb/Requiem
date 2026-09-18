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
--               File: ReplicatedStorage.Common.Network.Namespaces.Cannons
--                              Dumped in 0.000188 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = Parent.map(Parent.string, {ammo = Parent.number("i32")})
local LRcf4xRh = Parent.store().struct(v2).id("LRcf4xRh")
local sRdNqjE2 = Parent.event().guard(Parent.any).id("sRdNqjE2")
local IorVkrmb = Parent.event().guard(Parent.any).id("IorVkrmb")
local v0ZOW7Ik = Parent.event().guard(Parent.Vector3).id("v0ZOW7Ik")
return {
    CannonStates = LRcf4xRh,
    Event = sRdNqjE2,
    CannonballHit = IorVkrmb,
    DismountedFromCannon = Parent.event(),
    MountedCannonPivot = v0ZOW7Ik,
}