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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Abnormal.Trip
--                              Dumped in 0.000624 seconds
--                          Bytecode version 9  |  5 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local Universal = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal:WaitForChild("ClientShifterAnimationHandler"))
local Universal_2 = u0.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal_2:WaitForChild("ClientShifterPhysicsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local CustomBezier = require(Utilities:WaitForChild("CustomBezier"))
local v2 = {}
function v2.onAbilityRequested(p1, ...) -- Line: 30 -- upvalues: useWalkSpeed (val), ClientShifterAnimationHandler (val), u0 (val), CustomBezier (val), ClientShifterPhysicsHandler (val)
    local u3
    _, u3 = useWalkSpeed()
    local u12 = u3("Trip", p1.runSpeed, "set", 13, TweenInfo.new(1))
    local u20 = ClientShifterAnimationHandler.getTrackFromAnimation(p1, p1.animations[u0.Name])
    if u20 and p1.model then
        local HumanoidRootPart = p1.model:FindFirstChild("HumanoidRootPart")
        local new = CustomBezier.new
        local v1 = {}
        local v2 = {strength = 1, point = HumanoidRootPart.Position}
        local v3 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 10, -150)).Position}
        local v4 = {strength = 1, point = (HumanoidRootPart.CFrame * CFrame.new(0, 0, -300)).Position}
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        local u50 = new(v1)
        task.delay(0.4, function() -- Line: 47 -- upvalues: ClientShifterPhysicsHandler (upval), p1 (val), u50 (val), u20 (val), u3 (val)
            ClientShifterPhysicsHandler.onRunBezierCurve(p1, u50, u20.Length - 2.3)
            local u13 = u3("Standing", 0, "set", 14)
            task.delay(u20.Length - 0.6, function() -- Line: 52 -- upvalues: u13 (val)
                u13(TweenInfo.new(0.4))
            end)
        end)
    end
    task.delay(6, function() -- Line: 58 -- upvalues: u12 (val)
        u12(TweenInfo.new(1))
    end)
end
return v2