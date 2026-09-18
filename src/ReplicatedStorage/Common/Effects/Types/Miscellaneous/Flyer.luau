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
--           File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.Flyer
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Placeables = Assets:WaitForChild("Placeables")
local u37 = math.rad(38)
local u40 = math.rad(32)
local u43 = math.rad(28)
local function smoothstep(p1) -- Line: 44
    return p1 * p1 * (3 - p1 * 2)
end
local function getHorizontalAxes(p1) -- Line: 53
    local Unit
    local RightVector = p1.RightVector
    local LookVector = p1.LookVector
    local v1 = Vector3.new(RightVector.X, 0, RightVector.Z)
    local v2 = Vector3.new(LookVector.X, 0, LookVector.Z)
    if 0.001 >= v1.Magnitude then
        Unit = Vector3.xAxis
    else
        Unit = v1.Unit
    end
    if 0.001 < v2.Magnitude then
        return Unit, v2.Unit
    end
    return Unit, Vector3.zAxis
end
local function prepareModel(p1) -- Line: 80
    if not p1.PrimaryPart then
        p1.PrimaryPart = p1:FindFirstChildWhichIsA("BasePart", true)
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
        end
    end
end
local function resolveData(p1, p2, p3) -- Line: 102 -- upvalues: Workspace (val)
    local ServerTimeNow, v1
    if typeof(p1) == "table" then
        local landTime, startTime
        if typeof(p1.pivot) ~= "CFrame" then
            return nil
        end
        if typeof(p1.startTime) ~= "number" then
            startTime = Workspace:GetServerTimeNow()
        else
            startTime = p1.startTime
        end
        if typeof(p1.landTime) ~= "number" then
            landTime = startTime + 20
        else
            landTime = p1.landTime
        end
        return {pivot = p1.pivot, startTime = startTime, landTime = landTime}
    end
    if typeof(p1) ~= "CFrame" then
        return nil
    end
    if typeof(p2) ~= "number" then
        ServerTimeNow = Workspace:GetServerTimeNow()
    else
        ServerTimeNow = p2
    end
    if typeof(p3) ~= "number" then
        v1 = ServerTimeNow + 20
    else
        v1 = p3
    end
    return {pivot = p1, startTime = ServerTimeNow, landTime = v1}
end
local function getFrame(p1, p2, p3) -- Line: 144 -- upvalues: smoothstep (val), getHorizontalAxes (val), u40 (val), u37 (val), u43 (val)
    local v1, v2
    local v3 = (p2 - p1.startTime) / math.max(p1.landTime - p1.startTime, 0.01)
    local v4 = math.clamp(v3, 0, 1)
    v3 = smoothstep(v4)
    local v5 = (1 - v4) ^ 0.4
    local pivot = p1.pivot
    local v6 = pivot - pivot.Position
    v1, v2 = getHorizontalAxes(v6)
    local v7 = pivot.Position + Vector3.new(0, 300, 0)
    local v8 = (pivot.Position.X * 0.17 + pivot.Position.Z * 0.23) % (math.pi * 2)
    local v9 = v8 + p3 / 3.5 * math.pi * 2
    local v10 = v8 + p3 / 2.8 * math.pi * 2
    local v11 = v1 * math.sin(v9)
    local v12 = (v11 + v2 * math.cos(v9 * 0.85)) * 12 * (1 - v4) ^ 0.85
    local v13 = v7:Lerp(pivot.Position, v3)
    v11 = math.sin(v10 * 1.35)
    local v14 = v11 + math.sin(v10 * 2.05) * 0.45
    local v15 = math.cos(v10 * 1.2)
    v11 = v15 + math.cos(v10 * 1.85) * 0.4
    local v16 = math.sin(v10)
    v15 = v16 + math.sin(v10 * 0.65) * 0.3
    v16 = CFrame.Angles(v14 * u40 * v5, v15 * u37 * v5, v11 * u43 * v5)
    local v17 = 1 <= v4
    return v13 + v12, v6 * v16, v17
end
return function(p1, p2, p3, p4) -- Line: 176 -- upvalues: resolveData (val), Workspace (val), Placeables (val), prepareModel (val), getFrame (val), RunService (val)
    local v1, v2
    local u8 = resolveData(p2, p3, p4)
    if not u8 then
        return
    end
    local ServerTimeNow = Workspace:GetServerTimeNow()
    if u8.landTime <= ServerTimeNow then
        return
    end
    local v3 = Placeables:FindFirstChild("Lore Team")
    local Pamphlet = v3
    if Pamphlet then
        Pamphlet = v3:FindFirstChild("Pamphlet")
    end
    if not Pamphlet then
        return warn("Could not find Pamphlet model for Flyer effect")
    end
    local u30 = Pamphlet:Clone()
    prepareModel(u30)
    local u35 = os.clock()
    v1, v2 = getFrame(u8, ServerTimeNow, 0)
    u30:PivotTo(CFrame.new(v1) * v2)
    u30.Parent = Workspace
    local u53 = nil
end