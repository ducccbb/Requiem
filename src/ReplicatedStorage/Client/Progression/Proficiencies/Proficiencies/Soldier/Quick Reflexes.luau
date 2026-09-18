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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Soldier.Quick Reflexes
--                              Dumped in 0.000527 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
return {
    requested = function(p1) -- Line: 28 -- upvalues: Signals (val), ClientGearHandler (val), Character (val), Sounds (val), Proficiencies (val), RunService (val)
        local RightVector
        if type(p1.cooldown) == "number" and 0 < p1.cooldown then
            Signals.ProficiencyCooldownAdjusted:Fire({name = "Soldier", node = "Quick Reflexes", remaining = p1.cooldown})
        end
        if not p1.dodging then
            return
        end
        local v1 = ClientGearHandler.getGearState()
        local v2 = Character.getCharacter()
        if not v2 then
            return
        end
        if p1.direction ~= "Left" then
            RightVector = v2.HumanoidRootPart.CFrame.RightVector
        else
            RightVector = -v2.HumanoidRootPart.CFrame.RightVector
            if not RightVector then
                RightVector = v2.HumanoidRootPart.CFrame.RightVector
            end
        end
        local HumanoidRootPart = v2.HumanoidRootPart
        if not HumanoidRootPart then
            return
        end
        Signals.Monologue:Fire({"My quick reflexes saved me...", "I'm lucky I was able to dodge that..."})
        Sounds.playGlobalSoundEffect(Proficiencies.QuickReflexes, 0.1, 1, 3)
        local Magnitude = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        if v1 then
            v1.signals.clearMomentum:Fire()
        end
        ;(function(a1) -- Line: 69 -- upvalues: RunService (upval), p1 (val), HumanoidRootPart (val), RightVector (val), Magnitude (val)
            local u1 = nil
            local u2 = 0
        end)(0.3)
    end,
}