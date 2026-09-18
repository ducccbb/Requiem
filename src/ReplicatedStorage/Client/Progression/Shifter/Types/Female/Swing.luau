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
--         File: ReplicatedStorage.Client.Progression.Shifter.Types.Female.Swing
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  12 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client_2:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Ragdoll = require(Utilities_2:WaitForChild("Ragdoll"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_4 = Common_7:WaitForChild("Utilities")
local Character = require(Utilities_4:WaitForChild("Character"))
return {
    onAbilityRequested = function(p1, p2) -- Line: 145 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), HitboxTitanClient (val), Player (val), Shifter (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 10, {min = 0.8, max = 1.2})
        local v1 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p2)
        if not v1 then
            return false
        end
        task.delay(v1.Length / 2, function() -- Line: 165 -- upvalues: HitboxTitanClient (upval), p1 (val), Player (upval), Shifter (upval)
            local u15 = HitboxTitanClient.onCreateTitanVersusTitanHitox(p1.root, {lifetime = 0.2, offset = CFrame.new(0, 0, -75), size = Vector3.new(80, 80, 60)})
            u15.touched:Connect(function(p1) -- Line: 173 -- upvalues: Player (upval), Shifter (upval)
                Player.Shifter.post(Shifter.Effects.Hit, p1)
            end)
            task.delay(0.3, function() -- Line: 178 -- upvalues: u15 (val)
                u15.destroy()
            end)
        end)
        return true
    end,
    onAbilityReplicated = function(p1) -- Line: 39 -- upvalues: Sounds (val), Titans (val), Promise (val), HitboxTitanClient (val), ClientGearHandler (val), Ragdoll (val), Character (val)
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        task.wait(0.25)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 1.5, {min = 0.8, max = 1.3})
        local v1 = Promise.new(function(a1) -- Line: 58 -- upvalues: HitboxTitanClient (upval), p1 (val)
            local v1
            local u1 = false
            local function finish(p1) -- Line: 63 -- upvalues: u1 (ref), a1 (val)
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
            local u22 = createLimbHitbox(v2, v3)
            u22.touched:Connect(function(p1) -- Line: 95 -- upvalues: u22 (val), finish (val)
                u22.destroy()
                finish(true)
            end)
            task.delay(0.7, function() -- Line: 101 -- upvalues: u22 (val), finish (val)
                u22.destroy()
                finish(false)
            end)
        end):expect()
        if v1 then
            local v2 = ClientGearHandler.getGearState()
            if v2 then
                v2.signals.ungrapple:Fire("Left")
                v2.signals.ungrapple:Fire("Right")
            end
            Ragdoll.ragdoll(Character.getCharacter(), true)
            task.delay(1.5, function() -- Line: 119 -- upvalues: Ragdoll (upval), Character (upval)
                Ragdoll.ragdoll(Character.getCharacter(), false)
            end)
            task.defer(function() -- Line: 124 -- upvalues: p1 (val)
                local root = p1.root
                if not root then
                    return
                end
                root.AssemblyLinearVelocity = (root.Position - root.Position).Unit * 500 + Vector3.new(0, -100, 0)
            end)
        end
        return v1, 1
    end,
}