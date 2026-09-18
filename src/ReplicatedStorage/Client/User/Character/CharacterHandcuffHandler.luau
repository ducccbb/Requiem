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
--        File: ReplicatedStorage.Client.User.Character.CharacterHandcuffHandler
--                              Dumped in 0.000604 seconds
--                          Bytecode version 9  |  7 functions

local u144, u147
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local CharacterCombatHandler = require(v1.Parent:WaitForChild("CharacterCombatHandler"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Observers_2 = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers_2:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics_2 = Common_5:WaitForChild("Statistics")
_, u144 = require(Statistics_2:WaitForChild("useWalkSpeed"))()
_, u147 = useJumpPower()
local u149 = trove.new()
local function onClientHandcuffed() -- Line: 41 -- upvalues: ClientStateHandler (val), States (val), CharacterCombatHandler (val), u144 (val), u147 (val), u149 (val), useAnimatorObserver (val), Default (val)
    ClientStateHandler.updateState(States.HANDCUFFED, true)
    if CharacterCombatHandler.isCombatLoaded() then
        CharacterCombatHandler.onUnloadClientCombat()
    end
    local v1 = u144("handcuffed", 4, "set", 12)
    local v2 = u147("handcuffed", 0, "set", 12)
    u149:Add(v1)
    u149:Add(v2)
    local u38 = useAnimatorObserver.play(Default.Handcuffed)
    u149:Add(function() -- Line: 60 -- upvalues: u38 (val)
        if not u38 then
            return
        end
        u38:Stop(0.2)
    end)
end
local function onClientUnhandcuffed() -- Line: 72 -- upvalues: ClientStateHandler (val), States (val), u149 (val)
    ClientStateHandler.updateState(States.HANDCUFFED, false)
    u149:Clean()
end
useCharacterObserver(function(p1) -- Line: 78 -- upvalues: onClientHandcuffed (val), onClientUnhandcuffed (val)
    local HumanoidRootPart = p1:WaitForChild("HumanoidRootPart")
    local AttributeChangedSignal = HumanoidRootPart:GetAttributeChangedSignal("Handcuffed")
    AttributeChangedSignal:Connect(function() -- Line: 82 -- upvalues: HumanoidRootPart (val), onClientHandcuffed (upval), onClientUnhandcuffed (upval)
        if HumanoidRootPart:GetAttribute("Handcuffed") then
            onClientHandcuffed()
            return
        end
        onClientUnhandcuffed()
    end)
    return function() end
end)
return {}