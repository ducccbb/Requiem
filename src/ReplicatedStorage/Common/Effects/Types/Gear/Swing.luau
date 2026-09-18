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
--                File: ReplicatedStorage.Common.Effects.Types.Gear.Swing
--                               Dumped in 0.00167 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Gear = require(Types:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local NumberSequence = require(Utilities:WaitForChild("NumberSequence"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Gear_2 = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Alive = require(Common_5:WaitForChild("Alive"))
local u117 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u122 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local v2 = {}
local u126 = setmetatable(v2, {__mode = "k"})
local u130 = setmetatable({}, {__mode = "k"})
local v3 = {__mode = "k"}
local u134 = setmetatable({}, v3)
local function getInvisibleSequenceFrom(p1) -- Line: 41
    local v1 = {}
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        table.insert(v1, NumberSequenceKeypoint.new(j.Time, 1, j.Envelope))
    end
    return NumberSequence.new(v1)
end
local function stopTrailTween(p1) -- Line: 55 -- upvalues: u130 (val)
    local v1 = u130[p1]
    if v1 then
        v1(false)
        u130[p1] = nil
    end
end
local function playTrailTransparencyTween(p1, p2, p3, p4, p5) -- Line: 72 -- upvalues: stopTrailTween (val), NumberSequence (val), u130 (val), RunService (val)
    local cleanup
    stopTrailTween(p1)
    local u13 = NumberSequence.tweenNumberSequence(p2, p3, p4)
    local u14 = false
    local u15 = false
    local u16 = nil
    local function finish() -- Line: 86 -- upvalues: u15 (ref), p5 (val)
        if u15 then
            return
        end
        u15 = true
        if p5 then
            p5()
        end
    end
    function cleanup(a1) -- Line: 97 -- upvalues: u14 (ref), u16 (ref), u13 (val), u130 (upval), p1 (val), cleanup (val), finish (val)
        if u14 then
            return
        end
        u14 = true
        if u16 then
            u16:Disconnect()
            u16 = nil
        end
        u13.destroy()
        local v1 = u130[p1]
        if v1 == cleanup then
            u130[p1] = nil
        end
        if a1 then
            finish()
        end
    end
    task.delay(p4.Time + p4.DelayTime, function() -- Line: 126 -- upvalues: cleanup (val)
        cleanup(true)
    end)
    u130[p1] = cleanup
end
return function(p1) -- Line: 133 -- upvalues: Alive (val), Players (val), Gear (val), u134 (val), u126 (val), getInvisibleSequenceFrom (val), playTrailTransparencyTween (val), u117 (val), u122 (val), Sounds (val), Gear_2 (val)
    local u4 = Alive.getAliveCharacter(p1)
    if not u4 then
        return
    end
    local HumanoidRootPart = u4:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local Character = Players.LocalPlayer.Character
    local PrimaryPart = Character
    if PrimaryPart then
        PrimaryPart = Character.PrimaryPart
    end
    if not PrimaryPart or 300 < (PrimaryPart.Position - HumanoidRootPart.Position).Magnitude then
        return
    end
    local function updateGearTrails(a1) -- Line: 155 -- upvalues: u4 (val), Gear (upval), p1 (val), u134 (upval), u126 (upval), getInvisibleSequenceFrom (upval), playTrailTransparencyTween (upval), u117 (upval), u122 (upval)
        local Transparency, v1
        local v2 = u4:FindFirstChild(a1 .. "GearHandle")
        if not v2 then
            return
        end
        local Handle = v2:FindFirstChild("Handle")
        local Blade = Handle
        if Blade then
            Blade = Handle:FindFirstChild("Blade")
        end
        local v3 = Gear.Generation.getPlayerGeneration(p1)
        local v4 = Gear.Generation.getSwingTrailSegment(Blade, v3)
        local SwingTrails = v4
        if SwingTrails then
            SwingTrails = v4:FindFirstChild("SwingTrails")
        end
        if not v4 or not SwingTrails then
            return
        end
        local a1_2 = v4:FindFirstChild("a1")
        if not a1_2 then
            return
        end
        local v5 = Gear.Generation.getSwingTrailPositions(v3)
        local v6 = nil
        local v7 = nil
        for i, j in v5, v6, v7 do
            v1 = Blade
            if v1 then
                v1 = Blade:FindFirstChild((tostring(i)))
            end
            if v1 and v1.Transparency == 0 then
                a1_2.Position = j
                break
            end
        end
        for k, n in SwingTrails:GetChildren() do
            if n:IsA("Trail") then
                v1 = u134[n]
                if v1 then
                    task.cancel(v1)
                    u134[n] = nil
                end
                Transparency = u126[n]
                if not Transparency then
                    Transparency = n.Transparency
                end
                u126[n] = Transparency
                local u109 = getInvisibleSequenceFrom(Transparency)
                n.Enabled = true
                n.Transparency = u109
                playTrailTransparencyTween(n, u109, Transparency, u117)
                u134[n] = task.delay(0.6, function() -- Line: 210 -- upvalues: u134 (upval), n (val), playTrailTransparencyTween (upval), u109 (val), u122 (upval)
                    u134[n] = nil
                    if not n.Parent then
                        return
                    end
                    playTrailTransparencyTween(n, n.Transparency, u109, u122, function() -- Line: 221 -- upvalues: n (upval)
                        if n.Parent then
                            n.Enabled = false
                        end
                    end)
                end)
            end
        end
    end
    updateGearTrails("Left")
    updateGearTrails("Right")
    Sounds.playRangedSoundEffect(Gear_2.Blades.Swing, HumanoidRootPart, 150, 1.25, math.random(90, 110) / 100)
end