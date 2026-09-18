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
--                File: ReplicatedStorage.Common.Statistics.useBlurEffect
--                              Dumped in 0.000323 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
Statistics.Create("blur", 0)
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "__RequiemBlurEffect"
BlurEffect.Size = 0
BlurEffect.Parent = Lighting
Statistics.Bind("blur", function(p1, p2) -- Line: 39 -- upvalues: TweenService (val), BlurEffect (val)
    if not p2 then
        BlurEffect.Size = p1
        return
    end
    if typeof(p2) == "number" then
        return
    end
    TweenService:Create(BlurEffect, p2, {Size = p1}):Play()
end)
return function() -- Line: 51 -- upvalues: Statistics (val)
    local blur = Statistics.Get("blur")
    return blur, function(p1, p2, p3, p4, p5) -- Line: 53 -- upvalues: Statistics (upval)
        Statistics.Adjust("blur", p1, p2, p3, p4, p5)
        return function(a1) -- Line: 62 -- upvalues: Statistics (upval), p1 (val)
            Statistics.Remove("blur", p1, a1)
        end
    end
end