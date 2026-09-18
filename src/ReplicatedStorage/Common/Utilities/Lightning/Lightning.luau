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
--             File: ReplicatedStorage.Common.Utilities.Lightning.Lightning
--                               Dumped in 0.00192 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Model = Instance.new("Model")
Model.Parent = workspace
Model.Name = "Bolts"
local clock = os.clock
local RunService = game:GetService("RunService")
local Part = Instance.new("Part")
Part.TopSurface = 0
Part.BottomSurface = 0
Part.Anchored = true
Part.CanCollide = false
Part.Locked = true
Part.CastShadow = false
Part.Shape = "Cylinder"
Part.Name = "BoltPart"
Part.Material = Enum.Material.Neon
Part.Color = Color3.new(1, 1, 1)
Part.Transparency = 1
local u52 = require(script.Parent.PartCache:WaitForChild("PartCache")).new(Part, 1000)
u52:SetCacheParent(Model)
local function CubicBezier(p1, p2, p3, p4, p5) -- Line: 45
    return p2 * (1 - p1) ^ 3 + p3 * 3 * p1 * (1 - p1) ^ 2 + p4 * 3 * (1 - p1) * p1 ^ 2 + p5 * p1 ^ 3
end
local function DiscretePulse(p1, p2, p3, p4, p5, p6, p7) -- Line: 52
    local v1 = p4 / (2 * p5) - math.abs((p1 - p2 * p3 + 0.5 * p4) / p5)
    return (math.clamp(v1, p6, p7))
end
local function ExtrudeCenter(p1) -- Line: 56
    return (math.exp(-5000 * (p1 - 0.5) ^ 10))
end
local function NoiseBetween(p1, p2, p3, p4, p5) -- Line: 60
    return p4 + (p5 - p4) * (math.noise(p1, p2, p3) + 0.5)
end
local u72 = CFrame.lookAt(Vector3.new(), (Vector3.new(1, 0, 0))):inverse()
local u77 = math.cos((math.rad(90)))
local u78 = {}
local function returnBoltPart(p1) -- Line: 69 -- upvalues: u52 (val)
    pcall(function() -- Line: 70 -- upvalues: u52 (upval), p1 (val)
        u52:ReturnPart(p1)
    end)
end
local u80 = {__type = "LightningBolt"}
u80.__index = u80
function u80.new(p1, p2, p3) -- Line: 87 -- upvalues: u80 (val), CubicBezier (val), DiscretePulse (val), ExtrudeCenter (val), u52 (val), clock (val), u78 (val)
    local v1 = setmetatable({}, u80)
    v1.Enabled = true
    v1.Attachment0 = p1
    v1.Attachment1 = p2
    v1.CurveSize0 = 0
    v1.CurveSize1 = 0
    v1.MinRadius = 0
    v1.MaxRadius = 2.4
    v1.Frequency = 1
    v1.AnimationSpeed = 7
    v1.Thickness = 1
    v1.MinThicknessMultiplier = 0.2
    v1.MaxThicknessMultiplier = 1
    v1.MinTransparency = 0
    v1.MaxTransparency = 1
    v1.PulseSpeed = 2
    v1.PulseLength = 1000000
    v1.FadeLength = 0.2
    v1.ContractFrom = 0.5
    v1.Color = Color3.new(1, 1, 1)
    v1.ColorOffsetSpeed = 3
    v1.SpaceCurveFunction = CubicBezier
    v1.OpacityProfileFunction = DiscretePulse
    v1.RadialProfileFunction = ExtrudeCenter
    v1._Parts = {}
    local v2 = p3 or 30
    local v3 = 1
    for i = 1, v2, v3 do
        v1._Parts[i] = u52:GetPart()
    end
    v1._PartsHidden = false
    v1._DisabledTransparency = 1
    v1._Destroyed = false
    v1._StartT = clock()
    v1._RanNum = math.random() * 100
    v1._RefIndex = #u78 + 1
    u78[v1._RefIndex] = v1
    return v1
