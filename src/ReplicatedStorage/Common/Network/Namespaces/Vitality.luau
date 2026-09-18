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
--              File: ReplicatedStorage.Common.Network.Namespaces.Vitality
--                              Dumped in 0.000458 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    health = Parent.number("i16"),
    maxHealth = Parent.number("i16"),
    thirst = Parent.number("i16"),
    hunger = Parent.number("i16"),
    maxThirst = Parent.number("i16"),
    maxHunger = Parent.number("i16"),
    maxWeight = Parent.number("i16"),
    weight = Parent.number("i16"),
    stamina = Parent.number("i16"),
    temperature = Parent.number("i16"),
    exhaustion = Parent.number("i16"),
    dead = Parent.number("i8"),
    wiped = Parent.number("i8"),
    knocked = Parent.number("i8"),
    limbs = Parent.array({
        name = Parent.string,
        health = Parent.number("i16"),
        pain = Parent.number("i16"),
        infection = Parent.number("i8"),
        bandages = Parent.array(Parent.number("f32")),
        bleeding = Parent.number("f32"),
        log = Parent.array({type = Parent.string, time = Parent.number("f32"), infected = Parent.number("i8"), bandaged = Parent.number("i8")}),
        missing = {missing = Parent.number("i8"), bleeding = Parent.number("i8"), bandaged = Parent.number("i8"), timestamp = Parent.number("f32")},
    }),
}
local v3 = {amount = Parent.number("i16"), key = Parent.string, maxTemperature = Parent.number("i16")}
local v4 = {reason = Parent.string, amount = Parent.number("i16")}
local v5 = {id = Parent.string, length = Parent.number("i32")}
local cUYat8Ug = Parent.store().struct(v2).id("cUYat8Ug")
cUYat8Ug.defer()
local vTkI8KFX = Parent.event().guard(v5).id("vTkI8KFX")
local v6 = Parent.event().guard(Parent.number("i8")).id("599pNnU6")
local CNO2sTu6 = Parent.event().guard(Parent.string).id("CNO2sTu6")
local qmrvQfsY = Parent.event().guard(Parent.number("i8")).id("qmrvQfsY")
local V3XNxRHX = Parent.event().guard(v4).id("V3XNxRHX")
local CWd4km71 = Parent.event().guard(Parent.any).id("CWd4km71")
local v7 = Parent.event().guard(Parent.any).id("5lKHvwxp")
local JNxJjN4q = Parent.event().guard(Parent.any).id("JNxJjN4q")
local wScHPY8z = Parent.event().guard(Parent.any).id("wScHPY8z")
local nUfNTyN9 = Parent.event().guard(Parent.any).id("nUfNTyN9")
local lT8N9EmI = Parent.event().guard(Parent.any).id("lT8N9EmI")
local v8 = Parent.event().guard(Parent.any).id("35tDIC4C")
local AC1RjLgO = Parent.event().guard(Parent.any).id("AC1RjLgO")
return {
    Store = cUYat8Ug,
    Respawn = v6,
    Temperature = CNO2sTu6,
    Ragdoll = qmrvQfsY,
    Inflict = V3XNxRHX,
    Cold = CWd4km71,
    Remenants = v7,
    Recustomize = wScHPY8z,
    Wipe = JNxJjN4q,
    Buff = vTkI8KFX,
    Blood = nUfNTyN9,
    Breath = lT8N9EmI,
    Drown = v8,
    WaterEntry = AC1RjLgO,
}