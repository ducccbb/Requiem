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
--                            File: ReplicatedStorage.Client
--                               Dumped in 0.00268 seconds
--                          Bytecode version 9  |  1 functions

local Profiling
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if not (ReplicatedFirst:FindFirstChild("Profiling")) then
    local v3
    local ReplicatedFirst_2 = ReplicatedStorage:WaitForChild("ReplicatedFirst")
    ReplicatedFirst_2:WaitForChild("Profiling")
    for i, j in ReplicatedFirst_2:GetChildren() do
        print((("[Requiem] Dropping %* from backup..."):format(j.Name)))
        v3 = j:Clone()
        if v3:IsA("BaseScript") then
            if not (v3:IsA("ModuleScript")) then
                v3.Enabled = true
            end
            v3.Parent = ReplicatedFirst
            print((("[Requiem] Loaded %* from backup..."):format(v3.Name)))
        elseif not (v3:IsA("Script")) and not (v3:IsA("LocalScript")) and not (v3:IsA("ModuleScript")) then
        end
    end
    print("[Requiem] Loaded Profiling from Backup...")
end
local ReplicatedFirst_3 = game:GetService("ReplicatedFirst")
if not (require(ReplicatedFirst_3:WaitForChild("Profiling")).IS_USING_CUSTOM_REPLICATION) then
    local Common_3 = v1.Parent:WaitForChild("Common")
    local Utilities_2 = Common_3:WaitForChild("Utilities")
    require(Utilities_2:WaitForChild("Ragdoll"))
else
    local Common = v1.Parent:WaitForChild("Common")
    require(Common:WaitForChild("Chrono")).Start()
    local Common_2 = v1.Parent:WaitForChild("Common")
    local Utilities = Common_2:WaitForChild("Utilities")
    require(Utilities:WaitForChild("ChronoRagdoll"))
end
local Common_4 = v1.Parent:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Ignite = require(Utilities_3:WaitForChild("Ignite"))
Ignite(ReplicatedStorage.Common.Network.Namespaces)
Ignite(v1:WaitForChild("User"))
local Progression = v1:WaitForChild("Progression")
Ignite(Progression:WaitForChild("Shifter"))
local Interfaces = v1:WaitForChild("Interfaces")
require(Interfaces:WaitForChild("App"))()
local Common_5 = v1.Parent:WaitForChild("Common")
local Effects = Common_5:WaitForChild("Effects")
require(Effects:WaitForChild("Effects"))
Ignite(v1:WaitForChild("World"))
Ignite(v1:WaitForChild("Entities"))