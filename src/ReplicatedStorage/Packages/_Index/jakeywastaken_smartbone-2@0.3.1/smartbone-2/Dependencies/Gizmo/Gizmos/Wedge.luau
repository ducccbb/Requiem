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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Wedge
--                              Dumped in 0.000549 seconds
--                          Bytecode version 9  |  7 functions

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
function u0:Draw(p2, p3, p4) -- Line: 16
    local u17, u20
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local Position = p2.Position
    local v1 = p3 * 0.5
    local v2 = p2.UpVector * v1.Y
    local v3 = p2.RightVector * v1.X
    local v4 = p2.LookVector * v1.Z
    local u18 = nil
    local u19 = nil
    ;(function(p1, p2, p3) -- Line: 38 -- upvalues: Position (val), u17 (ref), u18 (ref), Ceive (val), p4 (val)
        local v1 = Position + (p1 - p2 + p3)
        local v2 = Position + (p1 + p2 + p3)
        local v3 = Position + (p1 - p2 - p3)
        local v4 = Position + (p1 + p2 - p3)
        u17 = v1
        u18 = v2
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        if p4 ~= false then
            Ceive.Ray:Draw(v2, v3)
        end
        Ceive.Ray:Draw(v3, v4)
    end)(-v2, v3, v4)
    ;(function(p1, p2, p3) -- Line: 58 -- upvalues: Position (val), u19 (ref), u20 (ref), Ceive (val), p4 (val)
        local v1 = Position + (p1 - p2 + p3)
        local v2 = Position + (p1 + p2 + p3)
        local v3 = Position + (-p1 - p2 + p3)
        local v4 = Position + (-p1 + p2 + p3)
        u19 = v1
        u20 = v2
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        if p4 ~= false then
            Ceive.Ray:Draw(v2, v3)
        end
        Ceive.Ray:Draw(v3, v4)
    end)(v2, v3, -v4)
    Ceive.Ray:Draw(nil, u19)
    Ceive.Ray:Draw(u18, nil)
    if p4 ~= false then
        Ceive.Ray:Draw(u18, u19)
    end
end
function u0.Create(p1, p2, p3, p4) -- Line: 89
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Size = p3,
        DrawTriangles = p4,
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
    p1:Draw(p2.Transform, p2.Size, p2.DrawTriangles)
end
return u0