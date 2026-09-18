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
--                    File: ReplicatedStorage.Common.Effects.Effects
--                               Dumped in 0.00446 seconds
--                          Bytecode version 9  |  36 functions

local clientEmitEffect, emitClientEffect, onInternalBroadcastEffectRequest, onInternalSendEffectRequest, queueEffect, queueServerEffect, v1, v2, v3
local v4 = script
script = nil
local v5 = getfenv(0)
v5.script = nil
_G.script = nil
v5 = getfenv(0)
v5.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Network = v4.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Effects = require(Namespaces:WaitForChild("Effects"))
local Screen = require(v4.Parent:WaitForChild("Screen"))
local Utilities = v4.Parent.Parent:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Utilities_2 = v4.Parent.Parent:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("Packet"))
local u69 = {}
local u70 = {}
for i, j in v4.Parent.Types:GetDescendants() do
    if j:IsA("ModuleScript") and not (u70[j.Name]) then
        u70[j.Name] = j
    end
end
local u85 = {}
local u86 = {}
local u87 = {}
local u88 = {}
local u89 = 0
local u90 = nil
local u91 = 0
local u92 = {}
local u93 = {}
local u94 = 0
local u95 = 0
local u96 = 0
local u97 = {}
local v6 = {
    "Dash",
    "Hook",
    "Swing",
    "Arrow",
    "CheckGas",
    "Dashing Draw",
    "Pebble",
    "ShifterStep",
    "Bobber",
}
local u108 = {}
for i2, v in ipairs(v6) do
    u108[v] = true
end
function onInternalSendEffectRequest(p1, p2, ...) -- Line: 147 -- upvalues: u86 (val), Effects (val)
    debug.profilebegin((("Effects.onInternalSendEffectRequest:%*"):format(p2)))
    if not (u86[p2]) then
        Effects.Event.unreliableSend(p1, p2, ...)
    else
        u86[p2]:FireClient(p1, ...)
    end
    debug.profileend()
end
function onInternalBroadcastEffectRequest(p1, ...) -- Line: 163 -- upvalues: u86 (val), Effects (val)
    debug.profilebegin((("Effects.onInternalBroadcastEffectRequest:%*"):format(p1)))
    if not (u86[p1]) then
        Effects.Event.unreliableBroadcast(p1, ...)
    else
        u86[p1]:Fire(...)
    end
    debug.profileend()
end
local function sendEffectRequestToPlayer(p1, p2, ...) -- Line: 180 -- upvalues: onInternalSendEffectRequest (val)
    onInternalSendEffectRequest(p1, p2, ...)
end
local function sendEffectRequest(p1, ...) -- Line: 190 -- upvalues: onInternalBroadcastEffectRequest (val)
    onInternalBroadcastEffectRequest(p1, ...)
end
local function updatePositionCache() -- Line: 198 -- upvalues: u88 (ref), u93 (val), Character (val), u94 (ref)
    debug.profilebegin("Effects.updatePositionCache")
    local v1 = os.clock()
    local v2 = u88
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        u93[j] = Character.getPosition(j)
    end
    u94 = v1
    debug.profileend()
end
local function _getCachedDistance(p1, p2) -- Line: 218 -- upvalues: u93 (val)
    local v1 = u93[p1]
    local v2 = u93[p2]
    if not v1 or not v2 then
        return nil
    end
    return (v1 - v2).Magnitude
end
local function getCachedDistanceSquared(p1, p2) -- Line: 229 -- upvalues: u93 (val)
    local v1 = u93[p1]
    local v2 = u93[p2]
    if not v1 or not v2 then
        return nil
    end
    local v3 = v1 - v2
    return v3.X * v3.X + v3.Y * v3.Y + v3.Z * v3.Z
end
local function initializeClientState(p1) -- Line: 246 -- upvalues: u92 (val)
    if not (u92[p1]) then
        u92[p1] = {
            budget = 8,
            lastPositionUpdate = 0,
            queuePressure = 0,
            averageQueueSize = 0,
            queue = {},
        }
    end
end
local function cleanupClientState(p1) -- Line: 264 -- upvalues: u92 (val), u93 (val), u85 (val)
    u92[p1] = nil
    u93[p1] = nil
    u85[p1] = nil
end
local function getBasePriority(p1) -- Line: 275 -- upvalues: u87 (val)
    return u87[p1] or 2
