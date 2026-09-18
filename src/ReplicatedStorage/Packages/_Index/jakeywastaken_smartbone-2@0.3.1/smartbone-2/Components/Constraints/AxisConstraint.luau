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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.AxisConstraint
--                              Dumped in 0.000814 seconds
--                          Bytecode version 9  |  3 functions

local function SafeUnit(p1) -- Line: 1
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
return function(p1, p2, p3, p4) -- Line: 9
    local Unit, v1, v2, v3, v4, v5, v6, v7, v8
    debug.profilebegin("Axis Constraint")
    local v9 = p4:Inverse() * p2
    local X = v9.X
    local Y = v9.Y
    local Z = v9.Z
    local XAxisLimits = p1.XAxisLimits
    local YAxisLimits = p1.YAxisLimits
    local ZAxisLimits = p1.ZAxisLimits
    if not (p1.AxisLocked[1]) then
        v1 = 1
    else
        v1 = 0
    end
    if not (p1.AxisLocked[2]) then
        v2 = 1
    else
        v2 = 0
    end
    if not (p1.AxisLocked[3]) then
        v3 = 1
    else
        v3 = 0
    end
    local v10 = XAxisLimits.Min + p1.Radius
    if v10 > XAxisLimits.Max - p1.Radius then
        v4 = v10
    else
        v4 = XAxisLimits.Max - p1.Radius
    end
    local v11 = YAxisLimits.Min + p1.Radius
    if v11 > YAxisLimits.Max - p1.Radius then
        v5 = v11
    else
        v5 = YAxisLimits.Max - p1.Radius
    end
    local v12 = ZAxisLimits.Min + p1.Radius
    if v12 > ZAxisLimits.Max - p1.Radius then
        v6 = v12
    else
        v6 = ZAxisLimits.Max - p1.Radius
    end
    if X < v10 then
        v7 = v10
    elseif v4 >= X then
        v7 = X
    else
        v7 = v4
    end
    local v13 = v7
    if Y < v11 then
        v7 = v11
    elseif v5 >= Y then
        v7 = Y
    else
        v7 = v5
    end
    local v14 = v7
    if Z < v12 then
        v7 = v12
    elseif v6 >= Z then
        v7 = Z
    else
        v7 = v6
    end
    v13 = v13 * v1
    v14 = v14 * v2
    local v15 = v7 * v3
    local v16 = p4 * Vector3.new(v13, v14, v15)
    local RightVector = p4.RightVector
    local UpVector = p4.UpVector
    local LookVector = p4.LookVector
    local v17 = v16 - p3
    if v17.Magnitude ~= 0 then
        Unit = v17.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    if v13 ~= v9.X then
        v8 = RightVector:Dot(Unit)
        if v8 >= 0 then
            v17 = RightVector
        else
            v17 = -RightVector
        end
        p1:ClipVelocity(v16, v17)
    end
    if v14 ~= v9.Y then
        v8 = UpVector:Dot(Unit)
        if v8 >= 0 then
            v17 = UpVector
        else
            v17 = -UpVector
        end
        p1:ClipVelocity(v16, v17)
    end
    if v15 ~= v9.Z then
        v8 = LookVector:Dot(Unit)
        if 0 >= v8 then
            v17 = LookVector
        else
            v17 = -LookVector
            if not v17 then
                v17 = LookVector
            end
        end
        p1:ClipVelocity(v16, v17)
    end
    debug.profileend()
    return v16
end