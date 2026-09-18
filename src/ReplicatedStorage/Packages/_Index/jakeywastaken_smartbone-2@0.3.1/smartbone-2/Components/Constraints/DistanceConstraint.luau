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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.DistanceConstraint
--                              Dumped in 0.000186 seconds
--                          Bytecode version 9  |  3 functions

local function SafeUnit(p1) -- Line: 1
    if p1.Magnitude == 0 then
        return (Vector3.new(0, 0, 0))
    end
    return p1.Unit
end
return function(p1, p2, p3) -- Line: 9
    local Unit
    debug.profilebegin("Distance Constraint")
    local v1 = p3.Bones[p1.ParentIndex]
    if not v1 then
        debug.profileend()
        return
    end
    local v2 = p2 - v1.Position
    if v2.Magnitude ~= 0 then
        Unit = v2.Unit
    else
        Unit = Vector3.new(0, 0, 0)
    end
    v2 = v1.Position + Unit * p1.FreeLength
    debug.profileend()
    return v2
end