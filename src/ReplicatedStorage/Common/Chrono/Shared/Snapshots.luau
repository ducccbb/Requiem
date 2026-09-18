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
--                File: ReplicatedStorage.Common.Chrono.Shared.Snapshots
--                               Dumped in 0.00128 seconds
--                          Bytecode version 9  |  11 functions

local Push
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Config = require(script.Parent.Parent.Shared.Config)
local MAX_SNAPSHOT_COUNT = Config.MAX_SNAPSHOT_COUNT
local SHOW_WARNINGS = Config.SHOW_WARNINGS
local function WarnIfEnabled(...) -- Line: 31 -- upvalues: SHOW_WARNINGS (val)
    if SHOW_WARNINGS then
        warn(...)
    end
end
local function GetBufferIndex(p1, p2) -- Line: 37 -- upvalues: MAX_SNAPSHOT_COUNT (val)
    return (p1 + p2 - 2) % MAX_SNAPSHOT_COUNT + 1
end
local function EaseOut(p1, p2) -- Line: 41
    if p1 <= 0 then
        return 0
    end
    if 1 <= p1 then
        return 1
    end
    if p2 <= 1 then
        return p1
    end
    return 1 - (1 - p1) ^ p2
end
local function BinarySearchInsertionPoint(p1, p2) -- Line: 54 -- upvalues: GetBufferIndex (val)
    local v1
    local count = p1.count
    if count == 0 then
        return 1
    end
    local v2 = 1
    local v3 = count
    local cache = p1.cache
    local head = p1.head
    local v4 = p2
    while v2 <= v3 do
        v1 = (v2 + v3) // 2
        if cache[GetBufferIndex(head, v1)].t >= v4 then
            v3 = v1 - 1
        else
            v2 = v1 + 1
        end
    end
    return v2
end
local function ShiftElementsRight(p1, p2, p3) -- Line: 80 -- upvalues: GetBufferIndex (val)
    local v1, v2
    local cache = p1.cache
    local head = p1.head
    local v3 = p2
    local v4 = -1
    for i = p3, v3, v4 do
        v1 = GetBufferIndex(head, i)
        v2 = GetBufferIndex(head, i + 1)
        cache[v2] = cache[v1]
    end
end
local function GetLatest(p1) -- Line: 91 -- upvalues: GetBufferIndex (val)
    if p1.count == 0 then
        return nil
    end
    local v1 = GetBufferIndex(p1.head, p1.count)
    return p1.cache[v1]
end
function Push(p1, p2, p3, p4, p5) -- Line: 100 -- upvalues: GetLatest (val), Config (val), Push (val), BinarySearchInsertionPoint (val), MAX_SNAPSHOT_COUNT (val), GetBufferIndex (val), ShiftElementsRight (val)
    local v1, v2, v3, v4
    local v5 = {t = p2, value = p3, velocity = p4}
    if p1.count == 0 then
        p1.cache[p1.head] = v5
        p1.count = 1
        return
    end
    local v6 = GetLatest(p1)
    if not p5 and v6 then
        v3 = p2 - v6.t
        if 0.1 < v3 and Config.FLAGS and Config.FLAGS.SNAPSHOT_INTERPOLATION_FIX then
            Push(p1, p2 - 0.05, v6.value, Vector3.zero, true)
        end
    end
    v3 = BinarySearchInsertionPoint(p1, p2)
    if p1.count < v3 then
        if p1.count >= MAX_SNAPSHOT_COUNT then
            p1.cache[p1.head] = v5
            p1.head = p1.head % MAX_SNAPSHOT_COUNT + 1
            return
        end
        v4 = GetBufferIndex(p1.head, p1.count + 1)
        p1.cache[v4] = v5
        p1.count = p1.count + 1
        return
    end
    if p1.count < MAX_SNAPSHOT_COUNT then
        ShiftElementsRight(p1, v3, p1.count)
        v4 = GetBufferIndex(p1.head, v3)
        p1.cache[v4] = v5
        p1.count = p1.count + 1
        return
    end
    v4 = v3 - 1
    local v7 = 1
    for i = 1, v4, v7 do
        v1 = GetBufferIndex(p1.head, i + 1)
        v2 = GetBufferIndex(p1.head, i)
        p1.cache[v2] = p1.cache[v1]
    end
    v4 = GetBufferIndex(p1.head, v3)
    p1.cache[v4] = v5
end
local function GetAt(p1, p2) -- Line: 156 -- upvalues: GetBufferIndex (val), BinarySearchInsertionPoint (val), Config (val), EaseOut (val), WarnIfEnabled (val)
    local v1, v2, v3
    local count = p1.count
    if count == 0 then
        return nil
    end
    if count == 1 then
        local v4 = GetBufferIndex(p1.head, 1)
        return p1.cache[v4].value
    end
    local cache = p1.cache
    local head = p1.head
    local Lerp = p1.Lerp
    local v5 = BinarySearchInsertionPoint(p1, p2)
    local v6 = v5 - 1
    local v7 = nil
    local v8 = nil
    if 1 <= v6 and v6 <= count then
        v7 = cache[GetBufferIndex(head, v6)]
    end
    if 1 <= v5 and v5 <= count then
        v8 = cache[GetBufferIndex(head, v5)]
    end
    if not v7 or not v8 then
        if v7 then
            WarnIfEnabled("Tried to fetch a time that was ahead of snapshot storage!")
            return v7.value
        end
        if v8 then
            WarnIfEnabled("Tried to fetch a time that was behind snapshot storage!")
            return v8.value
        end
        return nil
    end
    local v9 = v8.t - v7.t
    if v9 == 0 then
        return v7.value
    end
    local v10 = (p2 - v7.t) / v9
    if Config.FIRST_MOVE_SMOOTHING_ENABLED then
        local FIRST_MOVE_IDLE_VELOCITY_THRESHOLD = Config.FIRST_MOVE_IDLE_VELOCITY_THRESHOLD
        local velocity = v7.velocity
        local velocity_2 = v8.velocity
        if velocity and velocity_2 then
            local v11 = velocity.Magnitude <= FIRST_MOVE_IDLE_VELOCITY_THRESHOLD
            v1 = FIRST_MOVE_IDLE_VELOCITY_THRESHOLD < velocity_2.Magnitude
            if v11 and v1 then
                v10 = EaseOut(v10, Config.FIRST_MOVE_EASE_EXPONENT)
            end
        end
    end
    v1 = Lerp(v7.value.Position, v8.value.Position, v7.velocity, v8.velocity, v10, v9)
    v2, v3 = (v8.value.Rotation * v7.value.Rotation:Inverse()):ToAxisAngle()
    local v12 = v7.value.Rotation * CFrame.fromAxisAngle(v2, v3 * v10)
    return CFrame.new(v1) * v12
end
local function Clear(p1) -- Line: 231
    p1.head = 1
    p1.count = 0
end
return function(p1) -- Line: 236 -- upvalues: MAX_SNAPSHOT_COUNT (val), Push (val), GetLatest (val), GetAt (val), Clear (val)
    local v1 = table.create(MAX_SNAPSHOT_COUNT)
    local v2 = MAX_SNAPSHOT_COUNT
    local v3 = 1
    for i = 1, v2, v3 do
        v1[i] = {t = 0}
    end
    return {
        head = 1,
        count = 0,
        cache = v1,
        Lerp = p1,
        Push = Push,
        GetLatest = GetLatest,
        GetAt = GetAt,
        Clear = Clear,
    }
end