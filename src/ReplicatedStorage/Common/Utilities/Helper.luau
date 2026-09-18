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
--                    File: ReplicatedStorage.Common.Utilities.Helper
--                              Dumped in 0.000599 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Network = script.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Bloodline = require(Namespaces:WaitForChild("Bloodline"))
local u33 = nil
local u34 = nil
local function getBranchOrganizationHandler() -- Line: 24 -- upvalues: u33 (ref)
    if not u33 then
        local ServerScriptService = game:GetService("ServerScriptService")
        local User = ServerScriptService:WaitForChild("User")
        local Services = User:WaitForChild("Services")
        local Organizations = Services:WaitForChild("Organizations")
        u33 = require(Organizations:WaitForChild("BranchOrganizationHandler"))
    end
    return u33
end
local function getRobloxDataHandler() -- Line: 35 -- upvalues: u34 (ref)
    if not u34 then
        local ServerScriptService = game:GetService("ServerScriptService")
        local User = ServerScriptService:WaitForChild("User")
        local Services = User:WaitForChild("Services")
        local Data = Services:WaitForChild("Data")
        u34 = require(Data:WaitForChild("RobloxDataHandler"))
    end
    return u34
end
local function getBloodlineId(p1) -- Line: 47 -- upvalues: Bloodline (val)
    local v1 = Bloodline.Store.get(p1)
    if not v1 then
        return 0
    end
    return v1.value.id or 0
end
return {
    getBloodlineId = getBloodlineId,
    IsInSameBranch = function(p1, p2) -- Line: 61 -- upvalues: RunService (val), getBranchOrganizationHandler (val)
        if RunService:IsServer() then
            local v1 = getBranchOrganizationHandler()
            local v2 = v1.getPlayerBranchId(p1)
            local v3 = v2 == v1.getPlayerBranchId(p2)
            return v3
        end
        local Attribute = p1:GetAttribute("Branch")
        local Attribute_2 = p2:GetAttribute("Branch")
        if typeof(Attribute) ~= "number" or typeof(Attribute_2) ~= "number" then
            return false
        end
        local v4 = Attribute == Attribute_2
        return v4
    end,
    IsInSameBloodline = function(p1, p2) -- Line: 85 -- upvalues: RunService (val), getRobloxDataHandler (val), getBloodlineId (val)
        local v1, v2, v3, v4, v5
        if not (RunService:IsServer()) then
            v1 = getBloodlineId(p1)
            v2 = getBloodlineId(p2)
            v3 = if v1 ~= 0 then v1 == v2 else false
            return v3
        end
        v1 = getRobloxDataHandler()
        v2, v3 = v1.getUserData(p1):await()
        if not v2 or not v3 then
            return false
        end
        v4, v5 = v1.getUserData(p2):await()
        if not v4 or not v5 then
            return false
        end
        local Id = v3.Bloodline.Id
        local v6 = if Id ~= 0 then Id == v5.Bloodline.Id else false
        return v6
    end,
}