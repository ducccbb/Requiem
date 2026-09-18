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
--             File: ReplicatedStorage.Common.Network.Namespaces.Reputation
--                              Dumped in 0.000231 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = require(v1.Parent.Parent)
local Compressions = v1.Parent.Parent:WaitForChild("Compressions")
local Stores = Compressions:WaitForChild("Stores")
local Reputation = require(Stores:WaitForChild("Reputation"))
local v3 = {
    id = Parent.number("i32"),
    name = Parent.string,
    type = Parent.number("i8"),
    population = Parent.number("i32"),
    businesses = Parent.number("i32"),
    average_income = Parent.number("i32"),
    happiness = Parent.number("i32"),
    outlook = Parent.number("i32"),
    governor = Parent.number("i32"),
    civilian_tax = Parent.number("i32"),
    industrial_tax = Parent.number("i32"),
}
local v4 = {
    id = Parent.number("i32"),
    type = Parent.number("i32"),
    name = Parent.string,
    location = Parent.number("i32"),
    reputation = Parent.number("i32"),
}
local qpIYeUIs = Parent.store().struct(Parent.array({location = v3})).id("qpIYeUIs")
Parent.registerStoreCompressor(qpIYeUIs.seed, Reputation.compress, Reputation.decompress)
return {Store = qpIYeUIs}