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
--                File: ReplicatedStorage.Common.Utilities.Packet.Signal
--                              Dumped in 0.000361 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Task = require(script.Parent.Task)
local u16 = {}
local u17 = {}
u16.__index = u16
u16.Type = "Signal"
function u16.Connect(p1, p2) -- Line: 50 -- upvalues: u17 (val)
    local v1 = setmetatable({}, u17)
    v1.Previous = p1.Previous
    v1.Next = p1
    v1.Once = false
    v1.Function = p2
    p1.Previous.Next = v1
    p1.Previous = v1
    return v1
end
function u16.Once(p1, p2) -- Line: 61 -- upvalues: u17 (val)
    local v1 = setmetatable({}, u17)
    v1.Previous = p1.Previous
    v1.Next = p1
    v1.Once = true
    v1.Function = p2
    p1.Previous.Next = v1
    p1.Previous = v1
    return v1
end
function u16.Wait(p1) -- Line: 72 -- upvalues: u17 (val)
    local v1 = setmetatable({}, u17)
    v1.Previous = p1.Previous
    v1.Next = p1
    v1.Once = true
    v1.Thread = coroutine.running()
    p1.Previous.Next = v1
    p1.Previous = v1
    return coroutine.yield()
end
function u16.Fire(p1, ...) -- Line: 83 -- upvalues: Task (val)
    local Next = p1.Next
    while Next.Type == "Connection" do
        if not Next.Function then
            task.defer(Next.Thread, ...)
        else
            Task:Defer(Next.Function, ...)
        end
        if Next.Once then
            Next.Previous.Next = Next.Next
            Next.Next.Previous = Next.Previous
        end
        Next = Next.Next
    end
end
u17.__index = u17
u17.Type = "Connection"
function u17.Disconnect(p1) -- Line: 103
    p1.Previous.Next = p1.Next
    p1.Next.Previous = p1.Previous
end
return function() -- Line: 39 -- upvalues: u16 (val)
    local v1 = setmetatable({}, u16)
    v1.Previous = v1
    v1.Next = v1
    return v1
end