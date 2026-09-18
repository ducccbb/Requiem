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
--                File: ReplicatedStorage.Common.Statistics.useCinemaBars
--                              Dumped in 0.000190 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
Statistics.Create("cinema", false)
Statistics.Bind("cinema", function(p1) end)
return function() -- Line: 33 -- upvalues: Statistics (val)
    local cinema = Statistics.Get("cinema")
    return cinema, function(p1, p2, p3, p4) -- Line: 35 -- upvalues: Statistics (upval)
        Statistics.Adjust("cinema", p1, p2, p3, p4)
    end
end