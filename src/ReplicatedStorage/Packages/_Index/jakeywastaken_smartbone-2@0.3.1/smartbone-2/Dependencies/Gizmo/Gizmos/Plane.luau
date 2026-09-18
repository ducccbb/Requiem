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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Plane
--                              Dumped in 0.000363 seconds
--                          Bytecode version 9  |  6 functions

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
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v1 = p4 * Vector3.new(1, 1, 0)
    local v2 = CFrame.lookAt(p2, p2 + p3)
    local v3 = v1 * 0.5
    ;(function(p1, a2, p3) -- Line: 35 -- upvalues: p2 (val), Ceive (val)
        local v1 = p2 + (p1 - a2 + p3)
        local v2 = p2 + (p1 + a2 + p3)
        local v3 = p2 + (-p1 - a2 + p3)
        local v4 = p2 + (-p1 + a2 + p3)
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        Ceive.Ray:Draw(v2, v3)
        Ceive.Ray:Draw(v3, v4)
    end)(v2.UpVector * v3.Y, v2.RightVector * v3.X, v2.LookVector * v3.Z)
end
function u0.Create(p1, p2, p3, p4) -- Line: 53
    local v1 = {
        Enabled = true,
        Destroy = false,
        Position = p2,
        Normal = p3,
        Size = p4,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 70
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Position, p2.Normal, p2.Size)
end
return u0