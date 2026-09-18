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
--                File: ReplicatedStorage.Common.Chrono.Server.Replicate
--                               Dumped in 0.00493 seconds
--                          Bytecode version 9  |  35 functions

local Flush, u81
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local Character = require(u0.Parent.Parent.Shared.Character)
local Config = require(u0.Parent.Parent.Shared.Config)
local Server = require(u0.Parent.Parent.Events.Server)
local Grid = require(u0.Parent.Parent.Shared.Grid)
local InterpolationMath = require(u0.Parent.Parent.Shared.InterpolationMath)
local MakeNetworkable = require(u0.Parent.Parent.Shared.MakeNetworkable)
local Snapshots = require(u0.Parent.Parent.Shared.Snapshots)
local UnreliableRemoteEvent_2 = Instance.new("UnreliableRemoteEvent")
UnreliableRemoteEvent_2.Name = "ClientReplicateCFrame"
UnreliableRemoteEvent_2.Parent = ReplicatedStorage
local ENABLE_CUSTOM_CHARACTERS = Config.ENABLE_CUSTOM_CHARACTERS
if not Config.SEND_FULL_ROTATION then
    u81 = 20
else
    u81 = 24
end
local u84 = 898 // u81
local UnreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")
UnreliableRemoteEvent.Name = "ServerReplicateCFrame"
UnreliableRemoteEvent.Parent = ReplicatedStorage
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "DeathEvent"
RemoteEvent.Parent = ReplicatedStorage
local u94 = {}
local u95 = {}
local u96 = {}
local u97 = {}
task.defer(function() -- Line: 45 -- upvalues: u0 (val), u97 (ref)
    u97 = require(u0.Parent.Parent.Shared.NpcRegistry)._ClientOwners
end)
local u102 = {}
local u103 = {}
local u104 = {}
local u105 = {}
local u106 = {}
local u107 = 0
local function GetCharacter(p1) -- Line: 84 -- upvalues: ENABLE_CUSTOM_CHARACTERS (val), Character (val)
    if ENABLE_CUSTOM_CHARACTERS then
        return Character.GetCharacter(p1)
    end
    return p1.Character
end
local u115 = (function() -- Line: 92 -- upvalues: Config (val), InterpolationMath (val)
    if Config.LINEAR_ONLY_INTERPOLATION then
        return InterpolationMath.Linear
    end
    if Config.USE_HYBRID_INTERPOLATION then
        return InterpolationMath.HybridHermite
    end
    return InterpolationMath.Hermite
end)()
local VelocityAt = InterpolationMath.VelocityAt
local function PackSnapshotData(p1, p2, p3, p4, p5) -- Line: 105 -- upvalues: Config (val), MakeNetworkable (val)
    local v1, v2
    buffer.writef32(p1, p2 + 0, p3)
    buffer.writef32(p1, p2 + 4, p4.Position.X)
    buffer.writef32(p1, p2 + 8, p4.Position.Y)
    buffer.writef32(p1, p2 + 12, p4.Position.Z)
    if not Config.SEND_FULL_ROTATION then
        v1 = MakeNetworkable.MakeYawNetworkable(p4)
        v2 = math.map(v1.RotationY, -math.pi, math.pi, 0, 65535)
        buffer.writeu16(p1, p2 + 16, v2)
        buffer.writeu16(p1, p2 + 18, p5)
        return
    end
    v1 = MakeNetworkable.MakeNetworkable(p4)
    v2 = math.map(v1.Rotation.x, -1, 1, 0, 65535)
    local v3 = math.map(v1.Rotation.y, -1, 1, 0, 65535)
    local v4 = math.map(v1.Rotation.z, -1, 1, 0, 65535)
    buffer.writeu16(p1, p2 + 16, v2)
    buffer.writeu16(p1, p2 + 18, v3)
    buffer.writeu16(p1, p2 + 20, v4)
    buffer.writeu16(p1, p2 + 22, p5)
