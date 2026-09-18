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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Hooks.useDebuggerPages
--                              Dumped in 0.000285 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Providers = script.Parent.Parent:WaitForChild("Providers")
local DebugProvider = require(Providers:WaitForChild("DebugProvider"))
return function() -- Line: 18 -- upvalues: react (val), DebugProvider (val)
    local u4 = react.useContext(DebugProvider.PagesContext)
    local v1 = react.useCallback(function(p1) -- Line: 22 -- upvalues: u4 (val)
        u4.setPages(table.clone(p1))
    end, {u4.setPages})
    local v2 = react.useCallback(function(p1) -- Line: 26 -- upvalues: u4 (val)
        if not p1 then
            return
        end
        u4.setPages(function(a1) -- Line: 32 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            if not (v1[p1]) then
                v1[p1] = false
            end
            v1[p1] = not v1[p1]
            return v1
        end)
    end, {u4.setPages})
    return u4.pages, v1, v2
end