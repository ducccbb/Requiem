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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactUpdateQueue.new
--                               Dumped in 0.00282 seconds
--                          Bytecode version 9  |  15 functions

local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLane = ReactFiberLane.NoLane
local NoLanes = ReactFiberLane.NoLanes
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local u44 = nil
local function enterDisallowedContextReadInDEV() -- Line: 113 -- upvalues: u44 (ref)
    if not u44 then
        u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
    end
    u44.enterDisallowedContextReadInDEV()
end
local function exitDisallowedContextReadInDEV() -- Line: 119 -- upvalues: u44 (ref)
    if not u44 then
        u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
    end
    u44.exitDisallowedContextReadInDEV()
end
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Callback = ReactFiberFlags.Callback
local ShouldCapture = ReactFiberFlags.ShouldCapture
local DidCapture = ReactFiberFlags.DidCapture
local debugRenderPhaseSideEffectsForStrictMode = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local StrictMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local markSkippedUpdateLanes = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ConsolePatchingDev = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = ConsolePatchingDev.disableLogs
local reenableLogs = ConsolePatchingDev.reenableLogs
local v1 = {UpdateState = 0, ReplaceState = 1, ForceUpdate = 2, CaptureUpdate = 3}
local u114 = false
local u117 = nil
local u118 = nil
if __DEV__ then
    u117 = false
    u118 = nil
    function v1.resetCurrentlyProcessingQueue() -- Line: 179 -- upvalues: u118 (ref)
        u118 = nil
    end
end
local u122 = table.create(210)
local u123 = 210
local v2 = 210
local v3 = 1
for i = 1, v2, v3 do
    u122[i] = {eventTime = -1, lane = -1, tag = -1}
end
function v1.initializeUpdateQueue(p1) -- Line: 200
    p1.updateQueue = {baseState = p1.memoizedState, shared = {}}
end
function v1.cloneUpdateQueue(p1, p2) -- Line: 214
    local updateQueue = p1.updateQueue
    if p2.updateQueue == updateQueue then
        p2.updateQueue = table.clone(updateQueue)
    end
end
function v1.createUpdate(p1, p2, p3, p4) -- Line: 228 -- upvalues: u123 (ref), u122 (val)
    if 0 >= u123 then
        return {
            tag = 0,
            eventTime = p1,
            lane = p2,
            payload = p3,
            callback = p4,
        }
    end
    local v1 = u122[u123]
    u122[u123] = nil
    u123 = u123 - 1
    v1.eventTime = p1
    v1.lane = p2
    v1.tag = 0
    v1.payload = p3
    v1.callback = p4
    return v1
end
function v1.enqueueUpdate(p1, p2) -- Line: 278 -- upvalues: __DEV__ (val), u118 (ref), u117 (ref), console (val)
    local updateQueue = p1.updateQueue
    if updateQueue == nil then
        return
    end
    local shared = updateQueue.shared
    local pending = shared.pending
    if pending ~= nil then
        p2.next = pending.next
        pending.next = p2
    else
        p2.next = p2
    end
    shared.pending = p2
    if __DEV__ and u118 == shared and not u117 then
        console.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
        u117 = true
    end
