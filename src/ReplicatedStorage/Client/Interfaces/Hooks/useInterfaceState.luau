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
--           File: ReplicatedStorage.Client.Interfaces.Hooks.useInterfaceState
--                              Dumped in 0.000363 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
return function(p1) -- Line: 22 -- upvalues: State (val), react (val), Table (val)
    local u10, u11, u4, u5, v1, v2
    v1, u4, u5, v2 = State(p1)
    u10, u11 = react.useState(u4)
    react.useEffect(function() -- Line: 26 -- upvalues: Table (upval), u4 (val), u10 (val), u11 (val), u5 (val)
        if not (Table.equals(u4, u10)) then
            u11(u4)
        end
        return u5(function(p1) -- Line: 31 -- upvalues: Table (upval), u10 (upval), u11 (upval)
            if not (Table.equals(p1, u10)) then
                local v1
                if typeof(p1) ~= "table" then
                    v1 = p1
                else
                    v1 = table.clone(p1)
                end
                u11(v1)
            end
        end)
    end, {u5})
    return v1, u10, v2
end