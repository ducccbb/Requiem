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
--               File: ReplicatedStorage.Common.Chrono.Client.RenderCache
--                              Dumped in 0.000734 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Config = require(script.Parent.Parent.Shared.Config)
local u18 = nil
local u19 = nil
local u20 = {}
local u21 = {}
local u22 = {}
local function GetBuffer(p1) -- Line: 32 -- upvalues: u21 (val), u22 (val), Config (val), u19 (ref), u18 (ref)
    if not (u21[p1]) then
        local TICK_RATE = u18[p1]
        if not TICK_RATE then
            TICK_RATE = Config.TICK_RATE
        end
        return u19.GetBuffer(p1, TICK_RATE)
    end
    local v1 = u22[p1] or "DEFAULT"
    local DEFAULT = Config.NPC_TYPES[v1]
    if not DEFAULT then
        warn((("RenderCache: No NPC config found for type %*. Make sure to define it in the config"):format(v1)))
        DEFAULT = Config.NPC_TYPES.DEFAULT
    end
    return DEFAULT.BUFFER
end
return {
    Init = function(p1) -- Line: 24 -- upvalues: u18 (ref), u19 (ref)
        u18 = p1.playerTickRates
        u19 = p1.bufferTracker
    end,
    GetBuffer = GetBuffer,
    OnSnapshotUpdate = function(p1) -- Line: 46 -- upvalues: u20 (val), GetBuffer (val)
        local v1
        local v2 = os.clock()
        local v3 = p1
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v1 = u20[i]
            if not v1 then
                u20[i] = {lastClockAt = j, lastClockDuration = v2}
            end
            if v1.lastClockAt < j then
                v1.lastClockAt = j
                v1.lastClockDuration = v2
                if not v1.renderAt then
                    v1.renderAt = j - GetBuffer(i)
                end
            end
        end
    end,
    Update = function(p1) -- Line: 73 -- upvalues: u20 (val), GetBuffer (val)
        local renderAt, v1, v2, v3, v4, v5
        local v6 = os.clock()
        local v7 = u20
        local v8 = nil
        local v9 = nil
        for i, j in v7, v8, v9 do
            v3 = GetBuffer(i)
            v4 = j.lastClockAt + (v6 - j.lastClockDuration)
            renderAt = j.renderAt
            if not renderAt then
                renderAt = v4 - v3
            end
            v5 = renderAt + v10
            v1 = v3 - (v4 - v5)
            v2 = math.abs(v1)
            if 0.1 < v2 then
                v5 = v4 - v3
            elseif 0.01 < v1 then
                v5 = math.max(v4 - v3, v5 - v10 * 0.1)
            elseif v1 < -0.01 then
                v5 = math.min(v4 - v3, v5 + v10 * 0.1)
            end
            j.renderAt = v5
        end
    end,
    GetTargetRenderTime = function(p1) -- Line: 100 -- upvalues: u20 (val)
        local v1 = u20[p1]
        if not v1 then
            warn((("RenderCache: No render time for network ID %*"):format(p1)))
            return 0
        end
        if v1.renderAt then
            return v1.renderAt
        end
        warn((("RenderCache: No render time for network ID %*"):format(p1)))
        return 0
    end,
    GetEstimatedServerTime = function(p1) -- Line: 109 -- upvalues: u20 (val)
        local v1 = u20[p1]
        if v1 then
            return v1.lastClockAt + (os.clock() - v1.lastClockDuration)
        end
        warn((("RenderCache: No estimated server time for network ID %*"):format(p1)))
        return 0
    end,
    Add = function(p1, p2, p3) -- Line: 118 -- upvalues: u20 (val), u21 (val), u22 (val)
        if not (u20[p1]) then
            u20[p1] = {lastClockAt = 0, lastClockDuration = 0}
        end
        u21[p1] = p2 or false
        if p2 then
            u22[p1] = p3 or "DEFAULT"
        end
    end,
    Remove = function(p1) -- Line: 132 -- upvalues: u20 (val), u21 (val), u22 (val)
        u20[p1] = nil
        u21[p1] = nil
        u22[p1] = nil
    end,
}