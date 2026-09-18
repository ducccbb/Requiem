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
-- File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterTitanAction
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local ClientShifterAnimationHandler = require(script.Parent:WaitForChild("ClientShifterAnimationHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local Utilities = Titans:WaitForChild("Utilities")
local DetectionBoxTitanClient = require(Utilities:WaitForChild("DetectionBoxTitanClient"))
local u108 = {}
local function getActionState(p1) -- Line: 61 -- upvalues: u108 (val)
    local v1 = u108[p1]
    if not v1 then
        u108[p1] = {cooldowns = {}}
    end
    return v1
end
local function getTitanCooldowns(p1) -- Line: 77 -- upvalues: getActionState (val)
    return getActionState(p1.owner).cooldowns
end
local function resolveAnimationId(p1, p2) -- Line: 85
    if not p1 then
        return p1
    else
        if typeof(p1) ~= "table" then
            return p1
        end
        if not p2 then
            local Left, v1
            if p1.Left then
                if p2 == "Left" then
                    v1 = p2
                elseif p2 == "Right" then
                    v1 = p2
                elseif math.random() >= 0.5 then
                    v1 = "Right"
                else
                    v1 = "Left"
                end
                Left = p1[v1]
                if not Left then
                    Left = p1.Left
                    if not Left then
                        Left = p1.Right
                    end
                end
                return Left
            elseif not p1.Right then
                v1 = #p1
                if 0 < v1 then
                    return p1[math.random(1, v1)]
                end
                return nil
            end
        elseif p1[p2] then
            return p1[p2]
        end
    end
end
local function createAdapter(p1, p2, p3, p4) -- Line: 120 -- upvalues: getActionState (val), trove (val), getTitanCooldowns (val), resolveAnimationId (val), ClientShifterAnimationHandler (val)
    local v1 = getActionState(p1.owner)
    if v1.cleanup then
        v1.cleanup:Clean()
    end
    local v2 = trove.new()
    v1.cleanup = v2
    local v3 = {
        inactive = false,
        root = p1.root,
        model = {client = p1.model, server = p1.model},
        cooldowns = getTitanCooldowns(p1),
        cleanup = v2,
        scale = p1.scale,
        id = p1.owner,
        animations = {},
    }
    local v4 = resolveAnimationId(p3, p4)
    if v4 and p1.model then
        local v5 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, v4)
        if v5 then
            v3.animations = {
                {name = p2, track = v5},
            }
        end
    end
    return v3
end
local function resolveSide(p1, p2) -- Line: 170 -- upvalues: DetectionBoxTitanClient (val)
    local v1, v2
    local v3 = {"Left", "Right"}
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1, v2 = DetectionBoxTitanClient.isClientExpectedToBeWithinForMove(p1, p2)
        if v1 and v2 == j then
            return j
        end
    end
    return nil
end
return {
    runReplicated = function(p1, p2, p3, p4, ...) -- Line: 191 -- upvalues: createAdapter (val), resolveSide (val), Player (val), Shifter (val), Players (val)
        if not p1.model then
            return false
        else
            local v1
            if not p1.root then
                return false
            end
            local v2 = {...}
            local v3 = nil
            if p3.requiresSide ~= false then
                v1 = v2[1]
                if typeof(v1) == "string" then
                    if v1 == "Left" then
                        v3 = table.remove(v2, 1)
                    elseif v1 ~= "Right" then
                    end
                end
            end
            v1 = createAdapter(p1, p3.actionName, p3.animationId, v3)
            if v3 then
                local v4 = {
                    v1,
                    v1.cleanup,
                    Players.LocalPlayer,
                    function(...) -- Line: 220 -- upvalues: Player (upval), Shifter (upval), p4 (val)
                        Player.Shifter.post(Shifter.Effects.Respond, p4, ...)
                    end,
                }
                if v3 then
                    table.insert(v4, v3)
                end
                local v5 = v2
                local v6 = nil
                local v7 = nil
                for i, j in v5, v6, v7 do
                    table.insert(v4, j)
                end
                p2.execute(table.unpack(v4))
                return false
            elseif p3.requiresSide ~= false and p2.detection then
                v3 = resolveSide(v1, p2.detection)
                if not v3 then
                    return false
                end
            end
        end
    end,
    runOwner = function(p1, p2, ...) -- Line: 243
        if not p1.model or not p1.root then
            return false
        end
        return true
    end,
    resolveSide = resolveSide,
    createAdapter = createAdapter,
}