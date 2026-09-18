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
--               File: ReplicatedStorage.Common.Network.Namespaces.Branch
--                              Dumped in 0.000641 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = require(script.Parent.Parent)
local v2 = {
    audit_type = Parent.number("i8"),
    branch_id = Parent.number("i8"),
    id = Parent.number("i32"),
    log = Parent.string,
    timestamp = Parent.string,
    user_id = Parent.number("i32"),
}
local v3 = {action = Parent.number("i8"), user = Parent.number("i32")}
local v4 = {detachment = Parent.number("i16")}
local v5 = {
    abbreviation = Parent.string,
    name = Parent.string,
    color = {r = Parent.number("i16"), g = Parent.number("i16"), b = Parent.number("i16")},
}
local v6 = {user = Parent.number("i32"), detachment = Parent.number("i16")}
local v7 = {
    page = Parent.number("i32"),
    limit = Parent.number("i32"),
    filter = Parent.string,
    subfilter = Parent.string,
    search = Parent.string,
}
local v8 = {page = Parent.number("i32"), filter = Parent.number("i32")}
local v9 = {user = Parent.number("i32"), rank = Parent.string}
local v10 = {
    rank = Parent.string,
    rank_id = Parent.number("i32"),
    suspended = Parent.number("i8"),
    branch_id = Parent.number("i32"),
    score = Parent.number("i8"),
    can_retake = Parent.number("i8"),
    can_graduate = Parent.number("i8"),
    lore_name = Parent.string,
    username = Parent.string,
    user_id = Parent.number("i32"),
    wage = Parent.number("i32"),
    detachment = {
        abbreviation = Parent.string,
        detachment_id = Parent.number("i16"),
        detachment_name = Parent.string,
        r = Parent.number("i16"),
        g = Parent.number("i16"),
        b = Parent.number("i16"),
    },
}
local v11 = {
    name = Parent.string,
    players = Parent.number("i16"),
    abbreviation = Parent.string,
    id = Parent.number("i16"),
    r = Parent.number("i16"),
    g = Parent.number("i16"),
    b = Parent.number("i16"),
}
local v12 = {branch_id = Parent.number("i8")}
local v13 = {user = Parent.number("i32")}
local v14 = {score = Parent.number("i8")}
local v15 = {
    branch_id = Parent.number("i32"),
    icon = Parent.string,
    memberCount = Parent.number("i32"),
    name = Parent.string,
    shout = Parent.string,
    commander = Parent.number("i32"),
    score = Parent.number("i8"),
    invites = Parent.array(v12),
    pagination = Parent.array(v10),
    pages = Parent.number("i32"),
    audits = Parent.array(v2),
    total_audits = Parent.number("i32"),
    wages = Parent.array({wage = Parent.number("i32"), rank_id = Parent.number("i32")}),
    detachments = Parent.array(v11),
    member = v10,
}
local BYKWMLhW = Parent.event().guard(v7).id("BYKWMLhW")
local v16 = Parent.event().guard(v8).id("7MGggHCb")
local Ux7wOXNb = Parent.event().guard(v9).id("Ux7wOXNb")
local pFGNlAqY = Parent.event().guard(v3).id("pFGNlAqY")
local Qdvl6jOy = Parent.event().guard(v13).id("Qdvl6jOy")
local U8cbUs3i = Parent.event().guard(v12).id("U8cbUs3i")
local aRULbrsw = Parent.event().guard(v14).id("aRULbrsw")
local wdTCppQw = Parent.event().guard(v5).id("wdTCppQw")
local Qnla0K3W = Parent.event().guard(v6).id("Qnla0K3W")
local xSyOcRGv = Parent.event().guard(v4).id("xSyOcRGv")
local ybs5eoiN = Parent.event().guard(Parent.any).id("ybs5eoiN")
local q2zmUzsy = Parent.event().guard(Parent.number("i8")).id("q2zmUzsy")
local BxYInjZm = Parent.event().guard(Parent.any).id("BxYInjZm")
local pkYFGX0F = Parent.event().guard(Parent.any).id("pkYFGX0F")
local v17 = Parent.store().struct(v15).id("1jO4rsEm")
v17.defer()
return {
    Branch = v17,
    Paginate = BYKWMLhW,
    Promote = Ux7wOXNb,
    Action = pFGNlAqY,
    Invite = Qdvl6jOy,
    Join = U8cbUs3i,
    Score = aRULbrsw,
    Wages = ybs5eoiN,
    Physical = q2zmUzsy,
    Audits = v16,
    Retake = BxYInjZm,
    Auxiliary = pkYFGX0F,
    AssignDetachment = Qnla0K3W,
    CreateDetachment = wdTCppQw,
    DeleteDetachment = xSyOcRGv,
}