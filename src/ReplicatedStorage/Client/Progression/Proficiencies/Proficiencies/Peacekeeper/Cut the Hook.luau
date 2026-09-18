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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Peacekeeper.Cut the Hook
--                              Dumped in 0.000402 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u97 = false
return {
    unlocked = function() -- Line: 59 -- upvalues: Signals (val), u97 (ref)
        local u5 = Signals.PlayerGrappledClient:Connect(function(p1, p2) -- Line: 62 -- upvalues: u97 (upval)
            if p2 == 0 then
                u97 = false
                return
            end
            u97 = true
        end)
        return function() -- Line: 72 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end,
    activated = function() -- Line: 44 -- upvalues: ClientStateHandler (val), States (val), useAnimatorObserver (val), Gear (val)
        ClientStateHandler.updateState(States.GEAR_SWING, true)
        useAnimatorObserver.play(Gear.CutTheHook, 0.1)
        task.wait(0.5)
        ClientStateHandler.updateState(States.GEAR_SWING, false)
    end,
    verify = function() -- Line: 80 -- upvalues: u97 (ref)
        return u97
    end,
    settings = {
        blades = true,
        blocked_states = {
            States.GEAR_SWING,
            States.CLASHING,
            States.STUNNED,
            States.PARRYING,
            States.WALL_HANGING,
        },
    },
}