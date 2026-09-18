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
--               File: ReplicatedStorage.Common.Network.Namespaces.Player
--                              Dumped in 0.000484 seconds
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
local Player = require(Stores:WaitForChild("Player"))
local v3 = {user = Parent.string, status = Parent.number("i8")}
local v4 = {
    username = Parent.string,
    name = Parent.string,
    display = Parent.string,
    userid = Parent.number("i32"),
    branch = Parent.number("i8"),
    rank = Parent.number("i8"),
    status = Parent.number("i8"),
    mia = Parent.number("i8"),
    emote = Parent.string,
    supporter = Parent.number("i8"),
    tester = Parent.number("i8"),
    sponsor = Parent.number("i8"),
    tier = Parent.string,
}
local v5 = {action = Parent.string}
local v6 = {players = Parent.array(v4), client = v4}
local v7 = {id = Parent.number("i32"), header = Parent.string, description = Parent.string}
local E9pCydst = Parent.store().struct(v6).id("E9pCydst")
Parent.registerStoreCompressor(E9pCydst.seed, Player.compress, Player.decompress)
local BGAJZeWg = Parent.event().guard(Parent.number("i8")).id("BGAJZeWg")
local cQV97SJZ = Parent.event().guard(v3).id("cQV97SJZ")
local v8 = Parent.event().guard(Parent.union(v5, Parent.any)).id("3PNz4hxB")
local X4exhnjN = Parent.event().guard(v7).id("X4exhnjN")
local yfDFwFG7 = Parent.event().guard(Parent.CFrame).id("yfDFwFG7")
local wpOyNCXg = Parent.event().guard(Parent.any).id("wpOyNCXg")
local nlhU8VYJ = Parent.event().guard(Parent.any).id("nlhU8VYJ")
local jQob7rh5 = Parent.event().guard(Parent.number).id("jQob7rh5")
local Wq9RGoeJ = Parent.event().guard(Parent.any).id("Wq9RGoeJ")
local PPPB6ATf = Parent.event().guard(Parent.any).id("PPPB6ATf")
local v9 = Parent.event().guard(Parent.any).id("2s3G9UZM")
local g243PMOd = Parent.event().guard(Parent.any).id("g243PMOd")
local wOm7mhBb = Parent.event().guard(Parent.any).id("wOm7mhBb")
local IVhro5tK = Parent.event().guard(Parent.any).id("IVhro5tK")
local VtIvHe3H = Parent.event().guard(Parent.any).id("VtIvHe3H")
local v10 = Parent.event().guard(Parent.any).id("407eRdWw")
local qJDQGRfv = Parent.event().guard(Parent.any).id("qJDQGRfv")
local v11 = Parent.event().guard(Parent.any).id("74DyqPA5")
local RIUPAp27 = Parent.event().guard(Parent.any).id("RIUPAp27")
local CqrQxhJ2 = Parent.event().guard(Parent.any).id("CqrQxhJ2")
local V0H03NXd = Parent.event().guard(Parent.any).id("V0H03NXd")
return {
    Store = E9pCydst,
    Request = BGAJZeWg,
    Update = cQV97SJZ,
    Action = v8,
    Ask = X4exhnjN,
    Teleport = yfDFwFG7,
    Lift = wpOyNCXg,
    Anxiety = nlhU8VYJ,
    Skillcheck = jQob7rh5,
    Handcuff = Wq9RGoeJ,
    HandcuffStart = PPPB6ATf,
    Track = v9,
    Chat = g243PMOd,
    State = wOm7mhBb,
    Shifter = IVhro5tK,
    Bossbar = VtIvHe3H,
    Hood = v10,
    Identification = qJDQGRfv,
    Transform = v11,
    ChatDamage = RIUPAp27,
    Accessories = CqrQxhJ2,
    DropAccessory = V0H03NXd,
}