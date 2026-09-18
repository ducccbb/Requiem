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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.usePrevious
--                              Dumped in 0.000228 seconds
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
local function u27(p1, p2) -- Line: 20
    local v1 = p1 == p2
    return v1
end
return function(p1, p2) -- Line: 33 -- upvalues: u27 (val), react (val)
    local u2
    if p2 ~= nil then
        u2 = p2
    else
        u2 = u27
    end
    local u5 = react.useRef()
    local u8 = react.useRef()
    react.useMemo(function() -- Line: 41 -- upvalues: u2 (ref), u8 (val), p1 (val), u5 (val)
        if not (u2(u8.current, p1)) then
            u5.current = u8.current
            u8.current = p1
        end
    end, {p1})
    return u5.current
end