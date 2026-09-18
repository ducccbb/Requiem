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
--                  File: ReplicatedStorage.Common.Types.Animals.Animal
--                              Dumped in 0.000372 seconds
--                          Bytecode version 9  |  2 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Network = v1.Parent.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Animal"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local v3 = require(Packages:WaitForChild("octo-tree"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
return {
    States = {Inactive = 0, Moving = 1, Action = 2, Dead = 3},
    Emotions = {Neutral = 0, Stalking = 1, Angry = 2},
    Octree = v3.new(),
    getAnimalFolder = function() -- Line: 221 -- upvalues: RunService (val)
        local Animals
        if not (RunService:IsServer()) then
            return (workspace:WaitForChild("Animals"))
        end
        Animals = workspace:FindFirstChild("Animals")
        if not Animals then
            local Folder = Instance.new("Folder")
            Folder.Name = "Animals"
            Folder.Parent = workspace
            Animals = Folder
        end
        return Animals
    end,
}