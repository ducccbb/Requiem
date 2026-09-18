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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Colliders.Triangle
--                              Dumped in 0.000716 seconds
--                          Bytecode version 9  |  7 functions

local Dot = Vector3.new().Dot
local Cross = Vector3.new().Cross
local clamp = math.clamp
local function SafeUnit(p1) -- Line: 12
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function ClosestPointOnLineSegment(p1, p2, p3) -- Line: 20 -- upvalues: Dot (val), clamp (val)
    local v1 = p2 - p1
    local v2 = Dot(p3 - p1, v1)
    return p1 + clamp(v2 / Dot(v1, v1), 0, 1) * v1
end
local function ProjectOnPlane(p1, p2, p3) -- Line: 26
    return p3 - (p3 - p1):Dot(p2) * p2
end
local function SameSide(p1, p2, p3, p4) -- Line: 34 -- upvalues: Cross (val), Dot (val)
    local v1 = Cross(p4 - p3, p1 - p3)
    local v2 = Cross(p4 - p3, p2 - p3)
    local v3 = Dot(v1, v2)
    if 0 <= v3 then
        return true
    end
    return false
end
local function PointInTriangle(p1, p2, p3, p4) -- Line: 44 -- upvalues: Cross (val), Dot (val)
    local v1 = Cross(p4 - p3, p1 - p3)
    local v2 = Cross(p4 - p3, p2 - p3)
    local v3 = Dot(v1, v2)
    local v4 = not (0 > v3)
    if not v4 then
        return false
    end
    v1 = Cross(p4 - p2, p1 - p2)
    v2 = Cross(p4 - p2, p3 - p2)
    v3 = Dot(v1, v2)
    v4 = not (0 > v3)
    if not v4 then
        return false
    end
    v1 = Cross(p3 - p2, p1 - p2)
    v2 = Cross(p3 - p2, p4 - p2)
    v3 = Dot(v1, v2)
    v4 = not (0 > v3)
    if v4 then
        return true
    end
    return false
end
return function(p1, p2, p3, p4) -- Line: 52 -- upvalues: Dot (val), clamp (val), Cross (val)
    local Magnitude, Unit, v1
    debug.profilebegin("Triangle")
    local v2 = p2 - p1
    local v3 = Dot(p4 - p1, v2)
    local v4 = p1 + clamp(v3 / Dot(v2, v2), 0, 1) * v2
    local v5 = p3 - p2
    local v6 = Dot(p4 - p2, v5)
    v2 = p2 + clamp(v6 / Dot(v5, v5), 0, 1) * v5
    v3 = p1 - p3
    local v7 = Dot(p4 - p3, v3)
    v5 = p3 + clamp(v7 / Dot(v3, v3), 0, 1) * v3
    v6 = Cross(p2 - p1, p3 - p1)
    if v6.Magnitude ~= 0 then
        Unit = v6.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v7 = p4 - (p4 - (p1 + p2 + p3) * 0.3333):Dot(Unit) * Unit
    local v8 = Cross(p3 - p2, p4 - p2)
    local v9 = Cross(p3 - p2, p1 - p2)
    local v10 = Dot(v8, v9)
    local v11 = not (0 > v10)
    if not v11 then
        v1 = false
    else
        v8 = Cross(p3 - p1, p4 - p1)
        v9 = Cross(p3 - p1, p2 - p1)
        v10 = Dot(v8, v9)
        v11 = not (0 > v10)
        if not v11 then
            v1 = false
        else
            v8 = Cross(p2 - p1, p4 - p1)
            v9 = Cross(p2 - p1, p3 - p1)
            v10 = Dot(v8, v9)
            v11 = not (0 > v10)
            v1 = not (not v11)
        end
    end
    if v1 then
        debug.profileend()
        return v7, Unit
    end
    Magnitude = (v4 - p4).Magnitude
    local Magnitude_2 = (v2 - p4).Magnitude
    local Magnitude_3 = (v5 - p4).Magnitude
    v9 = math.min(Magnitude, Magnitude_2, Magnitude_3)
    if v9 == Magnitude then
        debug.profileend()
        return v4, Unit
    end
    if v9 == Magnitude_2 then
        debug.profileend()
        return v2, Unit
    end
    if v9 == Magnitude_3 then
        debug.profileend()
        return v5, Unit
    end
    debug.profileend()
    return p4, Unit
end