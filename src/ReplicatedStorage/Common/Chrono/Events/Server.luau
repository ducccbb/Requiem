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
--                  File: ReplicatedStorage.Common.Chrono.Events.Server
--                               Dumped in 0.00404 seconds
--                          Bytecode version 9  |  42 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u27 = 0
local u28 = 64
local u29 = 0
local u30 = 0
local u33 = buffer.create(64)
local u34 = {}
local u35 = 0
local u38 = buffer.create(64)
local u39 = {}
local u40 = 0
newproxy()
local function Read(p1) -- Line: 54 -- upvalues: u35 (ref)
    u35 = u35 + p1
    return u35
end
local function Save() -- Line: 60 -- upvalues: u28 (ref), u30 (ref), u33 (ref), u34 (ref)
    return {Size = u28, Cursor = u30, Buffer = u33, Instances = u34}
end
local function Load(p1) -- Line: 69 -- upvalues: u28 (ref), u30 (ref), u29 (ref), u33 (ref), u34 (ref)
    if p1 then
        u28 = p1.Size
        u30 = p1.Cursor
        u29 = p1.Cursor
        u33 = p1.Buffer
        u34 = p1.Instances
        return
    end
    u28 = 64
    u30 = 0
    u29 = 0
    u33 = buffer.create(64)
    u34 = {}
end
local function Invoke() -- Line: 86 -- upvalues: u27 (ref)
    if u27 == 255 then
        u27 = 0
    end
    u27 = u27 + 1
    return u27
end
local function Allocate(p1) -- Line: 96 -- upvalues: u30 (ref), u28 (ref), u33 (ref), u29 (ref)
    local v1 = u30 + p1
    if u28 < v1 then
        while u28 < v1 do
            u28 = u28 * 1.5
        end
        local v2 = buffer.create(u28)
        buffer.copy(v2, 0, u33, 0, u30)
        u33 = v2
    end
    u29 = u30
    u30 = u30 + p1
    return u29
end
local function CreateQueue() -- Line: 115
    return {}
end
local function Pop(p1) -- Line: 122
    local head = p1.head
    if head == nil then
        return
    end
    p1.head = head.next
    return head.value
end
local function Push(p1, p2) -- Line: 132
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
local u54 = {Reliable = table.create(256), Unreliable = table.create(256)}
;({Reliable = table.create(256), Unreliable = table.create(256)}).Unreliable[0] = table.create(256)
local function ReadEVENT_ClientReplicateCFrame() -- Line: 163 -- upvalues: Read (val), u38 (ref)
    local v1, v2
    local v3 = Read(18)
    local v4 = {timestamp = buffer.readf32(u38, v3 + 0), cframe = {}}
    local v5 = buffer.readf32(u38, v3 + 4)
    local v6 = buffer.readf32(u38, v3 + 8)
    local v7 = buffer.readf32(u38, v3 + 12)
    v4.cframe.Position = Vector3.new(v5, v6, v7)
    local v8 = buffer.readu16(u38, v3 + 16)
    local v9 = v8 % 32768
    if v9 == 31744 then
        if v8 // 32768 == 1 then
            v4.cframe.RotationY = -math.huge
            return v4
        end
        v4.cframe.RotationY = math.huge
        return v4
    end
    if v9 == 64512 then
        v4.cframe.RotationY = (0 / 0)
        return v4
    end
    if v9 == 0 then
        v4.cframe.RotationY = 0
        return v4
    end
    local v10 = v9 % 1024
    local v11 = v9 // 1024
    if v11 ~= 0 then
        v2 = v10 / 2048 + 0.5
    else
        v2 = v10 / 1024
    end
    local v12 = math.ldexp(v2, v11 - 14)
    if v8 // 32768 ~= 1 then
        v1 = v12
    else
        v1 = -v12
    end
    v4.cframe.RotationY = v1
    return v4
