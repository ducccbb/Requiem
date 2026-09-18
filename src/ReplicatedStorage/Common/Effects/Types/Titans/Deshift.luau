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
--              File: ReplicatedStorage.Common.Effects.Types.Titans.Deshift
--                              Dumped in 0.000489 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
return function(p1) -- Line: 11 -- upvalues: TweenService (val), Workspace (val)
    local v1
    p1.Archivable = true
    local Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
    local Animator = Humanoid
    if Animator then
        Animator = Humanoid:FindFirstChildWhichIsA("Animator")
    end
    if not Humanoid or not Animator then
        return
    end
    local u16 = p1:Clone()
    u16:AddTag("Deshifting")
    local HumanoidRootPart = u16:FindFirstChild("HumanoidRootPart")
    local Humanoid_2 = u16:FindFirstChildWhichIsA("Humanoid")
    local Animator_2 = Humanoid_2
    if Animator_2 then
        Animator_2 = Humanoid_2:FindFirstChildWhichIsA("Animator")
    end
    if not HumanoidRootPart or not Humanoid_2 or not Animator_2 then
        return
    end
    for i, j in Animator:GetPlayingAnimationTracks() do
        v1 = Animator_2:LoadAnimation(j.Animation)
        v1:Play()
        v1.TimePosition = j.TimePosition
        v1:AdjustSpeed(0)
    end
    for k, n in u16:GetDescendants() do
        if n:IsA("BasePart") then
            n.Anchored = true
            n.CastShadow = false
            n.CanCollide = false
            n.CanTouch = false
            n.CanQuery = false
            task.delay(8, function() -- Line: 48 -- upvalues: TweenService (upval), n (val)
                local v1 = TweenInfo.new(10)
                TweenService:Create(n, v1, {Transparency = 1}):Play()
            end)
        end
    end
    HumanoidRootPart.Anchored = true
    u16.Parent = Workspace
    p1.Parent = nil
    task.delay(20, function() -- Line: 61 -- upvalues: u16 (val)
        u16:Destroy()
    end)
end