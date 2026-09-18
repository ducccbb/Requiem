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
--                        File: ReplicatedStorage.Common.Network
--                               Dumped in 0.0128 seconds
--                         Bytecode version 9  |  137 functions

local OnServerEvent, broadcast, broadcastToExcept, compressStorePayload, decompressStorePayload, post, publish, send, sendClientAllStores, sendClientUpdatedStore, slice, summarizePayloadForDebug, u77, u78, unreliableBroadcast, unreliablePost, unreliableSend
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Promise = require(v1.Parent:WaitForChild("Promise"))
local Utilities = v1.Parent:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local Utilities_2 = v1.Parent:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local Network = require(v1.Parent:WaitForChild("Logger"))("Network")
local u66 = 0.002
local u67 = {}
local u68 = {}
local function isSlowCallbackTrackingEnabled() -- Line: 53 -- upvalues: RunService (val)
    local __NETWORK_SLOW_CALLBACK_TRACKING__ = _G.__NETWORK_SLOW_CALLBACK_TRACKING__
    if __NETWORK_SLOW_CALLBACK_TRACKING__ == nil then
        return RunService:IsStudio()
    end
    local v1 = __NETWORK_SLOW_CALLBACK_TRACKING__ == true
    return v1
end
local function isServerToClientTrafficRecordingEnabled() -- Line: 61
    local __NETWORK_TRAFFIC_RECORDING__ = _G.__NETWORK_TRAFFIC_RECORDING__
    if __NETWORK_TRAFFIC_RECORDING__ == nil then
        return false
    end
    local v1 = __NETWORK_TRAFFIC_RECORDING__ == true
    return v1
end
local function recordSlowCallback(p1, p2) -- Line: 69 -- upvalues: u66 (ref), u67 (val), u68 (val)
    if p2 < u66 then
        return
    end
    local v1 = u67[p1]
    if not v1 then
        u67[p1] = {count = 0, totalSeconds = 0, maxSeconds = 0, lastAt = 0}
    end
    v1.count = v1.count + 1
    v1.totalSeconds = v1.totalSeconds + p2
    v1.maxSeconds = math.max(v1.maxSeconds, p2)
    v1.lastAt = os.clock()
    local v2 = os.clock()
    local v3 = u68[p1]
    if not v3 then
        u68[p1] = v2
        print((("[Network] Slow callback: %* took %*ms"):format(p1, (string.format("%.2f", p2 * 1000)))))
        return
    end
    if v2 - v3 < 1 then
        return
    end
    u68[p1] = v2
    print((("[Network] Slow callback: %* took %*ms"):format(p1, (string.format("%.2f", p2 * 1000)))))
end
local function trackSlowCallback(p1, p2) -- Line: 94 -- upvalues: isSlowCallbackTrackingEnabled (val), recordSlowCallback (val)
    if not (isSlowCallbackTrackingEnabled()) then
        p2()
        return
    end
    p2()
    recordSlowCallback(p1, os.clock() - os.clock())
end
local function trackSlowCallbackInvoke(p1, p2, ...) -- Line: 105 -- upvalues: isSlowCallbackTrackingEnabled (val), recordSlowCallback (val)
    if not (isSlowCallbackTrackingEnabled()) then
        p2(...)
        return
    end
    p2(...)
    recordSlowCallback(p1, os.clock() - os.clock())
end
local u74 = false
u77, u78 = (function() -- Line: 235 -- upvalues: Promise (val)
    local u0
    return Promise.new(function(p1) -- Line: 237 -- upvalues: u0 (ref)
        u0 = p1
    end), nil
end)()
local u80 = Signal.new()
local v3 = {
    string = {__type = "string"},
    number = function(p1) -- Line: 267
        return {__type = "number", __numType = p1}
    end,
    array = function(p1) -- Line: 271
        return {__type = "array", __arrayType = p1}
    end,
    map = function(p1, p2) -- Line: 275
        return {__type = "map", __keyType = p1, __valueType = p2}
    end,
    boolean = {__type = "boolean"},
    union = function(...) -- Line: 281
        return {
            __type = "union",
            __types = {...},
        }
    end,
    CFrame = {__type = "CFrame"},
    any = {__type = "any"},
}
local v4 = {Retrieve = 0, Update = 1, Create = 2, RetrieveChunk = 3}
local v5 = {Server = "Server", Client = "Client"}
local u92 = {}
local u93 = {}
local u94 = {}
local u95 = {}
local function formatCallbackLabel(p1, p2, p3, p4) -- Line: 310 -- upvalues: u95 (val)
    local v1 = tostring(p3)
    local v2 = u95[v1]
    local v3 = ("%*.%*:%*"):format(p1, p2, v1)
    if v2 then
        v3 = ("%*@%*"):format(v3, v2)
    end
    if p4 then
        v3 = ("%*#%*"):format(v3, p4)
    end
    return v3
end
local u97 = {}
local u98 = {}
local u99 = {}
local u100 = {Event = {}, State = {}, Store = {}}
local u104 = 0
local u105 = false
local u106 = 0
local u107 = {totalPayloadBytes = 0, totalEffectiveBytes = 0, sendCount = 0}
local u108 = {}
local u109 = {}
local u110 = nil
function compressStorePayload(p1, p2) -- Line: 350 -- upvalues: u109 (val), u110 (ref)
    local v1
    debug.profilebegin((("Network.compressStorePayload:%*"):format((tostring(p1)))))
    local v2 = u109[p1]
    if not v2 then
        if u110 then
            if not u110.compress then
                debug.profileend()
                return p2
            end
            v1 = u110.compress(p2)
            debug.profileend()
            return v1
        end
        debug.profileend()
        return p2
    end
    if v2.compress then
        v1 = v2.compress(p2)
        debug.profileend()
        return v1
    end
    if not u110 or not u110.compress then
        debug.profileend()
        return p2
    end
    v1 = u110.compress(p2)
    debug.profileend()
    return v1
end
function decompressStorePayload(p1, p2) -- Line: 367 -- upvalues: u109 (val), u110 (ref)
    local v1
    debug.profilebegin((("Network.decompressStorePayload:%*"):format((tostring(p1)))))
    local v2 = u109[p1]
    if not v2 then
        if u110 then
            if not u110.decompress then
                debug.profileend()
                return p2
            end
            v1 = u110.decompress(p2)
            debug.profileend()
            return v1
        end
        debug.profileend()
        return p2
    end
    if v2.decompress then
        v1 = v2.decompress(p2)
        debug.profileend()
        return v1
    end
    if not u110 or not u110.decompress then
        debug.profileend()
        return p2
    end
    v1 = u110.decompress(p2)
    debug.profileend()
    return v1
end
local function isEnvironment(p1) -- Line: 397 -- upvalues: RunService (val)
    local v1 = RunService:IsServer()
    if not v1 then
        if not v1 then
            if p1 == "Client" then
                return true
            end
            return false
        end
        return false
    end
    if p1 == "Server" then
        return true
    end
    if v1 then
        return false
    end
    if p1 == "Client" then
        return true
    end
    return false
end
local function _hash(p1) -- Line: 467 -- upvalues: u92 (val), Network (val)
    local v1, v2
    if u92[p1] then
        return u92[p1]
    end
    local function hashString(p1, p2) -- Line: 477
        local v1 = 2166136261
        if p2 then
            v1 = bit32.bxor(v1, p2) % 4294967296
        end
        local v2 = #p1
        local v3 = 1
        for i = 1, v2, v3 do
            v1 = bit32.bxor(v1, p1:byte(i)) % 4294967296 * 16777619 % 4294967296
        end
        if 2147483648 <= v1 then
            v1 = v1 - 4294967296
        end
        return v1
    end
    local function checkForCollision(p1) -- Line: 507 -- upvalues: u92 (upval)
        for k, v in pairs(u92) do
            if v == p1 then
                return true
            end
        end
        return false
    end
    v1 = hashString(p1)
    v2 = 1
    while checkForCollision(v1) do
        if v2 >= 100 then
            break
        end
        v1 = hashString(p1, v2)
        v2 = v2 + 1
    end
    if checkForCollision(v1) then
        Network.warn((("Hash collision detected for \"%*\" after %* attempts. Hash: %*"):format(p1, v2, v1)))
    end
    u92[p1] = v1
    return v1
