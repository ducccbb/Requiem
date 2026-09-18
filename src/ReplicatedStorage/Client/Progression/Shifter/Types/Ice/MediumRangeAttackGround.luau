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
-- File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.MediumRangeAttackGround
--                              Dumped in 0.000606 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, p2, ...) -- Line: 76 -- upvalues: ClientShifterAnimationHandler (val), Sounds (val), Titans (val)
        if not p1.model or not p1.root then
            return
        end
        ClientShifterAnimationHandler.getTrackFromAnimation(p1, p2)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
    end,
    onAbilityReplicated = function(p1, p2, ...) -- Line: 22 -- upvalues: Sounds (val), Titans (val), Promise (val), HitboxTitanClient (val)
        if not p1.model or not p1.root then
            return false
        end
        task.wait(0.2)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        if not (Promise.new(function(a1) -- Line: 30 -- upvalues: HitboxTitanClient (upval), p1 (val)
    local finish, u1, u15, v1, v2, v3
    u1 = false
    function finish(p1) -- Line: 33 -- upvalues: u1 (ref), a1 (val)
        local v4
        if not u1 then
            u1 = true
            a1(p1)
            return
        else
            return
        end
    end
    v1 = {}
    v2 = {}
    v2.client = p1.model
    v1.model = v2
    v1.root = p1.root
    v1.scale = p1.scale
    v2 = {
        side = "Both",
        limb = "Arm",
        debounce = 0.2,
        priority = "Hand",
        delayed = 0.5,
    }
    v3 = {shake = true, concuss = true, ungrapple = true}
    v2.wires = v3
    u15 = HitboxTitanClient.createLimbHitbox(v1, v2)
    u15.touched:Connect(function(p1) -- Line: 58 -- upvalues: u15 (val), finish (val)
        local v4
        u15.destroy()
        finish(true)
        return
    end)
    task.delay(3.5, function() -- Line: 63 -- upvalues: u15 (val), finish (val)
        local v5
        u15.destroy()
        finish(false)
        return
    end)
    return
end):expect()) then
            return false
        end
        return true
    end,
}