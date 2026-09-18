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
--      File: ReplicatedStorage.Packages._Index.sleitnick_octo-tree@0.3.1.octo-tree
--                               Dumped in 0.00201 seconds
--                          Bytecode version 9  |  26 functions

local CountNodesInRegion
local function IsPointInBox(p1, p2, p3) -- Line: 45
    local v1 = p3 / 2
    local v2 = if p2.X - v1 <= p1.X then if p1.X <= p2.X + v1 then if p2.Y - v1 <= p1.Y then if p1.Y <= p2.Y + v1 then if p2.Z - v1 <= p1.Z then p1.Z <= p2.Z + v1 else false else false else false else false else false
    return v2
end
local function RoundTo(p1, p2) -- Line: 55
    return math.round(p1 / p2) * p2
end
local function SwapRemove(p1, p2) -- Line: 59
    local v1 = #p1
    p1[p2] = p1[v1]
    p1[v1] = nil
end
function CountNodesInRegion(p1) -- Line: 65 -- upvalues: CountNodesInRegion (val)
    local v1 = 0
    if p1.Nodes then
        return #p1.Nodes
    end
    for i, v in ipairs(p1.Regions) do
        v1 = v1 + CountNodesInRegion(v)
    end
    return v1
end
local function GetTopRegion(p1, p2, p3) -- Line: 77
    local Size = p1.Size
    local v1 = math.round(p2.X / Size) * Size
    local v2 = math.round(p2.Y / Size) * Size
    local v3 = Vector3.new(v1, v2, math.round(p2.Z / Size) * Size)
    v1 = p1.Regions[v3]
    if not v1 and p3 then
        v1 = {
            Level = 1,
            Regions = {},
            Size = Size,
            Radius = math.sqrt(Size * Size + Size * Size + Size * Size),
            Center = v3,
        }
        table.freeze(v1)
        p1.Regions[v3] = v1
    end
    return v1
end
local function GetRegionsInRadius(p1, p2, p3) -- Line: 95 -- upvalues: GetTopRegion (val)
    local ScanRegions, u166, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local u176 = {}
    function ScanRegions(p1) -- Line: 97 -- upvalues: p2 (val), p3 (val), u176 (val), ScanRegions (val)
        for i, v in ipairs(p1) do
            if (p2 - v.Center).Magnitude < p3 + v.Radius then
                if not v.Nodes then
                    ScanRegions(v.Regions)
                else
                    table.insert(u176, v)
                end
            end
        end
    end
    local v10 = {}
    local Size = p1.Size
    local v11 = math.ceil(p3 / Size)
    if p3 < p1.Size then
        local u57
        v8 = 26
        v9 = 1
        u57, v1, u166 = p3, p1, p2
        for i5 = 0, v8, v9 do
            v3 = math.floor(i5 / 9) - 1
            v4 = Vector3.new((i5 % 3 - 1) * u57, v3 * u57, (math.floor(i5 / 3) % 3 - 1) * u57)
            v5 = GetTopRegion(v1, u166 + v4, false)
            if v5 and not (v10[v5]) then
                v10[v5] = true
                ScanRegions(v5.Regions)
            end
        end
        return u176
    end
    if v11 > 3 then
        local Regions = p1.Regions
        v9 = nil
        local v12 = nil
        for i, j in Regions, v9, v12 do
            if (p2 - j.Center).Magnitude < p3 + j.Radius then
                ScanRegions(j.Regions)
            end
        end
        return u176
    end
    v8 = v11
    v9 = 1
    v1, u166 = p1, p2
    for k = -v11, v8, v9 do
        v2 = v11
        v3 = 1
        for n = -v11, v2, v3 do
            v4 = v11
            v5 = 1
            for m = -v11, v4, v5 do
                v6 = Vector3.new(k * Size, n * Size, m * Size)
                v7 = GetTopRegion(v1, u166 + v6, false)
                if v7 and not (v10[v7]) then
                    v10[v7] = true
                    ScanRegions(v7.Regions)
                end
            end
        end
    end
    return u176
end
local u6 = {}
u6.__index = u6
function u6.ClearAllNodes(p1) -- Line: 167
    table.clear(p1.Regions)
