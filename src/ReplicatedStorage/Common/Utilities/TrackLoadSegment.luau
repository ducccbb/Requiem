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
--               File: ReplicatedStorage.Common.Utilities.TrackLoadSegment
--                              Dumped in 0.000267 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedFirst = game:GetService("ReplicatedFirst")
require(ReplicatedFirst:WaitForChild("Profiling"))
return {
    trackLoadSegment = function(p1, p2, p3, p4) -- Line: 14
        local Name = p2.Name
        print((("[%*] %* starting %*"):format(p1, Name, p3)))
        local u13 = false
        task.delay(5, function() -- Line: 22 -- upvalues: u13 (ref), p1 (val), p2 (val), p3 (val)
            if not u13 then
                warn((("[%*] %* still pending after 5s %*"):format(p1, p2.Name, p3)))
            end
        end)
        p4:finally(function(a1) -- Line: 29 -- upvalues: u13 (ref), p1 (val), p2 (val), p3 (val)
            u13 = true
            local v1 = string.lower(a1)
            print((("[%*] %* %* %*"):format(p1, p2.Name, v1, p3)))
        end)
        return p4
    end,
}