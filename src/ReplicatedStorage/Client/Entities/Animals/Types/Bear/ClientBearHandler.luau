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
--     File: ReplicatedStorage.Client.Entities.Animals.Types.Bear.ClientBearHandler
--                              Dumped in 0.000848 seconds
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
local u101 = {}
local LocalPlayer = Players.LocalPlayer
local function onCycleBearActions(p1) -- Line: 65 -- upvalues: LocalPlayer (val), u101 (val), Animal (val)
    local v1
    if p1.inactive or p1.__internal.dead or not p1.throttle then
        return
    end
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return p1.throttle(2)
    end
    local v2 = math.clamp((HumanoidRootPart.Position - p1.root.Position).Magnitude / 2000, 0.075, 1)
    p1.throttle(v2)
    local v3 = {}
    local Universal = u101.Universal
    local v4 = nil
    local v5 = nil
    for i, j in Universal, v4, v5 do
        table.insert(v3, {name = i, action = j})
    end
    table.sort(v3, function(p1, p2) -- Line: 94
        local v1 = p2.action.priority < p1.action.priority
        return v1
    end)
    local v6 = v3
    v4 = nil
    v5 = nil
    for k, n in v6, v4, v5 do
        v1 = {n.action.attempt(p1)}
        if v1[1] then
            Animal.Action.unreliablePost(p1.id, n.name, table.unpack(v1, 2))
            return
        end
    end
end
task.spawn(function() -- Line: 136 -- upvalues: u0 (val), u101 (val)
    local v1, v2
    local Actions = u0.Parent:FindFirstChild("Actions")
    if not Actions then
        warn("No Actions folder found for Bear client")
        return
    end
    for i, j in Actions:GetChildren() do
        if j:IsA("Folder") then
            u101[j.Name] = {}
            for k, n in j:GetChildren() do
                if n:IsA("ModuleScript") then
                    v1 = require(n)
                    v2 = u101[j.Name]
                    v2[n.Name] = v1
                end
            end
        end
    end
end)
return {
    onAnimalSpawned = function(p1) -- Line: 125 -- upvalues: trove (val)
        if not p1.cleanup then
            p1.cleanup = trove.new()
        end
    end,
    onAnimalStepped = function(p1) -- Line: 116 -- upvalues: onCycleBearActions (val)
        onCycleBearActions(p1)
    end,
    onActionReceived = function(p1, p2, p3, ...) -- Line: 34 -- upvalues: u101 (val), Animal (val)
        local v1, v2, v3
        local v4 = u101
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
                    n.execute(u0, u0.cleanup, function(...) -- Line: 38 -- upvalues: u0 (val), Animal (upval), u2 (val)
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