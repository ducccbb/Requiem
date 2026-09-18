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
--       File: ReplicatedStorage.Common.Effects.Types.Titans.Special.ShifterSwing
--                               Dumped in 0.00125 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Special = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Special")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local NumberSequence = require(Utilities:WaitForChild("NumberSequence"))
local u57 = {}
local v2 = CFrame.new(0, 15, 0)
local v3 = math.rad(-90)
u57.LeftHand = v2 * CFrame.Angles(0, v3, (math.rad(90)))
v2 = CFrame.new(0, 15, 0)
v3 = math.rad(-90)
u57.RightHand = v2 * CFrame.Angles(0, v3, (math.rad(90)))
local u92 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u97 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local Time = u97.Time
v3 = {}
local v4 = {__mode = "k"}
local u102 = setmetatable(v3, v4)
local function getInvisibleSequenceFrom(p1) -- Line: 36
    local v1 = {}
    local Keypoints = p1.Keypoints
    local v2 = nil
    local v3 = nil
    for i, j in Keypoints, v2, v3 do
        table.insert(v1, NumberSequenceKeypoint.new(j.Time, 1, j.Envelope))
    end
    return NumberSequence.new(v1)
end
local function stopBeamTween(p1) -- Line: 45 -- upvalues: u102 (val)
    local v1 = u102[p1]
    if v1 then
        v1(false)
        u102[p1] = nil
    end
end
local function playBeamTransparencyTween(p1, p2, p3, p4, p5) -- Line: 53 -- upvalues: stopBeamTween (val), NumberSequence (val), u102 (val), RunService (val)
    local cleanup
    stopBeamTween(p1)
    local u13 = NumberSequence.tweenNumberSequence(p2, p3, p4)
    local u14 = false
    local u15 = false
    local u16 = nil
    local function finish() -- Line: 67 -- upvalues: u15 (ref), p5 (val)
        if u15 then
            return
        end
        u15 = true
        if p5 then
            p5()
        end
    end
    function cleanup(a1) -- Line: 78 -- upvalues: u14 (ref), u16 (ref), u13 (val), u102 (upval), p1 (val), cleanup (val), finish (val)
        if u14 then
            return
        end
        u14 = true
        if u16 then
            u16:Disconnect()
            u16 = nil
        end
        u13.destroy()
        local v1 = u102[p1]
        if v1 == cleanup then
            u102[p1] = nil
        end
        if a1 then
            finish()
        end
    end
    task.delay(p4.Time + p4.DelayTime, function() -- Line: 107 -- upvalues: cleanup (val)
        cleanup(true)
    end)
    u102[p1] = cleanup
end
local function getBeams(p1) -- Line: 114
    local Beams = p1:FindFirstChild("Beams")
    if not Beams then
        return {}
    end
    local v1 = {}
    for i, j in Beams:GetDescendants() do
        if j:IsA("Beam") then
            table.insert(v1, j)
        end
    end
    return v1
end
local function forEachBeamTransparency(p1, p2, p3, p4, p5) -- Line: 130 -- upvalues: playBeamTransparencyTween (val)
    local v1, v2
    if #p1 == 0 then
        if p5 then
            p5()
        end
        return
    end
    local u8 = #p1
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p2(j)
        v2 = p3(j)
        playBeamTransparencyTween(j, v1, v2, p4, function() -- Line: 145 -- upvalues: u8 (ref), p5 (val)
            u8 = u8 - 1
            if u8 == 0 and p5 then
                p5()
            end
        end)
    end
end
local function fadeInBeams(p1) -- Line: 157 -- upvalues: getBeams (val), getInvisibleSequenceFrom (val), playBeamTransparencyTween (val), u92 (val)
    local v1
    local v2 = getBeams(p1)
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j] = j.Transparency
        v1 = getInvisibleSequenceFrom(v3[j])
        j.Transparency = v1
        playBeamTransparencyTween(j, v1, v3[j], u92)
    end
end
local function fadeOutBeams(p1, p2) -- Line: 170 -- upvalues: getBeams (val), forEachBeamTransparency (val), getInvisibleSequenceFrom (val), u97 (val)
    local v1 = getBeams(p1)
    forEachBeamTransparency(v1, function(p1) -- Line: 172
        return p1.Transparency
    end, function(p1) -- Line: 174 -- upvalues: getInvisibleSequenceFrom (upval)
        return getInvisibleSequenceFrom(p1.Transparency)
    end, u97, p2)
end
local function schedulePunchCleanup(p1, p2) -- Line: 179 -- upvalues: Time (val), getBeams (val), fadeOutBeams (val), getInvisibleSequenceFrom (val)
    local v1 = math.max(0, p2 - Time)
    task.delay(v1, function() -- Line: 182 -- upvalues: p1 (val), getBeams (upval), fadeOutBeams (upval), getInvisibleSequenceFrom (upval)
        if not p1.Parent then
            return
        end
        local u4 = getBeams(p1)
        if #u4 == 0 then
            p1:Destroy()
            return
        end
        fadeOutBeams(p1, function() -- Line: 193 -- upvalues: p1 (upval), u4 (val), getInvisibleSequenceFrom (upval)
            if p1.Parent then
                local v1 = u4
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    if j.Parent then
                        j.Transparency = getInvisibleSequenceFrom(j.Transparency)
                    end
                end
                p1:Destroy()
            end
        end)
    end)
end
return function(p1, p2, p3) -- Line: 209 -- upvalues: u57 (val), fadeInBeams (val), schedulePunchCleanup (val), Special (val)
    local v1, v2, v3
    local u7 = p2 - workspace:GetServerTimeNow()
    if p3 == "Left" then
        v3 = {"LeftHand"}
    elseif p3 ~= "Right" then
        v3 = {"LeftHand", "RightHand"}
    else
        v3 = {"RightHand"}
    end
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = p1:FindFirstChild(j)
        if v1 then
            v2 = Special:WaitForChild("Punch"):Clone()
            ;(function(a1, p2) -- Line: 222 -- upvalues: u57 (upval), p1 (val), fadeInBeams (upval), schedulePunchCleanup (upval), u7 (val)
                p2.CFrame = a1.CFrame * u57[a1.Name]
                p2.Anchored = false
                p2.Parent = p1
                local WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = a1
                WeldConstraint.Part1 = p2
                WeldConstraint.Parent = a1
                fadeInBeams(p2)
                schedulePunchCleanup(p2, u7)
                return WeldConstraint
            end)(v1, v2)
        end
    end
end