end
local function UnpackSnapshotData(p1, p2) -- Line: 130 -- upvalues: Config (val), MakeNetworkable (val)
    local v1, v2
    local v3 = {timestamp = buffer.readf32(p1, p2 + 0)}
    local v4 = buffer.readf32(p1, p2 + 4)
    local v5 = buffer.readf32(p1, p2 + 8)
    local v6 = buffer.readf32(p1, p2 + 12)
    if not Config.SEND_FULL_ROTATION then
        v1 = buffer.readu16(p1, p2 + 16)
        v2 = math.map(v1, 0, 65535, -math.pi, math.pi)
        v3.cframe = MakeNetworkable.DecodeYawCFrame({Position = vector.create(v4, v5, v6), RotationY = v2})
        v3.id = buffer.readu16(p1, p2 + 18)
        return v3
    end
    v1 = buffer.readu16(p1, p2 + 16)
    v2 = buffer.readu16(p1, p2 + 18)
    local v7 = buffer.readu16(p1, p2 + 20)
    local v8 = math.map(v1, 0, 65535, -1, 1)
    local v9 = math.map(v2, 0, 65535, -1, 1)
    local v10 = math.map(v7, 0, 65535, -1, 1)
    v3.cframe = MakeNetworkable.DecodeCFrame({
        Position = vector.create(v4, v5, v6),
        Rotation = {x = v8, y = v9, z = v10},
    })
    v3.id = buffer.readu16(p1, p2 + 22)
    return v3
end
local function GetNextID() -- Line: 169 -- upvalues: u95 (val), u107 (ref)
    local v1 = table.remove(u95)
    if v1 then
        return v1
    end
    if u107 + 1 == 65535 then
        error("Max ID reached, please investigate.")
    end
    u107 = u107 + 1
    return u107
end
local u122 = Random.new()
local function ReturnID(p1) -- Line: 184 -- upvalues: u122 (val), u95 (val)
    local v1 = u122:NextNumber(2, 4)
    task.delay(v1, table.insert, u95, p1)
end
local function GetIdFrom(p1) -- Line: 188 -- upvalues: u96 (val)
    if typeof(p1) ~= "Instance" then
        if typeof(p1) == "number" then
            return p1
        end
        return nil
    end
    if p1:IsA("Player") then
        return u96[p1]
    end
    if p1:IsA("Model") then
        return (p1:GetAttribute("NPC_ID"))
    end
    return nil
end
local function NewReplicationRule() -- Line: 202
    return {filterType = "exclude", filterPlayers = {}}
end
local function GetNpcConfig(p1) -- Line: 243 -- upvalues: Config (val)
    local DEFAULT = Config.NPC_TYPES[p1 or "DEFAULT"]
    if not DEFAULT then
        DEFAULT = Config.NPC_TYPES.DEFAULT
    end
    return DEFAULT
end
local function OnCharacterAdded(p1, p2, p3) -- Line: 248 -- upvalues: Config (val), u106 (val), Grid (val)
    if not Config.DISABLE_DEFAULT_REPLICATION then
        Grid.AddEntity(p2, "player")
        return
    end
    local Humanoid = p2:WaitForChild("Humanoid")
    if not Humanoid then
        return
    end
    Humanoid.Died:Connect(function() -- Line: 255 -- upvalues: Humanoid (val), p2 (val), u106 (upval), p3 (val)
        if not Humanoid.BreakJointsOnDeath then
            return
        end
        p2:PivotTo(u106[p3]:GetPivot())
    end)
end
local function OnCharacterRemoving(p1) -- Line: 267 -- upvalues: Config (val), Grid (val)
    if Config.DISABLE_DEFAULT_REPLICATION then
        return
    end
    Grid.RemoveEntity(p1)
end
local function InitExistingPlayers(p1) -- Line: 274 -- upvalues: u96 (val), Server (val)
    local v1 = {}
    local v2 = u96
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if i ~= p1 then
            table.insert(v1, {id = u96[i], player = i.Name})
        end
    end
    if #v1 == 0 then
        warn("No existing players found to initialize for player", p1)
        return
    end
    Server.InitializeExistingPlayers.Fire(p1, v1)
