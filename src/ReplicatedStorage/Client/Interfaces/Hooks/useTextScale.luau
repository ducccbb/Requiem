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
--             File: ReplicatedStorage.Client.Interfaces.Hooks.useTextScale
--                              Dumped in 0.000222 seconds
--                          Bytecode version 9  |  4 functions

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
local RemProvider = require(Providers:WaitForChild("RemProvider"))
return function(p1) -- Line: 34 -- upvalues: react (val), RemProvider (val)
    if p1 ~= nil and p1 ~= 0.5 then
        error("useTextScale only supports the default dominant axis (0.5). Use RemProvider to customize scaling.")
    end
    local u9 = react.useContext(RemProvider.RemContext) / 16
    return react.useMemo(function() -- Line: 42 -- upvalues: u9 (val)
        return function(p1) -- Line: 43 -- upvalues: u9 (upval)
            return p1 * u9
        end
    end, {u9})
end