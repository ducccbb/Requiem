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
--                     File: ReplicatedStorage.Common.Types.Branches
--                              Dumped in 0.000548 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Network = script.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Branch"))
local v2 = {
    CIVILIAN = 0,
    SCOUTING_LEGION = 1,
    MILITARY_POLICE = 2,
    STATIONARY_GUARD = 3,
    TRAINEE_CORPS = 4,
    GOVERNMENT = 6,
    STAFF = 7,
    IRON_MARCH_UNION = 8,
}
local v3 = {
    RECRUIT = 1,
    PRIVATE = 2,
    PRIVATE_FIRST_CLASS = 3,
    LANCE_CORPORAL = 4,
    CORPORAL = 5,
    SERGEANT = 6,
    SERGEANT_MAJOR = 7,
    LIEUTENANT = 8,
    CAPTAIN = 9,
    SECTION_COMMANDER = 10,
    ASSISTANT_COMMANDER = 11,
    COMMANDER = 12,
}
local v4 = {}
v4[v2.SCOUTING_LEGION] = 8
v4[v2.MILITARY_POLICE] = 8
v4[v2.STATIONARY_GUARD] = 8
v4[v2.TRAINEE_CORPS] = 8
v4[v2.GOVERNMENT] = 4
v4[v2.IRON_MARCH_UNION] = 8
v4[v2.STAFF] = 10
local v5 = {}
v5[v2.SCOUTING_LEGION] = v3
v5[v2.MILITARY_POLICE] = v3
v5[v2.STATIONARY_GUARD] = v3
v5[v2.TRAINEE_CORPS] = {
    CADET = 1,
    INITIATE = 2,
    BASIC = 3,
    ADEPT = 4,
    ADVANCED = 5,
    AWAITING_PHYSICAL = 6,
    AWAITING_FINAL = 7,
    JUNIOR_INSTRUCTOR = 8,
    INSTRUCTOR = 9,
    SENIOR_INSTRUCTOR = 10,
    DEPUTY_HEAD_INSTRUCTOR = 11,
    HEAD_INSTRUCTOR = 12,
}
v5[v2.GOVERNMENT] = {
    JUDICIAL_CLERK = 1,
    BAILIFF = 2,
    MARSHAL = 3,
    JUDGE = 4,
    CHIEF_JUDGE = 5,
    ASSOCIATE_JUSTICE = 6,
    SUPREME_JUSTICE = 7,
    GOVERNOR = 8,
    DUKE = 9,
    ROYAL_JUSTICIAR = 10,
    ROYAL_CHANCELLOR = 11,
    KING_OF_HUMANITY = 12,
}
v5[v2.IRON_MARCH_UNION] = v3
v5[v2.STAFF] = {
    ACTOR = 1,
    TRIAL_LORE_TEAM = 2,
    TRIAL_MODERATOR = 3,
    MODERATOR = 4,
    SENIOR_MODERATOR = 5,
    ADMINISTRATOR = 6,
    HEAD_OF_STAFF = 7,
    LORE_TEAM = 8,
    DEVELOPER = 9,
    IMPORTANT_INDIVIDUAL = 10,
    PROJECT_LEAD = 11,
    OWNER = 12,
}
local v6 = {}
v6[v2.CIVILIAN] = "rbxassetid://5346998835"
v6[v2.SCOUTING_LEGION] = "rbxassetid://86494260973048"
v6[v2.MILITARY_POLICE] = "rbxassetid://72408082720723"
v6[v2.STATIONARY_GUARD] = "rbxassetid://99454768404589"
v6[v2.TRAINEE_CORPS] = "rbxassetid://131368104304078"
v6[v2.GOVERNMENT] = "rbxassetid://137255133220703"
v6[v2.IRON_MARCH_UNION] = "rbxassetid://140592575200946"
local v7 = {}
v7[v2.CIVILIAN] = "rbxassetid://5346998835"
v7[v2.SCOUTING_LEGION] = "rbxassetid://5346876856"
v7[v2.MILITARY_POLICE] = "rbxassetid://5346878532"
v7[v2.STATIONARY_GUARD] = "rbxassetid://5346877648"
v7[v2.TRAINEE_CORPS] = "rbxassetid://5346878083"
v7[v2.GOVERNMENT] = "rbxassetid://137255133220703"
v7[v2.IRON_MARCH_UNION] = "rbxassetid://140592575200946"
local v8 = {}
v8[v2.CIVILIAN] = "Civilian"
v8[v2.SCOUTING_LEGION] = "Scouting Legion"
v8[v2.MILITARY_POLICE] = "Military Police"
v8[v2.STATIONARY_GUARD] = "Stationary Guard"
v8[v2.TRAINEE_CORPS] = "Trainee Corps"
v8[v2.GOVERNMENT] = "Government"
v8[v2.IRON_MARCH_UNION] = "Iron March Union"
return {
    Branches = v2,
    Ranks = v3,
    Audits = {
        SUSPEND_USER = 1,
        DISCHARGE_USER = 2,
        ADJUST_USER_RANK = 3,
        INVITE_USER = 4,
        CREATE_DETACHMENT = 5,
        DELETE_DETACHMENT = 6,
        ASSIGN_DETACHMENT = 7,
    },
    Icons = v6,
    Labels = v7,
    BranchRanks = v5,
    Branchless = {
        branch_id = 0,
        icon = "rbxassetid://100512912092589",
        memberCount = 0,
        name = "None",
        shout = "None",
        commander = 0,
        total_audits = 0,
        pages = 1,
        score = 50,
        member = {
            branch_id = 0,
            rank = "None",
            rank_id = 0,
            lore_name = "None",
            user_id = 0,
            username = "None",
            wage = 0,
            can_retake = 0,
            score = 0,
            can_graduate = 0,
            suspended = 0,
            detachment = {
                abbreviation = "N/A",
                detachment_id = 0,
                detachment_name = "N/A",
                r = 255,
                g = 255,
                b = 255,
            },
        },
        invites = {},
        detachments = {},
        audits = {},
        pagination = {},
        wages = {},
    },
    Officer = v4,
    Names = v8,
}