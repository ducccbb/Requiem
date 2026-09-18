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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.Trainer
--                               Dumped in 0.00331 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local GEAR_TRAINER = require(Common_5:WaitForChild("Debugger")).useDebugger("GEAR_TRAINER")
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Animations = Common_7:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Observers = Common_8:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u174 = {}
local u175 = {}
local function cleanupConnection(p1) -- Line: 46 -- upvalues: u174 (val), GEAR_TRAINER (val), u175 (val)
    if u174[p1] then
        GEAR_TRAINER("Cleaning up connection for seat")
        u174[p1]:Disconnect()
        u174[p1] = nil
    end
    if u175[p1] then
        task.cancel(u175[p1])
        u175[p1] = nil
    end
end
return {
    interacted = function(p1, p2) -- Line: 59 -- upvalues: GEAR_TRAINER (val), Server (val), RunService (val), Constants (val), Signals (val), Interaction (val), cleanupConnection (val), u175 (val), u174 (val), Players (val), State (val), useAnimatorObserver (val), Gear (val)
        local PropertyChangedSignal
        if p1.Occupant then
            GEAR_TRAINER("Seat already occupied, aborting")
            return
        end
        if Server.Store.client().event ~= 0 or RunService:IsStudio() or Constants.Places.Exam == game.PlaceId or Constants.IsSupporterPlace then
            GEAR_TRAINER("User sent request to get on gear trainer.")
            Interaction.Event.post(p1)
            cleanupConnection(p1)
            u175[p1] = task.delay(5, function() -- Line: 90 -- upvalues: GEAR_TRAINER (upval), cleanupConnection (upval), p1 (val), Signals (upval)
                GEAR_TRAINER("Timeout waiting for initial occupant change, cleaning up")
                cleanupConnection(p1)
                Signals.Toast:Fire({message = "Failed to interact with trainer.", type = "error"})
            end)
            PropertyChangedSignal = p1:GetPropertyChangedSignal("Occupant")
            u174[p1] = PropertyChangedSignal:Once(function() -- Line: 99 -- upvalues: u175 (upval), p1 (val), GEAR_TRAINER (upval), cleanupConnection (upval), Players (upval), State (upval), useAnimatorObserver (upval), Gear (upval), p2 (val), u174 (upval)
                if u175[p1] then
                    task.cancel(u175[p1])
                    u175[p1] = nil
                end
                local Occupant = p1.Occupant
                local Parent = Occupant
                if Parent then
                    Parent = Occupant.Parent
                end
                if not Parent then
                    GEAR_TRAINER("Occupant is not a character, cleaning up")
                    cleanupConnection(p1)
                    return
                end
                local PlayerFromCharacter = Parent
                if PlayerFromCharacter then
                    PlayerFromCharacter = Players:GetPlayerFromCharacter(Parent)
                end
                if not PlayerFromCharacter or PlayerFromCharacter ~= Players.LocalPlayer then
                    GEAR_TRAINER("Occupant is not local player, cleaning up")
                    cleanupConnection(p1)
                    return
                end
                GEAR_TRAINER("User got on gear trainer.")
                local trainer = State("trainer")
                trainer({visible = true, seat = p1})
                useAnimatorObserver.play(Gear.Trainer, 2)
                local function handleExit() -- Line: 133 -- upvalues: trainer (val), GEAR_TRAINER (upval), useAnimatorObserver (upval), Gear (upval), cleanupConnection (upval), p1 (upval), p2 (upval)
                    trainer({visible = false})
                    GEAR_TRAINER("User got off gear trainer.")
                    useAnimatorObserver.stop(Gear.Trainer, 0.2)
                    cleanupConnection(p1)
                    if p2 then
                        p2()
                    end
                end
                local u48 = nil
                local PropertyChangedSignal = p1:GetPropertyChangedSignal("Occupant")
                u174[p1] = PropertyChangedSignal:Once(function() -- Line: 153 -- upvalues: p1 (upval), u48 (ref), handleExit (val)
                    if not p1.Occupant then
                        if u48 then
                            u48:Disconnect()
                            u48 = nil
                        end
                        handleExit()
                    end
                end)
                local AttributeChangedSignal = Parent:GetAttributeChangedSignal("Ragdolled")
            end)
            return
        end
        if not Constants.IsTestingPlace then
            Signals.Toast:Fire({message = "You cannot do this unless an event is active.", type = "error"})
            return
        end
        GEAR_TRAINER("User sent request to get on gear trainer.")
        Interaction.Event.post(p1)
        cleanupConnection(p1)
        u175[p1] = task.delay(5, function() -- Line: 90 -- upvalues: GEAR_TRAINER (upval), cleanupConnection (upval), p1 (val), Signals (upval)
            GEAR_TRAINER("Timeout waiting for initial occupant change, cleaning up")
            cleanupConnection(p1)
            Signals.Toast:Fire({message = "Failed to interact with trainer.", type = "error"})
        end)
        PropertyChangedSignal = p1:GetPropertyChangedSignal("Occupant")
        u174[p1] = PropertyChangedSignal:Once(function() -- Line: 99 -- upvalues: u175 (upval), p1 (val), GEAR_TRAINER (upval), cleanupConnection (upval), Players (upval), State (upval), useAnimatorObserver (upval), Gear (upval), p2 (val), u174 (upval)
            if u175[p1] then
                task.cancel(u175[p1])
                u175[p1] = nil
            end
            local Occupant = p1.Occupant
            local Parent = Occupant
            if Parent then
                Parent = Occupant.Parent
            end
            if not Parent then
                GEAR_TRAINER("Occupant is not a character, cleaning up")
                cleanupConnection(p1)
                return
            end
            local PlayerFromCharacter = Parent
            if PlayerFromCharacter then
                PlayerFromCharacter = Players:GetPlayerFromCharacter(Parent)
            end
            if not PlayerFromCharacter or PlayerFromCharacter ~= Players.LocalPlayer then
                GEAR_TRAINER("Occupant is not local player, cleaning up")
                cleanupConnection(p1)
                return
            end
            GEAR_TRAINER("User got on gear trainer.")
            local trainer = State("trainer")
            trainer({visible = true, seat = p1})
            useAnimatorObserver.play(Gear.Trainer, 2)
            local function handleExit() -- Line: 133 -- upvalues: trainer (val), GEAR_TRAINER (upval), useAnimatorObserver (upval), Gear (upval), cleanupConnection (upval), p1 (upval), p2 (upval)
                trainer({visible = false})
                GEAR_TRAINER("User got off gear trainer.")
                useAnimatorObserver.stop(Gear.Trainer, 0.2)
                cleanupConnection(p1)
                if p2 then
                    p2()
                end
            end
            local u48 = nil
            local PropertyChangedSignal = p1:GetPropertyChangedSignal("Occupant")
            u174[p1] = PropertyChangedSignal:Once(function() -- Line: 153 -- upvalues: p1 (upval), u48 (ref), handleExit (val)
                if not p1.Occupant then
                    if u48 then
                        u48:Disconnect()
                        u48 = nil
                    end
                    handleExit()
                end
            end)
            local AttributeChangedSignal = Parent:GetAttributeChangedSignal("Ragdolled")
        end)
    end,
    display = {header = "Gear Balancing", body = "Press \"%s\" to begin balancing."},
}