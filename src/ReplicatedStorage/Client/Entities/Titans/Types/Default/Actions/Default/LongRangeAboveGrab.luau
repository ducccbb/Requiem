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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.LongRangeAboveGrab
--                              Dumped in 0.000607 seconds
--                          Bytecode version 9  |  6 functions

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
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities_2:WaitForChild("DetectionBoxTitanClient"))
local Utilities_3 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_3:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_4 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u129 = {box = "LongRangeAboveGrab", impactAt = 0.32360000000000005}
return {
    detection = u129,
    attempt = function(p1) -- Line: 101 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u129 (val)
        local v1 = {"LongRangeAboveGrabAttempt", "LongRangeAboveGrab"}
        if CooldownTitanClient.isOnCooldown(p1, v1) or not (DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u129)) then
            return false
        end
        local v2 = {"LeftArm", "RightArm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"LongRangeAboveGrabAttempt", "LeftArm", "RightArm"}, 0.5)
        return true
    end,
    execute = function(p1, p2, p3, p4) -- Line: 39 -- upvalues: Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        CooldownTitanClient.addClientCooldown(p1, "LongRangeAboveGrab", 2)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 1)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 1)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 1)
        local u42 = HitboxTitanClient.createLimbHitbox(p1, {
            side = "Left",
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u42.touched:Connect(function(a1) -- Line: 71 -- upvalues: HitboxTitanClient (upval), p1 (val), p4 (val), u42 (val)
            if a1 == "Hand" then
                p4(a1)
                u42.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, "Left")
            end
            p4(a1)
            u42.destroy()
        end)
        p2:Add(task.delay(1, function() -- Line: 83 -- upvalues: u42 (val)
            u42.destroy()
        end))
        p2:Add(function() -- Line: 88 -- upvalues: u42 (val)
            u42.destroy()
        end)
        return true
    end,
}