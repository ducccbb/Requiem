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
--          File: ReplicatedStorage.Client.Interfaces.Hooks.useBindingListener
--                              Dumped in 0.000307 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Components = v1.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Bindings = require(Utilities:WaitForChild("Bindings"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useLatestCallback = require(v1.Parent:WaitForChild("useLatestCallback"))
return function(p1, p2) -- Line: 13 -- upvalues: react (val), Bindings (val), useLatestCallback (val)
    local u7 = react.useMemo(function() -- Line: 14 -- upvalues: Bindings (upval), p1 (val)
        return Bindings.getBindingApi(p1)
    end, {p1})
    local u10 = useLatestCallback(p2)
    react.useEffect(function() -- Line: 20 -- upvalues: u7 (val), u10 (val), p1 (val)
        if not u7 then
            return u10(p1)
        end
        u10(u7.getValue())
        return u7.subscribe(u10)
    end, {p1})
end