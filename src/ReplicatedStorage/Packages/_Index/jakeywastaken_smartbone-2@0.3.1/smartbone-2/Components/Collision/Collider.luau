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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.Collider
--                               Dumped in 0.00140 seconds
--                          Bytecode version 9  |  8 functions

local HttpService = game:GetService("HttpService")
local Dependencies = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local Colliders = script.Parent:WaitForChild("Colliders")
local Box = require(Colliders:WaitForChild("Box"))
local Capsule = require(Colliders:WaitForChild("Capsule"))
local Cylinder = require(Colliders:WaitForChild("Cylinder"))
local Sphere = require(Colliders:WaitForChild("Sphere"))
local Dependencies_2 = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local Config = require(Dependencies_2:WaitForChild("Config"))
local Dependencies_3 = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local SB_VERBOSE_LOG = require(Dependencies_3:WaitForChild("Utilities")).SB_VERBOSE_LOG
local Gizmo = require(Dependencies:WaitForChild("Gizmo"))
local ALLOW_LIVE_GAME_DEBUG = game:GetService("RunService"):IsStudio()
if not ALLOW_LIVE_GAME_DEBUG then
    ALLOW_LIVE_GAME_DEBUG = Config.ALLOW_LIVE_GAME_DEBUG
end
if ALLOW_LIVE_GAME_DEBUG then
    Gizmo.Init()
elseif Config.ALLOW_LIVE_GAME_DEBUG then
    Gizmo.Init()
end
local u94 = {}
u94.__index = u94
function u94.new() -- Line: 76 -- upvalues: HttpService (val), u94 (val)
    local v1 = {
        Type = "Box",
        Scale = Vector3.new(0, 0, 0),
        Offset = Vector3.new(0, 0, 0),
        Rotation = Vector3.new(0, 0, 0),
        Radius = 0,
        PreviousScale = Vector3.new(0, 0, 0),
        PreviousOffset = Vector3.new(0, 0, 0),
        PreviousRotation = Vector3.new(0, 0, 0),
        PreviousObjectPosition = Vector3.new(0, 0, 0),
        PreviousObjectRotation = Vector3.new(0, 0, 0),
        InNarrowphase = false,
        Size = Vector3.new(0, 0, 0),
        Transform = CFrame.identity,
        GUID = HttpService:GenerateGUID(false),
    }
    return (setmetatable(v1, u94))
end
function u94.SetObject(p1, p2) -- Line: 105
    p1.m_Object = p2
    p1:UpdateTransform()
end
function u94:UpdateTransform() -- Line: 112
    debug.profilebegin("Update Transform")
    local m_Object = self.m_Object
    local Size = m_Object.Size
    local Rotation = self.Rotation
    local v1 = Size * self.Scale
    local v2 = CFrame.Angles(Rotation.X * 0.017453, Rotation.Y * 0.017453, Rotation.Z * 0.017453)
    self.Transform = m_Object.CFrame * CFrame.new(Size * self.Offset) * v2
    self.Size = v1
    self.Radius = math.sqrt((math.max(v1.X, v1.Y, v1.Z) * 0.5) ^ 2 * 2)
    debug.profileend()
end
function u94.GetClosestPoint(p1, p2, p3) -- Line: 137 -- upvalues: Box (val), Capsule (val), Sphere (val), Cylinder (val)
    local v1, v2, v3
    if p1.m_Object == nil then
        return
    end
    p1.InNarrowphase = false
    local v4 = (p2 - p1.Transform.Position).Magnitude - p3
    if p1.Radius < v4 then
        return
    end
    debug.profilebegin("Narrowphase")
    p1.InNarrowphase = true
    local Type = p1.Type
    local v5 = nil
    local v6 = nil
    local v7 = nil
    if Type == "Box" then
        v2, v3, v1 = Box(p1.Transform, p1.Size, p2, p3)
        v5 = v2
        v6 = v3
        v7 = v1
    end
    if Type == "Capsule" then
        v2, v3, v1 = Capsule(p1.Transform, p1.Size, p2, p3)
        v5 = v2
        v6 = v3
        v7 = v1
    end
    if Type == "Sphere" then
        v2, v3, v1 = Sphere(p1.Transform, p1.Size, p2, p3)
        v5 = v2
        v6 = v3
        v7 = v1
    end
    if Type == "Cylinder" then
        v2, v3, v1 = Cylinder(p1.Transform, p1.Size, p2, p3)
        v5 = v2
        v6 = v3
        v7 = v1
    end
    debug.profileend()
    return v5, v6, v7