end
Players.PlayerAdded:Connect(function(p1) -- Line: 296 -- upvalues: GetNextID (val), u96 (val), u102 (val), Snapshots (val), u115 (val), u104 (val), Config (val), StarterPlayer (val), u106 (val), Grid (val), InitExistingPlayers (val), Server (val), OnCharacterAdded (val), OnCharacterRemoving (val)
    local v1
    local u2 = GetNextID()
    u96[p1] = u2
    u102[u2] = {serverOwned = false, player = p1, snapshot = Snapshots(u115)}
    u104[u2] = 0
    if Config.DISABLE_DEFAULT_REPLICATION then
        if not (StarterPlayer:FindFirstChild("Replicator")) then
            warn("No Replicator model found in StarterPlayer, you must add one for fully custom replication to work properly")
        else
            v1 = StarterPlayer.Replicator:Clone()
            v1.Name = p1.Name
            v1.Parent = workspace.CurrentCamera
            u106[u2] = v1
            Grid.AddEntity(v1, "player")
        end
    end
    InitExistingPlayers(p1)
    Server.InitializePlayer.FireAll({id = u2, player = p1.Name})
    v1 = u102[u2]
    v1._characterAdded = p1.CharacterAdded:Connect(function(a1) -- Line: 336 -- upvalues: OnCharacterAdded (upval), p1 (val), u2 (val)
        OnCharacterAdded(p1, a1, u2)
    end)
    v1 = u102[u2]
    v1._characterRemoving = p1.CharacterRemoving:Connect(OnCharacterRemoving)
end)
Character.CharacterRemoved:Connect(function(p1, p2) -- Line: 342 -- upvalues: OnCharacterRemoving (val)
    OnCharacterRemoving(p2)
end)
Character.CharacterAdded:Connect(function(p1, p2) -- Line: 346 -- upvalues: Config (val), Grid (val)
    if not Config.DISABLE_DEFAULT_REPLICATION then
        Grid.AddEntity(p2, "player")
    end
end)
Players.PlayerRemoving:Connect(function(p1) -- Line: 352 -- upvalues: u96 (val), u102 (val), u106 (val), Grid (val), u104 (val), ReturnID (val)
    local v1 = u96[p1]
    if v1 then
        local _characterAdded = u102[v1]._characterAdded
        if _characterAdded then
            _characterAdded:Disconnect()
        end
        local _characterRemoving = u102[v1]._characterRemoving
        if _characterRemoving then
            _characterRemoving:Disconnect()
        end
        if u106[v1] then
            Grid.RemoveEntity(u106[v1])
            pcall(workspace.Destroy, u106[v1])
            u106[v1] = nil
        end
        u102[v1] = nil
        u104[v1] = nil
        u96[p1] = nil
        ReturnID(v1)
    end
end)
UnreliableRemoteEvent_2.OnServerEvent:Connect(function(p1, p2) -- Line: 379 -- upvalues: u96 (val), u81 (ref), Config (val), u97 (ref), UnpackSnapshotData (val), u102 (val), VelocityAt (val), u104 (val)
    local Latest, v1, v2, v3, v4
    local v5 = u96[p1]
    if not Config.SEND_FULL_ROTATION then
        v3 = 20
    else
        v3 = 24
    end
    u81 = v3
    v3 = u97[p1]
    if not v3 then
        v3 = {}
    end
    local v6 = 0
    local v7 = buffer.len(p2)
    local v8 = v7 // u81
    local v9 = 1
    local v10 = p2
    for i = 1, v8, v9 do
        v7 = UnpackSnapshotData(v10, v6)
        v6 = v6 + u81
        v4 = v7.id - 1
        if v4 == -1 then
            v4 = v5
        end
        v2 = u102[v4]
        if v2 then
            if v4 == v5 then
                v2.clientLastTick = v7.timestamp
                if v2.serverOwned then
                    v2.latestCFrame = v7.cframe
                    v2.latestT = v7.timestamp
                elseif v2.snapshot then
                    Latest = v2.snapshot:GetLatest()
                    v2.snapshot:Push(v7.timestamp, v7.cframe, VelocityAt(Latest, v7.timestamp, v7.cframe))
                end
                u104[v4] = 0
            elseif not (v3[v4]) then
            end
        end
    end
    local Character = v1.Character
    local PrimaryPart = Character
    if PrimaryPart then
        PrimaryPart = Character.PrimaryPart
    end
    if Config.DISABLE_DEFAULT_REPLICATION and PrimaryPart then
        PrimaryPart.Anchored = true
    end
end)
RemoteEvent.OnServerEvent:Connect(function(p1) -- Line: 429
    local Character = p1.Character
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
    end
    if not Humanoid then
        if Character and Character:FindFirstChild("Health") then
            Character:FindFirstChild("Health"):Destroy()
        end
        if Humanoid then
            Humanoid.Health = 0
            Humanoid.Health = 10
            Humanoid.Health = 0
        end
        return
    elseif Humanoid.BreakJointsOnDeath then
        return
    end
end)
local function UpdateTick(p1, p2) -- Line: 471 -- upvalues: Server (val)
    Server.TickRateChanged.FireAll({id = p1, tickRate = p2})
