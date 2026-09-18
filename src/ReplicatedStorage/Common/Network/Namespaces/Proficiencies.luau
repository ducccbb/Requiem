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
--            File: ReplicatedStorage.Common.Network.Namespaces.Proficiencies
--                              Dumped in 0.000495 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    cooldown = Parent.number("i8"),
    keybind = Parent.number("i8"),
    startup = Parent.number("i8"),
    hasCooldown = Parent.number("i8"),
    hotbar = Parent.any,
}
local v3 = {name = Parent.string, node = Parent.string, keybind = Parent.number("i32")}
local v4 = {name = Parent.string, node = Parent.string}
local v5 = {name = Parent.string, node = Parent.string, added = Parent.number("i8"), value = Parent.any}
local v6 = {name = Parent.string, node = Parent.string}
local v7 = {
    meta = Parent.map(Parent.string, v2),
    keybinds = Parent.map(Parent.string, Parent.number("i32")),
    hotbars = Parent.map(Parent.string, Parent.number("i8")),
    unlocked = Parent.array(Parent.string),
    name = Parent.string,
    points = Parent.number("i8"),
    experience = Parent.number("f32"),
    level = Parent.number("i16"),
}
local v8 = {name = Parent.string}
local v9 = {id = Parent.number("i32"), name = Parent.string, node = Parent.string}
local v10 = {id = Parent.number("i32"), onCooldown = Parent.number("i8"), remaining = Parent.number("f32")}
local hR7wkiGr = Parent.event().guard(Parent.string).id("hR7wkiGr")
local y5cwodYZ = Parent.event().guard(v3).id("y5cwodYZ")
local ZIkpCGtj = Parent.event().guard(v4).id("ZIkpCGtj")
local nXAiXLxK = Parent.event().guard(v5).id("nXAiXLxK")
local v11 = Parent.event().guard(v6).id("99WGwoFB")
local RmoYCeeY = Parent.event().guard(v8).id("RmoYCeeY")
local MVra3jBK = Parent.event().guard(v9).id("MVra3jBK")
local v12 = Parent.event().guard(v10).id("0bHWadx2")
local MsNTEyVy = Parent.store().struct(Parent.array(v7)).id("MsNTEyVy")
local LzffLCbu = Parent.event().guard(Parent.any).id("LzffLCbu")
return {
    Store = MsNTEyVy,
    Unlock = hR7wkiGr,
    Bind = y5cwodYZ,
    Activate = ZIkpCGtj,
    Hotbar = nXAiXLxK,
    Request = v11,
    Primary = RmoYCeeY,
    Cooldown = MVra3jBK,
    CooldownResult = v12,
    Eradicate = LzffLCbu,
}