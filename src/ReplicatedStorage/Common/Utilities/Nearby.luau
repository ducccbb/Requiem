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
--                    File: ReplicatedStorage.Common.Utilities.Nearby
--                               Dumped in 0.00130 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local Effects_2 = v1.Parent.Parent:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ServerScriptService = game:GetService("ServerScriptService")
local User = ServerScriptService:WaitForChild("User")
local Progression = User:WaitForChild("Progression")
local Attributes = Progression:WaitForChild("Attributes")
local UserAttributesHandler = require(Attributes:WaitForChild("UserAttributesHandler"))
local u68 = nil
local u69 = {}
local u70 = {}
local function getEffectMultiplier(p1, p2) -- Line: 61 -- upvalues: UserAttributesHandler (val)
    local v1 = UserAttributesHandler.getAttribute(p1, "LeadershipMultiplier")
    if not v1 then
        v1 = 1
    elseif v1 <= 0 then
        v1 = 1
    end
    local v2 = UserAttributesHandler.getAttribute(p1, "GatherRoundThreshold")
    local v3 = UserAttributesHandler.getAttribute(p1, "GatherRoundBonus")
    if 0 < v2 and 0 < v3 and v2 < p2 then
        v1 = v1 * (v3 + 1)
    end
    return v1
end
local function resolveMultiplier(p1) -- Line: 81
    if not p1 or p1 <= 0 then
        return 1
    end
    return p1
end
local function getTargetEffectMultiplier(p1, p2, p3) -- Line: 95 -- upvalues: getEffectMultiplier (val), resolveMultiplier (val), UserAttributesHandler (val), u68 (ref)
    local v1 = getEffectMultiplier(p1, p3)
    v1 = v1 * resolveMultiplier((UserAttributesHandler.getAttribute(p1, "BuffApplyMultiplier")))
    if p2 ~= p1 then
        v1 = v1 * resolveMultiplier((UserAttributesHandler.getAttribute(p2, "BuffReceiveMultiplier")))
        local v2 = UserAttributesHandler.getAttribute(p1, "SquadBuffApplyBonus")
        if 0 < v2 then
            local PlayerSquadHandler = u68
            if not PlayerSquadHandler then
                local ServerScriptService = game:GetService("ServerScriptService")
                local User = ServerScriptService:WaitForChild("User")
                local Services = User:WaitForChild("Services")
                local Miscellaneous = Services:WaitForChild("Miscellaneous")
                PlayerSquadHandler = require(Miscellaneous:WaitForChild("PlayerSquadHandler"))
            end
            u68 = PlayerSquadHandler
            if u68.arePlayersInSameSquad(p1, p2) then
                v1 = v1 * (v2 + 1)
            end
        end
    end
    return v1
end
local v3 = {}
function v3.createRangeStack(p1) -- Line: 120 -- upvalues: u69 (val), u70 (val), UserAttributesHandler (val), Players (val), getTargetEffectMultiplier (val), Vitality (val)
    local Character_2
    local sender = p1.sender
    local Character = sender.Character
    if Character then
        Character = sender.Character:FindFirstChild("Torso")
    end
    if not Character then
        return
    end
    local u142 = p1.duration or 60
    local effect = p1.effect
    if not (u69[effect]) then
        u69[effect] = {}
    end
    if not (u70[effect]) then
        u70[effect] = {}
    end
    local u146 = u69[effect]
    local u148 = u70[effect]
    local v1 = UserAttributesHandler.getAttribute(sender, "BuffSelfThreshold")
    local v2 = {}
    local u134 = p1
    for k, v in pairs(Players:GetPlayers()) do
        if sender ~= v then
            Character_2 = v.Character
            if Character_2 then
                Character_2 = v.Character:FindFirstChild("Torso")
            end
            if Character_2 and u134.radius > (Character_2.Position - Character.Position).magnitude then
                if not u134.filter then
                    table.insert(v2, v)
                elseif not (u134.filter(sender, v)) then
                end
            end
        end
    end
    local v3 = table.clone(v2)
    local self = u134.self
    if not self then
        self = if 0 < v1 then v1 <= #v2 else false
    end
    if self then
        table.insert(v3, sender)
    end
    local u72 = #v3
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        (function(p1) -- Line: 177 -- upvalues: getTargetEffectMultiplier (upval), sender (val), u72 (val), u142 (val), UserAttributesHandler (upval), u146 (val), u148 (val), u134 (val), Vitality (upval), effect (val)
            local v1
            local u5 = getTargetEffectMultiplier(sender, p1, u72)
            local v2 = u142 * u5
            if p1 == sender then
                v1 = UserAttributesHandler.getAttribute(sender, "SquadLeaderSelfBuffDurationBonus")
                if 0 < v1 then
                    v2 = v2 * (v1 + 1)
                end
            end
            v1 = u146[p1]
            if not v1 then
                u148[p1] = u5
                if u134.callbacks.onFirstApply then
                    u134.callbacks.onFirstApply(sender, p1, u5)
                end
            else
                task.cancel(v1)
            end
            if u134.callbacks.onApply then
                u134.callbacks.onApply(sender, p1, u5)
            end
            Vitality.Buff.send(p1, {id = effect, length = v2})
            u146[p1] = task.delay(v2, function() -- Line: 207 -- upvalues: u146 (upval), p1 (val), u148 (upval), u5 (val), u134 (upval), sender (upval)
                u146[p1] = nil
                local v1 = u148[p1]
                if not v1 then
                    v1 = u5
                end
                u134.callbacks.onExpire(sender, p1, v1)
                u148[p1] = nil
            end)
        end)(j)
    end
end
function v3.monologue(p1, p2, p3, p4, ...) -- Line: 230 -- upvalues: Effects (val)
    Effects.sendEffectRequestToPlayer(p1, "Monologue", p2)
    local Character = p4
    if not Character then
        Character = p1.Character
        if Character then
            Character = p1.Character:FindFirstChild("Torso")
        end
    end
    if Character and p3 then
        Effects.sendEffectRequest(p3, Character, ...)
    end
end
function v3.attributes(p1, p2, p3) -- Line: 246 -- upvalues: UserAttributesHandler (val)
    local v1 = p2
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        UserAttributesHandler.addValueToAttribute(p1, j.attribute, j.operation, j.value * (p3 or 1))
    end
end
return v3