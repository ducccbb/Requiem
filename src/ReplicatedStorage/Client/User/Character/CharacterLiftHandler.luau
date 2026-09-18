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
--          File: ReplicatedStorage.Client.User.Character.CharacterLiftHandler
--                              Dumped in 0.000390 seconds
--                          Bytecode version 9  |  4 functions

local u112
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
_, u112 = require(Statistics:WaitForChild("useWalkSpeed"))()
Player.Lift.listen(function(p1, p2) -- Line: 42 -- upvalues: useAnimatorObserver (val), Default (val), u112 (val), Player (val), ClientStateHandler (val), States (val), UserInputService (val)
    local u7 = useAnimatorObserver.play(Default.Carries.Medium)
    local u8 = nil
    local u14 = u112("lifting", 16, "set", 30)
    local function onStopLifting() -- Line: 52 -- upvalues: u8 (ref), u7 (val), Player (upval), ClientStateHandler (upval), States (upval), u14 (val)
        u8:Disconnect()
        if u7 then
            u7:Stop(0.2)
        end
        Player.Lift.post()
        ClientStateHandler.updateState(States.LIFTING, false)
        u14()
    end
    ClientStateHandler.updateState(States.LIFTING, true)
end)
return {}