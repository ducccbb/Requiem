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
--   File: ReplicatedStorage.Client.Entities.Titans.Types.Sprinter.SprinterTitanClient
--                               Dumped in 0.00246 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Actions = v1.Parent.Parent.Default:WaitForChild("Actions")
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
local Default = v1.Parent.Parent:WaitForChild("Default")
local DefaultTitanClient = require(Default:WaitForChild("DefaultTitanClient"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanClientProximity = require(Utilities_2:WaitForChild("TitanClientProximity"))
local Utilities_3 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanCoreActionClient = require(Utilities_3:WaitForChild("TitanCoreActionClient"))
local Utilities_4 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TitanProtectiveNapeClient = require(Utilities_4:WaitForChild("TitanProtectiveNapeClient"))
local u163 = {}
local u164 = {}
local function isActionAllowed(p1, p2) -- Line: 46 -- upvalues: Titan_2 (val)
    if p1.variant ~= "ice" then
        return true
    end
    local v1 = string.sub(p2, 1, 12) == "DefaultTitan"
    if v1 then
        return true
    end
    local ICE_DISABLED_ACTIONS = Titan_2.ICE_DISABLED_ACTIONS
    local v2 = nil
    local v3 = nil
    for i, j in ICE_DISABLED_ACTIONS, v2, v3 do
        if p2 == j then
            return false
        end
    end
    return true
end
local function tryAttemptAction(p1, p2, p3, p4, p5) -- Line: 114 -- upvalues: isActionAllowed (val)
    local v1
    debug.profilebegin((("SprinterTitanClient.attempt:%*"):format(p2)))
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
local function onCycleTitanAttributePossibilities(p1, p2) -- Line: 138 -- upvalues: Titan (val), CooldownTitanClient (val), TitanProtectiveNapeClient (val), u164 (val), tryAttemptAction (val)
    local name, u181, v1, v2, v3, v4, v5, v6, v7, v8
    debug.profilebegin("SprinterTitanClient.onCycleTitanAttributePossibilities")
    local v9 = {p1.attributes.primary, p1.attributes.secondary, p1.attributes.tertiary or nil}
    local u153 = false
    local function onHandleSuccessfulAction(a1, p2, ...) -- Line: 147 -- upvalues: u153 (ref), Titan (upval), p1 (val)
        u153 = true
        Titan.Action.unreliablePost(p1.id, p2, ...)
    end
    local v10 = {"eating", "blinded", "dying"}
    if CooldownTitanClient.isOnCooldown(p1, v10) or p1.inactive then
        debug.profileend()
        return
    end
    local Default = u164.Default
    if TitanProtectiveNapeClient.tryProtectiveNapeGrabAttack(p1, p2, Default, tryAttemptAction, onHandleSuccessfulAction) then
        debug.profileend()
        return
    end
    local v11 = v9
    local v12 = nil
    v10 = nil
    u181, v1 = p1, p2
    for i, j in v11, v12, v10 do
        if j then
            name = j.name
            v4 = u164[name]
            if v4 then
                debug.profilebegin((("SprinterTitanClient.cycleAttribute:%*"):format(name)))
                v5 = v4
                v6 = nil
                v7 = nil
                for k, n in v5, v6, v7 do
                    v8 = {tryAttemptAction(u181, n.name, n.module, v1, j.value)}
                    if v8[1] then
                        onHandleSuccessfulAction(n.module, n.name, table.unpack(v8, 2))
                        break
                    end
                end
                debug.profileend()
                if u153 then
                    break
                end
            end
        end
    end
    if not u153 then
        local Default_2 = u164.Default
        if Default_2 then
            debug.profilebegin("SprinterTitanClient.cycleDefault")
            v12 = Default_2
            v10 = nil
            v2 = nil
            for m, i5 in v12, v10, v2 do
                if not (TitanProtectiveNapeClient.isNapeGrabAttack(i5.name)) then
                    v3 = {tryAttemptAction(u181, i5.name, i5.module, v1, nil)}
                    if v3[1] then
                        onHandleSuccessfulAction(i5.module, i5.name, table.unpack(v3, 2))
                        break
                    end
                end
            end
            debug.profileend()
        end
    end
    if not u153 then
        local Sprinter = u164.Sprinter
        if Sprinter then
            debug.profilebegin("SprinterTitanClient.cycleSprinter")
            v12 = Sprinter
            v10 = nil
            v2 = nil
            for i6, i7 in v12, v10, v2 do
                v3 = {tryAttemptAction(u181, i7.name, i7.module, v1, nil)}
                if v3[1] then
                    onHandleSuccessfulAction(i7.module, i7.name, table.unpack(v3, 2))
                    break
                end
            end
            debug.profileend()
        end
    end
    debug.profileend()
end
local function inferEngageRangeStuds(p1) -- Line: 281
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
local function compareActionPriority(p1, p2) -- Line: 300
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
local function loadActionsFromFolder(p1) -- Line: 317 -- upvalues: u163 (val), u164 (val), inferEngageRangeStuds (val), compareActionPriority (val)
    local v1, v2, v3
    for i, j in p1:GetChildren() do
        if j:IsA("Folder") then
            v2 = u163[j.Name]
            if not v2 then
                u163[j.Name] = {}
            end
            v3 = {}
            u164[j.Name] = v3
            for k, n in j:GetChildren() do
                if n:IsA("ModuleScript") then
                    v1 = require(n)
                    if v1.engageRangeStuds == nil then
                        v1.engageRangeStuds = inferEngageRangeStuds(n.Name)
                    end
                    v2[n.Name] = v1
                    table.insert(v3, {name = n.Name, module = v1})
                end
            end
            table.sort(v3, compareActionPriority)
        end
    end
end
;(function() -- Line: 349 -- upvalues: loadActionsFromFolder (val), Actions (val)
    debug.profilebegin("SprinterTitanClient.onLoadActions")
    loadActionsFromFolder(Actions)
    debug.profileend()
end)()
return {
    onTitanStepped = function(p1) -- Line: 232 -- upvalues: TitanClientProximity (val), ClientStateHandler (val), onCycleTitanAttributePossibilities (val)
        debug.profilebegin("SprinterTitanClient.onTitanStepped")
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
    onActionReceived = function(p1, p2, p3, p4, ...) -- Line: 65 -- upvalues: u163 (val), ClientStateHandler (val), Titan (val), TitanCoreActionClient (val), CooldownTitanClient (val)
        local v1, v2
        debug.profilebegin((("SprinterTitanClient.onActionReceived:%*"):format(p2)))
        local v3 = u163
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
                    debug.profilebegin((("SprinterTitanClient.execute:%*"):format(p2)))
                    v2.execute(p1, p1.cleanup, p4, function(...) -- Line: 70 -- upvalues: p1 (val), ClientStateHandler (upval), Titan (upval), p3 (val)
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
    getAllActionNames = DefaultTitanClient.getAllActionNames,
}