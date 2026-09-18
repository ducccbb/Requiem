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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Core.Security
--                               Dumped in 0.00148 seconds
--                          Bytecode version 9  |  10 functions

local u55
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
MarketplaceService = Game:GetService("MarketplaceService")
HttpService = Game:GetService("HttpService")
Workspace = Game:GetService("Workspace")
Tool = script.Parent.Parent
Libraries = Tool:WaitForChild("Libraries")
Support = require(Libraries:WaitForChild("SupportLibrary"))
RegionModule = require(Libraries:WaitForChild("Region"))
if not (Tool.Parent:IsA("Plugin")) then
    u55 = "Tool"
else
    u55 = "Plugin"
end
local v2 = {}
Security = v2
Security.AreaHeight = 500
Security.AllowPublicBuilding = true
local v3 = {Workspace}
Security.AllowedLocations = v3
Security.Areas = Workspace:FindFirstChild("[Private Building Areas]")
Workspace.ChildAdded:Connect(function(p1) -- Line: 36
    if not Security.Areas and p1.Name == "[Private Building Areas]" then
        Security.Areas = p1
    end
end)
Workspace.ChildRemoved:Connect(function(p1) -- Line: 41
    if Security.Areas and p1.Name == "[Private Building Areas]" then
        Security.Areas = nil
    end
end)
function Security.IsAreaAuthorizedForPlayer(p1, p2) -- Line: 47
    local RankInGroup, v1, v2, v3
    local v4 = p1:FindFirstChild("[Permissions]")
    if not v4 then
        return
    end
    v4 = require(v4)
    if not v4 then
        return
    end
    local v5 = p2
    for k, v in pairs(v4) do
        if v.Type ~= "Group" then
            if v.Type == "Player" or v.Type == "Owner" then
                if v5.userId ~= v.PlayerId and v5.Name ~= v.PlayerName then
                    continue
                end
                return true
            end
            if v.Type == "Anybody" then
                return true
            end
            if v.Type ~= "Friends" then
                if v.Type ~= "Asset" then
                    if v.Type == "Team" then
                        if v.Team and v5.Team == v.Team then
                            return true
                        end
                        if v.TeamColor and v5.Team and v5.Team.TeamColor == v.TeamColor then
                            return true
                        end
                        if v.TeamName and v5.Team and v5.Team.Name == v.TeamName then
                            return true
                        end
                    elseif v.Type ~= "NoBC" then
                        if v.Type ~= "AnyBC" then
                            if v.Type ~= "BC" then
                                if v.Type ~= "TBC" then
                                    if v.Type ~= "OBC" then
                                        if v.Type == "Callback" then
                                            return v.Callback(v5)
                                        end
                                    elseif v5.MembershipType == Enum.MembershipType.OutrageousBuildersClub then
                                        return true
                                    end
                                elseif v5.MembershipType == Enum.MembershipType.TurboBuildersClub then
                                    return true
                                end
                            elseif v5.MembershipType == Enum.MembershipType.BuildersClub then
                                return true
                            end
                        elseif v5.MembershipType ~= Enum.MembershipType.None then
                            return true
                        end
                    elseif v5.MembershipType == Enum.MembershipType.None then
                        return true
                    end
                elseif MarketplaceService:PlayerOwnsAsset(v5, v.AssetId) then
                    return true
                end
            elseif v5:IsFriendsWith(v.PlayerId) then
                return true
            end
        else
            v2 = v5:IsInGroup(v.GroupId)
            if v2 and not v.Ranks then
                return true
            end
            if v2 and v.Ranks then
                v3, v1 = tostring(v.Ranks):match("([<>]?=?)([0-9]+)")
                RankInGroup = v5:GetRankInGroup(v.GroupId)
                v1 = tonumber(v1)
                if not v3 and RankInGroup == v1 then
                    return true
                end
                if v3 == "=" and RankInGroup == v1 then
                    return true
                end
                if v3 == ">" and v1 < RankInGroup then
                    return true
                end
                if v3 == "<" and RankInGroup < v1 then
                    return true
                end
                if v3 == ">=" and v1 <= RankInGroup then
                    return true
                end
                if v3 == "<=" and RankInGroup <= v1 then
                    return true
                end
            end
        end
    end
    return false
