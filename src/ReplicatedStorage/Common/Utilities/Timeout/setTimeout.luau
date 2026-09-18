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
--              File: ReplicatedStorage.Common.Utilities.Timeout.setTimeout
--                              Dumped in 0.000219 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
return function(p1, p2) -- Line: 22 -- upvalues: RunService (val)
    local Heartbeat
    local u2 = 0
    local u3 = nil
    if not (RunService:IsServer()) then
        Heartbeat = RunService.RenderStepped
    else
        Heartbeat = RunService.Heartbeat
        if not Heartbeat then
            Heartbeat = RunService.RenderStepped
        end
    end
    u3 = Heartbeat:Connect(function(a1) -- Line: 27 -- upvalues: u2 (ref), p2 (val), u3 (ref), p1 (val)
        u2 = u2 + a1
        if p2 <= u2 then
            u3:Disconnect()
            p1()
        end
    end)
    return function() -- Line: 36 -- upvalues: u3 (ref)
        u3:Disconnect()
    end
end