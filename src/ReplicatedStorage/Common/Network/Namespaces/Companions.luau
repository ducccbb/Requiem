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
--             File: ReplicatedStorage.Common.Network.Namespaces.Companions
--                              Dumped in 0.000326 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    type = Parent.number("i8"),
    id = Parent.number("i32"),
    name = Parent.string,
    age = Parent.number("f32"),
    gender = Parent.number("i8"),
    active = Parent.number("i8"),
    metadata = Parent.array(Parent.number("i16")),
    favorite = Parent.number("i8"),
    color = Parent.string,
}
local v3 = {male = Parent.number("i32"), female = Parent.number("i32")}
local v4 = {id = Parent.number("i32"), name = Parent.string}
local kQgcn2mk = Parent.store().struct(Parent.array(v2)).id("kQgcn2mk")
local j7nn8Fxr = Parent.event().guard(Parent.number("i32")).id("j7nn8Fxr")
local v5 = Parent.event().guard(Parent.number("i32")).id("2ybesMlu")
local w80QcAX5 = Parent.event().guard(v3).id("w80QcAX5")
local sqytYZcd = Parent.event().guard(Parent.any).id("sqytYZcd")
local WdSnHn8n = Parent.event().guard(v4).id("WdSnHn8n")
local v6 = Parent.event().guard(Parent.number("i32")).id("20Z4PxLS")
local iEdjNktb = Parent.event().guard(v2).id("iEdjNktb")
local v7 = Parent.event().guard(Parent.number("i32")).id("2F187Zm2")
local YsWCjNJN = Parent.event().guard(Parent.number("i32")).id("YsWCjNJN")
local tAHWXL7d = Parent.event().guard(Parent.number("i32")).id("tAHWXL7d")
return {
    Store = kQgcn2mk,
    Summon = j7nn8Fxr,
    Active = v5,
    Breed = w80QcAX5,
    Dismount = sqytYZcd,
    Mounted = iEdjNktb,
    Rename = WdSnHn8n,
    Release = v6,
    Trample = v7,
    Favorite = YsWCjNJN,
    HorseGait = tAHWXL7d,
}