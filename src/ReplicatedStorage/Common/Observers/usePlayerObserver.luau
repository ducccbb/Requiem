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
--              File: ReplicatedStorage.Common.Observers.usePlayerObserver
--                              Dumped in 0.000687 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
return function(p1) -- Line: 10 -- upvalues: Players (val)
    local u1 = nil
    local u3 = {}
    local function OnPlayerAdded(a1) -- Line: 17 -- upvalues: u1 (ref), p1 (val), u3 (val)
        if not u1.Connected then
            return
        end
        task.spawn(function() -- Line: 22 -- upvalues: p1 (upval), a1 (val), u1 (upval), u3 (upval)
            local v1 = p1(a1)
            if typeof(v1) ~= "function" then
                return
            end
            if not u1.Connected then
                task.spawn(v1)
                return
            end
            if a1.Parent then
                u3[a1] = v1
                return
            end
            task.spawn(v1)
        end)
    end
    local function OnPlayerRemoving(p1) -- Line: 35 -- upvalues: u3 (val)
        local v1 = u3[p1]
        u3[p1] = nil
        if typeof(v1) == "function" then
            task.spawn(v1)
        end
    end
    u1 = Players.PlayerAdded:Connect(OnPlayerAdded)
    local u19 = Players.PlayerRemoving:Connect(OnPlayerRemoving)
    task.defer(function() -- Line: 48 -- upvalues: u1 (ref), Players (upval), OnPlayerAdded (val)
        if not u1.Connected then
            return
        end
        for i, j in Players:GetPlayers() do
            task.spawn(OnPlayerAdded, j)
        end
    end)
    return function() -- Line: 59 -- upvalues: u1 (ref), u19 (ref), u3 (val), OnPlayerRemoving (val)
        u1:Disconnect()
        u19:Disconnect()
        local v1 = next(u3)
        while v1 do
            OnPlayerRemoving(v1)
            v1 = next(u3)
        end
    end
end