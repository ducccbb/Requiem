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
--    File: ReplicatedStorage.Client.Progression.Shifter.Types.Female.RoundHousekick
--                              Dumped in 0.000870 seconds
--                          Bytecode version 9  |  11 functions

local u0 = script
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
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Utilities_2 = Titans_2:WaitForChild("Utilities")
local HitboxTitanClient = require(Utilities_2:WaitForChild("HitboxTitanClient"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Promise = require(Common_5:WaitForChild("Promise"))
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local Effects = require(Universal_2:WaitForChild("ClientShifterEffectHandler")).Effects
return {
    onAbilityRequested = function(p1, p2) -- Line: 106 -- upvalues: Sounds (val), Titans (val), ClientShifterAnimationHandler (val), u0 (val), Effects (val), HitboxTitanClient (val), Player (val), Shifter (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 10, {min = 0.8, max = 1.2})
        local v1 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
        if not v1 then
            return false
        end
        task.delay(0.55, function() -- Line: 125 -- upvalues: Effects (upval), p1 (val)
            Effects.particle("RoundHouseKick", p1.root)
            local v1 = p1.root.Position - Vector3.new(0, 50, 0)
            Effects.particle("Shockwave", v1, p1.model)
        end)
        task.delay(v1.Length / 2, function() -- Line: 135 -- upvalues: HitboxTitanClient (upval), p1 (val), Player (upval), Shifter (upval)
            local u15 = HitboxTitanClient.onCreateTitanVersusTitanHitox(p1.root, {lifetime = 0.2, offset = CFrame.new(0, 0, -75), size = Vector3.new(80, 80, 60)})
            u15.touched:Connect(function(p1) -- Line: 143 -- upvalues: Player (upval), Shifter (upval)
                Player.Shifter.post(Shifter.Effects.Hit, p1)
            end)
            task.delay(0.3, function() -- Line: 148 -- upvalues: u15 (val)
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
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 2000, 3, {min = 0.8, max = 1.2})
        return Promise.new(function(a1) -- Line: 48 -- upvalues: HitboxTitanClient (upval), p1 (val)
            local v1
            local u1 = false
            local function finish(p1) -- Line: 53 -- upvalues: u1 (ref), a1 (val)
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
                limb = "Leg",
                debounce = 0.2,
                priority = "Foot",
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
            u22.touched:Connect(function(p1) -- Line: 85 -- upvalues: u22 (val), finish (val)
                u22.destroy()
                finish(true)
            end)
            task.delay(0.7, function() -- Line: 91 -- upvalues: u22 (val), finish (val)
                u22.destroy()
                finish(false)
            end)
        end):expect(), 1
    end,
}