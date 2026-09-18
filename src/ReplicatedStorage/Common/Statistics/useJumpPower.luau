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
--                File: ReplicatedStorage.Common.Statistics.useJumpPower
--                              Dumped in 0.000691 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local TweenService = game:GetService("TweenService")
local Observers = v1.Parent.Parent:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
Statistics.Create("jumppower", 50)
useCharacterObserver(function(p1) -- Line: 35 -- upvalues: Statistics (val), TweenService (val)
    local u5 = Statistics.Bind("jumppower", function(a1, p2, p3) -- Line: 38 -- upvalues: p1 (val), TweenService (upval)
        local Humanoid = p1:FindFirstChildOfClass("Humanoid")
        if not Humanoid then
            Humanoid = p1:WaitForChild("Humanoid", 10)
        end
        if not Humanoid then
            return
        end
        Humanoid.UseJumpPower = true
        if p2 then
            TweenService:Create(Humanoid, p2, {JumpPower = a1}):Play()
            return
        end
        local v1 = TweenInfo.new(0)
        TweenService:Create(Humanoid, v1, {JumpPower = a1}):Play()
    end)
    task.spawn(function() -- Line: 57 -- upvalues: p1 (val)
        local Humanoid = p1:WaitForChild("Humanoid", 10)
        if Humanoid then
            Humanoid.UseJumpPower = true
        end
    end)
    return function() -- Line: 64 -- upvalues: u5 (val)
        u5()
    end
end)
return function() -- Line: 71 -- upvalues: Statistics (val)
    local jumppower = Statistics.Get("jumppower")
    return jumppower, function(p1, p2, p3, p4, p5) -- Line: 73 -- upvalues: Statistics (upval)
        Statistics.Adjust("jumppower", p1, p2, p3, p4, p5)
        return function(a1) -- Line: 82 -- upvalues: Statistics (upval), p1 (val)
            Statistics.Remove("jumppower", p1, a1)
        end
    end
end