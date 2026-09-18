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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanBlinded
--                              Dumped in 0.000460 seconds
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
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_3:WaitForChild("KinematicTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_4 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    attempt = function(p1) -- Line: 64
        return false
    end,
    execute = function(p1, p2) -- Line: 32 -- upvalues: AnimationTitanClient (val), Sounds (val), Titans (val), CooldownTitanClient (val), KinematicTitanClient (val)
        local v1 = AnimationTitanClient.getAnimationFromName(p1, "DefaultTitanBlinded")
        if not v1 then
            return false
        end
        Sounds.playFalloffSoundEffect(Titans.Blindings[v1.id], p1.root, 500, 5, {min = 0.8, max = 1.2})
        task.defer(function() -- Line: 44 -- upvalues: AnimationTitanClient (upval), p1 (val), CooldownTitanClient (upval), KinematicTitanClient (upval)
            local v1 = AnimationTitanClient.getAnimationLength(p1, "DefaultTitanBlinded")
            CooldownTitanClient.addClientCooldown(p1, "blinded", v1)
            local v2 = math.max(0.05, v1 - 0.22 - 0.4)
            KinematicTitanClient.suppressLookAtFor(p1.id, {easeInSec = 0.22, easeOutSec = 0.4, holdSec = v2})
        end)
        return true
    end,
}