end
local function calculateRelevanceScore(p1, p2, p3) -- Line: 286
    debug.profilebegin("Effects.calculateRelevanceScore")
    local basePriority = p1.basePriority
    if p1.sourcePosition and p2 then
        local Magnitude = (p1.sourcePosition - p2).Magnitude
        if Magnitude <= 100 then
            basePriority = basePriority * 2
        elseif Magnitude <= 300 then
            basePriority = basePriority * 1.5
        elseif Magnitude <= 1000 then
            basePriority = basePriority * 1.2
        elseif Magnitude > 1500 then
            basePriority = basePriority * 0.1
        else
            basePriority = basePriority * 0.8
        end
    end
    local v1 = p3 - p1.timestamp
    if 0.5 <= v1 then
        basePriority = basePriority * 1.5
    end
    debug.profileend()
    return basePriority
end
function queueEffect(p1, p2) -- Line: 324 -- upvalues: u92 (val)
    local v1
    debug.profilebegin((("Effects.queueEffect:%*"):format(p2.name)))
    local v2 = u92[p1]
    if not v2 then
        debug.profileend()
        return
    end
    if not p2.player then
        p2.isValid = true
    else
        v1 = p2.player.Parent ~= nil
        p2.isValid = v1
    end
    v1 = #v2.queue
    if 100 <= v1 then
        table.remove(v2.queue, 1)
    end
    table.insert(v2.queue, p2)
    v2.queuePressure = #v2.queue
    debug.profileend()
end
local function getPlayerCountScaling() -- Line: 357 -- upvalues: u90 (ref), u91 (ref), u89 (ref)
    local v1
    local v2 = os.clock()
    if not u90 then
        v1 = u89
        if 100 <= v1 then
            u90 = {budgetMultiplier = 0.5, distanceMultiplier = 0.4, tickRateMultiplier = 2, priorityOnly = true}
        elseif 50 > v1 then
            u90 = {budgetMultiplier = 1, distanceMultiplier = 1, tickRateMultiplier = 1, priorityOnly = false}
        else
            u90 = {budgetMultiplier = 0.75, distanceMultiplier = 0.6, tickRateMultiplier = 1.5, priorityOnly = false}
        end
        u91 = v2
        return u90
    end
    v1 = v2 - u91
    if v1 < 15 then
        return u90
    end
    v1 = u89
    if 100 <= v1 then
        u90 = {budgetMultiplier = 0.5, distanceMultiplier = 0.4, tickRateMultiplier = 2, priorityOnly = true}
    elseif 50 > v1 then
        u90 = {budgetMultiplier = 1, distanceMultiplier = 1, tickRateMultiplier = 1, priorityOnly = false}
    else
        u90 = {budgetMultiplier = 0.75, distanceMultiplier = 0.6, tickRateMultiplier = 1.5, priorityOnly = false}
    end
    u91 = v2
    return u90
end
local function calculateAdaptiveBudget(p1, p2) -- Line: 394 -- upvalues: getPlayerCountScaling (val)
    local v1
    debug.profilebegin("Effects.calculateAdaptiveBudget")
    p1.averageQueueSize = p1.averageQueueSize * 0.7 + #p1.queue * 0.3
    local v2 = p2
    if not v2 then
        v2 = getPlayerCountScaling()
    end
    local v3 = math.floor(8 * v2.budgetMultiplier)
    if 20 <= p1.averageQueueSize then
        v1 = v3 + math.floor(p1.averageQueueSize / 4)
    elseif p1.averageQueueSize > 5 then
        v1 = v3 + 2
    else
        v1 = v3
    end
    local v4 = math.floor(3 * v2.budgetMultiplier)
    local v5 = math.max(1, v4)
    local v6 = math.clamp(v1, v5, (math.floor(16 * v2.budgetMultiplier)))
    debug.profileend()
    return v6