end
local function WriteEVENT_ServerReplicateCFrame(p1) -- Line: 202 -- upvalues: Allocate (val), u33 (ref)
    local Position, RotationY, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = Allocate(5)
    buffer.writeu8(u33, v9 + 0, 1)
    local v10 = 0
    local timestamps = p1.timestamps
    local v11 = nil
    local v12 = nil
    for i, j in timestamps, v11, v12 do
        v10 = v10 + 1
        buffer.writeu16(u33, Allocate(2), i)
        buffer.writef32(u33, Allocate(4), j)
    end
    buffer.writeu16(u33, v9 + 1, v10)
    local v13 = 0
    local cframes = p1.cframes
    v12 = nil
    local v14 = nil
    for k, n in cframes, v12, v14 do
        v13 = v13 + 1
        buffer.writeu16(u33, Allocate(2), k)
        Position = n.Position
        buffer.writef32(u33, Allocate(4), Position.X)
        buffer.writef32(u33, Allocate(4), Position.Y)
        buffer.writef32(u33, Allocate(4), Position.Z)
        v1 = Allocate(2)
        if 65504 < n.RotationY then
            buffer.writeu16(u33, v1, 31744)
        elseif n.RotationY < -65504 then
            buffer.writeu16(u33, v1, 64512)
        elseif n.RotationY ~= n.RotationY then
            buffer.writeu16(u33, v1, 64513)
        elseif n.RotationY ~= 0 then
            RotationY = n.RotationY
            v2 = math.abs(RotationY)
            v3 = math.ldexp(1, math.floor((math.log(v2, 2))) - 10)
            v4, v5 = math.frexp(v2 // v3 * v3)
            v5 = v5 + 14
            if v5 > 0 then
                v7 = v4 * 2048
            else
                v7 = v4 * 1024 / math.ldexp(1, (math.abs(v5)))
            end
            if RotationY >= 0 then
                v8 = 0
            else
                v8 = 32768
            end
            v6 = math.round(v7) % 1024 + math.max(v5, 0) * 1024 + v8
            buffer.writeu16(u33, v1, v6)
        else
            buffer.writeu16(u33, v1, 0)
        end
    end
    buffer.writeu16(u33, v9 + 3, v13)
end
local function WriteEVENT_TickRateChanged(p1) -- Line: 256 -- upvalues: Allocate (val), u33 (ref)
    local v1 = Allocate(7)
    buffer.writeu8(u33, v1 + 0, 0)
    buffer.writeu16(u33, v1 + 1, p1.id)
    buffer.writef32(u33, v1 + 3, p1.tickRate)
end
local function WriteEVENT_TogglePlayerReplication(p1) -- Line: 264 -- upvalues: Allocate (val), u33 (ref)
    local v1
    local v2 = Allocate(4)
    buffer.writeu8(u33, v2 + 0, 1)
    buffer.writeu16(u33, v2 + 1, p1.id)
    if not p1.on then
        v1 = 0
    else
        v1 = 1
    end
    buffer.writeu8(u33, v2 + 3, v1)
end
local function WriteEVENT_InitializePlayer(p1) -- Line: 272 -- upvalues: Allocate (val), u33 (ref), u29 (ref)
    local v1 = Allocate(5)
    buffer.writeu8(u33, v1 + 0, 2)
    buffer.writeu16(u33, v1 + 1, p1.id)
    local v2 = #p1.player
    buffer.writeu16(u33, v1 + 3, v2)
    Allocate(v2)
    buffer.writestring(u33, u29, p1.player, v2)
end
local function WriteEVENT_InitializeExistingPlayers(p1) -- Line: 283 -- upvalues: Allocate (val), u33 (ref), u29 (ref)
    local v1, v2, v3, v4
    local v5 = Allocate(3)
    buffer.writeu8(u33, v5 + 0, 3)
    buffer.writeu16(u33, v5 + 1, #p1)
    local v6 = Allocate(#p1 * 4)
    local v7 = #p1
    local v8 = 1
    for i = 1, v7, v8 do
        v1 = p1[i]
        v2 = v6
        v6 = v6 + 2
        buffer.writeu16(u33, v2, v1.id)
        v3 = #v1.player
        v4 = v6
        v6 = v6 + 2
        buffer.writeu16(u33, v4, v3)
        Allocate(v3)
        buffer.writestring(u33, u29, v1.player, v3)
    end
end
if not (RunService:IsRunning()) then
    local function v2() end
    local v3 = {
        ClientReplicateCFrame = {On = v2},
        ServerReplicateCFrame = {Fire = v2, FireAll = v2, FireList = v2, FireExcept = v2},
        TickRateChanged = {Fire = v2, FireAll = v2, FireList = v2, FireExcept = v2},
        TogglePlayerReplication = {Fire = v2, FireAll = v2, FireList = v2, FireExcept = v2},
        InitializePlayer = {Fire = v2, FireAll = v2, FireList = v2, FireExcept = v2},
        InitializeExistingPlayers = {Fire = v2, FireAll = v2, FireList = v2, FireExcept = v2},
    }
    return (table.freeze(v3))
end
if not (RunService:IsServer()) then
    error("Server network module can only be required from the server.")
end
local CHRONO_BLINK_RELIABLE_REMOTE = ReplicatedStorage:FindFirstChild("CHRONO_BLINK_RELIABLE_REMOTE")
if not CHRONO_BLINK_RELIABLE_REMOTE then
    local RemoteEvent = Instance.new("RemoteEvent")
    RemoteEvent.Name = "CHRONO_BLINK_RELIABLE_REMOTE"
    RemoteEvent.Parent = ReplicatedStorage
    CHRONO_BLINK_RELIABLE_REMOTE = RemoteEvent
end
local CHRONO_BLINK_UNRELIABLE_REMOTE = ReplicatedStorage:FindFirstChild("CHRONO_BLINK_UNRELIABLE_REMOTE")
if not CHRONO_BLINK_UNRELIABLE_REMOTE then
    local UnreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")
    UnreliableRemoteEvent.Name = "CHRONO_BLINK_UNRELIABLE_REMOTE"
    UnreliableRemoteEvent.Parent = ReplicatedStorage
    CHRONO_BLINK_UNRELIABLE_REMOTE = UnreliableRemoteEvent
end
local u118 = {}
Players.PlayerRemoving:Connect(function(p1) -- Line: 371 -- upvalues: u118 (val)
    u118[p1] = nil
end)
local function StepReplication() -- Line: 375 -- upvalues: u118 (val), CHRONO_BLINK_RELIABLE_REMOTE (ref)
    local v1
    local v2 = u118
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.Cursor > 0 then
            v1 = buffer.create(j.Cursor)
            buffer.copy(v1, 0, j.Buffer, 0, j.Cursor)
            CHRONO_BLINK_RELIABLE_REMOTE:FireClient(i, v1, j.Instances)
            j.Size = 64
            j.Cursor = 0
            j.Buffer = buffer.create(64)
            table.clear(j.Instances)
        end
    end
end
RunService.Heartbeat:Connect(StepReplication)
CHRONO_BLINK_RELIABLE_REMOTE.OnServerEvent:Connect(function(p1, p2, p3) -- Line: 392 -- upvalues: u35 (ref), u38 (ref), u39 (ref), u40 (ref), Read (val)
    u35 = 0
    u38 = p2
    u39 = p3
    u40 = 0
    local v1 = buffer.len(u38)
    while u35 < v1 do
        buffer.readu8(u38, Read(1) + 0)
    end
end)
CHRONO_BLINK_UNRELIABLE_REMOTE.OnServerEvent:Connect(function(p1, p2, p3) -- Line: 404 -- upvalues: u35 (ref), u38 (ref), u39 (ref), u40 (ref), Read (val), ReadEVENT_ClientReplicateCFrame (val), u54 (val)
    u35 = 0
    u38 = p2
    u39 = p3
    u40 = 0
    local v1 = buffer.len(u38)
    local v2 = p1
    while u35 < v1 do
        if buffer.readu8(u38, Read(1) + 0) == 0 and u54.Unreliable[0] ~= nil then
            u54.Unreliable[0](v2, (ReadEVENT_ClientReplicateCFrame()))
        end
    end
end)
local v4 = {
    StepReplication = StepReplication,
    ClientReplicateCFrame = {
        On = function(p1) -- Line: 428 -- upvalues: u54 (val)
            u54.Unreliable[0] = p1
            return function() -- Line: 433 -- upvalues: u54 (upval), p1 (val)
                local v1 = u54.Unreliable[0]
                if v1 == p1 then
                    u54.Unreliable[0] = nil
                end
            end
        end,
    },
    ServerReplicateCFrame = {
        Fire = function(p1, p2) -- Line: 441 -- upvalues: Load (val), WriteEVENT_ServerReplicateCFrame (val), u30 (ref), u33 (ref), CHRONO_BLINK_UNRELIABLE_REMOTE (ref), u34 (ref)
            Load()
            WriteEVENT_ServerReplicateCFrame(p2)
            local v1 = buffer.create(u30)
            buffer.copy(v1, 0, u33, 0, u30)
            CHRONO_BLINK_UNRELIABLE_REMOTE:FireClient(p1, v1, u34)
        end,
        FireAll = function(p1) -- Line: 454 -- upvalues: Load (val), WriteEVENT_ServerReplicateCFrame (val), u30 (ref), u33 (ref), CHRONO_BLINK_UNRELIABLE_REMOTE (ref), u34 (ref)
            Load()
            WriteEVENT_ServerReplicateCFrame(p1)
            local v1 = buffer.create(u30)
            buffer.copy(v1, 0, u33, 0, u30)
            CHRONO_BLINK_UNRELIABLE_REMOTE:FireAllClients(v1, u34)
        end,
        FireList = function(p1, p2) -- Line: 464 -- upvalues: Load (val), WriteEVENT_ServerReplicateCFrame (val), u30 (ref), u33 (ref), CHRONO_BLINK_UNRELIABLE_REMOTE (ref), u34 (ref)
            Load()
            WriteEVENT_ServerReplicateCFrame(p2)
            local v1 = buffer.create(u30)
            buffer.copy(v1, 0, u33, 0, u30)
            local v2 = p1
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                CHRONO_BLINK_UNRELIABLE_REMOTE:FireClient(j, v1, u34)
            end
        end,
        FireExcept = function(p1, p2) -- Line: 479 -- upvalues: Load (val), WriteEVENT_ServerReplicateCFrame (val), u30 (ref), u33 (ref), Players (val), CHRONO_BLINK_UNRELIABLE_REMOTE (ref), u34 (ref)
            Load()
            WriteEVENT_ServerReplicateCFrame(p2)
            local v1 = buffer.create(u30)
            buffer.copy(v1, 0, u33, 0, u30)
            for i, j in Players:GetPlayers() do
                if j ~= p1 then
                    CHRONO_BLINK_UNRELIABLE_REMOTE:FireClient(j, v1, u34)
                end
            end
        end,
    },
    TickRateChanged = {
        Fire = function(p1, p2) -- Line: 499 -- upvalues: Load (val), u118 (val), WriteEVENT_TickRateChanged (val), Save (val)
            Load(u118[p1])
            WriteEVENT_TickRateChanged(p2)
            u118[p1] = Save()
        end,
        FireAll = function(p1) -- Line: 504 -- upvalues: Load (val), WriteEVENT_TickRateChanged (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TickRateChanged(p1)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireList = function(p1, p2) -- Line: 516 -- upvalues: Load (val), WriteEVENT_TickRateChanged (val), u33 (ref), u30 (ref), u34 (ref), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TickRateChanged(p2)
            local v2 = u30
            local v3 = u34
            local v4 = p1
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireExcept = function(p1, p2) -- Line: 528 -- upvalues: Load (val), WriteEVENT_TickRateChanged (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TickRateChanged(p2)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                if j ~= p1 then
                    Load(u118[j])
                    v1 = Allocate(v2)
                    buffer.copy(u33, v1, u33, 0, v2)
                    table.move(v3, 1, #v3, #u34 + 1, u34)
                    u118[j] = Save()
                end
            end
        end,
    },
    TogglePlayerReplication = {
        Fire = function(p1, p2) -- Line: 545 -- upvalues: Load (val), u118 (val), WriteEVENT_TogglePlayerReplication (val), Save (val)
            Load(u118[p1])
            WriteEVENT_TogglePlayerReplication(p2)
            u118[p1] = Save()
        end,
        FireAll = function(p1) -- Line: 550 -- upvalues: Load (val), WriteEVENT_TogglePlayerReplication (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TogglePlayerReplication(p1)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireList = function(p1, p2) -- Line: 562 -- upvalues: Load (val), WriteEVENT_TogglePlayerReplication (val), u33 (ref), u30 (ref), u34 (ref), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TogglePlayerReplication(p2)
            local v2 = u30
            local v3 = u34
            local v4 = p1
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireExcept = function(p1, p2) -- Line: 574 -- upvalues: Load (val), WriteEVENT_TogglePlayerReplication (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_TogglePlayerReplication(p2)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                if j ~= p1 then
                    Load(u118[j])
                    v1 = Allocate(v2)
                    buffer.copy(u33, v1, u33, 0, v2)
                    table.move(v3, 1, #v3, #u34 + 1, u34)
                    u118[j] = Save()
                end
            end
        end,
    },
    InitializePlayer = {
        Fire = function(p1, p2) -- Line: 591 -- upvalues: Load (val), u118 (val), WriteEVENT_InitializePlayer (val), Save (val)
            Load(u118[p1])
            WriteEVENT_InitializePlayer(p2)
            u118[p1] = Save()
        end,
        FireAll = function(p1) -- Line: 596 -- upvalues: Load (val), WriteEVENT_InitializePlayer (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializePlayer(p1)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireList = function(p1, p2) -- Line: 608 -- upvalues: Load (val), WriteEVENT_InitializePlayer (val), u33 (ref), u30 (ref), u34 (ref), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializePlayer(p2)
            local v2 = u30
            local v3 = u34
            local v4 = p1
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireExcept = function(p1, p2) -- Line: 620 -- upvalues: Load (val), WriteEVENT_InitializePlayer (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializePlayer(p2)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                if j ~= p1 then
                    Load(u118[j])
                    v1 = Allocate(v2)
                    buffer.copy(u33, v1, u33, 0, v2)
                    table.move(v3, 1, #v3, #u34 + 1, u34)
                    u118[j] = Save()
                end
            end
        end,
    },
    InitializeExistingPlayers = {
        Fire = function(p1, p2) -- Line: 637 -- upvalues: Load (val), u118 (val), WriteEVENT_InitializeExistingPlayers (val), Save (val)
            Load(u118[p1])
            WriteEVENT_InitializeExistingPlayers(p2)
            u118[p1] = Save()
        end,
        FireAll = function(p1) -- Line: 642 -- upvalues: Load (val), WriteEVENT_InitializeExistingPlayers (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializeExistingPlayers(p1)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireList = function(p1, p2) -- Line: 654 -- upvalues: Load (val), WriteEVENT_InitializeExistingPlayers (val), u33 (ref), u30 (ref), u34 (ref), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializeExistingPlayers(p2)
            local v2 = u30
            local v3 = u34
            local v4 = p1
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                Load(u118[j])
                v1 = Allocate(v2)
                buffer.copy(u33, v1, u33, 0, v2)
                table.move(v3, 1, #v3, #u34 + 1, u34)
                u118[j] = Save()
            end
        end,
        FireExcept = function(p1, p2) -- Line: 666 -- upvalues: Load (val), WriteEVENT_InitializeExistingPlayers (val), u33 (ref), u30 (ref), u34 (ref), Players (val), u118 (val), Allocate (val), Save (val)
            local v1
            Load()
            WriteEVENT_InitializeExistingPlayers(p2)
            local v2 = u30
            local v3 = u34
            for i, j in Players:GetPlayers() do
                if j ~= p1 then
                    Load(u118[j])
                    v1 = Allocate(v2)
                    buffer.copy(u33, v1, u33, 0, v2)
                    table.move(v3, 1, #v3, #u34 + 1, u34)
                    u118[j] = Save()
                end
            end
        end,
    },
}
return (table.freeze(v4))