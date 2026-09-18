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
--      File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.EyeGrabAttack
--                              Dumped in 0.000684 seconds
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
    onAbilityRequested = function(p1, ...) -- Line: 77 -- upvalues: Sounds (val), Titans (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
    end,
    onAbilityReplicated = function(p1, p2, p3, ...) -- Line: 21 -- upvalues: Sounds (val), Titans (val), Promise (val), HitboxTitanClient (val)
        local v1
        if not p1.model or not p1.root then
            return false
        end
        task.wait(0.2)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
        if not (Promise.new(function(a1) -- Line: 29 -- upvalues: HitboxTitanClient (upval), p1 (val)
    local createLimbHitbox, finish, u1, u21, v1, v2, v3
    u1 = false
    function finish(p1) -- Line: 32 -- upvalues: u1 (ref), a1 (val)
        local v4
        if not u1 then
            u1 = true
            a1(p1)
            return
        else
            return
        end
    end
    createLimbHitbox = HitboxTitanClient.createLimbHitbox
    v1 = {}
    v2 = {}
    v2.client = p1.model
    v1.model = v2
    v1.root = p1.root
    v1.scale = p1.scale
    v2 = {side = "Right", limb = "Arm", debounce = 0.2, priority = "Hand"}
    v3 = {shake = true, concuss = true, ungrapple = true}
    v2.wires = v3
    v3 = {}
    v3.Hand = Vector3.new(25, 25, 25)
    v2.padding = v3
    u21 = createLimbHitbox(v1, v2)
    u21.touched:Connect(function(p1) -- Line: 59 -- upvalues: u21 (val), finish (val)
        local v4
        u21.destroy()
        finish(true)
        return
    end)
    task.delay(0.7, function() -- Line: 64 -- upvalues: u21 (val), finish (val)
        local v5
        u21.destroy()
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