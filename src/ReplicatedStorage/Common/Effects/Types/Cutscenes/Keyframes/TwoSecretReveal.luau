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
--   File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.TwoSecretReveal
--                               Dumped in 0.00132 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Explosions = v1.Parent.Parent.Parent:WaitForChild("Explosions")
local Impact = require(Explosions:WaitForChild("Impact"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Titans = v1.Parent.Parent.Parent:WaitForChild("Titans")
local Lightning = require(Titans:WaitForChild("Lightning"))
local u67 = {}
local v3 = {kind = "white", duration = 0.025}
local v4 = {kind = "white", duration = 0.022}
u67[1] = v3
u67[2] = {kind = "black", duration = 0.018}
u67[3] = v4
u67[4] = {kind = "black", duration = 0.018}
u67[5] = {kind = "white", duration = 0.035}
local u73 = {"First", "Second"}
local u76 = {white = Color3.new(0, 0, 0), black = Color3.fromRGB(255, 255, 255)}
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local BrokenOuterGate = Objects:WaitForChild("BrokenOuterGate")
local GateImpact = Objects:WaitForChild("GateImpact")
local function onHandleEmitKeyframe(p1, p2) -- Line: 48 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function onPullLeverDown(p1) -- Line: 63 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(0.5)
    local v2 = {}
    local v3 = math.rad(-40)
    v2.CFrame = p1.MarleyBlimp.SpinKnob.CFrame * CFrame.Angles(v3, 0, 0)
    TweenService:Create(p1.MarleyBlimp.SpinKnob, v1, v2):Play()
    v1 = TweenInfo.new(6)
    v2 = {}
    v3 = math.rad(46)
    v2.CFrame = p1.MarleyBlimp.GateKnob.CFrame * CFrame.Angles(v3, 0, 0)
    TweenService:Create(p1.MarleyBlimp.GateKnob, v1, v2):Play()
end
local function onShiftLightning(p1) -- Line: 77 -- upvalues: Lightning (val)
    task.wait(0.6)
    local Torso = p1:WaitForChild("NPC1Animation"):WaitForChild("Torso")
    Lightning(Torso.Position, 1)
end
local function playImpactFrameSequenceOnHighlight(p1, p2) -- Line: 90 -- upvalues: u76 (val)
    local v1
    local v2 = p2
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = u76[j.kind]
        if v1 then
            p1.FillColor = v1
            p1.FillTransparency = 0
            p1.OutlineTransparency = 1
            task.wait(j.duration)
        end
    end
end
local function getGateImpactParts(p1) -- Line: 111 -- upvalues: u73 (val)
    local v1
    local v2 = {}
    local v3 = u73
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p1:FindFirstChild(j, true)
        if v1 and v1:IsA("BasePart") then
            table.insert(v2, v1)
        end
    end
    return v2
end
local function setGateImpactPartVisibility(p1, p2) -- Line: 129
    local v1
    local v2 = p1
    local v3 = nil
    local v4 = nil
    local v5 = p2
    for i, j in v2, v3, v4 do
        if j ~= v5 then
            v1 = 1
        else
            v1 = 0
        end
        j.Transparency = v1
    end
end
local function playGateImpactFrames() -- Line: 138 -- upvalues: GateImpact (val), getGateImpactParts (val), setGateImpactPartVisibility (val), Impact (val), u67 (val), playImpactFrameSequenceOnHighlight (val)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local u5 = GateImpact:Clone()
    u5:PivotTo(CurrentCamera.CFrame * CFrame.new(0, 0, -300))
    u5.Parent = workspace
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "GateImpactHighlight"
    Highlight.Parent = u5
    local u23 = getGateImpactParts(u5)
    setGateImpactPartVisibility(u23, nil)
    task.spawn(function() -- Line: 155 -- upvalues: u23 (val), setGateImpactPartVisibility (upval), Highlight (val), Impact (upval), u67 (upval), playImpactFrameSequenceOnHighlight (upval), u5 (val)
        local v1 = u23
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            setGateImpactPartVisibility(u23, j)
            Highlight.Adornee = j
            local u23 = false
            Impact.playSequence(u67, nil, function() -- Line: 162 -- upvalues: u23 (ref)
                u23 = true
            end)
            playImpactFrameSequenceOnHighlight(Highlight, u67)
            while not u23 do
                task.wait()
            end
        end
        Highlight:Destroy()
        u5:Destroy()
    end)
end
local function onOuterWallBreach(p1) -- Line: 182 -- upvalues: playGateImpactFrames (val), BrokenOuterGate (val)
    playGateImpactFrames()
    local Walls = workspace:WaitForChild("Walls")
    local Walls_2 = Walls:WaitForChild("Walls")
    local OuterGate = Walls_2:WaitForChild("OuterGate")
    local u19 = BrokenOuterGate:Clone()
    u19.Parent = workspace
    OuterGate:Destroy()
    task.delay(25.42, function() -- Line: 193 -- upvalues: u19 (val)
        u19:Destroy()
    end)
end
return {
    onKeyframeReached = function(p1, p2) -- Line: 205 -- upvalues: onHandleEmitKeyframe (val), onPullLeverDown (val), onShiftLightning (val), onOuterWallBreach (val)
        local v1 = string.split(p1, "_")
        if v1[1] == "Emit" then
            onHandleEmitKeyframe(p2, v1[2])
            return
        end
        if p1 == "LeverPullDown" then
            onPullLeverDown(p2)
            return
        end
        if p1 == "Shift" then
            onShiftLightning(p2)
            return
        end
        if p1 == "OuterWallBreach" then
            onOuterWallBreach(p2)
        end
    end,
    onLoaded = function(p1) -- Line: 222 -- upvalues: TweenService (val)
        local OneSecretRevealAudio = workspace:FindFirstChild("OneSecretRevealAudio")
        if OneSecretRevealAudio then
            local v1 = TweenInfo.new(5)
            TweenService:Create(OneSecretRevealAudio, v1, {Volume = 0}):Play()
            task.delay(5, function() -- Line: 228 -- upvalues: OneSecretRevealAudio (val)
                OneSecretRevealAudio:Destroy()
            end)
        end
    end,
}