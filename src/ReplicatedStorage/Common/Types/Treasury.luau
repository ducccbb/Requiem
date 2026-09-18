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
--                     File: ReplicatedStorage.Common.Types.Treasury
--                              Dumped in 0.000636 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local Network = script.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Treasury"))
local v2 = {FACTORY = 1, DISTRICT = 2, BRANCH = 3, TAX = 4}
local u34 = {}
u34[v2.FACTORY] = 100
u34[v2.DISTRICT] = 100
u34[v2.BRANCH] = 100
u34[v2.TAX] = 100
local u43 = {}
u43[v2.FACTORY] = 10
u43[v2.DISTRICT] = 10
u43[v2.BRANCH] = 10
u43[v2.TAX] = 10
local function getAmountOfRedeemableIncome(p1) -- Line: 62 -- upvalues: Workspace (val), u43 (val)
    local UnixTimestamp_2
    local ServerTimeNow = Workspace:GetServerTimeNow()
    local UnixTimestamp = DateTime.fromIsoDate(p1.timeCreated).UnixTimestamp
    local v1 = p1.timeLastClaimed or UnixTimestamp
    local v2 = DateTime.fromIsoDate(v1)
    if not v2 then
        UnixTimestamp_2 = v1
    else
        UnixTimestamp_2 = v2.UnixTimestamp
    end
    if not UnixTimestamp_2 then
        UnixTimestamp_2 = v1
    end
    if p1.timeLastClaimed == 0 then
        UnixTimestamp_2 = UnixTimestamp or ServerTimeNow
    end
    if typeof(v1) == "number" and p1.timeLastClaimed ~= 0 then
        UnixTimestamp_2 = v1
    end
    local v3 = math.floor((ServerTimeNow - UnixTimestamp_2) / u43[p1.type])
    if v3 < 0 then
        v3 = 0
    end
    return v3
end
return {
    IncomeSourceTypes = v2,
    IncomeSourceProfitAmounts = u34,
    IncomeSourceRefreshRate = u43,
    getAmountOfRedeemableIncome = getAmountOfRedeemableIncome,
    isIncomeSourceRedeemable = function(p1) -- Line: 132 -- upvalues: getAmountOfRedeemableIncome (val)
        local v1 = 0 < getAmountOfRedeemableIncome(p1)
        return v1
    end,
    getIncomeSourceLastRedeemed = function(p1) -- Line: 95 -- upvalues: Workspace (val)
        local UnixTimestamp_2
        local ServerTimeNow = Workspace:GetServerTimeNow()
        local UnixTimestamp = DateTime.fromIsoDate(p1.timeCreated).UnixTimestamp
        if not p1.timeLastClaimed then
            return nil
        end
        local v1 = p1.timeLastClaimed or UnixTimestamp
        local v2 = DateTime.fromIsoDate(v1)
        if not v2 then
            UnixTimestamp_2 = v1
        else
            UnixTimestamp_2 = v2.UnixTimestamp
        end
        if not UnixTimestamp_2 then
            UnixTimestamp_2 = v1
        end
        if p1.timeLastClaimed == 0 then
            UnixTimestamp_2 = UnixTimestamp or ServerTimeNow
        elseif not UnixTimestamp_2 then
            UnixTimestamp_2 = UnixTimestamp or ServerTimeNow
        end
        if typeof(v1) == "number" and p1.timeLastClaimed ~= 0 then
            UnixTimestamp_2 = v1
        end
        return UnixTimestamp_2
    end,
    getIncomeSourceClaimableAmount = function(p1) -- Line: 124 -- upvalues: getAmountOfRedeemableIncome (val), u34 (val)
        local v1 = getAmountOfRedeemableIncome(p1)
        return v1 * (u34[p1.type] * p1.level)
    end,
    Actions = {
        "Removed Marcs",
        "Added Marcs",
        "Removed Items",
        "Added Items",
        "Added Income Source",
        "Updated Income Sources",
        "Updated Owner",
        "Updated Location",
        "Set Treasury Name",
        "Created Treasury",
        "Updated Access",
    },
    Types = {PERSONAL = 1, BLOODLINE = 2, BRANCH = 3, LOCATION = 4},
}