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
--          File: ReplicatedStorage.Client.User.Miscellaneous.ClientSenseRunner
--                               Dumped in 0.00261 seconds
--                          Bytecode version 9  |  16 functions

local u163, u166
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Proficiencies = require(Sounds_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics_2 = Common_6:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_7:WaitForChild("Types")
require(Types:WaitForChild("Sense"))
_, u163 = useBlurEffect()
_, u166 = useFieldOfView()
local function getGroundPosition(p1, p2) -- Line: 67 -- upvalues: Workspace (val)
    local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
    local Position = HumanoidRootPart.Position
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {p1, p2}
    local v2 = Vector3.new(0, -500, 0)
    local v3 = Workspace:Raycast(Position, v2, v1)
    if v3 then
        return v3.Position + Vector3.new(0, 0.1, 0)
    end
    return Position - Vector3.new(0, HumanoidRootPart.Size.Y / 2 + 2, 0)
end
local function playCircleAnimation(p1, p2) -- Line: 89 -- upvalues: Character (val), getGroundPosition (val), Workspace (val), RunService (val), TweenService (val)
    local Attachment, Beam, v1, v2
    local v3 = Character.getCharacter()
    if not v3 then
        return
    end
    local v4 = {}
    local objects = p1.objects
    local v5 = nil
    local v6 = nil
    for i, j in objects, v5, v6 do
        if j.instance then
            table.insert(v4, j.instance)
        end
    end
    local u21 = getGroundPosition(v3, v4)
    local u23 = RaycastParams.new()
    u23.FilterType = Enum.RaycastFilterType.Exclude
    v6 = {v3}
    u23.FilterDescendantsInstances = v6
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Massless = true
    Part.Transparency = 1
    Part.Size = Vector3.new(0.2, 0.2, 0.2)
    Part.CFrame = CFrame.new(u21)
    Part.Parent = Workspace
    local u47 = table.create(48)
    local u50 = table.create(48)
    local v7 = 48
    local v8 = 1
    for k = 1, v7, v8 do
        Attachment = Instance.new("Attachment")
        Attachment.Name = "SensePoint_" .. k
        Attachment.Parent = Part
        u47[k] = Attachment
    end
    v7 = 48
    v8 = 1
    for n = 1, v7, v8 do
        Beam = Instance.new("Beam")
        Beam.Attachment0 = u47[n]
        Beam.Attachment1 = u47[n % 48 + 1]
        Beam.FaceCamera = true
        Beam.LightInfluence = 0
        Beam.LightEmission = 1
        Beam.Segments = 1
        Beam.Width0 = 0.2
        Beam.Width1 = 0.2
        Beam.Color = ColorSequence.new(p1.color)
        Beam.Transparency = NumberSequence.new(1)
        Beam.Parent = Part
        u50[n] = Beam
    end
    local function setTransparency(p1) -- Line: 147 -- upvalues: u50 (val)
        local v1 = NumberSequence.new(p1)
        local v2 = 48
        local v3 = 1
        for i = 1, v2, v3 do
            u50[i].Transparency = v1
        end
    end
    local u113 = table.create(48)
    local v9 = 48
    local v10 = 1
    for m = 1, v9, v10 do
        v1 = (m - 1) / 48 * math.pi * 2
        v2 = math.cos(v1)
        u113[m] = Vector3.new(v2, 0, (math.sin(v1)))
    end
    local function findGroundY(p1, p2) -- Line: 162 -- upvalues: u21 (val), Workspace (upval), u23 (val)
        local v1 = Vector3.new(p1, u21.Y + 8, p2)
        local v2 = Vector3.new(0, -508, 0)
        local v3 = Workspace:Raycast(v1, v2, u23)
        if v3 then
            return v3.Position.Y + 0.1
        end
        return u21.Y
    end
    local function setRadius(p1) -- Line: 178 -- upvalues: Part (val), u113 (val), u21 (val), findGroundY (val), u47 (val)
        local v1, v2, v3, v4, v5
        local v6 = 48
        local v7 = 1
        for i = 1, v6, v7 do
            v1 = u113[i]
            v2 = u21.X + v1.X * p1
            v3 = u21.Z + v1.Z * p1
            v4 = findGroundY(v2, v3)
            v5 = u47[i]
            v5.Position = Vector3.new(v2, v4, v3) - Part.Position
        end
    end
    setRadius(0)
    setTransparency(1)
    local u178 = math.max(p2, 0.95)
    local u179 = 0
    local u180 = nil
end
local function getObjectWorldPosition(p1) -- Line: 229
    local BasePart
    if p1.cframe then
        return p1.cframe.Position
    end
    local instance = p1.instance
    if not instance then
        return nil
    end
    if instance:IsA("BasePart") then
        return instance.Position
    end
    if instance:IsA("Model") then
        return instance:GetPivot().Position
    end
    BasePart = instance:FindFirstChildWhichIsA("BasePart", true)
    if BasePart then
        return BasePart.Position
    end
    return nil
end
local function getHighlightAdornee(p1) -- Line: 260
    local reference = p1.reference
    if not reference then
        reference = p1.instance
    end
    return reference
end
local function playHighlight(p1, p2, p3) -- Line: 271 -- upvalues: getHighlightAdornee (val), TweenService (val), getObjectWorldPosition (val), Workspace (val), Signals (val)
    local v1 = getHighlightAdornee(p1)
    if not v1 then
        return
    end
    local color = p1.color
    if not color then
        color = p2.color
    end
    local fillTransparency = p1.fillTransparency
    if not fillTransparency then
        fillTransparency = p2.fillTransparency
        if not fillTransparency then
            fillTransparency = 0.5
        end
    end
    local outlineTransparency = p1.outlineTransparency
    if not outlineTransparency then
        outlineTransparency = p2.outlineTransparency
        if not outlineTransparency then
            outlineTransparency = 0
        end
    end
    local Highlight = Instance.new("Highlight")
    Highlight.Adornee = v1
    Highlight.FillColor = color
    Highlight.OutlineColor = color
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Parent = v1
    local v2 = TweenInfo.new(0.15)
    local v3 = {FillTransparency = fillTransparency, OutlineTransparency = outlineTransparency}
    TweenService:Create(Highlight, v2, v3):Play()
    if p3 then
        local PrimaryPart
        if not (v1:IsA("Model")) then
            PrimaryPart = v1:IsA("BasePart") and v1
        else
            PrimaryPart = v1.PrimaryPart
            if not PrimaryPart then
                PrimaryPart = v1:FindFirstChild("HumanoidRootPart")
                if not PrimaryPart then
                    PrimaryPart = v1:FindFirstChild("Interaction")
                end
            end
        end
        local v4 = getObjectWorldPosition(p1)
        local CurrentCamera = Workspace.CurrentCamera
        v2 = false
        if v4 and CurrentCamera then
            local v5
            v3, v5 = CurrentCamera:WorldToViewportPoint(v4)
            local ViewportSize = CurrentCamera.ViewportSize
            if v5 and 0 < ViewportSize.X and 0 < ViewportSize.Y then
                local v6 = v3.Y / ViewportSize.Y - 0.5
                local v7 = false
                local v8 = math.abs(v3.X / ViewportSize.X - 0.5)
                if v8 <= 0.25 then
                    v8 = math.abs(v6)
                    v7 = v8 <= 0.25
                end
                v2 = v7
            end
        end
        if not v2 then
            Signals.Indicator:Fire({lifetime = 1, location = PrimaryPart})
        end
    end
    local v9 = math.max(p2.hold or 0, 0)
    task.delay(v9 + 0.15, function() -- Line: 335 -- upvalues: TweenService (upval), Highlight (val)
        local v1 = TweenInfo.new(0.5)
        TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
        task.delay(0.5, function() -- Line: 341 -- upvalues: Highlight (upval)
            Highlight:Destroy()
        end)
    end)
end
local function selectIndicatorObjects(p1, p2) -- Line: 353 -- upvalues: getObjectWorldPosition (val)
    local v1, v2, v3, v4, v5
    local v6 = {}
    local objects = p1.objects
    local v7 = nil
    local v8 = nil
    for i, j in objects, v7, v8 do
        v4 = getObjectWorldPosition(j)
        if v4 then
            v5 = v4 - p2
            v1 = math.sqrt(v5.X * v5.X + v5.Z * v5.Z)
            if p1.radius >= v1 then
                table.insert(v6, {object = j, position = v4, distance = v1})
            end
        end
    end
    table.sort(v6, function(p1, p2) -- Line: 373
        local v1 = p1.distance < p2.distance
        return v1
    end)
    local v9 = {}
    v7 = v6
    v8 = nil
    local v10 = nil
    for k, n in v7, v8, v10 do
        if 3 <= #v9 then
            break
        end
        v5 = false
        v1 = v9
        v2 = nil
        v3 = nil
        for m, i5 in v1, v2, v3 do
            if (n.position - i5.position).Magnitude < 80 then
                v5 = true
                break
            end
        end
        if not v5 then
            table.insert(v9, n)
        end
    end
    return v9
end
local function scheduleHighlight(p1, p2, p3, p4) -- Line: 407 -- upvalues: getObjectWorldPosition (val), playHighlight (val)
    local v1
    local v2 = getObjectWorldPosition(p1)
    if not v2 then
        return
    end
    if p2.indicator then
        v1 = p4
    else
        v1 = false
    end
    local v3 = v2 - p3
    local v4 = v3.X * v3.X
    local v5 = math.sqrt(v4 + v3.Z * v3.Z)
    if p2.radius < v5 then
        return
    end
    v4 = v5 / math.max(p2.radius, 0.001)
    local v6 = (1 - math.sqrt(1 - math.clamp(v4, 0, 1))) * p2.duration
    if v6 <= 0 then
        playHighlight(p1, p2, v1)
        return
    end
    task.delay(v6, playHighlight, p1, p2, v1)
end
return {
    onRevealSense = function(p1) -- Line: 443 -- upvalues: Lighting (val), Sounds (val), Proficiencies (val), u163 (val), u166 (val), TweenService (val), playCircleAnimation (val), Character (val), getGroundPosition (val), selectIndicatorObjects (val), scheduleHighlight (val)
        local count, interval, v1, v2, v3, v4, v5
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Parent = Lighting
        local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
        DepthOfFieldEffect.FarIntensity = 1
        DepthOfFieldEffect.FocusDistance = 1
        DepthOfFieldEffect.NearIntensity = 0
        DepthOfFieldEffect.InFocusRadius = 0
        DepthOfFieldEffect.Parent = Lighting
        Sounds.playGlobalSoundEffect(Proficiencies.Sense.Begin, 0.01, 3, 3, nil, 2)
        local v6 = u163("sense", 40, "add", 1, TweenInfo.new(0.1))
        local v7 = u166("sense", 30, "add", 1, TweenInfo.new(0.1))
        local v8 = TweenInfo.new(0.1)
        TweenService:Create(ColorCorrectionEffect, v8, {Brightness = 1, Saturation = 1, Contrast = 1, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        task.wait(0.1)
        v8 = TweenInfo.new(0.35)
        TweenService:Create(ColorCorrectionEffect, v8, {Brightness = -0.05, Saturation = -1, Contrast = 0.2, TintColor = Color3.fromRGB(129, 184, 235)}):Play()
        v6(TweenInfo.new(1))
        v7(TweenInfo.new(1))
        task.wait(0.2)
        v8 = TweenInfo.new(p1.duration * 2)
        TweenService:Create(DepthOfFieldEffect, v8, {InFocusRadius = p1.radius}):Play()
        local v9 = math.max(p1.pulses or 1, 1)
        local v10 = p1.duration / v9
        if not p1.burst then
            count = 1
        else
            count = p1.burst.count
        end
        local v11 = math.max(count, 1)
        if not p1.burst then
            interval = 0
        else
            interval = p1.burst.interval
        end
        v8 = math.max(interval, 0)
        local v12 = v9 - 1
        local v13 = 1
        local v14 = p1
        for i = 0, v12, v13 do
            v1 = i * v10
            v2 = v11 - 1
            v3 = 1
            for j = 0, v2, v3 do
                v4 = v1 + j * v8
                v5 = v14.duration - v4
                if v5 > 0 then
                    if v4 > 0 then
                        task.delay(v4, playCircleAnimation, v14, v5)
                    else
                        playCircleAnimation(v14, v5)
                    end
                end
            end
        end
        v12 = Character.getCharacter()
        if v12 then
            local v15
            v13 = {}
            local objects = v14.objects
            v1 = nil
            v2 = nil
            for k, n in objects, v1, v2 do
                if n.instance then
                    table.insert(v13, n.instance)
                end
            end
            local v16 = getGroundPosition(v12, v13)
            v1 = {}
            if v14.indicator then
                for m, i5 in selectIndicatorObjects(v14, v16) do
                    v1[i5.object] = true
                end
            end
            local objects_2 = v14.objects
            v3 = nil
            local v17 = nil
            for i6, i7 in objects_2, v3, v17 do
                v15 = v1[i7] == true
                scheduleHighlight(i7, v14, v16, v15)
            end
        end
        task.wait(v14.duration - 0.5)
        v2 = TweenInfo.new(1.5)
        TweenService:Create(ColorCorrectionEffect, v2, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v2 = TweenInfo.new(1.5)
        TweenService:Create(DepthOfFieldEffect, v2, {FarIntensity = 0}):Play()
        task.wait(1.5)
        ColorCorrectionEffect:Destroy()
        DepthOfFieldEffect:Destroy()
    end,
}