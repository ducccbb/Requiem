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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.Line
--                              Dumped in 0.000273 seconds
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
function u0:Draw(p2, p3) -- Line: 16
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    Ceive.Ray:Draw(p2.Position + p2.LookVector * (-p3 * 0.5), p2.Position + p2.LookVector * (p3 * 0.5))
end
function u0.Create(p1, p2, p3) -- Line: 29
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Length = p3,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u0.Update(p1, p2) -- Line: 45
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Length)
end
return u0