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
--              File: ReplicatedStorage.Common.Network.Namespaces.Treasury
--                              Dumped in 0.000411 seconds
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
    ownerCharacter = Parent.string,
    ownerCharacterName = Parent.string,
    marcs = Parent.number("i32"),
    treasuryID = Parent.number("i8"),
    access = Parent.array({
        characterId = Parent.string,
        characterName = Parent.string,
        withdraw_item_limit = Parent.number("i32"),
        withdraw_marc_limit = Parent.number("i32"),
        joinDate = Parent.string,
    }),
    income = Parent.array({
        UniqueID = Parent.number("i32"),
        TreasuryID = Parent.number("i32"),
        type = Parent.number("i8"),
        level = Parent.number("i16"),
        timeLastClaimed = Parent.number("f64"),
        timeCreated = Parent.string,
    }),
    audits = Parent.array({
        actionID = Parent.number("i8"),
        detail = Parent.number("i32"),
        characterId = Parent.string,
        characterName = Parent.string,
        reason = Parent.string,
        timestamp = Parent.string,
    }),
}
local v3 = {key = Parent.number("i8")}
local v4 = {characterId = Parent.string, treasury = Parent.number("i32")}
local v5 = {characterId = Parent.string, treasury = Parent.number("i32")}
local v6 = {treasury = Parent.number("i32"), amount = Parent.number("i32"), reason = Parent.string}
local v7 = {treasury = Parent.number("i32"), source = Parent.number("i32")}
local v8 = {characterId = Parent.string, treasury = Parent.number("i32"), withdraw = Parent.number("i8")}
local T8uFEsSz = Parent.event().guard({treasury = Parent.number("i8")}).id("T8uFEsSz")
local EAkpl3XF = Parent.event().guard(v3).id("EAkpl3XF")
local qLUnkMzV = Parent.event().guard({treasury = Parent.number("i8")}).id("qLUnkMzV")
local OrINzVeX = Parent.event().guard(v4).id("OrINzVeX")
local MDrEouU1 = Parent.event().guard(v5).id("MDrEouU1")
local cabYpyf9 = Parent.event().guard(v8).id("cabYpyf9")
local U3xUkoAB = Parent.event().guard(v6).id("U3xUkoAB")
local v9 = Parent.event().guard(v7).id("6xgrmpYP")
local OwqGqr47 = Parent.store().struct(Parent.array(v2)).id("OwqGqr47")
return {
    Store = OwqGqr47,
    Update = EAkpl3XF,
    Request = T8uFEsSz,
    Refresh = qLUnkMzV,
    Remove = OrINzVeX,
    Add = MDrEouU1,
    Permission = cabYpyf9,
    Deposit = U3xUkoAB,
    Claim = v9,
}