end
local u120 = (function() -- Line: 411 -- upvalues: isEnvironment (val), ReplicatedStorage (val), RunService (val)
    local RemoteEvent
    if isEnvironment("Server") then
        RemoteEvent = ReplicatedStorage:FindFirstChild("RemoteEvent")
        if RemoteEvent then
            RemoteEvent:Destroy()
        end
        return Instance.new("RemoteEvent")
    end
    if not (RunService:IsStudio()) or RunService:IsRunning() or ReplicatedStorage:FindFirstChild("RemoteEvent") then
        return (ReplicatedStorage:WaitForChild("RemoteEvent"))
    end
    return Instance.new("RemoteEvent")
end)()
u120.Parent = ReplicatedStorage
local u122 = (function() -- Line: 436 -- upvalues: isEnvironment (val), ReplicatedStorage (val), RunService (val)
    local UnsafeRemoteEvent
    if isEnvironment("Server") then
        UnsafeRemoteEvent = ReplicatedStorage:FindFirstChild("UnsafeRemoteEvent")
        if UnsafeRemoteEvent then
            UnsafeRemoteEvent:Destroy()
        end
        local RemoteEvent = Instance.new("RemoteEvent")
        RemoteEvent.Name = "UnsafeRemoteEvent"
        return RemoteEvent
    end
    if not (RunService:IsStudio()) or RunService:IsRunning() or ReplicatedStorage:FindFirstChild("UnsafeRemoteEvent") then
        return (ReplicatedStorage:WaitForChild("UnsafeRemoteEvent"))
    end
    local RemoteEvent_2 = Instance.new("RemoteEvent")
    RemoteEvent_2.Name = "UnsafeRemoteEvent"
    return RemoteEvent_2
end)()
u122.Parent = ReplicatedStorage
local function estimatePayloadBytes(...) -- Line: 552
    local estimate, v1
    local u0 = {}
    function estimate(p1) -- Line: 554 -- upvalues: u0 (val), estimate (val)
        local v1
        if p1 == nil then
            return 0
        end
        local v2 = typeof(p1)
        if v2 == "string" then
            return #p1
        end
        if v2 == "number" then
            return 8
        end
        if v2 == "boolean" then
            return 1
        end
        if v2 == "Instance" then
            return 4
        end
        if v2 == "Vector3" then
            return 12
        end
        if v2 == "Vector2" then
            return 8
        end
        if v2 == "CFrame" then
            return 96
        end
        if v2 == "Color3" then
            return 12
        end
        if v2 == "UDim2" or v2 == "Rect" then
            return 32
        end
        if v2 == "EnumItem" or v2 == "BrickColor" then
            return 4
        end
        if v2 == "buffer" then
            return buffer.len(p1)
        end
        if v2 ~= "table" or u0[p1] then
            return 0
        end
        u0[p1] = true
        local v3 = 0
        for k, v in pairs(p1) do
            v1 = estimate(k)
            v3 = v3 + (v1 + estimate(v))
        end
        return v3
    end
    v1 = 0
    local v2 = select("#", ...)
    local v3 = 1
    for i = 1, v2, v3 do
        v1 = v1 + estimate(select(i, ...))
    end
    return v1
end
local function getPayloadWireBytes(p1, p2) -- Line: 620 -- upvalues: estimatePayloadBytes (val)
    if type(p2) ~= "table" or not p2.__compressed then
        return estimatePayloadBytes(p1, p2)
    end
    if typeof(p2.__full) == "buffer" then
        return buffer.len(p2.__full)
    end
    return estimatePayloadBytes(p1, p2)
end
local function formatBytes(p1) -- Line: 627
    if 1048576 <= p1 then
        return string.format("%.2f MiB", p1 / 1048576)
    end
    if 1024 <= p1 then
        return string.format("%.2f KiB", p1 / 1024)
    end
    return string.format("%d B", p1)
