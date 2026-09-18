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
--     File: ReplicatedStorage.Client.Entities.Animals.Types.Wolf.ClientWolfHandler
--                              Dumped in 0.000870 seconds
--                          Bytecode version 9  |  8 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
require(Animals:WaitForChild("Actions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Animal = require(Namespaces:WaitForChild("Animal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types_2 = Common_3:WaitForChild("Types")
local Animals_2 = Types_2:WaitForChild("Animals")
require(Animals_2:WaitForChild("Animal"))
local u101 = {"Roaming", "Stalking", "Combat", "Universal"}
local u106 = {}
local function onCycleWolfActions(p1) -- Line: 72 -- upvalues: Players (val), u101 (val), u106 (val), Animal (val)
    local v1
    if p1.inactive or p1.__internal.dead or not p1.exposed.nearestPlayers then
        return
    end
    local v2 = false
    for i, v in ipairs(p1.exposed.nearestPlayers) do
        if v == Players.LocalPlayer.UserId then
            v2 = true
            break
        end
    end
    if not v2 then
        return
    end
    local v3 = u101[p1.exposed.state or 1]
    if not v3 then
        return
    end
    local v4 = u106[v3]
    if not v4 then
        return
    end
    local v5 = {}
    local v6 = v4
    local v7 = nil
    local v8 = nil
    for i2, j in v6, v7, v8 do
        table.insert(v5, {name = i2, action = j})
    end
    table.sort(v5, function(p1, p2) -- Line: 114
        local v1 = p2.action.priority < p1.action.priority
        return v1
    end)
    v6 = v5
    v7 = nil
    v8 = nil
    for k, n in v6, v7, v8 do
        v1 = {n.action.attempt(p1)}
        if v1[1] then
            Animal.Action.unreliablePost(p1.id, n.name, table.unpack(v1, 2))
            return
        end
    end
end
task.spawn(function() -- Line: 156 -- upvalues: u0 (val), u106 (val)
    local v1, v2
    local Actions = u0.Parent:FindFirstChild("Actions")
    if not Actions then
        warn("No Actions folder found for Wolf client")
        return
    end
    for i, j in Actions:GetChildren() do
        if j:IsA("Folder") then
            u106[j.Name] = {}
            for k, n in j:GetChildren() do
                if n:IsA("ModuleScript") then
                    v1 = require(n)
                    v2 = u106[j.Name]
                    v2[n.Name] = v1
                end
            end
        end
    end
end)
return {
    onAnimalSpawned = function(p1) -- Line: 145 -- upvalues: trove (val)
        if not p1.cleanup then
            p1.cleanup = trove.new()
        end
    end,
    onAnimalStepped = function(p1) -- Line: 136 -- upvalues: onCycleWolfActions (val)
        onCycleWolfActions(p1)
    end,
    onActionReceived = function(p1, p2, p3, ...) -- Line: 41 -- upvalues: u106 (val), Animal (val)
        local v1, v2, v3
        local v4 = u106
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v2 = j
            v3 = nil
            v1 = nil
            for k, n in v2, v3, v1 do
                if k == v7 then
                    u0.cleanup:Clean()
                    if u0.inactive then
                        return
                    end
                    n.execute(u0, u0.cleanup, function(...) -- Line: 45 -- upvalues: u0 (val), Animal (upval), u2 (val)
                        if u0.inactive then
                            return
                        end
                        Animal.Respond.unreliablePost(u0.id, u2, ...)
                    end, ...)
                    return
                end
            end
        end
    end,
}