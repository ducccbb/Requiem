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
--        File: ReplicatedStorage.Common.Effects.Types.Enchantments.Holiday Cheer
--                              Dumped in 0.000582 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Snowflake = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Snowflake")
return function(p1, p2) -- Line: 17 -- upvalues: Snowflake (val), Workspace (val), TweenService (val), RunService (val)
    local HumanoidRootPart = p2
    if HumanoidRootPart then
        HumanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return
    end
    task.wait(0.3)
    local u14 = Snowflake:Clone()
    u14.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
    u14.Transparency = 1
    u14.Size = Vector3.new(0.1, 0.03, 0.1)
    u14.Parent = Workspace
    local v1 = TweenInfo.new(0.3)
    TweenService:Create(u14, v1, {Transparency = 0, Size = Vector3.new(10, 0.05, 10)}):Play()
    local u49 = Snowflake:Clone()
    local v2 = HumanoidRootPart.CFrame * CFrame.new(0, 4, 0)
    local v3 = math.rad(90)
    u49.CFrame = v2 * CFrame.Angles(v3, 0, 0)
    u49.Transparency = 1
    u49.Size = Vector3.new(0.1, 0.03, 0.1)
    u49.Parent = Workspace
    v3 = TweenInfo.new(0.2)
    TweenService:Create(u49, v3, {Transparency = 0, Size = Vector3.new(2.12, 0.03, 2.12)}):Play()
    local u94 = RunService.RenderStepped:Connect(function(p1) -- Line: 47 -- upvalues: u49 (val)
        local v1 = u49
        local v2 = CFrame.new(0, 0, p1 * -5)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(0, 0, (math.rad(p1 * 600))))
    end)
    task.wait(0.3)
    local v4 = TweenInfo.new(1)
    TweenService:Create(u49, v4, {Transparency = 1, Size = u49.Size * 1.5}):Play()
    task.delay(1, function() -- Line: 58 -- upvalues: u94 (val), u49 (val)
        u94:Disconnect()
        u49:Destroy()
    end)
    task.delay(0.2, function() -- Line: 63 -- upvalues: TweenService (upval), u14 (val)
        local v1 = TweenInfo.new(1.25)
        TweenService:Create(u14, v1, {Transparency = 1}):Play()
        task.wait(1.25)
        u14:Destroy()
    end)
end