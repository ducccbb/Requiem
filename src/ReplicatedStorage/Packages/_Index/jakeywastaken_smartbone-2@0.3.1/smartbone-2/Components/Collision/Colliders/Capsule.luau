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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Colliders.Capsule
--                              Dumped in 0.000393 seconds
--                          Bytecode version 9  |  5 functions

local function SafeUnit(p1) -- Line: 2
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function solve(p1, p2, p3, p4) -- Line: 10
    return p1 + p2 * math.clamp((p4 - p1):Dot(p2), -p3, p3)
end
local function ClosestPointFunc(p1, p2, p3, p4) -- Line: 17
    local Unit
    local Position = p1.Position
    local UpVector = p1.UpVector
    local v1 = p2 * 0.5
    local v2 = Position + UpVector * math.clamp((p4 - Position):Dot(UpVector), -v1, v1)
    v1 = p4 - v2
    if v1.Magnitude ~= 0 then
        Unit = v1.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v1 = (v2 - p4).Magnitude <= p3
    return v1, v2 + Unit * p3, Unit
end
return function(p1, p2, p3, p4) -- Line: 27
    local Unit
    debug.profilebegin("Capsule Testing")
    local v1 = math.min(p2.Y, p2.Z) * 0.5
    local v2 = p1 * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
    local Position = v2.Position
    local UpVector = v2.UpVector
    local v3 = p2.X * 0.5
    local v4 = Position + UpVector * math.clamp((p3 - Position):Dot(UpVector), -v3, v3)
    v3 = p3 - v4
    if v3.Magnitude ~= 0 then
        Unit = v3.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v3 = (v4 - p3).Magnitude <= v1
    local v5 = v3
    local v6 = v4 + Unit * v1
    local v7 = Unit
    if v5 then
        return v5, v6, v7
    end
    v5 = (v6 - p3).Magnitude < p4
    debug.profileend()
    return v5, v6, v7
end