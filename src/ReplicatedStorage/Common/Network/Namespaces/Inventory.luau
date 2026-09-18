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
--              File: ReplicatedStorage.Common.Network.Namespaces.Inventory
--                              Dumped in 0.000641 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {item = Parent.string, amount = Parent.number("i8")}
local v3 = {
    category = Parent.array(Parent.string),
    results = Parent.string,
    type = Parent.string,
    requirements = Parent.array(v2),
    amount = Parent.number("i8"),
    speed = Parent.number("f32"),
    merge_tags = Parent.boolean,
}
local v4 = {
    index = Parent.array(v3),
    selected = {
        category = Parent.array(Parent.string),
        results = Parent.string,
        type = Parent.string,
        requirements = Parent.array(v2),
        settings = {time = Parent.number("f32")},
        amount = Parent.number("i8"),
        speed = Parent.number("f32"),
    },
}
local v5 = {hash = Parent.number("i32"), offset = Parent.number("i32"), success = Parent.number("i8")}
local v6 = {recipe = Parent.array(v3), success = Parent.number("i8")}
local v7 = {item = Parent.array(ItemType), success = Parent.number("i8")}
local v8 = {item = Parent.array(v3)}
local v9 = {
    id = Parent.number("i32"),
    hotbar = Parent.number("i8"),
    offset = Parent.number("i32"),
    y = Parent.number("i8"),
    stack = Parent.number("i8"),
    meta = Parent.array(Parent.number("i8")),
    tags = Parent.array(Parent.number("i8")),
}
local v10 = Parent.array(Parent.number("i8"))
local v11 = {
    target = {hash = Parent.number("i32"), offset = Parent.number("i32")},
    goal = {hash = Parent.number("i32"), offset = Parent.number("i32")},
}
local v12 = {action = Parent.number("i8"), hash = Parent.number("i32"), offset = Parent.number("i32"), data = Parent.array(Parent.number("i32"))}
local v13 = {slot = Parent.number("i8"), hash = Parent.number("i32"), offset = Parent.number("i32")}
local v14 = {hash = Parent.number("i32"), offset = Parent.number("i32")}
local v15 = {hash = Parent.number("i32"), offset = Parent.number("i32")}
local v16 = {hash = Parent.number("i32"), offset = Parent.number("i32")}
local v17 = {hash = Parent.number("i32"), offset = Parent.number("i32"), id = Parent.number("i32"), request = Parent.string}
local v18 = {id = Parent.number("i32"), items = Parent.array(v9)}
local WwlGmGGh = Parent.store().struct(Parent.array(v9)).id("WwlGmGGh")
local v19 = Parent.store().struct(v15).id("3NUA9Gxp")
local v20 = Parent.store().struct(v4).id("6HUcC5zV")
local v21 = Parent.store().struct(v18).id("3siWC8uX")
local PV2OIhh0 = Parent.event().guard(v10).id("PV2OIhh0")
local fQDKGkMd = Parent.event().guard(v11).id("fQDKGkMd")
local mMp0WwnK = Parent.event().guard(v12).id("mMp0WwnK")
local Tx6ofWAb = Parent.event().guard(Parent.array(v13)).id("Tx6ofWAb")
local db9OpIdl = Parent.event().guard(v14).id("db9OpIdl")
local JLxWotg0 = Parent.event().guard(Parent.number("i8")).id("JLxWotg0")
local Ol9UZkLa = Parent.event().guard(v5).id("Ol9UZkLa")
local v22 = Parent.event().guard(v6).id("22cOj7Vo")
local KUG8QTTD = Parent.event().guard(v7).id("KUG8QTTD")
local Fxu07sMG = Parent.event().guard(v8).id("Fxu07sMG")
local jgdpzGBt = Parent.event().guard(Parent.number("i32")).id("jgdpzGBt")
local pjngtIIk = Parent.event().guard(v16).id("pjngtIIk")
local GTpacSuT = Parent.event().guard(v17).id("GTpacSuT")
local v23 = Parent.event().guard(v15).id("4T147UEc")
return {
    Store = WwlGmGGh,
    Container = v21,
    Reposition = PV2OIhh0,
    Merge = fQDKGkMd,
    Action = mMp0WwnK,
    Hotbar = Tx6ofWAb,
    Equip = db9OpIdl,
    Tool = v19,
    Recipes = v20,
    Index = JLxWotg0,
    Forge = Ol9UZkLa,
    Smith = v22,
    Refine = KUG8QTTD,
    Craft = Fxu07sMG,
    Use = jgdpzGBt,
    Drop = pjngtIIk,
    Request = GTpacSuT,
    Loot = v23,
}