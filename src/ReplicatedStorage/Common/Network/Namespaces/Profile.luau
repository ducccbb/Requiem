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
--               File: ReplicatedStorage.Common.Network.Namespaces.Profile
--                              Dumped in 0.000305 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {name = Parent.string, value = Parent.number("i32")}
local v3 = Parent.map(Parent.string, {
    shirtCategory = Parent.string,
    shirtName = Parent.string,
    shirtCustom = Parent.string,
    pantsCategory = Parent.string,
    pantsName = Parent.string,
    pantsCustom = Parent.string,
})
local v4 = Parent.store().struct({
    name = {first = Parent.string, last = Parent.string},
    height = Parent.number("i8"),
    weight = Parent.number("i8"),
    gender = Parent.string,
    armband = Parent.string,
    activeSubslot = Parent.string,
    age = Parent.number("i16"),
    currentYear = Parent.number("i16"),
    dateOfBirth = Parent.number("i16"),
    birthMonth = Parent.number("i8"),
    birthDay = Parent.number("i8"),
    statistics = Parent.array(v2),
    outfitSubslots = v3,
}).id("9d9S0ECU")
local XrJ9A6dV = Parent.event().guard(Parent.string).id("XrJ9A6dV")
local WZTFB6fd = Parent.event().guard(Parent.string).id("WZTFB6fd")
local i7ZJmLio = Parent.event().guard(Parent.string).id("i7ZJmLio")
local F5wV1c85 = Parent.event().guard(Parent.number("i16")).id("F5wV1c85")
local u9EcWWvv = Parent.event().guard(Parent.number("i16")).id("u9EcWWvv")
local NidbJoun = Parent.event().guard(Parent.number("i16")).id("NidbJoun")
return {
    Store = v4,
    Gender = XrJ9A6dV,
    Subslot = WZTFB6fd,
    Armband = i7ZJmLio,
    Age = F5wV1c85,
    CurrentYear = u9EcWWvv,
    DateOfBirth = NidbJoun,
}