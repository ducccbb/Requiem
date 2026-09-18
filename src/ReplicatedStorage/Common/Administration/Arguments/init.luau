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
--                File: ReplicatedStorage.Common.Administration.Arguments
--                              Dumped in 0.000503 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local u13 = {}
local u14 = {}
local v2 = {}
local v3 = {
    __index = function(p1, p2) -- Line: 27 -- upvalues: u12 (val), u13 (val), u14 (val), u0 (val)
        if u12[p2] then
            return u12[p2]
        end
        u12[p2] = setmetatable({}, {
            __index = function(p1, a2) -- Line: 35 -- upvalues: u13 (upval), p2 (val), u14 (upval), u0 (upval)
                if u13[p2 .. a2] then
                    return u13[p2 .. a2]
                end
                u13[p2 .. a2] = function(...) -- Line: 42 -- upvalues: u14 (upval), p2 (upval), a2 (val), u0 (upval)
                    local v1
                    if u14[p2 .. a2] then
                        v1 = u14[p2 .. a2](...)
                        v1.path = p2 .. "/" .. a2
                        v1.name = a2
                        return v1
                    end
                    v1 = u0:FindFirstChild(p2)
                    local v2 = v1:FindFirstChild(a2)
                    if not v2 then
                        v2 = v1:FindFirstChild(a2 .. "Argument")
                    end
                    if not v2 then
                        warn("Next trace: " .. a2)
                        return error("Module not found.")
                    end
                    u14[p2 .. a2] = require(v2)
                    v1 = u14[p2 .. a2](...)
                    v1.path = p2 .. "/" .. a2
                    v1.name = a2
                    return v1
                end
                return u13[p2 .. a2]
            end,
        })
        return u12[p2]
    end,
}
function v3.__call() -- Line: 74 -- upvalues: u0 (val)
    local v1
    local v2 = {}
    for k, v in pairs(u0:GetDescendants()) do
        if v:IsA("ModuleScript") then
            if not (v2[v.Parent.Name]) then
                v2[v.Parent.Name] = {}
            end
            v1 = v2[v.Parent.Name]
            v1[v.Name] = require(v)()
        end
    end
    return v2
end
return (setmetatable(v2, v3))