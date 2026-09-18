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
--       File: ReplicatedStorage.Client.User.Character.CharacterTemperatureHandler
--                               Dumped in 0.00211 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Emotes = require(Animations:WaitForChild("Emotes"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local v3 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local CharacterMovementRunner = require(v1.Parent:WaitForChild("CharacterMovementRunner"))
local Progression = v1.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u181 = v3.new()
local u182 = {}
local u184 = tick()
local u185 = 0
local u186 = 98
local u187 = 0
local u188 = false
local u189 = false
local u190 = false
local u191 = 0
local u192 = 0
local u193 = nil
local u195 = tick()
local u197 = tick()
Players.LocalPlayer:SetAttribute("Temperature", 98)
local function getNumberAttribute(p1, p2) -- Line: 86 -- upvalues: ClientAttributesHandler (val)
    local v1 = ClientAttributesHandler.getAttribute(p1)
    if typeof(v1) == "number" then
        return v1
    end
    return p2
end
local function getSpeedMultiplier(p1, p2) -- Line: 94 -- upvalues: getNumberAttribute (val)
    local v1 = getNumberAttribute(p1, p2)
    return (math.max(v1, 0.01))
end
local function getDecayRateSpeedMultiplier(p1) -- Line: 98 -- upvalues: getNumberAttribute (val)
    return (math.max(getNumberAttribute(p1, 0.1) / 0.1, 0.01))
end
local function applyTemperatureResistance(p1) -- Line: 103 -- upvalues: getNumberAttribute (val)
    local v1
    if p1 < 0 then
        v1 = getNumberAttribute("ColdTemperatureResistanceMultiplier", 0)
        return p1 * (1 - math.clamp(v1, 0, 1))
    end
    if 0 >= p1 then
        return p1
    end
    v1 = getNumberAttribute("HotTemperatureResistanceMultiplier", 0)
    return p1 * (1 - math.clamp(v1, 0, 1))
end
local function getBuildingWarmThreshold() -- Line: 117 -- upvalues: getNumberAttribute (val)
    return getNumberAttribute("BuildingWarmStartThreshold", 90)
end
local function getBuildingWarmTarget() -- Line: 121 -- upvalues: getNumberAttribute (val)
    return getNumberAttribute("BuildingWarmTargetTemperature", 92)
end
local function getTemperatureChangeAmount() -- Line: 125 -- upvalues: getNumberAttribute (val)
    local v1 = getNumberAttribute("BodyTemperatureChangeAmount", 1)
    return (math.max(v1, 0.01))
end
local function onHeatSourceAdded(p1) -- Line: 133 -- upvalues: u181 (val)
    local v1
    local Attribute = p1:GetAttribute("Strength")
    local Attribute_2 = p1:GetAttribute("Radius")
    local Attribute_3 = p1:GetAttribute("Max")
    local Attribute_4 = p1:GetAttribute("Enabled")
    p1.Transparency = 1
    local SphereHandleAdornment = p1:FindFirstChild("SphereHandleAdornment")
    if SphereHandleAdornment then
        SphereHandleAdornment:Destroy()
    end
    local v2 = {
        object = p1,
        strength = Attribute or 5,
        max = Attribute_3 or 100,
        radius = Attribute_2 or 15,
        key = "heat_" .. p1.Name,
    }
    if Attribute_4 ~= nil then
        v1 = Attribute_4
    else
        v1 = true
    end
    v2.enabled = v1
    local u48 = u181:CreateNode(p1.Position, v2)
    local function toggleVisualEffects(a1) -- Line: 160 -- upvalues: p1 (val)
        local Parent = p1.Parent
        if not Parent then
            return
        end
        local Part = Parent:FindFirstChild("Part")
        if not Part then
            return
        end
        for i, j in Part:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = a1
            elseif j:IsA("Light") then
                j.Enabled = a1
            end
        end
    end
    if Attribute_4 ~= nil then
        v2 = Attribute_4
    else
        v2 = true
    end
    toggleVisualEffects(v2)
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Enabled")
    local u68 = AttributeChangedSignal:Connect(function() -- Line: 186 -- upvalues: p1 (val), u48 (val), toggleVisualEffects (val)
        local v1
        local Attribute = p1:GetAttribute("Enabled")
        if Attribute ~= nil then
            v1 = Attribute
        else
            v1 = true
        end
        u48.Object.enabled = v1
        toggleVisualEffects(v1)
    end)
    p1.AncestryChanged:Once(function() -- Line: 193 -- upvalues: u68 (val), u181 (upval), u48 (val)
        u68:Disconnect()
        u181:RemoveNode(u48)
    end)
end
local function onCalculateWorldInfluence() -- Line: 204 -- upvalues: applyTemperatureResistance (val)
    local Attribute = workspace:GetAttribute("TemperatureOverride")
    if Attribute then
        return Attribute
    end
    local v1 = workspace:GetAttribute("Temperature") or 70
    local v2 = 0
    if 50 > v1 then
        if 70 < v1 then
            v2 = math.clamp((v1 - 70) / 30, 0, 1) * 15 + 0
        elseif v1 < 50 then
            v2 = math.clamp((v1 - -20) / 70, 0, 1) * 15 + -15
        end
    elseif v1 <= 70 then
        v2 = 0
    elseif 70 < v1 then
        v2 = math.clamp((v1 - 70) / 30, 0, 1) * 15 + 0
    elseif v1 < 50 then
        v2 = math.clamp((v1 - -20) / 70, 0, 1) * 15 + -15
    end
    return applyTemperatureResistance(v2)
end
local function onHandleTemperateChange(p1) -- Line: 238 -- upvalues: u182 (ref), getBuildingWarmThreshold (val), getBuildingWarmTarget (val), getTemperatureChangeAmount (val), getSpeedMultiplier (val), u186 (ref), u185 (ref), getDecayRateSpeedMultiplier (val), u184 (ref), u187 (ref)
    local v1 = next(u182) ~= nil
    local v2 = getBuildingWarmThreshold()
    local v3 = getBuildingWarmTarget()
    local v4 = getTemperatureChangeAmount()
    local v5 = 90 / getSpeedMultiplier("BodyTemperatureWorldChangeSpeedMultiplier", 1)
    if v1 then
        v5 = 7.5 / getSpeedMultiplier("BodyTemperatureHeatSourceChangeSpeedMultiplier", 1)
    elseif p1 and u186 < v2 then
        v5 = 20 / getSpeedMultiplier("BodyTemperatureBuildingWarmSpeedMultiplier", 1)
    end
    if u185 < u186 then
        v5 = v5 / getDecayRateSpeedMultiplier("ColdTemperatureDecayRate")
    elseif u186 < u185 then
        v5 = v5 / getDecayRateSpeedMultiplier("HotTemperatureDecayRate")
    end
    if tick() - u184 < v5 then
        return
    end
    u184 = tick()
    if not v1 then
        if not p1 then
            local v6
            if u185 >= u186 then
                v6 = v4
            else
                v6 = -v4
                if not v6 then
                    v6 = v4
                end
            end
            u186 = u186 + v6
        elseif u186 < v2 then
            u186 = math.min(u186 + v4, v3)
        end
    elseif u186 < u187 then
        u186 = math.min(u186 + v4, u187)
    end
    u186 = math.max(u186, 83)
end
Vitality.Temperature.listen(function(p1, p2) -- Line: 423 -- upvalues: u186 (ref), u184 (ref)
    local maxTemperature
    if 0 >= p2.maxTemperature then
        maxTemperature = 113
    else
        maxTemperature = p2.maxTemperature
    end
    u186 = math.min(u186 + p2.amount, maxTemperature)
    u184 = tick()
end)
CharacterMovementRunner.useMovementObserver(function(p1) -- Line: 379 -- upvalues: u181 (val), u188 (ref), Signals (val), u182 (ref), u187 (ref), u184 (ref)
    local v1 = u181:SearchRadius(p1, 50)
    local v2 = {}
    local v3 = v1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if (p1 - j.Position).Magnitude < j.Object.radius and j.Object.enabled then
            v2[j.Object.key] = j.Object
        end
    end
    v4 = next(v2) ~= nil
    u188 = v4
    if not u188 and u188 then
        Signals.Monologue:Fire({"The warmth of the campfire is soothing..."})
    end
    v5 = {}
    local v6 = 0
    local v7 = v2
    local v8 = nil
    local v9 = nil
    for k, n in v7, v8, v9 do
        v5[n.key] = n
        v6 = math.max(v6, n.max)
    end
    u182 = v5
    u187 = v6
    if next(v2) ~= nil then
        u184 = tick()
    end
end)
RunService.RenderStepped:Connect(function() -- Line: 290 -- upvalues: u193 (ref), u192 (ref), Server (val), Players (val), u185 (ref), onCalculateWorldInfluence (val), u184 (ref), u195 (ref), u182 (ref), getBuildingWarmThreshold (val), u190 (ref), u186 (ref), u191 (ref), Character (val), u189 (ref), Signals (val), u187 (ref), onHandleTemperateChange (val), getNumberAttribute (val), u197 (ref), Vitality (val), useAnimatorObserver (val), Emotes (val)
    local v1, v2
    local v3 = tick()
    if u193 == nil then
        u192 = v3
        u193 = Server.Store.client()
    else
        v1 = v3 - u192
        if 3 > v1 then end
    end
    v1 = u193
    if not v1 or v1.event == 0 then
        return
    end
    if workspace:GetAttribute("IsTemperatureDisabled") then
        Players.LocalPlayer:SetAttribute("Temperature", 98)
        return
    end
    u185 = onCalculateWorldInfluence() + 98
    local v4 = u184
    if not v4 then
        v4 = tick()
    end
    u184 = v4
    v4 = u195
    if not v4 then
        v4 = tick()
    end
    u195 = v4
    v4 = next(u182) ~= nil
    local v5 = getBuildingWarmThreshold()
    local v6 = u190
    if u186 < v5 then
        v2 = v3 - u191
        if 2 <= v2 then
            u191 = v3
            u190 = Character.isUnderRoof()
            v6 = u190
            if not u189 and v6 then
                Signals.Monologue:Fire({"It's warmer in here..."})
            end
            u189 = v6
        end
    end
    if not v4 then
        if not v6 then
            if u185 < u186 then
                onHandleTemperateChange(v6)
            elseif u186 < u185 then
                onHandleTemperateChange(v6)
            end
        elseif u186 < v5 then
            onHandleTemperateChange(v6)
        end
    elseif u186 < u187 then
        onHandleTemperateChange(v6)
    end
    v2 = getNumberAttribute("ColdTemperatureBreathThreshold", 87)
    local v7 = getNumberAttribute("ColdTemperatureDamageThreshold", 84)
    local v8 = getNumberAttribute("ColdTemperatureDamageInterval", 15)
    if u186 <= v2 then
        local v9 = tick() - u197
        if 10 <= v9 then
            u197 = tick()
            Vitality.Breath.unreliablePost()
        end
    end
    if u186 <= v7 and v8 <= tick() - u195 then
        Vitality.Cold.post()
        u195 = tick()
        useAnimatorObserver.play(Emotes.Shiver, 0.2)
    end
    Players.LocalPlayer:SetAttribute("Temperature", u186)
end)
for i, j in CollectionService:GetTagged("Heat") do
    onHeatSourceAdded(j)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Heat")
InstanceAddedSignal:Connect(onHeatSourceAdded)
return {}