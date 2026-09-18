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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanArmCut
--                              Dumped in 0.000329 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local Utilities = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local AnimationTitanClient = require(Utilities:WaitForChild("AnimationTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities_2:WaitForChild("CooldownTitanClient"))
return {
    attempt = function(p1) -- Line: 50
        return false
    end,
    execute = function(p1, p2) -- Line: 26 -- upvalues: AnimationTitanClient (val), CooldownTitanClient (val)
        if not (AnimationTitanClient.getAnimationFromName(p1, "DefaultTitanArmCut")) then
            return false
        end
        task.spawn(function() -- Line: 34 -- upvalues: AnimationTitanClient (upval), p1 (val), CooldownTitanClient (upval)
            local v1 = AnimationTitanClient.getAnimationLength(p1, "DefaultTitanArmCut")
            CooldownTitanClient.addClientCooldown(p1, "LeftArm", v1 + 2)
            CooldownTitanClient.addClientCooldown(p1, "RightArm", v1 + 2)
        end)
        return true
    end,
}