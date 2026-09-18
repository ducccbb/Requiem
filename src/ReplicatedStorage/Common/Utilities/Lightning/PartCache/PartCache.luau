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
--        File: ReplicatedStorage.Common.Utilities.Lightning.PartCache.PartCache
--                              Dumped in 0.000967 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Table = require(script.Parent:WaitForChild("Table"))
local u19 = {}
u19.__index = u19
u19.__type = "PartCache"
local u25 = CFrame.new(0, 1000000000, 0)
local function assertwarn(p1, p2) -- Line: 66
    if p1 == false then
        warn(p2)
    end
end
local function MakeFromTemplate(p1, p2) -- Line: 73 -- upvalues: u25 (val)
    local v1 = p1:Clone()
    v1.CFrame = u25
    v1.Anchored = true
    v1.Parent = p2
    return v1
end
function u19.new(p1, p2, p3) -- Line: 83 -- upvalues: assertwarn (val), u19 (val), Table (val), MakeFromTemplate (val)
    local v1 = p3
    if not v1 then
        v1 = workspace
    end
    local v2 = 0 < p2
    assert(v2, "PrecreatedParts can not be negative!")
    v2 = p2 ~= 0
    assertwarn(v2, "PrecreatedParts is 0! This may have adverse effects when initially using the cache.")
    assertwarn(p1.Archivable, "The template's Archivable property has been set to false, which prevents it from being cloned. It will temporarily be set to true.")
    local Archivable = p1.Archivable
    p1.Archivable = true
    p1.Archivable = Archivable
    local v3 = p1:Clone()
    local v4 = {
        ExpansionSize = 10,
        Open = {},
        InUse = {},
        CurrentCacheParent = v1,
        Template = v3,
    }
    setmetatable(v4, u19)
    local v5 = p2 or 5
    local v6 = 1
    for i = 1, v5, v6 do
        Table.insert(v4.Open, MakeFromTemplate(v3, v4.CurrentCacheParent))
    end
    v4.Template.Parent = nil
    return v4
end
function u19.GetPart(p1) -- Line: 127 -- upvalues: u19 (val), Table (val), MakeFromTemplate (val)
    local v1 = getmetatable(p1)
    local v2 = v1 == u19
    assert(v2, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("GetPart", "PartCache.new"))
    if #p1.Open == 0 then
        warn("No parts available in the cache! Creating [" .. p1.ExpansionSize .. "] new part instance(s) - this amount can be edited by changing the ExpansionSize property of the PartCache instance... (This cache now contains a grand total of " .. tostring(#p1.Open + #p1.InUse + p1.ExpansionSize) .. " parts.)")
        local ExpansionSize = p1.ExpansionSize
        v2 = 1
        for i = 1, ExpansionSize, v2 do
            Table.insert(p1.Open, MakeFromTemplate(p1.Template, p1.CurrentCacheParent))
        end
    end
    local v3 = p1.Open[#p1.Open]
    p1.Open[#p1.Open] = nil
    Table.insert(p1.InUse, v3)
    return v3
end
function u19.ReturnPart(p1, p2) -- Line: 149 -- upvalues: u19 (val), Table (val), u25 (val)
    local v1 = getmetatable(p1)
    local v2 = v1 == u19
    assert(v2, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("ReturnPart", "PartCache.new"))
    local v3 = Table.indexOf(p1.InUse, p2)
    if v3 == nil then
        error("Attempted to return part \"" .. p2.Name .. "\" (" .. p2:GetFullName() .. ") to the cache, but it's not in-use! Did you call this on the wrong part?")
        return
    end
    Table.remove(p1.InUse, v3)
    Table.insert(p1.Open, p2)
    p2.CFrame = u25
    p2.Anchored = true
end
function u19.SetCacheParent(p1, p2) -- Line: 170 -- upvalues: u19 (val)
    local v1 = getmetatable(p1)
    local v2 = v1 == u19
    assert(v2, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("SetCacheParent", "PartCache.new"))
    v2 = p2:IsDescendantOf(workspace)
    if not v2 then
        v2 = p2 == workspace
    end
    assert(v2, "Cache parent is not a descendant of Workspace! Parts should be kept where they will remain in the visible world.")
    p1.CurrentCacheParent = p2
    local v3 = #p1.Open
    v2 = 1
    for i = 1, v3, v2 do
        p1.Open[i].Parent = p2
    end
    v3 = #p1.InUse
    v2 = 1
    for j = 1, v3, v2 do
        p1.InUse[j].Parent = p2
    end
end
function u19.Expand(p1, p2) -- Line: 187 -- upvalues: u19 (val), Table (val), MakeFromTemplate (val)
    local ExpansionSize
    local v1 = getmetatable(p1)
    local v2 = v1 == u19
    assert(v2, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Expand", "PartCache.new"))
    if p2 ~= nil then
        ExpansionSize = p2
    else
        ExpansionSize = p1.ExpansionSize
    end
    local v3 = ExpansionSize
    v2 = 1
    for i = 1, v3, v2 do
        Table.insert(p1.Open, MakeFromTemplate(p1.Template, p1.CurrentCacheParent))
    end
end
function u19.Dispose(p1) -- Line: 199 -- upvalues: u19 (val)
    local v1 = getmetatable(p1)
    local v2 = v1 == u19
    assert(v2, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Dispose", "PartCache.new"))
    local v3 = #p1.Open
    v2 = 1
    for i = 1, v3, v2 do
        p1.Open[i]:Destroy()
    end
    v3 = #p1.InUse
    v2 = 1
    for j = 1, v3, v2 do
        p1.InUse[j]:Destroy()
    end
    p1.Template:Destroy()
    p1.Open = {}
    p1.InUse = {}
    p1.CurrentCacheParent = nil
    p1.GetPart = nil
    p1.ReturnPart = nil
    p1.SetCacheParent = nil
    p1.Expand = nil
    p1.Dispose = nil
end
return u19