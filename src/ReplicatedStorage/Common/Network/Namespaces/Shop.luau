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
--                File: ReplicatedStorage.Common.Network.Namespaces.Shop
--                              Dumped in 0.000266 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    name = Parent.string,
    price = Parent.number("i32"),
    tags = Parent.array(Parent.string),
    id = Parent.number("i32"),
    meta = Parent.array(Parent.number("i16")),
}
local v3 = {id = Parent.number("i32"), offset = Parent.number("i32"), amount = Parent.number("i8")}
local v4 = {buybackMarcs = Parent.number("i32"), sellUnitHints = Parent.array({name = Parent.string, unit = Parent.number("i32")})}
local TetUUaeL = Parent.store().struct(Parent.array(v2)).id("TetUUaeL")
Parent.store():id("Shop.MerchantSession")
local xecoyK3O = Parent.store().struct(v4).id("xecoyK3O")
local xsRUBg3a = Parent.event().guard(v2).id("xsRUBg3a")
local WTWhF50j = Parent.event().guard(v3).id("WTWhF50j")
local v5 = Parent.event().guard(Parent.array(v3)).id("681unYag")
return {
    Store = TetUUaeL,
    MerchantSession = xecoyK3O,
    Purchase = xsRUBg3a,
    Sell = WTWhF50j,
    SellMany = v5,
}