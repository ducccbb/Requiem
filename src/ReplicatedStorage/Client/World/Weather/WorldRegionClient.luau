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
--            File: ReplicatedStorage.Client.World.Weather.WorldRegionClient
--                               Dumped in 0.00182 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local WorldLightingClient = require(script.Parent:WaitForChild("WorldLightingClient"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local blink = require(Utilities_2:WaitForChild("State"))("blink")
local u74 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local u75 = {
    Cave = {
        blink = true,
        properties = {
            Brightness = 0.15,
            Atmosphere = {Density = 0.65, Haze = 10, Color = Color3.fromRGB(70, 70, 70), Decay = Color3.fromRGB(0, 0, 0)},
            ColorCorrection = {Brightness = 0.075, Contrast = 0.1, Saturation = -0.3, TintColor = Color3.fromRGB(80, 84, 91)},
        },
        easing = TweenInfo.new(0),
    },
    Forest = {
        blink = true,
        properties = {
            Atmosphere = {
                Density = 0.328,
                Offset = 1,
                Glare = 0.24,
                Haze = 10,
                Color = Color3.fromRGB(136, 179, 141),
                Decay = Color3.fromRGB(136, 179, 141),
            },
            ColorCorrection = {Brightness = 0, Contrast = 0.1, Saturation = 0, TintColor = Color3.fromRGB(228, 255, 230)},
        },
        easing = TweenInfo.new(0),
    },
    Catacombs = {
        blink = true,
        properties = {
            Brightness = 2,
            EnvironmentDiffuseScale = 1,
            EnvironmentSpecularScale = 1,
            ExposureCompensation = 0.1,
            Ambient = Color3.fromRGB(70, 137, 200),
            ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
            ColorShift_Top = Color3.fromRGB(0, 0, 0),
            OutdoorAmbient = Color3.fromRGB(70, 70, 70),
            Atmosphere = {
                Density = 0.341,
                Offset = 1,
                Glare = 0.98,
                Haze = 1.22,
                Color = Color3.fromRGB(96, 168, 255),
                Decay = Color3.fromRGB(167, 198, 255),
            },
            ColorCorrection = {Brightness = 0.1, Contrast = 0.3, Saturation = 0.2, TintColor = Color3.fromRGB(197, 215, 255)},
        },
        easing = TweenInfo.new(0),
    },
}
local u162 = {}
local u163 = {}
local u164 = {}
local u165 = nil
local u166 = nil
local u167 = nil
local u168 = nil
local u169 = 0
local u170 = nil
local function cancelTransition() -- Line: 144 -- upvalues: u167 (ref), u168 (ref), blink (val)
    if u167 then
        task.cancel(u167)
        u167 = nil
    end
    if u168 then
        task.cancel(u168)
        u168 = nil
    end
    blink({enabled = false, overshoot = 0.5, tween = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)})
end
local function addRegionFromInstance(p1) -- Line: 167 -- upvalues: u162 (val)
    if not (p1:IsA("BasePart")) then
        return
    end
    local Attribute = p1:GetAttribute("Lighting")
    if typeof(Attribute) ~= "string" or Attribute == "" then
        return
    end
    for i, v in ipairs(u162) do
        if v.part == p1 then
            return
        end
    end
    p1.Transparency = 1
    table.insert(u162, {part = p1, name = Attribute})
end
local function removeRegionForInstance(p1) -- Line: 200 -- upvalues: u162 (val), u163 (val), u164 (val), u165 (ref), WorldLightingClient (val), u74 (val)
    local v1, v2, v3
    if not (p1:IsA("BasePart")) then
        return
    end
    for i, v in ipairs(u162) do
        if v.part == p1 then
            table.remove(u162, i)
            u163[p1] = nil
            v2 = 1
            v3 = -1
            v1 = p1
            for i2 = #u164, v2, v3 do
                if u164[i2] == v1 then
                    table.remove(u164, i2)
                end
            end
            if u165 ~= v1 then
                break
            end
            u165 = nil
            WorldLightingClient.restoreServerLighting(u74)
            return
        end
    end
end
local function isPointInsideRegion(p1, p2) -- Line: 233
    local part = p1.part
    local v1 = part.CFrame:PointToObjectSpace(p2)
    local v2 = part.Size * 0.5
    local v3 = false
    local v4 = math.abs(v1.X)
    if v4 <= v2.X then
        v3 = false
        v4 = math.abs(v1.Y)
        if v4 <= v2.Y then
            v4 = math.abs(v1.Z)
            v3 = v4 <= v2.Z
        end
    end
    return v3
end
local function getCurrentCharacterPosition() -- Line: 246 -- upvalues: Character (val)
    local v1 = Character.getCharacter()
    if not v1 then
        return nil
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return nil
    end
    return HumanoidRootPart.Position
end
local function applyRegionLighting(p1) -- Line: 264 -- upvalues: cancelTransition (val), u166 (ref), WorldLightingClient (val), u74 (val), u75 (val), u167 (ref), blink (val), u168 (ref)
    cancelTransition()
    if not p1 then
        u166 = nil
        WorldLightingClient.restoreServerLighting(u74)
        return
    end
    local Attribute = p1:GetAttribute("Lighting")
    if typeof(Attribute) ~= "string" or Attribute == "" then
        u166 = nil
        WorldLightingClient.restoreServerLighting(u74)
        return
    end
    if Attribute == u166 then
        return
    end
    local u17 = u75[Attribute]
    if not u17 then
        u166 = nil
        WorldLightingClient.restoreServerLighting(u74)
        return
    end
    local easing = u17.easing
    if not easing then
        easing = u74
    end
    if u17.blink then
        u167 = task.spawn(function() -- Line: 302 -- upvalues: blink (upval), u168 (upval), easing (val), u167 (upval), u166 (upval), Attribute (val), WorldLightingClient (upval), u17 (val)
            blink({enabled = true, speed = 1.5, overshoot = 0.5})
            u168 = task.delay(1.7 + easing.Time, function() -- Line: 310 -- upvalues: u168 (upval), blink (upval)
                u168 = nil
                blink({enabled = false, overshoot = 0.5, tween = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)})
            end)
            task.wait(1.5)
            u167 = nil
            u166 = Attribute
            WorldLightingClient.setCustomLighting(u17.properties, easing)
        end)
        return
    end
    u166 = Attribute
    WorldLightingClient.setCustomLighting(u17.properties, easing)
