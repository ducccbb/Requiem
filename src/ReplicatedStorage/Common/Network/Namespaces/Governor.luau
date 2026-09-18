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
--              File: ReplicatedStorage.Common.Network.Namespaces.Governor
--                              Dumped in 0.000203 seconds
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
    governor = Parent.number("i32"),
    population = Parent.number("i32"),
    businesses = Parent.number("i32"),
    average_income = Parent.number("i32"),
    happiness = Parent.number("i32"),
    outlook = Parent.number("i32"),
    civilian_tax = Parent.number("i32"),
    industrial_tax = Parent.number("i32"),
    id = Parent.number("i32"),
    treasury = Parent.number("i32"),
    employment_rate = Parent.number("i32"),
    cost_of_living = Parent.number("i32"),
    business_income = Parent.number("i32"),
}
local WOmsat6F = Parent.event().guard({unique = Parent.number("i32"), value = Parent.number("i32"), location = Parent.number("i32")}).id("WOmsat6F")
local XdKRGEVQ = Parent.store().struct(Parent.array(v2)).id("XdKRGEVQ")
return {Store = XdKRGEVQ, Update = WOmsat6F}