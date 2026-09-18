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
--            File: ReplicatedStorage.Common.Network.Namespaces.Enchantments
--                              Dumped in 0.000352 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    hash = Parent.number("i32"),
    timestamp = Parent.number("f64"),
    cooldown = Parent.number("i16"),
    startup = Parent.number("f32"),
    keybind = Parent.number("i32"),
    hotbar = Parent.number("i8"),
    claimed = Parent.number("i8"),
    id = Parent.number("i32"),
    proficiency = Parent.number("i8"),
}
local v3 = {id = Parent.number("i32"), enchantments = Parent.array(Parent.string), excludesDuplicates = Parent.number("i8")}
local v4 = {name = Parent.string, keybind = Parent.number("i32")}
local v5 = {name = Parent.string}
local v6 = {name = Parent.string, packId = Parent.number("i32")}
local v7 = {name = Parent.string, added = Parent.number("i8"), value = Parent.any}
local ELpWqCAq = Parent.event().guard(Parent.string).id("ELpWqCAq")
local L436aRC0 = Parent.store().struct(Parent.array(v2)).id("L436aRC0")
local v8 = Parent.store().struct(Parent.array(v3)).id("0zJw1TpB")
local SlBqCnbG = Parent.event().guard(v4).id("SlBqCnbG")
local UVWxDVtW = Parent.event().guard(Parent.string).id("UVWxDVtW")
local VnI518bg = Parent.event().guard(v5).id("VnI518bg")
local v9 = Parent.event().guard(v6).id("422UQQRb")
local hghNB7SY = Parent.event().guard(Parent.number("i32")).id("hghNB7SY")
local MhLisoL3 = Parent.event().guard(Parent.string).id("MhLisoL3")
local I62Fs3ma = Parent.event().guard(Parent.string).id("I62Fs3ma")
local efhNGrk8 = Parent.event().guard(v7).id("efhNGrk8")
return {
    Activate = ELpWqCAq,
    Store = L436aRC0,
    UnclaimedStore = v8,
    Bind = SlBqCnbG,
    Request = UVWxDVtW,
    Animation = VnI518bg,
    Claim = v9,
    Open = hghNB7SY,
    Forsake = MhLisoL3,
    Burn = I62Fs3ma,
    Hotbar = efhNGrk8,
}