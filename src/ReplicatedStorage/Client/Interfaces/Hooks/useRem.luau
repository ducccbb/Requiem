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
--                File: ReplicatedStorage.Client.Interfaces.Hooks.useRem
--                              Dumped in 0.000255 seconds
--                          Bytecode version 9  |  3 functions

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
local useCallback = react.useCallback
return function() -- Line: 42 -- upvalues: react (val), RemProvider (val), useCallback (val)
    local u4 = react.useContext(RemProvider.RemContext)
    return useCallback(function(p1, p2) -- Line: 45 -- upvalues: u4 (val)
        local v1
        local v2 = p2 or "unit"
        if v2 == "pixel" then
            return p1 * u4 / 16
        end
        if v2 ~= "scale" then
            v1 = p1 * (u4 / 16)
        else
            v1 = p1 * u4
            if not v1 then
                v1 = p1 * (u4 / 16)
            end
        end
        return v1
    end, {u4})
end