end
function Security.IsItemAllowed(p1, p2) -- Line: 169
    local v1
    if p1:IsA("BasePart") then
        v1 = not p1:IsA("Terrain")
    elseif not (p1:IsA("Model")) then
        v1 = p1:IsA("Folder")
        if not v1 then
            v1 = p1:IsA("Smoke")
            if not v1 then
                v1 = p1:IsA("Fire")
                if not v1 then
                    v1 = p1:IsA("Sparkles")
                    if not v1 then
                        v1 = p1:IsA("DataModelMesh")
                        if not v1 then
                            v1 = p1:IsA("Decal")
                            if not v1 then
                                v1 = p1:IsA("Texture")
                                if not v1 then
                                    v1 = p1:IsA("Light")
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        v1 = not p1:IsA("Workspace")
    end
    if not v1 then
        return false
    end
    for k, v in pairs(Security.AllowedLocations) do
        if p1:IsDescendantOf(v) then
            return true
        end
    end
    return false
end
function Security.IsLocationAllowed(p1, p2) -- Line: 199
    for k, v in pairs(Security.AllowedLocations) do
        if v ~= p1 and not (p1:IsDescendantOf(v)) then
            continue
        end
        return true
    end
    return false
end
function Security.AreAreasEnabled() -- Line: 213 -- upvalues: u55 (val)
    if not Security.Areas then
        return false
    end
    if u55 == "Tool" then
        return true
    end
    return false
end
function Security.ArePartsViolatingAreas(p1, p2, p3, p4) -- Line: 224
    local v1, v2, v3, v4
    if not (Security.AreAreasEnabled()) or not (next(p1)) then
        return false
    end
    local v5 = p4
    if not v5 then
        v5 = {}
    end
    local v6 = v5
    v5, v4 = Security.GetSelectionAreas(p1, true)
    v3, v1 = p3, p2
    for k, v in pairs(v5) do
        if v6[v] == nil then
            v6[v] = Security.IsAreaAuthorizedForPlayer(v, v1)
        end
        if not v3 and v6[v] == false then
            return true
        end
        if v3 and v6[v] then
            for k2, i in pairs(v4) do
                if k2.Area == v then
                    v2 = Support.CountKeys(v7)
                    if v2 == #i then
                        return false
                    end
                end
            end
        end
    end
    if #v5 == 0 then
        return not Security.AllowPublicBuilding
    end
    if v3 then
        return true
    end
    if not v4 or Security.AllowPublicBuilding then
        return false
    end
    local v8 = {}
    for k3, j in pairs(v4) do
        for k4, k5 in pairs(j) do
            v8[k5] = v8[k5] or 0
            for k6, n in pairs(Support.GetPartCorners(k5)) do
                if k3:CastPoint(n.p) then
                    v8[k5] = v8[k5] + 1
                end
            end
        end
    end
    for k7, m in pairs(v8) do
        if m ~= 8 then
            return true
        end
    end
    return false
end
function Security.GetSelectionAreas(p1, p2) -- Line: 315
    local v1, v2, v3, v4
    if not (Security.AreAreasEnabled()) then
        return {}
    end
    if not p2 then
        v3 = nil
    else
        v3 = {}
    end
    local v5 = {}
    for k, v in pairs(Security.Areas:GetChildren()) do
        v1 = v.CFrame * CFrame.new(0, Security.AreaHeight / 2 - v.Size.Y / 2, 0)
        v2 = Security.AreaHeight + v.Size.Y
        v4 = RegionModule.new(v1, (Vector3.new(v.Size.X, v2, v.Size.Z)))
        v4.Area = v
        v1 = v4:CastParts(p1)
        if 0 < #v1 then
            table.insert(v5, v)
            if v3 then
                v3[v4] = v1
            end
        end
    end
    return v5, v3
end
function Security.GetPermissions(p1, p2) -- Line: 354
    if not (Security.AreAreasEnabled()) then
        return
    end
    local v1 = {}
    for k, v in pairs(p1) do
        v1[v] = Security.IsAreaAuthorizedForPlayer(v, p2)
    end
    return v1
end
return Security