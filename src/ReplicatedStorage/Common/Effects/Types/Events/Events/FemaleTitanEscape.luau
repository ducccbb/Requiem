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
--     File: ReplicatedStorage.Common.Effects.Types.Events.Events.FemaleTitanEscape
--                               Dumped in 0.00123 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Cutscenes = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Cutscenes")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Moon = require(Utilities:WaitForChild("Moon"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local blink = require(Utilities_3:WaitForChild("State"))("blink")
local u90 = {}
local u94 = TweenInfo.new(0.3, Enum.EasingStyle.Back)
local u99 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local Titans = script.Parent.Parent.Parent:WaitForChild("Titans")
local Lightning = require(Titans:WaitForChild("Lightning"))
local function onHandleEmitKeyframe(p1, p2) -- Line: 40 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function onDestroyTrapBeams() -- Line: 54 -- upvalues: u90 (val), TweenService (val), u99 (val)
    if #u90 == 0 then
        return
    end
    local u4 = table.clone(u90)
    table.clear(u90)
    local v1 = u4
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.Parent then
            TweenService:Create(j, u99, {CurveSize0 = 20, CurveSize1 = -20}):Play()
        end
    end
    task.delay(u99.Time, function() -- Line: 73 -- upvalues: u4 (val)
        local v1 = u4
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j.Parent then
                j:Destroy()
            end
        end
    end)
end
local function onHandleShootBeams(p1) -- Line: 86 -- upvalues: TweenService (val), u94 (val), u90 (val)
    local Base, Beam, v1, v2, v3, v4
    local v5 = p1:FindFirstChild("Female Titan Rig")
    if not v5 then
        return
    end
    local v6 = {
        v5.TrapBeamHead1,
        v5.TrapBeamHead2,
        v5.TrapBeamLeftArm,
        v5.TrapBeamLeftArm2,
        v5.TrapBeamLowerLeftArm1,
        v5.TrapBeamLowerRightArm1,
        v5.TrapBeamRightArm,
        v5.TrapBeamRightArm2,
        v5.TrapBeamUpperTorso1,
        v5.TrapBeamUpperTorso2,
        v5.TrapBeamUpperTorso3,
    }
    local v7 = {}
    for i, j in p1:GetChildren() do
        if j:IsA("Model") and j.Name == "Trap Cart" then
            Base = j:FindFirstChild("Base")
            if Base then
                table.insert(v7, Base)
            end
        end
    end
    local function getInstancePosition(p1) -- Line: 116
        local Attachment = p1:FindFirstChild("Attachment")
        if Attachment then
            return Attachment.WorldPosition
        end
        if p1:IsA("BasePart") then
            return p1.Position
        end
        return p1:GetPivot().Position
    end
    local v8 = table.clone(v6)
    local v9 = {}
    local v10 = v7
    local v11 = nil
    local v12 = nil
    for k, n in v10, v11, v12 do
        v1 = v8
        v2 = nil
        v3 = nil
        for m, i5 in v1, v2, v3 do
            if i5 then
                v4 = getInstancePosition(n)
                table.insert(v9, {base = n, goal = i5, distance = (v4 - getInstancePosition(i5)).Magnitude})
            end
        end
    end
    table.sort(v9, function(p1, p2) -- Line: 147
        local v1 = p1.distance < p2.distance
        return v1
    end)
    v10 = {}
    v11 = {}
    v12 = {}
    local v13 = v9
    local v14 = nil
    v1 = nil
    for i6, i7 in v13, v14, v1 do
        if not (v10[i7.base]) and not (v11[i7.goal]) then
            v10[i7.base] = true
            v11[i7.goal] = true
            table.insert(v12, i7)
        end
    end
    v13 = v12
    v14 = nil
    v1 = nil
    for i8, i9 in v13, v14, v1 do
        for i10, i11 in i9.base:GetChildren() do
            if i11:IsA("Attachment") then
                Beam = Instance.new("Beam")
                Beam.Attachment0 = i11
                Beam.Attachment1 = i9.goal:FindFirstChild("Attachment")
                Beam.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                Beam.Width0 = 0.1
                Beam.Width1 = 0.1
                Beam.Transparency = NumberSequence.new(0)
                Beam.Parent = i11
                Beam.CurveSize0 = 20
                Beam.CurveSize1 = -20
                TweenService:Create(Beam, u94, {CurveSize0 = 0, CurveSize1 = 0}):Play()
                table.insert(u90, Beam)
            end
        end
    end
end
return function(p1) -- Line: 191 -- upvalues: Cutscenes (val), blink (val), Moon (val), onDestroyTrapBeams (val), onHandleEmitKeyframe (val), onHandleShootBeams (val), Lightning (val)
    local FemaleTitanEscape = Cutscenes:FindFirstChild("FemaleTitanEscape")
    if not FemaleTitanEscape then
        return
    end
    task.spawn(function() -- Line: 200 -- upvalues: blink (upval), Moon (upval), FemaleTitanEscape (val), onDestroyTrapBeams (upval), onHandleEmitKeyframe (upval), onHandleShootBeams (upval), Lightning (upval)
        blink({enabled = true, speed = 1.5, overshoot = 0.5})
        local v1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local v2 = 1.7 + v1.Time
        task.delay(v2, function() -- Line: 210 -- upvalues: blink (upval)
            blink({enabled = false, overshoot = 0.5, tween = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)})
        end)
        task.wait(1.5)
        local v3 = workspace:GetServerTimeNow() + 0.1
        Moon.onRunMoonCutscene(FemaleTitanEscape, 60, v3, function(p1, p2) -- Line: 222 -- upvalues: onDestroyTrapBeams (upval), onHandleEmitKeyframe (upval), onHandleShootBeams (upval), Lightning (upval)
            local v1 = string.split(p1, "_")
            if v1[1] == "Emit" then
                if v1[2] == "Spin" then
                    onDestroyTrapBeams()
                end
                onHandleEmitKeyframe(p2, v1[2])
                return
            end
            if p1 == "TrapsFire" then
                onHandleShootBeams(p2)
                return
            end
            if p1 == "Shift" then
                task.wait(5.5)
                Lightning((Vector3.new(-5460.969, -323.959, 1582.81)))
            end
        end, nil, true)
    end)
end