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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Mesh
--                              Dumped in 0.000590 seconds
--                          Bytecode version 9  |  6 functions

local function Map(p1, p2, p3, p4, p5) -- Line: 1
    return (p1 - p2) / (p3 - p2) * (p5 - p4) + p4
end
local u1 = {}
u1.__index = u1
function u1.Init(p1, p2, p3, p4, p5) -- Line: 8 -- upvalues: u1 (val)
    local v1 = setmetatable({}, u1)
    v1.Ceive = p1
    v1.Propertys = p2
    v1.Request = p3
    v1.Release = p4
    v1.Retain = p5
    return v1
end
function u1:Draw(p2, p3, p4, p5) -- Line: 20
    local v1, v2, v3, v4, v5
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v6 = (-1 / 0)
    local v7 = (-1 / 0)
    local v8 = (-1 / 0)
    local v9 = (1 / 0)
    local v10 = (1 / 0)
    local v11 = (1 / 0)
    local v12 = p4
    local v13 = nil
    local v14 = nil
    for i, j in v12, v13, v14 do
        v6 = math.max(v6, j.x)
        v7 = math.max(v7, j.y)
        v8 = math.max(v8, j.z)
        v9 = math.min(v9, j.x)
        v10 = math.min(v10, j.y)
        v11 = math.min(v11, j.z)
    end
    v12 = p4
    v13 = nil
    v14 = nil
    for k, n in v12, v13, v14 do
        v3 = v9
        v4 = v10
        v5 = v11
        p4[k] = p2 * CFrame.new(Vector3.new((n.x - v3) / (v6 - v3) * 1 + -0.5, (n.y - v4) / (v7 - v4) * 1 + -0.5, (n.z - v5) / (v8 - v5) * 1 + -0.5) * p3)
    end
    v12 = p5
    v13 = nil
    v14 = nil
    for m, i5 in v12, v13, v14 do
        if #i5 ~= 3 then
            v1 = p4[i5[1].v]
            v2 = p4[i5[2].v]
            v3 = p4[i5[3].v]
            v4 = p4[i5[4].v]
            Ceive.Ray:Draw(v1.Position, v2.Position)
            Ceive.Ray:Draw(v1.Position, v4.Position)
            Ceive.Ray:Draw(v4.Position, v2.Position)
            Ceive.Ray:Draw(v3.Position, v4.Position)
            Ceive.Ray:Draw(v2.Position, v3.Position)
        else
            v1 = p4[i5[1].v]
            v2 = p4[i5[2].v]
            v3 = p4[i5[3].v]
            Ceive.Ray:Draw(v1.Position, v2.Position)
            Ceive.Ray:Draw(v2.Position, v3.Position)
            Ceive.Ray:Draw(v3.Position, v1.Position)
        end
    end
end
function u1.Create(p1, p2, p3, p4, p5) -- Line: 79
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Size = p3,
        Vertices = p4,
        Faces = p5,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u1.Update(p1, p2) -- Line: 97
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Size, p2.Vertices, p2.Faces)
end
return u1