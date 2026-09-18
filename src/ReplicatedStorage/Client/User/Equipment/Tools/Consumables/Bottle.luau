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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Bottle
--                               Dumped in 0.00158 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Bottle = require(Tools:WaitForChild("Bottle"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local State = script.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Config = require(Common_4:WaitForChild("Config"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local v2 = {description = "A bottle which can be used to drink.", category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables}
local u156 = Config.define({
    MAX_DRINKS = 10,
    MIN_DRINKS_FOR_EFFECTS = 6,
    DRINK_COOLDOWN = 4,
    DECAY_RATE = 0.05,
    CLEANUP_DELAY = 5,
    BASE_FOV = 70,
    FOV_OSCILLATION_AMPLITUDE = 8,
    POSITION_SWAY_AMPLITUDE = 0.03,
    ROTATION_SWAY_AMPLITUDE = 0.12,
    SATURATION_AT_MAX_INTENSITY = -0.4,
    BRIGHTNESS_AT_MAX_INTENSITY = -0.1,
    CONTRAST_AT_MAX_INTENSITY = 0.2,
    DOF_MAX_INTENSITY_SCALE = 3,
    POST_EFFECT_RESPONSE_SPEED = 10,
    USE_ANIMATION_EASING = 0.1,
})
local u157 = 0
local u158 = 0
local u159 = false
local u160 = nil
local u161 = nil
local u162 = nil
local u163 = nil
local u164 = 0
local u165 = 0
local u166 = false
local u167 = nil
local u168 = nil
local function getIntensity() -- Line: 97 -- upvalues: u157 (ref), u156 (val)
    if u157 < u156.MIN_DRINKS_FOR_EFFECTS then
        return 0
    end
    local v1 = (u157 - u156.MIN_DRINKS_FOR_EFFECTS) / (u156.MAX_DRINKS - u156.MIN_DRINKS_FOR_EFFECTS)
    return (math.clamp(v1, 0, 1))
end
local function startEffects() -- Line: 112 -- upvalues: u159 (ref), trove (val), u160 (ref), Lighting (val), u162 (ref), u163 (ref)
    if u159 then
        return
    end
    u159 = true
    local v1 = trove.new()
    u160 = v1
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "__RequiemBottleEffectColor"
    ColorCorrectionEffect.Parent = Lighting
    u162 = ColorCorrectionEffect
    v1:Add(ColorCorrectionEffect)
    local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
    DepthOfFieldEffect.Name = "__RequiemBottleEffectDepth"
    DepthOfFieldEffect.Enabled = false
    DepthOfFieldEffect.FarIntensity = 0
    DepthOfFieldEffect.NearIntensity = 0
    DepthOfFieldEffect.FocusDistance = 0
    DepthOfFieldEffect.InFocusRadius = 40
    DepthOfFieldEffect.Parent = Lighting
    u163 = DepthOfFieldEffect
    v1:Add(DepthOfFieldEffect)
end
local function stopEffects() -- Line: 144 -- upvalues: u159 (ref), u160 (ref), u162 (ref), u163 (ref)
    if not u159 then
        return
    end
    if u160 then
        u160:Destroy()
        u160 = nil
    end
    u162 = nil
    u163 = nil
    u159 = false
end
local function decayDrinks(p1) -- Line: 163 -- upvalues: u157 (ref), u158 (ref), u156 (val)
    if u157 <= 0 then
        return
    end
    local v1 = tick() - u158
    if v1 < 0.5 then
        return
    end
    u157 = math.max(0, u157 - u156.DECAY_RATE * p1)
end
local function addDrink() -- Line: 181 -- upvalues: u158 (ref), u156 (val), u157 (ref)
    local v1 = tick()
    local v2 = v1 - u158
    if v2 < u156.DRINK_COOLDOWN then
        return false
    end
    u157 = math.min(u156.MAX_DRINKS, u157 + 1)
    u158 = v1
    return true
end
local function stopRenderLoop() -- Line: 201 -- upvalues: u161 (ref), stopEffects (val), u166 (ref), ClientStatusHandler (val), u164 (ref), u165 (ref)
    if u161 then
        u161:Disconnect()
        u161 = nil
    end
    stopEffects()
    if u166 then
        ClientStatusHandler.removePlayerStatus(ClientStatusHandler.Statuses.POISONED)
        u166 = false
    end
    u164 = 0
    u165 = 0
end
local function startRenderLoop() -- Line: 222 -- upvalues: u161 (ref), RunService (val), decayDrinks (val), u164 (ref), getIntensity (val), u157 (ref), u165 (ref), u156 (val), stopRenderLoop (val), u159 (ref), startEffects (val), stopEffects (val), u166 (ref), ClientStatusHandler (val), u162 (ref), u163 (ref)
    if u161 then
        return
    end
    u161 = RunService.RenderStepped:Connect(function(p1) -- Line: 227 -- upvalues: decayDrinks (upval), u164 (upval), getIntensity (upval), u157 (upval), u165 (upval), u156 (upval), stopRenderLoop (upval), u159 (upval), startEffects (upval), stopEffects (upval), u166 (upval), ClientStatusHandler (upval), u162 (upval), u163 (upval)
        local v1
        decayDrinks(p1)
        u164 = u164 + p1
        local v2 = getIntensity()
        if u157 > 0 then
            local v3
            u165 = 0
            v1 = p1
            if 0 < v2 and not u159 then
                startEffects()
            end
            if v2 == 0 and u159 then
                stopEffects()
            end
            if u156.MIN_DRINKS_FOR_EFFECTS > u157 then
                if u157 < u156.MIN_DRINKS_FOR_EFFECTS and u166 then
                    ClientStatusHandler.removePlayerStatus(ClientStatusHandler.Statuses.POISONED)
                    u166 = false
                end
            elseif not u166 then
                ClientStatusHandler.addPlayerStatus(ClientStatusHandler.Statuses.POISONED)
                u166 = true
            end
            if 0 >= v2 then
                local CurrentCamera_2 = workspace.CurrentCamera
                if CurrentCamera_2 then
                    CurrentCamera_2.FieldOfView = u156.BASE_FOV
                end
                if u162 then
                    v3 = v1 * u156.POST_EFFECT_RESPONSE_SPEED
                    u162.Saturation = math.lerp(u162.Saturation, 0, v3)
                    u162.Brightness = math.lerp(u162.Brightness, 0, v3)
                    u162.Contrast = math.lerp(u162.Contrast, 0, v3)
                end
                if u163 then
                    u163.Enabled = false
                    u163.FarIntensity = 0
                end
                return
            end
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            local v4 = math.sin(u164 * 3)
            v3 = v4 * u156.POSITION_SWAY_AMPLITUDE * v2
            local v5 = math.cos(u164 * 2.5)
            local v6 = v5 * (u156.POSITION_SWAY_AMPLITUDE * 0.66) * v2
            local v7 = math.sin(u164 * 2.2)
            v4 = v7 * (u156.POSITION_SWAY_AMPLITUDE * 0.5) * v2
            local v8 = math.sin(u164 * 1.8)
            v5 = v8 * (u156.ROTATION_SWAY_AMPLITUDE * 0.066) * v2
            local v9 = math.cos(u164 * 2.1)
            v7 = v9 * (u156.ROTATION_SWAY_AMPLITUDE * 0.066) * v2
            local v10 = math.sin(u164 * 1.5)
            v10 = CurrentCamera.CFrame * CFrame.new(v3, v6, v4)
            CurrentCamera.CFrame = v10 * CFrame.Angles(v5, v7, v10 * u156.ROTATION_SWAY_AMPLITUDE * v2)
            local v11 = math.sin(u164 * 1.8)
            CurrentCamera.FieldOfView = u156.BASE_FOV + v11 * u156.FOV_OSCILLATION_AMPLITUDE * v2
            if u162 then
                v9 = v1 * u156.POST_EFFECT_RESPONSE_SPEED
                v11 = math.lerp(0, u156.SATURATION_AT_MAX_INTENSITY, v2)
                u162.Saturation = math.lerp(u162.Saturation, v11, v9)
                v11 = math.lerp(0, u156.BRIGHTNESS_AT_MAX_INTENSITY, v2)
                u162.Brightness = math.lerp(u162.Brightness, v11, v9)
                v11 = math.lerp(0, u156.CONTRAST_AT_MAX_INTENSITY, v2)
                u162.Contrast = math.lerp(u162.Contrast, v11, v9)
            end
            if not u163 then
                return
            end
            v9 = math.sin(u164 * 1.5 + math.pi * 1.5) + 1
            u163.FarIntensity = v9 * v2 / u156.DOF_MAX_INTENSITY_SCALE
            u163.Enabled = true
            return
        else
            u165 = u165 + p1
            if u156.CLEANUP_DELAY <= u165 then
                stopRenderLoop()
                return
            end
            v1 = p1
        end
    end)
end
return {
    equipped = function(p1, p2) -- Line: 350 -- upvalues: Character (val), u167 (ref), useAnimatorObserver (val), Bottle (val), startRenderLoop (val), u168 (ref), UserInputService (val), addDrink (val), u156 (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 351 -- upvalues: u167 (upval), useAnimatorObserver (upval), Bottle (upval)
            u167 = useAnimatorObserver.bind(p1.Humanoid.Animator, Bottle, 4)
        end)
        startRenderLoop()
        u168 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 358 -- upvalues: addDrink (upval), useAnimatorObserver (upval), Bottle (upval), u156 (upval)
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            if addDrink() then
                useAnimatorObserver.play(Bottle.Use, u156.USE_ANIMATION_EASING)
            end
        end)
    end,
    unequipped = function() -- Line: 375 -- upvalues: u167 (ref), u168 (ref)
        if u167 then
            u167()
            u167 = nil
        end
        if u168 then
            u168:Disconnect()
            u168 = nil
        end
    end,
    data = v2,
}