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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Collision.ColliderObject
--                              Dumped in 0.000721 seconds
--                          Bytecode version 9  |  10 functions

local Collider = require(script.Parent:WaitForChild("Collider"))
local Dependencies = script.Parent.Parent.Parent:WaitForChild("Dependencies")
local SB_VERBOSE_LOG = require(Dependencies:WaitForChild("Utilities")).SB_VERBOSE_LOG
local u23 = {}
u23.__index = u23
function u23.new(p1, p2) -- Line: 57 -- upvalues: u23 (val)
    local u6 = setmetatable({
        m_Awake = true,
        m_LastSleepCycle = 0,
        Destroyed = false,
        m_Object = p2,
        Colliders = {},
    }, u23)
    u6:m_LoadColliderTable(p1)
    local PropertyChangedSignal = p2:GetPropertyChangedSignal("Parent")
    u6.DestroyConnection = PropertyChangedSignal:Connect(function() -- Line: 68 -- upvalues: p2 (val), u6 (val)
        if p2.Parent == nil then
            u6.Destroyed = true
        end
    end)
    return u6
end
function u23:m_LoadCollider(p2) -- Line: 80 -- upvalues: Collider (val)
    local v1 = Vector3.new(p2.ScaleX, p2.ScaleY, p2.ScaleZ)
    local v2 = Vector3.new(p2.OffsetX, p2.OffsetY, p2.OffsetZ)
    local v3 = Vector3.new(p2.RotationX, p2.RotationY, p2.RotationZ)
    local v4 = Collider.new()
    v4.Scale = v1
    v4.Offset = v2
    v4.Rotation = v3
    v4.Type = p2.Type
    v4:SetObject(self.m_Object)
    table.insert(self.Colliders, v4)
end
function u23:m_LoadColliderTable(p2) -- Line: 98
    local v1 = p2
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        self:m_LoadCollider(j)
    end
end
function u23.GetObject(p1) -- Line: 108
    return p1.m_Object
end
function u23.GetCollisions(p1, p2, p3) -- Line: 116
    local ClosestPoint, ClosestPoint_2, ClosestPoint_3, Colliders
    debug.profilebegin("ColliderObject::GetCollisions")
    if not p1.m_Object or #p1.Colliders == 0 then
        debug.profileend()
        return {}
    end
    debug.profilebegin("Sleep Cycle")
    local v1 = os.clock() - p1.m_LastSleepCycle
    if 0.2 <= v1 then
        p1.m_LastSleepCycle = os.clock()
        if not (p1.m_Object:IsDescendantOf(workspace)) then
            p1.m_Awake = false
        else
            p1.m_Awake = true
        end
    end
    debug.profileend()
    if not p1.m_Awake then
        debug.profileend()
        return {}
    end
    v1 = {}
    debug.profilebegin("Determine Collisions")
    Colliders = p1.Colliders
    local v2 = nil
    local v3 = nil
    for i, j in Colliders, v2, v3 do
        debug.profilebegin("Determine collision")
        ClosestPoint, ClosestPoint_2, ClosestPoint_3 = j:GetClosestPoint(p2, p3)
        debug.profileend()
        if ClosestPoint then
            table.insert(v1, {ClosestPoint = ClosestPoint_2, Normal = ClosestPoint_3})
        end
    end
    debug.profileend()
    debug.profileend()
    return v1
end
function u23:Step() -- Line: 164
    debug.profilebegin("ColliderObject::Step")
    local Colliders = self.Colliders
    local v1 = nil
    local v2 = nil
    for i, j in Colliders, v1, v2 do
        j:Step()
    end
    debug.profileend()
end
function u23:DrawDebug(p2, p3, p4, p5) -- Line: 177
    local Colliders = self.Colliders
    local v1 = nil
    local v2 = nil
    for i, j in Colliders, v1, v2 do
        j:DrawDebug(self, p2, p3, p4, p5)
        j.InNarrowphase = false
    end
end
function u23:Destroy() -- Line: 185 -- upvalues: SB_VERBOSE_LOG (val)
    local Colliders
    task.synchronize()
    SB_VERBOSE_LOG((("Collider object destroying, object: %*"):format(self.m_Object)))
    self.DestroyConnection:Disconnect()
    if #self.Colliders ~= 0 then
        Colliders = self.Colliders
        local v1 = nil
        local v2 = nil
        for i, j in Colliders, v1, v2 do
            j:Destroy()
        end
    end
    setmetatable(self, nil)
    task.desynchronize()
end
return u23