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
--           File: ReplicatedStorage.Common.Chrono.Client.InterpolationBuffer
--                              Dumped in 0.000472 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Config = require(v1.Parent.Parent.Shared.Config)
local RenderCache = require(v1.Parent.RenderCache)
return function(p1, p2, p3) -- Line: 11 -- upvalues: RenderCache (val), Config (val)
    local u3 = {}
    return {
        RegisterPacket = function(p1, p2, a3) -- Line: 14 -- upvalues: RenderCache (upval), u3 (val), Config (upval), p3 (val)
            local v1 = RenderCache.GetEstimatedServerTime(p1) - p2
            local v2 = math.abs(v1)
            if 1 < v2 then
                u3[p1] = nil
                RenderCache.Remove(p1)
                RenderCache.Add(p1)
                if Config.SHOW_WARNINGS then
                    warn((("%* latency too high, cleared cache to repredict in case of error:! %*"):format(p1, v1)))
                end
            end
            if not (u3[p1]) then
                u3[p1] = {deviation = 0, averageLatency = v1, lastLatency = v1}
                return
            end
            v2 = u3[p1]
            if v2.lastLatency then
                local v3 = math.abs(v1 - v2.lastLatency) - v2.deviation
                v2.deviation = v2.deviation + v3 * p3
            end
            v2.averageLatency = v2.averageLatency + (v1 - v2.averageLatency) * p3
            v2.lastLatency = v1
        end,
        GetBuffer = function(a1, a2) -- Line: 49 -- upvalues: u3 (val), p1 (val), p2 (val), Config (upval)
            local v1
            local v2 = u3[a1]
            if not v2 then
                return p1
            end
            local v3 = a2 + v2.deviation * 2
            if v3 >= p1 then
                v1 = v3
            else
                v1 = p1 + (p1 - v3) * 0.2
            end
            if p2 < v1 then
                if Config.SHOW_WARNINGS then
                    warn((("Interpolation buffer exceeded max! Was %*, clamped to %*"):format(v1, p2)))
                end
                v1 = p2
            end
            return v1
        end,
        Remove = function(p1) -- Line: 71 -- upvalues: u3 (val), RenderCache (upval)
            u3[p1] = nil
            RenderCache.Remove(p1)
        end,
        PlayerLatencies = u3,
        Clear = function(p1) -- Line: 76 -- upvalues: u3 (val), RenderCache (upval)
            u3[p1] = nil
            RenderCache.Remove(p1)
            RenderCache.Add(p1)
        end,
    }
end