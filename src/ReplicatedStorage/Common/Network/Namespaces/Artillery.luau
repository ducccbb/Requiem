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
--              File: ReplicatedStorage.Common.Network.Namespaces.Artillery
--                              Dumped in 0.000189 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = Parent.map(Parent.Model, {ammo = Parent.number("i32")})
local DpmreJsi = Parent.store().struct(v2).id("DpmreJsi")
local v3 = Parent.event().guard(Parent.any).id("0tCjFY50")
local The8swTa = Parent.event().guard(Parent.any).id("The8swTa")
local DIH9inB3 = Parent.event().guard(Parent.Vector3).id("DIH9inB3")
return {
    ArtilleryStates = DpmreJsi,
    Event = v3,
    ArtilleryballHit = The8swTa,
    DismountedFromArtillery = Parent.event(),
    MountedArtilleryPivot = DIH9inB3,
}