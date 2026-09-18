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
--         File: ReplicatedStorage.Client.Progression.Shifter.Types.Female.Nape
--                              Dumped in 0.000552 seconds
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
    onAbilityRequested = function(p1, ...) -- Line: 95 -- upvalues: Sounds (val), Titans (val)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 10, {min = 0.8, max = 1.2})
    end,
    onAbilityReplicated = function(p1) -- Line: 29 -- upvalues: Sounds (val), Titans (val), Promise (val), HitboxTitanClient (val)
        local model = p1.model
        if model then
            model = p1.model:FindFirstChild("HumanoidRootPart")
        end
        if not model then
            return false
        end
        task.wait(0.2)
        Sounds.playFalloffSoundEffect(Titans.LargeMovementWoosh, p1.root, 800, 5, {min = 0.8, max = 1.2})
        return Promise.new(function(a1) -- Line: 40 -- upvalues: HitboxTitanClient (upval), p1 (val)
            local u1 = false
            local function finish(p1) -- Line: 45 -- upvalues: u1 (ref), a1 (val)
                if u1 then
                    return
                end
                u1 = true
                a1(p1)
            end
            local u11 = HitboxTitanClient.createLimbHitbox({
                model = {client = p1.model},
            }, {
                side = "Right",
                limb = "Arm",
                debounce = 0.2,
                priority = "Hand",
                collisionGroup = "Default",
                wires = {
                    shake = true,
                    ungrapple = true,
                    concuss = true,
                    ragdoll = true,
                    threshold = 5,
                },
            })
            u11.touched:Connect(function(p1) -- Line: 74 -- upvalues: u11 (val), finish (val)
                u11.destroy()
                finish(true)
            end)
            task.delay(0.7, function() -- Line: 80 -- upvalues: u11 (val), finish (val)
                u11.destroy()
                finish(false)
            end)
        end):expect(), 1
    end,
}