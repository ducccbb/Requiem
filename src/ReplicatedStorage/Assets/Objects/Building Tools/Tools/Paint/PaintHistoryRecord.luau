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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Paint.PaintHistoryRecord
--                              Dumped in 0.000362 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
Tool = script.Parent.Parent.Parent
Core = require(Tool.Core)
local Libraries = Tool:WaitForChild("Libraries")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local u30 = {}
u30.__index = u30
function u30.new() -- Line: 18 -- upvalues: u30 (val), SupportLibrary (val)
    local v1 = setmetatable({}, u30)
    v1.Selection = SupportLibrary.CloneTable(Core.Selection.Items)
    v1.Parts = SupportLibrary.CloneTable(Core.Selection.Parts)
    v1.InitialColor = SupportLibrary.GetMemberMap(v1.Parts, "Color")
    v1.TargetColor = nil
    v1.InitialUnionColoring = {}
    for k, v in pairs(v1.Parts) do
        if v:IsA("UnionOperation") then
            v1.InitialUnionColoring[v] = v.UsePartColor
        end
    end
    return v1
end
function u30.Unapply(p1) -- Line: 41
    local v1 = {}
    for i, v in ipairs(p1.Parts) do
        table.insert(v1, {Part = v, Color = p1.InitialColor[v], UnionColoring = p1.InitialUnionColoring[v]})
    end
    Core.SyncAPI:Invoke("SyncColor", v1)
    Core.Selection.Replace(p1.Selection)
end
function u30.Apply(p1, p2) -- Line: 60
    local v1 = {}
    for i, v in ipairs(p1.Parts) do
        table.insert(v1, {UnionColoring = true, Part = v, Color = p1.TargetColor})
    end
    Core.SyncAPI:Invoke("SyncColor", v1)
    if not p2 then
        Core.Selection.Replace(p1.Selection)
    end
end
return u30