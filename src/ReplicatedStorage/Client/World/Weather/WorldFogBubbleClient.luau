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
--           File: ReplicatedStorage.Client.World.Weather.WorldFogBubbleClient
--                              Dumped in 0.000997 seconds
--                          Bytecode version 9  |  17 functions

local AttributeChangedSignal
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local World = Common_2:WaitForChild("World")
local LightingFogBubbleConfig = require(World:WaitForChild("LightingFogBubbleConfig"))
local Fog = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Fog")
local Mesh = Fog:WaitForChild("Mesh")
local DEFAULT_SIZE = LightingFogBubbleConfig.DEFAULT_SIZE
local Scale = Mesh.Scale
local u88 = false
local u89 = nil
local u90 = nil
local function getAtmosphere() -- Line: 46 -- upvalues: Lighting (val)
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    return WorldAtmosphere
end
local function isEditorBubbleEnabled() -- Line: 50 -- upvalues: getAtmosphere (val), LightingFogBubbleConfig (val)
    local v1 = getAtmosphere()
    if not v1 then
        return false
    end
    local Attribute = v1:GetAttribute(LightingFogBubbleConfig.ATTRIBUTE_ENABLED)
    if typeof(Attribute) == "boolean" then
        return Attribute
    end
    return LightingFogBubbleConfig.DEFAULT_ENABLED
end
local function getEditorBubbleSize() -- Line: 66 -- upvalues: getAtmosphere (val), DEFAULT_SIZE (val), LightingFogBubbleConfig (val)
    local v1 = getAtmosphere()
    if not v1 then
        return DEFAULT_SIZE
    end
    local Attribute = v1:GetAttribute(LightingFogBubbleConfig.ATTRIBUTE_SIZE)
    if typeof(Attribute) == "number" then
        return (math.clamp(Attribute, LightingFogBubbleConfig.SIZE_MIN, LightingFogBubbleConfig.SIZE_MAX))
    end
    return DEFAULT_SIZE
end
local function shouldShowBubble() -- Line: 82 -- upvalues: isEditorBubbleEnabled (val), u88 (ref)
    if workspace:GetAttribute("Atmosphere") == true then
        return false
    end
    local v1 = isEditorBubbleEnabled()
    if not v1 then
        v1 = u88
    end
    return v1
end
local function applyBubbleSize() -- Line: 90 -- upvalues: isEditorBubbleEnabled (val), Mesh (val), LightingFogBubbleConfig (val), getEditorBubbleSize (val), Scale (val)
    if isEditorBubbleEnabled() then
        Mesh.Scale = LightingFogBubbleConfig.scaleFromBubbleSize(getEditorBubbleSize())
        return
    end
    Mesh.Scale = Scale
end
local function stopFollow() -- Line: 98 -- upvalues: u89 (ref)
    if u89 then
        u89:Disconnect()
        u89 = nil
    end
end
local function hideBubble() -- Line: 106 -- upvalues: stopFollow (val), u90 (ref), Fog (val), TweenService (val), shouldShowBubble (val)
    stopFollow()
    if u90 then
        task.cancel(u90)
        u90 = nil
    end
    if Fog.Parent == nil then
        return
    end
    local v1 = TweenInfo.new(5, Enum.EasingStyle.Linear)
    TweenService:Create(Fog, v1, {Transparency = 1}):Play()
    u90 = task.delay(5, function() -- Line: 121 -- upvalues: u90 (upval), shouldShowBubble (upval), Fog (upval)
        u90 = nil
        if not (shouldShowBubble()) then
            Fog.Parent = nil
        end
    end)
end
local function showBubble() -- Line: 130 -- upvalues: u90 (ref), applyBubbleSize (val), Fog (val), TweenService (val), u89 (ref), RunService (val), shouldShowBubble (val), Character (val)
    if u90 then
        task.cancel(u90)
        u90 = nil
    end
    applyBubbleSize()
    Fog.Parent = workspace
    Fog.Transparency = 1
    local v1 = TweenInfo.new(10, Enum.EasingStyle.Linear)
    TweenService:Create(Fog, v1, {Transparency = 0}):Play()
    if u89 then
        return
    end
    u89 = RunService.RenderStepped:Connect(function() -- Line: 149 -- upvalues: shouldShowBubble (upval), Character (upval), Fog (upval), applyBubbleSize (upval)
        if not (shouldShowBubble()) then
            return
        end
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        if workspace:GetAttribute("Atmosphere") == true then
            Fog.Parent = nil
            return
        end
        Fog.Parent = workspace
        applyBubbleSize()
        Fog.CFrame = HumanoidRootPart.CFrame
    end)
end
local function syncBubble() -- Line: 178 -- upvalues: shouldShowBubble (val), showBubble (val), hideBubble (val)
    if shouldShowBubble() then
        showBubble()
        return
    end
    hideBubble()
end
local function bindAtmosphere(p1) -- Line: 186 -- upvalues: LightingFogBubbleConfig (val), syncBubble (val), shouldShowBubble (val), applyBubbleSize (val)
    local AttributeChangedSignal = p1:GetAttributeChangedSignal(LightingFogBubbleConfig.ATTRIBUTE_ENABLED)
    AttributeChangedSignal:Connect(syncBubble)
    local AttributeChangedSignal_2 = p1:GetAttributeChangedSignal(LightingFogBubbleConfig.ATTRIBUTE_SIZE)
    AttributeChangedSignal_2:Connect(function() -- Line: 189 -- upvalues: shouldShowBubble (upval), applyBubbleSize (upval)
        if shouldShowBubble() then
            applyBubbleSize()
        end
    end)
    syncBubble()
end
AttributeChangedSignal = workspace:GetAttributeChangedSignal("Atmosphere")
AttributeChangedSignal:Connect(syncBubble)
;(function() -- Line: 198 -- upvalues: getAtmosphere (val), bindAtmosphere (val), Lighting (val)
    local v1 = getAtmosphere()
    if v1 then
        bindAtmosphere(v1)
        return
    end
    Lighting.ChildAdded:Connect(function(p1) -- Line: 207 -- upvalues: bindAtmosphere (upval)
        if p1:IsA("Atmosphere") then
            bindAtmosphere(p1)
        end
    end)
end)()
return {
    setWeatherActive = function(p1) -- Line: 222 -- upvalues: u88 (ref), syncBubble (val)
        u88 = p1
        syncBubble()
    end,
    sync = syncBubble,
}