end
local function GetTickInterval(p1, p2) -- Line: 478 -- upvalues: u102 (val), GetNpcConfig (val), Config (val), u106 (val), Grid (val), u105 (val), UpdateTick (val)
    local v1 = u102[p2]
    if not v1 then
        local v2, v3, v4
        local TICK_RATE = Config.TICK_RATE
        if not p1 then
            return TICK_RATE
        end
        if not Config.DISABLE_DEFAULT_REPLICATION then
            v2 = p1
        else
            v2 = u106[p2]
        end
        local v5 = Grid.GetNearbyEntities(v2, Config.PROXIMITY, {"player"})
        if not Config.DISABLE_DEFAULT_REPLICATION then
            v3 = 50
        else
            v3 = 4
        end
        if 1 >= #v5 then
            v4 = TICK_RATE * v3
        else
            v4 = TICK_RATE
        end
        if v4 ~= u105[p2] then
            u105[p2] = v4
            UpdateTick(p2, v4)
        end
        return v4
    elseif v1.serverOwned then
        return GetNpcConfig(v1.npcType).TICK_RATE
    end
end
function Flush(p1, p2) -- Line: 503 -- upvalues: u84 (val), u81 (ref), UnreliableRemoteEvent (val), Flush (val)
    local v1
    local v2 = math.min(#p1, u84)
    if v2 == 0 then
        return false
    end
    local v3 = buffer.create(v2 * u81)
    local v4 = 0
    local v5 = v2
    local v6 = 1
    for i = 1, v5, v6 do
        v1 = table.remove(p1)
        buffer.copy(v3, v4, v1, 0, u81)
        v4 = v4 + u81
    end
    if not p2 then
        UnreliableRemoteEvent:FireAllClients(v3)
    else
        UnreliableRemoteEvent:FireClient(p2, v3)
    end
    Flush(p1, p2)
    return true
end
RunService.PostSimulation:Connect(function(p1) -- Line: 529 -- upvalues: Grid (val), u94 (val), u102 (val), GetCharacter (val), GetTickInterval (val), u104 (val), ENABLE_CUSTOM_CHARACTERS (val), Config (val), u81 (ref), PackSnapshotData (val), Flush (val), u97 (ref), u106 (val)
    local Latest, PrimaryPart, SEND_IDLE_PLAYER_SNAPSHOTS, clientLastTick, filterPlayers, filterPlayers_2, lastCFrame, latestCFrame, latestCFrame_2, model, player, replicationRule, replicationRule_2, snapshot, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, value
    Grid.UpdateGrid()
    debug.profilebegin("ReplicateNPCs")
    local Players = game:GetService("Players"):GetPlayers()
    local v16 = {}
    local v17 = Players
    local v18 = nil
    local v19 = nil
    for i, j in v17, v18, v19 do
        v16[j] = {}
    end
    v17 = {}
    v19 = #u94
    v18 = 0 < v19
    v19 = u102
    local v20 = nil
    local v21 = nil
    for k, n in v19, v20, v21 do
        player = n.player
        if player then
            player = GetCharacter(n.player)
        end
        v2 = n.serverOwned == true
        if v2 then
            model = player
            if not model then
                model = n.model
            end
            v3 = GetTickInterval(model, k)
            v4 = os.clock()
            v5 = v4 - u104[k] < v3
            if not v5 then
                if not v5 then
                    u104[k] = v4
                end
                if not v2 then
                    snapshot = n.snapshot
                    if snapshot then
                        snapshot = n.snapshot:GetLatest()
                    end
                    if snapshot then
                        value = snapshot.value
                    elseif player and player.PrimaryPart then
                        value = player.PrimaryPart.CFrame
                        lastCFrame = n.lastCFrame
                        if not lastCFrame then
                            lastCFrame = CFrame.identity
                        end
                        v6 = true
                        v7 = vector.magnitude(lastCFrame.Position - value.Position)
                        if 0.05 > v7 then
                            v6 = not lastCFrame.Rotation:FuzzyEq(value.Rotation, 0.0001)
                        end
                        n.lastCFrame = value
                        if ENABLE_CUSTOM_CHARACTERS and player and player.PrimaryPart then
                            player.PrimaryPart.CFrame = value
                        end
                        clientLastTick = v4
                        if n.clientLastTick then
                            clientLastTick = n.clientLastTick
                        elseif not n.clientLastTick and n.networkOwner then
                            clientLastTick = 1
                        end
                        if v6 then
                            SEND_IDLE_PLAYER_SNAPSHOTS = not v5
                        else
                            SEND_IDLE_PLAYER_SNAPSHOTS = not v2
                            if SEND_IDLE_PLAYER_SNAPSHOTS then
                                SEND_IDLE_PLAYER_SNAPSHOTS = Config.SEND_IDLE_PLAYER_SNAPSHOTS
                                if not SEND_IDLE_PLAYER_SNAPSHOTS then end
                            end
                        end
                        if SEND_IDLE_PLAYER_SNAPSHOTS then
                            v8 = buffer.create(u81)
                            PackSnapshotData(v8, 0, clientLastTick, value, k)
                            replicationRule_2 = n.replicationRule
                            if not replicationRule_2 then
                                table.insert(v17, v8)
                            elseif #replicationRule_2.filterPlayers ~= 0 then
                                if replicationRule_2.filterType ~= "include" then
                                    v10 = {}
                                    filterPlayers_2 = replicationRule_2.filterPlayers
                                    v12 = nil
                                    v13 = nil
                                    for m, i5 in filterPlayers_2, v12, v13 do
                                        v10[i5] = true
                                    end
                                    v11 = v16
                                    v12 = nil
                                    v13 = nil
                                    for i6, i7 in v11, v12, v13 do
                                        if not (v10[i6]) then
                                            table.insert(i7, v8)
                                        end
                                    end
                                else
                                    v10 = {}
                                    filterPlayers = replicationRule_2.filterPlayers
                                    v12 = nil
                                    v13 = nil
                                    for i8, i9 in filterPlayers, v12, v13 do
                                        if not (v10[i9]) and v16[i9] then
                                            v10[i9] = true
                                            table.insert(v16[i9], v8)
                                        end
                                    end
                                end
                            elseif replicationRule_2.filterType ~= "exclude" then
                            end
                        elseif v18 then
                            v8 = u94
                            v9 = nil
                            v10 = nil
                            for i10, i11 in v8, v9, v10 do
                                replicationRule = n.replicationRule
                                if not replicationRule then
                                    v14 = v16[i11]
                                    if v14 then
                                        v15 = buffer.create(u81)
                                        PackSnapshotData(v15, 0, clientLastTick, value, k)
                                        table.insert(v14, v15)
                                    end
                                elseif replicationRule.filterType ~= "exclude" then
                                    if replicationRule.filterType == "include" and not (table.find(replicationRule.filterPlayers, i11)) then end
                                elseif not (table.find(replicationRule.filterPlayers, i11)) then
                                end
                            end
                        end
                    end
                else
                    latestCFrame_2 = n.latestCFrame
                    if latestCFrame_2 then
                        value = latestCFrame_2
                    elseif n.model then
                        value = n.model:GetPivot()
                    end
                end
            elseif not v18 then
            end
        elseif player and player.PrimaryPart and not n.clientLastTick then
        end
    end
    table.clear(u94)
    debug.profileend()
    debug.profilebegin("FlushNPCs")
    Flush(v17)
    debug.profileend()
    debug.profilebegin("FlushPlayers")
    v19 = v16
    v20 = nil
    v21 = nil
    for i12, i13 in v19, v20, v21 do
        Flush(i13, i12)
    end
    debug.profileend()
    debug.profilebegin("Move Client Npcs")
    v19 = u97
    v20 = nil
    v21 = nil
    for i14, i15 in v19, v20, v21 do
        v1 = i15
        v2 = nil
        v3 = nil
        for i16, i17 in v1, v2, v3 do
            v5 = u102[i16]
            if v5 and v5.model and v5.model.PrimaryPart then
                latestCFrame = v5.latestCFrame
                if latestCFrame then
                    v5.model.PrimaryPart.CFrame = latestCFrame
                end
            end
        end
    end
    debug.profileend()
    if not Config.DISABLE_DEFAULT_REPLICATION then
        return
    end
    v19 = u106
    v20 = nil
    v21 = nil
    for i18, i19 in v19, v20, v21 do
        v1 = u102[i18]
        PrimaryPart = i19.PrimaryPart
        if v1 and v1.snapshot and PrimaryPart then
            Latest = v1.snapshot:GetLatest()
            if Latest then
                PrimaryPart.CFrame = Latest.value
            end
        end
    end
end)
return {
    _newPlayers = u94,
    idMap = u102,
    Replicators = u106,
    GetReplicationRule = function(p1) -- Line: 209 -- upvalues: GetIdFrom (val), NewReplicationRule (val), u102 (val)
        local v1 = GetIdFrom(p1)
        if not v1 or not (u102[v1]) then
            return NewReplicationRule()
        end
        if not (u102[v1].replicationRule) then
            local v2 = u102[v1]
            v2.replicationRule = NewReplicationRule()
        end
        return u102[v1].replicationRule
    end,
    SetReplicationRule = function(p1, p2) -- Line: 227 -- upvalues: GetIdFrom (val), u102 (val)
        local v1 = GetIdFrom(p1)
        if not v1 then
            warn("ID not found for input", p1)
            return
        end
        local v2 = u102[v1]
        if not v2 then
            warn("Data not found for ID", v1)
            return
        end
        v2.replicationRule = p2
    end,
    GetId = GetIdFrom,
    GetLatestCFrame = function(p1) -- Line: 716 -- upvalues: GetIdFrom (val), u102 (val)
        local v1 = GetIdFrom(p1)
        if not v1 then
            return nil
        end
        local v2 = u102[v1]
        if not v2 then
            return nil
        end
        if v2.serverOwned then
            return v2.latestCFrame
        end
        local snapshot = v2.snapshot
        local Latest = snapshot
        if Latest then
            Latest = snapshot:GetLatest()
        end
        if Latest then
            return Latest.value
        end
        return nil
    end,
    GetLatestTime = function(p1) -- Line: 743 -- upvalues: GetIdFrom (val), u102 (val)
        local v1 = GetIdFrom(p1)
        if not v1 then
            return nil
        end
        local v2 = u102[v1]
        if not v2 then
            return nil
        end
        if v2.serverOwned then
            return v2.latestT
        end
        local snapshot = v2.snapshot
        local Latest = snapshot
        if Latest then
            Latest = snapshot:GetLatest()
        end
        if Latest then
            return Latest.t
        end
        return nil
    end,
    RegisterNPC = function(p1, p2) -- Line: 767 -- upvalues: GetNextID (val), GetNpcConfig (val), u102 (val), u104 (val), u105 (val), UpdateTick (val)
        local identity
        local v1 = GetNextID()
        local v2 = GetNpcConfig(p2)
        local v3 = os.clock()
        identity = if p1 then p1:GetPivot() else CFrame.identity
        u102[v1] = {
            serverOwned = true,
            clientLastTick = v3,
            npcType = p2 or "DEFAULT",
            model = p1,
            latestCFrame = identity,
            latestT = v3,
        }
        u104[v1] = 0
        u105[v1] = v2.TICK_RATE
        UpdateTick(v1, u105[v1])
        if p1 then
            p1:SetAttribute("NPC_ID", v1)
            if p2 ~= "DEFAULT" then
                p1:SetAttribute("NPC_TYPE", p2)
            end
        end
        return v1
    end,
    UnregisterNPC = function(p1) -- Line: 806 -- upvalues: u102 (val), u104 (val), u105 (val), ReturnID (val)
        local v1 = u102[p1]
        if not v1 then
            return
        end
        u102[p1] = nil
        u104[p1] = nil
        u105[p1] = nil
        ReturnID(p1)
        return v1.model
    end,
    PushNPCTransform = function(p1, p2, p3) -- Line: 821 -- upvalues: GetIdFrom (val), u102 (val)
        local huge = GetIdFrom(p1)
        if not huge then
            huge = math.huge
        end
        local v1 = u102[huge]
        if v1 and v1.serverOwned then
            local v2 = p3
            if not v2 then
                v2 = os.clock()
            end
            v1.latestCFrame = p2
            v1.latestT = v2
            v1.clientLastTick = v2
        end
    end,
    TogglePlayerReplication = function(p1, p2) -- Line: 449 -- upvalues: u96 (val), u103 (val), Server (val)
        local v1 = u96[p1]
        if not v1 then
            warn("TogglePlayerReplication: Player not found in idMap")
            return
        end
        if p2 then
            u103[v1] = nil
            Server.TogglePlayerReplication.FireAll({on = true, id = v1})
            return
        end
        u103[v1] = true
        Server.TogglePlayerReplication.FireAll({on = false, id = v1})
    end,
    GetAllNetworkIds = function() -- Line: 852 -- upvalues: u102 (val)
        local v1 = {}
        local v2 = u102
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, i)
        end
        return v1
    end,
}