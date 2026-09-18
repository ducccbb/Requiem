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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.InstancePool
--                              Dumped in 0.000376 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
u12.__index = u12
function u12.new(p1, p2, p3) -- Line: 12 -- upvalues: u12 (val)
    local v1 = {
        Timeout = p1,
        Generate = p2,
        Cleanup = p3,
        All = {},
        Free = {},
        InUse = {},
        LastUse = {},
    }
    return (setmetatable(v1, u12))
end
function u12:Release(p2) -- Line: 30
    local u3 = tick()
    self.LastUse[p2] = u3
    coroutine.resume(coroutine.create(function() -- Line: 37 -- upvalues: self (val), p2 (val), u3 (val)
        wait(self.Timeout)
        local v1 = self.LastUse[p2]
        if v1 == u3 then
            self:Remove(p2)
        end
    end))
    self.Cleanup(p2)
    self.InUse[p2] = nil
    self.Free[p2] = true
end
function u12.Get(p1) -- Line: 53
    local v1 = next(p1.Free)
    if not v1 then
        v1 = p1.Generate()
    end
    p1.Free[v1] = nil
    p1.LastUse[v1] = nil
    p1.All[v1] = true
    p1.InUse[v1] = true
    return v1
end
function u12:Remove(p2) -- Line: 69
    self.Free[p2] = nil
    self.InUse[p2] = nil
    self.LastUse[p2] = nil
    self.All[p2] = nil
    p2:Destroy()
end
function u12.ReleaseAll(p1) -- Line: 77
    for k in pairs(p1.InUse) do
        p1:Release(k)
    end
end
function u12.Generate() -- Line: 83
    error("No instance generation callback specified", 2)
end
function u12.Cleanup(p1) -- Line: 88
    p1.Parent = nil
end
return u12