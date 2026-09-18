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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Maid
--                              Dumped in 0.000436 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {ClassName = "Maid"}
function u12.new() -- Line: 19 -- upvalues: u12 (val)
    local v1 = {_tasks = {}}
    return (setmetatable(v1, u12))
end
function u12.__index(p1, p2) -- Line: 29 -- upvalues: u12 (val)
    if u12[p2] then
        return u12[p2]
    end
    return p1._tasks[p2]
end
function u12.__newindex(p1, p2, p3) -- Line: 44 -- upvalues: u12 (val)
    local v1
    if u12[p2] ~= nil then
        v1 = ("'%s' is reserved"):format((tostring(p2)))
        error(v1, 2)
    end
    local _tasks = p1._tasks
    v1 = _tasks[p2]
    _tasks[p2] = p3
    if not v1 then
        return
    end
    if type(v1) == "function" then
        v1()
        return
    end
    if typeof(v1) == "RBXScriptConnection" then
        v1:Disconnect()
        return
    end
    if v1.Destroy then
        v1:Destroy()
    end
end
function u12.GiveTask(p1, p2) -- Line: 67
    assert(p2)
    local v1 = #p1._tasks + 1
    p1[v1] = p2
    return v1
end
function u12.DoCleaning(p1) -- Line: 76
    local v1, v2, v3, v4
    local _tasks = p1._tasks
    for k, v in pairs(_tasks) do
        if typeof(v) == "RBXScriptConnection" then
            _tasks[k] = nil
            v:Disconnect()
        end
    end
    v1, v2 = next(_tasks)
    while v2 ~= nil do
        _tasks[v1] = nil
        if type(v2) == "function" then
            v2()
        elseif typeof(v2) == "RBXScriptConnection" then
            v2:Disconnect()
        elseif v2.Destroy then
            v2:Destroy()
        end
        v3, v4 = next(_tasks)
        v1 = v3
        v2 = v4
    end
end
u12.Destroy = u12.DoCleaning
return u12