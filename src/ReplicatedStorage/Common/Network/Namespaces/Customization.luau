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
--            File: ReplicatedStorage.Common.Network.Namespaces.Customization
--                              Dumped in 0.000333 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {conversation = Parent.array(Parent.string), customizing = Parent.boolean}
local v3 = {
    eyebrows = Parent.number("i8"),
    mouth = Parent.number("i8"),
    complexion = Parent.number("f32"),
    face_height = Parent.number("f32"),
    burns = Parent.number("i8"),
    freckles = Parent.number("i8"),
    moles = Parent.number("i8"),
    scars = Parent.number("i8"),
    shirt = Parent.string,
    pants = Parent.string,
    hair = {r = Parent.number("i16"), g = Parent.number("i16"), b = Parent.number("i16")},
    eyes = {
        variant = Parent.number("i8"),
        frame = Parent.number("i8"),
        color = {r = Parent.number("i16"), g = Parent.number("i16"), b = Parent.number("i16")},
    },
}
local D6xcZ3yV = Parent.event().guard({message = Parent.string}).id("D6xcZ3yV")
local NjTiU4EO = Parent.store().struct(v2).id("NjTiU4EO")
local v4 = Parent.event().guard(v3).id("4s2LN96B")
local pfYkpItB = Parent.event().guard(Parent.string).id("pfYkpItB")
local B0YCDBWu = Parent.event().guard(Parent.string).id("B0YCDBWu")
local YbQ7C3cs = Parent.event().guard(Parent.string).id("YbQ7C3cs")
return {
    Converse = D6xcZ3yV,
    Store = NjTiU4EO,
    Submit = v4,
    Shirt = pfYkpItB,
    Pants = B0YCDBWu,
    Accessory = YbQ7C3cs,
}