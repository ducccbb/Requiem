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
--               File: ReplicatedStorage.Common.Network.Namespaces.Servers
--                              Dumped in 0.000218 seconds
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
    players = Parent.number("i32"),
    maximum = Parent.number("i32"),
    place = Parent.number("i32"),
    queue = Parent.number("i8"),
    queued = Parent.number("i32"),
    job = Parent.string,
    event = {host = Parent.string},
}
local BS9Sler3 = Parent.store().struct(Parent.array(v2)).id("BS9Sler3")
local sSmCipNy = Parent.event().guard(v2).id("sSmCipNy")
local v3 = Parent.event().guard(Parent.number("i32")).id("2Qlsk58k")
local Z9XzgXBG = Parent.store().struct(Parent.any).id("Z9XzgXBG")
local v4 = Parent.event().guard(Parent.any).id("9mCGDZsB")
return {
    Store = BS9Sler3,
    Join = sSmCipNy,
    Create = v3,
    Queue = Z9XzgXBG,
    Leave = v4,
}