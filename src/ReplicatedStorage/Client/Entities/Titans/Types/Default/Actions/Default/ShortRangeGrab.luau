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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.ShortRangeGrab
--                              Dumped in 0.000627 seconds
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
local u129 = {box = "ShortRangeGrab", impactAt = 0.32360000000000005}
return {
    detection = u129,
    attempt = function(p1) -- Line: 91 -- upvalues: CooldownTitanClient (val), DetectionBoxTitanClient (val), u129 (val)
        local v1, v2
        local v3 = {"ShortRangeGrabAttempt", "ShortRangeGrab"}
        if CooldownTitanClient.isOnCooldown(p1, v3) then
            return false
        end
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, u129)
        if not v1 or not v2 then
            return false
        end
        local v4 = {v2 .. "Arm", "Bite"}
        if CooldownTitanClient.isOnCooldown(p1, v4) then
            return false
        end
        CooldownTitanClient.addClientCooldown(p1, {"ShortRangeGrabAttempt", v2 .. "Arm"}, 0.5)
        return true, v2
    end,
    execute = function(p1, p2, p3, p4, p5) -- Line: 39 -- upvalues: Sounds (val), Titans (val), CooldownTitanClient (val), HitboxTitanClient (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 500, 15, {min = 0.8, max = 1.2})
        CooldownTitanClient.addClientCooldown(p1, "ShortRangeGrab", 2)
        CooldownTitanClient.addClientCooldown(p1, p5 .. "Arm", 1)
        local u32 = HitboxTitanClient.createLimbHitbox(p1, {limb = "Arm", debounce = 0.2, priority = "Hand", side = p5})
        u32.touched:Connect(function(p1) -- Line: 61 -- upvalues: p4 (val), u32 (val)
            if p1 == "Hand" then
                p4(p1)
                u32.destroy()
                return
            end
            if p1 ~= "LowerArm" then
                return
            end
            p4(p1)
            u32.destroy()
        end)
        p2:Add(task.delay(1, function() -- Line: 73 -- upvalues: u32 (val)
            u32.destroy()
        end))
        p2:Add(function() -- Line: 78 -- upvalues: u32 (val)
            u32.destroy()
        end)
        return true
    end,
}