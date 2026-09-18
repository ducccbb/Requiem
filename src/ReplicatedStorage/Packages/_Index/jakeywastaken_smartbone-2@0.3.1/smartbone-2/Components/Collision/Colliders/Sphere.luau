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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Colliders.Sphere
--                              Dumped in 0.000292 seconds
--                          Bytecode version 9  |  4 functions

local function SafeUnit(p1) -- Line: 2
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
local function ClosestPointFunc(p1, p2, p3) -- Line: 10
    local Unit
    local v1 = p3 - p1
    if v1.Magnitude ~= 0 then
        Unit = v1.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v1 = (p1 - p3).Magnitude <= p2
    return v1, p1 + Unit * p2, Unit
end
return function(p1, p2, p3, p4) -- Line: 18
    local Unit
    debug.profilebegin("Sphere Testing")
    local v1 = p1.Position
    local v2 = math.min(p2.X, p2.Y, p2.Z) * 0.5
    local v3 = p3 - v1
    if v3.Magnitude ~= 0 then
        Unit = v3.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v3 = (v1 - p3).Magnitude <= v2
    local v4 = v3
    local v5 = v1 + Unit * v2
    local v6 = Unit
    if v4 then
        return v4, v5, v6
    end
    v4 = (v5 - p3).Magnitude < p4
    debug.profileend()
    return v4, v5, v6
end