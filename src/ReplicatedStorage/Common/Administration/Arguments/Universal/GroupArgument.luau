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
--    File: ReplicatedStorage.Common.Administration.Arguments.Universal.GroupArgument
--                              Dumped in 0.000562 seconds
--                          Bytecode version 9  |  6 functions

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
local function getGroupLookup() -- Line: 23 -- upvalues: RunService (val), Cache (val)
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
local function autocomplete(p1) -- Line: 63 -- upvalues: getGroupLookup (val), Table (val)
    local v1 = Table.keys((getGroupLookup()))
    return Table.filter(v1, function(a1) -- Line: 67 -- upvalues: p1 (val)
        local v1 = a1:lower():sub(1, #p1)
        local v2 = v1 == p1:lower()
        return v2
    end), Color3.fromRGB(255, 150, 241)
end
local function sanitize(p1, p2) -- Line: 80 -- upvalues: getGroupLookup (val), autocomplete (val)
    if not p2 or p2 == "" then
        return nil
    end
    local v1 = getGroupLookup()
    local v2 = p2:lower()
    for k, v in pairs(v1) do
        if k:lower() ~= v2 and v:lower() ~= v2 then
            continue
        end
        return v
    end
    for k2, i in pairs(v1) do
        if k2:lower():sub(1, #v2) ~= v2 and i:lower():sub(1, #v2) ~= v2 then
            continue
        end
        return i
    end
    local v3 = autocomplete(v2)
    local v4 = v3[1]
    if v4 then
        return v1[v4]
    end
    return (tostring(v2))
end
return function(p1) -- Line: 115 -- upvalues: autocomplete (val), sanitize (val)
    return {autocomplete = autocomplete, sanitize = sanitize, description = p1 or "The group to perform the action on, or the name of the group to create."}
end