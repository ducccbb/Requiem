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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Blades.Default
--                               Dumped in 0.0159 seconds
--                          Bytecode version 9  |  83 functions

local u461
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Types = Common_6:WaitForChild("Types")
local Titan = require(Types:WaitForChild("Titan"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local RaycastHitboxV4 = require(Utilities_2:WaitForChild("RaycastHitboxV4"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Observers = Common_8:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Network = Common_9:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_12:WaitForChild("Common")
local Utilities_3 = Common_10:WaitForChild("Utilities")
local Particles = require(Utilities_3:WaitForChild("Particles"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_4 = Common_11:WaitForChild("Utilities")
local Character = require(Utilities_4:WaitForChild("Character"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_14:WaitForChild("Common")
local Types_2 = Common_12:WaitForChild("Types")
require(Types_2:WaitForChild("Gear"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_15:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Character_2 = User_2:WaitForChild("Character")
local CharacterPredictionRunner = require(Character_2:WaitForChild("CharacterPredictionRunner"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_16:WaitForChild("Client")
local Progression = Client_3:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u331 = nil
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_17:WaitForChild("Client")
local User_3 = Client_4:WaitForChild("User")
local State_3 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_3:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_18:WaitForChild("Client")
local Progression_2 = Client_5:WaitForChild("Progression")
local Proficiencies = Progression_2:WaitForChild("Proficiencies")
local Proficiencies_2 = Proficiencies:WaitForChild("Proficiencies")
local Sentinel = Proficiencies_2:WaitForChild("Sentinel")
local Eradicate = require(Sentinel:WaitForChild("Eradicate"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_19:WaitForChild("Common")
local Config = require(Common_13:WaitForChild("Config"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_20:WaitForChild("Common")
local Statistics = Common_14:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_21:WaitForChild("Common")
local Utilities_5 = Common_15:WaitForChild("Utilities")
local State = require(Utilities_5:WaitForChild("State"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_22:WaitForChild("Common")
local Statistics_2 = Common_16:WaitForChild("Statistics")
_, u461 = require(Statistics_2:WaitForChild("useWalkSpeed"))()
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Common_17 = ReplicatedStorage_23:WaitForChild("Common")
local Blades = require(Common_17:WaitForChild("Logger"))("Blades")
local function bladeAnimalDebug(p1) -- Line: 66
    if _G.__ANIMAL_BLADE_DEBUG__ then
        warn((("[BladeAnimal] %*"):format(p1)))
    end
end
local v2 = {
    SUCCESSFUL_PARRY_WINDOW_SECONDS = 1,
    NON_SUCCESSFUL_PARRY_WINDOW_SECONDS = 5,
    PARRY_LOCKOUT_AFTER_SWING_END_SECONDS = 0.1,
    INTERIOR_HIT_RADIUS = 6.5,
    TITAN_INTERIOR_HIT_RADIUS = 15,
    TITAN_INTERIOR_SEARCH_RADIUS = 96,
    INTERIOR_HIT_TICK = 0.06666666666666667,
    BLADE_SWING_WALK_SPEED = 16,
    BLADE_EXPANSION_CONTROL_GAP = 1.7,
    FAKE_NAPE_MAX_DISTANCE = 15,
    DEBUG_TITAN_KILL_ZONE_GIZMOS = false,
    DEBUG_TITAN_INTERIOR_LOGS = false,
    WIRE_SPHERE_SEGMENTS = 12,
    WIRE_SPHERE_RINGS = 4,
    GIZMO_UPDATE_INTERVAL = 0.08,
    GIZMO_MAX_DISTANCE = 256,
}
local u483 = Config.define(v2)
local u488 = Color3.fromRGB(120, 200, 255)
local u493 = Color3.fromRGB(80, 255, 120)
local u498 = Color3.fromRGB(255, 100, 100)
local NON_SUCCESSFUL_PARRY_WINDOW_SECONDS = u483.NON_SUCCESSFUL_PARRY_WINDOW_SECONDS
local v3 = {}
function v3.initialized(p1, p2) -- Line: 149 -- upvalues: useFieldOfView (val), u483 (val), Signals (val), u498 (val), Titan (val), u488 (val), u493 (val), State (val), Gear_2 (val), ClientStateHandler (val), States (val), u331 (ref), CollectionService (val), Effects (val), Players (val), Alive (val), Character (val), Blades (val), bladeAnimalDebug (val), ClientAttributesHandler (val), Eradicate (val), CharacterPredictionRunner (val), RunService (val), RaycastHitboxV4 (val), ReplicatedStorage (val), Particles (val), Sounds (val), Gear (val), UserInputService (val), TweenService (val), NON_SUCCESSFUL_PARRY_WINDOW_SECONDS (ref), u461 (val), useAnimatorObserver (val), ClientSettingsHandler (val)
    local getRootModelFromInstance, processBladeHit, u6
    local trove = p2.trove
    local u3 = nil
    _, u6 = useFieldOfView()
    local u7 = {}
    local u8 = {}
    local u9 = {}
    local u10 = 0
    local u11 = 0
    local u12 = 0
    local u13 = {}
    local u14 = nil
    local u15 = {}
    local u16 = nil
    local u17 = nil
    local u18 = nil
    local u19 = false
    local u20 = nil
    local u21 = nil
    local u22 = nil
    local u23 = nil
    local u24 = nil
    local u25 = nil
    local u26 = nil
    local u27 = nil
    local u28 = nil
    local u29 = nil
    local u30 = {}
    local u31 = {}
    local u32 = {}
    local function fmt(p1) -- Line: 206
        if p1 == nil then
            return "-"
        end
        return string.format("%.1f", p1)
    end
    local function fmtBool(p1) -- Line: 218
        if p1 then
            return "Y"
        end
        return "N"
    end
    local function debugSwingConsole(p1, p2) -- Line: 227 -- upvalues: u483 (upval), Signals (upval)
        if not u483.DEBUG_TITAN_KILL_ZONE_GIZMOS then
            return
        end
        local v1 = {message = p1}
        local v2 = p2
        if not v2 then
            v2 = Color3.fromRGB(255, 255, 255)
        end
        v1.color = v2
        Signals.Console:Fire(v1)
    end
    local function debugSwingOnce(p1, p2, p3) -- Line: 244 -- upvalues: u32 (val), debugSwingConsole (val)
        if u32[p1] then
            return
        end
        u32[p1] = true
        debugSwingConsole(p2, p3)
    end
    local function getNamedAttachment(p1, p2) -- Line: 257
        if not p1 then
            return nil
        end
        local v1 = p1:FindFirstChild(p2)
        if not v1 then
            return nil
        end
        if v1:IsA("Attachment") then
            return v1
        end
        return nil
    end
    local function getKillZonePart(p1, p2) -- Line: 275
        local v1 = p1:FindFirstChild(p2)
        if not v1 then
            return nil
        end
        if v1:IsA("BasePart") then
            return v1
        end
        return nil
    end
    local function hasNapeZone(p1) -- Line: 288
        local v1 = if p1.napePart == nil then p1.napeAttachment ~= nil else true
        return v1
    end
    local function hasEyesZone(p1) -- Line: 296
        local v1 = if p1.eyesPart == nil then p1.eyesAttachment ~= nil else true
        return v1
    end
    local function getNapeWorldPosition(p1) -- Line: 304
        if p1.napePart then
            return p1.napePart.Position
        end
        if p1.napeAttachment then
            return p1.napeAttachment.WorldPosition
        end
        return nil
    end
    local function getEyesWorldPosition(p1) -- Line: 319
        if p1.eyesPart then
            return p1.eyesPart.Position
        end
        if p1.eyesAttachment then
            return p1.eyesAttachment.WorldPosition
        end
        return nil
    end
    local function getNapeHitPart(p1) -- Line: 334
        local napePart = p1.napePart
        if not napePart then
            napePart = p1.upperTorso
        end
        return napePart
    end
    local function getEyesHitPart(p1) -- Line: 342
        local eyesPart = p1.eyesPart
        if not eyesPart then
            eyesPart = p1.head
        end
        return eyesPart
    end
    local function getZones(p1) -- Line: 350 -- upvalues: getKillZonePart (val), getNamedAttachment (val)
        local v1, v2
        local Head = p1:FindFirstChild("Head")
        local UpperTorso = p1:FindFirstChild("UpperTorso")
        local v3 = getKillZonePart(p1, "Nape")
        if not v3 then
            v1 = getNamedAttachment(UpperTorso, "Nape")
        else
            v1 = nil
        end
        local v4 = getKillZonePart(p1, "Eyes")
        if not v4 then
            v2 = getNamedAttachment(Head, "Eyes")
        else
            v2 = nil
        end
        return {
            head = Head,
            eyesPart = v4,
            eyesAttachment = v2,
            upperTorso = UpperTorso,
            napePart = v3,
            napeAttachment = v1,
            humanoidRootPart = p1:FindFirstChild("HumanoidRootPart"),
            upperLeftArm = p1:FindFirstChild("LeftUpperArm"),
            upperRightArm = p1:FindFirstChild("RightUpperArm"),
        }
    end
    local function logTitanHitSnapshot(p1, p2) -- Line: 376 -- upvalues: getZones (val), getNapeWorldPosition (val), debugSwingOnce (val), u498 (upval), getEyesWorldPosition (val), Titan (upval), fmtBool (val), fmt (val), u488 (upval)
        local Magnitude_2, v1, v2
        local v3 = getZones(p1)
        local v4 = getNapeWorldPosition(v3)
        if not v4 then
            local v5 = ("snapshot:%*:missing"):format(p1.Name)
            local v6 = ("[Start] %* missing nape (part or attachment)"):format(p1.Name)
            debugSwingOnce(v5, v6, u498)
            return
        end
        local Scale = p1:GetScale()
        local Position = p2.Position
        local Magnitude = (v4 - Position).Magnitude
        local v7 = getEyesWorldPosition(v3)
        if not v7 then
            Magnitude_2 = nil
        else
            Magnitude_2 = (v7 - Position).Magnitude
        end
        local v8 = false
        if v3.humanoidRootPart then
            v1 = Position - v3.humanoidRootPart.Position
            if 0.001 < v1.Magnitude then
                v2 = v3.humanoidRootPart.CFrame.LookVector:Dot(v1.Unit)
                v8 = v2 < -0.15
            end
        end
        if not v8 then
            v1 = Magnitude * 3
        else
            v1 = Magnitude
        end
        v2 = Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER
        local v9 = Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
        local v10 = if v1 >= v9 then if Magnitude_2 ~= nil then if Magnitude_2 <= Magnitude then Magnitude_2 < v2 else false else false else true
        local v11 = if Magnitude >= v9 then if Magnitude_2 ~= nil then Magnitude_2 < v2 else false else true
        local v12 = ("snapshot:%*"):format(p1.Name)
        local v13 = fmtBool(v8)
        local v14 = fmt(Magnitude_2)
        local v15 = fmt(Magnitude)
        local v16 = fmtBool(v10)
        local v17 = ("[Start] %* behind=%* dE=%* dN=%* kill=%* inner=%*"):format(p1.Name, v13, v14, v15, v16, (fmtBool(v11)))
        debugSwingOnce(v12, v17, u488)
    end
    local function logTitanHitOutcome(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) -- Line: 425 -- upvalues: u483 (upval), u493 (upval), u498 (upval), fmtBool (val), fmt (val), debugSwingConsole (val), debugSwingOnce (val)
        local v1, v2
        if not u483.DEBUG_TITAN_KILL_ZONE_GIZMOS then
            return
        end
        if not p1 then
            v1 = "bad"
        else
            v1 = "good"
        end
        if not p1 then
            v2 = u498
        else
            v2 = u493
        end
        local v3 = fmtBool(p6)
        local v4 = fmt(p7)
        local v5 = ("[%*] %* %*/%* | %* | behind=%* dE=%* dN=%*"):format(v1, p3.Name, p4, p5.Name, p2, v3, v4, (fmt(p8)))
        if p9 then
            v5 = v5 .. (" slot=%*"):format(p9)
        end
        if p10 then
            v5 = v5 .. (" : %*"):format(p10)
        end
        if p1 then
            debugSwingConsole(v5, v2)
            return
        end
        local v6 = ("outcome:%*:%*"):format(p3.Name, p2)
        debugSwingOnce(v6, v5, v2)
    end
    local function debugInterior(p1, p2) -- Line: 467 -- upvalues: u31 (val), u483 (upval)
        if u31[p1] == p2 then
            return
        end
        u31[p1] = p2
        if u483.DEBUG_TITAN_INTERIOR_LOGS then
            print((("[Blade Interior:%*] %*"):format(p1.Name, p2)))
        end
    end
    local function clearInteriorDebug() -- Line: 481 -- upvalues: u31 (val), u32 (val)
        table.clear(u31)
        table.clear(u32)
    end
    local function clearKillZoneGizmos() -- Line: 489 -- upvalues: u29 (ref), u28 (ref), u30 (val)
        if u29 then
            u29:Disconnect()
            u29 = nil
        end
        if u28 then
            u28:Destroy()
            u28 = nil
        end
        table.clear(u30)
    end
    local u51 = nil
    local u52 = 0
    local u53 = 0
    local u54 = 0
    local u55 = 0
    local Circle = State("Circle")
    local function beginSwingWindow(p1) -- Line: 517 -- upvalues: u54 (ref), u55 (ref), Gear_2 (upval)
        u54 = u54 + 1
        u55 = u54
        Gear_2.Swing.post(u54)
    end
    function getRootModelFromInstance(p1) -- Line: 525 -- upvalues: getRootModelFromInstance (val)
        if p1:HasTag("Alive") then
            return p1
        end
        if p1.Parent then
            return getRootModelFromInstance(p1.Parent)
        end
        return nil
    end
    local function clearGearSwingState(p1) -- Line: 537 -- upvalues: ClientStateHandler (upval), States (upval), u12 (ref), u483 (upval), u51 (ref)
        ClientStateHandler.updateState(States.GEAR_SWING, false)
        if not p1 then
            u12 = tick() + u483.PARRY_LOCKOUT_AFTER_SWING_END_SECONDS
        end
        if u51 then
            u51()
            u51 = nil
        end
    end
    local function cancelCurrentBladeSwing(p1) -- Line: 551 -- upvalues: trove (val), clearGearSwingState (val), u24 (ref), u25 (ref), u26 (ref), u27 (ref), u23 (ref), u22 (ref), u21 (ref), clearKillZoneGizmos (val), u3 (ref), u19 (ref), u17 (ref), u18 (ref), u20 (ref), p2 (val), u16 (ref), u15 (ref), u7 (ref), u13 (ref), Circle (val), u8 (ref), u9 (val)
        if trove._cleaning then
            return
        end
        clearGearSwingState(p1)
        if u24 then
            task.cancel(u24)
            u24 = nil
        end
        if u25 then
            task.cancel(u25)
            u25 = nil
        end
        if u26 then
            task.cancel(u26)
            u26 = nil
        end
        if u27 then
            task.cancel(u27)
            u27 = nil
        end
        if u23 then
            task.cancel(u23)
            u23 = nil
        end
        if u22 then
            task.cancel(u22)
            u22 = nil
        end
        if u21 then
            u21:Disconnect()
            u21 = nil
        end
        clearKillZoneGizmos()
        if u3 and u19 and u3.HitStop then
            u3:HitStop()
        end
        u19 = false
        if u17 then
            coroutine.close(u17)
            u17 = nil
        end
        if u18 then
            u18:Disconnect()
            u18 = nil
        end
        if u20 then
            u20:Disconnect()
            u20 = nil
        end
        if p2.animation then
            p2.animation:Stop()
        end
        if p2.priority then
            p2.priority:Stop()
        end
        if u16 then
            task.cancel(u16)
            u16 = nil
        end
        local v1 = u15
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if u3 then
                u3:RemoveAttachment(j)
            end
            j:Destroy()
        end
        u15 = {}
        v1 = u7
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            n(TweenInfo.new(0.5, Enum.EasingStyle.Back))
        end
        u7 = {}
        u13 = {}
        Circle(0)
        u8 = {}
        table.clear(u9)
    end
    local function getTitanDamageSlot(p1, p2, p3) -- Line: 653
        if p3 then
            return "Eyes"
        end
        if p2 then
            return "Nape"
        end
        local Name = p1.Name
        if string.find(Name, "Leg", 1, true) then
            if string.sub(Name, 1, 4) == "Left" then
                return "Left Leg"
            end
            if string.sub(Name, 1, 5) == "Right" then
                return "Right Leg"
            end
            if string.find(Name, "Arm", 1, true) then
                if string.sub(Name, 1, 4) == "Left" then
                    return "Left Arm"
                end
                if string.sub(Name, 1, 5) == "Right" then
                    return "Right Arm"
                end
                return nil
            end
            if not (string.find(Name, "Hand", 1, true)) then
                return nil
            end
            if string.sub(Name, 1, 4) == "Left" then
                return "Left Arm"
            end
            if string.sub(Name, 1, 5) == "Right" then
                return "Right Arm"
            end
            return nil
        elseif not (string.find(Name, "Foot", 1, true)) then
        end
    end
    local function hasTitanSlotBeenHit(p1, p2) -- Line: 685 -- upvalues: u9 (val)
        local v1 = u9[p1]
        local v2 = if v1 ~= nil then v1[p2] == true else false
        return v2
    end
    local function markTitanSlotHit(p1, p2) -- Line: 695 -- upvalues: u9 (val)
        local v1 = u9[p1]
        if not v1 then
            u9[p1] = {}
        end
        v1[p2] = true
    end
    local function getNearbyKillZoneModels(p1, p2) -- Line: 709 -- upvalues: u331 (upval), CollectionService (upval)
        local model
        local u2 = {}
        local u81 = {}
        local function addNearbyModel(a1) -- Line: 713 -- upvalues: u2 (val), p1 (val), p2 (val), u81 (val)
            if not a1 or not a1.Parent or u2[a1] or a1:GetAttribute("Disabled") or p2 < (p1 - a1:GetPivot().Position).Magnitude then
                return
            end
            u2[a1] = true
            table.insert(u81, a1)
        end
        local ClientTitanHandler = u331
        if not ClientTitanHandler then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Client = ReplicatedStorage:WaitForChild("Client")
            local Entities = Client:WaitForChild("Entities")
            local Titans = Entities:WaitForChild("Titans")
            ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
        end
        u331 = ClientTitanHandler
        for i, j in u331.getTitans() do
            model = j
            if model then
                model = j.model
                if model then
                    model = j.model.client
                end
            end
            if model and model:HasTag("Titan") then
                addNearbyModel(model)
            end
        end
        for k, n in CollectionService:GetTagged("Shifter") do
            if n:IsA("Model") then
                addNearbyModel(n)
            end
        end
        return u81
    end
    local function getInstanceWorldPosition(p1) -- Line: 750
        if p1:IsA("Attachment") then
            return p1.WorldPosition
        end
        if p1:IsA("BasePart") then
            return p1.Position
        end
        if p1:IsA("Model") then
            return p1:GetPivot().Position
        end
        return nil
    end
    local function getFakeNapeFromHit(p1) -- Line: 766 -- upvalues: CollectionService (upval)
        local Parent = p1
        local v1 = 5
        local v2 = 1
        for i = 1, v1, v2 do
            if not Parent then
                break
            end
            if CollectionService:HasTag(Parent, "FakeNape") then
                return Parent
            end
            Parent = Parent.Parent
        end
        return nil
    end
    local function tryFakeNapeHit(p1, p2) -- Line: 788 -- upvalues: getFakeNapeFromHit (val), u8 (ref), getInstanceWorldPosition (val), u483 (upval), debugSwingOnce (val), fmt (val), u493 (upval), Effects (upval), u52 (ref)
        local v1 = getFakeNapeFromHit(p1)
        if not v1 then
            return false
        end
        if not (table.find(u8, v1)) then
            local v2 = getInstanceWorldPosition(v1)
            if v2 and (v2 - p2.Position).Magnitude <= u483.FAKE_NAPE_MAX_DISTANCE then
                local v3 = ("[✓] FakeNape dist=%*"):format((fmt((v2 - p2.Position).Magnitude)))
                debugSwingOnce("fakenape", v3, u493)
                table.insert(u8, v1)
                Effects.clientEmitEffect("FakeNape", v1, math.random(900, 1900))
                u52 = tick() + 0.4
            end
        end
        return true
    end
    function processBladeHit(p1, a2, p3, p4) -- Line: 817 -- upvalues: u52 (ref), Effects (upval), Players (upval), CollectionService (upval), Alive (upval), Character (upval), Blades (upval), u3 (ref), tryFakeNapeHit (val), getRootModelFromInstance (val), u8 (ref), bladeAnimalDebug (upval), ClientAttributesHandler (upval), getZones (val), getNapeWorldPosition (val), getEyesWorldPosition (val), hasNapeZone (val), Titan (upval), u483 (upval), debugInterior (val), logTitanHitOutcome (val), getTitanDamageSlot (val), hasTitanSlotBeenHit (val), p2 (val), Eradicate (upval), cancelCurrentBladeSwing (val), markTitanSlotHit (val), CharacterPredictionRunner (upval), Gear_2 (upval), u55 (ref)
        local Name
        if tick() < u52 then
            return
        end
        if p1.Name ~= "Nape" then
            local function isFocusable(p1) -- Line: 835 -- upvalues: CollectionService (upval), Players (upval)
                local Parent = p1
                local v1 = 5
                local v2 = 1
                for i = 1, v1, v2 do
                    if not Parent then
                        break
                    end
                    if CollectionService:HasTag(Parent, "Focusable") or Players:GetPlayerFromCharacter(Parent) then
                        return true
                    end
                    Parent = Parent.Parent
                end
                return false
            end
            local function isPlayerGrappleTarget(p1) -- Line: 854 -- upvalues: Players (upval), Alive (upval)
                local Parent = p1
                local v1 = 5
                local v2 = 1
                for i = 1, v1, v2 do
                    if not Parent then
                        break
                    end
                    if Parent:IsA("Model") then
                        if not (Players:GetPlayerFromCharacter(Parent)) and not (Alive.getPlayerFromCharacter(Parent)) then
                            continue
                        end
                        return true
                    end
                    Parent = Parent.Parent
                end
                return false
            end
            local v1 = Character.getCharacter(Players.LocalPlayer)
            if not v1 then
                Blades.warn("No character found while on blade damage")
                return
            end
            local HumanoidRootPart = v1.HumanoidRootPart
            if not HumanoidRootPart then
                return
            else
                if not u3 or tryFakeNapeHit(p1, HumanoidRootPart) then
                    return
                end
                local v2 = p1
                if not v2 then
                    return
                end
                local v3 = getRootModelFromInstance(v2)
                if not v3 then
                    return
                else
                    if v3 == v1 then
                        return
                    end
                    local v4 = v3:HasTag("Titan")
                    if not v4 then
                        v4 = v3:HasTag("Shifter")
                    end
                    local v5 = v3:HasTag("Animal")
                    if v4 then
                        local Magnitude, Magnitude_2, Magnitude_3, Magnitude_4, v6, v7, v8, v9
                        local v10 = ClientAttributesHandler.getAttribute("GearCanMultiHit") == 1
                        local v11 = getZones(v3)
                        local head = v11.head
                        local upperTorso = v11.upperTorso
                        local upperLeftArm = v11.upperLeftArm
                        local upperRightArm = v11.upperRightArm
                        local humanoidRootPart = v11.humanoidRootPart
                        local napePart = v11.napePart
                        local eyesPart = v11.eyesPart
                        local v12 = getNapeWorldPosition(v11)
                        local v13 = getEyesWorldPosition(v11)
                        local v14 = upperTorso
                        if v14 then
                            v14 = if v2 ~= upperTorso then v2:IsDescendantOf(upperTorso) else true
                        end
                        if not v14 then
                            Magnitude = nil
                        elseif upperLeftArm then
                            Magnitude = (upperLeftArm.Position - HumanoidRootPart.Position).Magnitude
                        end
                        if not v14 then
                            Magnitude_2 = nil
                        elseif upperRightArm then
                            Magnitude_2 = (upperRightArm.Position - HumanoidRootPart.Position).Magnitude
                        end
                        local Scale = v3:GetScale()
                        local v15 = head
                        if v15 then
                            v15 = upperLeftArm
                            if v15 then
                                v15 = upperRightArm
                                if v15 then
                                    v15 = hasNapeZone(v11)
                                end
                            end
                        end
                        if not v13 then
                            Magnitude_3 = nil
                        else
                            Magnitude_3 = (v13 - HumanoidRootPart.Position).Magnitude
                        end
                        if not v12 then
                            Magnitude_4 = nil
                        else
                            Magnitude_4 = (v12 - HumanoidRootPart.Position).Magnitude
                        end
                        local v16 = Magnitude_4
                        if p3 then
                            v6 = ("interior(%*)"):format(p4 or "?")
                        elseif not a2 then
                            v6 = "direct"
                        else
                            v6 = "raycast"
                        end
                        local v17 = false
                        if humanoidRootPart then
                            v7 = HumanoidRootPart.Position - humanoidRootPart.Position
                            if 0.001 < v7.Magnitude then
                                v8 = humanoidRootPart.CFrame.LookVector:Dot(v7.Unit)
                                v17 = v8 < -0.15
                            end
                        end
                        if not p3 and not v17 and Magnitude_4 then
                            Magnitude_4 = Magnitude_4 * 3
                        end
                        v7 = if head ~= nil then if p1 ~= head then p1:IsDescendantOf(head) else true else false
                        v8 = if eyesPart ~= nil then p1 == eyesPart else false
                        local v18 = if napePart ~= nil then p1 == napePart else false
                        local v19 = false
                        if upperTorso then
                            if p1 == upperTorso then
                                v19 = true
                            elseif p1.Parent == upperTorso then
                                local Name_2 = p1.Name
                                if not (string.find(Name_2, "Arm", 1, true)) and not (string.find(Name_2, "Hand", 1, true)) then
                                    v19 = true
                                end
                            end
                        end
                        local v20 = Magnitude_3
                        if v20 then
                            v20 = Magnitude_4
                            if v20 then
                                v20 = if Magnitude_3 <= Magnitude_4 then Magnitude_3 < Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER else false
                            end
                        end
                        local v21 = Magnitude_4
                        if v21 then
                            v21 = Magnitude_4 < Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
                        end
                        local v22 = nil
                        local v23 = nil
                        local v24 = nil
                        local v25 = nil
                        if a2 then
                            local Magnitude_5, Magnitude_6
                            if not v13 then
                                Magnitude_5 = nil
                            else
                                Magnitude_5 = (v13 - a2.Position).Magnitude
                            end
                            v22 = Magnitude_5
                            if not v12 then
                                Magnitude_6 = nil
                            else
                                Magnitude_6 = (v12 - a2.Position).Magnitude
                            end
                            v23 = Magnitude_6
                            if not v17 and v23 then
                                v23 = v23 * 3
                            end
                            v9 = v22
                            if v9 then
                                v9 = v23
                                if v9 then
                                    v9 = if v22 <= v23 then v22 < Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER else false
                                end
                            end
                            v25 = v9
                            v9 = v23
                            if v9 then
                                v9 = v23 < Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
                            end
                            v24 = v9
                        end
                        v9 = Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER
                        local v26 = Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
                        local v27 = if v21 ~= true then v24 == true else true
                        local v28 = if v20 ~= true then v25 == true else true
                        local v29 = false
                        if v28 then
                            if not v22 then
                                if not Magnitude_3 then
                                    v29 = true
                                elseif Magnitude_4 then
                                    v29 = Magnitude_3 <= Magnitude_4
                                end
                            elseif v23 then
                                v29 = v22 <= v23
                            end
                        end
                        if not p3 then
                            if p3 and p4 == "nape" and Magnitude_4 and Magnitude_4 < v26 then
                                v27 = true
                                v29 = false
                            end
                        elseif p4 == "eyes" and Magnitude_3 and Magnitude_3 < v9 then
                            v28 = true
                            v29 = true
                        end
                        local v30 = v21
                        if not v30 then
                            v30 = v20
                            if not v30 then
                                v30 = v24
                                if not v30 then
                                    v30 = v25
                                    if not v30 then
                                        if not p3 then
                                            v30 = p3
                                            if v30 then
                                                v30 = false
                                                if p4 == "nape" then
                                                    v30 = Magnitude_4
                                                    if v30 then
                                                        v30 = Magnitude_4 < v26
                                                    end
                                                end
                                            end
                                        elseif p4 == "eyes" and Magnitude_3 then
                                            v30 = true
                                            if Magnitude_3 < v9 then end
                                        end
                                    end
                                end
                            end
                        end
                        if not v15 then
                            local v31 = v27
                            if v31 then
                                v31 = not v29
                            end
                            local v32 = nil
                            if not v15 then
                                if not v15 then
                                    if not v15 then
                                        table.insert(u8, v3)
                                    elseif not v15 then
                                        local v33 = if p1.Name:find("Arm", 1, true) == nil then p1.Name:find("Hand", 1, true) ~= nil else true
                                        if p2.stance ~= "Burst" then
                                            local Magnitude_7
                                            if v32 then
                                                markTitanSlotHit(v3, v32)
                                            elseif not v10 and not v4 then
                                                table.insert(u8, v3)
                                            end
                                            local left = p2.grapples.left
                                            if left then
                                                left = p2.grapples.left.hit
                                            end
                                            local right = p2.grapples.right
                                            if right then
                                                right = p2.grapples.right.hit
                                            end
                                            local v34 = isFocusable(left)
                                            if not v34 then
                                                v34 = isFocusable(right)
                                            end
                                            local v35 = v3:HasTag("Character")
                                            if not v35 then
                                                v35 = Alive.getPlayerFromCharacter(v3)
                                            end
                                            local v36 = isPlayerGrappleTarget(left)
                                            if not v36 then
                                                v36 = isPlayerGrappleTarget(right)
                                            end
                                            local v37 = ClientAttributesHandler.getAttribute("IgnoreUngrappleOnHit") == 1
                                            local v38 = v34 or v35
                                            if v37 then
                                                if v35 then
                                                    v38 = false
                                                elseif not v36 then
                                                end
                                            end
                                            if v38 then
                                                p2.signals.ungrapple:Fire("Left")
                                                p2.signals.ungrapple:Fire("Right")
                                            end
                                            local v39 = CharacterPredictionRunner.getHighestVelocityOverTime(1)
                                            if not v39 then
                                                Magnitude_7 = nil
                                            else
                                                Magnitude_7 = v39.Magnitude
                                            end
                                            if not v15 then
                                                if v5 then
                                                    local FullName = v3:GetFullName()
                                                    local FullName_2 = v2:GetFullName()
                                                    bladeAnimalDebug((("POST hit=%* part=%* id=%* damagePath=server"):format(FullName, FullName_2, (tostring(v3:GetAttribute("id"))))))
                                                end
                                                if v4 then
                                                    logTitanHitOutcome(true, "hit sent", v3, v6, p1, v17, Magnitude_3, v16, v32, v2.Name)
                                                end
                                                local v40 = {
                                                    charge = 1,
                                                    hit = v3,
                                                    part = v2,
                                                    name = v2.Name,
                                                    shifter = v3:HasTag("Shifter"),
                                                    titan = v3:HasTag("Titan"),
                                                    id = v3:GetAttribute("id"),
                                                    swingId = u55,
                                                    distanceFromEyes = Magnitude_3,
                                                    distanceFromNape = Magnitude_4,
                                                    distanceFromEyesBlade = v22,
                                                    distanceFromNapeBlade = v23,
                                                    moveDirection = HumanoidRootPart.AssemblyLinearVelocity,
                                                }
                                                local Magnitude_8 = Magnitude_7
                                                if not Magnitude_8 then
                                                    Magnitude_8 = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
                                                end
                                                v40.velocity = Magnitude_8
                                                Gear_2.Damage.unreliablePost(v40)
                                                return
                                            elseif v4 and not v32 then
                                                if v4 then
                                                    logTitanHitOutcome(false, "no damage slot", v3, v6, p1, v17, Magnitude_3, v16, nil, nil)
                                                end
                                                return
                                            end
                                        elseif ClientAttributesHandler.getAttribute("HasEradicate") == 1 and v33 and Eradicate.activated(v3, p1, a2) then
                                            cancelCurrentBladeSwing()
                                            return
                                        end
                                    elseif not v4 then
                                        if table.find(u8, p1) then
                                            return
                                        end
                                        table.insert(u8, p1)
                                    end
                                elseif Magnitude_4 then
                                    if not v29 then
                                        if not v29 then
                                            if napePart then
                                                v2 = napePart
                                            elseif Magnitude_4 >= Scale then
                                                if not Magnitude then
                                                    if Magnitude_2 and Magnitude_2 < Scale then
                                                        v2 = upperRightArm
                                                    end
                                                elseif Magnitude < Scale then
                                                    v2 = upperLeftArm
                                                end
                                            elseif head then
                                                v2 = head
                                            end
                                        elseif head then
                                            v2 = head
                                        end
                                    elseif eyesPart then
                                        v2 = eyesPart
                                    end
                                    if not v4 then
                                        table.insert(u8, v2)
                                    end
                                end
                            elseif v4 then
                                v32 = getTitanDamageSlot(p1, v31, v28 and v29)
                                if v32 and hasTitanSlotBeenHit(v3, v32) then
                                    logTitanHitOutcome(false, "slot already hit", v3, v6, p1, v17, Magnitude_3, v16, v32, nil)
                                    return
                                end
                            end
                        elseif v4 then
                            if v7 then
                                if not v30 then
                                    if u483.DEBUG_TITAN_INTERIOR_LOGS and v4 then
                                        local v41 = tostring(v20)
                                        local v42 = tostring(v21)
                                        debugInterior(v3, (("processBladeHit rejected: outside kill zone (eyes=%* nape=%* part=%*)"):format(v41, v42, p1.Name)))
                                    end
                                    if v4 then
                                        logTitanHitOutcome(false, "outside kill zone", v3, v6, p1, v17, Magnitude_3, v16, nil, nil)
                                    end
                                    return
                                end
                            elseif not v19 and not v18 and not v8 then
                            end
                        end
                    elseif table.find(u8, v3) then
                        if v5 then
                            Name = v3.Name
                            bladeAnimalDebug((("SKIP duplicate hit on %* id=%*"):format(Name, (tostring(v3:GetAttribute("id"))))))
                        end
                        return
                    end
                end
            end
        elseif p1.Parent and p1.Parent.Name == "Dummy" then
            Effects.emitClientEffect("Dummy", p1, Players.LocalPlayer, 10)
            return
        end
    end
    local function tryInteriorKillZoneHit(p1, p2) -- Line: 1260 -- upvalues: getZones (val), getNapeWorldPosition (val), getNapeHitPart (val), debugInterior (val), hasEyesZone (val), hasTitanSlotBeenHit (val), getEyesWorldPosition (val), getEyesHitPart (val), Titan (upval), processBladeHit (val)
        local v1 = getZones(p1)
        local v2 = getNapeWorldPosition(v1)
        local v3 = getNapeHitPart(v1)
        if not v2 then
            debugInterior(p1, "skipped: missing nape/head")
            return
        elseif not v3 then
            debugInterior(p1, "skipped: missing nape/head")
            return
        else
            if not v1.head then
                debugInterior(p1, "skipped: missing nape/head")
                return
            end
            local v4 = not hasEyesZone(v1)
            if not v4 then
                v4 = hasTitanSlotBeenHit(p1, "Eyes")
            end
            if not (hasTitanSlotBeenHit(p1, "Nape")) then
                local Magnitude, v5
                local v6 = getEyesWorldPosition(v1)
                local v7 = getEyesHitPart(v1)
                if not v6 then
                    Magnitude = nil
                else
                    Magnitude = (v6 - p2.Position).Magnitude
                end
                local Magnitude_2 = (v2 - p2.Position).Magnitude
                local Scale = p1:GetScale()
                local v8 = Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER
                local v9 = Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
                local v10 = if Magnitude ~= nil then Magnitude < v8 else false
                local v11 = Magnitude_2 < v9
                if v10 then
                    local v12, v13, v14
                    if not v10 then
                        v12 = v3
                        v13 = Magnitude_2
                        v5 = "nape"
                    elseif not v7 then
                        v12 = v3
                        v13 = Magnitude_2
                        v5 = "nape"
                    elseif not Magnitude then
                        v12 = v3
                        v13 = Magnitude_2
                        v5 = "nape"
                    elseif not v11 then
                        v12 = v7
                        v13 = Magnitude
                        v5 = "eyes"
                    elseif Magnitude > Magnitude_2 then
                        v12 = v3
                        v13 = Magnitude_2
                        v5 = "nape"
                    else
                        v12 = v7
                        v13 = Magnitude
                        v5 = "eyes"
                    end
                    local v15 = string.format("%.1f", v13)
                    debugInterior(p1, (("inside inner via %* dist=%* -> processBladeHit(%*)"):format(v5, v15, v12.Name)))
                    if v5 ~= "eyes" then
                        v14 = "nape"
                    else
                        v14 = "eyes"
                    end
                    processBladeHit(v12, nil, true, v14)
                    return
                elseif not v11 then
                    local v16
                    v5 = "outside inner (eyes=%* nape=%* need eyes<%* nape<%*)"
                    if not Magnitude then
                        v16 = "n/a"
                    else
                        v16 = string.format("%.1f", Magnitude)
                        if not v16 then
                            v16 = "n/a"
                        end
                    end
                    local v17 = string.format("%.1f", Magnitude_2)
                    local v18 = string.format("%.1f", v8)
                    debugInterior(p1, (v5:format(v16, v17, v18, (string.format("%.1f", v9)))))
                    return
                end
            elseif v4 then
                return
            end
        end
    end
    local function createKillZoneDebugLabel(p1) -- Line: 1319
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Name = "KillZoneLabel"
        BillboardGui.Size = UDim2.fromOffset(280, 120)
        BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Adornee = p1
        BillboardGui.Parent = p1
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "Text"
        TextLabel.Size = UDim2.fromScale(1, 1)
        TextLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        TextLabel.BackgroundTransparency = 0.25
        TextLabel.BorderSizePixel = 0
        TextLabel.Font = Enum.Font.Code
        TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
        TextLabel.TextSize = 13
        TextLabel.TextWrapped = true
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextYAlignment = Enum.TextYAlignment.Top
        TextLabel.Parent = BillboardGui
        return TextLabel
    end
    local function createWireframeSphere(p1, p2, p3) -- Line: 1347 -- upvalues: u483 (upval)
        local Attachment, Beam, v1, v2
        local Folder = Instance.new("Folder")
        Folder.Name = p2
        Folder.Parent = p1
        local Part = Instance.new("Part")
        Part.Name = "Hub"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.CastShadow = false
        Part.Transparency = 1
        Part.Size = Vector3.one * 0.1
        Part.Parent = Folder
        local v3 = {}
        local WIRE_SPHERE_SEGMENTS = u483.WIRE_SPHERE_SEGMENTS
        local WIRE_SPHERE_RINGS = u483.WIRE_SPHERE_RINGS
        local v4 = 1
        local v5 = p3
        for i = 1, WIRE_SPHERE_RINGS, v4 do
            v3[i] = {}
            v1 = WIRE_SPHERE_SEGMENTS
            v2 = 1
            for j = 1, v1, v2 do
                Attachment = Instance.new("Attachment")
                Attachment.Name = ("R%*S%*"):format(i, j)
                Attachment.Parent = Part
                v3[i][j] = Attachment
            end
            v1 = WIRE_SPHERE_SEGMENTS
            v2 = 1
            for k = 1, v1, v2 do
                Beam = Instance.new("Beam")
                Beam.Name = ("R%*B%*"):format(i, k)
                Beam.Attachment0 = v3[i][k]
                Beam.Attachment1 = v3[i][k % WIRE_SPHERE_SEGMENTS + 1]
                Beam.FaceCamera = true
                Beam.Width0 = 0.08
                Beam.Width1 = 0.08
                Beam.Color = ColorSequence.new(v5)
                Beam.Transparency = NumberSequence.new(0.1)
                Beam.Parent = Folder
            end
        end
        return {hub = Part, attachments = v3}
    end
    local function setWireframeSphere(p1, p2, p3) -- Line: 1409 -- upvalues: u483 (upval)
        local lastCenter = p1.lastCenter
        local lastRadius = p1.lastRadius
        if not lastCenter then
            local v1, v2, v3, v4
            p1.lastCenter = p2
            p1.lastRadius = p3
            p1.hub.CFrame = CFrame.new(p2)
            local WIRE_SPHERE_SEGMENTS = u483.WIRE_SPHERE_SEGMENTS
            local v5 = WIRE_SPHERE_SEGMENTS
            local v6 = 1
            for i = 1, v5, v6 do
                v4 = (i - 1) / WIRE_SPHERE_SEGMENTS * math.pi * 2
                v1 = math.cos(v4) * p3
                v2 = math.sin(v4) * p3
                v3 = p1.attachments[1][i]
                v3.Position = Vector3.new(v1, 0, v2)
                v3 = p1.attachments[2][i]
                v3.Position = Vector3.new(0, v1, v2)
            end
            return
        elseif lastRadius then
            local v7 = math.abs(lastRadius - p3)
            if v7 < 0.05 and (lastCenter - p2).Magnitude < 0.05 then
                return
            end
        end
    end
    local function getOrCreateTitanKillZoneGizmos(p1, p2) -- Line: 1449 -- upvalues: u30 (val), createWireframeSphere (val), createKillZoneDebugLabel (val)
        local v1 = u30[p1]
        if v1 then
            return v1
        end
        local Folder = Instance.new("Folder")
        Folder.Name = ("%*_KillZones"):format(p1.Name)
        Folder.Parent = p2
        local Part = Instance.new("Part")
        Part.Name = "LabelAnchor"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.CastShadow = false
        Part.Transparency = 1
        Part.Size = Vector3.one * 0.2
        Part.Parent = Folder
        local v2 = {
            folder = Folder,
            labelAnchor = Part,
            eyesHitbox = createWireframeSphere(Folder, "EyesHitbox", Color3.fromRGB(80, 255, 200)),
            napeClientHitbox = createWireframeSphere(Folder, "NapeHitbox", Color3.fromRGB(255, 180, 60)),
            eyesInterior = createWireframeSphere(Folder, "EyesInterior", Color3.fromRGB(200, 140, 255)),
            napeInterior = createWireframeSphere(Folder, "NapeInterior", Color3.fromRGB(200, 140, 255)),
        }
        createKillZoneDebugLabel(Part)
        u30[p1] = v2
        return v2
    end
    local function beginKillZoneGizmos(p1) -- Line: 1496 -- upvalues: u483 (upval), clearKillZoneGizmos (val), u28 (ref), u29 (ref), RunService (upval), Character (upval), Players (upval), getNearbyKillZoneModels (val), getZones (val), getNapeWorldPosition (val), getOrCreateTitanKillZoneGizmos (val), Titan (upval), setWireframeSphere (val), getEyesWorldPosition (val), hasEyesZone (val), u30 (val)
        if not u483.DEBUG_TITAN_KILL_ZONE_GIZMOS then
            return
        end
        clearKillZoneGizmos()
        local Folder = Instance.new("Folder")
        Folder.Name = "BladeKillZoneDebug"
        Folder.Parent = workspace
        u28 = Folder
        local u10 = 0
        u29 = RunService.Heartbeat:Connect(function() -- Line: 1510 -- upvalues: u10 (ref), u483 (upval), Character (upval), Players (upval), u28 (upval), getNearbyKillZoneModels (upval), getZones (upval), getNapeWorldPosition (upval), getOrCreateTitanKillZoneGizmos (upval), Titan (upval), setWireframeSphere (upval), getEyesWorldPosition (upval), hasEyesZone (upval), u30 (upval)
            local KillZoneLabel, Magnitude, Magnitude_2, Scale, Text, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
            local v24 = tick()
            local v25 = v24 - u10
            if v25 < u483.GIZMO_UPDATE_INTERVAL then
                return
            end
            u10 = v24
            v25 = Character.getCharacter(Players.LocalPlayer)
            local HumanoidRootPart = v25
            if HumanoidRootPart then
                HumanoidRootPart = v25:FindFirstChild("HumanoidRootPart")
            end
            local v26 = u28
            if not HumanoidRootPart or not v26 then
                return
            end
            local v27 = {}
            local Position = HumanoidRootPart.Position
            for i, j in getNearbyKillZoneModels(Position, u483.GIZMO_MAX_DISTANCE) do
                v27[j] = true
                v1 = getZones(j)
                v2 = getNapeWorldPosition(v1)
                if v2 then
                    v3 = getOrCreateTitanKillZoneGizmos(j, v26)
                    Scale = j:GetScale()
                    v4 = Scale * Titan.Constants.NAPE_PROTECTION_MULTIPLIER
                    setWireframeSphere(v3.napeClientHitbox, v2, v4)
                    setWireframeSphere(v3.napeInterior, v2, v4)
                    Magnitude = (v2 - Position).Magnitude
                    v5 = false
                    if v1.humanoidRootPart then
                        v6 = HumanoidRootPart.Position - v1.humanoidRootPart.Position
                        if 0.001 < v6.Magnitude then
                            v7 = v1.humanoidRootPart.CFrame.LookVector:Dot(v6.Unit)
                            v5 = v7 < -0.15
                        end
                    end
                    v6 = Magnitude
                    if not v5 then
                        v6 = v6 * 3
                    end
                    v7 = v6 < v4
                    v8 = Magnitude < v4
                    Magnitude_2 = nil
                    v9 = nil
                    v10 = false
                    v11 = false
                    v12 = v2
                    v13 = getEyesWorldPosition(v1)
                    if not v13 then
                        v3.eyesHitbox.hub.Parent = nil
                        v3.eyesInterior.hub.Parent = nil
                    else
                        v14 = Scale * Titan.Constants.EYES_PROTECTION_MULTIPLIER
                        v9 = v14
                        v12 = v13
                        setWireframeSphere(v3.eyesHitbox, v13, v14)
                        setWireframeSphere(v3.eyesInterior, v13, v14)
                        v3.eyesHitbox.hub.Parent = v3.folder
                        v3.eyesInterior.hub.Parent = v3.folder
                        Magnitude_2 = (v13 - Position).Magnitude
                        v15 = if Magnitude_2 <= Magnitude then Magnitude_2 < v14 else false
                        v10 = v15
                        v11 = Magnitude_2 < v14
                    end
                    v14 = math.max(Scale * 1.8, (v9 or v4) + 2)
                    v3.labelAnchor.CFrame = CFrame.new(v12 + Vector3.new(0, v14, 0))
                    KillZoneLabel = v3.labelAnchor:FindFirstChild("KillZoneLabel")
                    Text = KillZoneLabel
                    if Text then
                        Text = KillZoneLabel:FindFirstChild("Text")
                    end
                    if Text then
                        v16 = {}
                        v19 = string.format("%.2f", v4)
                        v20 = tostring(v7)
                        v17 = ("[Kill Nape] r=%* in=%* eff=%*"):format(v19, v20, (string.format("%.1f", v6)))
                        v18 = ("[Inner] nape=%*"):format((tostring(v8)))
                        v21 = string.format("%.1f", Magnitude)
                        v16[1] = v17
                        v16[2] = v18
                        v16[3] = (("dist nape=%* behind=%*"):format(v21, (tostring(v5))))
                        if hasEyesZone(v1) and Magnitude_2 and v9 then
                            v22 = string.format("%.2f", v9)
                            table.insert(v16, 1, (("[Kill Eyes] r=%* in=%*"):format(v22, (tostring(v10)))))
                            table.insert(v16, 3, (("[Inner] eyes=%*"):format((tostring(v11)))))
                            v22 = string.format("%.1f", Magnitude_2)
                            if Magnitude_2 >= Magnitude then
                                v23 = "nape"
                            else
                                v23 = "eyes"
                            end
                            table.insert(v16, 5, (("dist eyes=%* closer=%*"):format(v22, v23)))
                        end
                        Text.Text = table.concat(v16, "\n")
                    end
                end
            end
            local v28 = u30
            local v29 = nil
            local v30 = nil
            for k, n in v28, v29, v30 do
                if not (v27[k]) then
                    n.folder:Destroy()
                    u30[k] = nil
                elseif k.Parent then
                end
            end
        end)
        task.delay(p1 + 0.1, clearKillZoneGizmos)
    end
    local function onBeginInteriorHitbox(p1) -- Line: 1632 -- upvalues: ClientAttributesHandler (upval), clearInteriorDebug (val), Character (upval), Alive (upval), Players (upval), getNearbyKillZoneModels (val), u483 (upval), debugSwingOnce (val), u55 (ref), u488 (upval), logTitanHitSnapshot (val), CollectionService (upval), u21 (ref), u22 (ref), RunService (upval), u52 (ref), Blades (upval), processBladeHit (val), tryInteriorKillZoneHit (val), tryFakeNapeHit (val)
        local HumanoidRootPart, Position, v1, v2, v3
        local v4 = p1 * ClientAttributesHandler.getAttribute("BladeHitWindowMultiplier")
        clearInteriorDebug()
        local function getNearbyPlayers(p1) -- Line: 1639 -- upvalues: Character (upval), Alive (upval), Players (upval)
            local v1
            local v2 = {}
            local v3 = Character.getCharacter()
            if not v3 then
                return v2
            end
            for i, j in Alive.getPlayers() do
                if j ~= Players.LocalPlayer then
                    v1 = Alive.getAliveCharacter(j)
                    if v1 and (v3:GetPivot().Position - v1:GetPivot().Position).Magnitude < p1 then
                        table.insert(v2, v1)
                    end
                end
            end
            return v2
        end
        v1 = Character.getCharacter(Players.LocalPlayer)
        if not v1 then
            Position = Vector3.zero
        else
            Position = v1:GetPivot().Position
        end
        local u23 = getNearbyPlayers(1024)
        local u29 = getNearbyKillZoneModels(Position, u483.TITAN_INTERIOR_SEARCH_RADIUS)
        if u483.DEBUG_TITAN_INTERIOR_LOGS then
            v3 = #u29
            print((("[Blade Interior] swing started: cached %* kill-zone targets within %* studs"):format(v3, u483.TITAN_INTERIOR_SEARCH_RADIUS)))
        end
        if u483.DEBUG_TITAN_KILL_ZONE_GIZMOS then
            local v5 = ("swing:%*"):format(u55)
            v2 = ("[Swing #%*] %*s | %* targets %* players"):format(u55, v4, #u29, #u23)
            debugSwingOnce(v5, v2, u488)
            local v6 = Character.getCharacter(Players.LocalPlayer)
            HumanoidRootPart = v6
            if HumanoidRootPart then
                HumanoidRootPart = v6:FindFirstChild("HumanoidRootPart")
            end
            if HumanoidRootPart then
                v2 = u29
                v3 = nil
                local v7 = nil
                for i, j in v2, v3, v7 do
                    if j and j.Parent then
                        logTitanHitSnapshot(j, HumanoidRootPart)
                    end
                end
            end
        end
        local Tagged = CollectionService:GetTagged("FakeNape")
        if u21 then
            u21:Disconnect()
            u21 = nil
        end
        if u22 then
            task.cancel(u22)
            u22 = nil
        end
        local u108 = 0
        u21 = RunService.RenderStepped:Connect(function(p1) -- Line: 1716 -- upvalues: u108 (ref), u483 (upval), u52 (upval), Character (upval), Players (upval), Blades (upval), u23 (val), processBladeHit (upval), u29 (val), tryInteriorKillZoneHit (upval), Tagged (val), tryFakeNapeHit (upval)
            local PrimaryPart
            u108 = u108 + p1
            if u108 < u483.INTERIOR_HIT_TICK then
                return
            end
            u108 = 0
            if tick() < u52 then
                return
            end
            local v1 = Character.getCharacter(Players.LocalPlayer)
            if not v1 then
                Blades.error("No character found while on blade damage").color("red")
                return
            end
            local HumanoidRootPart = v1.HumanoidRootPart
            if not HumanoidRootPart then
                return
            end
            local v2 = u23
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if j and j.Parent then
                    PrimaryPart = j:FindFirstChild("HumanoidRootPart")
                    if not PrimaryPart then
                        PrimaryPart = j.PrimaryPart
                    end
                    if PrimaryPart and (HumanoidRootPart.Position - PrimaryPart.Position).Magnitude < u483.INTERIOR_HIT_RADIUS then
                        processBladeHit(PrimaryPart)
                    end
                end
            end
            v2 = u29
            v3 = nil
            v4 = nil
            for k, n in v2, v3, v4 do
                if n and n.Parent and u483.TITAN_INTERIOR_SEARCH_RADIUS >= (HumanoidRootPart.Position - n:GetPivot().Position).Magnitude then
                    tryInteriorKillZoneHit(n, HumanoidRootPart)
                end
            end
            v2 = Tagged
            v3 = nil
            v4 = nil
            for m, i5 in v2, v3, v4 do
                if i5 and i5.Parent then
                    tryFakeNapeHit(i5, HumanoidRootPart)
                end
            end
        end)
        u22 = task.delay(v4, function() -- Line: 1782 -- upvalues: u22 (upval), u21 (upval)
            u22 = nil
            if u21 then
                u21:Disconnect()
                u21 = nil
            end
        end)
    end
    local function onTrackBladeDamage() -- Line: 1793 -- upvalues: u3 (ref), processBladeHit (val), trove (val), u8 (ref), u9 (val)
        local u5 = u3.OnHit:Connect(function(p1, p2, p3) -- Line: 1795 -- upvalues: processBladeHit (upval)
            processBladeHit(p1, p3)
        end)
        trove:Add(function() -- Line: 1800 -- upvalues: u5 (val), u8 (upval), u9 (upval)
            u5:Disconnect()
            u8 = {}
            table.clear(u9)
        end)
    end
    local function recreateHitbox() -- Line: 1807 -- upvalues: Character (upval), Players (upval), trove (val), Blades (upval), u3 (ref), RaycastHitboxV4 (upval), onTrackBladeDamage (val)
        local v1
        local v2 = Character.getCharacter(Players.LocalPlayer)
        if not v2 or trove._cleaning then
            Blades.error("No character found while recreating hitbox").color("red")
            return
        end
        if not u3 then
            u3 = RaycastHitboxV4.new(v2)
            v1 = RaycastParams.new()
            v1.IgnoreWater = true
            v1.FilterType = Enum.RaycastFilterType.Exclude
            v1.CollisionGroup = "Blades"
            v1.FilterDescendantsInstances = {Players.LocalPlayer.Character}
            if u3 then
                u3.DetectionMode = RaycastHitboxV4.DetectionMode.PartMode
                u3.RaycastParams = v1
            end
            onTrackBladeDamage()
            return
        end
        if u3.HitStart then
            return
        end
        u3 = RaycastHitboxV4.new(v2)
        v1 = RaycastParams.new()
        v1.IgnoreWater = true
        v1.FilterType = Enum.RaycastFilterType.Exclude
        v1.CollisionGroup = "Blades"
        v1.FilterDescendantsInstances = {Players.LocalPlayer.Character}
        if u3 then
            u3.DetectionMode = RaycastHitboxV4.DetectionMode.PartMode
            u3.RaycastParams = v1
        end
        onTrackBladeDamage()
    end
    local function onExpandBladeHitbox(p1, a2) -- Line: 1839 -- upvalues: Character (upval), u3 (ref), trove (val), Blades (upval), p2 (val), u14 (ref), u483 (upval), u15 (ref), u16 (ref)
        local u4 = Character.getCharacter()
        if not u3 or not u4 or trove._cleaning then
            Blades.error("No character found while expanding blade hitbox").color("red")
            return
        end
        if p2.bladeExpansion == p1 then
            return
        end
        local function findDamagePointParent() -- Line: 1851 -- upvalues: u14 (upval), u4 (val)
            if not u14 then
                local DmgPoint = u4:FindFirstChild("DmgPoint", true)
                if DmgPoint and DmgPoint:IsA("Attachment") then
                    u14 = DmgPoint.Parent
                end
            end
            return u14
        end
        local v1 = u15
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            u3:RemoveAttachment(j)
            j:Destroy()
        end
        u15 = {}
        p2.bladeExpansion = p1
        if u16 then
            task.cancel(u16)
        end
        if a2 then
            u16 = task.delay(a2, function() -- Line: 1909 -- upvalues: u15 (upval), u3 (upval)
                local v1 = u15
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    u3:RemoveAttachment(j)
                    j:Destroy()
                end
                u15 = {}
            end)
        end
        v1 = p1
        v2 = 1
        for k = 1, v1, v2 do
            (function(p1) -- Line: 1866 -- upvalues: findDamagePointParent (val), u483 (upval), u3 (upval), u15 (upval)
                local v1, v2
                local v3 = findDamagePointParent()
                local Attachment = Instance.new("Attachment")
                Attachment.Name = "DmgPoint"
                local BLADE_EXPANSION_CONTROL_GAP = u483.BLADE_EXPANSION_CONTROL_GAP
                if p1 % 2 ~= 0 then
                    v1 = -(p1 + 1)
                else
                    v1 = p1 + 1
                end
                if p1 % 2 ~= 0 then
                    v2 = -BLADE_EXPANSION_CONTROL_GAP
                else
                    v2 = BLADE_EXPANSION_CONTROL_GAP
                    if not v2 then
                        v2 = -BLADE_EXPANSION_CONTROL_GAP
                    end
                end
                Attachment.Position = Vector3.new(v2, v1, 4 + p1 * BLADE_EXPANSION_CONTROL_GAP)
                Attachment.Parent = v3
                u3:AddAttachment(Attachment)
                table.insert(u15, Attachment)
            end)(k)
        end
    end
    local function onBladeDamageAttempt(p1) -- Line: 1929 -- upvalues: u3 (ref), u23 (ref), u8 (ref), u9 (val), clearInteriorDebug (val), u19 (ref), recreateHitbox (val), onBeginInteriorHitbox (val), beginKillZoneGizmos (val)
        if not u3 then
            return
        end
        if u23 then
            task.cancel(u23)
            u23 = nil
        end
        u8 = {}
        table.clear(u9)
        clearInteriorDebug()
        u19 = true
        if not u3 then
            recreateHitbox()
        elseif not u3.HitStart then
            recreateHitbox()
        end
        u3:HitStart()
        onBeginInteriorHitbox(p1)
        beginKillZoneGizmos(p1)
        u23 = task.delay(p1, function() -- Line: 1954 -- upvalues: u23 (upval), u19 (upval), u3 (upval)
            u23 = nil
            u19 = false
            if u3 and u3.HitStop then
                u3:HitStop()
            end
        end)
    end
    local function onBladeLungeCharge() -- Line: 1966 -- upvalues: Character (upval), Players (upval), trove (val), Blades (upval), ReplicatedStorage (upval), Particles (upval), Sounds (upval), Gear (upval)
        local v1 = Character.getCharacter(Players.LocalPlayer)
        if not v1 or trove._cleaning then
            Blades.warn("No character found while on blade lunge charge")
            return
        end
        local HumanoidRootPart = v1.HumanoidRootPart
        local unit = (Players.LocalPlayer:GetMouse().Hit.Position - HumanoidRootPart.Position).unit
        local u25 = ReplicatedStorage.Assets.Particles.Gear.Charging:Clone()
        u25.Parent = HumanoidRootPart
        Particles.deepEmitParticles(u25)
        task.delay(3, function() -- Line: 1987 -- upvalues: u25 (val)
            u25:Destroy()
        end)
        local BodyVelocity = HumanoidRootPart:FindFirstChildWhichIsA("BodyVelocity")
        Sounds.playGlobalSoundEffect(Gear.Charged, 0.1, 1.2)
        if not BodyVelocity then
            HumanoidRootPart.AssemblyLinearVelocity = unit * (math.clamp((HumanoidRootPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude, 150, 700) * 1.175) * 1.15
            return
        end
        HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity + unit * 300
        BodyVelocity.Velocity = BodyVelocity.Velocity + unit * 300
    end
    local function onBladeChargeAttempt(p1, p2, p3) -- Line: 2011 -- upvalues: u13 (ref), ClientAttributesHandler (upval), u17 (ref), u10 (ref), Sounds (upval), Gear (upval), Circle (val), u7 (ref), u6 (val), UserInputService (upval), TweenService (upval), onBladeLungeCharge (val), u26 (ref), u27 (ref), onBladeDamageAttempt (val), trove (val), clearGearSwingState (val), u18 (ref)
        p1:AdjustSpeed(0)
        local u7 = nil
        u13 = {}
        local u10 = tick()
        local LengthPerBladeCharge = ClientAttributesHandler.getAttribute("LengthPerBladeCharge")
        local u19 = LengthPerBladeCharge * ClientAttributesHandler.getAttribute("LengthPerBladeChargeMultiplier")
        u17 = coroutine.create(function() -- Line: 2026 -- upvalues: u13 (upval), u10 (upval), p3 (val), u7 (ref), Sounds (upval), Gear (upval), Circle (upval), u7 (upval), u6 (upval), u19 (ref)
            local v1 = tostring(u13)
            u10 = tick()
            local v2 = p3
            local v3 = 1
            for i = 1, v2, v3 do
                if tostring(u13) ~= v1 then
                    break
                end
                u7 = Sounds.playGlobalSoundEffect(Gear.ChargeUp, 0.05, i * 0.3 + 0.5)
                u7.Pitch = i * 0.2 + 0.7
                Circle(i * 50)
                table.insert(u7, u6("charge", i * 15, "add", i + 4, TweenInfo.new(u19 / 2)))
                task.wait(u19 / 2)
                if i == p3 - 1 then
                    Sounds.playGlobalSoundEffect(Gear.MaxCharge, 0.1, 1.2)
                end
                task.wait(u19 / 2)
            end
        end)
        coroutine.resume(u17)
        local u26 = nil
        u26 = UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 2058 -- upvalues: p1 (val), u26 (ref), u17 (upval), u7 (ref), TweenService (upval), u10 (val), onBladeLungeCharge (upval), u7 (upval), u13 (upval), Circle (upval), u26 (upval), u27 (upval), onBladeDamageAttempt (upval), p2 (val), trove (upval), clearGearSwingState (upval)
            if a2 then
                return
            end
            if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                p1:AdjustSpeed(1)
                u26:Disconnect()
                if u17 then
                    coroutine.close(u17)
                end
                if u7 then
                    local v1 = TweenInfo.new(0.2)
                    TweenService:Create(u7, v1, {Volume = 0}):Play()
                end
                local v2 = tick() - u10
                if 1 < v2 then
                    onBladeLungeCharge()
                end
                if u7 then
                    v2 = #u7
                    if 0 < v2 then
                        for k, v in pairs(u7) do
                            v(TweenInfo.new(0.5, Enum.EasingStyle.Back))
                        end
                        u7 = {}
                    end
                end
                u13 = {}
                Circle(0)
                if u26 then
                    task.cancel(u26)
                    u26 = nil
                end
                if u27 then
                    task.cancel(u27)
                    u27 = nil
                end
                u26 = task.delay(0.07, function() -- Line: 2101 -- upvalues: u26 (upval), onBladeDamageAttempt (upval)
                    u26 = nil
                    onBladeDamageAttempt(0.25)
                end)
                u27 = task.spawn(function() -- Line: 2106 -- upvalues: p2 (upval), u27 (upval), trove (upval), clearGearSwingState (upval)
                    task.wait(p2 - 0.15)
                    u27 = nil
                    if trove._cleaning then
                        return
                    end
                    clearGearSwingState()
                end)
            end
        end)
        u18 = u26
        trove:Add(u26)
        trove:Add(function() -- Line: 2119 -- upvalues: Circle (upval), u17 (upval)
            Circle(0)
            if u17 then
                coroutine.close(u17)
            end
        end)
    end
    local function onCanUseBladeAction(p1) -- Line: 2131 -- upvalues: Gear_2 (upval), Players (upval), ClientAttributesHandler (upval), ClientStateHandler (upval)
        local v1 = Gear_2.Gear.get(Players.LocalPlayer)
        if v1.blades ~= 1 or v1.handles ~= 1 or v1.durability == 0 or ClientAttributesHandler.getAttribute("HasTitanGrabCounter") == 1 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE, p1) or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_SLASHING, p1) then
            return false
        end
        return true
    end
    local function onBladeParry() -- Line: 2156 -- upvalues: onCanUseBladeAction (val), States (upval), u12 (ref), u11 (ref), NON_SUCCESSFUL_PARRY_WINDOW_SECONDS (upval), cancelCurrentBladeSwing (val), ClientStateHandler (upval), Gear_2 (upval), u483 (upval)
        local v1 = {States.GEAR_SWING}
        if not (onCanUseBladeAction(v1)) or tick() < u12 then
            return
        end
        v1 = tick() - u11
        if v1 < NON_SUCCESSFUL_PARRY_WINDOW_SECONDS then
            return
        end
        cancelCurrentBladeSwing(true)
        ClientStateHandler.updateState(States.PARRYING, true)
        Gear_2.Parry.post(1)
        u11 = tick()
        NON_SUCCESSFUL_PARRY_WINDOW_SECONDS = u483.NON_SUCCESSFUL_PARRY_WINDOW_SECONDS
        task.delay(0.35, function() -- Line: 2182 -- upvalues: ClientStateHandler (upval), States (upval)
            ClientStateHandler.updateState(States.PARRYING, false)
        end)
    end
    local function onSimulateBladeSwing(p1) -- Line: 2191 -- upvalues: Character (upval), Players (upval), trove (val), Blades (upval), u3 (ref), recreateHitbox (val), beginSwingWindow (val), Effects (upval), onBladeDamageAttempt (val)
        local v1 = Character.getCharacter(Players.LocalPlayer)
        if not v1 or trove._cleaning then
            Blades.warn("No character found while on simulate blade swing")
            return
        end
        if v1:GetAttribute("Grabbed") then
            return
        end
        if u3 then
            Character.isGrounded(v1)
            beginSwingWindow(false)
            Effects.sendReplicatedEffect("Swing")
            onBladeDamageAttempt(p1)
            return
        end
        recreateHitbox()
        if not u3 then
            return warn("Failed to recreate hitbox while on blade swing")
        end
        Character.isGrounded(v1)
        beginSwingWindow(false)
        Effects.sendReplicatedEffect("Swing")
        onBladeDamageAttempt(p1)
    end
    local function onBladeSwing() -- Line: 2227 -- upvalues: onCanUseBladeAction (val), Character (upval), Players (upval), trove (val), Blades (upval), u3 (ref), recreateHitbox (val), ClientStateHandler (upval), States (upval), u53 (ref), u51 (ref), u461 (upval), u483 (upval), p2 (val), useAnimatorObserver (upval), ClientAttributesHandler (upval), u24 (ref), u25 (ref), Effects (upval), beginSwingWindow (val), onBladeDamageAttempt (val), clearGearSwingState (val), UserInputService (upval), u18 (ref), u20 (ref), u10 (ref), onBladeChargeAttempt (val)
        if not (onCanUseBladeAction()) then
            return
        end
        local u6 = Character.getCharacter(Players.LocalPlayer)
        if not u6 then
            Blades.warn("No character found while on blade swing")
            return
        else
            if trove._cleaning then
                Blades.warn("No character found while on blade swing")
                return
            end
            if u6:GetAttribute("Grabbed") then
                return
            end
            if u3 then
                local v1, v2
                ClientStateHandler.updateState(States.GEAR_SWING, true)
                u53 = u53 + 1
                if u51 then
                    u51()
                end
                u51 = u461("blade_swing", u483.BLADE_SWING_WALK_SPEED, "set", 100)
                local v3 = u53 % 2 == 0
                Character.isGrounded(u6)
                if not false then
                    v2 = "Air"
                else
                    v2 = "Ground"
                end
                if not v3 then
                    v1 = 2
                else
                    v1 = 1
                end
                if p2.animation then
                    p2.animation:Stop(0.1)
                end
                local u85 = useAnimatorObserver.play(p2.getAnimations().Blades.Swings[v2][v1], 0.15, Enum.AnimationPriority.Action4)
                if not u85 then
                    return
                end
                p2.priority = u85
                u85:AdjustSpeed(1 * ClientAttributesHandler.getAttribute("BladeSwingMultiplier"))
                while true do
                    task.wait()
                    if 0 < u85.Length then
                        break
                    end
                end
                local TimeOfKeyframe = u85:GetTimeOfKeyframe("Freeze")
                local u106 = u85.Length - TimeOfKeyframe
                local function onBasicBladeSwing(p1) -- Line: 2295 -- upvalues: Character (upval), u24 (upval), u25 (upval), Effects (upval), u6 (val), beginSwingWindow (upval), onBladeDamageAttempt (upval), u106 (val), trove (upval), clearGearSwingState (upval)
                    if not (Character.isActive()) then
                        return
                    end
                    if u24 then
                        task.cancel(u24)
                        u24 = nil
                    end
                    if u25 then
                        task.cancel(u25)
                        u25 = nil
                    end
                    Effects.sendReplicatedEffect("Swing")
                    Character.isGrounded(u6)
                    local u22 = false
                    beginSwingWindow(u22)
                    local v1 = 0.01 + (p1 or 0)
                    u24 = task.delay(v1, function() -- Line: 2319 -- upvalues: u24 (upval), onBladeDamageAttempt (upval)
                        u24 = nil
                        onBladeDamageAttempt(0.65)
                    end)
                    u25 = task.spawn(function() -- Line: 2324 -- upvalues: u106 (upval), u22 (ref), u25 (upval), trove (upval), clearGearSwingState (upval)
                        local v1
                        if not u22 then
                            v1 = -0.3
                        else
                            v1 = 0.1
                        end
                        task.wait(u106 + v1)
                        u25 = nil
                        if trove._cleaning then
                            return
                        end
                        clearGearSwingState()
                    end)
                end
                local function onHoldBasicBladeSwing() -- Line: 2336 -- upvalues: u85 (val), UserInputService (upval), ClientAttributesHandler (upval), onBasicBladeSwing (val), u18 (upval), trove (upval)
                    u85:AdjustSpeed(0)
                    local u5 = nil
                    u5 = UserInputService.InputEnded:Connect(function(p1) -- Line: 2340 -- upvalues: u85 (upval), ClientAttributesHandler (upval), u5 (ref), onBasicBladeSwing (upval)
                        if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                            u85:AdjustSpeed(1 * ClientAttributesHandler.getAttribute("BladeSwingMultiplier"))
                            u5:Disconnect()
                            onBasicBladeSwing()
                        end
                    end)
                    u18 = u5
                    trove:Add(u5)
                end
                if u20 then
                    u20:Disconnect()
                end
                local v4 = u85.KeyframeReached:Once(function() -- Line: 2359 -- upvalues: ClientAttributesHandler (upval), UserInputService (upval), u10 (upval), onBladeChargeAttempt (upval), u85 (val), u106 (val), onHoldBasicBladeSwing (val), onBasicBladeSwing (val)
                    local MaximumBladeCharges = ClientAttributesHandler.getAttribute("MaximumBladeCharges")
                    if not (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)) then
                        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                            onHoldBasicBladeSwing()
                            return
                        end
                        onBasicBladeSwing()
                        return
                    end
                    local v1 = tick() - u10
                    if 2 >= v1 then
                        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                            onHoldBasicBladeSwing()
                            return
                        end
                        onBasicBladeSwing()
                        return
                    end
                    if 0 < MaximumBladeCharges then
                        onBladeChargeAttempt(u85, u106, MaximumBladeCharges)
                        return
                    end
                    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                        onHoldBasicBladeSwing()
                        return
                    end
                    onBasicBladeSwing()
                end)
                u20 = v4
                trove:Add(v4)
                return
            else
                recreateHitbox()
                if not u3 then
                    Blades.error("Failed to recreate hitbox while on blade swing").color("red")
                    return
                end
            end
        end
    end
    trove:Add(ClientSettingsHandler.onKeybindPressed("Blade Parry"):Connect(function() -- Line: 2383 -- upvalues: p2 (val), ClientAttributesHandler (upval), onBladeParry (val)
        if p2.busy() or not p2.enabled or ClientAttributesHandler.getAttribute("GearCanBlock") ~= 1 then
            return
        end
        onBladeParry()
    end))
    trove:Add(p2.signals.setBladeExpansion:Connect(function(p1, p2) -- Line: 2396 -- upvalues: onExpandBladeHitbox (val)
        onExpandBladeHitbox(p1, p2)
    end))
    trove:Add(UserInputService.InputBegan:Connect(function(p1, a2) -- Line: 2401 -- upvalues: p2 (val), onBladeSwing (val)
        if p2.busy() or a2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        if p2.handles then
            return onBladeSwing()
        end
    end))
    trove:Add(function() -- Line: 2411 -- upvalues: clearKillZoneGizmos (val), u3 (ref), u51 (ref)
        clearKillZoneGizmos()
        if u3 and u3.Destroy then
            u3:Destroy()
        end
        if u51 then
            u51()
            u51 = nil
        end
    end)
    trove:Add(Gear_2.SuccessfulParry.listen(function() -- Line: 2424 -- upvalues: NON_SUCCESSFUL_PARRY_WINDOW_SECONDS (upval), u483 (upval)
        NON_SUCCESSFUL_PARRY_WINDOW_SECONDS = u483.SUCCESSFUL_PARRY_WINDOW_SECONDS
    end))
    trove:Add(Gear_2.ResetParryCooldown.listen(function() -- Line: 2428 -- upvalues: u11 (ref), NON_SUCCESSFUL_PARRY_WINDOW_SECONDS (upval), u483 (upval)
        u11 = 0
        NON_SUCCESSFUL_PARRY_WINDOW_SECONDS = u483.NON_SUCCESSFUL_PARRY_WINDOW_SECONDS
    end))
    trove:Add(p2.signals.simulateBladeSwing:Connect(function(p1) -- Line: 2433 -- upvalues: onSimulateBladeSwing (val)
        onSimulateBladeSwing(p1)
    end))
    trove:Add(p2.signals.cancelBladeSwing:Connect(cancelCurrentBladeSwing))
end
return v3