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
--           File: ReplicatedStorage.Common.Effects.Types.Universal.Artillery
--                              Dumped in 0.000906 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common:WaitForChild("Sounds")
local Explosions = require(Sounds_2:WaitForChild("Explosions"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Particles = require(Utilities_3:WaitForChild("Particles"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Artillery = Particles_2:WaitForChild("Artillery")
local function getSyncedPosition(p1, p2) -- Line: 42
    local v1 = p1.landTime - p1.startTime
    if v1 <= 0 then
        return p1.goal
    end
    local v2 = math.clamp((p2 - p1.startTime) / v1, 0, 1)
    return p1.origin:Lerp(p1.goal, v2)
end
local function setProjectileCFrame(p1, p2) -- Line: 58
    if p1:IsA("Model") then
        p1:PivotTo(p2)
        return
    end
    if p1:IsA("BasePart") then
        p1.CFrame = p2
    end
end
local function prepareProjectile(p1) -- Line: 71
    if p1:IsA("BasePart") then
        p1.Anchored = true
        p1.CanCollide = false
        p1.CanTouch = false
        p1.CanQuery = false
        p1.CastShadow = false
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
            j.CastShadow = false
        end
    end
end
return function(p1) -- Line: 93 -- upvalues: Workspace (val), Sounds (val), Explosions (val), Particles (val), Character (val), Artillery (val), prepareProjectile (val), setProjectileCFrame (val), getSyncedPosition (val), RunService (val)
    local v1, v2
    if typeof(p1) ~= "table" then
        return
    end
    local origin = p1.origin
    local originPart = p1.originPart
    local goal = p1.goal
    local startTime = p1.startTime
    local landTime = p1.landTime
    if typeof(origin) ~= "Vector3" or typeof(goal) ~= "Vector3" or typeof(startTime) ~= "number" or typeof(landTime) ~= "number" then
        return
    end
    local ServerTimeNow = Workspace:GetServerTimeNow()
    if landTime <= ServerTimeNow then
        return
    end
    Sounds.playFalloffSoundEffect(Explosions.ArtilleryFire, origin, 5000, 0.5)
    Sounds.playFalloffSoundEffect(Explosions.Fire.Near, origin, 3000, 0.3)
    if originPart then
        Particles.deepEmitParticles(originPart)
    end
    v1, v2 = Character.getDistance(origin)
    if v2 and 4000 < v1 then
        Sounds.playFalloffSoundEffect(Explosions.Fire.Distant, origin, 9000, 0.35, {min = 0.9, max = 1.1})
    end
    local u66 = Artillery:Clone()
    prepareProjectile(u66)
    setProjectileCFrame(u66, CFrame.new(getSyncedPosition(p1, ServerTimeNow)))
    u66.Parent = Workspace
    local u84 = nil
    u84 = RunService.RenderStepped:Connect(function() -- Line: 137 -- upvalues: u66 (val), u84 (ref), Workspace (upval), landTime (val), getSyncedPosition (upval), p1 (val), goal (val), origin (val), setProjectileCFrame (upval)
        if not u66.Parent then
            if u84.Connected then
                u84:Disconnect()
            end
            return
        end
        local ServerTimeNow = Workspace:GetServerTimeNow()
        if landTime <= ServerTimeNow then
            u66:Destroy()
            if u84.Connected then
                u84:Disconnect()
            end
            return
        end
        local v1 = getSyncedPosition(p1, ServerTimeNow)
        local v2 = goal - origin
        if 0.01 < v2.Magnitude then
            setProjectileCFrame(u66, CFrame.new(v1, v1 + v2.Unit))
            return
        end
        setProjectileCFrame(u66, CFrame.new(v1))
    end)
    local v3 = math.max(0, landTime - ServerTimeNow) + 1
    task.delay(v3, function() -- Line: 163 -- upvalues: u84 (ref), u66 (val)
        if u84.Connected then
            u84:Disconnect()
        end
        if u66.Parent then
            u66:Destroy()
        end
    end)
end