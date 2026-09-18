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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Colliders.Cylinder
--                              Dumped in 0.000684 seconds
--                          Bytecode version 9  |  7 functions

local function SafeUnit(p1) -- Line: 2
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function solve(p1, p2, p3, p4) -- Line: 10
    local v1 = math.clamp((p4 - p1):Dot(p2), -p3, p3)
    return p1 + p2 * v1, v1
end
local function ProjectOnPlane(p1, p2, p3) -- Line: 17
    return p3 - (p3 - p1):Dot(p2) * p2
end
local function ClosestPointFunc(p1, p2, p3) -- Line: 25
    local Magnitude, Unit, Unit_2, Unit_3, v1, v2
    local u7 = math.min(p2.Y, p2.Z) * 0.5
    local v3 = p2.X * 0.5
    local Position = p1.Position
    local RightVector = p1.RightVector
    local v4 = math.clamp((p3 - Position):Dot(RightVector), -v3, v3)
    local v5 = Position + RightVector * v4
    local v6 = v4
    local v7 = p1.Position + -p1.RightVector * v3
    local v8 = p1.Position + p1.RightVector * v3
    local v9 = -p1.RightVector
    local RightVector_2 = p1.RightVector
    local v10 = p3 - (p3 - v7):Dot(v9) * v9
    local function GetFinalProj(p1, p2) -- Line: 39 -- upvalues: u7 (val)
        local Unit
        local v1 = p1 - p2
        if v1.Magnitude ~= 0 then
            Unit = v1.Unit
        else
            Unit = Vector3.new(0, 0, 0)
        end
        return p2 + Unit * math.min((p1 - p2).Magnitude, u7)
    end
    local v11 = v10
    local v12 = v11 - v7
    if v12.Magnitude ~= 0 then
        Unit = v12.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v10 = v7 + Unit * math.min((v11 - v7).Magnitude, u7)
    v11 = p3 - (p3 - v8):Dot(RightVector_2) * RightVector_2
    v12 = v11 - v8
    if v12.Magnitude ~= 0 then
        Unit_2 = v12.Unit
    else
        Unit_2 = Vector3.new(0, 0, 0)
    end
    local v13 = v8 + Unit_2 * math.min((v11 - v8).Magnitude, u7)
    v12 = p3 - v5
    if v12.Magnitude ~= 0 then
        Unit_3 = v12.Unit
    else
        Unit_3 = Vector3.new(0, 0, 0)
    end
    v12 = (v5 - p3).Magnitude <= u7
    local v14 = v5 + Unit_3 * u7
    Magnitude = (v13 - p3).Magnitude
    local Magnitude_2 = (v10 - p3).Magnitude
    local v15 = math.min(Magnitude, Magnitude_2, (v14 - p3).Magnitude)
    if v6 == v3 then
        local Unit_5
        v2 = p3 - v13
        if v2.Magnitude ~= 0 then
            Unit_5 = v2.Unit
        else
            Unit_5 = Vector3.new(0, 0, 0)
        end
        v1 = Unit_5:Dot(RightVector_2)
        v2 = v1 < 0
        return v2, v13, RightVector_2
    elseif v15 ~= Magnitude then
        if v6 == -v3 then
            local Unit_4
            v2 = p3 - v10
            if v2.Magnitude ~= 0 then
                Unit_4 = v2.Unit
            else
                Unit_4 = Vector3.new(0, 0, 0)
            end
            v1 = Unit_4:Dot(v9)
            v2 = v1 < 0
            return v2, v10, v9
        elseif v15 ~= Magnitude_2 then
            return v12, v14, Unit_3
        end
    end
end
return function(p1, p2, p3, p4) -- Line: 70 -- upvalues: ClosestPointFunc (val)
    local v1, v2, v3
    debug.profilebegin("Cylinder Testing")
    v1, v2, v3 = ClosestPointFunc(p1, p2, p3)
    if v1 then
        return v1, v2, v3
    end
    v1 = (v2 - p3).Magnitude < p4
    debug.profileend()
    return v1, v2, v3
end