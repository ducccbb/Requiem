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
--                File: ReplicatedStorage.Common.Chrono.Client.Replicate
--                               Dumped in 0.00388 seconds
--                          Bytecode version 9  |  31 functions

local Flush, identity, u83
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Alive = require(u0.Parent.Parent.Parent:WaitForChild("Alive"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Character = require(u0.Parent.Parent.Shared.Character)
local Config = require(u0.Parent.Parent.Shared.Config)
local Client = require(u0.Parent.Parent.Events.Client)
local InterpolationBuffer = require(u0.Parent.InterpolationBuffer)
local InterpolationMath = require(u0.Parent.Parent.Shared.InterpolationMath)
local MakeNetworkable = require(u0.Parent.Parent.Shared.MakeNetworkable)
local RenderCache = require(u0.Parent.RenderCache)
local Snapshots = require(u0.Parent.Parent.Shared.Snapshots)
local ENABLE_CUSTOM_CHARACTERS = Config.ENABLE_CUSTOM_CHARACTERS
if not Config.SEND_FULL_ROTATION then
    u83 = 20
else
    u83 = 24
end
local u86 = 898 // u83
local u87 = {}
local ClientReplicateCFrame = ReplicatedStorage:WaitForChild("ClientReplicateCFrame")
local ServerReplicateCFrame = ReplicatedStorage:WaitForChild("ServerReplicateCFrame")
local DeathEvent = ReplicatedStorage:WaitForChild("DeathEvent")
local u101 = {}
local u102 = {}
local u103 = nil
task.defer(function() -- Line: 56 -- upvalues: u0 (val), u103 (ref)
    u103 = require(u0.Parent.Parent.Shared.NpcRegistry)._ClientOwners
end)
local u108 = {}
local LocalPlayer = Players.LocalPlayer
local u111 = {}
local u112 = {}
local u113 = {}
local u120 = InterpolationBuffer(Config.MIN_BUFFER, Config.MAX_BUFFER, 0.1)
RenderCache.Init({playerTickRates = u112, bufferTracker = u120})
local function GetCharacter(p1) -- Line: 73 -- upvalues: ENABLE_CUSTOM_CHARACTERS (val), Character (val), Alive (val)
    if ENABLE_CUSTOM_CHARACTERS then
        return Character.GetCharacter(p1)
    end
    return Alive.getAliveCharacter(p1)
end
local function WaitForCharacter(p1) -- Line: 81 -- upvalues: ENABLE_CUSTOM_CHARACTERS (val), Character (val), Alive (val)
    local v1, v2
    if not ENABLE_CUSTOM_CHARACTERS then
        return Alive.awaitCharacterAdded(p1)
    end
    while true do
        v1, v2 = Character.CharacterAdded:Wait()
        if v1 == p1 then
            break
        end
    end
    return v2
end
local u133 = (function() -- Line: 95 -- upvalues: Config (val), InterpolationMath (val)
    if Config.LINEAR_ONLY_INTERPOLATION then
        return InterpolationMath.Linear
    end
    if Config.USE_HYBRID_INTERPOLATION then
        return InterpolationMath.HybridHermite
    end
    return InterpolationMath.Hermite
end)()
local VelocityAt = InterpolationMath.VelocityAt
local function UnpackSnapshotData(p1, p2) -- Line: 108 -- upvalues: Config (val), MakeNetworkable (val)
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
local function PackSnapshotData(p1, p2, p3, p4, p5) -- Line: 143 -- upvalues: Config (val), MakeNetworkable (val)
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
function Flush() -- Line: 168 -- upvalues: u87 (val), u86 (val), u83 (val), PackSnapshotData (val), ClientReplicateCFrame (val), Flush (val)
    local v1
    local v2 = #u87
    local v3 = math.min(v2, u86)
    if v3 == 0 then
        return false
    end
    v2 = 0
    local v4 = buffer.create(v3 * u83)
    local v5 = v3
    local v6 = 1
    for i = 1, v5, v6 do
        v1 = u87[#u87]
        u87[#u87] = nil
        PackSnapshotData(v4, v2, v1.timestamp, v1.cframe, v1.id)
        v2 = v2 + u83
    end
    ClientReplicateCFrame:FireServer(v4)
    Flush()
    return true
end
local function NewCharacter(p1) -- Line: 229 -- upvalues: GetCharacter (val), WaitForCharacter (val), u111 (val), Config (val), DeathEvent (val)
    local identity
    local player = p1.player
    if not player then
        return
    end
    local u14 = GetCharacter(player)
    if not u14 then
        u14 = WaitForCharacter(player)
    end
    if not u14.Parent then
        u14 = WaitForCharacter(player)
    end
    local v1 = u111[player]
    if v1 and v1 ~= u14 then
        pcall(v1.Destroy, v1)
    end
    local PrimaryPart = u14.PrimaryPart
    task.spawn(function() -- Line: 247 -- upvalues: Config (upval), PrimaryPart (ref), u14 (ref), player (val), DeathEvent (upval)
        if not Config.DISABLE_DEFAULT_REPLICATION then
            return
        end
        if not PrimaryPart then
            task.wait(1)
            PrimaryPart = u14.PrimaryPart
        end
        if not PrimaryPart then
            warn("Player has no primary part", player, u14)
            return
        end
        PrimaryPart.Anchored = false
        local PropertyChangedSignal = PrimaryPart:GetPropertyChangedSignal("Anchored")
        PropertyChangedSignal:Connect(function() -- Line: 261 -- upvalues: PrimaryPart (upval)
            PrimaryPart.Anchored = false
        end)
        local Humanoid = u14:FindFirstChild("Humanoid")
        if not Humanoid then
            return
        end
        Humanoid.Died:Connect(function() -- Line: 270 -- upvalues: DeathEvent (upval)
            DeathEvent:FireServer()
        end)
    end)
    u111[player] = u14
    identity = if u111[player] and u111[player].PrimaryPart then u111[player].PrimaryPart.CFrame else CFrame.identity
    p1.character = u14
    p1.lastCFrame = identity
end
local function PlayerAdded(p1, p2) -- Line: 287 -- upvalues: Snapshots (val), u133 (val), u108 (val), u101 (val), RenderCache (val), ENABLE_CUSTOM_CHARACTERS (val), NewCharacter (val)
    local v1 = Snapshots(u133)
    u108[p1] = p2
    u101[p2] = {player = p1, snapshot = v1, lastCFrame = CFrame.identity}
    RenderCache.Add(p2)
    if not ENABLE_CUSTOM_CHARACTERS then
        local v2 = u101[p2]
        v2._characterAdded = p1.CharacterAdded:Connect(function(p1) -- Line: 300 -- upvalues: NewCharacter (upval), u101 (upval), p2 (val)
            NewCharacter(u101[p2])
        end)
    end
    NewCharacter(u101[p2])
end
Client.InitializePlayer.On(function(p1) -- Line: 308 -- upvalues: Alive (val), PlayerAdded (val)
    local v1 = Alive.getPlayerByNames()[p1.player]
    if v1 then
        PlayerAdded(v1, p1.id)
    end
end)
Client.InitializeExistingPlayers.On(function(p1) -- Line: 316 -- upvalues: Alive (val), PlayerAdded (val)
    local v1
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = Alive.getPlayerByNames()[j.player]
        if v1 then
            PlayerAdded(v1, j.id)
        end
    end
end)
local u154 = os.clock()
Client.TickRateChanged.On(function(p1) -- Line: 328 -- upvalues: u112 (val)
    u112[p1.id] = p1.tickRate
end)
Client.TogglePlayerReplication.On(function(p1) -- Line: 332 -- upvalues: u113 (val)
    if p1.on then
        u113[p1.id] = nil
        return
    end
    u113[p1.id] = true
end)
local function HandleReplicatedData(p1, p2) -- Line: 340 -- upvalues: u101 (val), u120 (val), u112 (val), Config (val), RenderCache (val), VelocityAt (val)
    local Latest, TICK_RATE, v1, v2, v3, v4, v5
    local v6 = p1
    local v7 = nil
    local v8 = nil
    v1, v2 = p1, p2
    for i, j in v6, v7, v8 do
        if u101[i] and not (u101[i].isNPC) then
            TICK_RATE = u112[i]
            if not TICK_RATE then
                TICK_RATE = Config.TICK_RATE
            end
            u120.RegisterPacket(i, j, TICK_RATE)
        end
    end
    RenderCache.OnSnapshotUpdate(v1)
    v6 = v2
    v7 = nil
    v8 = nil
    for k, n in v6, v7, v8 do
        v4 = u101[k]
        v5 = RenderCache.GetTargetRenderTime(k)
        if v4 then
            if v4.isNPC and v4.npcType and not v5 then
                RenderCache.Add(k, true, v4.npcType)
            end
            Latest = v4.snapshot:GetLatest()
            if Latest then
                v3 = v1[k] - Latest.t
                if v3 < 5 and v5 then
                    v3 = math.abs(v5 - Latest.t)
                    if 5 < v3 then
                        v4.snapshot:Clear()
                        warn("Clearing Snapshot due to large time difference during ownership changes")
                    end
                end
            end
            v4.snapshot:Push(v1[k], n, VelocityAt(Latest, v1[k], n))
        end
    end
end
ServerReplicateCFrame.OnClientEvent:Connect(function(p1) -- Line: 370 -- upvalues: u83 (val), UnpackSnapshotData (val), u101 (val), u102 (val), HandleReplicatedData (val)
    local id, v1
    local v2 = {}
    local v3 = {}
    local v4 = buffer.len(p1)
    local v5 = 0
    v4 = v4 // u83
    local v6 = 1
    local v7 = p1
    for i = 1, v4, v6 do
        v1 = UnpackSnapshotData(v7, v5)
        v5 = v5 + u83
        id = v1.id
        if u101[id] then
            v2[id] = v1.cframe
            v3[id] = v1.timestamp
        elseif not (u102[id]) then
            u102[id] = {timestamp = v1.timestamp, cframe = v1.cframe, clock = os.clock()}
        elseif v1.timestamp < u102[id].timestamp then
        end
    end
    HandleReplicatedData(v3, v2)
end)
RunService.PreRender:Connect(function(p1) -- Line: 394 -- upvalues: RenderCache (val), u101 (val), GetCharacter (val), LocalPlayer (val), u113 (val), u103 (ref)
    local At, Latest, PrimaryPart, v1
    RenderCache.Update(p1)
    debug.profilebegin("Calculate CFrames")
    local v2 = u101
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.character and j.character ~= GetCharacter(LocalPlayer) and not (u113[i]) then
            PrimaryPart = j.character.PrimaryPart
            if PrimaryPart then
                debug.profilebegin("Get Target CFrame")
                v1 = RenderCache.GetTargetRenderTime(i)
                At = j.snapshot:GetAt(v1)
                debug.profileend()
                if not (u103[i]) then
                    if not (u103[i]) then
                        debug.profilebegin("Prepare CFrame")
                        if At then
                            PrimaryPart.CFrame = At
                        end
                        debug.profileend()
                    else
                        Latest = j.snapshot:GetLatest()
                        if Latest then
                            At = Latest.value
                            j.initializedCFrame = true
                        end
                    end
                elseif j.initializedCFrame then
                end
            end
        end
    end
    debug.profileend()
end)
local function CheckCFrameChanges(p1, p2) -- Line: 439
    local v1 = if 0.05 > (p2.Position - p1.Position).Magnitude then not p2.Rotation:FuzzyEq(p1.Rotation, 0.0001) else true
    return v1
end
identity = CFrame.identity
local function HandleNpcs() -- Line: 447 -- upvalues: Config (val), u103 (ref), u101 (val), CheckCFrameChanges (val), u87 (val)
    local CFrame, PrimaryPart, lastCFrame, v1
    local v2 = os.clock()
    local NPC_TYPES = Config.NPC_TYPES
    local v3 = u103
    local v4 = nil
    local v5 = nil
    for i in v3, v4, v5 do
        v1 = u101[i]
        if v1 and v1.snapshot:GetLatest() and (v2 - (v1.lastSent or 0) >= NPC_TYPES[v1.npcType or "DEFAULT"].TICK_RATE) then
            v1.lastSent = v2
            if v1.character then
                PrimaryPart = v1.character.PrimaryPart
                if PrimaryPart then
                    CFrame = PrimaryPart.CFrame
                    lastCFrame = v1.lastCFrame
                    if not lastCFrame then
                        lastCFrame = CFrame.identity
                    end
                    if CheckCFrameChanges(CFrame, lastCFrame) then
                        v1.lastCFrame = CFrame
                        table.insert(u87, {timestamp = os.clock(), cframe = CFrame, id = i + 1})
                    end
                end
            end
        end
    end
end
local function HandleCharacter() -- Line: 489 -- upvalues: u154 (ref), u112 (val), Config (val), GetCharacter (val), LocalPlayer (val), CheckCFrameChanges (val), identity (ref), u87 (val)
    local TICK_RATE = u112[300]
    if not TICK_RATE then
        TICK_RATE = Config.TICK_RATE
    end
    if os.clock() - u154 < TICK_RATE then
        return
    end
    u154 = os.clock()
    local v1 = GetCharacter(LocalPlayer)
    if not v1 then
        return
    end
    local PrimaryPart = v1.PrimaryPart
    if not PrimaryPart then
        return
    end
    local CFrame = PrimaryPart.CFrame
    identity = CFrame
    if CheckCFrameChanges(CFrame, identity) then
        table.insert(u87, {id = 0, timestamp = os.clock(), cframe = CFrame})
        return
    end
    if not Config.SEND_IDLE_PLAYER_SNAPSHOTS then
        return
    end
    table.insert(u87, {id = 0, timestamp = os.clock(), cframe = CFrame})
end
local function HandleAwaitingSnapshots() -- Line: 523 -- upvalues: u102 (val), u101 (val), HandleReplicatedData (val)
    local v1, v2, v3
    local v4 = os.clock()
    local v5 = u102
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v1 = v4 - j.clock
        if v1 >= 2 then
            u102[i] = nil
        elseif u101[i] then
            v2 = {}
            v2[i] = j.timestamp
            v3 = {}
            v3[i] = j.cframe
            HandleReplicatedData(v2, v3)
            u102[i] = nil
        end
    end
end
RunService.PostSimulation:Connect(function() -- Line: 537 -- upvalues: HandleAwaitingSnapshots (val), HandleCharacter (val), HandleNpcs (val), Flush (val)
    HandleAwaitingSnapshots()
    HandleCharacter()
    HandleNpcs()
    Flush()
end)
Alive.PlayerRemoving:Connect(function(p1) -- Line: 544 -- upvalues: u108 (val), RenderCache (val), u101 (val), u111 (val)
    local v1
    local v2 = u108[p1]
    u108[p1] = nil
    if v2 then
        RenderCache.Remove(v2)
        v1 = u101[v2]
        if v1 and v1._characterAdded then
            v1._characterAdded:Disconnect()
        end
        u101[v2] = nil
    end
    v1 = u111[p1]
    u111[p1] = nil
    if v1 then
        pcall(v1.Destroy, v1)
    end
end)
Character.CharacterAdded:Connect(function(p1, p2) -- Line: 565 -- upvalues: u108 (val), u101 (val), u111 (val)
    local v1 = u108[p1]
    if not v1 then
        return
    end
    local v2 = u101[v1]
    if not v2 then
        return
    end
    if v2.character then
        p2:PivotTo(v2.character:GetPivot())
    end
    v2.character = p2
    u111[p1] = p2
end)
return {
    idMap = u101,
    playerTickRates = u112,
    BufferTracker = u120,
    RegisterClientNPC = function(p1, p2, p3) -- Line: 189 -- upvalues: u101 (val), Snapshots (val), u133 (val), RenderCache (val), u103 (ref), VelocityAt (val)
        local v1
        if u101[p1] then
            v1 = p3
        else
            v1 = p3 or "DEFAULT"
            u101[p1] = {isNPC = true, snapshot = Snapshots(u133), npcType = v1}
            RenderCache.Add(p1, true, v1)
        end
        if u103[p1] and u103[p1] ~= true then
            local v2 = os.clock()
            local Latest = u101[p1].snapshot:GetLatest()
            local v3 = VelocityAt(Latest, v2, u103[p1])
            u101[p1].snapshot:Push(v2, u103[p1], v3)
            u103[p1] = true
        end
        u101[p1].character = p2
        if v1 then
            u101[p1].npcType = v1
        end
    end,
    UnregisterNPC = function(p1) -- Line: 217 -- upvalues: u101 (val), u120 (val)
        local v1 = u101[p1]
        if not v1 then
            return nil
        end
        u120.Remove(p1)
        u101[p1] = nil
        return v1.character
    end,
    GetAllNetworkIds = function() -- Line: 589 -- upvalues: u101 (val)
        local v1 = {}
        local v2 = u101
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, i)
        end
        return v1
    end,
}