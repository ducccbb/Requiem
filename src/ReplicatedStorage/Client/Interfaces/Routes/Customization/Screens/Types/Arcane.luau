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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Screens.Types.Arcane
--                               Dumped in 0.00162 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Screens = ReplicatedStorage:WaitForChild("Screens")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Moon = require(Utilities:WaitForChild("Moon"))
local ArcaneLoadingScreen = Screens:WaitForChild("ArcaneLoadingScreen")
local u54 = {Properties = {}, Assets = {}}
local u57 = false
local u58 = nil
local u59 = nil
local function onLoadLighting(p1) -- Line: 45 -- upvalues: Lighting (val), u54 (val), u58 (ref), u59 (ref)
    for i, j in p1:GetAttributes() do
        Lighting[i] = j
        u54.Properties[i] = j
    end
    for k, n in Lighting:GetChildren() do
        table.insert(u54.Assets, n)
        n.Parent = nil
    end
    for m, i5 in p1:GetChildren() do
        i5.Parent = Lighting
        if i5:IsA("ColorCorrectionEffect") then
            u58 = i5
            u59 = {Brightness = i5.Brightness, Contrast = i5.Contrast, Saturation = i5.Saturation, TintColor = i5.TintColor}
        end
    end
end
local function onRestoreLighting() -- Line: 78 -- upvalues: Lighting (val), u54 (val)
    for i, j in Lighting:GetChildren() do
        j.Parent = nil
    end
    local Properties = u54.Properties
    local v1 = nil
    local v2 = nil
    for k, n in Properties, v1, v2 do
        Lighting[k] = n
    end
    local Assets = u54.Assets
    v1 = nil
    v2 = nil
    for m, i5 in Assets, v1, v2 do
        i5.Parent = Lighting
    end
end
local function onRestoreColorCorrectionEffect() -- Line: 108 -- upvalues: u58 (ref), u59 (ref)
    u58.Brightness = u59.Brightness
    u58.Contrast = u59.Contrast
    u58.Saturation = u59.Saturation
    u58.TintColor = u59.TintColor
end
local function onRockNestorDisappear(p1) -- Line: 119
    local TRock1 = p1:WaitForChild("RockKingScene"):WaitForChild("TRock1")
    TRock1.Transparency = 1
end
local function onAppearModel(p1, p2, p3) -- Line: 132 -- upvalues: TweenService (val)
    local v1
    local v2 = p1:FindFirstChild(p2, true)
    if not v2 then
        return
    end
    for i, j in v2:GetChildren() do
        if j:IsA("BasePart") then
            v1 = TweenInfo.new(p3, Enum.EasingStyle.Linear)
            TweenService:Create(j, v1, {Transparency = 0}):Play()
        end
    end
end
local function onAureliaAppear(p1) -- Line: 150 -- upvalues: u57 (ref), onAppearModel (val)
    if u57 then
        onAppearModel(p1, "QueenAurelia", 2)
        return
    end
    workspace.CurrentCamera.FieldOfView = 45
    for i, j in p1:FindFirstChild("PrincessStatue", true):GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
    u57 = true
end
local function onStygianAppear(p1) -- Line: 174 -- upvalues: onAppearModel (val)
    onAppearModel(p1, "StygianCommander2", 1)
end
local function onReyAppear(p1) -- Line: 182 -- upvalues: onAppearModel (val)
    onAppearModel(p1, "ReyCommander2", 1)
end
local function onCaitlynAppear(p1) -- Line: 190 -- upvalues: onAppearModel (val)
    onAppearModel(p1, "CaitlynCommander2", 1)
end
local function onAttackAppear(p1) -- Line: 198 -- upvalues: onAppearModel (val)
    onAppearModel(p1, "AttackStatue1", 0.5)
end
local function onRedBlackGlitch() -- Line: 205 -- upvalues: u58 (ref)
    u58.Brightness = -10
    u58.Saturation = 1000
end
local function onYellowBlueGlitch() -- Line: 213 -- upvalues: u58 (ref)
    u58.Brightness = 0
    u58.Saturation = 10
end
local function onPurpleYellowGlitch() -- Line: 221 -- upvalues: u58 (ref)
    u58.Brightness = 0
    u58.Saturation = 40
end
local function onBlueGlitch() -- Line: 229 -- upvalues: u58 (ref)
    u58.Brightness = 0
    u58.Saturation = -9
end
local function onKeyframeReached(p1, p2) -- Line: 239 -- upvalues: onAureliaAppear (val), onRockNestorDisappear (val), onStygianAppear (val), onReyAppear (val), onCaitlynAppear (val), onAttackAppear (val), onRestoreColorCorrectionEffect (val), onRedBlackGlitch (val), onYellowBlueGlitch (val), onPurpleYellowGlitch (val), onBlueGlitch (val)
    local v1 = string.split(p1, "_")
    if v1[1] == "FOV" then
        workspace.CurrentCamera.FieldOfView = tonumber(v1[2])
        return
    end
    if p1 == "AureliaAppear" then
        onAureliaAppear(p2)
        return
    end
    if p1 == "NestorAppear" then
        onRockNestorDisappear(p2)
        return
    end
    if p1 == "StygianAppear" then
        onStygianAppear(p2)
        return
    end
    if p1 == "ReyAppear" then
        onReyAppear(p2)
        return
    end
    if p1 == "CaitlynAppear" then
        onCaitlynAppear(p2)
        return
    end
    if p1 == "AttackAppear" then
        onAttackAppear(p2)
        return
    end
    if p1 == "ResetView" then
        onRestoreColorCorrectionEffect()
        return
    end
    if p1 == "RedBlackGlitch" then
        onRedBlackGlitch()
        return
    end
    if p1 == "YellowBlueGlitch" then
        onYellowBlueGlitch()
        return
    end
    if p1 == "PurpleYellowGlitch" then
        onPurpleYellowGlitch()
        return
    end
    if p1 == "BlueGlitch" then
        onBlueGlitch()
    end
end
return {
    onLoad = function(p1) -- Line: 273 -- upvalues: Moon (val), ArcaneLoadingScreen (val), onKeyframeReached (val)
        task.spawn(function() -- Line: 275 -- upvalues: Moon (upval), ArcaneLoadingScreen (upval), onKeyframeReached (upval), p1 (val)
            local v1 = workspace:GetServerTimeNow() + 0.2
            Moon.onRunMoonCutscene(ArcaneLoadingScreen, 60, v1, onKeyframeReached, p1)
        end)
    end,
    onCancel = function() -- Line: 97 -- upvalues: Moon (val), onRestoreLighting (val)
        Moon.onCancelMoonCutscene()
        onRestoreLighting()
    end,
    onPreload = function() -- Line: 284 -- upvalues: ArcaneLoadingScreen (val), Moon (val), onLoadLighting (val)
        ArcaneLoadingScreen.Parent = workspace
        Moon.onPreloadMoonCutscene(ArcaneLoadingScreen)
        onLoadLighting(ArcaneLoadingScreen.Scene)
    end,
}