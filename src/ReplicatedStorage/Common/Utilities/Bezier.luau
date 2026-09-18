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
--                    File: ReplicatedStorage.Common.Utilities.Bezier
--                               Dumped in 0.00128 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
u12.__index = u12
function u12.new(...) -- Line: 125 -- upvalues: u12 (val)
    local u129 = {...}
    local v1 = 3 <= #u129
    assert(v1, "Must have at least 3 points")
    local v2 = #u129 == 3
    v1 = #u129 == 4
    local v3 = {}
    local new = Vector3.new
    local lerp = new().lerp
    local u165 = nil
    local u110 = {}
    local u116 = 0
    local u114 = nil
    local function CreatePoint(p1) -- Line: 148 -- upvalues: new (val), lerp (val)
        return {
            p1.X,
            p1.Y,
            p1.Z,
            ToVector3 = function(self) -- Line: 151 -- upvalues: new (upval)
                return (new(self[1], self[2], self[3]))
            end,
            lerp = function(self, p2, p3) -- Line: 154 -- upvalues: lerp (upval)
                local v1 = self:ToVector3()
                local v2 = p2:ToVector3()
                return lerp(v1, v2, p3)
            end,
        }
    end
    if not v2 and not v1 then
        local v4, v5, v6, v7, v8, v9
        local v10 = #u129 - 1
        local v11 = 1
        for i = 1, v10, v11 do
            v4 = CreatePoint(u129[i])
            v5 = CreatePoint(u129[i + 1])
            u110[#u110 + 1] = {v4, v5, CreatePoint(v4)}
        end
        v10 = u110
        v11 = 2
        local v12 = -1
        for j = #u110, v11, v12 do
            v5 = {}
            v6 = j - 1
            v7 = 1
            for k = 1, v6, v7 do
                v8 = v10[k]
                v9 = {v8[3], v10[k + 1][3], CreatePoint(v8[3])}
                v5[k] = v9
                u110[#u110 + 1] = v9
            end
            v10 = v5
        end
        u114 = v10[1]
        u116 = #u110
    end
    if v2 then
        local u130 = u129[1]
        local u131 = u129[2]
        local u132 = u129[3]
        function v3.Get(p1, p2, p3) -- Line: 194 -- upvalues: u130 (val), u131 (val), u132 (val)
            local v1
            if not p3 then
                v1 = p2
            else
                local v2
                if p2 < 0 then
                    v2 = 0
                elseif 1 >= p2 then
                    v2 = p2
                else
                    v2 = 1
                end
                v1 = v2
            end
            return (1 - v1) * (1 - v1) * u130 + 2 * (1 - v1) * v1 * u131 + v1 * v1 * u132
        end
    elseif not v1 then
        function v3.Get(p1, p2, p3) -- Line: 214 -- upvalues: u116 (ref), u110 (val), u114 (ref)
            local v1, v2, v3, v4, v5
            if not p3 then
                v1 = p2
            else
                if p2 < 0 then
                    v2 = 0
                elseif 1 >= p2 then
                    v2 = p2
                else
                    v2 = 1
                end
                v1 = v2
            end
            v2 = u116
            local v6 = 1
            for i = 1, v2, v6 do
                v3 = u110[i]
                v4 = v3[1]:lerp(v3[2], v1)
                v5 = v3[3]
                v5[1] = v4.X
                v5[2] = v4.Y
                v5[3] = v4.Z
            end
            return u114[3]:ToVector3()
        end
    else
        local u148 = u129[1]
        local u149 = u129[2]
        local u150 = u129[3]
        local u151 = u129[4]
        function v3.Get(p1, p2, p3) -- Line: 204 -- upvalues: u148 (val), u149 (val), u150 (val), u151 (val)
            local v1
            if not p3 then
                v1 = p2
            else
                local v2
                if p2 < 0 then
                    v2 = 0
                elseif 1 >= p2 then
                    v2 = p2
                else
                    v2 = 1
                end
                v1 = v2
            end
            return (1 - v1) * (1 - v1) * (1 - v1) * u148 + 3 * (1 - v1) * (1 - v1) * v1 * u149 + 3 * (1 - v1) * v1 * v1 * u150 + v1 * v1 * v1 * u151
        end
    end
    function v3:GetLength(p2) -- Line: 230 -- upvalues: u165 (ref)
        if not u165 then
            local Path = self:GetPath(p2 or 0.1)
            local v1 = 0
            local v2 = #Path
            local v3 = 1
            for i = 2, v2, v3 do
                v1 = v1 + (Path[i - 1] - Path[i]).Magnitude
            end
            u165 = v1
        end
        return u165
    end
    function v3:GetPath(p2) -- Line: 245
        local v1 = type(p2) == "number"
        assert(v1, "Must provide a step increment")
        v1 = if 0 < p2 then p2 < 1 else false
        assert(v1, "Step out of domain; should be between 0 and 1 (exclusive)")
        local v2 = {}
        v1 = 0
        local v3 = 1
        local v4 = p2
        for i = 0, v3, v4 do
            v1 = i
            v2[#v2 + 1] = self:Get(i)
        end
        if v1 < 1 then
            local v5
            v3 = 1 - v1 < p2 * 0.5
            if not v3 then
                v5 = 1
            else
                v5 = 0
            end
            v2[#v2 + v5] = self:Get(1)
        end
        return v2
    end
    function v3:GetPathByNumberSegments(p2) -- Line: 263
        local v1 = type(p2) == "number"
        assert(v1, "Must provide number of segments")
        v1 = 0 < p2
        assert(v1, "Number of segments must be greater than 0")
        return self:GetPath(1 / p2)
    end
    function v3.GetPathBySegmentLength(p1, p2) -- Line: 269
        local v1 = type(p2) == "number"
        assert(v1, "Must provide a segment length")
        v1 = 0 < p2
        assert(v1, "Segment length must be greater than 0")
        return p1:GetPathByNumberSegments((math.floor(p1:GetLength() / p2 + 0.5)))
    end
    function v3.GetPoints(p1) -- Line: 278 -- upvalues: u129 (val)
        return u129
    end
    return (setmetatable(v3, u12))
end
return u12