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
--                File: ReplicatedStorage.Common.Statistics.useWalkSpeed
--                              Dumped in 0.000406 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Observers = v1.Parent.Parent:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
Statistics.Create("walkspeed", 0)
useCharacterObserver(function() -- Line: 36 -- upvalues: Statistics (val), Players (val), TweenService (val)
    local u4 = Statistics.Bind("walkspeed", function(p1, p2, p3) -- Line: 39 -- upvalues: Players (upval), TweenService (upval)
        local Character = Players.LocalPlayer.Character
        if not Character then
            return
        end
        local Humanoid = Character:WaitForChild("Humanoid")
        if not Humanoid then
            return
        end
        if p2 then
            TweenService:Create(Humanoid, p2, {WalkSpeed = p1}):Play()
            return
        end
        local v1 = TweenInfo.new(0)
        TweenService:Create(Humanoid, v1, {WalkSpeed = p1}):Play()
    end)
    return function() -- Line: 60 -- upvalues: u4 (val)
        u4()
    end
end)
return function() -- Line: 67 -- upvalues: Statistics (val)
    local walkspeed = Statistics.Get("walkspeed")
    return walkspeed, function(p1, p2, p3, p4, p5) -- Line: 69 -- upvalues: Statistics (upval)
        Statistics.Adjust("walkspeed", p1, p2, p3, p4, p5)
        return function(a1) -- Line: 78 -- upvalues: Statistics (upval), p1 (val)
            Statistics.Remove("walkspeed", p1, a1)
        end
    end
end