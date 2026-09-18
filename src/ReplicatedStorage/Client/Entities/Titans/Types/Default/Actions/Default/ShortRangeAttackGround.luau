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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.ShortRangeAttackGround
--                              Dumped in 0.000668 seconds
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
local Utilities_4 = v1.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local KinematicTitanClient = require(Utilities_4:WaitForChild("KinematicTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_5 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u144 = {box = "ShortRangeAttackGround", impactAt = 0.2427}
return {
    detection = u144,
    attempt = function(p1) -- Line: 110 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u144 (val)
        local v1 = {"ShortRangeAttackGroundAttempt", "ShortRangeAttackGround"}
        if CooldownTitanClient.isOnCooldown(p1, v1) or math.random() < 0.95 or not (DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u144)) then
            return false
        end
        local v2 = {"LeftArm", "RightArm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v2) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"LeftArm", "RightArm"}, 0.5)
        CooldownTitanClient.addClientCooldown(p1, "ShortRangeAttackGroundAttempt", 1)
        return true
    end,
    execute = function(p1, p2, p3, p4) -- Line: 40 -- upvalues: Sounds (val), Titans (val), KinematicTitanClient (val), CooldownTitanClient (val), HitboxTitanClient (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15)
        Sounds.playFalloffSoundEffect(Titans.ShortRangeAttackGround1, p1.root, 500, 15)
        KinematicTitanClient.suppressLookAtFor(p1.id, {easeInSec = 0.16, holdSec = 1.05, easeOutSec = 0.34})
        CooldownTitanClient.addClientCooldown(p1, "ShortRangeAttackGround", 8)
        CooldownTitanClient.addClientCooldown(p1, "LeftArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "RightArm", 2)
        CooldownTitanClient.addClientCooldown(p1, "Bite", 2)
        local u54 = HitboxTitanClient.createLimbHitbox(p1, {
            side = "Both",
            limb = "Arm",
            debounce = 0.2,
            priority = "Hand",
            wires = {shake = true, concuss = true, ungrapple = true},
        })
        u54.touched:Connect(function(a1, p2) -- Line: 80 -- upvalues: HitboxTitanClient (upval), p1 (val), p4 (val), u54 (val)
            if a1 == "Hand" then
                p4(p2)
                u54.destroy()
                return
            end
            if a1 ~= "LowerArm" then
                return HitboxTitanClient.onKnockbackFromLimb(p1, a1, p2)
            end
            p4(p2)
            u54.destroy()
        end)
        p2:Add(task.delay(2, function() -- Line: 92 -- upvalues: u54 (val)
            u54.destroy()
        end))
        p2:Add(function() -- Line: 97 -- upvalues: u54 (val)
            u54.destroy()
        end)
        return true
    end,
}