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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Frustum
--                              Dumped in 0.000564 seconds
--                          Bytecode version 9  |  4 functions

local Parent = script.Parent
local Config = require(Parent:WaitForChild("Config"))
local Utilities = require(Parent:WaitForChild("Utilities"))
local u14 = {
    GetCFrames = function(p1, p2) -- Line: 8
        debug.profilebegin("Frustum::GetCFrames")
        local CFrame = p1.CFrame
        local Position = CFrame.Position
        local RightVector = CFrame.RightVector
        local UpVector = CFrame.UpVector
        local v1 = p2 * 0.5
        local v2 = math.tan((p1.FieldOfView + 5) * 0.5 * 0.017453) * p2
        local v3 = v2 * (p1.ViewportSize.X / p1.ViewportSize.Y)
        local v4 = CFrame * CFrame.new(0, 0, -p2)
        local v5 = v4 * Vector3.new(v3, v2, 0)
        local v6 = v4 * Vector3.new(-v3, -v2, 0)
        local v7 = v4 * Vector3.new(v3, -v2, 0)
        local v8 = (CFrame * CFrame.new(0, 0, -v1)):Inverse()
        debug.profileend()
        return v8, v3, v2, v1, UpVector:Cross(v7 - Position).Unit, UpVector:Cross(v6 - Position).Unit, RightVector:Cross(Position - v5).Unit, RightVector:Cross(Position - v7).Unit, CFrame
    end,
    InViewFrustum = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) -- Line: 32
        debug.profilebegin("Frustum::InViewFrustum")
        local v1 = p2 * p1
        if p3 < v1.X or v1.X < -p3 or p4 < v1.Y or v1.Y < -p4 or p5 < v1.Z or v1.Z < -p5 then
            debug.profileend()
            return false
        end
        local v2 = p1 - p10.Position
        local v3 = p6:Dot(v2)
        if v3 < 0 then
            debug.profileend()
            return false
        end
        v3 = p7:Dot(v2)
        if 0 < v3 then
            debug.profileend()
            return false
        end
        v3 = p8:Dot(v2)
        if v3 < 0 then
            debug.profileend()
            return false
        end
        v3 = p9:Dot(v2)
        if 0 < v3 then
            debug.profileend()
            return false
        end
        debug.profileend()
        return true
    end,
}
function u14.ObjectInFrustum(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) -- Line: 73 -- upvalues: Config (val), Utilities (val), u14 (val)
    local v1, v2
    local CFrame = p1.CFrame
    local v3 = Config.FAR_PLANE * 0.5
    local v4 = Utilities.ClosestPointOnLine(p10.Position + p10.LookVector * v3, p10.LookVector, v3, CFrame.Position)
    v1, v2 = Utilities.ClosestPointInBox(CFrame, p1.Size, v4)
    if v1 or u14.InViewFrustum(v2, p2, p3, p4, p5, p6, p7, p8, p9, p10) then
        return true
    end
    return false
end
return u14