end
function v1.enqueueCapturedUpdate(p1, p2) -- Line: 310
    local lastBaseUpdate, v1
    local updateQueue = p1.updateQueue
    local alternate = p1.alternate
    if alternate == nil then
        lastBaseUpdate = updateQueue.lastBaseUpdate
        if lastBaseUpdate ~= nil then
            lastBaseUpdate.next = p2
        else
            updateQueue.firstBaseUpdate = p2
        end
        updateQueue.lastBaseUpdate = p2
        return
    end
    local updateQueue_2 = alternate.updateQueue
    if updateQueue ~= updateQueue_2 then
        lastBaseUpdate = updateQueue.lastBaseUpdate
        if lastBaseUpdate ~= nil then
            lastBaseUpdate.next = p2
        else
            updateQueue.firstBaseUpdate = p2
        end
        updateQueue.lastBaseUpdate = p2
        return
    end
    local v2 = nil
    local v3 = nil
    local firstBaseUpdate = updateQueue.firstBaseUpdate
    if firstBaseUpdate == nil then
        v3 = p2
        v2 = p2
        v1 = p1
    else
        local v4
        local next = firstBaseUpdate
        while true do
            v4 = {
                eventTime = next.eventTime,
                lane = next.lane,
                tag = next.tag,
                payload = next.payload,
                callback = next.callback,
            }
            if v3 ~= nil then
                v3.next = v4
                v3 = v4
            else
                v3 = v4
                v2 = v4
            end
            next = next.next
            if next == nil then
                break
            end
        end
        if v3 ~= nil then
            v3.next = v5
            v3 = v5
        else
            v3 = v5
            v2 = v5
        end
    end
    v1.updateQueue = {
        baseState = updateQueue_2.baseState,
        firstBaseUpdate = v2,
        lastBaseUpdate = v3,
        shared = updateQueue_2.shared,
        effects = updateQueue_2.effects,
    }
end
local function getStateFromUpdate(p1, p2, p3, p4, p5, p6) -- Line: 391 -- upvalues: __DEV__ (val), u44 (ref), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val), __YOLO__ (val), describeError (val), reenableLogs (val), ShouldCapture (val), DidCapture (val), Object (val), u114 (ref)
    local v1, v2, v3, v4, v5
    local tag = p3.tag
    if tag == 1 then
        local payload = p3.payload
        if type(payload) ~= "function" then
            return payload
        end
        if __DEV__ then
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.enterDisallowedContextReadInDEV()
        end
        v4 = payload(p4, p5)
        if __DEV__ then
            if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
                disableLogs()
                v1 = nil
                if __YOLO__ then
                    v5 = true
                    payload(p4, p5)
                else
                    v2, v3 = xpcall(payload, describeError, p4, p5)
                    v5 = v2
                    v1 = v3
                end
                reenableLogs()
                if not v5 then
                    error(v1)
                end
            end
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.exitDisallowedContextReadInDEV()
        end
        return v4
    end
    if tag == 3 then
        if tag == 3 then
            v4 = bit32.band(p1.flags, (bit32.bnot(ShouldCapture)))
            p1.flags = bit32.bor(v4, DidCapture)
        end
        local payload_2 = p3.payload
        if type(payload_2) ~= "function" then
            v4 = payload_2
        else
            if __DEV__ then
                if not u44 then
                    u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
                end
                u44.enterDisallowedContextReadInDEV()
            end
            v4 = payload_2(p4, p5)
            if __DEV__ then
                if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
                    disableLogs()
                    v1 = nil
                    if __YOLO__ then
                        v5 = true
                        payload_2(p4, p5)
                    else
                        v2, v3 = xpcall(payload_2, describeError, p4, p5)
                        v5 = v2
                        v1 = v3
                    end
                    reenableLogs()
                    if not v5 then
                        error(v1)
                    end
                end
                if not u44 then
                    u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
                end
                u44.exitDisallowedContextReadInDEV()
            end
        end
        if v4 == nil then
            return p4
        end
        return Object.assign({}, p4, v4)
    elseif tag ~= 0 then
        if tag ~= 2 then
            return p4
        end
        u114 = true
        return p4
    end
