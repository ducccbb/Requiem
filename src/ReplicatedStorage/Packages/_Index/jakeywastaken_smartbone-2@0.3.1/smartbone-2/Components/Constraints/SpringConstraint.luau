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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.SpringConstraint
--                              Dumped in 0.000326 seconds
--                          Bytecode version 9  |  2 functions

return function(p1, p2, p3, p4, p5) -- Line: 2
    local v1
    debug.profilebegin("Spring Constraint")
    local Settings = p4.Settings
    local Stiffness = Settings.Stiffness
    local Elasticity = Settings.Elasticity
    local v2 = p4.Bones[p1.ParentIndex]
    if not v2 then
        v1 = p2
    else
        local v3
        local FreeLength = p1.FreeLength
        if 0 < Stiffness then
            local v4 = CFrame.new(v2.Position)
            v3 = v4 * v2.TransformOffset.Rotation
            local Position = p3
            if not Position then
                Position = (v3 * CFrame.new(p1.LocalTransformOffset.Position)).Position
            end
            local v5 = Position
            v1 = p2 + (v5 - p2) * (Elasticity * p5)
            if 0 < Stiffness then
                local v6 = v5 - v1
                local Magnitude = v6.Magnitude
                local v7 = FreeLength * (1 - Stiffness) * 2
                if v7 < Magnitude then
                    v1 = v1 + v6 * ((Magnitude - v7) / Magnitude)
                end
            end
        elseif 0 >= Elasticity then
            v1 = p2
        end
        v3 = v2.Position - v1
        local Magnitude_2 = v3.Magnitude
        if 0 < Magnitude_2 then
            v1 = v1 + v3 * ((Magnitude_2 - FreeLength) / Magnitude_2)
        end
    end
    debug.profileend()
    return v1
end