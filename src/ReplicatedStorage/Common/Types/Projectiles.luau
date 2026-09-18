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
--                   File: ReplicatedStorage.Common.Types.Projectiles
--                               Dumped in 0.00142 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local u22 = {
    Musket = {speed = 1600, dropoff = 350, gravity = Vector3.new(0, -Workspace.Gravity * 2, 0)},
    Flintlock = {speed = 1100, dropoff = 100, gravity = Vector3.new(0, -Workspace.Gravity * 3, 0)},
    Kar98k = {speed = 3000, dropoff = 2500, gravity = Vector3.new(0, -Workspace.Gravity * 1.6, 0)},
    Shotgun = {speed = 2300, dropoff = 750, gravity = Vector3.new(0, -Workspace.Gravity * 3, 0)},
}
local v2 = {speed = 1800, dropoff = 500}
local v3 = -Workspace.Gravity * 2
v2.gravity = Vector3.new(0, v3, 0)
u22.BlunderBuss = v2
local u63 = {
    Shotgun = {falloff = 0.75, falloffStart = 30, falloffEnd = 120},
}
local v4 = {falloff = 0.75, falloffStart = 30, falloffEnd = 120}
u63.BlunderBuss = v4
local function resolveProjectileOrigin(p1, p2) -- Line: 126
    if not p1 or 10 < (p1 - p2).Magnitude then
        return p2
    end
    return p1
end
local function getFirearmProjectileState(p1, p2, p3, p4, p5, p6) -- Line: 208
    local v1 = p4 / p3
    if p6 < v1 then
        return p1 + p2 * (p3 * p6), p2 * p3
    end
    local v2 = p6 - v1
    return p1 + p2 * p4 + p2 * (p3 * v2) + p5 * 0.5 * (v2 * v2), p2 * p3 + p5 * v2
end
local v5 = {
    PROJECTILE_TYPES = u22,
    PROJECTILE_DAMAGE_FALLOFF = u63,
    getProjectilePhysics = function(p1, p2) -- Line: 164 -- upvalues: RunService (val), u22 (val)
        local v1, v2
        if RunService:IsClient() then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Client = ReplicatedStorage:WaitForChild("Client")
            local Progression = Client:WaitForChild("Progression")
            local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
            v1 = ClientAttributesHandler.getAttribute("FirearmProjectileSpeedMultiplier") or 1
            v2 = ClientAttributesHandler.getAttribute("FirearmProjectileDropoffMultiplier") or 1
            return {speed = u22[p2].speed * v1, dropoff = u22[p2].dropoff * v2, gravity = u22[p2].gravity}
        end
        local ServerScriptService = game:GetService("ServerScriptService")
        local User = ServerScriptService:WaitForChild("User")
        local Progression_2 = User:WaitForChild("Progression")
        local Attributes = Progression_2:WaitForChild("Attributes")
        local UserAttributesHandler = require(Attributes:WaitForChild("UserAttributesHandler"))
        v1 = UserAttributesHandler.getAttribute(p1, "FirearmProjectileSpeedMultiplier")
        v2 = UserAttributesHandler.getAttribute(p1, "FirearmProjectileDropoffMultiplier")
        return {speed = u22[p2].speed * v1, dropoff = u22[p2].dropoff * v2, gravity = u22[p2].gravity}
    end,
    applyProjectileDamageFalloff = function(p1, p2, p3, p4) -- Line: 140 -- upvalues: u63 (val), resolveProjectileOrigin (val)
        local v1 = u63[p2]
        if not v1 then
            return p1
        end
        p1.origin = resolveProjectileOrigin(p3, p4)
        p1.falloff = v1.falloff
        p1.falloffStart = v1.falloffStart
        p1.falloffEnd = v1.falloffEnd
        return p1
    end,
    getFirearmProjectileState = getFirearmProjectileState,
}
function v5.simulateFirearmTrajectory(p1, p2, p3, p4) -- Line: 231 -- upvalues: getFirearmProjectileState (val), Workspace (val)
    local Magnitude, v1, v2, v3, v4, v5, v6, v7
    local v8 = p4
    if not v8 then
        v8 = {}
    end
    local v9 = v8.timeStep or 0.016666666666666666
    local v10 = v8.maxTime or 8
    local v11 = v8.sphereRadius or 0.15
    local v12 = RaycastParams.new()
    v12.FilterType = Enum.RaycastFilterType.Exclude
    local filterInstances = v8.filterInstances
    if not filterInstances then
        filterInstances = {}
    end
    v12.FilterDescendantsInstances = filterInstances
    local v13 = {p1}
    local v14 = 0
    local v15 = p1
    v1, v2, v7 = p1, p2, p3
    while v14 < v10 do
        v14 = v14 + v9
        v3, v4 = getFirearmProjectileState(v1, v2, v7.speed, v7.dropoff, v7.gravity, v14)
        v5 = v4 * v9
        Magnitude = v5.Magnitude
        if 0 < Magnitude then
            if 1024 < Magnitude then
                v5 = v5 * (1024 / Magnitude)
            end
            v6 = Workspace:Spherecast(v15, v11, v5 * 1.1, v12)
            if v6 then
                table.insert(v13, v6.Position)
                return {points = v13, impact = v6.Position}
            end
        end
        table.insert(v13, v3)
        v15 = v3
    end
    return {points = v13, impact = v13[#v13]}
end
return v5