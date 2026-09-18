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
--            File: ReplicatedStorage.Common.Utilities.Ripple.solvers.linear
--                              Dumped in 0.000327 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
require(v1.Parent.Parent.types)
local config = require(v1.Parent.Parent.config)
local intermediate = require(v1.Parent.Parent.utils.intermediate)
local function configure(p1) -- Line: 12 -- upvalues: config (val)
    local speed
    if type(p1) ~= "table" then
        speed = p1
    else
        speed = p1.speed
    end
    local v1 = {}
    local speed_2 = speed
    if not speed_2 then
        speed_2 = config.linear.default.speed
    end
    v1.speed = speed_2
    return v1
end
return function(p1, p2) -- Line: 20 -- upvalues: configure (val), intermediate (val)
    local u4 = configure(p2)
    local u8 = intermediate.to(p1)
    return function(p1, p2, p3) -- Line: 24 -- upvalues: intermediate (upval), u8 (val), u4 (val)
        local v1 = intermediate.index(u8, p1)
        if not v1 then
            return false
        end
        local v2 = u4.speed * p3 * math.sign(v1 - p2.value)
        local v3 = math.abs(v2)
        if math.abs(v1 - p2.value) > v3 then
            p2.value = p2.value + v2
            p2.velocity = v2
            return
        end
        p2.complete = true
        p2.value = v1
        p2.velocity = 0
    end
end