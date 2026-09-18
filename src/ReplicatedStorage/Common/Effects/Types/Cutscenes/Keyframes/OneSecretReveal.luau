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
--   File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.OneSecretReveal
--                               Dumped in 0.00622 seconds
--                          Bytecode version 9  |  54 functions

local WorldLightingClient
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Particles_2 = Assets:WaitForChild("Particles")
local Titans = Particles_2:WaitForChild("Titans")
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Flashback = require(Universal:WaitForChild("Flashback"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local Explosions = v1.Parent.Parent.Parent:WaitForChild("Explosions")
local Impact = require(Explosions:WaitForChild("Impact"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local World = Common_3:WaitForChild("World")
local LightingFogBubbleConfig = require(World:WaitForChild("LightingFogBubbleConfig"))
local Explosions_2 = v1.Parent.Parent.Parent:WaitForChild("Explosions")
local Nuke = require(Explosions_2:WaitForChild("Nuke"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local Screen = require(v1.Parent.Parent.Parent.Parent:WaitForChild("Screen"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local Explosions_3 = v1.Parent.Parent.Parent:WaitForChild("Explosions")
local Tease = require(Explosions_3:WaitForChild("Tease"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local black = require(Utilities_3:WaitForChild("State"))("black")
if not (RunService:IsClient()) then
    WorldLightingClient = nil
else
    local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
    local Client = ReplicatedStorage_8:WaitForChild("Client")
    local World_2 = Client:WaitForChild("World")
    local Weather = World_2:WaitForChild("Weather")
    WorldLightingClient = require(Weather:WaitForChild("WorldLightingClient"))
end
local u252 = {
    "An unerving sense of dread and despair washes down your spine.",
    "I need to get out of here!",
    "I NEED TO GET AWAY FROM THAT MAN!",
    "WHAT WAS THAT? THAT SENSE OF POWER...",
    "IT WAS UNBEARABLE...",
    "I NEED TO GET AWAY, NOW!",
}
local u259 = {
    {kind = "white", duration = 0.038},
    {kind = "black", duration = 0.024},
    {kind = "white", duration = 0.03},
    {kind = "black", duration = 0.026},
    {kind = "white", duration = 0.034},
    {kind = "black", duration = 0.026},
    {kind = "white", duration = 0.06},
    {kind = "black", duration = 0.026},
    {kind = "white", duration = 0.036},
}
local u269 = {
    {kind = "white", duration = 0.045},
    {kind = "black", duration = 0.032},
    {kind = "white", duration = 0.038},
    {kind = "black", duration = 0.028},
    {kind = "white", duration = 0.042},
    {kind = "black", duration = 0.03},
    {kind = "white", duration = 0.07},
    {kind = "black", duration = 0.028},
    {kind = "white", duration = 0.048},
}
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local Sphere = Objects:WaitForChild("Sphere")
local u292 = {Brightness = -0.15, Contrast = 0.15, Saturation = 0.15, TintColor = Color3.fromRGB(247, 212, 132)}
local u298 = {Brightness = -0.25, Contrast = 0.15, Saturation = -0.3, TintColor = Color3.fromRGB(255, 206, 90)}
local u304 = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}
local u310 = {"NPC1Animation", "NPC2Animation"}
local u313 = {screenEffectsActive = false}
local u314 = nil
local u315 = {}
local u316 = {}
local u317 = {active = false, players = {}, connections = {}}
local u320 = {}
local u321 = {}
local function getTerrainClouds() -- Line: 210 -- upvalues: Workspace (val)
    local Terrain = Workspace:FindFirstChild("Terrain")
    if not Terrain then
        Terrain = Workspace:WaitForChild("Terrain")
    end
    local Clouds = Terrain:FindFirstChildWhichIsA("Clouds")
    if not Clouds then
        Clouds = Instance.new("Clouds")
        Clouds.Parent = Terrain
    end
    return Clouds
end
local function applyNukeVisibleEnvironment() -- Line: 225 -- upvalues: u321 (val), WorldLightingClient (val), getTerrainClouds (val)
    if u321.worldLightingRemoval then
        if u321.worldLightingRemoval == nil then
            getTerrainClouds().Density = 0
        end
        return
    end
    if WorldLightingClient then
        u321.worldLightingRemoval = WorldLightingClient.updateWorldLightingProperties({
            Clouds = {Density = 0},
        }, 2500)
        return
    end
    if u321.worldLightingRemoval == nil then
        getTerrainClouds().Density = 0
    end
end
local function clearNukeVisibleEnvironmentClouds(p1) -- Line: 243 -- upvalues: u321 (val)
    if u321.worldLightingRemoval then
        u321.worldLightingRemoval(p1)
        u321.worldLightingRemoval = nil
    end
end
local function clearNukeVisibleEnvironment(p1) -- Line: 255 -- upvalues: clearNukeVisibleEnvironmentClouds (val)
    clearNukeVisibleEnvironmentClouds(p1)
end
local function clearTeaseColorCorrection() -- Line: 263 -- upvalues: u315 (val)
    if u315.colorCorrection then
        u315.colorCorrection:Destroy()
        u315.colorCorrection = nil
    end
end
local function startTeaseColorCorrection() -- Line: 274 -- upvalues: clearTeaseColorCorrection (val), Lighting (val), u315 (val), TweenService (val), u292 (val)
    clearTeaseColorCorrection()
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "OneSecretRevealTeaseColorCorrection"
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.Contrast = 0
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrectionEffect.Parent = Lighting
    u315.colorCorrection = ColorCorrectionEffect
    local v1 = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(ColorCorrectionEffect, v1, u292):Play()
end
local function getNukeLightingEaseDuration(p1) -- Line: 299
    if p1 == nil or p1 <= 0 then
        return nil
    end
    return 1.25 / p1
end
local function cancelNukeLightingTween() -- Line: 315 -- upvalues: u320 (val)
    if u320.easeTween then
        u320.easeTween:Cancel()
        u320.easeTween = nil
    end
end
local function cancelNukeRevealEaseOut() -- Line: 326 -- upvalues: cancelNukeLightingTween (val), Nuke (val)
    cancelNukeLightingTween()
    Nuke.cancelMushroomTweenOut()
end
local function clearNukeLighting(p1) -- Line: 336 -- upvalues: u320 (val), u321 (val), cancelNukeRevealEaseOut (val), clearNukeVisibleEnvironment (val), getNukeLightingEaseDuration (val), clearNukeVisibleEnvironmentClouds (val), TweenService (val), u304 (val)
    local u35, v1, v2
    local colorCorrection = u320.colorCorrection
    if colorCorrection then
        cancelNukeRevealEaseOut()
        if not colorCorrection then
            clearNukeVisibleEnvironment()
            return
        end
        v1 = getNukeLightingEaseDuration(p1)
        if not v1 then
            clearNukeVisibleEnvironment()
            colorCorrection:Destroy()
            u320.colorCorrection = nil
            return
        end
        v2 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        clearNukeVisibleEnvironmentClouds(v2)
        u35 = TweenService:Create(colorCorrection, v2, u304)
        u320.easeTween = u35
        u35:Play()
        u35.Completed:Once(function() -- Line: 365 -- upvalues: u320 (upval), u35 (val), colorCorrection (val)
            if u320.easeTween == u35 then
                u320.easeTween = nil
            end
            if u320.colorCorrection == colorCorrection then
                colorCorrection:Destroy()
                u320.colorCorrection = nil
            end
        end)
        return
    end
    if not u321.worldLightingRemoval then
        return
    end
    cancelNukeRevealEaseOut()
    if not colorCorrection then
        clearNukeVisibleEnvironment()
        return
    end
    v1 = getNukeLightingEaseDuration(p1)
    if not v1 then
        clearNukeVisibleEnvironment()
        colorCorrection:Destroy()
        u320.colorCorrection = nil
        return
    end
    v2 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    clearNukeVisibleEnvironmentClouds(v2)
    u35 = TweenService:Create(colorCorrection, v2, u304)
    u320.easeTween = u35
    u35:Play()
    u35.Completed:Once(function() -- Line: 365 -- upvalues: u320 (upval), u35 (val), colorCorrection (val)
        if u320.easeTween == u35 then
            u320.easeTween = nil
        end
        if u320.colorCorrection == colorCorrection then
            colorCorrection:Destroy()
            u320.colorCorrection = nil
        end
    end)
end
local function onTweenNukeLighting(p1) -- Line: 382 -- upvalues: clearNukeLighting (val), applyNukeVisibleEnvironment (val), u304 (val), Lighting (val), u320 (val), getNukeLightingEaseDuration (val), u298 (val), TweenService (val)
    clearNukeLighting()
    applyNukeVisibleEnvironment()
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "OneSecretRevealNukeLighting"
    ColorCorrectionEffect.Brightness = u304.Brightness
    ColorCorrectionEffect.Contrast = u304.Contrast
    ColorCorrectionEffect.Saturation = u304.Saturation
    ColorCorrectionEffect.TintColor = u304.TintColor
    ColorCorrectionEffect.Parent = Lighting
    u320.colorCorrection = ColorCorrectionEffect
    local v1 = getNukeLightingEaseDuration(p1)
    if not v1 then
        ColorCorrectionEffect.Brightness = u298.Brightness
        ColorCorrectionEffect.Contrast = u298.Contrast
        ColorCorrectionEffect.Saturation = u298.Saturation
        ColorCorrectionEffect.TintColor = u298.TintColor
        return
    end
    local v2 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local u40 = TweenService:Create(ColorCorrectionEffect, v2, u298)
    u320.easeTween = u40
    u40:Play()
    u40.Completed:Once(function() -- Line: 415 -- upvalues: u320 (upval), u40 (val)
        if u320.easeTween == u40 then
            u320.easeTween = nil
        end
    end)
end
local function getInsideNukeEaseDuration(p1) -- Line: 427
    if p1 == nil or p1 <= 0 then
        return nil
    end
    return 2 / p1
end
local function cancelInsideNukeEase() -- Line: 443 -- upvalues: u313 (val)
    if u313.easeTween then
        u313.easeTween:Cancel()
        u313.easeTween = nil
    end
end
local function stopInsideNukeFogFollow() -- Line: 454 -- upvalues: u313 (val)
    if u313.fogConnection then
        u313.fogConnection:Disconnect()
        u313.fogConnection = nil
    end
end
local function clearInsideNukeScreenEffects(p1) -- Line: 466 -- upvalues: u313 (val), Screen (val)
    if not u313.screenEffectsActive then
        return
    end
    Screen.__removeClientScreenEffect("Normal", p1)
    Screen.__removeClientScreenEffect("Fire", p1)
    u313.screenEffectsActive = false
end
local function applyInsideNukeScreenEffects() -- Line: 481 -- upvalues: u313 (val), Screen (val)
    if u313.screenEffectsActive then
        return
    end
    Screen.__createClientScreenEffect({name = "Normal", scale = 1.7, color = Color3.fromRGB(0, 0, 0)})
    Screen.__createClientScreenEffect({name = "Fire"})
    u313.screenEffectsActive = true
end
local function restoreInsideNukeRigs() -- Line: 500 -- upvalues: u313 (val)
    local rigSnapshots = u313.rigSnapshots
    if not rigSnapshots then
        return
    end
    local v1 = rigSnapshots
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if i.Parent then
            i:PivotTo(j)
        end
    end
    u313.rigSnapshots = nil
end
local function finishInsideNukeCleanup() -- Line: 519 -- upvalues: stopInsideNukeFogFollow (val), cancelInsideNukeEase (val), u313 (val)
    stopInsideNukeFogFollow()
    cancelInsideNukeEase()
    if u313.colorCorrection then
        u313.colorCorrection:Destroy()
        u313.colorCorrection = nil
    end
    if u313.fog then
        u313.fog:Destroy()
        u313.fog = nil
    end
    u313.atmosphereSnapshot = nil
end
local function clearInsideNuke(p1) -- Line: 541 -- upvalues: u313 (val), cancelInsideNukeEase (val), restoreInsideNukeRigs (val), getInsideNukeEaseDuration (val), stopInsideNukeFogFollow (val), clearInsideNukeScreenEffects (val), Lighting (val), finishInsideNukeCleanup (val), TweenService (val)
    local colorCorrection = u313.colorCorrection
    if not colorCorrection then
        colorCorrection = u313.fog
        if not colorCorrection then
            colorCorrection = u313.atmosphereSnapshot
            if not colorCorrection then
                colorCorrection = u313.rigSnapshots
                if not colorCorrection then
                    colorCorrection = u313.screenEffectsActive
                end
            end
        end
    end
    if not colorCorrection then
        return
    end
    cancelInsideNukeEase()
    restoreInsideNukeRigs()
    local v1 = getInsideNukeEaseDuration(p1)
    if not v1 then
        stopInsideNukeFogFollow()
        clearInsideNukeScreenEffects(true)
        local atmosphereSnapshot = u313.atmosphereSnapshot
        if atmosphereSnapshot then
            local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
            if not WorldAtmosphere then
                WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
            end
            if WorldAtmosphere and WorldAtmosphere:IsA("Atmosphere") then
                WorldAtmosphere.Offset = atmosphereSnapshot.Offset
                WorldAtmosphere.Density = atmosphereSnapshot.Density
            end
        end
        finishInsideNukeCleanup()
        return
    end
    clearInsideNukeScreenEffects(false)
    local atmosphereSnapshot_2 = u313.atmosphereSnapshot
    local WorldAtmosphere_2 = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere_2 then
        WorldAtmosphere_2 = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    if WorldAtmosphere_2 and WorldAtmosphere_2:IsA("Atmosphere") and atmosphereSnapshot_2 then
        local v2 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(WorldAtmosphere_2, v2, {Offset = atmosphereSnapshot_2.Offset, Density = atmosphereSnapshot_2.Density}):Play()
    end
    local fog = u313.fog
    if fog and fog.Parent then
        local v3 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(fog, v3, {Transparency = 1}):Play()
    end
    local colorCorrection_2 = u313.colorCorrection
    if colorCorrection_2 then
        local v4 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local v5 = TweenService:Create(colorCorrection_2, v4, {Saturation = 0})
        u313.easeTween = v5
        v5:Play()
    end
    task.delay(v1, finishInsideNukeCleanup)
end
local function spawnInsideNukeFogBubble(p1) -- Line: 612 -- upvalues: u313 (val), Sphere (val), LightingFogBubbleConfig (val), Workspace (val), Lighting (val), TweenService (val), RunService (val)
    local v1, v2
    if u313.fog then
        return
    end
    local v3 = Sphere:Clone()
    v3.Name = "OneSecretRevealFog"
    v3.Anchored = true
    v3.CanCollide = false
    v3.CanQuery = false
    v3.CanTouch = false
    if not p1 then
        v1 = 0
    else
        v1 = 1
    end
    v3.Transparency = v1
    local Mesh = v3:FindFirstChild("Mesh")
    if Mesh then
        Mesh.Scale = LightingFogBubbleConfig.scaleFromBubbleSize(1200)
    end
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera then
        v3.CFrame = CurrentCamera.CFrame
    end
    v3.Parent = Workspace
    u313.fog = v3
    local WorldAtmosphere = Lighting:FindFirstChild("WorldAtmosphere")
    if not WorldAtmosphere then
        WorldAtmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
    end
    if WorldAtmosphere and WorldAtmosphere:IsA("Atmosphere") and not u313.atmosphereSnapshot then
        u313.atmosphereSnapshot = {Offset = WorldAtmosphere.Offset, Density = WorldAtmosphere.Density}
        if not p1 then
            WorldAtmosphere.Offset = 1
            WorldAtmosphere.Density = 0.5
        else
            v2 = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(WorldAtmosphere, v2, {Offset = 1, Density = 0.5}):Play()
        end
    end
    if p1 then
        v2 = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(v3, v2, {Transparency = 0}):Play()
    end
    u313.fogConnection = RunService.RenderStepped:Connect(function() -- Line: 664 -- upvalues: Workspace (upval), u313 (upval)
        local CurrentCamera = Workspace.CurrentCamera
        local fog = u313.fog
        if not CurrentCamera or not fog or not fog.Parent then
            return
        end
        fog.CFrame = CurrentCamera.CFrame
    end)
end
local function easeInInsideNukeColorCorrection(p1) -- Line: 681 -- upvalues: u313 (val), Lighting (val), TweenService (val)
    local v1
    if u313.colorCorrection then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "OneSecretRevealGrayscale"
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.Contrast = 0
    if not p1 then
        v1 = -0.5
    else
        v1 = 0
    end
    ColorCorrectionEffect.Saturation = v1
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrectionEffect.Parent = Lighting
    u313.colorCorrection = ColorCorrectionEffect
    if p1 then
        local v2 = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(ColorCorrectionEffect, v2, {Saturation = -0.5}):Play()
    end
end
local function isHideableInstance(p1) -- Line: 708
    local v1 = p1:IsA("BasePart")
    if not v1 then
        v1 = p1:IsA("Decal")
    end
    return v1
end
local function hideHideableInstance(p1, p2) -- Line: 718
    if p2[p1] == nil then
        p2[p1] = p1.Transparency
    end
    p1.Transparency = 1
end
local function hideCharacterForCutscene(p1) -- Line: 731 -- upvalues: isHideableInstance (val), hideHideableInstance (val)
    local u1 = {snapshots = {}, connections = {}}
    for i, j in p1:GetDescendants() do
        if isHideableInstance(j) then
            hideHideableInstance(j, u1.snapshots)
        end
    end
    table.insert(u1.connections, p1.DescendantAdded:Connect(function(p1) -- Line: 745 -- upvalues: isHideableInstance (upval), hideHideableInstance (upval), u1 (val)
        if isHideableInstance(p1) then
            hideHideableInstance(p1, u1.snapshots)
        end
    end))
    return u1
end
local function restoreCharacterForCutscene(p1) -- Line: 760
    local connections = p1.connections
    local v1 = nil
    local v2 = nil
    for i, j in connections, v1, v2 do
        j:Disconnect()
    end
    local snapshots = p1.snapshots
    v1 = nil
    v2 = nil
    for k, n in snapshots, v1, v2 do
        if k.Parent then
            k.Transparency = n
        end
    end
end
local function hidePlayerForCutscene(p1) -- Line: 777 -- upvalues: u317 (val), hideCharacterForCutscene (val), Alive (val)
    if u317.players[p1] then
        return
    end
    local u4 = {characters = {}}
    local function onCharacter(p1) -- Line: 787 -- upvalues: u4 (val), hideCharacterForCutscene (upval)
        if u4.characters[p1] then
            return
        end
        u4.characters[p1] = hideCharacterForCutscene(p1)
    end
    local Character = Alive.getAliveCharacter(p1)
    if not Character then
        Character = p1.Character
    end
    if Character then
        onCharacter(Character)
    end
    u4.characterAddedConnection = p1.CharacterAdded:Connect(onCharacter)
    u317.players[p1] = u4
end
local function hideAllPlayersForCutscene() -- Line: 808 -- upvalues: RunService (val), u317 (val), Alive (val), hidePlayerForCutscene (val), Players (val)
    if not (RunService:IsClient()) or u317.active then
        return
    end
    u317.active = true
    for i, j in Alive.getPlayers() do
        hidePlayerForCutscene(j)
    end
    table.insert(u317.connections, Players.PlayerAdded:Connect(hidePlayerForCutscene))
    table.insert(u317.connections, Players.PlayerRemoving:Connect(function(p1) -- Line: 823 -- upvalues: u317 (upval)
        local connections, v1, v2
        local v3 = u317.players[p1]
        if not v3 then
            return
        end
        if v3.characterAddedConnection then
            v3.characterAddedConnection:Disconnect()
        end
        local characters = v3.characters
        local v4 = nil
        local v5 = nil
        for i, j in characters, v4, v5 do
            connections = j.connections
            v1 = nil
            v2 = nil
            for k, n in connections, v1, v2 do
                n:Disconnect()
            end
        end
        u317.players[p1] = nil
    end))
end
local function restoreAllPlayersForCutscene() -- Line: 848 -- upvalues: RunService (val), u317 (val), restoreCharacterForCutscene (val)
    local characters, v1, v2
    if not (RunService:IsClient()) or not u317.active then
        return
    end
    u317.active = false
    local connections = u317.connections
    local v3 = nil
    local v4 = nil
    for i, j in connections, v3, v4 do
        j:Disconnect()
    end
    table.clear(u317.connections)
    local players = u317.players
    v3 = nil
    v4 = nil
    for k, n in players, v3, v4 do
        if n.characterAddedConnection then
            n.characterAddedConnection:Disconnect()
        end
        characters = n.characters
        v1 = nil
        v2 = nil
        for m, i5 in characters, v1, v2 do
            restoreCharacterForCutscene(i5)
        end
    end
    table.clear(u317.players)
end
local function setNPC1Visible(p1, p2) -- Line: 880 -- upvalues: u316 (val)
    local transparencySnapshots
    local NPC1Animation = p2:FindFirstChild("NPC1Animation")
    if not NPC1Animation or not (NPC1Animation:IsA("Model")) then
        return
    end
    if not p1 then
        if not u316.transparencySnapshots then
            local v1 = {}
            for i, j in NPC1Animation:GetDescendants() do
                if j:IsA("BasePart") then
                    v1[j] = j.Transparency
                end
            end
            u316.transparencySnapshots = v1
        end
        for k, n in NPC1Animation:GetDescendants() do
            if n:IsA("BasePart") then
                n.Transparency = 1
            end
        end
        return
    end
    transparencySnapshots = u316.transparencySnapshots
    if not transparencySnapshots then
        for m, i5 in NPC1Animation:GetDescendants() do
            if i5:IsA("BasePart") then
                i5.Transparency = 0
            end
        end
        return
    end
    local v2 = transparencySnapshots
    local v3 = nil
    local v4 = nil
    for i6, i7 in v2, v3, v4 do
        if i6.Parent then
            i6.Transparency = i7
        end
    end
    u316.transparencySnapshots = nil
end
local function moveInsideNukeRigs(p1) -- Line: 932 -- upvalues: u313 (val), u310 (val)
    local Pivot, v1
    if u313.rigSnapshots then
        return
    end
    local v2 = {}
    local v3 = u310
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p1:FindFirstChild(j)
        if v1 and v1:IsA("Model") then
            Pivot = v1:GetPivot()
            v2[v1] = Pivot
            v1:PivotTo(Pivot + Vector3.new(0, 300, 0))
        end
    end
    if next(v2) == nil then
        return
    end
    u313.rigSnapshots = v2
end
local function onSetInsideNuke(p1, p2) -- Line: 963 -- upvalues: u313 (val), getInsideNukeEaseDuration (val), moveInsideNukeRigs (val), easeInInsideNukeColorCorrection (val), spawnInsideNukeFogBubble (val), applyInsideNukeScreenEffects (val)
    if u313.colorCorrection or u313.fog then
        return
    end
    local v1 = getInsideNukeEaseDuration(p2)
    moveInsideNukeRigs(p1)
    easeInInsideNukeColorCorrection(v1)
    spawnInsideNukeFogBubble(v1)
    applyInsideNukeScreenEffects()
end
local function tweenOutNukeReveal(p1) -- Line: 981 -- upvalues: Nuke (val), u320 (val), u321 (val), Impact (val), u269 (val), cancelNukeRevealEaseOut (val), clearNukeLighting (val), clearNukeVisibleEnvironmentClouds (val), TweenService (val), u304 (val)
    local colorCorrection_2 = Nuke.getMushroomInstance()
    if not colorCorrection_2 then
        colorCorrection_2 = u320.colorCorrection
        if not colorCorrection_2 then
            colorCorrection_2 = u321.worldLightingRemoval
        end
    end
    if not colorCorrection_2 then
        return
    end
    Impact.playSequence(u269)
    cancelNukeRevealEaseOut()
    if not p1 or p1 <= 0 then
        clearNukeLighting()
        Nuke.clearMushroomCloud()
        return
    end
    local v1 = TweenInfo.new(p1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    clearNukeVisibleEnvironmentClouds(v1)
    local colorCorrection = u320.colorCorrection
    if colorCorrection then
        local u33 = TweenService:Create(colorCorrection, v1, u304)
        u320.easeTween = u33
        u33:Play()
        u33.Completed:Once(function() -- Line: 1010 -- upvalues: u320 (upval), u33 (val), colorCorrection (val)
            if u320.easeTween == u33 then
                u320.easeTween = nil
            end
            if u320.colorCorrection == colorCorrection then
                colorCorrection:Destroy()
                u320.colorCorrection = nil
            end
        end)
    end
    Nuke.tweenOutMushroomCloud(p1)
end
local function onSpawnNukeBuildup(p1) -- Line: 1030 -- upvalues: Nuke (val)
    local NPC1Animation = p1.NPC1Animation
    if not NPC1Animation then
        return
    end
    Nuke.startBuildup(NPC1Animation)
end
local function onSpawnTeaseAttachment(p1) -- Line: 1044 -- upvalues: Titans (val), Particles (val)
    local Torso = p1:FindFirstChild("Torso")
    if not Torso then
        return nil
    end
    local Tease = Titans:WaitForChild("Tease")
    local Tease_2 = Tease:WaitForChild("Tease")
    if not (Tease_2:IsA("Attachment")) then
        return nil
    end
    local v1 = Tease_2:Clone()
    v1.Parent = Torso
    Particles.deepEnableParticles(v1)
    Particles.deepEmitParticles(v1)
    return v1
end
local function onCharredPlayer(p1) -- Line: 1069 -- upvalues: Nuke (val), onSpawnNukeBuildup (val), clearInsideNuke (val), TweenService (val), onTweenNukeLighting (val), onSetInsideNuke (val), setNPC1Visible (val), tweenOutNukeReveal (val), Tease (val), onSpawnTeaseAttachment (val), Flashback (val)
    local NPC1Animation = p1.NPC1Animation
    if not NPC1Animation then
        return
    end
    local v1 = 2.3 - Nuke.getBuildupLightningLead()
    task.delay(v1, function() -- Line: 1076 -- upvalues: onSpawnNukeBuildup (upval), p1 (val)
        onSpawnNukeBuildup(p1)
    end)
    task.wait(2.5)
    v1 = {peakBrightness = 5}
    local v2 = Nuke.startRevealFlash(v1)
    clearInsideNuke()
    local v3 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(workspace.CurrentCamera, v3, {FieldOfView = 30}):Play()
    if v2 then
        v2.Completed:Wait()
    end
    Nuke.revealMushroomCloud(NPC1Animation, {impactFrames = true})
    onTweenNukeLighting()
    local u47 = Nuke.getRevealColorCorrection()
    local v4 = Nuke.getRevealBloom()
    task.wait(0.3)
    local v5 = TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    TweenService:Create(workspace.CurrentCamera, v5, {FieldOfView = 40}):Play()
    task.wait(7)
    if u47 then
        v5 = TweenInfo.new(0.2)
        TweenService:Create(u47, v5, {Saturation = -1, Brightness = -2, Contrast = 2.5, TintColor = Color3.fromRGB(255, 177, 74)}):Play()
    end
    if v4 then
        v5 = TweenInfo.new(0.3)
        TweenService:Create(v4, v5, {Intensity = 0, Size = 0, Threshold = 2}):Play()
    end
    task.wait(0.2)
    if u47 then
        v5 = TweenInfo.new(0.5)
        TweenService:Create(u47, v5, {Saturation = -0.5, Brightness = 0, Contrast = -0.1, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    end
    onSetInsideNuke(p1, 2)
    setNPC1Visible(true, p1)
    task.wait(5.3)
    tweenOutNukeReveal(0)
    clearInsideNuke()
    v5 = TweenInfo.new(1)
    local v6 = {FieldOfView = 70}
    TweenService:Create(workspace.CurrentCamera, v5, v6):Play()
    Tease.shrinkShifter(NPC1Animation, Tease.getChargeDuration(15))
    task.delay(2, function() -- Line: 1155 -- upvalues: TweenService (upval), u47 (val)
        local v1 = TweenInfo.new(1)
        TweenService:Create(u47, v1, {Saturation = 0, Contrast = 0}):Play()
    end)
    task.wait(6.5)
    local v7 = onSpawnTeaseAttachment(NPC1Animation)
    if not v7 then
        return
    end
    Flashback(true)
    task.wait(0.5)
    v6 = TweenInfo.new(0.5)
    TweenService:Create(p1.Droplets.ParticleEmitter, v6, {TimeScale = 0.1}):Play()
    v6 = TweenInfo.new(0.5)
    TweenService:Create(p1.Rain.ParticleEmitter, v6, {TimeScale = 0.1}):Play()
    for i, j in v7:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.LockedToPart = false
            j.TimeScale = 0.1
        end
    end
end
local function onNukeMicro(p1) -- Line: 1194 -- upvalues: clearTeaseColorCorrection (val), setNPC1Visible (val), Impact (val), Tease (val), onSetInsideNuke (val), clearInsideNuke (val), Nuke (val), tweenOutNukeReveal (val), onCharredPlayer (val)
    local NPC1Animation = p1.NPC1Animation
    clearTeaseColorCorrection()
    setNPC1Visible(false, p1)
    Impact(NPC1Animation, function() -- Line: 1199 -- upvalues: Tease (upval), NPC1Animation (val), onSetInsideNuke (upval), p1 (val)
        Tease.stop(NPC1Animation)
        onSetInsideNuke(p1)
    end)
    NPC1Animation.Destroying:Once(function() -- Line: 1204 -- upvalues: clearInsideNuke (upval), Nuke (upval), tweenOutNukeReveal (upval)
        clearInsideNuke()
        Nuke.clearBuildup()
        tweenOutNukeReveal()
    end)
    task.delay(0.5, function() -- Line: 1210 -- upvalues: onCharredPlayer (upval), p1 (val)
        onCharredPlayer(p1)
    end)
end
return {
    onKeyframeReached = function(p1, p2) -- Line: 1221 -- upvalues: startTeaseColorCorrection (val), Tease (val), clearTeaseColorCorrection (val), Impact (val), u259 (val), onNukeMicro (val), setNPC1Visible (val), u314 (ref), TweenService (val), Flashback (val), restoreAllPlayersForCutscene (val), black (val), u252 (val), Signals (val)
        local v1
        local v2 = string.split(p1, "_")
        if p1 == "ShifterTease" then
            local NPC1Animation = p2.NPC1Animation
            startTeaseColorCorrection()
            Tease(NPC1Animation, 6)
            NPC1Animation.Destroying:Once(function() -- Line: 1230 -- upvalues: clearTeaseColorCorrection (upval)
                clearTeaseColorCorrection()
            end)
            task.delay(0.15, function() -- Line: 1234 -- upvalues: Impact (upval), u259 (upval)
                Impact.playSequence(u259)
            end)
            return
        end
        if p1 == "NukeMicro" then
            onNukeMicro(p2)
            return
        end
        if v2[1] == "SetNPC1Visible" then
            local v3 = v2[2]
            local v4 = if v3 ~= "1" then v3 == "true" else true
            setNPC1Visible(v4, p2)
            return
        end
        if p1 == "RainSlowMotion" then
            if u314 then
                u314.Enabled = true
            end
            v1 = TweenInfo.new(0.5)
            TweenService:Create(p2.Droplets.ParticleEmitter, v1, {TimeScale = 0.1}):Play()
            v1 = TweenInfo.new(0.5)
            TweenService:Create(p2.Rain.ParticleEmitter, v1, {TimeScale = 0.1}):Play()
            Flashback(true)
            return
        end
        if p1 == "RainReturn" then
            if u314 then
                u314.Enabled = false
            end
            v1 = TweenInfo.new(0.5)
            TweenService:Create(p2.Droplets.ParticleEmitter, v1, {TimeScale = 1}):Play()
            v1 = TweenInfo.new(0.5)
            TweenService:Create(p2.Rain.ParticleEmitter, v1, {TimeScale = 1}):Play()
            Flashback(false)
            return
        end
        if p1 == "DoFOn" then
            if not u314 then
                return
            end
            u314.Enabled = true
            return
        end
        if p1 == "DoFOff" then
            if not u314 then
                return
            end
            u314.Enabled = false
            return
        end
        if p1 == "End" then
            if u314 then
                u314.Enabled = false
            end
            restoreAllPlayersForCutscene()
            black({enabled = true, tween = TweenInfo.new(0.5)})
            task.delay(6.5, function() -- Line: 1292 -- upvalues: u252 (upval), Signals (upval)
                local v1 = u252
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    Signals.Monologue:Fire(j)
                    task.wait(1.25)
                end
            end)
        end
    end,
    onLoaded = function(p1) -- Line: 1301 -- upvalues: Workspace (val), Lighting (val), u314 (ref), Customization (val), Players (val), hideAllPlayersForCutscene (val)
        local DepthOfFieldEffect, Sound
        if not Workspace.CurrentCamera then
            return
        end
        local OneSecretRevealDepthOfField = Lighting:FindFirstChild("OneSecretRevealDepthOfField")
        if not OneSecretRevealDepthOfField then
            Customization.decorateRigCopyingRig(p1.NPC2Animation, Players.LocalPlayer.Character)
            hideAllPlayersForCutscene()
            Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://82640552981750"
            Sound.Looped = false
            Sound.Volume = 2
            Sound.PlaybackSpeed = 0.655737
            Sound.Parent = workspace
            Sound.Name = "OneSecretRevealAudio"
            Sound:Play()
            DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
            DepthOfFieldEffect.Name = "OneSecretRevealDepthOfField"
            DepthOfFieldEffect.FarIntensity = 1
            DepthOfFieldEffect.NearIntensity = 0
            DepthOfFieldEffect.InFocusRadius = 20
            DepthOfFieldEffect.Enabled = false
            DepthOfFieldEffect.Parent = Lighting
            u314 = DepthOfFieldEffect
            return
        end
        if OneSecretRevealDepthOfField:IsA("DepthOfFieldEffect") then
            u314 = OneSecretRevealDepthOfField
            OneSecretRevealDepthOfField.Enabled = false
            return
        end
        Customization.decorateRigCopyingRig(p1.NPC2Animation, Players.LocalPlayer.Character)
        hideAllPlayersForCutscene()
        Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://82640552981750"
        Sound.Looped = false
        Sound.Volume = 2
        Sound.PlaybackSpeed = 0.655737
        Sound.Parent = workspace
        Sound.Name = "OneSecretRevealAudio"
        Sound:Play()
        DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
        DepthOfFieldEffect.Name = "OneSecretRevealDepthOfField"
        DepthOfFieldEffect.FarIntensity = 1
        DepthOfFieldEffect.NearIntensity = 0
        DepthOfFieldEffect.InFocusRadius = 20
        DepthOfFieldEffect.Enabled = false
        DepthOfFieldEffect.Parent = Lighting
        u314 = DepthOfFieldEffect
    end,
}