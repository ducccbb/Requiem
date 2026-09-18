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
--                      File: ReplicatedStorage.Common.Types.Titan
--                              Dumped in 0.000575 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Titan"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local v3 = require(Packages:WaitForChild("octo-tree"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
require(Packages_2:WaitForChild("trove"))
require(v1.Parent:WaitForChild("TitanNapeProtection"))
local v4 = Vector3.new(4, 5.11, 1.286)
local v5 = require(v1.Parent.Parent:WaitForChild("Config")).define({EYES_PROTECTION_MULTIPLIER = 0.8, NAPE_PROTECTION_MULTIPLIER = 0.8})
return {
    MAGIC_HEIGHT_MULTIPLIER = 0.795,
    getTitanFolder = function() -- Line: 314 -- upvalues: RunService (val)
        local Titans
        if not (RunService:IsServer()) then
            return (workspace:WaitForChild("Titans"))
        end
        Titans = workspace:FindFirstChild("Titans")
        if not Titans then
            local Folder = Instance.new("Folder")
            Folder.Name = "Titans"
            Folder.Parent = workspace
            Titans = Folder
        end
        return Titans
    end,
    getTitanGoals = function() -- Line: 337 -- upvalues: RunService (val)
        local TitanGoals
        if not (RunService:IsServer()) then
            return (workspace:WaitForChild("TitanGoals"))
        end
        TitanGoals = workspace:FindFirstChild("TitanGoals")
        if not TitanGoals then
            local Folder = Instance.new("Folder")
            Folder.Name = "TitanGoals"
            Folder.Parent = workspace
            TitanGoals = Folder
        end
        return TitanGoals
    end,
    DEFAULT_TITAN_SIZE = v4,
    States = {
        Inactive = 0,
        Moving = 1,
        Action = 2,
        Dead = 3,
        Blinded = 4,
    },
    Emotions = {Neutral = 0, Aggressive = 1, Angry = 2, Enraged = 3},
    Octree = v3.new(),
    SUPPORTER_DISABLED_ACTIONS = {"LongRangeAttackAir", "LongRangeAttackGround"},
    ICE_DISABLED_ACTIONS = {
        "LongRangeAttackAir",
        "LongRangeAttackGround",
        "LongRangeBite",
        "MediumRangeBite",
        "MediumRangeAttackGround",
    },
    Constants = v5,
}