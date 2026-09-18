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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Cylinder
--                              Dumped in 0.000463 seconds
--                          Bytecode version 9  |  5 functions

local u0 = {}
u0.__index = u0
function u0.Init(p1, p2, p3, p4, p5) -- Line: 4 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = p1
    v1.Propertys = p2
    v1.Request = p3
    v1.Release = p4
    v1.Retain = p5
    return v1
end
function u0:Draw(p2, p3, p4, p5) -- Line: 16
    local v1, v2, v3, v4, v5, v6
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v7 = p2.Position + p2.UpVector * (p4 * 0.5)
    local v8 = p2.Position - p2.UpVector * (p4 * 0.5)
    v7 = CFrame.lookAt(v7, v7 + p2.UpVector)
    v8 = CFrame.lookAt(v8, v8 - p2.UpVector)
    local v9 = math.floor(360 / p5)
    local v10 = nil
    local v11 = nil
    local v12 = nil
    local v13 = nil
    local v14 = 360
    local v15 = v9
    v5, v1 = p3, p2
    for i = 0, v14, v15 do
        v2 = math.sin((math.rad(i))) * v5
        v4 = v1.LookVector * (math.cos((math.rad(i))) * v5)
        v3 = v4 + v1.RightVector * v2
        v4 = v7.Position + v3
        v6 = v8.Position + v3
        Ceive.Ray:Draw(v4, v6)
        if v10 then
            Ceive.Ray:Draw(v10, v4)
            Ceive.Ray:Draw(v11, v6)
            v10 = v4
            v11 = v6
        else
            v10 = v4
            v11 = v6
            v12 = v4
            v13 = v6
        end
    end
    Ceive.Ray:Draw(v10, v12)
    Ceive.Ray:Draw(v11, v13)
end
function u0.Create(p1, p2, p3, p4, p5) -- Line: 71
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Radius = p3,
        Length = p4,
        Subdivisions = p5,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 89
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Length, p2.Subdivisions)
end
return u0