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
--          File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.Swing
--                              Dumped in 0.000864 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
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
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return {
    onAbilityRequested = function(p1, p2) -- Line: 115 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), HitboxTitanClient (val), Player (val), Shifter (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 10, {min = 0.8, max = 1.2})
        local v1 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p2)
        if not v1 then
            return false
        end
        task.delay(v1.Length / 2, function() -- Line: 131 -- upvalues: HitboxTitanClient (upval), p1 (val), Player (upval), Shifter (upval)
            local v1, v2
            local u15 = HitboxTitanClient.onCreateTitanVersusTitanHitox(p1.root, {lifetime = 0.2, offset = CFrame.new(0, 0, -75), size = Vector3.new(80, 80, 60)})
            u15.touched:Connect(function(p1) -- Line: 138 -- upvalues: Player (upval), Shifter (upval)
                Player.Shifter.post(Shifter.Effects.Hit, p1)
            end)
            v1, v2 = HitboxTitanClient.onCreateEnvironmentalHitbox(p1.root)
            if v1 and v2 then
                Player.Shifter.post(Shifter.Effects.Environment, v2)
            end
            task.delay(0.3, function() -- Line: 151 -- upvalues: u15 (val)
                u15.destroy()
            end)
        end)
        return true
    end,
    onAbilityReplicated = function(p1) -- Line: 35 -- upvalues: Sounds (val), Titans (val), Promise (val), HitboxTitanClient (val)
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        task.wait(0.25)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 1.5, {min = 0.8, max = 1.2})
        return Promise.new(function(a1) -- Line: 54 -- upvalues: HitboxTitanClient (upval), p1 (val)
            local v1
            local u1 = false
            local function finish(p1) -- Line: 59 -- upvalues: u1 (ref), a1 (val)
                if u1 then
                    return
                end
                u1 = true
                a1(p1)
            end
            local createLimbHitbox = HitboxTitanClient.createLimbHitbox
            local v2 = {
                model = {client = p1.model},
            }
            local v3 = {
                side = "Both",
                limb = "Arm",
                debounce = 0.2,
                priority = "Hand",
                collisionGroup = "Default",
            }
            if math.random() >= 0.4 then
                v1 = nil
            else
                v1 = {
                    shake = true,
                    ungrapple = true,
                    concuss = true,
                    ragdoll = true,
                    threshold = 15,
                }
                if not v1 then
                    v1 = nil
                end
            end
            v3.wires = v1
            v3.padding = {Hand = Vector3.new(5, 5, 5)}
            local u28 = createLimbHitbox(v2, v3)
            u28.touched:Connect(function(p1) -- Line: 95 -- upvalues: u28 (val), finish (val)
                u28.destroy()
                finish(true)
            end)
            task.delay(0.7, function() -- Line: 101 -- upvalues: u28 (val), finish (val)
                u28.destroy()
                finish(false)
            end)
        end):expect(), 1
    end,
}