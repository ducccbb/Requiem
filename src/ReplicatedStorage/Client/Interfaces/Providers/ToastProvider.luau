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
--           File: ReplicatedStorage.Client.Interfaces.Providers.ToastProvider
--                              Dumped in 0.000626 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local HttpService = game:GetService("HttpService")
local u34 = react.createContext(nil)
local u37 = react.createContext(nil)
local v2 = {}
function v2.ToastProvider(p1) -- Line: 45 -- upvalues: react (val), HttpService (val), u34 (val), u37 (val)
    local u4, u5
    local v1 = {}
    u4, u5 = react.useState(v1)
    local v2 = {}
    local u10 = react.useCallback(function(p1) -- Line: 49 -- upvalues: u5 (val)
        u5(function(a1) -- Line: 50 -- upvalues: p1 (val)
            local v1 = {}
            local v2 = false
            local v3 = a1
            local v4 = nil
            local v5 = nil
            for i, j in v3, v4, v5 do
                if j.id ~= p1 then
                    table.insert(v1, j)
                else
                    v2 = true
                end
            end
            if not v2 then
                v3 = a1
            else
                v3 = v1
                if not v3 then
                    v3 = a1
                end
            end
            return v3
        end)
    end, v2)
    local u15 = react.useCallback(function(p1) -- Line: 68 -- upvalues: HttpService (upval), u5 (val)
        local u5 = HttpService:GenerateGUID(false)
        u5(function(a1) -- Line: 71 -- upvalues: p1 (val), u5 (val)
            local v1 = table.clone(a1)
            local v2 = table.clone(p1)
            v2.id = u5
            v2.created = tick()
            table.insert(v1, v2)
            return v1
        end)
        task.delay(5, function() -- Line: 83 -- upvalues: u5 (upval), u5 (val)
            u5(function(p1) -- Line: 84 -- upvalues: u5 (upval)
                local v1 = {}
                local v2 = false
                local v3 = p1
                local v4 = nil
                local v5 = nil
                for i, j in v3, v4, v5 do
                    if j.id ~= u5 then
                        table.insert(v1, j)
                    else
                        v2 = true
                    end
                end
                if not v2 then
                    v3 = p1
                else
                    v3 = v1
                    if not v3 then
                        v3 = p1
                    end
                end
                return v3
            end)
        end)
    end, {})
    v2 = react.useMemo(function() -- Line: 103 -- upvalues: u15 (val), u10 (val)
        return {addToast = u15, removeToast = u10}
    end, {})
    local v3 = react.useMemo(function() -- Line: 111 -- upvalues: u4 (val)
        return {toasts = u4}
    end, {u4})
    return react.createElement(u34.Provider, {value = v2}, {StateProvider = react.createElement(u37.Provider, {value = v3}, p1.children)})
end
v2.ToastActionsContext = u34
v2.ToastStateContext = u37
return v2