end
local function selectTopEffects(p1, p2) -- Line: 440
    local v1, v2, v3, v4, v5, v6, v7
    debug.profilebegin("Effects.selectTopEffects")
    if #p1 <= p2 then
        table.sort(p1, function(p1, p2) -- Line: 447
            local v1 = p2.score < p1.score
            return v1
        end)
        debug.profileend()
        return p1
    end
    v4 = {}
    local v8 = #p1
    local v9 = 1
    v1, v2 = p1, p2
    for i = 1, v8, v9 do
        v5 = v1[i]
        if #v4 < v2 then
            table.insert(v4, v5)
            v6 = 2
            v7 = -1
            for k = #v4, v6, v7 do
                if v4[k - 1].score >= v4[k].score then
                    break
                end
                v3 = v4[k]
                v4[k] = v4[k - 1]
                v4[k - 1] = v3
            end
        elseif v4[#v4].score < v5.score then
            v4[#v4] = v5
            v6 = 2
            v7 = -1
            for j = #v4, v6, v7 do
                if v4[j - 1].score >= v4[j].score then
                    break
                end
                v3 = v4[j]
                v4[j] = v4[j - 1]
                v4[j - 1] = v3
            end
        end
    end
    debug.profileend()
    return v4
end
local function processClientQueue(p1) -- Line: 493 -- upvalues: u92 (val), getPlayerCountScaling (val), calculateAdaptiveBudget (val), u93 (val), calculateRelevanceScore (val), selectTopEffects (val), sendEffectRequestToPlayer (val)
    local v1, v2, v3
    debug.profilebegin("Effects.processClientQueue")
    local v4 = u92[p1]
    if not v4 or #v4.queue == 0 then
        debug.profileend()
        return
    end
    local v5 = getPlayerCountScaling()
    local v6 = 3000 * v5.distanceMultiplier
    local v7 = v6 * v6
    local v8 = calculateAdaptiveBudget(v4, v5)
    local v9 = os.clock()
    local v10 = u93[p1]
    local v11 = {}
    local v12 = {}
    local v13 = p1
    for i, v in ipairs(v4.queue) do
        if v.isValid ~= false then
            if v.player and v.isValid == nil then
                v1 = v.player.Parent ~= nil
                v.isValid = v1
            end
            if not v.sourcePosition then
                if not v5.priorityOnly then
                    v1 = calculateRelevanceScore(v, v10, v9)
                    table.insert(v11, {index = i, payload = v, score = v1})
                elseif v.basePriority < 3 then
                end
            elseif v10 then
                v1 = v.sourcePosition - v10
                v2 = v1.X * v1.X + v1.Y * v1.Y
                if v7 < v2 + v1.Z * v1.Z then end
            end
        end
    end
    local v14 = math.min(v8 * 2, #v11)
    local v15 = selectTopEffects(v11, v14)
    local v16 = 0
    local v17 = {}
    for i2, i3 in ipairs(v15) do
        if v8 <= v16 then
            break
        end
        sendEffectRequestToPlayer(v13, i3.payload.name, i3.payload.player, unpack(i3.payload.args))
        v16 = v16 + 1
        v17[i3.index] = true
    end
    for i4, j in ipairs(v4.queue) do
        if not (v17[i4]) then
            if not j.player then
                if not j.player then
                    table.insert(v12, j)
                end
            elseif j.isValid == nil then
                v3 = j.player.Parent ~= nil
                j.isValid = v3
                if j.isValid then
                    table.insert(v12, j)
                end
            elseif j.isValid ~= true then
            end
        end
    end
    v4.queue = v12
    v4.budget = v8
    v4.queuePressure = #v4.queue
    debug.profileend()
end
local function processTick() -- Line: 599 -- upvalues: u94 (ref), updatePositionCache (val), u97 (val), u92 (val), cleanupClientState (val), u96 (ref), processClientQueue (val)
    local v1
    debug.profilebegin("Effects.processTick")
    local v2 = os.clock() - u94
    if 0.2 <= v2 then
        updatePositionCache()
    end
    table.clear(u97)
    for k, v in pairs(u92) do
        if not k.Parent then
            cleanupClientState(k)
        elseif v.queue then
            v1 = #v.queue
            if 0 < v1 then
                table.insert(u97, k)
            end
        end
    end
    v2 = u96
    local v3 = math.min(v2 + 10, #u97)
    local v4 = v3
    local v5 = 1
    for i = v2 + 1, v4, v5 do
        v1 = u97[i]
        if v1 and v1.Parent and u92[v1] then
            processClientQueue(v1)
        end
    end
    u96 = v3
    if #u97 <= u96 then
        u96 = 0
    end
    debug.profileend()
end
local function enableEffectAttachment(p1, ...) -- Line: 647 -- upvalues: onInternalBroadcastEffectRequest (val)
    debug.profilebegin("Effects.enableEffectAttachment")
    local v1 = p1:IsA("Attachment")
    assert(v1, "Invalid attachment")
    onInternalBroadcastEffectRequest("EnableAttachment", p1, ...)
    debug.profileend()
end
local function disableEffectAttachment(p1, ...) -- Line: 660 -- upvalues: onInternalBroadcastEffectRequest (val)
    debug.profilebegin("Effects.disableEffectAttachment")
    local v1 = p1:IsA("Attachment")
    assert(v1, "Invalid attachment")
    onInternalBroadcastEffectRequest("DisableAttachment", p1, ...)
    debug.profileend()
end
local function emitEffectAttachment(p1, ...) -- Line: 673 -- upvalues: onInternalBroadcastEffectRequest (val)
    debug.profilebegin("Effects.emitEffectAttachment")
    local v1 = p1:IsA("Attachment")
    assert(v1, "Invalid attachment")
    onInternalBroadcastEffectRequest("EmitAttachment", p1, ...)
    debug.profileend()
end
local function getEffect(p1) -- Line: 687 -- upvalues: u69 (val), u70 (val)
    local v1 = u69[p1]
    if v1 then
        return v1
    end
    local v2 = u70[p1]
    if not v2 then
        error("Invalid effect module:" .. p1)
    end
    local v3 = require(v2)
    u69[p1] = v3
    return v3
end
local function sendReplicatedEffect(p1, ...) -- Line: 709 -- upvalues: getEffect (val), Players (val), Effects (val)
    local v1 = getEffect(p1)
    if v1 then
        v1(Players.LocalPlayer, unpack({...}))
    end
    Effects.Event.unreliablePost(p1, ...)
end
function emitClientEffect(p1, ...) -- Line: 728 -- upvalues: getEffect (val), Players (val)
    debug.profilebegin((("Effects.emitClientEffect:%*"):format(p1)))
    local u10 = getEffect(p1)
    if u10 then
        local u11 = {...}
        task.spawn(function() -- Line: 735 -- upvalues: u10 (val), Players (upval), u11 (val)
            u10(Players.LocalPlayer, unpack(u11))
        end)
    end
    debug.profileend()
end
function clientEmitEffect(p1, ...) -- Line: 742 -- upvalues: getEffect (val)
    debug.profilebegin((("Effects.clientEmitEffect:%*"):format(p1)))
    local u10 = getEffect(p1)
    if u10 then
        local u11 = {...}
        task.spawn(function() -- Line: 748 -- upvalues: u10 (val), u11 (val)
            u10(unpack(u11))
        end)
    end
    debug.profileend()
end
function queueServerEffect(p1, p2, ...) -- Line: 764 -- upvalues: RunService (val), Character (val), u93 (val), getBasePriority (val), getPlayerCountScaling (val), u88 (ref), initializeClientState (val), getCachedDistanceSquared (val), queueEffect (val)
    local v1, v2
    debug.profilebegin((("Effects.queueServerEffect:%*"):format(p2)))
    if not (RunService:IsServer()) then
        debug.profileend()
        return
    end
    local v3 = {...}
    local v4 = typeof(p1) == "Vector3"
    if not v4 then
        local v5, v6, v7
        if not p1 or not (Character.getCharacter(p1)) then
            debug.profileend()
            return
        end
        v2 = p1
        v1 = u93[p1]
        local v8 = {
            name = p2,
            player = v2,
            args = v3,
            basePriority = getBasePriority(p2),
            timestamp = os.clock(),
            sourcePosition = v1,
        }
        local v9 = 3000 * getPlayerCountScaling().distanceMultiplier
        local v10 = v9 * v9
        local v11 = u88
        local v12 = nil
        local v13 = nil
        for i, j in v11, v12, v13 do
            if v4 then
                initializeClientState(j)
                if not v4 then
                    v5 = getCachedDistanceSquared(v2, j)
                    if v5 and v10 >= v5 then
                        queueEffect(j, v8)
                    end
                else
                    v6 = u93[j]
                    if v6 then
                        v7 = v1 - v6
                        v5 = v7.X * v7.X + v7.Y * v7.Y + v7.Z * v7.Z
                    end
                end
            elseif v2 == j then
            end
        end
        debug.profileend()
        return
    else
        v1 = p1
        v2 = nil
    end
end
for k, n in v4.Parent.Custom:GetDescendants() do
    if n:IsA("ModuleScript") then
        u86[n.Name] = require(n)
    end
end
if RunService:IsClient() then
    v1 = {
        "Hook",
        "Grapple",
        "Ungrapple",
        "Gas",
        "Retract",
    }
    v2 = nil
    v3 = nil
    for i6, i7 in v1, v2, v3 do
        if u70[i7] then
            getEffect(i7)
        end
    end
    v1 = u86
    v2 = nil
    v3 = nil
    for i8, i9 in v1, v2, v3 do
        i9.OnClientEvent:Connect(function(...) -- Line: 871 -- upvalues: getEffect (val), i8 (val)
            getEffect(i8)(...)
        end)
    end
    Effects.Event.listen(function(...) -- Line: 879 -- upvalues: Screen (val), getEffect (val)
        local v1 = {...}
        local v2 = v1[1]
        if v2 == "CreateScreenEffect" then
            if v2 == "CreateScreenEffect" then
                Screen.__createClientScreenEffect(v1[2])
                return
            end
            Screen.__removeClientScreenEffect(v1[2])
            return
        end
        if v2 ~= "RemoveScreenEffect" then
            getEffect(v2)(unpack(v1, 2))
            return
        end
        if v2 == "CreateScreenEffect" then
            Screen.__createClientScreenEffect(v1[2])
            return
        end
        Screen.__removeClientScreenEffect(v1[2])
    end)
elseif RunService:IsServer() then
    u88 = Players:GetPlayers()
    u89 = #u88
    updatePositionCache()
    Players.PlayerAdded:Connect(function(p1) -- Line: 907 -- upvalues: u88 (ref), u89 (ref), initializeClientState (val)
        table.insert(u88, p1)
        u89 = u89 + 1
        initializeClientState(p1)
    end)
    Players.PlayerRemoving:Connect(function(p1) -- Line: 912 -- upvalues: u88 (ref), u89 (ref), cleanupClientState (val)
        local v1 = table.find(u88, p1)
        if v1 then
            table.remove(u88, v1)
            u89 = u89 - 1
        end
        cleanupClientState(p1)
    end)
    v1 = u88
    v2 = nil
    v3 = nil
    for m, i5 in v1, v2, v3 do
        initializeClientState(i5)
    end
    RunService.Heartbeat:Connect(function() -- Line: 927 -- upvalues: u95 (ref), getPlayerCountScaling (val), processTick (val)
        u95 = u95 + 1
        local v1 = math.floor(4 * getPlayerCountScaling().tickRateMultiplier)
        if v1 <= u95 then
            processTick()
            u95 = 0
        end
    end)
    Effects.Event.connect(function(...) -- Line: 941 -- upvalues: u108 (val), u85 (val), u93 (val), getBasePriority (val), getPlayerCountScaling (val), u88 (ref), initializeClientState (val), getCachedDistanceSquared (val), queueEffect (val)
        local v1
        debug.profilebegin("Effects.onServerEffectRequest")
        local v2 = {...}
        local u5 = v2[1]
        local v3 = v2[2]
        if not (tonumber(v3)) then
            local v4
            if not (u108[v3]) then
                debug.profileend()
                return
            end
            u85[u5] = u85[u5] or 0
            v1 = u85
            v1[u5] = v1[u5] + 1
            task.delay(0.5, function() -- Line: 963 -- upvalues: u85 (upval), u5 (val)
                local v1 = u85
                local v2 = u5
                v1[v2] = v1[v2] - 1
            end)
            v1 = u85[u5]
            if 3 < v1 or not u5 or not u5.Character or not (u5.Character:FindFirstChild("HumanoidRootPart")) then
                debug.profileend()
                return
            end
            v1 = {}
            local v5 = #v2
            local v6 = 1
            for i = 3, v5, v6 do
                table.insert(v1, v2[i])
            end
            v6 = {
                name = v3,
                player = u5,
                args = v1,
                basePriority = getBasePriority(v3),
                timestamp = os.clock(),
                sourcePosition = u93[u5],
            }
            local v7 = 3000 * getPlayerCountScaling().distanceMultiplier
            local v8 = u88
            local v9 = nil
            local v10 = nil
            for j, k in v8, v9, v10 do
                if u5 ~= k then
                    initializeClientState(k)
                    v4 = getCachedDistanceSquared(u5, k)
                    if v4 and v7 * v7 >= v4 then
                        queueEffect(k, v6)
                    end
                end
            end
            debug.profileend()
            return
        else
            v1 = tonumber(v3)
            if 50 < v1 then
                debug.profileend()
                return
            end
        end
    end)
end
return {
    sendEffectRequest = sendEffectRequest,
    sendEffectRequestToPlayer = sendEffectRequestToPlayer,
    emitClientEffect = emitClientEffect,
    clientEmitEffect = clientEmitEffect,
    enableEffectAttachment = enableEffectAttachment,
    disableEffectAttachment = disableEffectAttachment,
    emitEffectAttachment = emitEffectAttachment,
    sendReplicatedEffect = sendReplicatedEffect,
    queueServerEffect = queueServerEffect,
    Screen = Screen,
}