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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Sphere
--                              Dumped in 0.000331 seconds
--                          Bytecode version 9  |  5 functions

local u0 = {}
u0.__index = u0
function u0.Init(p1, p2, p3, p4, p5) -- Line: 6 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = p1
    v1.Propertys = p2
    v1.Request = p3
    v1.Release = p4
    v1.Retain = p5
    return v1
end
function u0:Draw(p2, p3, p4, p5) -- Line: 18
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    Ceive.Circle:Draw(p2, p3, p4, p5)
    local v1 = p2 * CFrame.Angles(0, 1.5707963267948966, 0)
    Ceive.Circle:Draw(v1, p3, p4, p5)
    v1 = p2 * CFrame.Angles(1.5707963267948966, 0, 0)
    Ceive.Circle:Draw(v1, p3, p4, p5)
end
function u0.Create(p1, p2, p3, p4, p5) -- Line: 30
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Radius = p3,
        Subdivisions = p4,
        Angle = p5,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 48
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Subdivisions, p2.Angle)
end
return u0