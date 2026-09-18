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
--              File: ReplicatedStorage.Common.Observers.useCameraObserver
--                              Dumped in 0.000266 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
return function(p1) -- Line: 33 -- upvalues: RunService (val), Workspace (val)
    if not (RunService:IsClient()) then
        return error("useCameraObserver must be used on the client")
    end
    local u35 = nil
    if Workspace.CurrentCamera then
        local v1 = p1(Workspace.CurrentCamera)
        if typeof(v1) == "function" then
            u35 = v1
        end
    else
        Workspace:GetPropertyChangedSignal("CurrentCamera"):Wait()
        local v2 = p1(Workspace.CurrentCamera)
        if typeof(v2) == "function" then
            u35 = v2
        end
    end
    return function() -- Line: 61 -- upvalues: u35 (ref)
        if u35 then
            u35()
        end
    end
end