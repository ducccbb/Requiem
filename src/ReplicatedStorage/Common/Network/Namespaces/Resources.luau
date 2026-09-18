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
--              File: ReplicatedStorage.Common.Network.Namespaces.Resources
--                              Dumped in 0.000356 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    loaded = Parent.number("i8"),
    selected = Parent.array({name = Parent.string, amount = Parent.number("i32"), max_amount = Parent.number("i32")}),
    factories = Parent.array({
        id = Parent.number("i32"),
        name = Parent.string,
        location_id = Parent.number("i32"),
        rate = Parent.number("i32"),
        item_type = Parent.string,
        amount = Parent.number("i32"),
        base_price = Parent.number("i32"),
        current_price = Parent.number("i32"),
        supply_threshold = Parent.number("i32"),
        supply_influence = Parent.number("i32"),
        profit = Parent.number("i32"),
        maximum_supply = Parent.number("i32"),
    }),
    locations = Parent.array(Parent.string),
    selected_location = Parent.any,
}
local v3 = {
    name = Parent.string,
    resource = Parent.string,
    rate = Parent.number("i32"),
    price = Parent.number("i32"),
    supplyThreshold = Parent.number("i32"),
    supplyInfluence = Parent.number("i32"),
    maximumSupply = Parent.number("i32"),
}
local v4 = {
    name = Parent.string,
    id = Parent.number("i32"),
    rate = Parent.number("i32"),
    price = Parent.number("i32"),
    supplyThreshold = Parent.number("i32"),
    supplyInfluence = Parent.number("i32"),
    maximumSupply = Parent.number("i32"),
}
local v5 = {id = Parent.number("i32")}
local v6 = {factory_id = Parent.number("i32"), amount = Parent.number("i32"), treasury_id = Parent.number("i32")}
local n4ICcV2u = Parent.store().struct(v2).id("n4ICcV2u")
local ybu8M3Si = Parent.event().guard({location = Parent.string}).id("ybu8M3Si")
local L5KW0YzF = Parent.event().guard(v3).id("L5KW0YzF")
local S2U6Yf9K = Parent.event().guard(v4).id("S2U6Yf9K")
local vomhiYvu = Parent.event().guard(v5).id("vomhiYvu")
local xjbmLbwn = Parent.event().guard(v6).id("xjbmLbwn")
return {
    Store = n4ICcV2u,
    Select = ybu8M3Si,
    Create = L5KW0YzF,
    Edit = S2U6Yf9K,
    Delete = vomhiYvu,
    Purchase = xjbmLbwn,
}