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
--                File: ReplicatedStorage.Common.Statistics.useCameraTilt
--                              Dumped in 0.000432 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Observers = v1.Parent.Parent:WaitForChild("Observers")
local useCameraObserver = require(Observers:WaitForChild("useCameraObserver"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local useNumberEasing = require(Utilities:WaitForChild("useNumberEasing"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities_2:WaitForChild("Statistics"))
Statistics.Create("tilt", 0)
useCameraObserver(function(p1) -- Line: 36 -- upvalues: useNumberEasing (val), Statistics (val), RunService (val)
    local u3, u4, u5
    u3, u4, u5 = useNumberEasing(0)
    local u10 = Statistics.Bind("tilt", function(p1, p2, p3) -- Line: 41 -- upvalues: u4 (val)
        if not p2 then
            u4(p1)
            return
        end
        if typeof(p2) ~= "TweenInfo" then
            return
        end
        u4(p1, p2)
    end)
    local u16 = RunService.RenderStepped:Connect(function() -- Line: 52 -- upvalues: p1 (val), u3 (val)
        p1.CFrame = p1.CFrame * CFrame.Angles(0, 0, (math.rad((u3()))))
    end)
    return function() -- Line: 56 -- upvalues: u10 (val), u16 (val), u5 (val)
        u10()
        u16:Disconnect()
        u5()
    end
end)
return function() -- Line: 66 -- upvalues: Statistics (val)
    local tilt = Statistics.Get("tilt")
    return tilt, function(p1, p2, p3, p4, p5) -- Line: 68 -- upvalues: Statistics (upval)
        Statistics.Adjust("tilt", p1, p2, p3, p4, p5)
        return function(a1) -- Line: 77 -- upvalues: Statistics (upval), p1 (val)
            Statistics.Remove("tilt", p1, a1)
        end
    end
end