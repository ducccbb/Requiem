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
--                File: ReplicatedStorage.Common.Network.Namespaces.Gear
--                              Dumped in 0.000546 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {name = Parent.string, value = Parent.number("i32"), tinkers = Parent.array({name = Parent.string, value = Parent.number("i32")})}
local v3 = {component = Parent.string, tinker = Parent.string, value = Parent.number("i32")}
local v4 = {
    equipped = Parent.number("i8"),
    blades = Parent.number("i8"),
    gas = Parent.number("i8"),
    handles = Parent.number("i8"),
    integrity = Parent.number("i8"),
    durability = Parent.number("i8"),
    stock = Parent.number("i8"),
    health = Parent.number("i8"),
    stance = Parent.string,
    generation = Parent.number("i8"),
    components = Parent.map(Parent.string, v2),
}
local v5 = {
    goal = {x = Parent.number("f32"), y = Parent.number("f32"), z = Parent.number("f32")},
    side = Parent.string,
    enabled = Parent.number("i8"),
}
local v6 = {score = Parent.number("i32"), type = Parent.string}
local v7 = {difference = Parent.number("i8"), total = Parent.number("i8"), client = Parent.number("i8")}
local zWY0DiAv = Parent.store().struct(v4).id("zWY0DiAv")
local zjH8elLv = Parent.event().guard(Parent.number("i8")).id("zjH8elLv")
local IOXo2Dom = Parent.event().guard(Parent.number("i8")).id("IOXo2Dom")
local seWJklNB = Parent.event().guard(Parent.number("i8")).id("seWJklNB")
local OR1AYsVb = Parent.event().guard(v5).id("OR1AYsVb")
local hQC9KUmQ = Parent.event().guard(Parent.number("i32")).id("hQC9KUmQ")
local X9ix1TgL = Parent.event().guard(Parent.number("i8")).id("X9ix1TgL")
local h8Kefbal = Parent.event().guard(Parent.number("i8")).id("h8Kefbal")
local Sh0PGxCf = Parent.event().guard(v3).id("Sh0PGxCf")
local f9jBteh6 = Parent.event().guard(Parent.string).id("f9jBteh6")
local yKe6qxLc = Parent.event().guard(Parent.number("i8")).id("yKe6qxLc")
local B2vbPRnv = Parent.event().guard(v6).id("B2vbPRnv")
local v8 = Parent.event().guard(Parent.number("i8")).id("9imlCpSx")
local eIZIMBua = Parent.event().guard(Parent.number("i8")).id("eIZIMBua")
local uX28OpKy = Parent.event().guard(Parent.number("i8")).id("uX28OpKy")
local Y29RZqUS = Parent.event().guard(Parent.number("i8")).id("Y29RZqUS")
local ugx7GeCe = Parent.event().guard(v7).id("ugx7GeCe")
local FKicbKoY = Parent.event().guard(Parent.number("i8")).id("FKicbKoY")
local v9 = Parent.event().guard(Parent.any).id("7IqwLg0l")
local vKEA2n0h = Parent.event().guard(Parent.number("i8")).id("vKEA2n0h")
local wmN9t76q = Parent.event().guard(Parent.number("i8")).id("wmN9t76q")
local it1kZFIR = Parent.event().guard(Parent.any).id("it1kZFIR")
local y35wgqCJ = Parent.event().guard(Parent.any).id("y35wgqCJ")
return {
    Gear = zWY0DiAv,
    Holster = zjH8elLv,
    Blades = IOXo2Dom,
    Gas = seWJklNB,
    Grapple = OR1AYsVb,
    Swing = hQC9KUmQ,
    Damage = X9ix1TgL,
    Shake = h8Kefbal,
    Tinker = Sh0PGxCf,
    Upgrade = f9jBteh6,
    Remove = yKe6qxLc,
    Score = B2vbPRnv,
    Clash = v8,
    Parry = eIZIMBua,
    Refill = uX28OpKy,
    Refilled = Y29RZqUS,
    Refilling = ugx7GeCe,
    Sync = FKicbKoY,
    Repair = v9,
    SuccessfulParry = vKEA2n0h,
    ResetParryCooldown = wmN9t76q,
    Check = it1kZFIR,
    Ungrapple = y35wgqCJ,
}