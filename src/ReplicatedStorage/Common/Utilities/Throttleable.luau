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
--                 File: ReplicatedStorage.Common.Utilities.Throttleable
--                              Dumped in 0.000384 seconds
--                          Bytecode version 9  |  8 functions

local Heartbeat
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
if not (RunService:IsServer()) then
    Heartbeat = RunService.RenderStepped
else
    Heartbeat = RunService.Heartbeat
    if not Heartbeat then
        Heartbeat = RunService.RenderStepped
    end
end
return {
    useThrottleable = function(p1) -- Line: 24 -- upvalues: Heartbeat (val)
        local u1 = {}
        local u6 = Heartbeat:Connect(function() -- Line: 26 -- upvalues: u1 (val)
            local v1, v2
            for i, v in ipairs(u1) do
                v1 = os.clock() - v.called
                if v.rate <= v1 then
                    v1, v2 = pcall(function() -- Line: 29 -- upvalues: v (val)
                        v.callback(function(p1) -- Line: 30 -- upvalues: v (upval)
                            v.rate = p1
                            v.called = os.clock()
                        end)
                        v.called = os.clock()
                    end)
                    if not v1 then
                        return warn(v2)
                    end
                end
            end
        end)
        p1(function(p1) -- Line: 45 -- upvalues: u1 (val)
            local u1 = {rate = 0, callback = p1, called = os.clock()}
            table.insert(u1, u1)
            return function() -- Line: 49 -- upvalues: u1 (upval), u1 (val)
                local v1 = table.find(u1, u1)
                if v1 then
                    table.remove(u1, v1)
                end
            end
        end)
        return function() -- Line: 57 -- upvalues: u6 (ref)
            if u6 then
                u6:Disconnect()
            end
            u6 = nil
        end
    end,
}