end
function u94.Step(p1) -- Line: 182
    debug.profilebegin("Collider::Step")
    p1:UpdateTransform()
    debug.profileend()
end
function u94.DrawDebug(p1, p2, p3, p4, p5, p6) -- Line: 194 -- upvalues: Gizmo (val)
    local v1, v2
    local v3 = Color3.new(0.509803, 0.933333, 0.42745)
    local v4 = Color3.new(0.90196, 0.784313, 0.513725)
    local v5 = Color3.new(1, 0, 1)
    local v6 = Color3.new(0, 1, 1)
    local v7 = Color3.new(1, 0.3, 0.3)
    local Type = p1.Type
    local Transform = p1.Transform
    local Size = p1.Size
    if not p2.m_Awake and p5 then
        v3 = v5
    end
    if p1.InNarrowphase == false and p6 then
        v4 = v6
    end
    if p4 then
        Gizmo.SetStyle(v7, 0, false)
        Gizmo.Sphere:Draw(Transform, p1.Radius, 25, 360)
    end
    if Type == "Box" then
        Gizmo.SetStyle(v3, 0, false)
        Gizmo.Box:Draw(Transform, Size)
        if p3 then
            Gizmo.SetStyle(v4, 0.75, false)
            Gizmo.VolumeBox:Draw(Transform, Size)
            Gizmo.PushProperty("Transparency", 0)
        end
        return
    end
    if Type == "Capsule" then
        v1 = math.min(Size.Y, Size.Z) * 0.5
        local X = Size.X
        local v8 = Transform * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
        Gizmo.SetStyle(v3, 0, false)
        Gizmo.Capsule:Draw(v8, v1, X, 15)
        if p3 then
            v2 = v8.Position + v8.UpVector * (X * 0.5)
            local v9 = v8.Position - v8.UpVector * (X * 0.5)
            Gizmo.SetStyle(v4, 0.75, false)
            Gizmo.VolumeCylinder:Draw(Transform, v1, X)
            local v10 = CFrame.new(v2)
            Gizmo.VolumeSphere:Draw(v10, v1)
            v10 = CFrame.new(v9)
            Gizmo.VolumeSphere:Draw(v10, v1)
            Gizmo.PushProperty("Transparency", 0)
        end
        return
    end
    if Type == "Sphere" then
        v1 = math.min(Size.X, Size.Y, Size.Z) * 0.5
        Gizmo.SetStyle(v3, 0, false)
        Gizmo.Sphere:Draw(Transform, v1, 15, 360)
        if p3 then
            Gizmo.SetStyle(v4, 0.75, false)
            Gizmo.VolumeSphere:Draw(Transform, v1)
            Gizmo.PushProperty("Transparency", 0)
        end
        return
    end
    if Type ~= "Cylinder" then
        return
    end
    v1 = math.min(Size.Y, Size.Z) * 0.5
    Gizmo.SetStyle(v3, 0, false)
    v2 = Transform * CFrame.Angles(0, 0, 1.5707963267948966)
    Gizmo.Cylinder:Draw(v2, v1, Size.X, 15)
    if p3 then
        Gizmo.SetStyle(v4, 0.75, false)
        v2 = Transform * CFrame.Angles(0, -1.5707963267948966, 0)
        Gizmo.VolumeCylinder:Draw(v2, v1, Size.X, 0, 360)
        Gizmo.PushProperty("Transparency", 0)
    end
end
function u94.Destroy(p1) -- Line: 286 -- upvalues: SB_VERBOSE_LOG (val)
    SB_VERBOSE_LOG((("Collider destroying, object: %*"):format(p1.m_Object)))
    setmetatable(p1, nil)
end
return u94