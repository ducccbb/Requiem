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
--                     File: ReplicatedStorage.Common.Effects.Screen
--                               Dumped in 0.00277 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Network = script.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Effects = require(Namespaces:WaitForChild("Effects"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local EffectCamera = Assets:WaitForChild("Objects"):WaitForChild("EffectCamera")
local Screen = Assets:WaitForChild("Particles"):WaitForChild("Screen")
local u62 = Vector3.new(0, 0, -3)
local u63 = {"Left", "Right", "Top", "Bottom"}
local u68 = {}
local function getScreenEdgeBoundsFromViewport(p1, p2, p3) -- Line: 77
    local ViewportSize = p1.ViewportSize
    if ViewportSize.X <= 0 or ViewportSize.Y <= 0 then
        return nil
    end
    local u12 = math.max(p2, 0.1)
    local function corner(a1, p2) -- Line: 84 -- upvalues: p1 (val), u12 (ref)
        local v1 = p1:ViewportPointToRay(a1, p2, 0)
        return v1.Origin + v1.Direction * u12
    end
    local v1 = corner(0, 0)
    local v2 = corner(ViewportSize.X, 0)
    local v3 = corner(0, ViewportSize.Y)
    local v4 = corner(ViewportSize.X, ViewportSize.Y)
    if p3 and 0 < p3 and p3 < 1 then
        local v5 = (v1 + v2 + v3 + v4) / 4
        v1 = v5 + (v1 - v5) * p3
        v2 = v5 + (v2 - v5) * p3
        v3 = v5 + (v3 - v5) * p3
        v4 = v5 + (v4 - v5) * p3
    end
    return {
        left = {center = (v1 + v3) / 2, length = (v1 - v3).Magnitude, up = (v1 - v3).Unit},
        right = {center = (v2 + v4) / 2, length = (v2 - v4).Magnitude, up = (v2 - v4).Unit},
        top = {center = (v1 + v2) / 2, length = (v2 - v1).Magnitude, up = (v2 - v1).Unit},
        bottom = {center = (v3 + v4) / 2, length = (v4 - v3).Magnitude, up = (v4 - v3).Unit},
    }
end
local function scaleTransparency(p1, p2) -- Line: 132
    local v1
    local v2 = {}
    local Keypoints = p1.Keypoints
    local v3 = nil
    local v4 = nil
    for i, j in Keypoints, v3, v4 do
        v1 = math.clamp(j.Value * p2, 0, 1)
        table.insert(v2, NumberSequenceKeypoint.new(j.Time, v1, (j.Envelope or 0) * p2))
    end
    return NumberSequence.new(v2)
end
local function createClientScreenEffect(p1) -- Line: 148 -- upvalues: Screen (val), EffectCamera (val), u62 (val), RunService (val), getScreenEdgeBoundsFromViewport (val), u63 (val), scaleTransparency (val), u68 (val)
    local u27, v1, v2, v3, v4, v5, v6
    local v7 = Screen:FindFirstChild(p1.name)
    assert(v7, "Particle not found")
    local CurrentCamera = workspace.CurrentCamera
    local u182 = EffectCamera:Clone()
    u182.Parent = workspace
    local offset = p1.offset
    if not offset then
        offset = u62
    end
    local Magnitude = offset.Magnitude
    if not p1.backoff then
        u27 = nil
    elseif 1 < p1.backoff then
        u27 = 1 / p1.backoff
    end
    p1.__connection = RunService.PreRender:Connect(function() -- Line: 163 -- upvalues: getScreenEdgeBoundsFromViewport (upval), CurrentCamera (val), Magnitude (val), u27 (val), u63 (upval), u182 (val)
        local v1, v2
        local v3 = getScreenEdgeBoundsFromViewport(CurrentCamera, Magnitude, u27)
        if not v3 then
            return
        end
        local RenderCFrame = CurrentCamera:GetRenderCFrame()
        local v4 = {Left = v3.left, Right = v3.right, Top = v3.top, Bottom = v3.bottom}
        local v5 = u63
        local v6 = nil
        local v7 = nil
        for i, j in v5, v6, v7 do
            v1 = u182:FindFirstChild(j)
            if v1 and v1:IsA("BasePart") then
                v2 = v4[j]
                v1.CFrame = CFrame.lookAt(v2.center, v2.center + (RenderCFrame.Position - v2.center).Unit, v2.up)
                v1.Size = Vector3.new(0.05, 3.5, 0.05)
            end
        end
    end)
    local Model = Instance.new("Model")
    v7:Clone().Parent = Model
    Model:ScaleTo(p1.scale or 0.15)
    v6 = {}
    v1 = p1
    for i, j in Model:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            table.insert(v6, j)
        elseif not (j:IsA("Trail")) and not (j:IsA("Beam")) then
        end
    end
    local color = v1.color
    if not color then
        color = Color3.fromRGB(255, 255, 255)
    end
    local v8 = ColorSequence.new(color)
    for k, n in u182:GetChildren() do
        if n:IsA("BasePart") then
            v2 = v6
            v3 = nil
            v4 = nil
            for m, i5 in v2, v3, v4 do
                v5 = i5:Clone()
                if v5:IsA("ParticleEmitter") then
                    if v1.color then
                        v5.Color = v8
                    end
                    v5.LockedToPart = true
                    if v1.transparency ~= nil then
                        v5.Transparency = scaleTransparency(v5.Transparency, v1.transparency)
                    end
                    if v1.timescale ~= nil then
                        v5.TimeScale = v5.TimeScale * v1.timescale
                    end
                elseif v1.timescale == nil then
                    if v1.timescale ~= nil and v5:IsA("Beam") then
                        v5.TimeScale = v5.TimeScale * v1.timescale
                    end
                elseif v5:IsA("Trail") then
                    v5.TimeScale = v5.TimeScale * v1.timescale
                end
                v5.Parent = n
            end
        end
    end
    Model:Destroy()
    v1.__object = u182
    u68[v1.name] = v1
end
local function cleanupClientScreenEffect(p1, p2) -- Line: 255 -- upvalues: u68 (val)
    if p2.__connection then
        p2.__connection:Disconnect()
        p2.__connection = nil
    end
    if p2.__object then
        p2.__object:Destroy()
        p2.__object = nil
    end
    u68[p1] = nil
end
local function removeClientScreenEffect(p1, p2) -- Line: 273 -- upvalues: u68 (val), cleanupClientScreenEffect (val)
    local u45
    local u48 = u68[p1]
    if not u48 then
        return
    end
    if p2 then
        cleanupClientScreenEffect(p1, u48)
        return
    end
    if u48.__disabled then
        return
    end
    u48.__disabled = true
    local __object = u48.__object
    if not __object then
        u45 = p1
    else
        u45 = p1
        for i, j in __object:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = false
            elseif not (j:IsA("Trail")) and not (j:IsA("Beam")) then
            end
        end
    end
    task.delay(2, function() -- Line: 303 -- upvalues: u68 (upval), u45 (val), u48 (val), cleanupClientScreenEffect (upval)
        local v1 = u68[u45]
        if not v1 or v1 ~= u48 then
            return
        end
        cleanupClientScreenEffect(u45, v1)
    end)
end
local function onRemoveScreenEffect(p1, p2) -- Line: 319 -- upvalues: RunService (val), Effects (val), removeClientScreenEffect (val)
    local v1
    if typeof(p1) ~= "table" then
        v1 = p2
    elseif not (RunService:IsClient()) then
        v1 = p2
    else
        v1 = p1
    end
    if RunService:IsServer() then
        Effects.Event.unreliableSend(p1, "RemoveScreenEffect", v1.name)
        return
    end
    removeClientScreenEffect(v1.name)
end
return {
    onCreateScreenEffect = function(p1, p2) -- Line: 338 -- upvalues: RunService (val), Effects (val), createClientScreenEffect (val), onRemoveScreenEffect (val)
        local u9
        if typeof(p1) ~= "table" then
            u9 = p2
        elseif not (RunService:IsClient()) then
            u9 = p2
        else
            u9 = p1
        end
        if u9.enabled == nil then
            u9.enabled = true
        end
        if not (RunService:IsServer()) then
            createClientScreenEffect(u9)
        else
            Effects.Event.unreliableSend(p1, "CreateScreenEffect", u9)
        end
        if u9.duration then
            task.delay(u9.duration, function() -- Line: 357 -- upvalues: onRemoveScreenEffect (upval), p1 (val), u9 (ref)
                onRemoveScreenEffect(p1, u9)
            end)
        end
    end,
    onRemoveScreenEffect = onRemoveScreenEffect,
    __createClientScreenEffect = createClientScreenEffect,
    __removeClientScreenEffect = removeClientScreenEffect,
}