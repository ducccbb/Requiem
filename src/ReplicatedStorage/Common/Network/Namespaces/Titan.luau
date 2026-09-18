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
--                File: ReplicatedStorage.Common.Network.Namespaces.Titan
--                              Dumped in 0.000417 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    id = Parent.number("i32"),
    scale = Parent.number("f32"),
    isSupporter = Parent.number("i8"),
    hair = Parent.string,
    displayModel = Parent.string,
    variant = Parent.string,
    animations = Parent.any,
}
local v3 = {id = Parent.number("i32"), ownership = Parent.number("i8")}
local gZMvp9rg = Parent.event().guard(v2).id("gZMvp9rg")
local v4 = Parent.event().guard(Parent.array(v2)).id("8Rrl62jL")
local oXWPw6IL = Parent.event().guard(v2).id("oXWPw6IL")
local qJQRybcM = Parent.event().guard(v3).id("qJQRybcM")
local Xvsiz1J6 = Parent.event().guard(Parent.number("i32")).id("Xvsiz1J6")
local RxAveKjr = Parent.event().guard(Parent.number("i32")).id("RxAveKjr")
local hgplZ02k = Parent.event().guard(Parent.number("i32")).id("hgplZ02k")
local UWH7n1I9 = Parent.event().guard(Parent.number("i32")).id("UWH7n1I9")
local O0DY58RD = Parent.event().guard(Parent.any).id("O0DY58RD")
local uuc4JiWo = Parent.event().guard(Parent.any).id("uuc4JiWo")
return {
    Event = gZMvp9rg,
    Batch = v4,
    Create = oXWPw6IL,
    Ownership = qJQRybcM,
    State = Xvsiz1J6,
    Respond = RxAveKjr,
    Health = hgplZ02k,
    Destroy = UWH7n1I9,
    Animate = O0DY58RD,
    Action = uuc4JiWo,
}