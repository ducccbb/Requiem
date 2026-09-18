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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.RotationConstraint
--                              Dumped in 0.000398 seconds
--                          Bytecode version 9  |  3 functions

local function SafeUnit(p1) -- Line: 1
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
return function(p1, p2, p3) -- Line: 9
    local Magnitude, Unit, Unit_2, v1
    debug.profilebegin("Rotation Constraint")
    local v2 = p3.Bones[p1.ParentIndex]
    if not v2 then
        debug.profileend()
        return p2
    end
    local v3 = p3.Bones[v2.ParentIndex]
    if not v3 then
        debug.profileend()
        return p2
    end
    local RotationLimit = v2.RotationLimit
    local Position = v2.Position
    local v4 = v2.Position - v3.Position
    if v4.Magnitude ~= 0 then
        Unit = v4.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    Magnitude = (p2 - Position).Magnitude
    local v5 = p2 - Position
    if v5.Magnitude ~= 0 then
        Unit_2 = v5.Unit
    else
        Unit_2 = Vector3.new(0, 0, 0)
    end
    if 180 <= RotationLimit then
        debug.profileend()
        return p2
    end
    if RotationLimit <= 0 then
        debug.profileend()
        return Position + Unit * Magnitude
    end
    v5 = math.rad(p1.RotationLimit)
    local v6 = math.acos((Unit:Dot(Unit_2)))
    if v5 > v6 then
        v1 = Unit_2
    else
        local Unit_3
        local v7 = Unit:Cross(Unit_2)
        if v7.Magnitude ~= 0 then
            Unit_3 = v7.Unit
        else
            Unit_3 = Vector3.new(0, 0, 0)
        end
        v1 = CFrame.fromAxisAngle(Unit_3, v5) * Unit
    end
    debug.profileend()
    return Position + v1 * Magnitude
end