end
function summarizePayloadForDebug(p1, p2, p3, p4, p5) -- Line: 641 -- upvalues: summarizePayloadForDebug (val)
    local v1, v2, v3, v4, v5, v6, v7
    if p1 == nil then
        return "nil"
    end
    local v8 = typeof(p1)
    if v8 == "string" then
        if p4 >= #p1 then
            return string.format("%q", p1)
        end
        local v9 = p1:sub(1, p4)
        return string.format("%q... (#%d)", v9, #p1)
    end
    if v8 == "number" or v8 == "boolean" then
        return (tostring(p1))
    end
    if v8 == "Instance" then
        return string.format("Instance(%s Name=%q)", p1.ClassName, p1.Name or "")
    end
    if v8 ~= "table" then
        return (tostring(p1))
    end
    if p5[p1] then
        return "{ ... }"
    end
    p5[p1] = true
    if p2 <= 0 then
        v7 = 0
        for k2 in pairs(p1) do
            v7 = v7 + 1
        end
        return string.format("{ ... } (%d keys)", v7)
    end
    v7 = {}
    local v10 = 0
    v4, v5, v6, v1 = p3, p4, p5, p2
    for k, v in pairs(p1) do
        if v4 <= v10 then
            table.insert(v7, "...")
            break
        end
        if type(k) ~= "string" then
            v2 = "[" .. summarizePayloadForDebug(k, 0, 1, v5, v6) .. "]"
        else
            v2 = tostring(k)
        end
        v3 = summarizePayloadForDebug(v, v1 - 1, v4, v5, v6)
        table.insert(v7, v2 .. " = " .. v3)
        v10 = v10 + 1
    end
    return "{ " .. table.concat(v7, ", ") .. " }"
end
local function pruneRollingWindow(p1) -- Line: 694 -- upvalues: u99 (val)
    local v1
    local v2 = p1 - 60
    local v3 = 0
    local v4 = #u99
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = u99[i]
        if v2 <= v1.t then
            v3 = v3 + 1
            if v3 ~= i then
                u99[v3] = v1
            end
        end
    end
    v4 = #u99
    v5 = 1
    for j = v3 + 1, v4, v5 do
        u99[j] = nil
    end
end
local function scheduleRollingWindowPrune() -- Line: 711 -- upvalues: u105 (ref), pruneRollingWindow (val)
    if u105 then
        return
    end
    u105 = true
    task.defer(function() -- Line: 716 -- upvalues: u105 (upval), pruneRollingWindow (upval)
        u105 = false
        pruneRollingWindow(tick())
    end)
end
local function accumulateBatchServerToClientRecord(p1, p2) -- Line: 737 -- upvalues: isServerToClientTrafficRecordingEnabled (val), u106 (ref), u107 (val)
    if not (isServerToClientTrafficRecordingEnabled()) or u106 <= 0 then
        return false
    end
    local v1 = u107
    v1.totalPayloadBytes = v1.totalPayloadBytes + p1
    v1 = u107
    v1.totalEffectiveBytes = v1.totalEffectiveBytes + p1 * math.max(1, p2)
    v1 = u107
    v1.sendCount = v1.sendCount + 1
    return true
end
local function recordServerToClientSend(p1, p2, p3, p4, p5, p6) -- Line: 756 -- upvalues: RunService (val), isServerToClientTrafficRecordingEnabled (val), u95 (val), u97 (val), u98 (val), Network (val), formatBytes (val), summarizePayloadForDebug (val), u99 (val), u104 (ref), scheduleRollingWindowPrune (val), u100 (val)
    local callCount, totalEffectiveBytes, totalPayloadBytes, v1
    if not (RunService:IsServer()) or not (isServerToClientTrafficRecordingEnabled()) then
        return
    end
    if not p6 then
        totalEffectiveBytes = p3 * math.max(1, p4)
    else
        totalEffectiveBytes = p6.totalEffectiveBytes
    end
    if not p6 then
        totalPayloadBytes = p3
    else
        totalPayloadBytes = p6.totalPayloadBytes
    end
    if not p6 then
        callCount = 1
    else
        callCount = p6.callCount
    end
    local v2 = tick()
    if 5120 <= p3 then
        local v3
        v1 = nil
        if p1 == "Event" then
            v1 = u95[p2]
        elseif p1 == "Store" then
            v1 = u97[tostring(p2)]
        elseif p1 == "State" then
            v1 = u98[p2]
        end
        if not v1 then
            v3 = ""
        else
            v3 = " (source: " .. v1 .. ")"
        end
        local v4 = formatBytes(p3)
        local v5 = tostring(p2)
        local v6 = formatBytes(totalEffectiveBytes)
        Network.warn((("Large payload sent: %* | %* %* | %* recipient(s), %* effective%*"):format(v4, p1, v5, p4, v6, v3)))
        if p5 ~= nil and not (RunService:IsStudio()) then
            local v7, v8
            v7, v8 = pcall(summarizePayloadForDebug, p5, 3, 20, 120, {})
            if not v7 then
                print("[Network] Large payload contents: (failed to summarize)")
            elseif v8 then
                print("[Network] Large payload contents:", v8)
            end
        end
    end
    table.insert(u99, {
        t = v2,
        sourceType = p1,
        sourceId = p2,
        bytes = p3,
        recipientCount = p4,
        effectiveBytes = totalEffectiveBytes,
    })
    u104 = u104 + 1
    if 100 <= u104 then
        u104 = 0
        scheduleRollingWindowPrune()
    end
    if not (u100[p1][p2]) then
        v1 = u100[p1]
        v1[p2] = {totalBytes = 0, totalEffectiveBytes = 0, callCount = 0}
    end
    v1 = u100[p1][p2]
    v1.totalBytes = v1.totalBytes + totalPayloadBytes
    v1.totalEffectiveBytes = v1.totalEffectiveBytes + totalEffectiveBytes
    v1.callCount = v1.callCount + callCount
end
local function recordEventSend(p1, p2, ...) -- Line: 838 -- upvalues: isServerToClientTrafficRecordingEnabled (val), estimatePayloadBytes (val), accumulateBatchServerToClientRecord (val), recordServerToClientSend (val)
    if not (isServerToClientTrafficRecordingEnabled()) then
        return
    end
    local v1 = estimatePayloadBytes(p1, ...)
    if accumulateBatchServerToClientRecord(v1, p2) then
        return
    end
    local v2 = if 5120 <= v1 then {...} else nil
    recordServerToClientSend("Event", p1, v1, p2, v2)
end
function post(p1) -- Line: 906 -- upvalues: u120 (val)
    return function(...) -- Line: 907 -- upvalues: p1 (val), u120 (upval)
        debug.profilebegin((("Network.post:%*"):format(p1.seed)))
        u120:FireServer(p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function unreliablePost(p1) -- Line: 924 -- upvalues: u122 (val)
    return function(...) -- Line: 925 -- upvalues: p1 (val), u122 (upval)
        debug.profilebegin((("Network.unreliablePost:%*"):format(p1.seed)))
        u122:FireServer(p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function send(p1) -- Line: 941 -- upvalues: recordEventSend (val), u120 (val)
    return function(a1, ...) -- Line: 942 -- upvalues: p1 (val), recordEventSend (upval), u120 (upval)
        debug.profilebegin((("Network.send:%*"):format(p1.seed)))
        recordEventSend(p1.seed, 1, ...)
        u120:FireClient(a1, p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function unreliableSend(p1) -- Line: 960 -- upvalues: recordEventSend (val), u122 (val)
    return function(a1, ...) -- Line: 961 -- upvalues: p1 (val), recordEventSend (upval), u122 (upval)
        debug.profilebegin((("Network.unreliableSend:%*"):format(p1.seed)))
        recordEventSend(p1.seed, 1, ...)
        u122:FireClient(a1, p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function broadcast(p1) -- Line: 978 -- upvalues: recordEventSend (val), Players (val), u120 (val)
    return function(...) -- Line: 979 -- upvalues: p1 (val), recordEventSend (upval), Players (upval), u120 (upval)
        debug.profilebegin((("Network.broadcast:%*"):format(p1.seed)))
        local v1 = #Players:GetPlayers()
        recordEventSend(p1.seed, v1, ...)
        u120:FireAllClients(p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function unreliableBroadcast(p1) -- Line: 994 -- upvalues: recordEventSend (val), Players (val), u122 (val)
    return function(...) -- Line: 995 -- upvalues: p1 (val), recordEventSend (upval), Players (upval), u122 (upval)
        debug.profilebegin((("Network.unreliableBroadcast:%*"):format(p1.seed)))
        local v1 = #Players:GetPlayers()
        recordEventSend(p1.seed, v1, ...)
        u122:FireAllClients(p1.seed, ...)
        debug.profileend()
        return p1
    end
end
function broadcastToExcept(p1) -- Line: 1013 -- upvalues: Players (val), recordEventSend (val), u120 (val)
    return function(a1, ...) -- Line: 1014 -- upvalues: p1 (val), Players (upval), recordEventSend (upval), u120 (upval)
        debug.profilebegin((("Network.broadcastToExcept:%*"):format(p1.seed)))
        local v1 = 0
        for i, v in ipairs(Players:GetPlayers()) do
            if not (table.find(a1, v)) then
                v1 = v1 + 1
            end
        end
        recordEventSend(p1.seed, v1, ...)
        for i2, i3 in ipairs(Players:GetPlayers()) do
            if not (table.find(a1, i3)) then
                u120:FireClient(i3, p1.seed, ...)
            end
        end
        debug.profileend()
        return p1
    end
end
function publish(p1) -- Line: 1049 -- upvalues: isServerToClientTrafficRecordingEnabled (val), estimatePayloadBytes (val), recordServerToClientSend (val), Players (val), u120 (val)
    return function(p1) -- Line: 1050 -- upvalues: isServerToClientTrafficRecordingEnabled (upval), estimatePayloadBytes (upval), recordServerToClientSend (upval), Players (upval), u120 (upval)
        local v1
        debug.profilebegin((("Network.publish:%*"):format(p1.seed)))
        if p1.isGlobal then
            if isServerToClientTrafficRecordingEnabled() then
                v1 = estimatePayloadBytes(true, p1.seed, p1.current)
                local v2 = #Players:GetPlayers()
                recordServerToClientSend("State", p1.seed, v1, v2, p1.current)
            end
            u120:FireAllClients(true, p1.seed, p1.current)
            debug.profileend()
            return p1
        end
        if isServerToClientTrafficRecordingEnabled() then
            v1 = estimatePayloadBytes(true, p1.seed, p1.current)
            recordServerToClientSend("State", p1.seed, v1, #p1.listeners, p1.current)
        end
        for i, v in ipairs(p1.listeners) do
            u120:FireClient(v, true, p1.seed, p1.current)
        end
        debug.profileend()
        return p1
    end
end
local u142 = {}
local u144 = {}
local u145 = {}
local u146 = {}
local u147 = {}
local u148 = {}
local u149 = {}
local u150 = {}
local u151 = 0
local u152 = {}
local function isStoreObserverDebugEnabled() -- Line: 1185 -- upvalues: RunService (val)
    local v1
    local __STORE_OBSERVER_DEBUG__ = _G.__STORE_OBSERVER_DEBUG__
    if __STORE_OBSERVER_DEBUG__ ~= nil then
        v1 = __STORE_OBSERVER_DEBUG__ == true
        return v1
    end
    v1 = if _G.__NETWORK_SLOW_CALLBACK_TRACKING__ ~= true then RunService:IsStudio() else true
    return v1
end
local function formatStoreLabel(p1) -- Line: 1193 -- upvalues: u97 (val)
    local v1 = tostring(p1)
    local v2 = u97[v1]
    if v2 then
        return (("store:%*@%*"):format(v1, v2))
    end
    return (("store:%*"):format(v1))
end
local function recordStoreObserverNotify(p1, p2, p3) -- Line: 1202 -- upvalues: u149 (val), u151 (ref), u152 (val), u150 (val)
    local v1 = u149[p1]
    if not v1 then
        u149[p1] = {
            count = 0,
            totalSeconds = 0,
            maxSeconds = 0,
            lastAt = 0,
            observerCount = 0,
        }
    end
    v1.count = v1.count + 1
    v1.totalSeconds = v1.totalSeconds + p3
    v1.maxSeconds = math.max(v1.maxSeconds, p3)
    v1.observerCount = math.max(v1.observerCount, p2)
    v1.lastAt = os.clock()
    u151 = u151 + 1
    u152[p1] = (u152[p1] or 0) + 1
    if p3 < 0.002 then
        return
    end
    local v2 = os.clock()
    local v3 = u150[p1]
    if not v3 then
        u150[p1] = v2
        print((("[Network] Slow store observers: %* (%* observers) took %*ms"):format(p1, p2, (string.format("%.2f", p3 * 1000)))))
        return
    end
    if v2 - v3 < 1 then
        return
    end
    u150[p1] = v2
    print((("[Network] Slow store observers: %* (%* observers) took %*ms"):format(p1, p2, (string.format("%.2f", p3 * 1000)))))
end
local function notifyStoreObservers(p1) -- Line: 1233 -- upvalues: u146 (val), isStoreObserverDebugEnabled (val), formatStoreLabel (val), recordStoreObserverNotify (val)
    local v1
    local v2 = u146[p1]
    if not v2 then
        return
    end
    if not (isStoreObserverDebugEnabled()) then
        for k2, i in pairs(v2) do
            if i then
                i()
            end
        end
        return
    end
    local v3 = formatStoreLabel(p1)
    local v4 = 0
    local v5 = os.clock()
    for k, v in pairs(v2) do
        if v then
            v4 = v4 + 1
            v()
            v1 = os.clock() - os.clock()
            if 0.002 <= v1 then
                print((("[Network] Slow store observer: %*#%* took %*ms"):format(v3, k, (string.format("%.2f", v1 * 1000)))))
            end
        end
    end
    recordStoreObserverNotify(v3, v4, os.clock() - v5)
end
if RunService:IsClient() then
    RunService.PostSimulation:Connect(function() -- Line: 1270 -- upvalues: isStoreObserverDebugEnabled (val), u151 (ref), u152 (val)
        if not (isStoreObserverDebugEnabled()) or u151 == 0 then
            return
        end
        if 3 <= u151 then
            print((("[Network] Frame had %* store observer flushes:"):format(u151)))
            for k, v in pairs(u152) do
                print((("  %*x %*"):format(v, k)))
            end
        end
        u151 = 0
        table.clear(u152)
    end)
end
local function mergeRetrieveResults(p1) -- Line: 1290 -- upvalues: Players (val), decompressStorePayload (val), u145 (val), notifyStoreObservers (val)
    local v1, v2, v3
    local v4 = {}
    for k, v in pairs(p1) do
        v2 = v[1]
        v3 = decompressStorePayload(v2, v[2])
        v1 = u145[v2]
        if v1 then
            v1.current[Players.LocalPlayer] = v3
            notifyStoreObservers(v2)
        else
            table.insert(v4, {seed = v2, value = v3})
        end
    end
    return v4
end
local function finishRetrieveSync(p1) -- Line: 1317 -- upvalues: Network (val), u145 (val), Players (val), notifyStoreObservers (val), u78 (val), u74 (ref)
    if 0 < #p1 then
        task.spawn(function() -- Line: 1319 -- upvalues: Network (upval), p1 (val), u145 (upval), Players (upval), notifyStoreObservers (upval), u78 (upval), u74 (upval)
            local v1, v2, v3
            local v4 = 0
            local v5 = #p1
            Network.warn((("Waiting for pending stores %* %*"):format(v5, p1)))
            while true do
                v1 = #p1
                if 0 >= v1 or v4 >= 50 then
                    break
                end
                task.wait(0.1)
                v4 = v4 + 1
                v1 = 1
                v2 = -1
                for i = #p1, v1, v2 do
                    v5 = p1[i]
                    v3 = u145[v5.seed]
                    if v3 then
                        v3.current[Players.LocalPlayer] = v5.value
                        table.remove(p1, i)
                        notifyStoreObservers(v5.seed)
                    end
                end
            end
            v1 = #p1
            if 0 < v1 then
                Network.warn((("Failed to sync all stores. Missing stores: %*"):format(p1)))
            end
            task.delay(1.5, function() -- Line: 1345 -- upvalues: u78 (upval), u74 (upval)
                u78()
                u74 = true
            end)
        end)
        return
    end
    task.delay(1.5, function() -- Line: 1351 -- upvalues: u78 (upval), u74 (upval)
        u78()
        u74 = true
    end)
end
local function onClientReceivedAllStores(p1) -- Line: 1361 -- upvalues: mergeRetrieveResults (val), finishRetrieveSync (val)
    local v1 = mergeRetrieveResults(p1)
    finishRetrieveSync(v1)
end
local function onClientUpdatedStorage(p1) -- Line: 1367 -- upvalues: decompressStorePayload (val), u145 (val), Network (val), Players (val), Table (val), isStoreObserverDebugEnabled (val), formatStoreLabel (val), notifyStoreObservers (val)
    local v1
    local v2 = p1[1]
    local v3 = decompressStorePayload(v2, p1[2])
    local v4 = u145[v2]
    if not v4 then
        Network.warn((("Received update for unregistered store: %*"):format(v2)))
        return
    end
    if v3.__full ~= nil then
        v4.current[Players.LocalPlayer] = Table.normalizeTableKeys(v3.__full)
    elseif v3.__patch == nil then
        v4.current[Players.LocalPlayer] = v3
    else
        local v5
        v1 = v4.current[Players.LocalPlayer]
        if type(v1) ~= "table" then
            v5 = {}
        else
            v5 = Table.copy(v1)
        end
        local __removed = v3.__removed
        if not __removed then
            __removed = {}
        end
        Table.applyObjectPatch(v5, v3.__patch, __removed)
        v4.current[Players.LocalPlayer] = v5
    end
    if isStoreObserverDebugEnabled() then
        if v3.__full ~= nil then
            v1 = "full"
        elseif v3.__patch == nil then
            v1 = "legacy"
        else
            v1 = "patch"
        end
        local v6 = formatStoreLabel(v2)
        print((("[Network] Store update: %* (%*)"):format(v6, v1)))
    end
    notifyStoreObservers(v2)
end
function sendClientAllStores(p1, p2, p3) -- Line: 1404 -- upvalues: Network (val), sendClientAllStores (val), u148 (val), u144 (val), u108 (val), compressStorePayload (val), getPayloadWireBytes (val), isServerToClientTrafficRecordingEnabled (val), estimatePayloadBytes (val), recordServerToClientSend (val), u120 (val), Players (val), u80 (val)
    local Name, u46, v1, v2
    local u3 = p2 or 0
    local u4 = p3 or 0.5
    local function onRetrySendingSlices() -- Line: 1408 -- upvalues: u3 (ref), Network (upval), p1 (val), u4 (ref), sendClientAllStores (upval)
        if 3 < u3 then
            Network.warn((("No slices found for %* waiting half a second and retrying, attempt %*"):format(p1.Name, u3)))
        end
        task.delay(u4, function() -- Line: 1413 -- upvalues: sendClientAllStores (upval), p1 (upval), u3 (upval), u4 (upval)
            sendClientAllStores(p1, u3 + 1, u4 * 2)
        end)
    end
    if not (u148[p1]) then
        u46 = u144[p1]
        if not u46 then
            onRetrySendingSlices()
            return
        end
        if #u46 < 30 then
            v2 = #u46
            Name = p1.Name
            Network.warn((("Expected %* slices, but found %* for %*"):format(30, v2, Name)))
            onRetrySendingSlices()
            return
        end
        task.defer(function() -- Line: 1452 -- upvalues: u108 (upval), u46 (val), Network (upval), p1 (val), compressStorePayload (upval), getPayloadWireBytes (upval), isServerToClientTrafficRecordingEnabled (upval), estimatePayloadBytes (upval), recordServerToClientSend (upval), u120 (upval), Players (upval), u80 (upval)
            local v1, v2
            table.clear(u108)
            local v3 = {}
            local v4 = {}
            for i, v in ipairs(u46) do
                if not (v4[v.store]) then
                    v4[v.store] = true
                    v2 = compressStorePayload(v.store, v.value)
                    u108[v.store] = getPayloadWireBytes(v.store, v2)
                    table.insert(v3, {v.store, v2})
                else
                    Network.warn((("Duplicate slice detected for player %* with store ID %*"):format(p1.Name, v.store)))
                end
            end
            local v5 = 7 < #v3
            if not v5 then
                if isServerToClientTrafficRecordingEnabled() then
                    v1 = estimatePayloadBytes(0, v3)
                    recordServerToClientSend("Store", "Retrieve", v1, 1, v3)
                end
                u120:FireClient(p1, 0, v3)
            else
                local v6, v7, v8, v9, v10
                v1 = math.ceil(#v3 / 7)
                local v11 = v1
                local v12 = 1
                for i2 = 1, v11, v12 do
                    v2 = (i2 - 1) * 7 + 1
                    v9 = math.min(i2 * 7, #v3)
                    v10 = table.create(v9 - v2 + 1)
                    v6 = v9
                    v7 = 1
                    for j = v2, v6, v7 do
                        v10[j - v2 + 1] = v3[j]
                    end
                    if isServerToClientTrafficRecordingEnabled() then
                        v6 = estimatePayloadBytes(3, i2, v1, v10)
                        v8 = ("RetrieveChunk(%d/%d)"):format(i2, v1)
                        recordServerToClientSend("Store", v8, v6, 1, v10)
                    end
                    u120:FireClient(p1, 3, i2, v1, v10)
                    if i2 < v1 then
                        task.wait()
                    end
                end
            end
            if p1.Parent == Players then
                u80:FireDeferred(p1)
            end
        end)
        return
    end
    v1 = false
    for k, v in pairs(u148[p1]) do
        if v then
            v1 = true
            break
        end
    end
    if v1 then
        if 3 < u3 then
            local Name_2 = p1.Name
            Network.warn((("Waiting for slice creation locks to release for %*, attempt %*"):format(Name_2, u3)))
        end
        onRetrySendingSlices()
        return
    end
    u46 = u144[p1]
    if not u46 then
        onRetrySendingSlices()
        return
    end
    if #u46 >= 30 then
        task.defer(function() -- Line: 1452 -- upvalues: u108 (upval), u46 (val), Network (upval), p1 (val), compressStorePayload (upval), getPayloadWireBytes (upval), isServerToClientTrafficRecordingEnabled (upval), estimatePayloadBytes (upval), recordServerToClientSend (upval), u120 (upval), Players (upval), u80 (upval)
            local v1, v2
            table.clear(u108)
            local v3 = {}
            local v4 = {}
            for i, v in ipairs(u46) do
                if not (v4[v.store]) then
                    v4[v.store] = true
                    v2 = compressStorePayload(v.store, v.value)
                    u108[v.store] = getPayloadWireBytes(v.store, v2)
                    table.insert(v3, {v.store, v2})
                else
                    Network.warn((("Duplicate slice detected for player %* with store ID %*"):format(p1.Name, v.store)))
                end
            end
            local v5 = 7 < #v3
            if not v5 then
                if isServerToClientTrafficRecordingEnabled() then
                    v1 = estimatePayloadBytes(0, v3)
                    recordServerToClientSend("Store", "Retrieve", v1, 1, v3)
                end
                u120:FireClient(p1, 0, v3)
            else
                local v6, v7, v8, v9, v10
                v1 = math.ceil(#v3 / 7)
                local v11 = v1
                local v12 = 1
                for i2 = 1, v11, v12 do
                    v2 = (i2 - 1) * 7 + 1
                    v9 = math.min(i2 * 7, #v3)
                    v10 = table.create(v9 - v2 + 1)
                    v6 = v9
                    v7 = 1
                    for j = v2, v6, v7 do
                        v10[j - v2 + 1] = v3[j]
                    end
                    if isServerToClientTrafficRecordingEnabled() then
                        v6 = estimatePayloadBytes(3, i2, v1, v10)
                        v8 = ("RetrieveChunk(%d/%d)"):format(i2, v1)
                        recordServerToClientSend("Store", v8, v6, 1, v10)
                    end
                    u120:FireClient(p1, 3, i2, v1, v10)
                    if i2 < v1 then
                        task.wait()
                    end
                end
            end
            if p1.Parent == Players then
                u80:FireDeferred(p1)
            end
        end)
        return
    end
    v2 = #u46
    Name = p1.Name
    Network.warn((("Expected %* slices, but found %* for %*"):format(30, v2, Name)))
    onRetrySendingSlices()
end
function sendClientUpdatedStore(p1, p2) -- Line: 1511 -- upvalues: sendClientUpdatedStore (val), u147 (val), Table (val), u93 (val), compressStorePayload (val), isServerToClientTrafficRecordingEnabled (val), estimatePayloadBytes (val), recordServerToClientSend (val), u120 (val), u146 (val)
    if not p2 then
        return
    end
    if not (p2.current[p1]) then
        task.delay(1, function() -- Line: 1519 -- upvalues: sendClientUpdatedStore (upval), p1 (val), p2 (val)
            sendClientUpdatedStore(p1, p2)
        end)
        return
    end
    if not (u147[p1]) then
        u147[p1] = {}
    end
    local value = p2.current[p1].value
    local v1 = u147[p1]
    local v2 = v1[p2.seed]
    if v2 == nil then
        if v2 ~= nil then
            local v3, v4
            v3, v4 = Table.computeObjectDiff(value, v2)
            if next(v3) ~= nil then
                v1 = {__patch = v3, __removed = v4}
                if not p2.deferred then
                    v1 = compressStorePayload(p2.seed, v1)
                    if isServerToClientTrafficRecordingEnabled() then
                        v3 = estimatePayloadBytes(1, {p2.seed, v1})
                        recordServerToClientSend("Store", p2.seed, v3, 1, v1)
                    end
                    u120:FireClient(p1, 1, {p2.seed, v1})
                    v3 = u147[p1]
                    v3[p2.seed] = Table.copy(value)
                else
                    local seed
                    if not (u93[p1]) then
                        u93[p1] = {}
                    end
                    v4 = u93[p1]
                    if v4[p2.seed] then
                        task.cancel(u93[p1][p2.seed])
                    end
                    v3 = u93[p1]
                    v3[p2.seed] = task.defer(function() -- Line: 1564 -- upvalues: p2 (val), p1 (val), u147 (upval), Table (upval), u93 (upval), compressStorePayload (upval), isServerToClientTrafficRecordingEnabled (upval), estimatePayloadBytes (upval), recordServerToClientSend (upval), u120 (upval)
                        local v1
                        local value = p2.current[p1].value
                        local v2 = u147[p1]
                        if v2 then
                            v2 = u147[p1][p2.seed]
                        end
                        if v2 ~= nil then
                            local v3, v4
                            v3, v4 = Table.computeObjectDiff(value, v2)
                            if next(v3) ~= nil then
                                v1 = compressStorePayload(p2.seed, {__patch = v3, __removed = v4})
                                if isServerToClientTrafficRecordingEnabled() then
                                    v3 = estimatePayloadBytes(1, {p2.seed, v1})
                                    recordServerToClientSend("Store", p2.seed, v3, 1, v1)
                                end
                                u120:FireClient(p1, 1, {p2.seed, v1})
                                v3 = u93[p1]
                                v3[p2.seed] = nil
                                if u147[p1] then
                                    v3 = u147[p1]
                                    v3[p2.seed] = Table.copy(value)
                                end
                                return
                            elseif #v4 == 0 then
                                local v5 = u93[p1]
                                v5[p2.seed] = nil
                                return
                            end
                        else
                            v1 = {__full = value}
                        end
                    end)
                end
                v3 = u146[p2.seed]
                if v3 then
                    for i, v in ipairs(v3) do
                        v(p2.current[p1].value)
                    end
                end
                return
            elseif #v4 == 0 then
                return
            end
        else
            v1 = {__full = value}
        end
    elseif Table.equals(value, v2) then
        return
    end
end
local function getSliceByStoreId(p1, p2) -- Line: 1617 -- upvalues: u144 (val)
    local v1 = u144[p1]
    if not v1 then
        return nil
    end
    for i, v in ipairs(v1) do
        if v.store == p2 then
            return v
        end
    end
    return nil
end
function slice(p1, p2, p3, p4, p5) -- Line: 1640 -- upvalues: u148 (val), Network (val), getSliceByStoreId (val), sendClientUpdatedStore (val), u145 (val), RunService (val), u74 (ref), u77 (val), Table (val), u144 (val)
    local v1
    local u5 = nil
    local v2 = typeof(p2) == "table"
    assert(v2, "Initial value must be a table.")
    if not (u148[p1]) then
        u148[p1] = {}
    end
    local v3 = 0
    while u148[p1][p4] do
        if v3 >= 100 then
            break
        end
        task.wait(0.1)
        v3 = v3 + 1
    end
    if 100 <= v3 then
        local Name = p1.Name
        Network.warn((("Slice creation lock timeout for player %* store %*"):format(Name, p4)))
    end
    v2 = u148[p1]
    v2[p4] = true
    v2 = getSliceByStoreId(p1, p4)
    if v2 then
        v2.value = p2
        v2.structure = p3
        v2.deferred = p5
        v1 = u148[p1]
        v1[p4] = nil
        sendClientUpdatedStore(p1, u145[p4])
        return v2
    end
    u5 = {
        value = p2,
        structure = p3,
        store = p4,
        deferred = p5,
        get = function(p1) -- Line: 1693 -- upvalues: RunService (upval), u74 (upval), u77 (upval), u5 (ref)
            if RunService:IsClient() and not u74 then
                u77:await()
            end
            return u5.value[p1]
        end,
        refresh = function() -- Line: 1701 -- upvalues: sendClientUpdatedStore (upval), p1 (val), u145 (upval), u5 (ref)
            sendClientUpdatedStore(p1, u145[u5.store])
        end,
        merge = function(...) -- Line: 1710 -- upvalues: getSliceByStoreId (upval), p1 (val), u5 (ref), Table (upval), sendClientUpdatedStore (upval), u145 (upval)
            local v1 = {...}
            local v2 = getSliceByStoreId(p1, u5.store)
            if v2 ~= u5 then
                return u5
            end
            for k, v in pairs(v1) do
                u5.value = Table.merge(u5.value, v)
            end
            sendClientUpdatedStore(p1, u145[u5.store])
            return u5
        end,
        delete = function(a1) -- Line: 1740 -- upvalues: u5 (ref), sendClientUpdatedStore (upval), p1 (val), u145 (upval)
            u5.value[a1] = nil
            sendClientUpdatedStore(p1, u145[u5.store])
            return u5
        end,
        update = function(a1) -- Line: 1751 -- upvalues: getSliceByStoreId (upval), p1 (val), u5 (ref), sendClientUpdatedStore (upval), u145 (upval)
            local v1 = getSliceByStoreId(p1, u5.store)
            if v1 ~= u5 then
                return u5
            end
            u5.value = a1
            sendClientUpdatedStore(p1, u145[u5.store])
            return u5
        end,
        set = function(a1, p2) -- Line: 1770 -- upvalues: getSliceByStoreId (upval), p1 (val), u5 (ref), sendClientUpdatedStore (upval), u145 (upval)
            local v1 = getSliceByStoreId(p1, u5.store)
            if v1 ~= u5 then
                return u5
            end
            u5.value[a1] = p2
            sendClientUpdatedStore(p1, u145[u5.store])
            return u5
        end,
        path = function() -- Line: 1792
            return {}
        end,
        keys = function() -- Line: 1800 -- upvalues: u5 (ref)
            local v1 = typeof(u5.value) == "table"
            assert(v1, "Value must be a table to get keys.")
            local v2 = {}
            for k, v in pairs(u5.value) do
                table.insert(v2, k)
            end
            return v2
        end,
        entries = function() -- Line: 1815 -- upvalues: u5 (ref)
            local v1 = typeof(u5.value) == "table"
            assert(v1, "Value must be a table to get entries.")
            local v2 = {}
            for k, v in pairs(u5.value) do
                table.insert(v2, {k, v})
            end
            return v2
        end,
        values = function() -- Line: 1830 -- upvalues: u5 (ref)
            local v1 = typeof(u5.value) == "table"
            assert(v1, "Value must be a table to get values.")
            local v2 = {}
            for k, v in pairs(u5.value) do
                table.insert(v2, v)
            end
            return v2
        end,
        push = function(a1) -- Line: 1846 -- upvalues: u5 (ref), sendClientUpdatedStore (upval), p1 (val), u145 (upval)
            local v1 = typeof(u5.value) == "table"
            assert(v1, "Value must be a table to push.")
            table.insert(u5.value, a1)
            sendClientUpdatedStore(p1, u145[u5.store])
            return #u5.value
        end,
        remove = function(a1) -- Line: 1860 -- upvalues: u5 (ref), sendClientUpdatedStore (upval), p1 (val), u145 (upval)
            local v1 = typeof(u5.value) == "table"
            assert(v1, "Value must be a table to remove.")
            if typeof(a1) ~= "number" then
                u5.value[a1] = nil
            else
                table.remove(u5.value, a1)
                local v2 = {}
                for k, v in pairs(u5.value) do
                    table.insert(v2, v)
                    u5.value[k] = nil
                end
                for k2, i in pairs(v2) do
                    u5.value[k2] = i
                end
            end
            sendClientUpdatedStore(p1, u145[u5.store])
            return u5
        end,
    }
    if not (u144[p1]) then
        u144[p1] = {}
    end
    table.insert(u144[p1], u5)
    v1 = u148[p1]
    v1[p4] = nil
    return u5
end
if not (isEnvironment("Client")) then
    u120.OnServerEvent:Connect(function(p1, ...) -- Line: 2191 -- upvalues: trackSlowCallback (val), trackSlowCallbackInvoke (val), sendClientAllStores (val), u94 (val), u142 (val), formatCallbackLabel (val)
        local u1 = {...}
        local v1 = ("server.reliable.dispatch:%*"):format(p1.Name)
        trackSlowCallback(v1, function() -- Line: 2193 -- upvalues: u1 (val), trackSlowCallbackInvoke (upval), p1 (val), sendClientAllStores (upval), u94 (upval), u142 (upval), formatCallbackLabel (upval)
            local v1, v2
            if #u1 == 0 then
                v1 = ("server.reliable.InitialSync:%*"):format(p1.Name)
                trackSlowCallbackInvoke(v1, sendClientAllStores, p1)
                return
            end
            local v3 = u1[1]
            for i, v in ipairs(u94) do
                v2 = ("server.reliable.middleware#%*"):format(i)
                trackSlowCallbackInvoke(v2, v, p1, v3, table.unpack(u1, 2))
            end
            v1 = u142[v3]
            if v1 then
                local v4
                for i2, i3 in ipairs(v1.connections) do
                    v4 = formatCallbackLabel("server.reliable", "connect", v3, i2)
                    trackSlowCallbackInvoke(v4, i3, p1, table.unpack(u1, 2))
                end
            end
        end)
    end)
    u122.OnServerEvent:Connect(function(p1, ...) -- Line: 2226 -- upvalues: trackSlowCallback (val), u94 (val), trackSlowCallbackInvoke (val), u142 (val), formatCallbackLabel (val)
        local u1 = {...}
        local v1 = ("server.unreliable.dispatch:%*"):format(p1.Name)
        trackSlowCallback(v1, function() -- Line: 2228 -- upvalues: u1 (val), u94 (upval), trackSlowCallbackInvoke (upval), p1 (val), u142 (upval), formatCallbackLabel (upval)
            local v1
            local v2 = u1[1]
            for i, v in ipairs(u94) do
                v1 = ("server.unreliable.middleware#%*"):format(i)
                trackSlowCallbackInvoke(v1, v, p1, v2, table.unpack(u1, 2))
            end
            local v3 = u142[v2]
            if v3 then
                local v4
                for i2, i3 in ipairs(v3.connections) do
                    v4 = formatCallbackLabel("server.unreliable", "connect", v2, i2)
                    trackSlowCallbackInvoke(v4, i3, p1, table.unpack(u1, 2))
                end
            end
        end)
    end)
    Players.PlayerRemoving:Connect(function(p1) -- Line: 2257 -- upvalues: u93 (val), u144 (val), u147 (val), u148 (val)
        if u93[p1] then
            for k, v in pairs(u93[p1]) do
                task.cancel(v)
            end
            u93[p1] = nil
        end
        u144[p1] = nil
        u147[p1] = nil
        u148[p1] = nil
    end)
else
    u120:FireServer()
    OnServerEvent = nil
    u120.OnClientEvent:Connect(function(...) -- Line: 2120 -- upvalues: trackSlowCallback (val), trackSlowCallbackInvoke (val), onClientReceivedAllStores (val), OnServerEvent (ref), mergeRetrieveResults (val), finishRetrieveSync (val), onClientUpdatedStorage (val), u142 (val), formatCallbackLabel (val)
        local u0 = {...}
        trackSlowCallback("client.reliable.dispatch", function() -- Line: 2123 -- upvalues: u0 (val), trackSlowCallbackInvoke (upval), onClientReceivedAllStores (upval), trackSlowCallback (upval), OnServerEvent (upval), mergeRetrieveResults (upval), finishRetrieveSync (upval), onClientUpdatedStorage (upval), u142 (upval), formatCallbackLabel (upval)
            local v1, v2, v3, v4
            if #u0 == 0 then
                return
            end
            if u0[1] == 0 then
                trackSlowCallbackInvoke("client.reliable.Retrieve", onClientReceivedAllStores, u0[2])
                return
            end
            if u0[1] == 3 then
                trackSlowCallback("client.reliable.RetrieveChunk", function() -- Line: 2131 -- upvalues: u0 (upval), OnServerEvent (upval), mergeRetrieveResults (upval), trackSlowCallbackInvoke (upval), finishRetrieveSync (upval)
                    local v1 = u0[2]
                    local v2 = u0[3]
                    if v1 == 1 then
                        OnServerEvent = {receivedCount = 0, totalChunks = v2, pendingStores = {}}
                    end
                    if OnServerEvent then
                        local v3 = mergeRetrieveResults(u0[4])
                        for i, v in ipairs(v3) do
                            table.insert(OnServerEvent.pendingStores, v)
                        end
                        local v4 = OnServerEvent
                        v4.receivedCount = v4.receivedCount + 1
                        if v1 == v2 then
                            trackSlowCallbackInvoke("client.reliable.RetrieveChunk.finish", finishRetrieveSync, OnServerEvent.pendingStores)
                            OnServerEvent = nil
                        end
                    end
                end)
                return
            end
            if u0[1] == 1 then
                trackSlowCallbackInvoke("client.reliable.Update", onClientUpdatedStorage, u0[2])
                return
            end
            v1 = u0[1]
            v2 = u142[v1]
            if v2 then
                local v5
                local connections = v2.connections
                v3 = nil
                v4 = nil
                for i, j in connections, v3, v4 do
                    v5 = formatCallbackLabel("client.reliable", "listen", v1, i)
                    trackSlowCallbackInvoke(v5, j, table.unpack(u0, 2))
                end
            end
        end)
    end)
    u122.OnClientEvent:Connect(function(...) -- Line: 2173 -- upvalues: trackSlowCallback (val), u142 (val), trackSlowCallbackInvoke (val), formatCallbackLabel (val)
        local u0 = {...}
        trackSlowCallback("client.unreliable.dispatch", function() -- Line: 2175 -- upvalues: u0 (val), u142 (upval), trackSlowCallbackInvoke (upval), formatCallbackLabel (upval)
            local v1 = u0[1]
            local v2 = u142[v1]
            if v2 then
                local v3
                local connections = v2.connections
                local v4 = nil
                local v5 = nil
                for i, j in connections, v4, v5 do
                    v3 = formatCallbackLabel("client.unreliable", "listen", v1, i)
                    trackSlowCallbackInvoke(v3, j, table.unpack(u0, 2))
                end
            end
        end)
    end)
end
function OnServerEvent() -- Line: 2291 -- upvalues: u67 (val)
    local v1, v2
    local v3 = {}
    for k, v in pairs(u67) do
        v1 = {count = v.count, totalMs = v.totalSeconds * 1000, maxMs = v.maxSeconds * 1000}
        if 0 >= v.count then
            v2 = 0
        else
            v2 = v.totalSeconds / v.count * 1000
        end
        v1.avgMs = v2
        v1.lastAt = v.lastAt
        v3[k] = v1
    end
    return v3
end
local function getRetrieveStoreSizes() -- Line: 2329 -- upvalues: u108 (val)
    local v1 = {}
    for k, v in pairs(u108) do
        v1[k] = v
    end
    return v1
end
return Table.merge({
    event = function(...) -- Line: 1080 -- upvalues: post (val), send (val), unreliablePost (val), unreliableSend (val), unreliableBroadcast (val), broadcast (val), broadcastToExcept (val), u142 (val), u95 (val)
        local u0 = nil
        local v1 = {
            seed = "",
            connections = {},
            post = function(...) -- Line: 1089 -- upvalues: post (upval), u0 (ref)
                local v1 = post(u0)
                return v1(...)
            end,
        }
        function v1.send(p1, ...) -- Line: 1094 -- upvalues: send (upval), u0 (ref)
            local v1 = send(u0)
            return v1(p1, ...)
        end
        function v1.unreliablePost(...) -- Line: 1098 -- upvalues: unreliablePost (upval), u0 (ref)
            local v1 = unreliablePost(u0)
            return v1(...)
        end
        function v1.unreliableSend(p1, ...) -- Line: 1102 -- upvalues: unreliableSend (upval), u0 (ref)
            local v1 = unreliableSend(u0)
            return v1(p1, ...)
        end
        function v1.unreliableBroadcast(...) -- Line: 1106 -- upvalues: unreliableBroadcast (upval), u0 (ref)
            local v1 = unreliableBroadcast(u0)
            return v1(...)
        end
        function v1.broadcast(...) -- Line: 1111 -- upvalues: broadcast (upval), u0 (ref)
            local v1 = broadcast(u0)
            return v1(...)
        end
        function v1.broadcastToExcept(p1, ...) -- Line: 1116 -- upvalues: broadcastToExcept (upval), u0 (ref)
            local v1 = broadcastToExcept(u0)
            return v1(p1, ...)
        end
        function v1.guard(...) -- Line: 1121 -- upvalues: u0 (ref)
            u0.expected = {...}
            return u0
        end
        function v1.id(p1) -- Line: 1127 -- upvalues: u0 (ref), u142 (upval), u95 (upval)
            u0.seed = p1
            u142[p1] = u0
            local v1 = debug.info(2, "s")
            u95[p1] = v1
            return u0
        end
        function v1.connect(p1) -- Line: 1138 -- upvalues: u0 (ref)
            table.insert(u0.connections, p1)
        end
        function v1.listen(p1) -- Line: 1142 -- upvalues: u0 (ref)
            table.insert(u0.connections, p1)
            return function() -- Line: 1145 -- upvalues: u0 (upval), p1 (val)
                local v1 = table.find(u0.connections, p1)
                if v1 then
                    table.remove(u0.connections, v1)
                end
            end
        end
        v1.expected = {...}
        return v1
    end,
    state = function(p1) -- Line: 2028 -- upvalues: publish (val), RunService (val), u74 (ref), u77 (val), Table (val), u98 (val)
        local u1 = nil
        local function onStateChanged() -- Line: 2031 -- upvalues: publish (upval), u1 (ref)
            local v1 = publish(u1)
            v1(u1.current)
        end
        return {
            seed = "",
            current = p1,
            addChangeListener = function(p1) -- Line: 2043 -- upvalues: u1 (ref)
                if not u1.listeners then
                    u1.listeners = {}
                end
                if not (table.find(u1.listeners, p1)) then
                    table.insert(u1.listeners, p1)
                end
            end,
            get = function() -- Line: 2054 -- upvalues: RunService (upval), u74 (upval), u77 (upval), u1 (ref)
                if RunService:IsClient() and not u74 then
                    u77:await()
                end
                return u1.current
            end,
            update = function(p1) -- Line: 2063 -- upvalues: u1 (ref), onStateChanged (val)
                debug.profilebegin((("Network.state.update:%*"):format(u1.seed)))
                u1.current = p1
                onStateChanged()
                debug.profileend()
                return u1
            end,
            merge = function(p1) -- Line: 2073 -- upvalues: u1 (ref), Table (upval), onStateChanged (val)
                debug.profilebegin((("Network.state.merge:%*"):format(u1.seed)))
                u1.current = Table.merge(u1.current, p1)
                onStateChanged()
                debug.profileend()
                return u1
            end,
            id = function(p1) -- Line: 2083 -- upvalues: u1 (ref), u98 (upval)
                u1.seed = p1
                u98[p1] = debug.info(2, "s")
                return u1
            end,
            global = function() -- Line: 2089 -- upvalues: u1 (ref)
                u1.isGlobal = true
                return u1
            end,
        }
    end,
    store = function() -- Line: 1905 -- upvalues: u144 (val), getSliceByStoreId (val), sendClientUpdatedStore (val), slice (val), RunService (val), u74 (ref), u77 (val), Players (val), u146 (val), u97 (val), u145 (val), Network (val)
        local u0 = nil
        local v1 = {seed = 0}
        local v2 = {}
        v1.current = v2
        function v1.load(p1, p2) -- Line: 1913 -- upvalues: u144 (upval), getSliceByStoreId (upval), u0 (ref), sendClientUpdatedStore (upval), slice (upval)
            if not (u144[p1]) then
                u144[p1] = {}
            end
            local v1 = getSliceByStoreId(p1, u0.seed)
            if not v1 then
                local v2 = slice(p1, p2, u0.structure, u0.seed, u0.deferred)
                u0.current[p1] = v2
                return v2
            end
            v1.value = p2
            v1.structure = u0.structure
            v1.deferred = u0.deferred
            u0.current[p1] = v1
            sendClientUpdatedStore(p1, u0)
            return v1
        end
        function v1.get(p1) -- Line: 1952 -- upvalues: RunService (upval), u74 (upval), u77 (upval), u0 (ref)
            if RunService:IsClient() and not u74 then
                u77:await()
            end
            return u0.current[p1]
        end
        function v1.client() -- Line: 1960 -- upvalues: u0 (ref), Players (upval)
            return u0.current[Players.LocalPlayer]
        end
        function v1.getAllWithPair(p1, p2) -- Line: 1964 -- upvalues: u0 (ref)
            local v1 = {}
            for k, v in pairs(u0.current) do
                if v.value[p1] == p2 then
                    v1[k] = v
                end
            end
            return v1
        end
        function v1.getAll() -- Line: 1976 -- upvalues: u0 (ref)
            return u0.current
        end
        function v1.observe(p1, p2) -- Line: 1980 -- upvalues: u146 (upval), u0 (ref)
            if not (u146[u0.seed]) then
                u146[u0.seed] = {}
            end
            local u15 = #u146[u0.seed] + 1
            u146[u0.seed][u15] = p2
            return function() -- Line: 1988 -- upvalues: u146 (upval), u0 (upval), u15 (val)
                local v1 = u146[u0.seed]
                v1[u15] = nil
            end
        end
        function v1.id(p1) -- Line: 1994 -- upvalues: u0 (ref), u97 (upval), u145 (upval), Network (upval)
            u0.seed = p1
            u97[p1] = debug.info(2, "s")
            if u145[u0.seed] then
                local v1 = u145[u0.seed]
                if v1 ~= u0 then
                    Network.warn((("Store ID conflict detected: %* - This may cause data corruption!"):format(p1)))
                end
            end
            u145[u0.seed] = u0
            return u0
        end
        function v1.struct(p1) -- Line: 2010 -- upvalues: u0 (ref)
            u0.structure = p1
            return u0
        end
        function v1.defer() -- Line: 2015 -- upvalues: u0 (ref)
            u0.deferred = true
            return u0
        end
        return v1
    end,
    addInternalMiddleware = function(p1) -- Line: 2100 -- upvalues: u94 (val)
        table.insert(u94, p1)
        return function() -- Line: 2104 -- upvalues: u94 (upval), p1 (val)
            local v1 = table.find(u94, p1)
            if v1 then
                table.remove(u94, v1)
            end
        end
    end,
    getEventSource = function(p1) -- Line: 2324 -- upvalues: u95 (val)
        return u95[p1]
    end,
    getSlowCallbackStats = OnServerEvent,
    setSlowCallbackWarnThreshold = function(p1) -- Line: 2305 -- upvalues: u66 (ref)
        u66 = p1
    end,
    getStoreObserverStats = function() -- Line: 2309 -- upvalues: u149 (val)
        local v1, v2
        local v3 = {}
        for k, v in pairs(u149) do
            v1 = {count = v.count, totalMs = v.totalSeconds * 1000, maxMs = v.maxSeconds * 1000}
            if 0 >= v.count then
                v2 = 0
            else
                v2 = v.totalSeconds / v.count * 1000
            end
            v1.avgMs = v2
            v1.lastAt = v.lastAt
            v1.observerCount = v.observerCount
            v3[k] = v1
        end
        return v3
    end,
    getTrafficStats = function() -- Line: 2361 -- upvalues: RunService (val), u99 (val), u100 (val), u95 (val), u97 (val), u98 (val), getRetrieveStoreSizes (val)
        local callCount, sourceId, v1, v2, v3, v4, v5, v6, v7, v8, v9
        if not (RunService:IsServer()) then
            return {
                lastMinute = {
                    bySource = {Event = {}, State = {}, Store = {}},
                    global = {totalEffectiveBytes = 0, callCount = 0, averageBytes = 0},
                },
                session = {
                    bySource = {Event = {}, State = {}, Store = {}},
                    global = {totalEffectiveBytes = 0, callCount = 0, averageBytes = 0},
                },
                sourceScripts = {event = {}, store = {}, state = {}},
                lastRetrieveStoreSizes = {},
            }
        end
        local v10 = tick() - 60
        local v11 = {Event = {}, State = {}, Store = {}}
        local v12 = 0
        local v13 = 0
        for i, v in ipairs(u99) do
            if v10 <= v.t then
                v12 = v12 + v.effectiveBytes
                v13 = v13 + 1
                v1 = v11[v.sourceType]
                sourceId = v.sourceId
                if not (v1[sourceId]) then
                    v1[sourceId] = {totalBytes = 0, effectiveBytes = 0, callCount = 0}
                end
                v2 = v1[sourceId]
                v2.totalBytes = v2.totalBytes + v.bytes
                v2 = v1[sourceId]
                v2.effectiveBytes = v2.effectiveBytes + v.effectiveBytes
                v2 = v1[sourceId]
                v2.callCount = v2.callCount + 1
            end
        end
        local v14 = (function(p1) -- Line: 2405
            local callCount, v1, v2, v3, v4
            local v5 = {}
            for k, v in pairs(p1) do
                v5[k] = {}
                for k2, i in pairs(v) do
                    callCount = i.callCount
                    v1 = v5[k]
                    v2 = tostring(k2)
                    v3 = {totalBytes = i.totalBytes, effectiveBytes = i.effectiveBytes, callCount = callCount}
                    if 0 >= callCount then
                        v4 = 0
                    else
                        v4 = i.effectiveBytes / callCount
                    end
                    v3.averageBytes = v4
                    v1[v2] = v3
                end
            end
            return v5
        end)(v11)
        local v15 = {totalEffectiveBytes = v12, callCount = v13}
        if 0 >= v13 then
            v9 = 0
        else
            v9 = v12 / v13
        end
        v15.averageBytes = v9
        v9 = {}
        local v16 = 0
        v1 = 0
        for k, i2 in pairs(u100) do
            v9[k] = {}
            for k2, j in pairs(i2) do
                callCount = j.callCount
                v16 = v16 + j.totalEffectiveBytes
                v1 = v1 + j.callCount
                v5 = v9[k]
                v6 = tostring(k2)
                v7 = {totalBytes = j.totalBytes, effectiveBytes = j.totalEffectiveBytes, callCount = callCount}
                if 0 >= callCount then
                    v8 = 0
                else
                    v8 = j.totalEffectiveBytes / callCount
                end
                v7.averageBytes = v8
                v5[v6] = v7
            end
        end
        local v17 = {
            lastMinute = {bySource = v14, global = v15},
        }
        v2 = {bySource = v9}
        v3 = {totalEffectiveBytes = v16, callCount = v1}
        if 0 >= v1 then
            v4 = 0
        else
            v4 = v16 / v1
            if not v4 then
                v4 = 0
            end
        end
        v3.averageBytes = v4
        v2.global = v3
        v17.session = v2
        v17.sourceScripts = {event = u95, store = u97, state = u98}
        v17.lastRetrieveStoreSizes = getRetrieveStoreSizes()
        return v17
    end,
    getRetrieveStoreSizes = getRetrieveStoreSizes,
    registerStoreCompressor = function(p1, p2, p3) -- Line: 384 -- upvalues: u109 (val)
        u109[p1] = {compress = p2, decompress = p3}
    end,
    setGlobalCompressor = function(p1, p2) -- Line: 388 -- upvalues: u110 (ref)
        u110 = {compress = p1, decompress = p2}
    end,
    beginBatchServerToClientRecord = function(p1, p2) -- Line: 722 -- upvalues: isServerToClientTrafficRecordingEnabled (val), u106 (ref), u107 (val)
        if not (isServerToClientTrafficRecordingEnabled()) then
            return
        end
        u106 = u106 + 1
        if u106 == 1 then
            u107.sourceType = p1
            u107.sourceId = p2
            u107.totalPayloadBytes = 0
            u107.totalEffectiveBytes = 0
            u107.sendCount = 0
        end
    end,
    endBatchServerToClientRecord = function() -- Line: 855 -- upvalues: isServerToClientTrafficRecordingEnabled (val), u106 (ref), u107 (val), recordServerToClientSend (val)
        local sendCount
        if not (isServerToClientTrafficRecordingEnabled()) or u106 == 0 then
            return
        end
        u106 = u106 - 1
        if 0 < u106 or u107.sendCount == 0 then
            return
        end
        sendCount = u107.sendCount
        local totalPayloadBytes = u107.totalPayloadBytes
        recordServerToClientSend(u107.sourceType, u107.sourceId, totalPayloadBytes / sendCount, sendCount, nil, {totalPayloadBytes = totalPayloadBytes, totalEffectiveBytes = u107.totalEffectiveBytes, callCount = sendCount})
    end,
    estimatePayloadBytes = estimatePayloadBytes,
    dump = function() -- Line: 2483 -- upvalues: u144 (val)
        print(u144)
    end,
    loaded = u77,
    onClientNetworkingLoaded = u80,
}, v3)