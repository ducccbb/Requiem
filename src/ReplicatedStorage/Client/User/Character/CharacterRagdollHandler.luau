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
--         File: ReplicatedStorage.Client.User.Character.CharacterRagdollHandler
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  16 functions

local u0 = script
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
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local Progression = u0.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u86 = nil
local State = u0.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local u119 = {}
local u120 = {}
local u121 = nil
local function postRagdollStateToServer(p1) -- Line: 39 -- upvalues: u121 (ref), Vitality (val)
    local v1
    if not p1 then
        v1 = 0
    else
        v1 = 1
    end
    if u121 == v1 then
        return
    end
    u121 = v1
    Vitality.Ragdoll.post(v1)
end
local function clearLocalRagdollTracking() -- Line: 52 -- upvalues: u120 (val), u119 (val)
    local v1 = u120
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        task.cancel(j)
        u120[i] = nil
    end
    table.clear(u119)
end
local function alignLocalTrackingWithServerUnragdoll() -- Line: 66 -- upvalues: clearLocalRagdollTracking (val), u121 (ref)
    clearLocalRagdollTracking()
    u121 = 0
end
local function syncRagdolledState() -- Line: 80 -- upvalues: Character (val), ClientStateHandler (val), States (val)
    local v1
    local v2 = Character.getCharacter()
    if not v2 then
        v1 = false
    else
        v1 = Character.isRagdolled(v2)
    end
    local v3 = ClientStateHandler.isServerStateBusy(ClientStateHandler.Server.RAGDOLLED) == true
    local v4 = v3 and v1
    ClientStateHandler.updateState(States.RAGDOLLED, v4)
    return v4
end
local function onRagdollMappingChanged() -- Line: 95 -- upvalues: Table (val), u119 (val), postRagdollStateToServer (val), syncRagdolledState (val)
    local v1 = #Table.keys(u119)
    local v2 = 0 < v1
    postRagdollStateToServer(v2)
    syncRagdolledState()
    return v2
end
ClientStateHandler.onServerStateChanged(ClientStateHandler.Server.RAGDOLLED):Connect(function(p1) -- Line: 182 -- upvalues: u86 (ref), u0 (val), alignLocalTrackingWithServerUnragdoll (val), syncRagdolledState (val)
    local ClientGearHandler = u86
    if not ClientGearHandler then
        local Equipment = u0.Parent.Parent:WaitForChild("Equipment")
        local Gear = Equipment:WaitForChild("Gear")
        ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
    end
    u86 = ClientGearHandler
    if p1 ~= true then
        alignLocalTrackingWithServerUnragdoll()
    end
    syncRagdolledState()
    local v1 = u86.getGearState()
    if v1 and v1.enabled then
        v1.signals.clearMomentum:Fire()
    end
end)
useCharacterObserver(function(p1) -- Line: 215 -- upvalues: u121 (ref), syncRagdolledState (val), alignLocalTrackingWithServerUnragdoll (val), clearLocalRagdollTracking (val)
    u121 = nil
    syncRagdolledState()
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Ragdolled")
    local u11 = AttributeChangedSignal:Connect(function() -- Line: 219 -- upvalues: p1 (val), alignLocalTrackingWithServerUnragdoll (upval), syncRagdolledState (upval)
        if p1:GetAttribute("Ragdolled") ~= true then
            alignLocalTrackingWithServerUnragdoll()
        end
        syncRagdolledState()
    end)
    return function() -- Line: 227 -- upvalues: u11 (val), clearLocalRagdollTracking (upval), u121 (upval), syncRagdolledState (upval)
        if u11 then
            u11:Disconnect()
        end
        clearLocalRagdollTracking()
        u121 = nil
        syncRagdolledState()
    end
end)
return {
    ragdoll = function(p1, p2) -- Line: 110 -- upvalues: Character (val), ClientAttributesHandler (val), ClientStateHandler (val), u119 (val), onRagdollMappingChanged (val), u120 (val)
        local v1
        local v2 = Character.getCharacter()
        if not v2 or ClientAttributesHandler.getAttribute("Ragdollable") == 0 then
            return
        end
        local v3 = ClientStateHandler.isServerStateBusy(ClientStateHandler.Server.RAGDOLLED) == true
        if v3 or Character.isRagdolled(v2) then
            return function() end
        end
        if p1 then
            v1 = p1
        else
            v1 = -1
        end
        if 0 < v1 and p2 == "titan" then
            local TitanRagdollDurationMultiplier = ClientAttributesHandler.getAttribute("TitanRagdollDurationMultiplier")
            if TitanRagdollDurationMultiplier then
                v1 = (v1 or 1) * TitanRagdollDurationMultiplier
            end
        end
        local u38 = math.random(1, 100000000)
        u119[u38] = v1
        onRagdollMappingChanged()
        local u49 = nil
        if v1 and 0 < v1 then
            u49 = task.delay(v1, function() -- Line: 151 -- upvalues: u119 (upval), u38 (val), u120 (upval), onRagdollMappingChanged (upval)
                u119[u38] = nil
                u120[u38] = nil
                onRagdollMappingChanged()
            end)
            if u49 then
                u120[u38] = u49
            end
        end
        return function() -- Line: 163 -- upvalues: u119 (upval), u38 (val), u49 (ref), u120 (upval), onRagdollMappingChanged (upval)
            u119[u38] = nil
            if u49 then
                task.cancel(u49)
                u120[u38] = nil
            end
            onRagdollMappingChanged()
        end
    end,
    isRagdolled = function() -- Line: 205 -- upvalues: ClientStateHandler (val), States (val), Character (val)
        local v1 = ClientStateHandler.isStateBusy(States.RAGDOLLED)
        if v1 then
            v1 = Character.isRagdolled()
        end
        return v1
    end,
    clearAllRagdolls = function() -- Line: 244 -- upvalues: clearLocalRagdollTracking (val), postRagdollStateToServer (val), syncRagdolledState (val)
        clearLocalRagdollTracking()
        postRagdollStateToServer(false)
        syncRagdolledState()
    end,
}