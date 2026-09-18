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
--    File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.Boxer
--                              Dumped in 0.000496 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Boxer = require(Tools:WaitForChild("Boxer"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterCombatHandler = require(Character:WaitForChild("CharacterCombatHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
return {
    settings = {
        description = "You can use your fists to make a mark on your opponents.",
        passive = false,
        upgradable = true,
        prerequisites = {
            wall = "Rose",
            enchantments = {"Brute"},
        },
    },
    activated = function() -- Line: 34 -- upvalues: CharacterCombatHandler (val), ClientStateHandler (val), States (val), useAnimatorObserver (val), Boxer (val)
        local v1, v2
        v1, v2 = CharacterCombatHandler.isCombatLoaded()
        if not v1 then
            if not v1 then
                if not (ClientStateHandler.isStateBusy(States.TOOL)) then
                    if ClientStateHandler.isStateBusy(States.CARRYING) or ClientStateHandler.isStateBusy(States.BEING_CARRIED) then
                        return
                    end
                    useAnimatorObserver.play(Boxer.Activated, 0.1)
                    CharacterCombatHandler.onLoadClientCombat({
                        animations = Boxer,
                        hitbox = {size = Vector3.new(3.5, 3.5, 4.375), offset = CFrame.new(0, 0, -2.1875)},
                    }, "Boxing")
                    return
                end
                return
            end
            if v2 ~= "Boxing" or ClientStateHandler.isStateBusy(States.TOOL) or ClientStateHandler.isStateBusy(States.CARRYING) or ClientStateHandler.isStateBusy(States.BEING_CARRIED) then
                return
            end
            useAnimatorObserver.play(Boxer.Activated, 0.1)
            CharacterCombatHandler.onLoadClientCombat({
                animations = Boxer,
                hitbox = {size = Vector3.new(3.5, 3.5, 4.375), offset = CFrame.new(0, 0, -2.1875)},
            }, "Boxing")
            return
        elseif v2 == "Boxing" then
            CharacterCombatHandler.onUnloadClientCombat()
            return
        end
    end,
}