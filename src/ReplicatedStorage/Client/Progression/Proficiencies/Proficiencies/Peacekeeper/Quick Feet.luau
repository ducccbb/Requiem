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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Peacekeeper.Quick Feet
--                              Dumped in 0.000378 seconds
--                          Bytecode version 9  |  4 functions

local u67, u70
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics_2 = Common_3:WaitForChild("Statistics")
_, u67 = require(Statistics_2:WaitForChild("useWalkSpeed"))()
_, u70 = useFieldOfView()
return {
    activated = function(p1, p2) -- Line: 27 -- upvalues: u67 (val), u70 (val), Signals (val)
        local u10 = u67("quick_feet", 1.4, "multiply", 10, TweenInfo.new(0.5))
        local u19 = u70("quick_feet", 20, "add", 10, TweenInfo.new(0.5))
        Signals.Monologue:Fire({"My quick feet are helping me move faster!", "I'm feeling faster than ever!"})
        task.delay(10, function() -- Line: 34 -- upvalues: u10 (ref), u19 (val), u67 (upval), Signals (upval)
            if u10 then
                u10(TweenInfo.new(1))
            end
            if u19 then
                u19(TweenInfo.new(1, Enum.EasingStyle.Back))
            end
            u10 = u67("quick_feet", 5, "set", 15, TweenInfo.new(0.5))
            Signals.Monologue:Fire("I'm feeling exhausted...")
            task.delay(7.5, function() -- Line: 48 -- upvalues: u10 (upval)
                if u10 then
                    u10(TweenInfo.new(1))
                end
            end)
        end)
    end,
}