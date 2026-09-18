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
--                    File: ReplicatedStorage.Common.Utilities.Shake
--                              Dumped in 0.000983 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local u18 = Random.new()
local u19 = 0
local u20 = {}
u20.__index = u20
function u20.new() -- Line: 238 -- upvalues: u20 (val), RunService (val), u18 (val)
    local clock
    local v1 = setmetatable({}, u20)
    v1.Amplitude = 1
    v1.Frequency = 1
    v1.FadeInTime = 1
    v1.FadeOutTime = 1
    v1.SustainTime = 0
    v1.Sustain = false
    v1.PositionInfluence = Vector3.one
    v1.RotationInfluence = Vector3.one
    if not (RunService:IsRunning()) then
        clock = os.clock
    else
        clock = time
    end
    v1.TimeFunction = clock
    v1._timeOffset = u18:NextNumber(-1000000, 1000000)
    v1._startTime = 0
    v1._running = false
    v1._signalConnections = {}
    v1._renderBindings = {}
    return v1
end
function u20.InverseSquare(p1, p2) -- Line: 289
    local v1
    if p2 >= 1 then
        v1 = p2
    else
        v1 = 1
    end
    return p1 * (1 / (v1 * v1))
end
function u20.NextRenderName() -- Line: 305 -- upvalues: u19 (ref)
    u19 = u19 + 1
    return ("__shake_%.4i__"):format(u19)
end
function u20.Start(p1) -- Line: 318
    p1._startTime = p1.TimeFunction()
    p1._running = true
end
function u20:Stop() -- Line: 330 -- upvalues: RunService (val)
    self._running = false
    local _renderBindings = self._renderBindings
    local v1 = nil
    local v2 = nil
    for i, j in _renderBindings, v1, v2 do
        RunService:UnbindFromRenderStep(j)
    end
    table.clear(self._renderBindings)
    local _signalConnections = self._signalConnections
    v1 = nil
    v2 = nil
    for k, n in _signalConnections, v1, v2 do
        n:Disconnect()
    end
    table.clear(self._signalConnections)
end
function u20.IsShaking(p1) -- Line: 348
    return p1._running
end
function u20.StopSustain(p1) -- Line: 357
    p1.Sustain = false
    local v1 = p1.TimeFunction() - p1._startTime
    p1.SustainTime = v1 - p1.FadeInTime
end
function u20:Update() -- Line: 385
    local v1 = false
    local v2 = self.TimeFunction()
    local v3 = v2 - self._startTime
    local v4 = (v2 + self._timeOffset) / self.Frequency % 10000
    local v5 = 1
    local v6 = 1
    if v3 < self.FadeInTime then
        v5 = v3 / self.FadeInTime
    end
    if not self.Sustain and self.FadeInTime + self.SustainTime < v3 then
        if self.FadeOutTime ~= 0 then
            local v7 = v3 - self.FadeInTime - self.SustainTime
            v6 = 1 - v7 / self.FadeOutTime
            if not self.Sustain then
                v7 = self.FadeInTime + self.SustainTime
                if v7 + self.FadeOutTime <= v3 then
                    v1 = true
                end
            end
        else
            v1 = true
        end
    end
    local v8 = math.noise(v4, 0) / 2
    local v9 = math.noise(0, v4) / 2
    local v10 = Vector3.new(v8, v9, math.noise(v4, v4) / 2)
    local v11 = v10 * self.Amplitude * math.min(v5, v6)
    if v1 then
        self:Stop()
    end
    return self.PositionInfluence * v11, self.RotationInfluence * v11, v1
end
function u20.OnSignal(p1, p2, p3) -- Line: 443
    local v1 = p2:Connect(function() -- Line: 444 -- upvalues: p3 (val), p1 (val)
        p3(p1:Update())
    end)
    table.insert(p1._signalConnections, v1)
    return v1
end
function u20:BindToRenderStep(p2, p3, p4) -- Line: 473 -- upvalues: RunService (val)
    RunService:BindToRenderStep(p2, p3, function() -- Line: 474 -- upvalues: p4 (val), self (val)
        p4(self:Update())
    end)
    table.insert(self._renderBindings, p2)
end
function u20.Clone(p1) -- Line: 510 -- upvalues: u20 (val)
    local v1 = u20.new()
    local v2 = {
        "Amplitude",
        "Frequency",
        "FadeInTime",
        "FadeOutTime",
        "SustainTime",
        "Sustain",
        "PositionInfluence",
        "RotationInfluence",
        "TimeFunction",
    }
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1[j] = p1[j]
    end
    return v1
end
function u20.Destroy(p1) -- Line: 532
    p1:Stop()
end
return {new = u20.new, InverseSquare = u20.InverseSquare, NextRenderName = u20.NextRenderName}