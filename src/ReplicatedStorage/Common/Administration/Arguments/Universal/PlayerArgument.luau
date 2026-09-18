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
--   File: ReplicatedStorage.Common.Administration.Arguments.Universal.PlayerArgument
--                               Dumped in 0.00162 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Cache = require(Common:WaitForChild("Cache"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
local Permissions = require(script.Parent.Parent.Parent:WaitForChild("Permissions"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local function getGroupLookup() -- Line: 29 -- upvalues: RunService (val), Cache (val)
    local Folder
    local v1 = nil
    if RunService:IsServer() then
        v1 = Cache:FindFirstChild("Groups")
        if not v1 then
            Folder = Instance.new("Folder")
            Folder.Name = "Groups"
            Folder.Parent = Cache
            v1 = Folder
        end
    elseif RunService:IsClient() then
        v1 = Cache:FindFirstChild("Groups")
    end
    local v2 = {}
    if not v1 then
        return v2
    end
    for i, j in v1:GetChildren() do
        if j:IsA("Folder") then
            v2[j.Name] = j.Name
        end
    end
    return v2
end
local function autocomplete(p1) -- Line: 69 -- upvalues: getGroupLookup (val), Table (val), Alive (val)
    local v1 = p1:sub(1, 1) == "@"
    local v2 = {}
    if p1 == "" then
        v2 = {
            "@everyone",
            "@me",
            "@others",
            "@pending",
            "@sg",
            "@mp",
            "@sl",
            "@tc",
            "@civilian",
            "@nearby",
            "@actor",
            "@mia",
        }
        local v3 = getGroupLookup()
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            table.insert(v2, "@" .. j)
        end
    elseif not v1 then
        v2 = Table.map(Alive.getPlayers(), function(p1) -- Line: 97
            return p1.Name
        end)
    end
    return Table.filter(v2, function(a1) -- Line: 103 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(150, 216, 255)
end
local function sanitize(p1, p2) -- Line: 115 -- upvalues: autocomplete (val), Alive (val), Branches (val), getGroupLookup (val), Table (val), Cache (val), Permissions (val)
    local Attribute, Groups, v1, v2, v3, v4
    local ServerScriptService = game:GetService("ServerScriptService")
    local User = ServerScriptService:WaitForChild("User")
    local Services = User:WaitForChild("Services")
    local Organizations = Services:WaitForChild("Organizations")
    local BranchOrganizationHandler = require(Organizations:WaitForChild("BranchOrganizationHandler"))
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Common = ReplicatedStorage:WaitForChild("Common")
    local Network = Common:WaitForChild("Network")
    local Namespaces = Network:WaitForChild("Namespaces")
    local Administration = require(Namespaces:WaitForChild("Administration"))
    if not p2 or p2 == "" then
        return {}
    end
    local v5 = autocomplete(p2)
    local u323 = {}
    local function getPlayerByTeam(p1) -- Line: 130 -- upvalues: Alive (upval), BranchOrganizationHandler (val), Branches (upval), u323 (val)
        local v1
        local v2 = p1
        for i, j in Alive.getPlayers() do
            v1 = BranchOrganizationHandler.getPlayerBranchId(j)
            if v2 ~= "@mp" then
                if v2 ~= "@sg" then
                    if v2 ~= "@sl" then
                        if v2 ~= "@tc" then
                            if v2 ~= "@gov" then
                                if v2 ~= "@imu" then
                                    if v2 == "@civilian" and v1 == Branches.Branches.CIVILIAN then
                                        table.insert(u323, j)
                                    end
                                elseif v1 == Branches.Branches.IRON_MARCH_UNION then
                                    table.insert(u323, j)
                                end
                            elseif v1 == Branches.Branches.GOVERNMENT then
                                table.insert(u323, j)
                            end
                        elseif v1 == Branches.Branches.TRAINEE_CORPS then
                            table.insert(u323, j)
                        end
                    elseif v1 == Branches.Branches.SCOUTING_LEGION then
                        table.insert(u323, j)
                    end
                elseif v1 == Branches.Branches.STATIONARY_GUARD then
                    table.insert(u323, j)
                end
            elseif v1 == Branches.Branches.MILITARY_POLICE then
                table.insert(u323, j)
            end
        end
    end
    local v6 = p2:match("^@nearby%-(%d+)$")
    if v6 then
        local v7 = tonumber(v6) or 50
        if v7 and p1.Character then
            for i8, i9 in Alive.getPlayers() do
                v2 = Alive.getAliveCharacter(i9)
                if i9 ~= p1 and v2 and (v2:GetPivot().Position - p1.Character:GetPivot().Position).Magnitude <= v7 then
                    table.insert(u323, i9)
                end
            end
        end
        return u323
    end
    local v8 = Table.map(getGroupLookup(), function(p1) -- Line: 175
        return p1:lower()
    end)
    v1 = p1
    for k, v in pairs(v5) do
        if string.sub(v, 1, 1) == "@" then
            v3 = string.lower(v)
            if v8[string.sub(v3, 2)] then
                Groups = Cache:FindFirstChild("Groups")
                if Groups then
                    for i5, i6 in Groups:GetChildren() do
                        v4 = string.lower(i6.Name)
                        if v4 == string.lower((string.sub(v, 2))) then
                            for k8, i7 in pairs(Alive.getPlayers()) do
                                Attribute = i7:GetAttribute("Character")
                                if Attribute and i6:FindFirstChild(Attribute) then
                                    table.insert(u323, i7)
                                end
                            end
                        end
                    end
                end
            end
        elseif string.lower(v) == "@everyone" then
            for k7, m in pairs(Alive.getPlayers()) do
                if m:GetAttribute("Status") ~= 3 then
                    table.insert(u323, m)
                end
            end
        elseif v == "@pending" then
            for k6, n in pairs(Alive.getPlayers()) do
                if n:GetAttribute("Status") == 3 then
                    table.insert(u323, n)
                end
            end
        elseif v == "@sg" then
            getPlayerByTeam(v)
        elseif v ~= "@mp" and v ~= "@sl" and v ~= "@tc" and v ~= "@civilian" then
            if v == "@mia" then
                for k4, k5 in pairs(Alive.getPlayers()) do
                    if k5:GetAttribute("Missing") then
                        table.insert(u323, k5)
                    end
                end
            elseif v == "@actor" then
                for k3, j in pairs(Alive.getPlayers()) do
                    if Administration.Store.get(j).value.staffSlot == 1 and Administration.Store.get(j).value.permission == Permissions.Roles.Actor then
                        table.insert(u323, j)
                    end
                end
            elseif v == "@me" then
                table.insert(u323, v1)
            elseif v ~= "@others" then
                v2 = Alive.findPlayer(v)
                if v2 then
                    table.insert(u323, v2)
                end
            else
                for k2, i in pairs(Alive.getPlayers()) do
                    if i ~= v1 then
                        table.insert(u323, i)
                    end
                end
            end
        end
    end
    return u323
end
return function(p1) -- Line: 255 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The player you wish to execute the command on."}
end