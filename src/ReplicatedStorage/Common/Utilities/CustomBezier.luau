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
--                 File: ReplicatedStorage.Common.Utilities.CustomBezier
--                               Dumped in 0.00123 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
u12.__index = u12
function u12.new(p1, p2) -- Line: 35 -- upvalues: u12 (val)
    local v1, v2, v3
    local v4 = type(p1) == "table"
    assert(v4, "Points must be a table")
    v4 = 2 <= #p1
    assert(v4, "Must have at least 2 points")
    v1, v2 = p1, p2
    for i, v in ipairs(p1) do
        v3 = type(v) == "table"
        assert(v3, "Point " .. i .. " must be a table")
        v3 = typeof(v.point) == "Vector3"
        assert(v3, "Point " .. i .. " must have a Vector3 point")
        v3 = type(v.strength) == "number"
        assert(v3, "Point " .. i .. " must have a strength number")
        v3 = if 0 <= v.strength then v.strength <= 1 else false
        assert(v3, "Point " .. i .. " strength must be between 0 and 1")
    end
    local v5 = {points = v1, isClosed = v2 or false}
    function v5:CalculateLength(p2) -- Line: 57
        local v1
        local v2 = p2 or 0.01
        local v3 = 0
        local v4 = self:Get(0)
        local v5 = 1
        local v6 = v2
        for i = v2, v5, v6 do
            v1 = self:Get(i)
            v3 = v3 + (v1 - v4).Magnitude
            v4 = v1
        end
        return v3
    end
    function v5:Get(p2) -- Line: 72
        local point, point_2, point_3, point_4, v1, v2
        if not self.isClosed then
            v1 = math.max(0, (math.min(1, p2)))
        else
            v1 = p2 % 1
        end
        local v3 = #self.points
        if v3 == 2 then
            return self.points[1].point:Lerp(self.points[2].point, v1)
        end
        if not self.isClosed then
            v2 = v3 - 1
        else
            v2 = v3
        end
        local v4 = math.floor(v1 * v2)
        local v5 = v1 * v2 - v4
        if v2 <= v4 then
            v4 = v2 - 1
            v5 = 1
        end
        if not self.isClosed then
            point = self.points[math.max(1, v4)].point
            point_2 = self.points[v4 + 1].point
            point_3 = self.points[math.min(v3, v4 + 2)].point
            point_4 = self.points[math.min(v3, v4 + 3)].point
        else
            point = self.points[(v4 - 1) % v3 + 1].point
            point_2 = self.points[v4 % v3 + 1].point
            point_3 = self.points[(v4 + 1) % v3 + 1].point
            point_4 = self.points[(v4 + 2) % v3 + 1].point
        end
        local v6 = v5 * v5
        return (2 * point_2 + (-point + point_3) * v5 + (2 * point - 5 * point_2 + 4 * point_3 - point_4) * v6 + (-point + 3 * point_2 - 3 * point_3 + point_4) * (v6 * v5)) * 0.5
    end
    function v5:GetPath(p2) -- Line: 144
        local v1 = type(p2) == "number"
        assert(v1, "Step must be a number")
        v1 = if 0 < p2 then p2 <= 1 else false
        assert(v1, "Step must be between 0 and 1 (exclusive)")
        local v2 = {}
        v1 = 0
        while v1 <= 1 do
            v2[#v2 + 1] = self:Get(v1)
            v1 = v1 + p2
        end
        if not self.isClosed then
            v2[#v2 + 1] = self:Get(1)
        end
        return v2
    end
    function v5:GetPathByNumberSegments(p2) -- Line: 165
        local v1 = type(p2) == "number"
        assert(v1, "Number of segments must be a number")
        v1 = 0 < p2
        assert(v1, "Number of segments must be greater than 0")
        return self:GetPath(1 / p2)
    end
    function v5.GetPathBySegmentLength(p1, p2) -- Line: 173
        local v1 = type(p2) == "number"
        assert(v1, "Segment length must be a number")
        v1 = 0 < p2
        assert(v1, "Segment length must be greater than 0")
        if not p1.length then
            p1.length = p1:CalculateLength()
        end
        return p1:GetPathByNumberSegments((math.max(1, (math.floor(p1.length / p2)))))
    end
    function v5.GetLength(p1, p2) -- Line: 186
        if not p1.length then
            p1.length = p1:CalculateLength(p2)
        end
        return p1.length
    end
    function v5.GetPoints(p1) -- Line: 194
        return p1.points
    end
    function v5.AddPoint(p1, p2, p3) -- Line: 199
        local v1 = typeof(p2) == "Vector3"
        assert(v1, "Point must be a Vector3")
        v1 = type(p3) == "number"
        assert(v1, "Strength must be a number")
        v1 = if 0 <= p3 then p3 <= 1 else false
        assert(v1, "Strength must be between 0 and 1")
        table.insert(p1.points, {point = p2, strength = p3})
        p1.length = nil
    end
    function v5.RemovePoint(p1, p2) -- Line: 209
        local v1 = type(p2) == "number"
        assert(v1, "Index must be a number")
        v1 = if 1 <= p2 then p2 <= #p1.points else false
        assert(v1, "Index out of range")
        local v2 = #p1.points
        v1 = 2 < v2
        assert(v1, "Cannot remove point, need at least 2 points")
        table.remove(p1.points, p2)
        p1.length = nil
    end
    function v5.UpdatePoint(p1, p2, p3, p4) -- Line: 219
        local v1 = type(p2) == "number"
        assert(v1, "Index must be a number")
        v1 = if 1 <= p2 then p2 <= #p1.points else false
        assert(v1, "Index out of range")
        if p3 then
            v1 = typeof(p3) == "Vector3"
            assert(v1, "New point must be a Vector3")
            p1.points[p2].point = p3
        end
        if p4 then
            v1 = type(p4) == "number"
            assert(v1, "New strength must be a number")
            v1 = if 0 <= p4 then p4 <= 1 else false
            assert(v1, "New strength must be between 0 and 1")
            p1.points[p2].strength = p4
        end
        p1.length = nil
    end
    function v5.SetClosed(p1, p2) -- Line: 238
        local v1 = type(p2) == "boolean"
        assert(v1, "Closed must be a boolean")
        p1.isClosed = p2
        p1.length = nil
    end
    return (setmetatable(v5, u12))
end
return u12