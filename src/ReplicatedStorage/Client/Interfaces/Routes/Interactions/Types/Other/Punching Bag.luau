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
--File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Other.Punching Bag
--                              Dumped in 0.000650 seconds
--                          Bytecode version 9  |  5 functions

local u172, u175
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics = Common_6:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics_2 = Common_7:WaitForChild("Statistics")
local useJumpPower = require(Statistics_2:WaitForChild("useJumpPower"))
_, u172 = useWalkSpeed()
_, u175 = useJumpPower()
return {
    interacted = function(...) -- Line: 40 -- upvalues: ClientStateHandler (val), States (val), u172 (val), u175 (val), State (val), useAnimatorObserver (val), Default (val), Interaction (val), Signals (val)
        local u0 = {...}
        ClientStateHandler.updateState(States.CUTSCENE, true)
        local u13 = u172("punchingbag", 0, "set", 500)
        local u19 = u175("punchingbag", 0, "set", 500)
        local aimlabs = State("aimlabs")
        local u28 = useAnimatorObserver.play(Default.PunchingBag, 0.2)
        local function onActionCompleted() -- Line: 53 -- upvalues: ClientStateHandler (upval), States (upval), u13 (val), u19 (val), u28 (val)
            ClientStateHandler.updateState(States.CUTSCENE, false)
            u13()
            u19()
            if u28 then
                u28:Stop(0.2)
            end
        end
        aimlabs({
            visible = true,
            success = function() -- Line: 66 -- upvalues: onActionCompleted (val), Interaction (upval), u0 (val), Signals (upval)
                onActionCompleted()
                Interaction.Event.unreliablePost(unpack(u0))
                Signals.Monologue:Fire({"With a bit more practice, and proper technique, I'll be unstoppable.", "Each strike I feel like I'm getting stronger.", "I'm getting the hang of this."})
            end,
            fail = function() -- Line: 77 -- upvalues: onActionCompleted (val), Signals (upval)
                onActionCompleted()
                Signals.Monologue:Fire({"I need to get better at this.", "Failure is not an option, I must improve my technique."})
            end,
        })
    end,
    display = {header = "Punching Bag", body = "Press \"%s\" to begin punching."},
}