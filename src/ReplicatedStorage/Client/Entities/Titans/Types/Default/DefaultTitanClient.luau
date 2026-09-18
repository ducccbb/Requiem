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
--    File: ReplicatedStorage.Client.Entities.Titans.Types.Default.DefaultTitanClient
--                               Dumped in 0.00231 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Actions = v1.Parent:WaitForChild("Actions")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Titan = require(Namespaces:WaitForChild("Titan"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Titan_2 = require(Types:WaitForChild("Titan"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanClientProximity = require(Utilities_2:WaitForChild("TitanClientProximity"))
local Utilities_3 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanCoreActionClient = require(Utilities_3:WaitForChild("TitanCoreActionClient"))
local Utilities_4 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanProtectiveNapeClient = require(Utilities_4:WaitForChild("TitanProtectiveNapeClient"))
local u149 = {}
local u150 = {}
local u153 = (function() -- Line: 64
    return nil
end)()
local function isTestActionAllowed(p1) -- Line: 93 -- upvalues: u153 (val)
    if not u153 then
        return true
    end
    local v1 = u153[p1] == true
    return v1
end
local function isActionAllowed(p1, p2) -- Line: 170 -- upvalues: isTestActionAllowed (val), Titan_2 (val)
    if not (isTestActionAllowed(p2)) then
        return false
    end
    if p1.isSupporter ~= 1 then
        return true
    end
    local v1 = string.sub(p2, 1, 12) == "DefaultTitan"
    if v1 then
        return true
    end
    local SUPPORTER_DISABLED_ACTIONS = Titan_2.SUPPORTER_DISABLED_ACTIONS
    local v2 = nil
    local v3 = nil
    for i, j in SUPPORTER_DISABLED_ACTIONS, v2, v3 do
        if p2 == j then
            return false
        end
    end
    return true
end
local function tryAttemptAction(p1, p2, p3, p4, p5) -- Line: 198 -- upvalues: isActionAllowed (val)
    local v1
    debug.profilebegin((("DefaultTitanClient.attempt:%*"):format(p2)))
    if not (isActionAllowed(p1, p2)) then
        debug.profileend()
        return false
    end
    local engageRangeStuds = p3.engageRangeStuds
    if not engageRangeStuds then
        v1 = table.pack(p3.attempt(p1, p5))
        debug.profileend()
        return table.unpack(v1, 1, v1.n)
    end
    if engageRangeStuds < p4 then
        debug.profileend()
        return false
    end
    v1 = table.pack(p3.attempt(p1, p5))
    debug.profileend()
    return table.unpack(v1, 1, v1.n)
end
local function onCycleTitanAttributePossibilities(p1, p2) -- Line: 228 -- upvalues: Titan (val), CooldownTitanClient (val), TitanProtectiveNapeClient (val), u150 (val), tryAttemptAction (val)
    local name, u97, v1, v2, v3, v4, v5, v6, v7
    debug.profilebegin("DefaultTitanClient.onCycleTitanAttributePossibilities")
    local v8 = {p1.attributes.primary, p1.attributes.secondary, p1.attributes.tertiary or nil}
    local u15 = false
    local function onHandleSuccessfulAction(a1, p2, ...) -- Line: 237 -- upvalues: u15 (ref), Titan (upval), p1 (val)
        u15 = true
        Titan.Action.unreliablePost(p1.id, p2, ...)
    end
    local v9 = {"eating", "blinded", "dying"}
    if CooldownTitanClient.isOnCooldown(p1, v9) or p1.inactive then
        debug.profileend()
        return
    end
    local Default = u150.Default
    if TitanProtectiveNapeClient.tryProtectiveNapeGrabAttack(p1, p2, Default, tryAttemptAction, onHandleSuccessfulAction) then
        debug.profileend()
        return
    end
    local v10 = v8
    local v11 = nil
    v9 = nil
    u97, v1 = p1, p2
    for i, j in v10, v11, v9 do
        if j then
            name = j.name
            v3 = u150[name]
            if v3 then
                debug.profilebegin((("DefaultTitanClient.cycleAttribute:%*"):format(name)))
                v4 = v3
                v5 = nil
                v6 = nil
                for k, n in v4, v5, v6 do
                    v7 = {tryAttemptAction(u97, n.name, n.module, v1, j.value)}
                    if v7[1] then
                        onHandleSuccessfulAction(n.module, n.name, table.unpack(v7, 2))
                        break
                    end
                end
                debug.profileend()
                if u15 then
                    break
                end
            end
        end
    end
    if u15 then
        debug.profileend()
        return
    end
    local Default_2 = u150.Default
    if not Default_2 then
        debug.profileend()
        return
    end
    debug.profilebegin("DefaultTitanClient.cycleDefault")
    v11 = Default_2
    v9 = nil
    local v12 = nil
    for m, i5 in v11, v9, v12 do
        if not (TitanProtectiveNapeClient.isNapeGrabAttack(i5.name)) then
            v2 = {tryAttemptAction(u97, i5.name, i5.module, v1, nil)}
            if v2[1] then
                onHandleSuccessfulAction(i5.module, i5.name, table.unpack(v2, 2))
                break
            end
        end
    end
    debug.profileend()
    debug.profileend()
end
local function inferEngageRangeStuds(p1) -- Line: 386
    if string.find(p1, "ShortRange", 1, true) then
        return 120
    end
    if string.find(p1, "MediumRange", 1, true) then
        return 250
    end
    if string.find(p1, "LongRange", 1, true) then
        return 450
    end
    if string.find(p1, "WideRange", 1, true) then
        return 500
    end
    if p1 == "AngryStomp" or p1 == "IceGroundSlam" then
        return 200
    end
    return nil
end
local function compareActionPriority(p1, p2) -- Line: 405
    local v1
    local priority = p1.module.priority
    local priority_2 = p2.module.priority
    local v2 = type(priority) == "number"
    local v3 = type(priority_2) == "number"
    if not v2 or not v3 then
        if v2 ~= v3 then
            return v2
        end
        v1 = p1.name < p2.name
        return v1
    end
    if priority ~= priority_2 then
        v1 = priority < priority_2
        return v1
    end
    if v2 ~= v3 then
        return v2
    end
    v1 = p1.name < p2.name
    return v1
end
;(function() -- Line: 426 -- upvalues: Actions (val), u149 (val), u150 (val), inferEngageRangeStuds (val), compareActionPriority (val)
    local Name, v1, v2, v3
    debug.profilebegin("DefaultTitanClient.onLoadActions")
    for i, j in Actions:GetChildren() do
        if j:IsA("Folder") then
            v2 = u149[j.Name]
            if not v2 then
                u149[j.Name] = {}
            end
            v3 = {}
            u150[j.Name] = v3
            for k, n in j:GetChildren() do
                if n:IsA("ModuleScript") then
                    Name = n.Name
                    v1 = require(n)
                    if v1.engageRangeStuds == nil then
                        v1.engageRangeStuds = inferEngageRangeStuds(Name)
                    end
                    v2[Name] = v1
                    table.insert(v3, {name = Name, module = v1})
                end
            end
            table.sort(v3, compareActionPriority)
        end
    end
    debug.profileend()
end)()
return {
    onTitanStepped = function(p1) -- Line: 315 -- upvalues: TitanClientProximity (val), ClientStateHandler (val), onCycleTitanAttributePossibilities (val)
        debug.profilebegin("DefaultTitanClient.onTitanStepped")
        if not p1.throttle then
            debug.profileend()
            return
        end
        if not (TitanClientProximity.hasLocalRoot()) then
            p1.throttle(TitanClientProximity.getNoCharacterThrottle())
            debug.profileend()
            return
        end
        local v1 = TitanClientProximity.distanceToTitan(p1.root)
        if not v1 then
            p1.throttle(TitanClientProximity.getNoCharacterThrottle())
            debug.profileend()
            return
        end
        local v2 = TitanClientProximity.getProximityTier(v1)
        if v2 == "mid" or v2 == "idle" or v2 == "unknown" then
            p1.throttle(TitanClientProximity.getThrottleForTier(v2))
            debug.profileend()
            return
        end
        p1.throttle(TitanClientProximity.computeNearThrottle(v1))
        local v3 = {ClientStateHandler.States.CUTSCENE, ClientStateHandler.States.ERADICATING, ClientStateHandler.States.FREECAM}
        if ClientStateHandler.isAnyStateBusy(v3) or not (TitanClientProximity.tryConsumeActionCycleBudget()) then
            debug.profileend()
            return
        end
        onCycleTitanAttributePossibilities(p1, v1)
        debug.profileend()
    end,
    onActionReceived = function(p1, p2, p3, p4, ...) -- Line: 110 -- upvalues: isTestActionAllowed (val), u149 (val), ClientStateHandler (val), Titan (val), TitanCoreActionClient (val), CooldownTitanClient (val)
        local v1, v2
        debug.profilebegin((("DefaultTitanClient.onActionReceived:%*"):format(p2)))
        if not (isTestActionAllowed(p2)) then
            debug.profileend()
            return
        end
        local v3 = u149
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v2 = j[p2]
            if v2 then
                if TitanCoreActionClient.isCoreTitanAction(p2) then
                    TitanCoreActionClient.markCoreReactionStarted(p1)
                end
                if TitanCoreActionClient.shouldRejectAction(p1, p2) then
                    debug.profileend()
                    return
                end
                p1.cleanup:Clean()
                v1 = {"dying"}
                if not (CooldownTitanClient.isOnCooldown(p1, v1)) and not p1.inactive then
                    debug.profilebegin((("DefaultTitanClient.execute:%*"):format(p2)))
                    v2.execute(p1, p1.cleanup, p4, function(...) -- Line: 120 -- upvalues: p1 (val), ClientStateHandler (upval), Titan (upval), p3 (val)
                        if p1.inactive then
                            return
                        end
                        local v1 = {ClientStateHandler.States.CUTSCENE, ClientStateHandler.States.ERADICATING, ClientStateHandler.States.FREECAM}
                        if ClientStateHandler.isAnyStateBusy(v1) then
                            return
                        end
                        Titan.Respond.unreliablePost(p1.id, p3, ...)
                    end, ...)
                    debug.profileend()
                    debug.profileend()
                    return
                end
                debug.profileend()
                return
            end
        end
        debug.profileend()
    end,
    getAllActionNames = function() -- Line: 370 -- upvalues: Actions (val)
        local v1 = {}
        for i, j in Actions:GetDescendants() do
            if j:IsA("ModuleScript") then
                table.insert(v1, j.Name)
            end
        end
        return v1
    end,
}