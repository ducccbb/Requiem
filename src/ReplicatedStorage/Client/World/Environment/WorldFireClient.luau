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
--           File: ReplicatedStorage.Client.World.Environment.WorldFireClient
--                               Dumped in 0.00274 seconds
--                          Bytecode version 9  |  23 functions

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
local Fire = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Fire")
local Folder = Instance.new("Folder")
Folder.Name = "WorldFire"
Folder.Parent = workspace
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = require(Common_3:WaitForChild("Network"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local World = require(Namespaces:WaitForChild("World"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_6:WaitForChild("Packages")
local v2 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_7:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Network_3 = Common_8:WaitForChild("Network")
local Namespaces_2 = Network_3:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local u216 = {}
local u217 = {}
local u218 = {}
local u220 = v2.new()
local u221 = nil
local u222 = 0
local u223 = 0
local u224 = false
local u225 = 0
local u226 = 0
local u227 = nil
local u228 = nil
local u229 = nil
local function onRenderFire(p1) -- Line: 93 -- upvalues: Fire (val), Folder (val)
    local Object = p1.Object
    if Object.instance then
        return
    end
    local v1 = Fire:Clone()
    v1:PivotTo(Object.server.pivot)
    v1.Parent = Folder
    Object.instance = v1
end
local function onDespawnFire(p1) -- Line: 111
    local Object = p1.Object
    local instance = Object.instance
    if not instance then
        return
    end
    instance:Destroy()
    Object.instance = nil
end
local function removeFireNode(p1) -- Line: 127 -- upvalues: u217 (val), u218 (val), u216 (ref), onDespawnFire (val), u220 (val), u229 (ref)
    if not (u217[p1]) then
        return
    end
    u217[p1] = nil
    u218[p1.Object.server.id] = nil
    if u216[p1] then
        onDespawnFire(p1)
        u216[p1] = nil
    end
    u220:RemoveNode(p1)
    u229()
end
local function clearAllFires() -- Line: 148 -- upvalues: u217 (val), removeFireNode (val)
    local v1 = u217
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        removeFireNode(i)
    end
end
local function onLoadFire(p1) -- Line: 159 -- upvalues: u218 (val), removeFireNode (val), u220 (val), u217 (val), u229 (ref)
    local v1 = u218[p1.id]
    if v1 then
        removeFireNode(v1)
    end
    local v2 = u220:CreateNode(p1.pivot.Position, {server = p1})
    u217[v2] = true
    u218[p1.id] = v2
    u229()
end
local function onFiresReceived(p1) -- Line: 179 -- upvalues: onLoadFire (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        onLoadFire(j)
    end
end
local function clearActiveFireNodes() -- Line: 189 -- upvalues: u216 (ref), onDespawnFire (val)
    if not (next(u216)) then
        return
    end
    local v1 = u216
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        onDespawnFire(i)
    end
    table.clear(u216)
end
local function ensureColorCorrection() -- Line: 205 -- upvalues: u227 (ref), Lighting (val)
    if u227 then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "WorldFireHeat"
    ColorCorrectionEffect.Parent = Lighting
    u227 = ColorCorrectionEffect
end
local function getClosestFireDistance() -- Line: 220 -- upvalues: Character (val), u220 (val)
    local Magnitude
    local v1 = Character.getCharacter()
    if not v1 then
        return nil
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return nil
    end
    local v2 = u220:SearchRadius(HumanoidRootPart.Position, 10)
    local v3 = nil
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        Magnitude = (HumanoidRootPart.Position - j.Position).Magnitude
        if Magnitude <= 10 then
            if v3 == nil then
                v3 = Magnitude
            elseif Magnitude >= v3 then
            end
        end
    end
    return v3
end
local function updateFireScreenEffect(p1) -- Line: 249 -- upvalues: u227 (ref)
    local v1
    if not u227 then
        return
    end
    if p1 == nil then
        v1 = 0
    else
        v1 = math.clamp(1 - p1 / 10, 0, 1)
    end
    u227.Contrast = -v1 / 3
    u227.Brightness = v1 / 2
    u227.Saturation = -v1 / 2
    local v2 = Color3.fromRGB(255, 255, 255)
    local v3 = Color3.fromRGB(255, 188, 136)
    u227.TintColor = v2:Lerp(v3, v1)
end
local function onHandleFireProximity(p1) -- Line: 272 -- upvalues: u222 (ref), Signals (val), u223 (ref)
    local v1 = tick() - u222
    if 6 < v1 then
        Signals.Monologue:Fire({"This heat, it's unbearable...", "I'm sweating profusely...", "It feels as though my skin is melting...", "I need to get out of here..."})
        u222 = tick()
    end
    u223 = math.min(u223 + p1, 4)
end
local function stopFireSound() -- Line: 291 -- upvalues: u228 (ref), Sounds (val), Universal (val)
    if not u228 then
        return
    end
    Sounds.stopGlobalSoundEffect(Universal.Fire, 0.2)
    u228 = nil
end
local function onCheckBodyHeat() -- Line: 304 -- upvalues: u223 (ref), u224 (ref), u226 (ref), Effects (val), u228 (ref), Sounds (val), Universal (val), stopFireSound (val)
    if 1 > u223 then
        if u223 < 1 and u224 then
            u224 = false
            u226 = 0
            Effects.Screen.__removeClientScreenEffect("Fire")
            stopFireSound()
        end
        return
    end
    if not u224 then
        u224 = true
        u226 = 0
        Effects.Screen.__createClientScreenEffect({name = "Fire"})
        if u228 then
            return
        end
        u228 = Sounds.playGlobalSoundEffect(Universal.Fire, 0.1, 1, 30)
        return
    end
    if u223 < 1 and u224 then
        u224 = false
        u226 = 0
        Effects.Screen.__removeClientScreenEffect("Fire")
        stopFireSound()
    end
end
local function resetFireHeatEffects() -- Line: 325 -- upvalues: u224 (ref), u226 (ref), Effects (val), stopFireSound (val), u223 (ref), u227 (ref), TweenService (val)
    if u224 then
        u224 = false
        u226 = 0
        Effects.Screen.__removeClientScreenEffect("Fire")
        stopFireSound()
    end
    u223 = 0
    if u227 then
        local v1 = TweenInfo.new(3)
        TweenService:Create(u227, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    end
end
local function onFireHeatStepped(p1) -- Line: 350 -- upvalues: ensureColorCorrection (val), getClosestFireDistance (val), onHandleFireProximity (val), u223 (ref), updateFireScreenEffect (val), onCheckBodyHeat (val), u224 (ref), u225 (ref), Vitality (val), u226 (ref)
    ensureColorCorrection()
    local v1 = getClosestFireDistance()
    if v1 == nil then
        u223 = math.max(u223 - p1 * 0.5, 0)
    else
        onHandleFireProximity(p1)
    end
    updateFireScreenEffect(v1)
    onCheckBodyHeat()
    if u224 then
        local v2 = tick() - u225
        if 2 <= v2 then
            v2 = math.clamp(1 - (v1 or 10) / 10, 0, 1)
            Vitality.Inflict.post({reason = "fire", amount = (u226 + 5) * (v2 * 3 + 1)})
            u226 = u226 + 2
            u225 = tick()
        end
    end
end
local function onFireRenderStepped() -- Line: 380 -- upvalues: Character (val), clearActiveFireNodes (val), u220 (val), u216 (ref), onRenderFire (val), onDespawnFire (val)
    local v1 = Character.getCharacter()
    if not v1 then
        clearActiveFireNodes()
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = u220:SearchRadius(HumanoidRootPart.Position, 800)
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j] = true
        if not (u216[j]) then
            onRenderFire(j)
        end
    end
    v4 = u216
    v5 = nil
    v6 = nil
    for k in v4, v5, v6 do
        if not (v3[k]) then
            onDespawnFire(k)
        end
    end
    u216 = v3
end
local function stopFireRenderLoop() -- Line: 416 -- upvalues: u221 (ref), clearActiveFireNodes (val), resetFireHeatEffects (val)
    if u221 then
        u221:Disconnect()
        u221 = nil
    end
    clearActiveFireNodes()
    resetFireHeatEffects()
end
local function startFireRenderLoop() -- Line: 430 -- upvalues: u221 (ref), RunService (val), onFireRenderStepped (val), onFireHeatStepped (val)
    if u221 then
        return
    end
    u221 = RunService.RenderStepped:Connect(function(p1) -- Line: 435 -- upvalues: onFireRenderStepped (upval), onFireHeatStepped (upval)
        onFireRenderStepped()
        onFireHeatStepped(p1)
    end)
end
function u229() -- Line: 445 -- upvalues: u217 (val), startFireRenderLoop (val), stopFireRenderLoop (val)
    if next(u217) then
        startFireRenderLoop()
        return
    end
    stopFireRenderLoop()
end
Network.loaded:andThen(function() -- Line: 455 -- upvalues: World (val)
    World.Fire.post()
end)
World.Fire.listen(function(p1, p2) -- Line: 459 -- upvalues: onFiresReceived (val), onLoadFire (val), clearAllFires (val)
    if p1 == 1 then
        onFiresReceived(p2)
        return
    end
    if p1 == 2 then
        onLoadFire(p2)
        return
    end
    if p1 == 3 then
        clearAllFires()
    end
end)
return {}