end
v1.getStateFromUpdate = getStateFromUpdate
function v1.processUpdateQueue(p1, p2, p3, p4) -- Line: 500 -- upvalues: u114 (ref), __DEV__ (val), u118 (ref), NoLanes (val), isSubsetOfLanes (val), mergeLanes (val), NoLane (val), getStateFromUpdate (val), Callback (val), markSkippedUpdateLanes (val)
    local updateQueue = p1.updateQueue
    u114 = false
    if __DEV__ then
        u118 = updateQueue.shared
    end
    local firstBaseUpdate = updateQueue.firstBaseUpdate
    local lastBaseUpdate = updateQueue.lastBaseUpdate
    local pending = updateQueue.shared.pending
    if pending ~= nil then
        updateQueue.shared.pending = nil
        local v1 = pending
        local next = v1.next
        v1.next = nil
        if lastBaseUpdate ~= nil then
            lastBaseUpdate.next = next
        else
            firstBaseUpdate = next
        end
        local alternate = p1.alternate
        if alternate ~= nil then
            local updateQueue_2 = alternate.updateQueue
            local lastBaseUpdate_2 = updateQueue_2.lastBaseUpdate
            if lastBaseUpdate_2 ~= v1 then
                if lastBaseUpdate_2 ~= nil then
                    lastBaseUpdate_2.next = next
                else
                    updateQueue_2.firstBaseUpdate = next
                end
                updateQueue_2.lastBaseUpdate = v1
            end
        end
    end
    if firstBaseUpdate ~= nil then
        local effects, eventTime, lane, next_3, pending_2, v2
        local baseState = updateQueue.baseState
        local v3 = NoLanes
        local v4 = nil
        local v5 = nil
        local v6 = nil
        local next_2 = firstBaseUpdate
        local v7 = p4
        while true do
            lane = next_2.lane
            eventTime = next_2.eventTime
            if isSubsetOfLanes(v7, lane) then
                if v6 ~= nil then
                    v2 = {
                        eventTime = eventTime,
                        lane = NoLane,
                        tag = next_2.tag,
                        payload = next_2.payload,
                        callback = next_2.callback,
                    }
                    v6.next = v2
                    v6 = v2
                end
                baseState = getStateFromUpdate(v8, updateQueue, next_2, baseState, v9, v10)
                if next_2.callback ~= nil and next_2.lane ~= NoLane then
                    v8.flags = bit32.bor(v8.flags, Callback)
                    effects = updateQueue.effects
                    if effects ~= nil then
                        table.insert(effects, next_2)
                    else
                        updateQueue.effects = {next_2}
                    end
                end
            else
                v2 = {
                    eventTime = eventTime,
                    lane = lane,
                    tag = next_2.tag,
                    payload = next_2.payload,
                    callback = next_2.callback,
                }
                if v6 ~= nil then
                    v6.next = v2
                    v6 = v2
                else
                    v5 = v2
                    v6 = v2
                    v4 = baseState
                end
                v3 = mergeLanes(v3, lane)
            end
            next_2 = next_2.next
            if next_2 == nil then
                pending_2 = updateQueue.shared.pending
                if pending_2 == nil then
                    break
                end
                v2 = pending_2
                next_3 = v2.next
                v2.next = nil
                next_2 = next_3
                updateQueue.lastBaseUpdate = v2
                updateQueue.shared.pending = nil
            end
        end
        if v6 == nil then
            v4 = baseState
        end
        updateQueue.baseState = v4
        updateQueue.firstBaseUpdate = v5
        updateQueue.lastBaseUpdate = v6
        markSkippedUpdateLanes(v3)
        v8.lanes = v3
        v8.memoizedState = baseState
    end
    if __DEV__ then
        u118 = nil
    end
end
local function callCallback(p1, p2) -- Line: 692
    if type(p1) ~= "function" then
        error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(p1))))
    end
    p1(p2)
end
function v1.resetHasForceUpdateBeforeProcessing() -- Line: 707 -- upvalues: u114 (ref)
    u114 = false
end
function v1.checkHasForceUpdateAfterProcessing() -- Line: 711 -- upvalues: u114 (ref)
    return u114
end
function v1.commitUpdateQueue(p1, p2, p3) -- Line: 715 -- upvalues: u122 (val), u123 (ref)
    local effects = p2.effects
    p2.effects = nil
    if effects ~= nil then
        local callback
        local v1 = effects
        local v2 = nil
        local v3 = nil
        local v4 = p3
        for i, j in v1, v2, v3 do
            callback = j.callback
            if callback ~= nil then
                if type(callback) ~= "function" then
                    error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(callback))))
                end
                callback(v4)
            end
            table.clear(j)
            table.insert(u122, j)
            u123 = u123 + 1
        end
    end
end
return v1