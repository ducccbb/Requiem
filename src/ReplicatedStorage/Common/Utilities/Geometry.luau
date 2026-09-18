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
--                   File: ReplicatedStorage.Common.Utilities.Geometry
--                              Dumped in 0.000360 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local GeometryService = game:GetService("GeometryService")
local v2 = {}
function v2.joinTerrainPartsTogether(p1) -- Line: 10 -- upvalues: GeometryService (val)
    local v1, v2
    local u1 = p1[1]
    table.remove(p1, 1)
    local u6 = {SplitApart = true, CollisionFidelity = Enum.CollisionFidelity.Default, RenderFidelity = Enum.RenderFidelity.Automatic}
    v1, v2 = pcall(function() -- Line: 23 -- upvalues: GeometryService (upval), u1 (val), p1 (val), u6 (val)
        return GeometryService:UnionAsync(u1, p1, u6)
    end)
    if v1 and v2 then
        for k, v in pairs(v2) do
            v.Parent = u1.Parent
            v.CFrame = u1.CFrame
            v.Anchored = u1.Anchored
        end
        u1.Parent = nil
        u1:Destroy()
        for k2, i in pairs(p1) do
            i.Parent = nil
            i:Destroy()
        end
    end
    return v2
end
function v2.negateBlockFromTerrainUnion(p1, p2) -- Line: 48 -- upvalues: GeometryService (val)
    local v1, v2
    local u2 = {p2}
    local u4 = {SplitApart = true, CollisionFidelity = Enum.CollisionFidelity.Default, RenderFidelity = Enum.RenderFidelity.Automatic}
    v1, v2 = pcall(function() -- Line: 59 -- upvalues: GeometryService (upval), p1 (val), u2 (val), u4 (val)
        return GeometryService:SubtractAsync(p1, u2, u4)
    end)
    if v1 and v2 then
        for k, v in pairs(v2) do
            v.Parent = p1.Parent
            v.CFrame = p1.CFrame
            v.Anchored = p1.Anchored
        end
        p1.Parent = nil
        p1:Destroy()
        for k2, i in pairs(u2) do
            i.Parent = nil
            i:Destroy()
        end
    end
end
return v2