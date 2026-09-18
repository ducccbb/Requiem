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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.useSignal
--                              Dumped in 0.000324 seconds
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
require(Utilities:WaitForChild("Signal"))
return function(p1, p2) -- Line: 23 -- upvalues: react (val)
    react.useEffect(function() -- Line: 24 -- upvalues: p2 (val), p1 (val)
        local u0 = {}
        for i, v in ipairs(p2) do
            if typeof(v) == "table" and v.Connect then
                table.insert(u0, v:Connect(p1))
            end
        end
        return function() -- Line: 38 -- upvalues: u0 (val)
            for i, v in ipairs(u0) do
                v:Disconnect()
            end
        end
    end, p2)
end