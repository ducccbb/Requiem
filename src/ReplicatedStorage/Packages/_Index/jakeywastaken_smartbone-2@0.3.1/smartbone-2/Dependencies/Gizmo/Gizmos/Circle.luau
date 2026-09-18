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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Circle
--                              Dumped in 0.000434 seconds
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
function u0:Draw(p2, p3, p4, p5, p6) -- Line: 16
    local v1, v2, v3, v4, v5, v6
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v7 = math.floor(p5 / p4)
    local v8 = nil
    local v9 = nil
    local v10 = 0
    local v11 = p5
    local v12 = v7
    v5, v1 = p3, p2
    for i = 0, v11, v12 do
        v2 = math.sin((math.rad(i))) * v5
        v4 = v1.UpVector * (math.cos((math.rad(i))) * v5)
        v3 = v1.Position + (v4 + v1.RightVector * v2)
        if v8 ~= nil then
            Ceive.Ray:Draw(v8, v3)
            v8 = v3
            v10 = i
        else
            v8 = v3
            v9 = v3
            v10 = i
        end
    end
    if v10 ~= v6 then
        v11 = math.sin((math.rad(v6))) * v5
        v3 = v1.UpVector * (math.cos((math.rad(v6))) * v5)
        Ceive.Ray:Draw(v8, v1.Position + (v3 + v1.RightVector * v11))
    end
    if v13 ~= false then
        Ceive.Ray:Draw(v8, v9)
    end
    return v8
end
function u0.Create(p1, p2, p3, p4, p5, p6) -- Line: 64
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Radius = p3,
        Subdivisions = p4,
        Angle = p5,
        ConnectToStart = p6,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 83
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Subdivisions, p2.Angle, p2.ConnectToStart)
end
return u0