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
--   File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.Getaway
--                              Dumped in 0.000489 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Proficiencies = require(Animations:WaitForChild("Proficiencies"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
return {
    verify = function() -- Line: 41 -- upvalues: ClientStateHandler (val), States (val), Signals (val), Character (val)
        if ClientStateHandler.isStateBusy(States.KNOCKED) then
            Signals.Toast:Fire({message = "You cannot use this while knocked out.", type = "error"})
            return false
        end
        if ClientStateHandler.isStateBusy(States.RAGDOLLED) or Character.isRagdolled() then
            return true
        end
        Signals.Toast:Fire({message = "You must be ragdolled to use this enchantment.", type = "error"})
        return false
    end,
    activated = function() -- Line: 64 -- upvalues: Character (val), Proficiencies (val), useAnimatorObserver (val)
        local Ground, Left
        if not (Character.isGrounded((Character.getCharacter()))) then
            Ground = Proficiencies.Reflexes.Air
        else
            Ground = Proficiencies.Reflexes.Ground
        end
        if math.random(1, 2) ~= 1 then
            Left = Ground.Right
        else
            Left = Ground.Left
            if not Left then
                Left = Ground.Right
            end
        end
        useAnimatorObserver.play(Left, 0.1)
    end,
    settings = {
        description = "You can get up from a ragdoll, saving you from a potentially dangerous situation. (One time use per event). Staff-applied ragdolls cannot be escaped.",
        passive = false,
        upgradable = false,
        prerequisites = {
            wall = "Maria",
            enchantments = {"Quick Escape"},
            sacraments = {Dexterity = 5},
        },
    },
}