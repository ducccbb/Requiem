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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Colliders.Box
--                              Dumped in 0.000662 seconds
--                          Bytecode version 9  |  4 functions

local function SafeUnit(p1) -- Line: 1
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function ClosestPointFunc(p1, p2, p3) -- Line: 9
    local v1, v2
    local v3 = p1:pointToObjectSpace(p3)
    local x_2 = p2.x
    local y_2 = p2.y
    local z = p2.z
    local x = v3.x
    local y = v3.y
    local z_2 = v3.z
    local v4 = math.clamp(x, -x_2 * 0.5, x_2 * 0.5)
    local v5 = -y_2 * 0.5
    local v6 = math.clamp(y, v5, y_2 * 0.5)
    local v7 = -z * 0.5
    local v8 = math.clamp(z_2, v7, z * 0.5)
    if v4 ~= x or v6 ~= y or v8 ~= z_2 then
        local Unit
        v5 = p1 * Vector3.new(v4, v6, v8)
        v1 = p3 - v5
        if v1.Magnitude ~= 0 then
            Unit = v1.Unit
        else
            Unit = Vector3.new(0, 0, 0)
        end
        return false, v5, Unit
    end
    v5 = x - x_2 * 0.5
    v7 = y - y_2 * 0.5
    v1 = z_2 - z * 0.5
    local v9 = -x - x_2 * 0.5
    local v10 = -y - y_2 * 0.5
    local v11 = -z_2 - z * 0.5
    local v12 = math.max(v5, v7, v1, v9, v10, v11)
    if v12 == v5 then
        v2 = p1 * Vector3.new(x_2 * 0.5, y, z_2)
        return true, v2, p1.XVector
    end
    if v12 == v7 then
        v2 = p1 * Vector3.new(x, y_2 * 0.5, z_2)
        return true, v2, p1.YVector
    end
    if v12 == v1 then
        v2 = p1 * Vector3.new(x, y, z * 0.5)
        return true, v2, p1.ZVector
    end
    if v12 == v9 then
        v2 = p1 * Vector3.new(-x_2 * 0.5, y, z_2)
        return true, v2, -p1.XVector
    end
    if v12 == v10 then
        v2 = p1 * Vector3.new(x, -y_2 * 0.5, z_2)
        return true, v2, -p1.YVector
    end
    if v12 == v11 then
        v2 = p1 * Vector3.new(x, y, -z * 0.5)
        return true, v2, -p1.ZVector
    end
    warn("CLOSEST POINT ON BOX FAIL")
    return false, p1.Position, (Vector3.new(0, 0, 0))
end
return function(p1, p2, p3, p4) -- Line: 60 -- upvalues: ClosestPointFunc (val)
    local v1, v2, v3
    debug.profilebegin("Box Testing")
    v1, v2, v3 = ClosestPointFunc(p1, p2, p3)
    if v1 then
        return v1, v2, v3
    end
    v1 = (v2 - p3).Magnitude < p4
    debug.profileend()
    return v1, v2, v3
end