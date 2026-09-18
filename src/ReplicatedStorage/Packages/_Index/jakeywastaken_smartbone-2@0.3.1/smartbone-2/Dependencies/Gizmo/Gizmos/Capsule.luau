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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Capsule
--                              Dumped in 0.000536 seconds
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
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v12 = p2.Position + p2.UpVector * (p4 * 0.5)
    local v13 = p2.Position - p2.UpVector * (p4 * 0.5)
    v12 = CFrame.lookAt(v12, v12 + p2.UpVector)
    v13 = CFrame.lookAt(v13, v13 - p2.UpVector)
    local v14 = math.floor(360 / p5)
    local v15 = nil
    local v16 = nil
    local v17 = nil
    local v18 = nil
    local v19 = 360
    local v20 = v14
    v5, v1, v11 = p3, p2, p5
    for i = 0, v19, v20 do
        v2 = math.sin((math.rad(i))) * v5
        v4 = v1.LookVector * (math.cos((math.rad(i))) * v5)
        v3 = v4 + v1.RightVector * v2
        v4 = v12.Position + v3
        v6 = v13.Position + v3
        Ceive.Ray:Draw(v4, v6)
        v9 = CFrame.new(v12.Position)
        v8 = v9 * v1.Rotation
        v10 = math.rad(i)
        v7 = v8 * CFrame.Angles(0, v10, 0)
        Ceive.Circle:Draw(v7, v5, v11 * 0.5, 90, false)
        v9 = CFrame.new(v13.Position)
        v8 = v9 * v1.Rotation
        v10 = math.rad(i)
        v7 = v8 * CFrame.Angles(3.141592653589793, v10, 0)
        Ceive.Circle:Draw(v7, v5, v11 * 0.5, 90, false)
        if v15 then
            Ceive.Ray:Draw(v15, v4)
            Ceive.Ray:Draw(v16, v6)
            v15 = v4
            v16 = v6
        else
            v15 = v4
            v16 = v6
            v17 = v4
            v18 = v6
        end
    end
    Ceive.Ray:Draw(v15, v17)
    Ceive.Ray:Draw(v16, v18)
end
function u0.Create(p1, p2, p3, p4, p5) -- Line: 88
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
function u0.Update(p1, p2) -- Line: 106
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Length, p2.Subdivisions)
end
return u0