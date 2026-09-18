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
--                          File: ReplicatedStorage.Common.Pool
--                              Dumped in 0.000478 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u16 = CFrame.new(0, 100000, 0)
local Folder = Instance.new("Folder")
Folder.Parent = workspace
Folder.Name = "Pool"
local function relocateObjectToFarAway(p1) -- Line: 33 -- upvalues: u16 (val)
    if p1:IsA("BasePart") then
        p1.CFrame = u16
        return
    end
    if p1:IsA("Model") then
        p1:PivotTo(u16)
    end
end
local function resetObject(p1) -- Line: 46 -- upvalues: relocateObjectToFarAway (val), Folder (val)
    relocateObjectToFarAway(p1)
    p1.Parent = Folder
end
local function extendPool(p1, p2) -- Line: 57 -- upvalues: resetObject (val)
    local v1
    local v2 = p2
    local v3 = 1
    for i = 1, v2, v3 do
        v1 = p1.reference:Clone()
        resetObject(v1)
        p1.cache[p1._count + 1 + i - 1] = v1
    end
    p1._count = p1._count + p2
    return p1
end
return {
    create = function(p1, p2) -- Line: 123 -- upvalues: resetObject (val)
        local v1 = {}
        local v2 = p2
        local v3 = 1
        for i = 1, v2, v3 do
            v1[i] = p1:Clone()
            resetObject(v1[i])
        end
        return {reference = p1, cache = v1, _count = p2}
    end,
    get = function(p1) -- Line: 92 -- upvalues: extendPool (val)
        if p1._count == 0 then
            extendPool(p1, 5)
        end
        local v1 = p1.cache[p1._count]
        if not v1 then
            extendPool(p1, 5)
            v1 = p1.cache[p1._count]
        end
        if not v1 then
            return nil
        end
        p1.cache[p1._count] = nil
        p1._count = p1._count - 1
        return v1
    end,
    returnObject = function(p1, p2) -- Line: 74 -- upvalues: resetObject (val)
        if not p2 or not p2.Parent then
            return
        end
        resetObject(p2)
        p1._count = p1._count + 1
        p1.cache[p1._count] = p2
    end,
}