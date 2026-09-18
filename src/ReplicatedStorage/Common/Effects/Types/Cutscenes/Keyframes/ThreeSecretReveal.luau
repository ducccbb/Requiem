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
--  File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.ThreeSecretReveal
--                               Dumped in 0.00386 seconds
--                          Bytecode version 9  |  39 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Explosions = script.Parent.Parent.Parent:WaitForChild("Explosions")
local Impact = require(Explosions:WaitForChild("Impact"))
local u45 = {}
local v2 = {kind = "white", duration = 0.025}
local v3 = {kind = "black", duration = 0.018}
local v4 = {kind = "white", duration = 0.022}
local v5 = {kind = "black", duration = 0.018}
local v6 = {kind = "white", duration = 0.035}
u45[1] = v2
u45[2] = v3
u45[3] = v4
u45[4] = v5
u45[5] = v6
local u51 = {"First", "Second"}
local u54 = {white = Color3.new(0, 0, 0), black = Color3.fromRGB(255, 255, 255)}
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local BrokenInnerGate = Objects:WaitForChild("BrokenInnerGate")
local GateImpact = Objects:WaitForChild("GateImpact")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u115 = {"Map_ExportAfterlife", "Map_ExportPicnic"}
local u118 = {
    Brightness = 2.243,
    EnvironmentDiffuseScale = 1,
    EnvironmentSpecularScale = 1,
    ExposureCompensation = 0.2,
    Ambient = Color3.fromRGB(70, 70, 70),
    ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
    ColorShift_Top = Color3.fromRGB(0, 0, 0),
    OutdoorAmbient = Color3.fromRGB(70, 70, 70),
}
local u139 = {Brightness = 0.1, Contrast = 0.4, Saturation = 0.3, TintColor = Color3.fromRGB(255, 255, 255)}
local u145 = nil
local u146 = {}
local u147 = nil
local u148 = {}
local u149 = {}
local u150 = {}
local u151 = nil
local u152 = 0
local function captureFlashbackLightingSnapshot() -- Line: 116 -- upvalues: Lighting (val)
    return {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
end
local function restoreFlashbackLightingSnapshot(p1) -- Line: 133 -- upvalues: Lighting (val)
    Lighting.Ambient = p1.Ambient
    Lighting.Brightness = p1.Brightness
    Lighting.ColorShift_Bottom = p1.ColorShift_Bottom
    Lighting.ColorShift_Top = p1.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = p1.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = p1.EnvironmentSpecularScale
    Lighting.OutdoorAmbient = p1.OutdoorAmbient
    Lighting.ExposureCompensation = p1.ExposureCompensation
end
local function applyFlashbackLighting() -- Line: 147 -- upvalues: Lighting (val), u118 (val)
    Lighting.Ambient = u118.Ambient
    Lighting.Brightness = u118.Brightness
    Lighting.ColorShift_Bottom = u118.ColorShift_Bottom
    Lighting.ColorShift_Top = u118.ColorShift_Top
    Lighting.EnvironmentDiffuseScale = u118.EnvironmentDiffuseScale
    Lighting.EnvironmentSpecularScale = u118.EnvironmentSpecularScale
    Lighting.OutdoorAmbient = u118.OutdoorAmbient
    Lighting.ExposureCompensation = u118.ExposureCompensation
end
local function createFlashbackColorCorrection() -- Line: 161 -- upvalues: u147 (ref), u139 (val), Lighting (val)
    if u147 then
        u147:Destroy()
        u147 = nil
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "ThreeSecretRevealFlashbackColorCorrection"
    ColorCorrectionEffect.Brightness = u139.Brightness
    ColorCorrectionEffect.Contrast = u139.Contrast
    ColorCorrectionEffect.Saturation = u139.Saturation
    ColorCorrectionEffect.TintColor = u139.TintColor
    ColorCorrectionEffect.Parent = Lighting
    u147 = ColorCorrectionEffect
end
local function destroyFlashbackColorCorrection() -- Line: 181 -- upvalues: u147 (ref)
    if u147 then
        u147:Destroy()
        u147 = nil
    end
end
local function disableFlashbackPostEffects() -- Line: 191 -- upvalues: u146 (val), Lighting (val)
    table.clear(u146)
    for i, j in Lighting:GetDescendants() do
        if j:IsA("ColorCorrectionEffect") then
            table.insert(u146, {instance = j, enabled = j.Enabled})
            j.Enabled = false
        elseif not (j:IsA("BloomEffect")) then
        end
    end
end
local function restoreFlashbackPostEffects() -- Line: 208 -- upvalues: u146 (val)
    local v1 = u146
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.instance.Parent then
            j.instance.Enabled = j.enabled
        end
    end
    table.clear(u146)
end
local function activateFlashbackLighting() -- Line: 221 -- upvalues: u145 (ref), captureFlashbackLightingSnapshot (val), disableFlashbackPostEffects (val), applyFlashbackLighting (val), createFlashbackColorCorrection (val)
    u145 = captureFlashbackLightingSnapshot()
    disableFlashbackPostEffects()
    applyFlashbackLighting()
    createFlashbackColorCorrection()
end
local function deactivateFlashbackLighting() -- Line: 231 -- upvalues: destroyFlashbackColorCorrection (val), u145 (ref), restoreFlashbackLightingSnapshot (val), restoreFlashbackPostEffects (val)
    destroyFlashbackColorCorrection()
    local v1 = u145
    if v1 then
        restoreFlashbackLightingSnapshot(v1)
        u145 = nil
    end
    restoreFlashbackPostEffects()
end
local function getCellKey(p1) -- Line: 248
    local v1 = math.floor(p1.X / 20)
    local v2 = math.floor(p1.Z / 20)
    return (("%*,%*"):format(v1, v2))
end
local function easeOutQuad(p1) -- Line: 258
    return 1 - (1 - p1) * (1 - p1)
end
local function getCurrentBloomRadius() -- Line: 265 -- upvalues: u152 (ref)
    return math.clamp(u152 / 4, 0, 1) * 50 + 10
end
local function buildFlowerRegistry(p1) -- Line: 274 -- upvalues: u148 (val), u115 (val)
    local Flowers, v1
    table.clear(u148)
    local v2 = {}
    local Maps = p1.Maps
    local v3 = u115
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = Maps[j]
        Flowers = v1
        if Flowers then
            Flowers = v1:FindFirstChild("Flowers")
        end
        if Flowers then
            for k, n in Flowers:GetDescendants() do
                if n:IsA("BasePart") and not (v2[n]) then
                    v2[n] = true
                    table.insert(u148, {bloomed = false, part = n, originalTransparency = n.Transparency})
                end
            end
        end
    end
end
local function buildSpatialGrid() -- Line: 310 -- upvalues: u149 (val), u148 (val), getCellKey (val)
    local v1
    table.clear(u149)
    local v2 = u148
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.part.Parent then
            v1 = getCellKey(j.part.Position)
            if not (u149[v1]) then
                u149[v1] = {}
            end
            table.insert(u149[v1], j)
        end
    end
end
local function hideFlower(p1) -- Line: 331
    if not p1.part.Parent then
        return
    end
    p1.part.Transparency = 1
    p1.bloomed = false
    p1.bloomProgress = nil
end
local function restoreFlower(p1) -- Line: 345
    if not p1.part.Parent then
        return
    end
    p1.part.Transparency = p1.originalTransparency
    p1.bloomed = false
    p1.bloomProgress = nil
end
local function runBatched(p1) -- Line: 359 -- upvalues: u148 (val)
    local v1 = 0
    local v2 = u148
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        p1(j)
        v1 = v1 + 1
        if v1 % 800 == 0 then
            task.wait()
        end
    end
end
local function stopBloomLoop() -- Line: 375 -- upvalues: u151 (ref), u150 (val), u152 (ref)
    if u151 then
        u151:Disconnect()
        u151 = nil
    end
    table.clear(u150)
    u152 = 0
end
local function startBloomLoop() -- Line: 388 -- upvalues: stopBloomLoop (val), u151 (ref), RunService (val), Workspace (val), u152 (ref), getCurrentBloomRadius (val), u149 (val), u150 (val), easeOutQuad (val)
    stopBloomLoop()
    u151 = RunService.RenderStepped:Connect(function(p1) -- Line: 391 -- upvalues: Workspace (upval), u152 (upval), getCurrentBloomRadius (upval), u149 (upval), u150 (upval), easeOutQuad (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local CurrentCamera = Workspace.CurrentCamera
        if not CurrentCamera then
            return
        end
        u152 = u152 + p1
        local Position = CurrentCamera.CFrame.Position
        local v11 = getCurrentBloomRadius()
        local v12 = math.ceil(v11 / 20)
        local v13 = math.floor(Position.X / 20)
        local v14 = math.floor(Position.Z / 20)
        local v15 = v11 * v11
        local v16 = 15
        local v17 = v12
        local v18 = 1
        local v19 = p1
        for i = -v12, v17, v18 do
            v2 = v12
            v3 = 1
            for j = -v12, v2, v3 do
                v4 = ("%*,%*"):format(v13 + i, v14 + j)
                v5 = u149[v4]
                if v5 then
                    v6 = v5
                    v7 = nil
                    v8 = nil
                    for k, n in v6, v7, v8 do
                        if v16 <= 0 then
                            break
                        end
                        if not n.bloomed and n.bloomProgress == nil and n.part.Parent then
                            v9 = n.part.Position - Position
                            v10 = v9.X * v9.X + v9.Y * v9.Y
                            if v15 >= v10 + v9.Z * v9.Z then
                                n.bloomProgress = 0
                                table.insert(u150, n)
                                v16 = v16 - 1
                            end
                        end
                    end
                    if v16 <= 0 then
                        break
                    end
                end
            end
            if v16 <= 0 then
                break
            end
        end
        v17 = 1
        while v17 <= #u150 do
            v18 = u150[v17]
            if v18.part.Parent then
                v2 = v18.bloomProgress or 0
                v1 = v2 + v19 / 0.8
                if 1 > v1 then
                    v18.bloomProgress = v1
                    v2 = easeOutQuad(v1)
                    v18.part.Transparency = (v18.originalTransparency - 1) * v2 + 1
                    v17 = v17 + 1
                else
                    v18.part.Transparency = v18.originalTransparency
                    v18.bloomProgress = nil
                    v18.bloomed = true
                    table.remove(u150, v17)
                end
            else
                table.remove(u150, v17)
            end
        end
    end)
end
local function onHideExtraMaps(p1) -- Line: 480
    local Map_ExportAfterlife = p1.Maps.Map_ExportAfterlife
    local Map_ExportPicnic = p1.Maps.Map_ExportPicnic
    if not Map_ExportAfterlife or not Map_ExportPicnic then
        return
    end
    local Pivot = Map_ExportAfterlife:GetPivot()
    local Pivot_2 = Map_ExportPicnic:GetPivot()
    Map_ExportAfterlife:PivotTo(Pivot * CFrame.new(0, -1200, 0))
    Map_ExportPicnic:PivotTo(Pivot_2 * CFrame.new(0, -1200, 0))
end
local function onShowExtraMaps(p1) -- Line: 499
    local Map_ExportAfterlife = p1.Maps.Map_ExportAfterlife
    local Map_ExportPicnic = p1.Maps.Map_ExportPicnic
    if not Map_ExportAfterlife or not Map_ExportPicnic then
        return
    end
    local Pivot = Map_ExportAfterlife:GetPivot()
    local Pivot_2 = Map_ExportPicnic:GetPivot()
    Map_ExportAfterlife:PivotTo(Pivot * CFrame.new(0, 1200, 0))
    Map_ExportPicnic:PivotTo(Pivot_2 * CFrame.new(0, 1200, 0))
end
local function onFlashBackStart(p1) -- Line: 517 -- upvalues: onShowExtraMaps (val), activateFlashbackLighting (val), runBatched (val), hideFlower (val), startBloomLoop (val), Signals (val)
    onShowExtraMaps(p1)
    activateFlashbackLighting()
    task.spawn(function() -- Line: 521 -- upvalues: runBatched (upval), hideFlower (upval), startBloomLoop (upval)
        runBatched(hideFlower)
        startBloomLoop()
    end)
    Signals.Bars:Fire(0.425, 0, 8)
end
local function onFlashBackEnd(p1) -- Line: 533 -- upvalues: stopBloomLoop (val), deactivateFlashbackLighting (val), runBatched (val), restoreFlower (val), onHideExtraMaps (val), Signals (val)
    stopBloomLoop()
    deactivateFlashbackLighting()
    task.spawn(function() -- Line: 537 -- upvalues: runBatched (upval), restoreFlower (upval)
        runBatched(restoreFlower)
    end)
    onHideExtraMaps(p1)
    Signals.Bars:Fire(0.25, 0)
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 551 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function playImpactFrameSequenceOnHighlight(p1, p2) -- Line: 567 -- upvalues: u54 (val)
    local v1
    local v2 = p2
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = u54[j.kind]
        if v1 then
            p1.FillColor = v1
            p1.FillTransparency = 0
            p1.OutlineTransparency = 1
            task.wait(j.duration)
        end
    end
end
local function getGateImpactParts(p1) -- Line: 588 -- upvalues: u51 (val)
    local v1
    local v2 = {}
    local v3 = u51
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = p1:FindFirstChild(j, true)
        if v1 and v1:IsA("BasePart") then
            table.insert(v2, v1)
        end
    end
    return v2
end
local function setGateImpactPartVisibility(p1, p2) -- Line: 606
    local v1
    local v2 = p1
    local v3 = nil
    local v4 = nil
    local v5 = p2
    for i, j in v2, v3, v4 do
        if j ~= v5 then
            v1 = 1
        else
            v1 = 0
        end
        j.Transparency = v1
    end
end
local function playGateImpactFrames() -- Line: 615 -- upvalues: GateImpact (val), getGateImpactParts (val), setGateImpactPartVisibility (val), Impact (val), u45 (val), playImpactFrameSequenceOnHighlight (val)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local u5 = GateImpact:Clone()
    u5:PivotTo(CurrentCamera.CFrame * CFrame.new(0, 0, -300))
    u5.Parent = workspace
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "GateImpactHighlight"
    Highlight.Parent = u5
    local u23 = getGateImpactParts(u5)
    setGateImpactPartVisibility(u23, nil)
    task.spawn(function() -- Line: 632 -- upvalues: u23 (val), setGateImpactPartVisibility (upval), Highlight (val), Impact (upval), u45 (upval), playImpactFrameSequenceOnHighlight (upval), u5 (val)
        local v1 = u23
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            setGateImpactPartVisibility(u23, j)
            Highlight.Adornee = j
            local u23 = false
            Impact.playSequence(u45, nil, function() -- Line: 639 -- upvalues: u23 (ref)
                u23 = true
            end)
            playImpactFrameSequenceOnHighlight(Highlight, u45)
            while not u23 do
                task.wait()
            end
        end
        Highlight:Destroy()
        u5:Destroy()
    end)
end
local function onInnerWallBreach(p1) -- Line: 659 -- upvalues: playGateImpactFrames (val), BrokenInnerGate (val)
    playGateImpactFrames()
    local Walls = workspace:WaitForChild("Walls")
    local Walls_2 = Walls:WaitForChild("Walls")
    local InnerGate = Walls_2:WaitForChild("InnerGate")
    local u19 = BrokenInnerGate:Clone()
    u19.Parent = workspace
    InnerGate:Destroy()
    task.delay(14.644, function() -- Line: 670 -- upvalues: u19 (val)
        u19:Destroy()
    end)
end
local function onHideCivilianAndTitan(p1) -- Line: 679
    p1.TitanRig3:Destroy()
    p1.NPC4Animation:Destroy()
end
return {
    onKeyframeReached = function(p1, p2) -- Line: 692 -- upvalues: onHandleEmitKeyframe (val), onFlashBackStart (val), onFlashBackEnd (val), onInnerWallBreach (val), onHideCivilianAndTitan (val)
        local v1 = string.split(p1, "_")
        if v1[1] == "Emit" then
            onHandleEmitKeyframe(p2, v1[2])
            return
        end
        if p1 == "FlashBackStart" then
            onFlashBackStart(p2)
            return
        end
        if p1 == "FlashBackEnd" or p1 == "FlasBackEnd" then
            onFlashBackEnd(p2)
            return
        end
        if p1 == "BreachInner" then
            onInnerWallBreach(p2)
            return
        end
        if p1 == "HideCivilianAndTitan" then
            onHideCivilianAndTitan(p2)
        end
    end,
    onLoaded = function(p1) -- Line: 711 -- upvalues: buildFlowerRegistry (val), buildSpatialGrid (val), onHideExtraMaps (val)
        buildFlowerRegistry(p1)
        buildSpatialGrid()
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://116600264264515"
        Sound.Looped = false
        Sound.Volume = 1.6
        Sound.PlaybackSpeed = 0.602
        Sound.Parent = workspace
        Sound.Name = "ThreeSecretRevealAudio"
        Sound:Play()
        onHideExtraMaps(p1)
    end,
}