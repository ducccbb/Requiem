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
--               File: ReplicatedStorage.Common.Statistics.useFieldOfView
--                              Dumped in 0.000743 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Observers = v1.Parent.Parent:WaitForChild("Observers")
local useCameraObserver = require(Observers:WaitForChild("useCameraObserver"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
Statistics.Create("fieldofview", 70)
local u50 = nil
useCameraObserver(function(p1) -- Line: 38 -- upvalues: Statistics (val), u50 (ref), RunService (val), TweenService (val)
    local u5 = Statistics.Bind("fieldofview", function(a1, p2, p3) -- Line: 41 -- upvalues: u50 (upval), p1 (val), RunService (upval), TweenService (upval)
        local FieldOfView, u18, u23, u24
        if u50 then
            u50:Disconnect()
        end
        if p2 then
            if typeof(p2) == "number" then
                u18 = p3
                if not u18 then
                    function u18(p1) -- Line: 49
                        return p1
                    end
                end
                FieldOfView = p1.FieldOfView
                u23 = a1 - FieldOfView
                u24 = 0
                u50 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 61 -- upvalues: u24 (ref), p2 (val), u50 (upval), p1 (upval), a1 (val), u18 (val), u23 (val), FieldOfView (val)
                    u24 = u24 + a1_2
                    if p2 <= u24 then
                        u50:Disconnect()
                        p1.FieldOfView = a1
                        return
                    end
                    local v1 = u18(u24 / p2)
                    p1.FieldOfView = v1 * u23 + FieldOfView
                end)
                return
            end
            TweenService:Create(p1, p2, {FieldOfView = a1}):Play()
            return
        end
        if not p3 then
            p1.FieldOfView = a1
            return
        end
        if typeof(p2) ~= "number" then
            TweenService:Create(p1, p2, {FieldOfView = a1}):Play()
            return
        end
        u18 = p3
        if not u18 then
            function u18(p1) -- Line: 49
                return p1
            end
        end
        FieldOfView = p1.FieldOfView
        u23 = a1 - FieldOfView
        u24 = 0
        u50 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 61 -- upvalues: u24 (ref), p2 (val), u50 (upval), p1 (upval), a1 (val), u18 (val), u23 (val), FieldOfView (val)
            u24 = u24 + a1_2
            if p2 <= u24 then
                u50:Disconnect()
                p1.FieldOfView = a1
                return
            end
            local v1 = u18(u24 / p2)
            p1.FieldOfView = v1 * u23 + FieldOfView
        end)
    end)
    return function() -- Line: 80 -- upvalues: u5 (val)
        u5()
    end
end)
return function() -- Line: 87 -- upvalues: Statistics (val)
    local fieldofview = Statistics.Get("fieldofview")
    return fieldofview, function(p1, p2, p3, p4, p5, p6) -- Line: 89 -- upvalues: Statistics (upval)
        Statistics.Adjust("fieldofview", p1, p2, p3, p4, p5, p6)
        return function(a1, p2) -- Line: 99 -- upvalues: Statistics (upval), p1 (val)
            Statistics.Remove("fieldofview", p1, a1, p2)
        end
    end
end