end
function u80:Destroy() -- Line: 173 -- upvalues: u78 (val), returnBoltPart (val)
    if self._Destroyed then
        return
    end
    self._Destroyed = true
    u78[self._RefIndex] = nil
    local _Parts = self._Parts
    self._Parts = {}
    local v1 = #_Parts
    local v2 = 1
    for i = 1, v1, v2 do
        returnBoltPart(_Parts[i])
    end
end
function u80.DestroyDissipate(p1, p2, p3) -- Line: 190 -- upvalues: clock (val), RunService (val)
    local u3 = p2 or 0.2
    local u4 = p3 or 0.5
    local u6 = clock()
    local MinTransparency = p1.MinTransparency
    local ContractFrom = p1.ContractFrom
    local u15 = p1.ContractFrom + 1 / (#p1._Parts * p1.FadeLength)
    local MaxRadius = p1.MaxRadius
    local MinThicknessMultiplier = p1.MinThicknessMultiplier
    local u18 = nil
end
function u80:_UpdateGeometry(p2, p3, p4, p5, p6, p7) -- Line: 225 -- upvalues: u72 (val)
    local v1, v2
    local v3 = self.OpacityProfileFunction(p3, p4, self.PulseSpeed, self.PulseLength, self.FadeLength, 1 - self.MaxTransparency, 1 - self.MinTransparency)
    local v4 = self.Thickness * p5 * v3
    if 0 >= v4 then
        v1 = 0
    else
        v1 = v3
        if not v1 then
            v1 = 0
        end
    end
    v3 = v1
    v1 = 1 - self.ContractFrom
    local v5 = #self._Parts
    if v1 < v3 then
        p2.Size = Vector3.new((p7 - p6).Magnitude, v4, v4)
        local v6 = CFrame.lookAt((p6 + p7) * 0.5, p7)
        p2.CFrame = v6 * u72
        p2.Transparency = 1 - v3
        return
    end
    if v1 - 1 / (v5 * self.FadeLength) >= v3 then
        p2.Transparency = 1
        return
    end
    local v7 = (v3 - (v1 - 1 / (v5 * self.FadeLength))) * v5
    local v8 = p4 * self.PulseSpeed
    if p3 >= v8 - 0.5 * self.PulseLength then
        v2 = -1
    else
        v2 = 1
    end
    local v9 = (1 - v7 * self.FadeLength) * v2
    v7 = 1 - math.abs(v9)
    p2.Size = Vector3.new(v7 * (p7 - p6).Magnitude, v4, v4)
    local v10 = math.max(0, v9)
    v7 = p6 + (p7 - p6) * (v10 + (1 - math.abs(v9)) * 0.5)
    v2 = CFrame.lookAt(v7, p7)
    p2.CFrame = v2 * u72
    p2.Transparency = 1 - v3
end
function u80:_UpdateColor(p2, p3, p4) -- Line: 270
    if typeof(self.Color) == "Color3" then
        p2.Color = self.Color
        return
    end
    local v1 = (self._RanNum + p3 - p4 * self.ColorOffsetSpeed) % 1
    local Keypoints = self.Color.Keypoints
    local v2 = #Keypoints - 1
    local v3 = 1
    local v4 = p2
    for i = 1, v2, v3 do
        if Keypoints[i].Time < v1 and v1 < Keypoints[i + 1].Time then
            v4.Color = Keypoints[i].Value:lerp(Keypoints[i + 1].Value, (v1 - Keypoints[i].Time) / (Keypoints[i + 1].Time - Keypoints[i].Time))
            return
        end
    end
end
function u80:_Disable() -- Line: 288
    self.Enabled = false
    for i, v in ipairs(self._Parts) do
        v.Transparency = self._DisabledTransparency
    end
end
function u80.destroyAll() -- Line: 295 -- upvalues: u78 (val), Model (val)
    local v1 = {}
    for k, v in pairs(u78) do
        table.insert(v1, v)
    end
    local v2 = v1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        j.Enabled = false
        j:Destroy()
    end
    for k2, n in Model:GetChildren() do
        if n:IsA("BasePart") and n.Name == "BoltPart" and n.Transparency < 1 then
            n.Transparency = 1
        end
    end
end
RunService.Heartbeat:Connect(function() -- Line: 313 -- upvalues: u78 (val), clock (val), NoiseBetween (val), u77 (val)
    local AnimationSpeed, Attachment0, Attachment1, Frequency, MaxRadius, MaxThicknessMultiplier, MinRadius, MinThicknessMultiplier, Position, RadialProfileFunction, SpaceCurveFunction, WorldPosition, WorldPosition_2, _Parts, _RanNum, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
    debug.profilebegin("LightningBolt")
    for k, v in pairs(u78) do
        if v.Enabled == true then
            v._PartsHidden = false
            MinRadius = v.MinRadius
            MaxRadius = v.MaxRadius
            _Parts = v._Parts
            v23 = #_Parts
            _RanNum = v._RanNum
            AnimationSpeed = v.AnimationSpeed
            Frequency = v.Frequency
            MinThicknessMultiplier = v.MinThicknessMultiplier
            MaxThicknessMultiplier = v.MaxThicknessMultiplier
            v1 = clock() - v._StartT
            SpaceCurveFunction = v.SpaceCurveFunction
            RadialProfileFunction = v.RadialProfileFunction
            v2 = (v.PulseLength + 1) / v.PulseSpeed
            Attachment0 = v.Attachment0
            Attachment1 = v.Attachment1
            WorldPosition = Attachment0.WorldPosition
            v3 = Attachment0.WorldPosition + Attachment0.WorldAxis * v.CurveSize0
            v4 = Attachment1.WorldPosition - Attachment1.WorldAxis * v.CurveSize1
            WorldPosition_2 = Attachment1.WorldPosition
            v5 = SpaceCurveFunction(0, WorldPosition, v3, v4, WorldPosition_2)
            v6 = v5
            v7 = v5
            if v1 < v2 then
                v8 = v23
                v9 = 1
                for i = 1, v8, v9 do
                    v10 = _Parts[i]
                    v11 = i / v23
                    v12 = AnimationSpeed * -v1 + Frequency * 10 * v11 - 0.2 + _RanNum * 4
                    v13 = 5 * (AnimationSpeed * 0.01 * -v1 / 10 + Frequency * v11) + _RanNum * 4
                    v15 = NoiseBetween(5 * v12, 1.5, 1 * v13, 0, 0.2 * math.pi)
                    v18 = 0.1 * v13
                    v14 = v15 + NoiseBetween(0.5 * v12, 1.5, v18, 0, 1.8 * math.pi)
                    v16 = NoiseBetween(3.4, v13, v12, MinRadius, MaxRadius)
                    v15 = v16 * RadialProfileFunction(v11)
                    v16 = NoiseBetween(2.3, v13, v12, MinThicknessMultiplier, MaxThicknessMultiplier)
                    v17 = SpaceCurveFunction(v11, WorldPosition, v3, v4, WorldPosition_2)
                    if i == v23 then
                        Position = v17
                    else
                        v20 = CFrame.new(v7, v17)
                        v19 = v20 * CFrame.Angles(0, 0, v14)
                        v22 = NoiseBetween(v13, v12, 2.7, u77, 1)
                        v21 = math.acos((math.clamp(v22, -1, 1)))
                        v18 = v19 * CFrame.Angles(v21, 0, 0)
                        Position = (v18 * CFrame.new(0, 0, -v15)).Position
                    end
                    v:_UpdateGeometry(v10, v11, v1, v16, v6, Position)
                    v:_UpdateColor(v10, v11, v1)
                    v6 = Position
                    v7 = v17
                end
            elseif not v._Destroyed then
                v:Destroy()
            end
        elseif v._PartsHidden == false then
            v._PartsHidden = true
            v:_Disable()
        end
    end
    debug.profileend()
end)
return u80