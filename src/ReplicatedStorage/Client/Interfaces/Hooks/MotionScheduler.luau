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
--            File: ReplicatedStorage.Client.Interfaces.Hooks.MotionScheduler
--                              Dumped in 0.000331 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local u17 = {}
local u18 = nil
local function stopHeartbeatIfIdle() -- Line: 23 -- upvalues: u18 (ref), u17 (val)
    if u18 and next(u17) == nil then
        u18:Disconnect()
        u18 = nil
    end
end
local function ensureHeartbeat() -- Line: 30 -- upvalues: u18 (ref), RunService (val), u17 (val), stopHeartbeatIfIdle (val)
    if u18 then
        return
    end
    u18 = RunService.Heartbeat:Connect(function(p1) -- Line: 35 -- upvalues: u17 (upval), stopHeartbeatIfIdle (upval)
        local v1
        local v2 = u17
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1 = i:step(p1)
            j.onStep(v1)
            if i:isComplete() then
                u17[i] = nil
                if j.onComplete then
                    j.onComplete()
                end
            end
        end
        stopHeartbeatIfIdle()
    end)
end
return {
    register = function(p1, p2, p3) -- Line: 53 -- upvalues: u17 (val), ensureHeartbeat (val), stopHeartbeatIfIdle (val)
        u17[p1] = {motion = p1, onStep = p2, onComplete = p3}
        ensureHeartbeat()
        return function() -- Line: 62 -- upvalues: u17 (upval), p1 (val), stopHeartbeatIfIdle (upval)
            u17[p1] = nil
            stopHeartbeatIfIdle()
        end
    end,
}