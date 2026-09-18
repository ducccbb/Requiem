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
--            File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Berserk
--                              Dumped in 0.000725 seconds
--                          Bytecode version 9  |  3 functions

local u53
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
_, u53 = require(Statistics:WaitForChild("useFieldOfView"))()
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local useNumberEasing = require(Utilities:WaitForChild("useNumberEasing"))
return function(p1) -- Line: 25 -- upvalues: Signals (val), u53 (val), useNumberEasing (val), RunService (val)
    local u30, v1, v2
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    Signals.Bars:Fire(0.3, 0)
    task.wait(0.1)
    local CurrentCamera = workspace.CurrentCamera
    local v3 = u53("berserk", 50, "set", 100, TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    u30, v1, v2 = useNumberEasing(0)
    v1(30, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    local v4 = RunService.RenderStepped:Connect(function(p1) -- Line: 49 -- upvalues: HumanoidRootPart (val), CurrentCamera (val), u30 (val)
        local v1 = CFrame.new(CurrentCamera.CFrame.Position, HumanoidRootPart.CFrame.Position)
        local v2 = CurrentCamera.CFrame:Lerp(v1, u30() * p1)
        CurrentCamera.CFrame = v2 * CFrame.Angles(0, 0, (math.rad(0)))
    end)
    task.wait(7)
    v4:Disconnect()
    v2()
    v3(TweenInfo.new(1))
    Signals.Bars:Fire(0, 0)
end