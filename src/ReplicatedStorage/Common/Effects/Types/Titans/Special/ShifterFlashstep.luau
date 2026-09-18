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
--     File: ReplicatedStorage.Common.Effects.Types.Titans.Special.ShifterFlashstep
--                              Dumped in 0.000563 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Special = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Special")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
return function(p1, p2) -- Line: 28 -- upvalues: Sounds (val), Titans (val), TweenService (val), Special (val), Particles (val)
    Sounds.playFalloffSoundEffect(Titans.Flashstep, p1, 4000, 7, {min = 0.8, max = 1.2})
    local v1 = {min = 0.8, max = 1.2}
    Sounds.playFalloffSoundEffect(Titans.LargeRockWoosh, p1, 3000, 4, v1)
    if not p2 then
        return
    end
    local Parent = p1.Parent
    if not Parent then
        return
    end
    Parent.Archivable = true
    local u24 = Parent:Clone()
    local Model = Instance.new("Model")
    for i, j in u24:GetChildren() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
            j.Transparency = 1
            j:AddTag("Ungrappleable")
            j.Parent = Model
        end
    end
    Model.Parent = game.Workspace
    Model:PivotTo(p2)
    local HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart")
    v1 = Special:WaitForChild("Dash"):Clone()
    local v2 = math.rad(90)
    v1.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, v2, 0)
    v1.Parent = workspace
    for k, n in Model:GetChildren() do
        if n:IsA("BasePart") then
            (function(p1) -- Line: 61 -- upvalues: TweenService (upval)
                local v1 = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 3, true)
                TweenService:Create(p1, v1, {Transparency = 0}):Play()
            end)(n)
        end
    end
    Particles.deepEmitParticles(v1, true)
    task.delay(0.2, function() -- Line: 85 -- upvalues: Model (val), u24 (val), Parent (val)
        Model:Destroy()
        u24:Destroy()
        Parent.Archivable = false
    end)
end