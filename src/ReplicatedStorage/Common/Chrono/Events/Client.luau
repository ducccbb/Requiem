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
--                  File: ReplicatedStorage.Common.Chrono.Events.Client
--                               Dumped in 0.00313 seconds
--                          Bytecode version 9  |  30 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u22 = 0
local u23 = 64
local u24 = 0
local u25 = 0
local u28 = buffer.create(64)
local u29 = {}
local u30 = 0
local u33 = buffer.create(64)
local u34 = {}
local u35 = 0
newproxy()
local function Read(p1) -- Line: 53 -- upvalues: u30 (ref)
    u30 = u30 + p1
    return u30
end
local function Save() -- Line: 59 -- upvalues: u23 (ref), u25 (ref), u28 (ref), u29 (ref)
    return {Size = u23, Cursor = u25, Buffer = u28, Instances = u29}
end
local function Load(p1) -- Line: 68 -- upvalues: u23 (ref), u25 (ref), u24 (ref), u28 (ref), u29 (ref)
    if p1 then
        u23 = p1.Size
        u25 = p1.Cursor
        u24 = p1.Cursor
        u28 = p1.Buffer
        u29 = p1.Instances
        return
    end
    u23 = 64
    u25 = 0
    u24 = 0
    u28 = buffer.create(64)
    u29 = {}
end
local function Invoke() -- Line: 85 -- upvalues: u22 (ref)
    if u22 == 255 then
        u22 = 0
    end
    u22 = u22 + 1
    return u22
end
local function Allocate(p1) -- Line: 95 -- upvalues: u25 (ref), u23 (ref), u28 (ref), u24 (ref)
    local v1 = u25 + p1
    if u23 < v1 then
        while u23 < v1 do
            u23 = u23 * 1.5
        end
        local v2 = buffer.create(u23)
        buffer.copy(v2, 0, u28, 0, u25)
        u28 = v2
    end
    u24 = u25
    u25 = u25 + p1
    return u24
end
local function CreateQueue() -- Line: 114
    return {}
end
local function Pop(p1) -- Line: 121
    local head = p1.head
    if head == nil then
        return
    end
    p1.head = head.next
    return head.value
end
local function Push(p1, p2) -- Line: 131
    local v1 = {value = p2}
    if p1.tail ~= nil then
        p1.tail.next = v1
    end
    p1.tail = v1
    if p1.head == nil then
        p1.head = v1
    end
