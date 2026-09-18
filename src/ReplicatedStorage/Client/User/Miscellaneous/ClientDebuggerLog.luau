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
--          File: ReplicatedStorage.Client.User.Miscellaneous.ClientDebuggerLog
--                               Dumped in 0.00108 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Debugger = require(Namespaces:WaitForChild("Debugger"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Logger = require(Common_2:WaitForChild("Logger"))
local u50 = {}
local u51 = {}
local u52 = {}
local u53 = {}
local u54 = 0
local u55 = 0
local u56 = false
local u57 = false
local function entryKey(p1) -- Line: 42
    local v1 = tostring(p1.channel)
    return string.format("%s:%s", v1, (tostring(p1.logId)))
end
local function buildMergedList() -- Line: 51 -- upvalues: u50 (ref), entryKey (val), u51 (ref), u52 (ref)
    local v1
    local v2 = {}
    local v3 = {}
    local v4 = u50
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = entryKey(j)
        if not (v2[v1]) then
            v2[v1] = true
            table.insert(v3, j)
        end
    end
    v4 = u51
    v5 = nil
    v6 = nil
    for k, n in v4, v5, v6 do
        v1 = entryKey(n)
        if not (v2[v1]) then
            v2[v1] = true
            table.insert(v3, n)
        end
    end
    table.sort(v3, function(p1, p2) -- Line: 71
        local unixTimestamp, unixTimestamp_2, v1
        if typeof(p1.unixTimestamp) ~= "number" then
            unixTimestamp = 0
        else
            unixTimestamp = p1.unixTimestamp
        end
        if typeof(p2.unixTimestamp) ~= "number" then
            unixTimestamp_2 = 0
        else
            unixTimestamp_2 = p2.unixTimestamp
            if not unixTimestamp_2 then
                unixTimestamp_2 = 0
            end
        end
        if unixTimestamp ~= unixTimestamp_2 then
            v1 = unixTimestamp_2 < unixTimestamp
            return v1
        end
        local v2 = tostring(p1.channel)
        local v3 = v2 .. tostring(p1.logId)
        local v4 = tostring(p2.channel)
        v1 = v4 .. tostring(p2.logId) < v3
        return v1
    end)
    if 1000 < #v3 then
        v4 = {}
        v5 = 1000
        v6 = 1
        for m = 1, v5, v6 do
            v4[m] = v3[m]
        end
        v3 = v4
    end
    u52 = v3
end
local function notifySubscribers() -- Line: 95 -- upvalues: u53 (val), u52 (ref)
    for k, v in pairs(u53) do
        v(u52)
    end
end
local function appendClientEntry(p1) -- Line: 106 -- upvalues: u51 (ref), buildMergedList (val), notifySubscribers (val)
    table.insert(u51, p1)
    local v1 = #u51
    if 1000 < v1 then
        table.remove(u51, 1)
    end
    buildMergedList()
    notifySubscribers()
end
local function ensureLocalLoggerHook() -- Line: 121 -- upvalues: u56 (ref), u51 (ref), Logger (val), appendClientEntry (val)
    if u56 then
        return
    end
    u56 = true
    u51 = Logger.getRecentLogs()
    Logger.subscribe(appendClientEntry)
end
local function applyServerSnapshot(p1) -- Line: 137 -- upvalues: u50 (ref), buildMergedList (val), notifySubscribers (val)
    u50 = p1
    buildMergedList()
    notifySubscribers()
end
local function applyServerEntry(p1) -- Line: 149 -- upvalues: u50 (ref), buildMergedList (val), notifySubscribers (val)
    table.insert(u50, p1)
    local v1 = #u50
    if 1000 < v1 then
        table.remove(u50, 1)
    end
    buildMergedList()
    notifySubscribers()
end
local function ensureServerListener() -- Line: 164 -- upvalues: u57 (ref), Debugger (val), applyServerSnapshot (val), applyServerEntry (val)
    if u57 then
        return
    end
    u57 = true
    Debugger.Logs.listen(function(p1) -- Line: 170 -- upvalues: applyServerSnapshot (upval), applyServerEntry (upval)
        if typeof(p1) ~= "table" then
            return
        end
        if typeof(p1.snapshot) == "table" then
            applyServerSnapshot(p1.snapshot)
            return
        end
        if typeof(p1.entry) ~= "table" then
            return
        end
        applyServerEntry(p1.entry)
    end)
end
return {
    setViewerOpen = function(p1) -- Line: 193 -- upvalues: ensureLocalLoggerHook (val), ensureServerListener (val), u55 (ref), Debugger (val)
        ensureLocalLoggerHook()
        ensureServerListener()
        if p1 then
            u55 = u55 + 1
            if u55 == 1 then
                Debugger.Logs.post({open = true})
            end
            return
        end
        if 0 < u55 then
            u55 = u55 - 1
        end
        if u55 == 0 then
            Debugger.Logs.post({open = false})
        end
    end,
    getMergedLogs = function() -- Line: 217 -- upvalues: u52 (ref)
        return u52
    end,
    subscribe = function(p1) -- Line: 227 -- upvalues: ensureLocalLoggerHook (val), ensureServerListener (val), u54 (ref), u53 (val), u52 (ref)
        ensureLocalLoggerHook()
        ensureServerListener()
        u54 = u54 + 1
        local u7 = u54
        u53[u7] = p1
        p1(u52)
        return function() -- Line: 237 -- upvalues: u53 (upval), u7 (val)
            u53[u7] = nil
        end
    end,
}