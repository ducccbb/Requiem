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
--                 File: ReplicatedStorage.Common.Utilities.Packet.Task
--                              Dumped in 0.000269 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Thread = nil
local v2 = {}
local u15 = {}
v2.Type = "Task"
function v2.Spawn(p1, p2, ...) -- Line: 26 -- upvalues: u15 (val), Thread (ref)
    local v1 = table.remove(u15)
    if not v1 then
        v1 = task.spawn(Thread)
    end
    return task.spawn(v1, p2, ...)
end
function v2.Defer(p1, p2, ...) -- Line: 30 -- upvalues: u15 (val), Thread (ref)
    local v1 = table.remove(u15)
    if not v1 then
        v1 = task.spawn(Thread)
    end
    return task.defer(v1, p2, ...)
end
function v2.Delay(p1, p2, p3, ...) -- Line: 34 -- upvalues: u15 (val), Thread (ref)
    local v1 = table.remove(u15)
    if not v1 then
        v1 = task.spawn(Thread)
    end
    return task.delay(p2, v1, p3, ...)
end
local function Call(p1, ...) -- Line: 39 -- upvalues: u15 (val)
    p1(...)
    table.insert(u15, coroutine.running())
end
function Thread() -- Line: 44 -- upvalues: Call (ref)
    while true do
        Call(coroutine.yield())
    end
end
return v2