end
local function updateRegionsForPosition() -- Line: 335 -- upvalues: getCurrentCharacterPosition (val), u165 (ref), u163 (val), u164 (val), applyRegionLighting (val), u162 (val), isPointInsideRegion (val)
    local v1, v2
    local v3 = getCurrentCharacterPosition()
    if not v3 then
        if u165 then
            u165 = nil
            table.clear(u163)
            table.clear(u164)
            applyRegionLighting(nil)
        end
        return
    end
    local v4 = {}
    for i, v in ipairs(u162) do
        if isPointInsideRegion(v, v3) then
            v4[v.part] = true
        end
    end
    local v5 = {}
    local v6 = {}
    for k in pairs(v4) do
        if not (u163[k]) then
            table.insert(v5, k)
        end
    end
    for k2 in pairs(u163) do
        if not (v4[k2]) then
            table.insert(v6, k2)
        end
    end
    for i2, i3 in ipairs(v5) do
        u163[i3] = true
        table.insert(u164, i3)
    end
    for i4, j in ipairs(v6) do
        u163[j] = nil
        v2 = 1
        v1 = -1
        for k3 = #u164, v2, v1 do
            if u164[k3] == j then
                table.remove(u164, k3)
            end
        end
    end
    local v7 = nil
    local v8 = #u164
    if 0 < v8 then
        v7 = u164[#u164]
    end
    if v7 ~= u165 then
        u165 = v7
        applyRegionLighting(u165)
    end
end
local function onHeartbeat(p1) -- Line: 409 -- upvalues: u169 (ref), updateRegionsForPosition (val)
    u169 = u169 + p1
    if u169 < 0.15 then
        return
    end
    u169 = 0
    updateRegionsForPosition()
end
;(function() -- Line: 423 -- upvalues: u170 (ref), CollectionService (val), addRegionFromInstance (val), removeRegionForInstance (val), RunService (val), onHeartbeat (val)
    if u170 then
        return
    end
    for i, v in ipairs(CollectionService:GetTagged("Region")) do
        addRegionFromInstance(v)
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Region")
    InstanceAddedSignal:Connect(function(p1) -- Line: 432 -- upvalues: addRegionFromInstance (upval)
        addRegionFromInstance(p1)
    end)
    local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Region")
    InstanceRemovedSignal:Connect(function(p1) -- Line: 436 -- upvalues: removeRegionForInstance (upval)
        removeRegionForInstance(p1)
    end)
    u170 = RunService.Heartbeat:Connect(onHeartbeat)
end)()
return {}