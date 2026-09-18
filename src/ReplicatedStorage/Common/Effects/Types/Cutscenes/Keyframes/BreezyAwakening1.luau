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
--   File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.BreezyAwakening1
--                              Dumped in 0.000603 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local Saturation = require(Universal:WaitForChild("Saturation"))
local function onHandleBeamKeyframe(p1, p2, p3, p4, p5) -- Line: 26 -- upvalues: TweenService (val)
    local v1
    if p2 ~= "Left" then
        v1 = "RightBeam"
    else
        v1 = "LeftBeam"
    end
    local v2 = p1[p3]:FindFirstChild(v1)
    if not v2 then
        return
    end
    local v3 = p1:FindFirstChild(p4, true)
    if not v3 then
        return
    end
    v2.Attachment1 = v3:FindFirstChild("Attachment")
    if p5 then
        v2.CurveSize0 = 20
        v2.CurveSize1 = -20
        local v4 = TweenInfo.new(0.3, Enum.EasingStyle.Back)
        TweenService:Create(v2, v4, {CurveSize0 = 0, CurveSize1 = 0}):Play()
    end
    v2.Enabled = p5
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 58 -- upvalues: Particles (val), Saturation (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
    if p2 == "Eradicate" then
        Saturation()
    elseif p2 == "LegCut" then
        Saturation()
    elseif p2 == "BlindingSlash" then
        Saturation()
    elseif p2 == "TitanSlain" then
        Saturation()
    end
end
return function(p1, p2) -- Line: 75 -- upvalues: onHandleBeamKeyframe (val), onHandleEmitKeyframe (val)
    local v1 = string.split(p1, "_")
    if v1[1] == "Beam" then
        local v2 = v1[5] == "on"
        onHandleBeamKeyframe(p2, v1[2], v1[3], v1[4], v2)
        return
    end
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
end