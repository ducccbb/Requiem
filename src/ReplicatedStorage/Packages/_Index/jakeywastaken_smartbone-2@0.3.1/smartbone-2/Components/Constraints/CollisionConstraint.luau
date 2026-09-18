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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.CollisionConstraint
--                              Dumped in 0.000244 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3) -- Line: 1
    local Collisions, v1, v2, v3, v4, v5
    debug.profilebegin("Collision Constraint")
    local v6 = {}
    local v7 = {}
    local v8 = p3
    local v9 = nil
    local v10 = nil
    v1, v2 = p1, p2
    for i, j in v8, v9, v10 do
        Collisions = j:GetCollisions(v2, v1.Radius)
        if 0 < #Collisions then
            table.insert(v7, j:GetObject())
        end
        v3 = Collisions
        v4 = nil
        v5 = nil
        for k, n in v3, v4, v5 do
            table.insert(v6, n)
        end
    end
    v8 = v6
    v9 = nil
    v10 = nil
    for m, i5 in v8, v9, v10 do
        v2 = i5.ClosestPoint + i5.Normal * v1.Radius
    end
    v1.CollisionsData = v6
    v1.CollisionHits = v7
    debug.profileend()
    return v2
end