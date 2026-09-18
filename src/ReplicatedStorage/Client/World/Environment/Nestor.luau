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
--                File: ReplicatedStorage.Client.World.Environment.Nestor
--                               Dumped in 0.00195 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Debris = require(Utilities_2:WaitForChild("Debris"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Effects_2 = Common_3:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_5:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u170 = {
    LowerTorso = 1500,
    LowerTorso2 = 1500,
    UpperTorso = 1500,
    UpperTorso1 = 1500,
    UpperTorso2 = 1500,
    RightUpperLeg = 500,
    RightLowerLeg = 500,
    RightUpperArm = 500,
    RightLowerArm = 500,
    LeftUpperLeg = 500,
    LeftLowerLeg = 500,
    LeftUpperArm = 500,
    LeftLowerArm = 500,
}
local u171 = {}
local u172 = 0
local u173 = 0
local u174 = false
local u175 = 0
local u176 = 0
local u177 = nil
local u178 = nil
local function onTrackKeyframe(p1, p2) -- Line: 78 -- upvalues: Debris (val)
    if not (p1:FindFirstChild(p2)) then
        return
    end
    local RootPart = p1:WaitForChild("RootPart")
    if not RootPart then
        return
    end
    local v1 = RootPart:FindFirstChild(p2, true)
    if not v1 or not (v1:IsA("Bone")) then
        return
    end
    Debris.rocks(v1.WorldCFrame.Position, 30, 40, 20, 400, 200, {p1})
end
local function getClosestBubbleDistance(p1) -- Line: 104 -- upvalues: u170 (val), Character (val)
    local v1, v2, v3
    local RootPart = p1:FindFirstChild("RootPart")
    if not RootPart then
        return nil
    end
    local v4 = nil
    for k, v in pairs(u170) do
        v2 = RootPart:FindFirstChild(k, true)
        if v2 then
            v3, v1 = Character.getDistance(v2.WorldCFrame.Position + Vector3.new(0, -200, 0))
            if v1 and v3 <= v then
                if v4 == nil then
                    v4 = v3
                elseif v3 >= v4 then
                end
            end
        end
    end
    return v4
end
local function onHandleBubbleHit(p1, p2, p3) -- Line: 134 -- upvalues: u172 (ref), Signals (val), u173 (ref)
    local v1 = tick() - u172
    if 6 < v1 then
        Signals.Monologue:Fire({"This heat, it's unbearable...", "I'm sweating profusely...", "It feels as though my skin is melting...", "I need to get out of here..."})
        u172 = tick()
    end
    if p2 < 1300 then
        u173 = math.min(u173 + p3, 4)
        return
    end
    u173 = math.max(u173 - p3 * 0.5, 0)
end
local function updateBubbleScreenEffect(p1) -- Line: 158 -- upvalues: u177 (ref)
    local v1
    if not u177 then
        return
    end
    if p1 == nil then
        v1 = 0
    else
        v1 = math.clamp(1 - p1 / 1500, 0, 1)
    end
    u177.Contrast = -v1 / 3
    u177.Brightness = v1 / 2
    u177.Saturation = -v1 / 2
    local v2 = Color3.fromRGB(255, 255, 255)
    local v3 = Color3.fromRGB(255, 188, 136)
    u177.TintColor = v2:Lerp(v3, v1)
end
local function onNestorAdded(p1) -- Line: 181 -- upvalues: u177 (ref), Lighting (val), getClosestBubbleDistance (val), onHandleBubbleHit (val), u173 (ref), u174 (ref), u176 (ref), Effects (val), u178 (ref), Sounds (val), Universal (val), u171 (val), TweenService (val), RunService (val), CollectionService (val), Players (val), u175 (ref), Vitality (val), updateBubbleScreenEffect (val), onTrackKeyframe (val)
    if p1:HasTag("Deshifting") then
        return
    end
    local u5 = {}
    local Folder = Instance.new("Folder")
    Folder.Name = "Collisions"
    Folder.Parent = workspace
    if u177 then
        u177:Destroy()
    end
    if not u177 then
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Parent = Lighting
        u177 = ColorCorrectionEffect
    end
    local function onCheckRangeBubble(a1) -- Line: 206 -- upvalues: getClosestBubbleDistance (upval), p1 (val), onHandleBubbleHit (upval)
        local v1 = getClosestBubbleDistance(p1)
        if v1 == nil then
            return false
        end
        onHandleBubbleHit(p1, v1, a1)
        return true
    end
    local function onCheckBodyHeat(p1) -- Line: 220 -- upvalues: u173 (upval), u174 (upval), u176 (upval), Effects (upval), u178 (upval), Sounds (upval), Universal (upval)
        if 1 > u173 or u174 then
            if u173 < 1 and u174 then
                u174 = false
                u176 = 0
                Effects.Screen.__removeClientScreenEffect("Fire")
            end
            return
        end
        u174 = true
        u176 = 0
        Effects.Screen.__createClientScreenEffect({name = "Fire"})
        if u178 then
            return
        end
        u178 = Sounds.playGlobalSoundEffect(Universal.Fire, 0.1, 1, 30)
        task.delay(30, function() -- Line: 229 -- upvalues: u178 (upval)
            u178 = nil
        end)
    end
    p1.AncestryChanged:Once(function() -- Line: 241 -- upvalues: p1 (val), u174 (upval), u176 (upval), Effects (upval), u171 (upval), TweenService (upval), u177 (upval)
        if not (p1:IsDescendantOf(workspace)) then
            if u174 then
                u174 = false
                u176 = 0
                Effects.Screen.__removeClientScreenEffect("Fire")
            end
            u171[p1]:Disconnect()
            u171[p1] = nil
            local v1 = TweenInfo.new(3)
            TweenService:Create(u177, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        end
    end)
    u171[p1] = RunService.RenderStepped:Connect(function(a1) -- Line: 262 -- upvalues: p1 (val), CollectionService (upval), Players (upval), getClosestBubbleDistance (upval), u174 (upval), u175 (upval), u176 (upval), Vitality (upval), updateBubbleScreenEffect (upval), onCheckRangeBubble (val), u173 (upval), onCheckBodyHeat (val), u5 (val), onTrackKeyframe (upval)
        local v1
        local Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
        if not Humanoid then
            return
        end
        local Animator = Humanoid:FindFirstChildWhichIsA("Animator")
        if not Animator then
            return
        end
        local v2 = nil
        local v3 = a1
        for i, j in CollectionService:GetTagged("Nestor") do
            if j.Name ~= Players.LocalPlayer.Name then
                v1 = getClosestBubbleDistance(j)
                if v1 ~= nil then
                    if v2 == nil then
                        v2 = v1
                    elseif v1 >= v2 then
                    end
                end
            end
        end
        if u174 then
            local v4 = tick() - u175
            if 2 <= v4 and Players.LocalPlayer.Name ~= p1.Name then
                local v5 = math.clamp(1 - (v2 or 1500) / 1500, 0, 1)
                Vitality.Inflict.post({reason = "fire", amount = (u176 + 5) * (v5 * 3 + 1)})
                u176 = u176 + 2
                u175 = tick()
            end
        end
        updateBubbleScreenEffect(v2)
        if p1.Name ~= Players.LocalPlayer.Name and not (onCheckRangeBubble(v3)) then
            u173 = math.max(u173 - v3 * 0.5, 0)
        end
        onCheckBodyHeat(v3)
        for k, n in Animator:GetPlayingAnimationTracks() do
            if not (u5[n]) then
                u5[n] = n.KeyframeReached:Connect(function(a1) -- Line: 318 -- upvalues: onTrackKeyframe (upval), p1 (upval)
                    onTrackKeyframe(p1, a1)
                end)
            end
        end
    end)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Nestor")
InstanceAddedSignal:Connect(onNestorAdded)
for i, j in CollectionService:GetTagged("Nestor") do
    onNestorAdded(j)
end
return {}