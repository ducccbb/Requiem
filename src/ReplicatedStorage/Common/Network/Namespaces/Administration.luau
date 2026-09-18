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
--           File: ReplicatedStorage.Common.Network.Namespaces.Administration
--                              Dumped in 0.000596 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Compressions = v1.Parent.Parent:WaitForChild("Compressions")
local Stores = Compressions:WaitForChild("Stores")
local Administration = require(Stores:WaitForChild("Administration"))
local Parent = require(v1.Parent.Parent)
local v3 = {commands = Parent.array({name = Parent.string, description = Parent.string, arguments = Parent.array({name = Parent.string, description = Parent.string, path = Parent.string})}), permission = Parent.number("i8"), staffSlot = Parent.number("i8")}
local v4 = {
    message = Parent.string,
    isDelayed = Parent.number("i8"),
    delayed = Parent.number("i16"),
    isPrivate = Parent.number("i8"),
    private = Parent.number("i16"),
    isCustomName = Parent.number("i8"),
    customName = Parent.string,
    isMonologue = Parent.number("i8"),
    font = Parent.number("i8"),
    character = Parent.number("i8"),
    effect = Parent.string,
    currentLanguage = Parent.string,
}
local v5 = {slot = Parent.number("i16"), name = Parent.string}
local v6 = {variant = Parent.string, header = Parent.string, body = Parent.string}
local GEtmsz30 = Parent.store().struct(v3).id("GEtmsz30")
Parent.registerStoreCompressor(GEtmsz30.seed, Administration.compress, Administration.decompress)
local rHaYB5mb = Parent.event().guard({command = Parent.string}).id("rHaYB5mb")
local gPZEFw8L = Parent.event().guard(Parent.number("i8")).id("gPZEFw8L")
local YRtFgsmB = Parent.event().guard(Parent.number("i8")).id("YRtFgsmB")
local k9zeBJ0r = Parent.event().guard(Parent.number("i8")).id("k9zeBJ0r")
local e68EQGIL = Parent.event().guard(Parent.number("i8")).id("e68EQGIL")
local ZASda0B2 = Parent.event().guard(Parent.number("i8")).id("ZASda0B2")
local v7 = Parent.event().guard(Parent.number("i8")).id("3j4bI8Pw")
local AKuYXIhm = Parent.event().guard(Parent.number("i8")).id("AKuYXIhm")
local v8 = Parent.event().guard(Parent.any).id("9bXIxR3M")
local lxWKN0tK = Parent.event().guard(Parent.number("i8")).id("lxWKN0tK")
local p7j9QkP6 = Parent.event().guard(v6).id("p7j9QkP6")
local f001Komm = Parent.event().guard(Parent.array(v4)).id("f001Komm")
local v9 = Parent.event().guard(Parent.any).id("7eb7SprD")
local SVyDOTEe = Parent.event().guard(Parent.any).id("SVyDOTEe")
local fcBbw7SN = Parent.event().guard(Parent.any).id("fcBbw7SN")
local VzKaAERA = Parent.event().guard(Parent.any).id("VzKaAERA")
local kzg9mKNm = Parent.event().guard(Parent.any).id("kzg9mKNm")
local v10 = Parent.event().guard(Parent.any).id("3AnOKhEq")
local TJQ4OWVO = Parent.event().guard(Parent.any).id("TJQ4OWVO")
local v11 = Parent.event().guard({name = Parent.string}).id("1Wu46pJB")
local tQuZxHTL = Parent.event().guard(Parent.array(v5)).id("tQuZxHTL")
local kBaqp8WT = Parent.event().guard({slot = Parent.number("i16")}).id("kBaqp8WT")
local w3QWxh9D = Parent.event().guard(Parent.number("i16")).id("w3QWxh9D")
local nE2IuXaW = Parent.event().guard(v5).id("nE2IuXaW")
local ZYsx4IWg = Parent.event().guard({username = Parent.string}).id("ZYsx4IWg")
local nJ2UnPsW = Parent.event().guard(Parent.number("i8")).id("nJ2UnPsW")
return {
    Store = GEtmsz30,
    Execute = rHaYB5mb,
    State = gPZEFw8L,
    Customize = YRtFgsmB,
    Accessory = k9zeBJ0r,
    Titan = e68EQGIL,
    Animal = ZASda0B2,
    Prop = v7,
    Destroy = AKuYXIhm,
    CrashBlimp = v8,
    Ping = lxWKN0tK,
    Lighting = v9,
    Message = f001Komm,
    Goal = SVyDOTEe,
    Force = fcBbw7SN,
    Selected = VzKaAERA,
    Explosion = v10,
    Fire = TJQ4OWVO,
    Pamphlet = kzg9mKNm,
    Eyecatcher = p7j9QkP6,
    CreateSlot = v11,
    GetSlots = tQuZxHTL,
    DeleteSlot = kBaqp8WT,
    LoadSlot = w3QWxh9D,
    RenameSlot = nE2IuXaW,
    RequestSlots = ZYsx4IWg,
    AdminSlot = nJ2UnPsW,
}