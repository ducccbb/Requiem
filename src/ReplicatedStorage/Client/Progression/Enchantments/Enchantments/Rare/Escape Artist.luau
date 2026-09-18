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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Escape Artist
--                              Dumped in 0.000460 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local v2 = {
    description = "Using Finesse to escape a titan's grip will now boost you into the air and set you at your max velocity.",
    passive = true,
    upgradable = false,
    gear = true,
    aerial = true,
    prerequisites = {
        wall = "Maria",
        enchantments = {"Finesse"},
    },
}
return {
    requested = function() -- Line: 34 -- upvalues: Character (val), ClientGearHandler (val), Effects (val)
        local Unit
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        local v2 = ClientGearHandler.getGearState()
        if v2 and v2.enabled then
            v2.signals.setMaxVelocityGain:Fire()
            v2.signals.beginSimulatedMomentum:Fire()
        end
        HumanoidRootPart.Position = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
        local LookVector = HumanoidRootPart.CFrame.LookVector
        local v3 = Vector3.new(LookVector.X, 0, LookVector.Z)
        if 0 >= v3.Magnitude then
            Unit = Vector3.zero
        else
            Unit = v3.Unit
        end
        HumanoidRootPart.AssemblyLinearVelocity = Unit * 80 + Vector3.new(0, 200, 0)
        Effects.sendReplicatedEffect("Dash")
    end,
    settings = v2,
}