end
function u6:GetAllNodes() -- Line: 171
    local GetNodes
    local u1 = {}
    function GetNodes(p1) -- Line: 173 -- upvalues: u1 (val), GetNodes (val)
        local Nodes
        local v1 = p1
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            Nodes = j.Nodes
            if not Nodes then
                GetNodes(j.Regions)
            else
                table.move(Nodes, 1, #Nodes, #u1 + 1, u1)
            end
        end
    end
    GetNodes(self.Regions)
    return u1
end
function u6.ForEachNode(p1) -- Line: 187
    local GetNodes
    function GetNodes(a1) -- Line: 188 -- upvalues: p1 (val), GetNodes (val)
        local Nodes, v1, v2, v3
        local Regions = a1
        if not Regions then
            Regions = p1.Regions
        end
        local v4 = nil
        local v5 = nil
        for i, j in Regions, v4, v5 do
            Nodes = j.Nodes
            if not Nodes then
                GetNodes(j.Regions)
            else
                v1 = Nodes
                v2 = nil
                v3 = nil
                for k, n in v1, v2, v3 do
                    coroutine.yield(n)
                end
            end
        end
    end
    return coroutine.wrap(GetNodes)
end
function u6.FindFirstNode(p1, p2) -- Line: 203
    for i in p1:ForEachNode() do
        if i.Object == p2 then
            return i
        end
    end
    return nil
end
function u6.CountNodes(p1) -- Line: 212
    return #p1:GetAllNodes()
end
function u6.CreateNode(p1, p2, p3) -- Line: 216
    local v1 = p1:_getRegion(4, p2)
    local v2 = {Region = v1, Position = p2, Object = p3}
    if v1.Nodes then
        table.insert(v1.Nodes, v2)
        return v2
    end
    error("region does not contain nodes array")
    return v2
end
function u6.RemoveNode(p1, p2) -- Line: 231 -- upvalues: CountNodesInRegion (val)
    local Region, v1
    if not p2.Region then
        return
    end
    local Nodes = p2.Region.Nodes
    local v2 = table.find(Nodes, p2)
    if v2 then
        local v3 = #Nodes
        Nodes[v2] = Nodes[v3]
        Nodes[v3] = nil
    end
    if #Nodes ~= 0 then
        v1 = p2
    else
        local Parent, Regions, v4, v5
        Region = p2.Region
        v1 = p2
        while Region do
            Parent = Region.Parent
            if Parent and CountNodesInRegion(Region) == 0 then
                v4 = table.find(Parent.Regions, Region)
                if v4 then
                    Regions = Parent.Regions
                    v5 = #Regions
                    Regions[v4] = Regions[v5]
                    Regions[v5] = nil
                end
            end
            Region = Parent
        end
    end
    v1.Region = nil
end
function u6.ChangeNodePosition(p1, p2, p3) -- Line: 260
    p2.Position = p3
    local v1 = p1:_getRegion(4, p3)
    if v1 == p2.Region then
        return
    end
    table.insert(v1.Nodes, p2)
    p1:RemoveNode(p2)
    p2.Region = v1
end
function u6.SearchRadius(p1, p2, p3) -- Line: 271 -- upvalues: GetRegionsInRadius (val)
    local v1, v2
    local v3 = {}
    local v4 = GetRegionsInRadius(p1, p2, p3)
    v1, v2 = p2, p3
    for i, v in ipairs(v4) do
        if v.Nodes ~= nil then
            for i2, i3 in ipairs(v.Nodes) do
                if (i3.Position - v1).Magnitude < v2 then
                    table.insert(v3, i3)
                end
            end
        end
    end
    return v3
end
function u6.ForEachInRadius(p1, p2, p3) -- Line: 286 -- upvalues: GetRegionsInRadius (val)
    local u7 = GetRegionsInRadius(p1, p2, p3)
    return coroutine.wrap(function() -- Line: 288 -- upvalues: u7 (val), p2 (val), p3 (val)
        for i, v in ipairs(u7) do
            if v.Nodes ~= nil then
                for i2, i3 in ipairs(v.Nodes) do
                    if (i3.Position - p2).Magnitude < p3 then
                        coroutine.yield(i3)
                    end
                end
            end
        end
    end)
end
function u6.GetNearest(p1, p2, p3, p4) -- Line: 301
    local v1 = p1:SearchRadius(p2, p3)
    table.sort(v1, function(p1, a2) -- Line: 303 -- upvalues: p2 (val)
        local v1 = (p1.Position - p2).Magnitude < (a2.Position - p2).Magnitude
        return v1
    end)
    if p4 == nil then
        return v1
    end
    if p4 < #v1 then
        return table.move(v1, 1, p4, 1, table.create(p4))
    end
    return v1
end
function u6._getRegion(p1, p2, p3) -- Line: 314 -- upvalues: IsPointInBox (val), GetTopRegion (val)
    local GetRegion, v1
    function GetRegion(a1, a2, a3) -- Line: 315 -- upvalues: IsPointInBox (upval), p3 (val), p1 (val), p2 (val), GetRegion (val)
        local Center
        local v1 = nil
        local v2 = a2
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if IsPointInBox(p3, j.Center, j.Size) then
                v1 = j
                break
            end
        end
        if not v1 then
            local v5, v6
            v2 = p1.Size / 2 ^ (a3 - 1)
            if not a1 then
                v4 = math.round(p3.X / v2) * v2
                v5 = math.round(p3.Y / v2) * v2
                Center = Vector3.new(v4, v5, math.round(p3.Z / v2) * v2)
            else
                Center = a1.Center
            end
            v4 = Center
            if a1 then
                local v7, v8
                if Center.X >= p3.X then
                    v6 = -v2 / 2
                else
                    v6 = v2 / 2
                end
                if Center.Y >= p3.Y then
                    v8 = -v2 / 2
                else
                    v8 = v2 / 2
                end
                if Center.Z >= p3.Z then
                    v7 = -v2 / 2
                else
                    v7 = v2 / 2
                end
                v4 = v4 + Vector3.new(v6, v8, v7)
            end
            v5 = {}
            v6 = {}
            v5.Regions = v6
            v5.Level = a3
            v5.Size = v2
            v5.Radius = math.sqrt(v2 * v2 + v2 * v2 + v2 * v2)
            v5.Center = v4
            v5.Parent = a1
            if a3 ~= 4 then
                v6 = nil
            else
                v6 = {}
            end
            v5.Nodes = v6
            table.freeze(v5)
            table.insert(a2, v5)
            v1 = v5
        end
        if a3 == p2 then
            return v1
        end
        return GetRegion(v1, v1.Regions, a3 + 1)
    end
    v1 = GetTopRegion(p1, p3, true)
    return GetRegion(v1, v1.Regions, 2)
end
u6.__iter = u6.ForEachNode
return {
    new = function(p1) -- Line: 160 -- upvalues: u6 (val)
        local v1 = setmetatable({}, u6)
        v1.Size = p1 or 512
        v1.Regions = {}
        return v1
    end,
}