end
table.create(256)
local u49 = {Reliable = table.create(256), Unreliable = table.create(256)}
local u56 = {Reliable = table.create(256), Unreliable = table.create(256)}
local Unreliable = u56.Unreliable
Unreliable[1] = table.create(256)
local Reliable = u56.Reliable
Reliable[0] = table.create(256)
local Reliable_2 = u56.Reliable
Reliable_2[1] = table.create(256)
u49.Reliable[2] = {}
local Reliable_3 = u56.Reliable
Reliable_3[2] = table.create(256)
u49.Reliable[3] = {}
local Reliable_4 = u56.Reliable
Reliable_4[3] = table.create(256)
local function WriteEVENT_ClientReplicateCFrame(p1) -- Line: 168 -- upvalues: Allocate (val), u28 (ref)
    local RotationY, v1, v2, v3, v4
    local v5 = Allocate(19)
    buffer.writeu8(u28, v5 + 0, 0)
    buffer.writef32(u28, v5 + 1, p1.timestamp)
    local Position = p1.cframe.Position
    buffer.writef32(u28, v5 + 5, Position.X)
    buffer.writef32(u28, v5 + 9, Position.Y)
    buffer.writef32(u28, v5 + 13, Position.Z)
    if 65504 < p1.cframe.RotationY then
        buffer.writeu16(u28, v5 + 17, 31744)
        return
    end
    if p1.cframe.RotationY < -65504 then
        buffer.writeu16(u28, v5 + 17, 64512)
        return
    end
    if p1.cframe.RotationY ~= p1.cframe.RotationY then
        buffer.writeu16(u28, v5 + 17, 64513)
        return
    end
    if p1.cframe.RotationY == 0 then
        buffer.writeu16(u28, v5 + 17, 0)
        return
    end
    RotationY = p1.cframe.RotationY
    local v6 = math.abs(RotationY)
    local v7 = math.ldexp(1, math.floor((math.log(v6, 2))) - 10)
    v3, v4 = math.frexp(v6 // v7 * v7)
    v4 = v4 + 14
    if v4 > 0 then
        v1 = v3 * 2048
    else
        v1 = v3 * 1024 / math.ldexp(1, (math.abs(v4)))
    end
    if RotationY >= 0 then
        v2 = 0
    else
        v2 = 32768
    end
    local v8 = math.round(v1) % 1024 + math.max(v4, 0) * 1024 + v2
    buffer.writeu16(u28, v5 + 17, v8)
end
local function ReadEVENT_ServerReplicateCFrame() -- Line: 205 -- upvalues: Read (val), u33 (ref)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local v14 = Read(4)
    local v15 = {timestamps = {}}
    local v16 = buffer.readu16(u33, v14 + 0)
    local v17 = 1
    for i = 1, v16, v17 do
        v11 = buffer.readu16(u33, (Read(2)))
        v13 = buffer.readf32(u33, (Read(4)))
        v15.timestamps[v11] = v13
    end
    v15.cframes = {}
    v16 = buffer.readu16(u33, v14 + 2)
    v17 = 1
    for j = 1, v16, v17 do
        v11 = buffer.readu16(u33, (Read(2)))
        v12 = {}
        v1 = buffer.readf32(u33, (Read(4)))
        v2 = buffer.readf32(u33, (Read(4)))
        v3 = buffer.readf32(u33, (Read(4)))
        v12.Position = Vector3.new(v1, v2, v3)
        v4 = buffer.readu16(u33, (Read(2)))
        v5 = v4 % 32768
        if v5 ~= 31744 then
            if v5 == 64512 then
                v12.RotationY = (0 / 0)
            elseif v5 ~= 0 then
                v6 = v5 % 1024
                v7 = v5 // 1024
                if v7 ~= 0 then
                    v8 = v6 / 2048 + 0.5
                else
                    v8 = v6 / 1024
                end
                v9 = math.ldexp(v8, v7 - 14)
                if v4 // 32768 ~= 1 then
                    v10 = v9
                else
                    v10 = -v9
                end
                v12.RotationY = v10
            else
                v12.RotationY = 0
            end
        elseif v4 // 32768 ~= 1 then
            v12.RotationY = math.huge
        else
            v12.RotationY = -math.huge
        end
        v15.cframes[v11] = v12
    end
    return v15
end
local function ReadEVENT_TickRateChanged() -- Line: 264 -- upvalues: Read (val), u33 (ref)
    local v1 = Read(6)
    return {id = buffer.readu16(u33, v1 + 0), tickRate = buffer.readf32(u33, v1 + 2)}
end
local function ReadEVENT_TogglePlayerReplication() -- Line: 273 -- upvalues: Read (val), u33 (ref)
    local v1 = Read(3)
    local v2 = {id = buffer.readu16(u33, v1 + 0)}
    local v3 = buffer.readu8(u33, v1 + 2) == 1
    v2.on = v3
    return v2
end
local function ReadEVENT_InitializePlayer() -- Line: 282 -- upvalues: Read (val), u33 (ref)
    local v1 = Read(4)
    local v2 = {id = buffer.readu16(u33, v1 + 0)}
    local v3 = buffer.readu16(u33, v1 + 2)
    local v4 = Read(v3)
    v2.player = buffer.readstring(u33, v4, v3)
    return v2
end
local function ReadEVENT_InitializeExistingPlayers() -- Line: 292 -- upvalues: Read (val), u33 (ref)
    local v1, v2, v3, v4
    local v5 = buffer.readu16(u33, Read(2) + 0)
    if v5 < 0 then
        error((("Expected \"Length\" to be larger than 0, got %* instead."):format(v5)))
    end
    if 65535 < v5 then
        error((("Expected \"Length\" to be smaller than 65535, got %* instead."):format(v5)))
    end
    local v6 = table.create(v5)
    local v7 = Read(v5 * 4)
    local v8 = v5
    local v9 = 1
    for i = 1, v8, v9 do
        v2 = {}
        v3 = v7
        v7 = v7 + 2
        v2.id = buffer.readu16(u33, v3)
        v4 = v7
        v7 = v7 + 2
        v5 = buffer.readu16(u33, v4)
        v1 = Read(v5)
        v2.player = buffer.readstring(u33, v1, v5)
        table.insert(v6, v2)
    end
    return v6
end
if not (RunService:IsRunning()) then
    local function v2() end
    local v3 = {
        ClientReplicateCFrame = {Fire = v2},
        ServerReplicateCFrame = {On = v2},
        TickRateChanged = {On = v2},
        TogglePlayerReplication = {On = v2},
        InitializePlayer = {On = v2},
        InitializeExistingPlayers = {On = v2},
    }
    return (table.freeze(v3))
end
if not (RunService:IsClient()) then
    error("Client network module can only be required from the client.")
end
local CHRONO_BLINK_RELIABLE_REMOTE = ReplicatedStorage:WaitForChild("CHRONO_BLINK_RELIABLE_REMOTE")
local CHRONO_BLINK_UNRELIABLE_REMOTE = ReplicatedStorage:WaitForChild("CHRONO_BLINK_UNRELIABLE_REMOTE")
local function StepReplication() -- Line: 356 -- upvalues: u25 (ref), u28 (ref), CHRONO_BLINK_RELIABLE_REMOTE (val), u29 (ref), u23 (ref), u24 (ref)
    if u25 <= 0 then
        return
    end
    local v1 = buffer.create(u25)
    buffer.copy(v1, 0, u28, 0, u25)
    CHRONO_BLINK_RELIABLE_REMOTE:FireServer(v1, u29)
    u23 = 64
    u25 = 0
    u24 = 0
    u28 = buffer.create(64)
    table.clear(u29)
end
RunService.Heartbeat:Connect(StepReplication)
CHRONO_BLINK_RELIABLE_REMOTE.OnClientEvent:Connect(function(p1, p2) -- Line: 372 -- upvalues: u30 (ref), u33 (ref), u34 (ref), u35 (ref), Read (val), ReadEVENT_TickRateChanged (val), u49 (val), u56 (val), ReadEVENT_TogglePlayerReplication (val), ReadEVENT_InitializePlayer (val), ReadEVENT_InitializeExistingPlayers (val)
    local v1, v2, v3, v4, v5
    u30 = 0
    u33 = p1
    u34 = p2
    u35 = 0
    local v6 = buffer.len(u33)
    while u30 < v6 do
        v1 = buffer.readu8(u33, Read(1) + 0)
        if v1 == 0 then
            v2 = ReadEVENT_TickRateChanged()
            if u49.Reliable[0] == nil then
                v3 = #u56.Reliable[0]
                if 256 < v3 then
                    warn("[Blink]: Event queue of \"TickRateChanged\" exceeded 256, did you forget to implement a listener?")
                end
                table.insert(u56.Reliable[0], {v2})
            else
                u49.Reliable[0](v2)
            end
        elseif v1 == 1 then
            v2 = ReadEVENT_TogglePlayerReplication()
            if u49.Reliable[1] == nil then
                v3 = #u56.Reliable[1]
                if 256 < v3 then
                    warn("[Blink]: Event queue of \"TogglePlayerReplication\" exceeded 256, did you forget to implement a listener?")
                end
                table.insert(u56.Reliable[1], {v2})
            else
                u49.Reliable[1](v2)
            end
        elseif v1 == 2 then
            v2 = ReadEVENT_InitializePlayer()
            v3 = #u49.Reliable[2]
            if 0 >= v3 then
                v3 = #u56.Reliable[2]
                if 256 < v3 then
                    warn("[Blink]: Event queue of \"InitializePlayer\" exceeded 256, did you forget to implement a listener?")
                end
                table.insert(u56.Reliable[2], {v2})
            else
                v3 = u49.Reliable[2]
                v4 = nil
                v5 = nil
                for k, n in v3, v4, v5 do
                    task.spawn(n, v2)
                end
            end
        elseif v1 == 3 then
            v2 = ReadEVENT_InitializeExistingPlayers()
            v3 = #u49.Reliable[3]
            if 0 >= v3 then
                v3 = #u56.Reliable[3]
                if 256 < v3 then
                    warn("[Blink]: Event queue of \"InitializeExistingPlayers\" exceeded 256, did you forget to implement a listener?")
                end
                table.insert(u56.Reliable[3], {v2})
            else
                v3 = u49.Reliable[3]
                v4 = nil
                v5 = nil
                for i, j in v3, v4, v5 do
                    task.spawn(j, v2)
                end
            end
        end
    end
end)
CHRONO_BLINK_UNRELIABLE_REMOTE.OnClientEvent:Connect(function(p1, p2) -- Line: 437 -- upvalues: u30 (ref), u33 (ref), u34 (ref), u35 (ref), Read (val), ReadEVENT_ServerReplicateCFrame (val), u49 (val)
    u30 = 0
    u33 = p1
    u34 = p2
    u35 = 0
    local v1 = buffer.len(u33)
    while u30 < v1 do
        if buffer.readu8(u33, Read(1) + 0) == 1 and u49.Unreliable[1] ~= nil then
            u49.Unreliable[1]((ReadEVENT_ServerReplicateCFrame()))
        end
    end
end)
local v4 = {
    StepReplication = StepReplication,
    ClientReplicateCFrame = {
        Fire = function(p1) -- Line: 461 -- upvalues: Save (val), Load (val), WriteEVENT_ClientReplicateCFrame (val), u25 (ref), u28 (ref), CHRONO_BLINK_UNRELIABLE_REMOTE (val), u29 (ref)
            Load()
            WriteEVENT_ClientReplicateCFrame(p1)
            local v1 = buffer.create(u25)
            buffer.copy(v1, 0, u28, 0, u25)
            CHRONO_BLINK_UNRELIABLE_REMOTE:FireServer(v1, u29)
            Load((Save()))
        end,
    },
    ServerReplicateCFrame = {
        On = function(p1) -- Line: 472 -- upvalues: u49 (val)
            u49.Unreliable[1] = p1
            return function() -- Line: 476 -- upvalues: u49 (upval), p1 (val)
                local v1 = u49.Unreliable[1]
                if v1 == p1 then
                    u49.Unreliable[1] = nil
                end
            end
        end,
    },
    TickRateChanged = {
        On = function(p1) -- Line: 484 -- upvalues: u49 (val), u56 (val)
            u49.Reliable[0] = p1
            local v1 = u56.Reliable[0]
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                p1(table.unpack(j))
            end
            u56.Reliable[0] = {}
            return function() -- Line: 490 -- upvalues: u49 (upval), p1 (val)
                local v1 = u49.Reliable[0]
                if v1 == p1 then
                    u49.Reliable[0] = nil
                end
            end
        end,
    },
    TogglePlayerReplication = {
        On = function(p1) -- Line: 498 -- upvalues: u49 (val), u56 (val)
            u49.Reliable[1] = p1
            local v1 = u56.Reliable[1]
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                p1(table.unpack(j))
            end
            u56.Reliable[1] = {}
            return function() -- Line: 504 -- upvalues: u49 (upval), p1 (val)
                local v1 = u49.Reliable[1]
                if v1 == p1 then
                    u49.Reliable[1] = nil
                end
            end
        end,
    },
    InitializePlayer = {
        On = function(p1) -- Line: 512 -- upvalues: u49 (val), u56 (val)
            table.insert(u49.Reliable[2], p1)
            local v1 = u56.Reliable[2]
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                task.spawn(p1, table.unpack(j))
            end
            u56.Reliable[2] = {}
            return function() -- Line: 518 -- upvalues: u49 (upval), p1 (val)
                local v1 = table.find(u49.Reliable[2], p1)
                if v1 ~= nil then
                    table.remove(u49.Reliable[2], v1)
                end
            end
        end,
    },
    InitializeExistingPlayers = {
        On = function(p1) -- Line: 527 -- upvalues: u49 (val), u56 (val)
            table.insert(u49.Reliable[3], p1)
            local v1 = u56.Reliable[3]
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                task.spawn(p1, table.unpack(j))
            end
            u56.Reliable[3] = {}
            return function() -- Line: 533 -- upvalues: u49 (upval), p1 (val)
                local v1 = table.find(u49.Reliable[3], p1)
                if v1 ~= nil then
                    table.remove(u49.Reliable[3], v1)
                end
            end
        end,
    },
}
return (table.freeze(v4))