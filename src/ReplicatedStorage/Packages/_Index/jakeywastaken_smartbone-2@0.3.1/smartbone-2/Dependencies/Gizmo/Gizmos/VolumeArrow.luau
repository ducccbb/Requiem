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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.VolumeArrow
--                              Dumped in 0.000335 seconds
--                          Bytecode version 9  |  5 functions

local u0 = {}
u0.__index = u0
function u0.Init(p1, p2, p3, p4, p5, p6) -- Line: 4 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = p1
    v1.Propertys = p2
    v1.Request = p3
    v1.Release = p4
    v1.Retain = p5
    v1.Register = p6
    return v1
end
function u0:Draw(p2, p3, p4, p5, p6, p7) -- Line: 17
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v1 = CFrame.lookAt(p3 - (p3 - p2).Unit * (p6 * 0.5), p3)
    if p7 ~= true then
        Ceive.Ray:Draw(p2, p3)
    else
        local Position = v1.Position
        local v2 = CFrame.lookAt((p2 + Position) * 0.5, p3)
        Ceive.VolumeCylinder:Draw(v2, p4, (Position - p2).Magnitude)
    end
    Ceive.VolumeCone:Draw(v1, p5, p6)
end
function u0.Create(p1, p2, p3, p4, p5, p6, p7) -- Line: 39
    local v1 = {
        Enabled = true,
        Destroy = false,
        Origin = p2,
        End = p3,
        CylinderRadius = p4,
        ConeRadius = p5,
        Length = p6,
        UseCylinder = p7,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 59
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Origin, p2.End, p2.Radius, p2.Length, p2.UseCylinder)
end
return u0