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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Cone
--                              Dumped in 0.000456 seconds
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
    local v1, v2
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v3 = p2 * CFrame.Angles(-1.5707963267948966, 0, 0)
    local v4 = v3.Position + v3.UpVector * (p4 * 0.5)
    local v5 = v3.Position + -v3.UpVector * (p4 * 0.5)
    v4 = CFrame.lookAt(v4, v4 + v3.UpVector)
    v5 = CFrame.lookAt(v5, v5 - v3.UpVector)
    local v6 = math.floor(360 / p5)
    local v7 = nil
    local v8 = nil
    local v9 = 360
    local v10 = v6
    local v11 = p3
    for i = 0, v9, v10 do
        v1 = math.sin((math.rad(i))) * v11
        v2 = v3.LookVector * (math.cos((math.rad(i))) * v11)
        v2 = v5.Position + (v2 + v3.RightVector * v1)
        if v7 then
            Ceive.Ray:Draw(v2, v4.Position)
            Ceive.Ray:Draw(v7, v2)
            v7 = v2
        else
            v7 = v2
            v8 = v2
            Ceive.Ray:Draw(v2, v4.Position)
        end
    end
    Ceive.Ray:Draw(v7, v8)
end
function u0.Create(p1, p2, p3, p4, p5) -- Line: 63
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
function u0.Update(p1, p2) -- Line: 81
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Length, p2.Subdivisions)
end
return u0