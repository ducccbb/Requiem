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
--     File: ReplicatedStorage.Client.Entities.Titans.Utilities.TitanClientProximity
--                              Dumped in 0.000756 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local u23 = nil
local u24 = nil
local u25 = 0
local u26 = 0
local u27 = false
local function onCharacterAdded(p1) -- Line: 46 -- upvalues: u23 (ref)
    u23 = p1:FindFirstChild("HumanoidRootPart")
    if not u23 then
        local u6 = nil
    end
end
local function onCharacterRemoving() -- Line: 65 -- upvalues: u23 (ref), u24 (ref)
    u23 = nil
    u24 = nil
end
local function distanceToTitan(p1) -- Line: 108 -- upvalues: u24 (ref)
    debug.profilebegin("TitanClientProximity.distanceToTitan")
    local v1 = u24
    if not v1 then
        debug.profileend()
        return nil
    end
    debug.profileend()
    return (v1 - p1.Position).Magnitude
end
local function getNearThrottleMin() -- Line: 190 -- upvalues: u26 (ref)
    local v1 = math.max(0, u26 - 20) * 0.01 + 0.075
    return (math.clamp(v1, 0.075, 0.35))
end
return {
    ACTION_RANGE_STUDS = 600,
    STEP_IDLE_RANGE_STUDS = 1200,
    init = function() -- Line: 74 -- upvalues: u27 (ref), LocalPlayer (val), onCharacterAdded (val), onCharacterRemoving (val), RunService (val), u25 (ref), u23 (ref), u24 (ref)
        if u27 then
            return
        end
        u27 = true
        if LocalPlayer.Character then
            onCharacterAdded(LocalPlayer.Character)
        end
        LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
        LocalPlayer.CharacterRemoving:Connect(onCharacterRemoving)
        RunService.RenderStepped:Connect(function() -- Line: 88 -- upvalues: u25 (upval), u23 (upval), u24 (upval), LocalPlayer (upval)
            u25 = 0
            if not u23 then
                local Position
                local Character = LocalPlayer.Character
                local HumanoidRootPart = Character
                if HumanoidRootPart then
                    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                end
                u23 = HumanoidRootPart
                if not u23 then
                    Position = nil
                else
                    Position = u23.Position
                end
                u24 = Position
                return
            elseif u23.Parent then
                u24 = u23.Position
                return
            end
        end)
    end,
    distanceToTitan = distanceToTitan,
    isWithinActionRange = function(p1) -- Line: 126 -- upvalues: distanceToTitan (val)
        debug.profilebegin("TitanClientProximity.isWithinActionRange")
        local v1 = distanceToTitan(p1)
        if not v1 then
            debug.profileend()
            return false
        end
        local v2 = v1 <= 600
        debug.profileend()
        return v2
    end,
    getProximityTier = function(p1) -- Line: 146
        debug.profilebegin("TitanClientProximity.getProximityTier")
        if not p1 then
            debug.profileend()
            return "unknown"
        end
        if p1 <= 600 then
            debug.profileend()
            return "near"
        end
        if p1 <= 1200 then
            debug.profileend()
            return "mid"
        end
        debug.profileend()
        return "idle"
    end,
    getThrottleForTier = function(p1) -- Line: 172
        if p1 == "near" then
            return 0
        end
        if p1 == "mid" then
            return 1.5
        end
        if p1 == "idle" then
            return 8
        end
        return 3
    end,
    computeNearThrottle = function(p1) -- Line: 203 -- upvalues: getNearThrottleMin (val)
        return (math.clamp(p1 / 2000, getNearThrottleMin(), 1))
    end,
    setActiveTitanCount = function(p1) -- Line: 212 -- upvalues: u26 (ref)
        u26 = p1
    end,
    tryConsumeActionCycleBudget = function() -- Line: 220 -- upvalues: u25 (ref)
        debug.profilebegin("TitanClientProximity.tryConsumeActionCycleBudget")
        if 3 <= u25 then
            debug.profileend()
            return false
        end
        u25 = u25 + 1
        debug.profileend()
        return true
    end,
    hasLocalRoot = function() -- Line: 236 -- upvalues: u24 (ref)
        local v1 = u24 ~= nil
        return v1
    end,
    getNoCharacterThrottle = function() -- Line: 240
        return 2
    end,
}