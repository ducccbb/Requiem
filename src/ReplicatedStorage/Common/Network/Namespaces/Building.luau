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
--              File: ReplicatedStorage.Common.Network.Namespaces.Building
--                              Dumped in 0.000293 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {location = Parent.number("i8"), id = Parent.number("i32")}
local v3 = {rotation = Parent.number("i8"), id = Parent.number("i32")}
local v4 = {plot = Parent.string, user = Parent.number("i32")}
local C0mxtZRQ = Parent.event().guard(Parent.any).id("C0mxtZRQ")
local v5 = Parent.event().guard(v2).id("29LyvVct")
local Kys8jAEz = Parent.event().guard(v3).id("Kys8jAEz")
local mwbez0Jb = Parent.event().guard(Parent.number("i32")).id("mwbez0Jb")
local yQ2yq04T = Parent.event().guard(Parent.any).id("yQ2yq04T")
local zcJpTf2j = Parent.event().guard(Parent.any).id("zcJpTf2j")
local Zg79ERCg = Parent.event().guard(Parent.any).id("Zg79ERCg")
local v6 = Parent.event().guard(v4).id("4L4XSgsY")
local v7 = Parent.event().guard(v4).id("4CNHvSKa")
local v8 = Parent.event().guard(v4).id("5dwV0UNF")
local Qn5v8iFL = Parent.event().guard(Parent.any).id("Qn5v8iFL")
local h8w6oAbG = Parent.event().guard(Parent.boolean).id("h8w6oAbG")
return {
    Place = C0mxtZRQ,
    Relocate = v5,
    Rotate = Kys8jAEz,
    Delete = mwbez0Jb,
    BuildSchematic = yQ2yq04T,
    CreatePlot = zcJpTf2j,
    DeletePlot = Zg79ERCg,
    AddMember = v6,
    RemoveMember = v7,
    TransferOwnership = v8,
    OnPermissionsUpdated = Qn5v8iFL,
    SetSandboxMode = h8w6oAbG,
}