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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo.Gizmos.VolumeCylinder
--                              Dumped in 0.000334 seconds
--                          Bytecode version 9  |  5 functions

local Terrain = workspace.Terrain
local u2 = {}
u2.__index = u2
function u2.Init(p1, p2, p3, p4, p5, p6) -- Line: 6 -- upvalues: u2 (val)
    local v1 = setmetatable({}, u2)
    v1.Ceive = p1
    v1.Propertys = p2
    v1.Request = p3
    v1.Release = p4
    v1.Retain = p5
    v1.Register = p6
    return v1
end
function u2:Draw(p2, p3, p4, p5, p6) -- Line: 19 -- upvalues: Terrain (val)
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local CylinderHandleAdornment = self.Request("CylinderHandleAdornment")
    CylinderHandleAdornment.Color3 = self.Propertys.Color3
    CylinderHandleAdornment.Transparency = self.Propertys.Transparency
    CylinderHandleAdornment.CFrame = p2
    CylinderHandleAdornment.Height = p4
    CylinderHandleAdornment.Radius = p3
    CylinderHandleAdornment.InnerRadius = p5 or 0
    CylinderHandleAdornment.Angle = p6 or 360
    CylinderHandleAdornment.AlwaysOnTop = self.Propertys.AlwaysOnTop
    CylinderHandleAdornment.ZIndex = 1
    CylinderHandleAdornment.Adornee = Terrain
    CylinderHandleAdornment.Parent = Terrain
    Ceive.ActiveInstances = Ceive.ActiveInstances + 1
    self.Register(CylinderHandleAdornment)
end
function u2.Create(p1, p2, p3, p4, p5, p6) -- Line: 45
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = p2,
        Radius = p3,
        Length = p4,
        InnerRadius = p5 or 0,
        Angle = p6 or 360,
        AlwaysOnTop = p1.Propertys.AlwaysOnTop,
        Transparency = p1.Propertys.Transparency,
        Color3 = p1.Propertys.Color3,
    }
    p1.Retain(p1, v1)
    return v1
end
function u2.Update(p1, p2) -- Line: 64
    local Ceive = p1.Ceive
    Ceive.PushProperty("AlwaysOnTop", p2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", p2.Transparency)
    Ceive.PushProperty("Color3", p2.Color3)
    p1:Draw(p2.Transform, p2.Radius, p2.Length, p2.InnerRadius, p2.Angle)
end
return u2