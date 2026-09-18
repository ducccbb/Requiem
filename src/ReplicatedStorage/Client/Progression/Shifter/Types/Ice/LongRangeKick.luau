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
--      File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.LongRangeKick
--                              Dumped in 0.000630 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_3:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, p2, ...) -- Line: 90 -- upvalues: Sounds (val), Titans (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
    end,
    onAbilityReplicated = function(p1, p2, p3, ...) -- Line: 27 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), Promise (val), HitboxTitanClient (val)
        local v1
        _, v1 = useWalkSpeed()
        local u11 = v1("stomp", 0, "set", 10)
        if not p1.model or not (ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations.LongRangeKick)) then
            return
        end
        if not (Promise.new(function(a1) -- Line: 40 -- upvalues: u11 (val), HitboxTitanClient (upval), p1 (val)
    local finish, u1, u15, v1, v2, v3
    u1 = false
    function finish(p1) -- Line: 43 -- upvalues: u1 (ref), u11 (upval), a1 (val)
        local v4
        if not u1 then
            u1 = true
            u11()
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
    v2 = {side = "Left", limb = "Leg", debounce = 0.2, priority = "Foot"}
    v3 = {
        shake = true,
        concuss = true,
        ragdoll = true,
        threshold = 5,
        ungrapple = true,
    }
    v2.wires = v3
    u15 = HitboxTitanClient.createLimbHitbox(v1, v2)
    u15.touched:Connect(function(p1) -- Line: 72 -- upvalues: u15 (val), finish (val)
        local v4
        u15.destroy()
        finish(true)
        return
    end)
    task.delay(3.5, function() -- Line: 77 -- upvalues: u15 (val), finish (val)
        local v5
        u15.destroy()
        finish(false)
        return
    end)
    return
end):expect()) then
            return false
        end
        return true, 0
    end,
}