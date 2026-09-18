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
--              File: ReplicatedStorage.Common.Network.Namespaces.Bloodline
--                              Dumped in 0.000320 seconds
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
    location = Parent.string,
    tree = Parent.array({parent_id = Parent.number("i32"), parent = Parent.number("i32"), user = Parent.number("i32"), status = Parent.number("i8")}),
    head = Parent.number("i32"),
    id = Parent.number("i32"),
    role = Parent.string,
    pagination = Parent.array(Parent.number("i32")),
    pages = Parent.number("i32"),
    invites = Parent.array({id = Parent.number("i32"), name = Parent.string}),
}
local v3 = {name = Parent.string}
local v4 = {page = Parent.number("i32"), filter = Parent.string}
local v5 = {user = Parent.number("i32"), action = Parent.number("i8")}
local RNLGuHhD = Parent.store().struct(v2).id("RNLGuHhD")
local jgP2y4eP = Parent.event().guard(v3).id("jgP2y4eP")
local TCgmwGhS = Parent.event().guard(v4).id("TCgmwGhS")
local MvXXDLzP = Parent.event().guard({user = Parent.number("i32")}).id("MvXXDLzP")
local aZzZWQ3T = Parent.event().guard({bloodline = Parent.number("i32")}).id("aZzZWQ3T")
local e0NTGUjn = Parent.event().guard(Parent.any).id("e0NTGUjn")
local DyP9B9b1 = Parent.event().guard(v5).id("DyP9B9b1")
local uwGKKF5A = Parent.event().guard(Parent.any).id("uwGKKF5A")
return {
    Store = RNLGuHhD,
    Accept = aZzZWQ3T,
    Create = jgP2y4eP,
    Paginate = TCgmwGhS,
    Invite = MvXXDLzP,
    Leave = e0NTGUjn,
    Action = DyP9B9b1,
    Refresh = uwGKKF5A,
}