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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Ejector.Default
--                               Dumped in 0.0245 seconds
--                          Bytecode version 9  |  53 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Gear = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Effects_2 = Common_7:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_8:WaitForChild("Utilities")
require(Utilities_3:WaitForChild("Signal"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Signals = require(Common_9:WaitForChild("Signals"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Network_2 = Common_10:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Gear_2 = require(Namespaces_2:WaitForChild("Gear"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Types = Common_11:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_4 = Common_12:WaitForChild("Utilities")
local Character = require(Utilities_4:WaitForChild("Character"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_14:WaitForChild("Common")
local Types_2 = Common_13:WaitForChild("Types")
require(Types_2:WaitForChild("Gear"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_15:WaitForChild("Common")
local Utilities_5 = Common_14:WaitForChild("Utilities")
local Tinkers = require(Utilities_5:WaitForChild("Tinkers"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_16:WaitForChild("Common")
local Utilities_6 = Common_15:WaitForChild("Utilities")
local Gear_3 = require(Utilities_6:WaitForChild("Gear"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_17:WaitForChild("Common")
local Utilities_7 = Common_16:WaitForChild("Utilities")
local Water = require(Utilities_7:WaitForChild("Water"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_17 = ReplicatedStorage_18:WaitForChild("Common")
local Statistics = Common_17:WaitForChild("Statistics")
local useCameraTilt = require(Statistics:WaitForChild("useCameraTilt"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_18 = ReplicatedStorage_19:WaitForChild("Common")
local Statistics_2 = Common_18:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_19 = ReplicatedStorage_20:WaitForChild("Common")
local Statistics_3 = Common_19:WaitForChild("Statistics")
local useJumpPower = require(Statistics_3:WaitForChild("useJumpPower"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Common_20 = ReplicatedStorage_21:WaitForChild("Common")
local Statistics_4 = Common_20:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_4:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Common_21 = ReplicatedStorage_22:WaitForChild("Common")
local Animations = Common_21:WaitForChild("Animations")
local Gear_4 = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Common_22 = ReplicatedStorage_23:WaitForChild("Common")
local Observers = Common_22:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Common_23 = ReplicatedStorage_24:WaitForChild("Common")
local Utilities_8 = Common_23:WaitForChild("Utilities")
local Particles = require(Utilities_8:WaitForChild("Particles"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_25:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_26:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local Character_2 = User_3:WaitForChild("Character")
local CharacterInjuryHandler = require(Character_2:WaitForChild("CharacterInjuryHandler"))
local ReplicatedStorage_27 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_27:WaitForChild("Client")
local User_4 = Client_4:WaitForChild("User")
local Character_3 = User_4:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_3:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_28 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_28:WaitForChild("Client")
local Progression = Client_5:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_29 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_29:WaitForChild("Client")
local User_5 = Client_6:WaitForChild("User")
local State_3 = User_5:WaitForChild("State")
local ClientStatusHandler = require(State_3:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_30 = game:GetService("ReplicatedStorage")
local Common_24 = ReplicatedStorage_30:WaitForChild("Common")
local Animations_2 = Common_24:WaitForChild("Animations")
local Proficiencies = require(Animations_2:WaitForChild("Proficiencies"))
local ReplicatedStorage_31 = game:GetService("ReplicatedStorage")
local Common_25 = ReplicatedStorage_31:WaitForChild("Common")
local Utilities_9 = Common_25:WaitForChild("Utilities")
local Raycast = require(Utilities_9:WaitForChild("Raycast"))
local v2 = {
    CAMERA_TILT_SPEED = 0.7,
    CAMERA_TILT_AMOUNT = 10,
    FIELD_OF_VIEW_SPEED = 1,
    BASE_FIELD_OF_VIEW = 20,
    GAS_FIELD_OF_VIEW = 15,
    TOTAL_TIME_FOR_MAX_VELOCITY = 55,
    MAXIMUM_VELOCITY_MULTIPLIER = 1.65,
    BASE_SPEED = 60,
    BASE_GAS_BOOST = 40,
    MAX_VELOCITY_BASE_SPEED_MULTIPLIER = 1.3,
    BASE_SPEED_MULTIPLIER = 1,
    BASE_REEL_BOOST = 15,
    MAX_VELOCITY_REEL_BOOST = 30,
    BASE_REEL_BOOST_GAS = 10,
    MAX_VELOCITY_REEL_BOOST_GAS = 15,
    VELOCITY_GAIN_INCREASE_GAS_REEL = 1.5,
    TOTAL_TIME_FOR_MAX_GAS = 1,
    DIVE_VELOCITY_THRESHOLD = -10,
    VELOCITY_GAIN_INCREASE_DIVE = 1.05,
    HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER = 1.1,
    DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER = 1.1,
    DOUBLE_TIME_VELOCITY_MULTIPLIER = 1.05,
    BLADELESS_VELOCITY_INCREASE_MULTIPLIER = 1.1,
    BLADLESS_MAX_VELOCITY_MULTIPLIER = 1.1,
    OVERTUNED_VELOCITY_INCREASE_MULTIPLIER = 1.2,
    OVERTUNED_GAS_THRESHOLD = 0.8,
    WALL_HANG_CONFIRM_DURATION = 0.1,
    WALL_HANG_DECAY_PER_SECOND = 1,
    FLAT_SPEED_INCREASE_PER_LEVEL = 3,
    BASE_SPEED_INCREASE_PER_LEVEL = 0.1,
    GAS_SPEED_INCREASE_PER_LEVEL = 0.11,
    VELOCITY_GAIN_SPEED_INCREASE_PER_LEVEL = 1.45,
    BASE_REEL_INCREASE_PER_LEVEL = 1.15,
    GEAR_RELEASE_TERMINAL_FALL_SPEED = 200,
    GEAR_RELEASE_GRAVITY_SCALE = 0.65,
    PVP_FAR_GRAPPLE_DISTANCE = 350,
    PVP_CLOSE_GRAPPLE_DISTANCE = 30,
    JOUSTING_SLOWDOWN_MAXIMUM = 160,
    JOUSTING_SLOWDOWN_MINIMUM = -5,
    PVP_TURN_REDUCTION_EFFECT_SCALE = 0.3,
}
local u680 = Config.define(v2)
local ReplicatedStorage_32 = game:GetService("ReplicatedStorage")
local Common_26 = ReplicatedStorage_32:WaitForChild("Common")
local Gear_5 = require(Common_26:WaitForChild("Logger"))("Gear")
local u699 = 0
local u700 = false
local u701 = nil
local u702 = nil
return {
    initialized = function(p1, p2) -- Line: 180 -- upvalues: u680 (val), ClientAttributesHandler (val), useFieldOfView (val), useCameraTilt (val), Server (val), Constants (val), ClientStateHandler (val), States (val), Gear_3 (val), Tinkers (val), Character (val), Gear_5 (val), Signals (val), Particles (val), Raycast (val), useAnimatorObserver (val), Gear_4 (val), Water (val), ClientSettingsHandler (val), UserInputService (val), Sounds (val), Gear (val), RunService (val), TweenService (val), ClientStatusHandler (val), CharacterRagdollHandler (val), CharacterInjuryHandler (val), u701 (ref), u702 (ref), u700 (ref), Proficiencies (val), Effects (val), u699 (ref), useWalkSpeed (val), useJumpPower (val), Number (val), Players (val), Gear_2 (val)
        local u53, u56
        local trove = p2.trove
        local u3 = nil
        local u4 = nil
        local u5 = nil
        local u6 = nil
        local u7 = nil
        local u8 = nil
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = "GearVelocity"
        local u13 = nil
        local u14 = nil
        local u15 = nil
        local u16 = false
        local u17 = 0
        local u18 = false
        local u19 = 0
        local TOTAL_TIME_FOR_MAX_VELOCITY = u680.TOTAL_TIME_FOR_MAX_VELOCITY
        local MAXIMUM_VELOCITY_MULTIPLIER = u680.MAXIMUM_VELOCITY_MULTIPLIER
        local TOTAL_TIME_FOR_MAX_GAS = u680.TOTAL_TIME_FOR_MAX_GAS
        local u26 = 0
        local u27 = nil
        local u28 = nil
        local u29 = nil
        local u30 = nil
        local u31 = nil
        local u32 = 0
        local u33 = nil
        local u34 = "Both"
        local u35 = "Default"
        local u41 = ClientAttributesHandler.getAttribute("HasGasEmergency") == 1
        local function hasSkilledPilot() -- Line: 239 -- upvalues: ClientAttributesHandler (upval)
            local v1 = ClientAttributesHandler.getAttribute("HasSkilledPilot") == 1
            return v1
        end
        local u43 = false
        local u44 = false
        local u45 = {ThreeQuarters = false, Half = false, Quarter = false, Eighth = false}
        local u46 = 100
        local u47 = false
        local u48 = nil
        local u49 = nil
        local u50 = nil
        _, u53 = useFieldOfView()
        _, u56 = useCameraTilt()
        local BodyForce = Instance.new("BodyForce")
        local v1 = workspace.Gravity * 3
        BodyForce.Force = Vector3.new(0, v1, 0)
        local function normalizeAlpha(p1, p2, p3) -- Line: 275
            return p2 + (p3 - p2) * p1
        end
        local function onHandleGasReductionStep(p1) -- Line: 282 -- upvalues: Server (upval), Constants (upval), ClientStateHandler (upval), States (upval), Gear_3 (upval), p2 (val), Tinkers (upval), u16 (ref), ClientAttributesHandler (upval), Character (upval), trove (val), Gear_5 (upval), u45 (val), u44 (ref), u41 (val), u43 (ref), Signals (upval), Particles (upval), u47 (ref), u46 (ref)
            if Server.Store.client().event ~= 0 then
                local v1
                if ClientStateHandler.isStateBusy(States.WALL_HANGING) then
                    return
                end
                local v2 = Gear_3.getComponentLevel(p2, "Canisters")
                local v3 = Tinkers.getModifierConfig("Gas Capacity")
                local v4 = Gear_3.getTinkerModifierMultiplier(p2, "Gas Capacity", v3, v2)
                local v5 = p2.gasConsumption * v4
                if u16 then
                    v5 = v5 + p2.gasBoostingConsumption
                    v1 = ClientAttributesHandler.getAttribute("HasPropulsionExpert") == 1
                    if v1 then
                        v5 = v5 * 0.95
                    end
                end
                v1 = Character.getCharacter()
                if not v1 then
                    Gear_5.warn("No character found while on gas reduction step")
                    return
                else
                    if trove._cleaning then
                        Gear_5.warn("No character found while on gas reduction step")
                        return
                    end
                    p2.useGas(v5 * p1, true)
                    local v6 = math.floor(p2.gas / p2.maxGas * 100)
                    local v7 = ClientAttributesHandler.getAttribute("HasOmnipotentGasUpdates") == 1
                    local v8 = ClientAttributesHandler.getAttribute("GetGasUpdates") == 1
                    if 3 * p2.maxGas / 4 <= p2.gas then
                        u45.ThreeQuarters = false
                        u45.Half = false
                        u45.Quarter = false
                        u45.Eighth = false
                    end
                    if 0 < p2.gas then
                        u44 = false
                    end
                    if p2.gas <= 0 then
                        if not u41 then
                            local EjectorParticle = v1
                            if EjectorParticle then
                                EjectorParticle = v1:FindFirstChild("EjectorParticle", true)
                            end
                            if EjectorParticle then
                                Particles.deepDisableParticles(EjectorParticle)
                            end
                            p2.signals.ungrapple:Fire("Left")
                            p2.signals.ungrapple:Fire("Right")
                            p2.boosting = false
                            p2.signals.boosting:Fire(false)
                            u45.ThreeQuarters = false
                            u45.Half = false
                            u45.Quarter = false
                            u45.Eighth = false
                            u47 = false
                        elseif not u43 and ClientAttributesHandler.getAttribute("HasToggleTank") == 0 then
                            u43 = true
                            p2.gas = p2.maxGas * 0.15
                            Signals.Monologue:Fire("I'm using my reserves, I should find some gas soon.")
                        end
                        if u44 or p2.gas > 0 then
                            return
                        end
                        u44 = true
                        Signals.OnGasDepleted:Fire()
                        return
                    end
                    if v7 then
                        if not u47 then
                            u46 = v6
                            u47 = true
                            return
                        end
                        if 90 < v6 then
                            u46 = v6
                            return
                        end
                        local v9 = {
                            90,
                            80,
                            70,
                            60,
                            50,
                            40,
                            30,
                            20,
                            10,
                        }
                        local v10 = nil
                        local v11 = nil
                        for i, j in v9, v10, v11 do
                            if j < u46 and v6 <= j then
                                Signals.Monologue:Fire(string.format("My gas is at %d percent.", v6))
                                break
                            end
                        end
                        u46 = v6
                        return
                    end
                    if p2.gas > 3 * p2.maxGas / 4 then
                        if p2.gas > p2.maxGas / 2 then
                            if p2.gas > p2.maxGas / 4 or not v8 or v7 then
                                if p2.gas <= p2.maxGas / 8 and v8 and not v7 and not u45.Eighth then
                                    u45.Eighth = true
                                    Signals.Monologue:Fire("Almost out.")
                                end
                                return
                            end
                            if not u45.Quarter then
                                u45.Quarter = true
                                Signals.Monologue:Fire("Quarter left.")
                                return
                            end
                            if p2.gas <= p2.maxGas / 8 and v8 and not v7 and not u45.Eighth then
                                u45.Eighth = true
                                Signals.Monologue:Fire("Almost out.")
                            end
                            return
                        elseif v8 and not v7 and not u45.Half then
                            u45.Half = true
                            Signals.Monologue:Fire("I'm at half gas.")
                            return
                        end
                    elseif v8 and not v7 and not u45.ThreeQuarters then
                        u45.ThreeQuarters = true
                        Signals.Monologue:Fire("I have three quarters gas left.")
                        return
                    end
                end
            elseif not Constants.IsSupporterPlace then
                return
            end
        end
        local function onHandleGasBoostingParticles(p1) -- Line: 427 -- upvalues: Character (upval), trove (val), Gear_5 (upval), u16 (ref), hasSkilledPilot (val), u48 (ref), u53 (val), u680 (upval), p2 (val), Particles (upval)
            local v1 = Character.getCharacter()
            if not v1 then
                Gear_5.warn("No character found while on gas boosting particles")
                return
            else
                if trove._cleaning then
                    Gear_5.warn("No character found while on gas boosting particles")
                    return
                end
                local EjectorParticle = v1
                if EjectorParticle then
                    EjectorParticle = v1:FindFirstChild("EjectorParticle", true)
                end
                if not p1 then
                    if not p1 and u16 then
                        if u48 then
                            u48(TweenInfo.new(1))
                            u48 = nil
                        end
                        p2.boosting = false
                        p2.signals.boosting:Fire(false)
                        if EjectorParticle then
                            Particles.deepDisableParticles(EjectorParticle)
                        end
                    end
                    return
                elseif not u16 then
                    if not (hasSkilledPilot()) and not u48 then
                        u48 = u53("gas", u680.GAS_FIELD_OF_VIEW, "add", 4, TweenInfo.new(u680.FIELD_OF_VIEW_SPEED / 2))
                    end
                    p2.boosting = true
                    p2.signals.boosting:Fire(true)
                    if not EjectorParticle then
                        return
                    end
                    Particles.deepEnableParticles(EjectorParticle)
                    return
                end
            end
        end
        local function onGetMutualGrappleTarget() -- Line: 474 -- upvalues: p2 (val)
            local isGrappledToClient, v1, v2, v3, v4, v5, v6
            local u2 = p2.getGrappleServerData()
            if not u2 then
                return false
            end
            if #u2.grappled_to.Left ~= 0 then
                function isGrappledToClient(p1) -- Line: 484 -- upvalues: u2 (val)
                    local part, part_2, v1, v2, v3
                    local v4 = p1
                    local v5 = nil
                    local v6 = nil
                    for i, j in v4, v5, v6 do
                        if j.player then
                            for k, v in pairs(u2.grappled_by) do
                                v1 = v
                                v2 = nil
                                v3 = nil
                                for k2, n in v1, v2, v3 do
                                    if n.player == j.player then
                                        part = j.part
                                        if part then
                                            part = j.part.Position
                                        end
                                        part_2 = j.part
                                        if part_2 then
                                            part_2 = j.part.AssemblyLinearVelocity
                                        end
                                        return true, part, part_2
                                    end
                                end
                            end
                        end
                    end
                    return false
                end
                v1, v2, v3 = isGrappledToClient(u2.grappled_to.Left)
                v4, v5, v6 = isGrappledToClient(u2.grappled_to.Right)
                if not v1 then
                    if v4 then
                        return true, v2 or v5, v3 or v6
                    end
                    return false
                end
                return true, v2 or v5, v3 or v6
            end
            if #u2.grappled_to.Right == 0 then
                return false
            end
            function isGrappledToClient(p1) -- Line: 484 -- upvalues: u2 (val)
                local part, part_2, v1, v2, v3
                local v4 = p1
                local v5 = nil
                local v6 = nil
                for i, j in v4, v5, v6 do
                    if j.player then
                        for k, v in pairs(u2.grappled_by) do
                            v1 = v
                            v2 = nil
                            v3 = nil
                            for k2, n in v1, v2, v3 do
                                if n.player == j.player then
                                    part = j.part
                                    if part then
                                        part = j.part.Position
                                    end
                                    part_2 = j.part
                                    if part_2 then
                                        part_2 = j.part.AssemblyLinearVelocity
                                    end
                                    return true, part, part_2
                                end
                            end
                        end
                    end
                end
                return false
            end
            v1, v2, v3 = isGrappledToClient(u2.grappled_to.Left)
            v4, v5, v6 = isGrappledToClient(u2.grappled_to.Right)
            if v1 or v4 then
                return true, v2 or v5, v3 or v6
            end
            return false
        end
        local function onGetDistanceFromAliveTarget() -- Line: 521 -- upvalues: Character (upval), trove (val), Gear_5 (upval), p2 (val)
            local v1 = Character.getCharacter()
            if not v1 then
                Gear_5.warn("No character found while on get distance from alive target")
                return false, 0
            else
                if trove._cleaning then
                    Gear_5.warn("No character found while on get distance from alive target")
                    return false, 0
                end
                local v2 = p2.getGrappleServerData()
                if not v2 then
                    return false, 0
                elseif #v2.grappled_to.Left ~= 0 then
                    local v3 = v2.grappled_to.Left[1]
                    if not v3 then
                        v3 = v2.grappled_to.Right[1]
                    end
                    if not v3 then
                        return false, 0
                    end
                    local character = v3.character
                    local HumanoidRootPart = character
                    if HumanoidRootPart then
                        HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    end
                    if not HumanoidRootPart or HumanoidRootPart:HasTag("Titan") or HumanoidRootPart:HasTag("Shifter") then
                        return false, 0
                    end
                    if not character then
                        return true, (HumanoidRootPart.Position - v1.HumanoidRootPart.Position).Magnitude
                    end
                    if character:HasTag("Shifter") then
                        return false, 0
                    end
                    return true, (HumanoidRootPart.Position - v1.HumanoidRootPart.Position).Magnitude
                elseif #v2.grappled_to.Right == 0 then
                    return false, 0
                end
            end
        end
        local function _getCharacterMass() -- Line: 559 -- upvalues: Character (upval), trove (val)
            local v1 = Character.getCharacter()
            if not v1 or trove._cleaning then
                return 0
            end
            local v2 = 0
            for i, j in v1:GetDescendants() do
                if j:IsA("BasePart") and not j.Massless then
                    v2 = v2 + j.AssemblyMass
                end
            end
            return v2
        end
        local function onCancelWallHanging() -- Line: 578 -- upvalues: Character (upval), ClientStateHandler (upval), States (upval), u30 (ref), u31 (ref), u32 (ref), u33 (ref)
            local v1 = Character.getCharacter()
            if v1 then
                v1.Humanoid.PlatformStand = false
                v1.Humanoid.AutoRotate = true
                v1.HumanoidRootPart.Anchored = false
            end
            ClientStateHandler.updateState(States.WALL_HANGING, false)
            u30 = nil
            u31 = nil
            u32 = 0
            if u33 then
                u33:Stop(0.2)
                u33 = nil
            end
            return false
        end
        local function onHandleWallHanging(p1, a2) -- Line: 607 -- upvalues: Character (upval), trove (val), u32 (ref), onCancelWallHanging (val), u30 (ref), u31 (ref), BodyVelocity (val), Raycast (upval), ClientStateHandler (upval), States (upval), u680 (upval), p2 (val), useAnimatorObserver (upval), Gear_4 (upval), u33 (ref)
            local u4 = Character.getCharacter()
            if not u4 or trove._cleaning then
                u32 = 0
                return false
            end
            if ClientStateHandler.isStateBusy(States.WALL_HANGING) then
                return (function() -- Line: 614 -- upvalues: u4 (val), trove (upval), onCancelWallHanging (upval), u30 (upval), u31 (upval), p1 (val), BodyVelocity (upval)
                    if not u4 or trove._cleaning or not u30 or not u31 or 15 < (p1 - u4.HumanoidRootPart.Position).Magnitude then
                        return onCancelWallHanging()
                    end
                    BodyVelocity.Parent = nil
                    u4.Humanoid.PlatformStand = true
                    u4.Humanoid.AutoRotate = false
                    local v1 = u30 + u31 * 2
                    u4.HumanoidRootPart.Anchored = true
                    local v2 = CFrame.new(v1, v1 + u31)
                    local v3 = math.rad(180)
                    local v4 = v2 * CFrame.Angles(0, v3, 0)
                    u4.HumanoidRootPart.CFrame = u4.HumanoidRootPart.CFrame:Lerp(v4, 0.1)
                    return true
                end)()
            end
            local Unit = (p1 - u4.HumanoidRootPart.Position).Unit
            if Unit ~= Unit or Unit.Magnitude == 0 or not ((function() -- Line: 650 -- upvalues: u4 (val), trove (upval), Raycast (upval), p1 (val), u30 (upval), u31 (upval)
    local v1, v2, v3, v4
    if not u4 then
        return false
    elseif not trove._cleaning then
        v2 = {
            x = 1.2,
            y = 5,
            totalSuccessfulPoints = 4,
            maximumDistance = 15,
            spacing = 0.5,
            camera = false,
        }
        v2.direction = (p1 - u4.HumanoidRootPart.Position).Unit
        v1, v2, v3 = Raycast.checkForWallInfront(v2)
        u30 = v2
        u31 = v3
        if v1 == true then
            v4 = true
        else
            v4 = false
        end
        return v4
    else
        return false
    end
end)()) then
                u32 = math.max(0, u32 - u680.WALL_HANG_DECAY_PER_SECOND * a2)
                return false
            end
            u32 = math.min(u680.WALL_HANG_CONFIRM_DURATION, u32 + a2)
            if u32 < u680.WALL_HANG_CONFIRM_DURATION then
                return false
            end
            if p2.animation then
                p2.animation:Stop(0.2)
            end
            useAnimatorObserver.play(Gear_4.Hanging.Start, 0.2)
            u33 = useAnimatorObserver.play(Gear_4.Hanging.Idle, 0.2)
            ClientStateHandler.updateState(States.WALL_HANGING, true)
            u32 = 0
            return true
        end
        local function onGearGoalStepped(p1, a2) -- Line: 727 -- upvalues: Character (upval), trove (val), Gear_5 (upval), p2 (val), Server (upval), BodyVelocity (val), ClientStateHandler (upval), States (upval), Water (upval), u4 (ref), u5 (ref), ClientAttributesHandler (upval), u19 (ref), TOTAL_TIME_FOR_MAX_VELOCITY (ref), Gear_3 (upval), Tinkers (upval), ClientSettingsHandler (upval), onHandleGasReductionStep (val), onGetDistanceFromAliveTarget (val), u16 (ref), onHandleWallHanging (val), onGetMutualGrappleTarget (val), u680 (upval), UserInputService (upval), u17 (ref), Sounds (upval), Gear (upval), Gear_4 (upval), useAnimatorObserver (upval), u34 (ref), u35 (ref), u8 (ref), Particles (upval), TOTAL_TIME_FOR_MAX_GAS (ref), u26 (ref), MAXIMUM_VELOCITY_MULTIPLIER (ref), normalizeAlpha (val), u18 (ref), onHandleGasBoostingParticles (val), u14 (ref), hasSkilledPilot (val), u50 (ref), u56 (val), u15 (ref)
            local v1 = math.min(a2, 0.02)
            local u9 = Character.getCharacter()
            if not u9 then
                Gear_5.warn("No character found while on gear goal stepped")
                return
            else
                if trove._cleaning then
                    Gear_5.warn("No character found while on gear goal stepped")
                    return
                end
                if not u9 then
                    return
                elseif not p2.enabled then
                    return
                elseif p2.gas > 0 then
                    if u9:GetAttribute("Ragdolled") then
                        BodyVelocity.Parent = nil
                        return
                    end
                    if ClientStateHandler.isStateBusy(States.SWIMMING) then
                        BodyVelocity.Parent = nil
                        if Water.isCharacterTouchingWater(u9) then
                            p2.signals.ungrapple:Fire("Left")
                            p2.signals.ungrapple:Fire("Right")
                        end
                        return
                    else
                        local GearVelocityDecayRate_2, v2
                        if Water.isCharacterTouchingWater(u9) then
                            BodyVelocity.Parent = nil
                            if Water.isCharacterTouchingWater(u9) then
                                p2.signals.ungrapple:Fire("Left")
                                p2.signals.ungrapple:Fire("Right")
                            end
                            return
                        end
                        if u4 then
                            u4:Disconnect()
                            u4 = nil
                        end
                        u9.Humanoid.PlatformStand = true
                        u9.Humanoid.AutoRotate = false
                        if p2.no_physics then
                            BodyVelocity.Parent = nil
                            return
                        end
                        if u5 then
                            u5:Disconnect()
                        end
                        if p2.slacking then
                            BodyVelocity.Parent = nil
                            GearVelocityDecayRate_2 = ClientAttributesHandler.getAttribute("GearVelocityDecayRate")
                            v2 = u19 - v1 * (GearVelocityDecayRate_2 * 5 * ClientAttributesHandler.getAttribute("GearVelocityDecayRateMultiplier") / 15)
                            u19 = math.clamp(v2, 0, TOTAL_TIME_FOR_MAX_VELOCITY)
                            return
                        else
                            local Magnitude, v3, v4, v5, v6
                            if p2.wall_sliding then
                                BodyVelocity.Parent = nil
                                GearVelocityDecayRate_2 = ClientAttributesHandler.getAttribute("GearVelocityDecayRate")
                                v2 = u19 - v1 * (GearVelocityDecayRate_2 * 5 * ClientAttributesHandler.getAttribute("GearVelocityDecayRateMultiplier") / 15)
                                u19 = math.clamp(v2, 0, TOTAL_TIME_FOR_MAX_VELOCITY)
                                return
                            end
                            local function isHookedBehindTitan() -- Line: 793 -- upvalues: p2 (upval), u9 (val)
                                local function titanFromGrapple(p1) -- Line: 796
                                    local Parent
                                    local hit = p1.hit
                                    if not p1.active or not hit or not hit.Parent then
                                        return nil
                                    end
                                    Parent = hit.Parent
                                    if not (Parent:IsA("Model")) or not (Parent:HasTag("Titan")) then
                                        return nil
                                    end
                                    return Parent
                                end
                                local v1 = titanFromGrapple(p2.grapples.left)
                                if not v1 then
                                    v1 = titanFromGrapple(p2.grapples.right)
                                end
                                if not v1 then
                                    return false
                                end
                                local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
                                if not HumanoidRootPart then
                                    return false
                                end
                                local v2 = HumanoidRootPart.CFrame.LookVector:Dot(u9.HumanoidRootPart.CFrame.LookVector)
                                local v3 = 0.3 < v2
                                return v3
                            end
                            local function hasDoubleTimeBoost() -- Line: 821 -- upvalues: ClientAttributesHandler (upval), p2 (upval)
                                local WorldPosition, WorldPosition_2
                                if ClientAttributesHandler.getAttribute("HasDoubleTime") ~= 1 then
                                    return false
                                end
                                local left = p2.grapples.left
                                local right = p2.grapples.right
                                if not left.active or not right.active then
                                    return false
                                end
                                if not left.attachment then
                                    WorldPosition = left.goal
                                else
                                    WorldPosition = left.attachment.WorldPosition
                                end
                                if not right.attachment then
                                    WorldPosition_2 = right.goal
                                else
                                    WorldPosition_2 = right.attachment.WorldPosition
                                    if not WorldPosition_2 then
                                        WorldPosition_2 = right.goal
                                    end
                                end
                                if not WorldPosition or not WorldPosition_2 then
                                    return false
                                end
                                local v1 = (WorldPosition - WorldPosition_2).Magnitude < 30
                                return v1
                            end
                            v5 = Gear_3.getComponentLevel(p2, "Ejector")
                            v6 = Gear_3.getComponentLevel(p2, "Turbine")
                            local v7 = (v6 + Gear_3.getComponentLevel(p2, "Ejector")) / 2
                            local v8 = Gear_3.getComponentLevel(p2, "Spooling")
                            local v9 = Tinkers.getModifierConfig("Velocity Gain Speed")
                            local v10 = Tinkers.getModifierConfig("Gas Speed")
                            local v11 = Tinkers.getModifierConfig("Velocity Gain Power")
                            local v12 = Tinkers.getModifierConfig("Base Speed")
                            local v13 = Tinkers.getModifierConfig("Orbit Speed")
                            local v14 = Tinkers.getModifierConfig("Orbit Control")
                            local v15 = Tinkers.getModifierConfig("Speed Control")
                            local v16 = Gear_3.getTinkerModifierMultiplier(p2, "Velocity Gain Speed", v9, v5)
                            local v17 = Gear_3.getTinkerModifierMultiplier(p2, "Gas Speed", v10, v5)
                            local v18 = Gear_3.getTinkerModifierMultiplier(p2, "Velocity Gain Power", v11, v5)
                            local v19 = Gear_3.getTinkerModifierMultiplier(p2, "Base Speed", v12, v5)
                            local v20 = Gear_3.getTinkerModifierMultiplier(p2, "Orbit Speed", v13, v5)
                            local v21 = Gear_3.getTinkerModifierMultiplier(p2, "Orbit Control", v14, v5)
                            local v22 = Gear_3.getTinkerModifierMultiplier(p2, "Speed Control", v15, v5)
                            local v23 = ClientSettingsHandler.getSettingFromName("Gas Boost")
                            onHandleGasReductionStep(v1)
                            v3, v4 = onGetDistanceFromAliveTarget()
                            Magnitude = (p1 - u9.HumanoidRootPart.Position).Magnitude
                            local v24 = u9.HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 20
                            if v3 then
                                local BLADLESS_MAX_VELOCITY_MULTIPLIER, DOUBLE_TIME_VELOCITY_MULTIPLIER, Magnitude_2, Unit_3, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36
                                v25, v26 = onGetMutualGrappleTarget()
                                if v3 then
                                    local v37
                                    v37, v27 = onGetMutualGrappleTarget()
                                    v25 = v37
                                    v26 = v27
                                end
                                if not v3 then
                                    v27 = 1
                                else
                                    v27 = math.clamp((v4 - u680.PVP_CLOSE_GRAPPLE_DISTANCE) / (u680.PVP_FAR_GRAPPLE_DISTANCE - u680.PVP_CLOSE_GRAPPLE_DISTANCE), 0, 1)
                                end
                                local v38 = UserInputService:IsKeyDown(Enum.KeyCode.A)
                                local v39 = UserInputService:IsKeyDown(Enum.KeyCode.D)
                                local v40 = UserInputService:IsKeyDown(v23)
                                local v41 = nil
                                if not v38 then
                                    if v38 then
                                        local v42, v43
                                        if not v38 then
                                            v43 = 1
                                        else
                                            v43 = -1
                                        end
                                        v41 = Vector3.new(v43, 0, 0)
                                        if not v38 then
                                            v42 = 1
                                        else
                                            v42 = -1
                                        end
                                        v28 = v42
                                    elseif not v39 then
                                        v28 = 0
                                    end
                                end
                                if p2.reeling then
                                    v28 = 0
                                    v41 = nil
                                end
                                if v28 ~= u17 then
                                    local Right
                                    u17 = v28
                                    Sounds.playRangedSoundEffect(Gear.Orbit, u9.HumanoidRootPart, 300, 0.5)
                                    if u17 ~= 1 then
                                        Right = if u17 == -1 then Gear_4.Grapples.Orbit.Left else false
                                    else
                                        Right = Gear_4.Grapples.Orbit.Right
                                    end
                                    if Right then
                                        if p2.animation then
                                            p2.animation:Stop(0.25)
                                        end
                                        p2.animation = useAnimatorObserver.play(Right, 0.25)
                                    end
                                end
                                if u17 == 0 then
                                    u34 = "Both"
                                elseif u17 == 1 then
                                    u34 = "Right"
                                elseif u17 == -1 then
                                    u34 = "Left"
                                end
                                if not u16 then
                                    u35 = "Default"
                                else
                                    u35 = "Boosting"
                                end
                                if u34 ~= u34 then
                                    if u8 then
                                        u8:Stop(0.25)
                                    end
                                    local v44 = Gear_4.Grapples.Idle[u34]
                                    if not v44 then
                                        u8 = useAnimatorObserver.play(Gear_4.Forward, 0.25, Enum.AnimationPriority.Action)
                                    else
                                        local Default = v44[u35]
                                        if not Default then
                                            Default = v44.Default
                                        end
                                        u8 = useAnimatorObserver.play(Default, 0.25, Enum.AnimationPriority.Action)
                                    end
                                elseif u35 == u35 then
                                end
                                local MovementParticle = u9
                                if MovementParticle then
                                    MovementParticle = u9:FindFirstChild("MovementParticle", true)
                                end
                                _, v29 = Character.isGrounded(u9)
                                if v29 < 3.5 and not (ClientStateHandler.isStateBusy(States.SLIDING)) and not (ClientStateHandler.isStateBusy(States.GEAR_SWING)) and not (ClientStateHandler.isStateBusy(States.SWIMMING)) then
                                    ClientStateHandler.updateState(States.SLIDING, true)
                                end
                                if not MovementParticle then
                                    if MovementParticle and v40 then
                                        Particles.deepDisableParticles(MovementParticle)
                                    end
                                elseif not v40 then
                                    Particles.deepEnableParticles(MovementParticle)
                                end
                                TOTAL_TIME_FOR_MAX_GAS = u680.TOTAL_TIME_FOR_MAX_GAS * v22
                                if not v40 then
                                    v30 = u26 - v1 * 3
                                else
                                    v30 = u26 + v1
                                end
                                u26 = math.clamp(v30, 0, TOTAL_TIME_FOR_MAX_GAS)
                                local v45 = hasDoubleTimeBoost()
                                v30 = if ClientAttributesHandler.getAttribute("HasPacifist") == 1 then not p2.blades else false
                                if 0 < tick() and 35 < u9.HumanoidRootPart.AssemblyLinearVelocity.Magnitude then
                                    local BLADELESS_VELOCITY_INCREASE_MULTIPLIER, DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER, HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER
                                    local GearVelocityIncreaseRate = ClientAttributesHandler.getAttribute("GearVelocityIncreaseRate")
                                    local v46 = 1
                                    local v47 = ClientAttributesHandler.getAttribute("HasDownwardSurge") == 1
                                    if v47 then
                                        local VELOCITY_GAIN_INCREASE_DIVE
                                        if u9.HumanoidRootPart.AssemblyLinearVelocity.Y >= u680.DIVE_VELOCITY_THRESHOLD then
                                            VELOCITY_GAIN_INCREASE_DIVE = 1
                                        else
                                            VELOCITY_GAIN_INCREASE_DIVE = u680.VELOCITY_GAIN_INCREASE_DIVE
                                        end
                                        v46 = VELOCITY_GAIN_INCREASE_DIVE
                                    end
                                    if not (isHookedBehindTitan()) then
                                        HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER = 1
                                    elseif ClientAttributesHandler.getAttribute("HasTerminator") == 1 then
                                        HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER = u680.HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER
                                    end
                                    if not v45 then
                                        DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER = 1
                                    else
                                        DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER = u680.DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER
                                    end
                                    if not v30 then
                                        BLADELESS_VELOCITY_INCREASE_MULTIPLIER = 1
                                    else
                                        BLADELESS_VELOCITY_INCREASE_MULTIPLIER = u680.BLADELESS_VELOCITY_INCREASE_MULTIPLIER
                                    end
                                    if v40 then
                                        v31 = v1 * u680.VELOCITY_GAIN_INCREASE_GAS_REEL
                                        if not v31 then
                                            v31 = v1
                                        end
                                    elseif not p2.reeling then
                                    end
                                    u19 = u19 + v31 * GearVelocityIncreaseRate * v46 * HOOKED_BEHIND_TITAN_VELOCITY_MULTIPLIER * DOUBLE_TIME_VELOCITY_INCREASE_MULTIPLIER * BLADELESS_VELOCITY_INCREASE_MULTIPLIER
                                end
                                local GearVelocityTimeMultiplier = ClientAttributesHandler.getAttribute("GearVelocityTimeMultiplier")
                                local GearMaxVelocityMultiplier = ClientAttributesHandler.getAttribute("GearMaxVelocityMultiplier")
                                local GearMaxVelocityBaseSpeedMultiplier = ClientAttributesHandler.getAttribute("GearMaxVelocityBaseSpeedMultiplier")
                                local GearMaximumVelocity = ClientAttributesHandler.getAttribute("GearMaximumVelocity")
                                local v48 = math.max(0, v7 - 1)
                                TOTAL_TIME_FOR_MAX_VELOCITY = math.max(1, v16 * u680.TOTAL_TIME_FOR_MAX_VELOCITY * GearVelocityTimeMultiplier - v48 * u680.VELOCITY_GAIN_SPEED_INCREASE_PER_LEVEL)
                                local v49 = v18 * u680.MAXIMUM_VELOCITY_MULTIPLIER * GearMaxVelocityMultiplier
                                if not v30 then
                                    BLADLESS_MAX_VELOCITY_MULTIPLIER = 1
                                else
                                    BLADLESS_MAX_VELOCITY_MULTIPLIER = u680.BLADLESS_MAX_VELOCITY_MULTIPLIER
                                end
                                MAXIMUM_VELOCITY_MULTIPLIER = v49 * BLADLESS_MAX_VELOCITY_MULTIPLIER
                                if TOTAL_TIME_FOR_MAX_VELOCITY * 0.875 < u19 and not u16 then
                                    local GearVelocityDecayRate = ClientAttributesHandler.getAttribute("GearVelocityDecayRate")
                                    local GearVelocityDecayRateMultiplier = ClientAttributesHandler.getAttribute("GearVelocityDecayRateMultiplier")
                                    u19 = u19 - v1 * 5 * (GearVelocityDecayRate * GearVelocityDecayRateMultiplier)
                                end
                                v48 = math.clamp(u19 / 15, 0, 1)
                                v49 = math.clamp(u19 / TOTAL_TIME_FOR_MAX_VELOCITY, 0, 1)
                                local v50 = math.clamp(u26 / TOTAL_TIME_FOR_MAX_GAS, 0, 1)
                                local GearSwiftnessMultiplier = ClientAttributesHandler.getAttribute("GearSwiftnessMultiplier")
                                local v51 = math.clamp(normalizeAlpha(v48, 0.0175, 0.03) * 240 * v1 * v21, 0, 1)
                                local v52 = normalizeAlpha(v49, 1, MAXIMUM_VELOCITY_MULTIPLIER)
                                local v53 = 1
                                v31 = 1
                                local v54 = v25
                                if v54 then
                                    v54 = v26
                                    if v54 then
                                        v54 = u680.JOUSTING_SLOWDOWN_MAXIMUM < (v26 - u9.HumanoidRootPart.Position).Magnitude
                                    end
                                end
                                if not v26 then
                                    Magnitude_2 = 0
                                else
                                    Magnitude_2 = (v26 - u9.HumanoidRootPart.Position).Magnitude
                                end
                                local v55 = math.clamp((Magnitude_2 - u680.JOUSTING_SLOWDOWN_MINIMUM) / (u680.JOUSTING_SLOWDOWN_MAXIMUM - u680.JOUSTING_SLOWDOWN_MINIMUM), 0, 1)
                                v55 = v55 * v55
                                if v54 then
                                    if v3 then
                                        v53 = v27
                                    end
                                elseif v3 and 0 < Magnitude_2 and v25 then
                                    v31 = 1 - (1 - v55) * 0.6
                                end
                                v53 = 1 - (1 - v53) * u680.PVP_TURN_REDUCTION_EFFECT_SCALE
                                v31 = 1 - (1 - v31) * u680.PVP_TURN_REDUCTION_EFFECT_SCALE
                                if v54 then
                                    if u18 and v54 then
                                        u18 = false
                                        p2.signals.setBladeExpansion:Fire(0)
                                    end
                                elseif v3 and v25 and not u18 then
                                    u18 = true
                                    p2.signals.setBladeExpansion:Fire(7, 3)
                                end
                                onHandleGasBoostingParticles(v40)
                                u16 = v40
                                local v56 = math.max(0, v7 - 1)
                                local v57 = v56 * u680.BASE_SPEED_INCREASE_PER_LEVEL
                                local v58 = normalizeAlpha(v49, 1, u680.MAX_VELOCITY_BASE_SPEED_MULTIPLIER * GearMaxVelocityBaseSpeedMultiplier)
                                local v59 = (u680.BASE_SPEED + v57) * v19 * v58
                                local v60 = math.max(0, v7 - 1)
                                v60 = (u680.BASE_GAS_BOOST + v60 * u680.GAS_SPEED_INCREASE_PER_LEVEL) * v17 * v50
                                local Unit = (p1 - u9.HumanoidRootPart.Position).Unit
                                local v61 = v41
                                if v61 then
                                    v61 = u9.HumanoidRootPart.CFrame * CFrame.new(v41)
                                end
                                local Unit_2 = v61
                                if Unit_2 then
                                    Unit_2 = (v61.Position - u9.HumanoidRootPart.Position).Unit
                                end
                                if not Unit_2 then
                                    v32 = Vector3.new()
                                else
                                    v32 = Unit_2 * (v53 * 1 * v20)
                                end
                                u14 = u14 or v32
                                v32 = u14:Lerp(v32, v51)
                                local v62 = v38
                                if not v62 then
                                    v62 = v39
                                    if v62 then
                                        v62 = 0.01 < v32.Magnitude
                                    end
                                end
                                if not (hasSkilledPilot()) then
                                    if u14 == v32 then
                                        if v38 then
                                            if v38 and v39 and u50 then
                                                u50(TweenInfo.new(u680.CAMERA_TILT_SPEED * 1.5))
                                                u50 = nil
                                            end
                                        elseif not v39 then
                                        end
                                    elseif v62 and not v38 then
                                        local CAMERA_TILT_AMOUNT
                                        if not v38 then
                                            CAMERA_TILT_AMOUNT = -u680.CAMERA_TILT_AMOUNT
                                        else
                                            CAMERA_TILT_AMOUNT = u680.CAMERA_TILT_AMOUNT
                                        end
                                        u50 = u56("gear", CAMERA_TILT_AMOUNT, "add", 2, TweenInfo.new(u680.CAMERA_TILT_SPEED))
                                    end
                                end
                                local v63 = Unit + v32 * v31
                                if 0 >= v63.Magnitude then
                                    Unit_3 = Unit
                                else
                                    Unit_3 = v63.Unit
                                end
                                local v64 = Unit_3 * v59
                                local v65 = u9.HumanoidRootPart.Position.Y < p1.Y
                                if v65 then
                                    v64 = v64 + Vector3.new(0, 5, 0)
                                end
                                u15 = u15 or v64
                                v64 = u15:Lerp(v64, v51)
                                local v66 = v64
                                if not p2.reeling then
                                    v33 = 0.05
                                else
                                    v33 = 0.3
                                end
                                if Magnitude < 40 then
                                    v33 = 0.15
                                end
                                if not v3 then
                                    if v25 then
                                        v33 = 0.4
                                    end
                                elseif v27 < 0.5 and not v25 then
                                    v33 = math.clamp(0.7 - v27, 0.15, 0.6)
                                end
                                if v25 then
                                    v66 = v66 * (1 - (1 - v55) * 0.19999999999999996)
                                    v66 = v66 * Vector3.new(1, 1 - (1 - v55) * 0.8, 1)
                                end
                                if ClientAttributesHandler.getAttribute("HasOvertuned") == 1 and p2.maxGas * u680.OVERTUNED_GAS_THRESHOLD <= p2.gas then
                                    GearSwiftnessMultiplier = GearSwiftnessMultiplier * u680.OVERTUNED_VELOCITY_INCREASE_MULTIPLIER
                                end
                                if not v45 then
                                    DOUBLE_TIME_VELOCITY_MULTIPLIER = 1
                                else
                                    DOUBLE_TIME_VELOCITY_MULTIPLIER = u680.DOUBLE_TIME_VELOCITY_MULTIPLIER
                                end
                                v66 = v66 * (GearSwiftnessMultiplier * DOUBLE_TIME_VELOCITY_MULTIPLIER) * v52
                                if p2.reeling then
                                    v35 = math.max(0, v8 - 1)
                                    v34 = v35 * u680.BASE_REEL_INCREASE_PER_LEVEL
                                    if not u16 then
                                        v35 = normalizeAlpha(v49, u680.BASE_REEL_BOOST + v34, u680.MAX_VELOCITY_REEL_BOOST + v34)
                                    else
                                        v35 = normalizeAlpha(v49, u680.BASE_REEL_BOOST_GAS + v34, u680.MAX_VELOCITY_REEL_BOOST_GAS + v34)
                                    end
                                    v66 = v66 + Unit_3 * v35
                                end
                                if 0 < v60 then
                                    v66 = v66 + Unit_3 * v60
                                end
                                v34 = math.max(0, v7 - 1)
                                v35 = v34 * u680.FLAT_SPEED_INCREASE_PER_LEVEL
                                if 0 < v35 and 0 < Unit_3.Magnitude then
                                    v66 = v66 + Unit_3 * v35
                                end
                                if ClientAttributesHandler.getAttribute("TetherControlState") == 1 then
                                    local v67
                                    local v68 = UserInputService:IsKeyDown(Enum.KeyCode.W)
                                    v36 = UserInputService:IsKeyDown(Enum.KeyCode.S)
                                    local v69 = Vector3.new(0, 0, 0)
                                    if not v68 then
                                        v67 = Vector3.new(0, 0, 0)
                                    else
                                        v67 = Vector3.new(0, 1, 0)
                                    end
                                    local v70 = v69 + v67 * 0.7
                                    if not v36 then
                                        v69 = Vector3.new(0, 0, 0)
                                    else
                                        v69 = Vector3.new(0, -1, 0)
                                    end
                                    v66 = v66 + (v70 + v69) * 80
                                end
                                v36 = math.clamp(1 - math.exp(-(v33 * 165) * v1), 0, 1)
                                local v71 = u9.HumanoidRootPart.AssemblyLinearVelocity:Lerp(v66, v36)
                                if 0 < GearMaximumVelocity and GearMaximumVelocity < v71.Magnitude then
                                    v71 = v71.Unit * GearMaximumVelocity
                                end
                                if v71 == v71 and v66 == v66 then
                                    BodyVelocity.Velocity = v71
                                end
                                BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                local SlideGearVelocity = u9.HumanoidRootPart:FindFirstChild("SlideGearVelocity")
                                if SlideGearVelocity then
                                    SlideGearVelocity:Destroy()
                                end
                                BodyVelocity.Parent = u9.HumanoidRootPart
                                u14 = v32
                                u15 = v64
                                return
                            elseif not u16 and v24 and onHandleWallHanging(p1, v1) then
                                return
                            end
                        end
                    end
                elseif Server.Store.client().event == 1 then
                    return
                elseif Server.Store.client().event == 2 then
                    return
                end
            end
        end
        local function onBeginSimulatedMomentum() -- Line: 1362 -- upvalues: Character (upval), ClientStateHandler (upval), States (upval), Water (upval), u5 (ref), BodyForce (val), u680 (upval), RunService (upval), p2 (val), trove (val), TweenService (upval)
            local new
            if not (Character.isActive()) then
                return
            end
            local u5 = Character.getCharacter()
            if not u5 or not u5.HumanoidRootPart or ClientStateHandler.isStateBusy(States.SWIMMING) or Water.isCharacterTouchingWater(u5) then
                return
            end
            if u5 then
                u5:Disconnect()
            end
            if BodyForce then
                BodyForce.Parent = nil
            end
            local AssemblyLinearVelocity = u5.HumanoidRootPart.AssemblyLinearVelocity
            if 80 >= AssemblyLinearVelocity.Magnitude then
                BodyForce.Force = Vector3.new(0, workspace.Gravity * 2, 0)
                new = TweenInfo.new(1.5)
                TweenService:Create(BodyForce, new, {Force = Vector3.new(0, 0, 0)}):Play()
                BodyForce.Parent = u5.HumanoidRootPart
                return
            end
            local u34 = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z)
            local Y = AssemblyLinearVelocity.Y
            local u40 = workspace.Gravity * u680.GEAR_RELEASE_GRAVITY_SCALE
            new = 0
            local u43 = RaycastParams.new()
            u43.FilterType = Enum.RaycastFilterType.Exclude
            u43.FilterDescendantsInstances = {u5}
            u43.CollisionGroup = "Universal"
            u43.RespectCanCollide = true
            u5 = RunService.RenderStepped:Connect(function(p1) -- Line: 1407 -- upvalues: Character (upval), u5 (val), u5 (upval), ClientStateHandler (upval), States (upval), Water (upval), p2 (upval), trove (upval), u43 (val), new (ref), u34 (val), Y (val), u40 (val), u680 (upval)
                if not (Character.isActive(u5)) then
                    u5:Disconnect()
                    return
                end
                if ClientStateHandler.isStateBusy(States.SWIMMING) then
                    u5:Disconnect()
                    return
                else
                    if Water.isCharacterTouchingWater(u5) then
                        u5:Disconnect()
                        return
                    end
                    if Character.isGrounded(u5, 9) then
                        u5:Disconnect()
                        return
                    elseif p2.no_physics then
                        u5:Disconnect()
                        return
                    elseif trove._cleaning then
                        u5:Disconnect()
                        return
                    else
                        if p2.busy() then
                            u5:Disconnect()
                            return
                        end
                        local AssemblyLinearVelocity = u5.HumanoidRootPart.AssemblyLinearVelocity
                        local v1 = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z)
                        if 1 >= v1.Magnitude then
                            local v2 = math.min(p1, 0.05)
                            new = new + v2
                            local v3 = if 1 < new then math.clamp((new - 1) / 1.85, 0, 1) else 0
                            local v4 = u34:Lerp(Vector3.zero, v3)
                            local v5 = math.max(Y - u40 * new, -u680.GEAR_RELEASE_TERMINAL_FALL_SPEED)
                            u5.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v4.X, v5, v4.Z)
                            if 2.85 <= new then
                                u5:Disconnect()
                            elseif u5.HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 20 then
                                u5:Disconnect()
                            end
                            return
                        elseif workspace:Spherecast(u5.HumanoidRootPart.Position, 2.5, v1.Unit * 4, u43) then
                            u5:Disconnect()
                            return
                        end
                    end
                end
            end)
            trove:Add(u5)
        end
        local function onGearGrapplesReleased() -- Line: 1473 -- upvalues: Character (upval), trove (val), BodyVelocity (val), ClientStateHandler (upval), States (upval), Water (upval), onCancelWallHanging (val), p2 (val), u19 (ref), u4 (ref), RunService (upval), TOTAL_TIME_FOR_MAX_VELOCITY (ref), ClientAttributesHandler (upval), u26 (ref), TOTAL_TIME_FOR_MAX_GAS (ref), Particles (upval), u16 (ref), u8 (ref), u17 (ref), u34 (ref), u35 (ref), onBeginSimulatedMomentum (val), u49 (ref), u680 (upval), u48 (ref), u50 (ref)
            local SlideParticle
            local u2 = Character.getCharacter()
            if not (Character.isActive(u2)) or trove._cleaning or not u2 then
                return
            end
            BodyVelocity.Parent = nil
            local Attribute = u2:GetAttribute("Ragdolled")
            local v1 = ClientStateHandler.isStateBusy(States.SWIMMING)
            if not v1 then
                v1 = Water.isCharacterTouchingWater(u2)
            end
            onCancelWallHanging()
            if not v1 and not (ClientStateHandler.isStateBusy(States.CLASHING)) and not (ClientStateHandler.isStateBusy(States.STUNNED)) and not Attribute then
                u2.Humanoid.PlatformStand = false
                u2.Humanoid.AutoRotate = true
            end
            p2.signals.goal:Fire(nil)
            local u51 = tick()
            if 0 < u19 and not Attribute and p2.enabled then
                if u4 then
                    u4:Disconnect()
                end
                SlideParticle = nil
                SlideParticle = RunService.RenderStepped:Connect(function(p1) -- Line: 1518 -- upvalues: u51 (ref), Character (upval), u2 (val), SlideParticle (ref), u19 (upval), TOTAL_TIME_FOR_MAX_VELOCITY (upval), p2 (upval), ClientAttributesHandler (upval), u26 (upval), TOTAL_TIME_FOR_MAX_GAS (upval), u4 (upval)
                    local v1
                    local v2 = tick() - u51
                    if v2 < 0.75 then
                        return
                    end
                    if not (Character.isActive(u2)) then
                        return SlideParticle:Disconnect()
                    end
                    v2, v1 = Character.isGrounded(u2)
                    if v2 then
                        local Magnitude = u2.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
                        if Magnitude < 5 then
                            local v3
                            if Magnitude >= 1 then
                                v3 = 50
                            else
                                v3 = 100
                            end
                            u19 = math.clamp(u19 - p1 * v3, 0, TOTAL_TIME_FOR_MAX_VELOCITY)
                        end
                    else
                        local v4
                        if v2 then
                            if p2.wall_sliding then
                                u51 = tick()
                                return
                            end
                            if ClientAttributesHandler.getAttribute("LoseLessVelocity") ~= 1 then
                                v4 = 8
                            else
                                v4 = 4
                            end
                            u19 = math.clamp(u19 - p1 * v4, 0, TOTAL_TIME_FOR_MAX_VELOCITY)
                            u26 = math.clamp(u26 - p1, 0, TOTAL_TIME_FOR_MAX_GAS)
                            if u19 <= 0 and u4 then
                                SlideParticle:Disconnect()
                                u4 = nil
                            end
                            return
                        elseif 20 < v1 then
                            v4 = tick() - u51
                            if v4 < 1.5 then
                                return
                            end
                        end
                    end
                end)
                u4 = SlideParticle
                trove:Add(SlideParticle)
            end
            SlideParticle = u2
            if SlideParticle then
                SlideParticle = u2:FindFirstChild("SlideParticle", true)
            end
            local MovementParticle = u2
            if MovementParticle then
                MovementParticle = u2:FindFirstChild("MovementParticle", true)
            end
            local EjectorParticle = u2
            if EjectorParticle then
                EjectorParticle = u2:FindFirstChild("EjectorParticle", true)
            end
            if SlideParticle then
                Particles.deepDisableParticles(SlideParticle)
            end
            if MovementParticle then
                Particles.deepDisableParticles(MovementParticle)
            end
            if EjectorParticle then
                Particles.deepDisableParticles(EjectorParticle)
            end
            u16 = false
            p2.boosting = false
            p2.signals.boosting:Fire(false)
            if u8 and u8.IsPlaying then
                u8:Stop(0.25)
            end
            u17 = 0
            u34 = "Both"
            u35 = "Default"
            ClientStateHandler.updateState(States.GRAPPLING, false)
            if not Attribute and not v1 then
                onBeginSimulatedMomentum()
            end
            if u49 then
                u49(TweenInfo.new(u680.FIELD_OF_VIEW_SPEED))
                u49 = nil
            end
            if u48 then
                u48(TweenInfo.new(u680.FIELD_OF_VIEW_SPEED))
                u48 = nil
            end
            if u50 then
                u50(TweenInfo.new(u680.CAMERA_TILT_SPEED * 1.5))
                u50 = nil
            end
        end
        local function onNotifyInjuriedUsage(p1) -- Line: 1626 -- upvalues: u29 (ref), Signals (upval)
            if not u29 then
                u29 = tick() - 7
            end
            local v1 = tick() - u29
            if v1 < 7 then
                return
            end
            Signals.Monologue:Fire("I need to be careful using my " .. p1 .. " grapple, my arm is in pain.")
            u29 = tick()
        end
        local function onAttemptToDamageForInjuredUsage(p1) -- Line: 1643 -- upvalues: u27 (ref), ClientStatusHandler (upval), Signals (upval)
            if not u27 then
                u27 = tick() - 4
            end
            local v1 = tick() - u27
            if v1 < 5 then
                return
            end
            ClientStatusHandler.addPlayerStatus(ClientStatusHandler.Statuses.CONCUSSED, 1)
            ClientStatusHandler.addPlayerStatus(ClientStatusHandler.Statuses.BLOOD, 1)
            Signals.Monologue:Fire("I'm in too much pain to use my " .. p1 .. " grapple.")
            u27 = tick()
        end
        local function onAttemptToDamageForGearHealth() -- Line: 1662 -- upvalues: p2 (val), u16 (ref), u28 (ref), Character (upval), trove (val), Gear_5 (upval), CharacterRagdollHandler (upval), Signals (upval)
            if 15 < p2.health or not u16 then
                return
            end
            if not u28 then
                u28 = tick() - 15
            end
            local v1 = tick() - u28
            if v1 < 15 or 0.05 < math.random() then
                return
            end
            u28 = tick()
            p2.signals.ungrapple:Fire("Left")
            p2.signals.ungrapple:Fire("Right")
            p2.malfunction()
            if not (Character.getCharacter()) or trove._cleaning then
                Gear_5.warn("No character found while on attempt to damage for gear health")
                return
            end
            p2.addTimeout(2)
            CharacterRagdollHandler.ragdoll(2)
            Signals.Monologue:Fire("My gear is in no condition to be used like this.")
        end
        local function onGearStepped(p1) -- Line: 1703 -- upvalues: p2 (val), u3 (ref), ClientStateHandler (upval), onGearGrapplesReleased (val), CharacterInjuryHandler (upval), onAttemptToDamageForInjuredUsage (val), u16 (ref), onAttemptToDamageForGearHealth (val), u13 (ref), onGearGoalStepped (val)
            local left = p2.grapples.left
            local right = p2.grapples.right
            local active = left.active
            local active_2 = right.active
            if active then
                if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.BANDAGING)) then
                    local WorldPosition, WorldPosition_2, v1, v2, v3
                    local goal = active
                    if goal then
                        goal = not left.busy
                        if goal then
                            goal = left.goal
                        end
                    end
                    local goal_2 = active_2
                    if goal_2 then
                        goal_2 = not right.busy
                        if goal_2 then
                            goal_2 = right.goal
                        end
                    end
                    if not left.attachment then
                        WorldPosition = left.goal
                    else
                        WorldPosition = left.attachment.WorldPosition
                    end
                    if not right.attachment then
                        WorldPosition_2 = right.goal
                    else
                        WorldPosition_2 = right.attachment.WorldPosition
                    end
                    v3, v1 = CharacterInjuryHandler.getCanUseGrapples()
                    if not v3 and active then
                        onAttemptToDamageForInjuredUsage("Left")
                    end
                    if not v1 and active_2 then
                        onAttemptToDamageForInjuredUsage("Right")
                    end
                    if u16 then
                        onAttemptToDamageForGearHealth()
                    end
                    if not goal then
                        if goal then
                            v2 = WorldPosition
                        elseif not goal_2 then
                            v2 = nil
                        else
                            v2 = WorldPosition_2
                            if not v2 then
                                v2 = nil
                            end
                        end
                    elseif goal_2 then
                        v2 = (WorldPosition + WorldPosition_2) / 2
                    end
                    if not v2 then
                        return
                    end
                    p2.goal = v2
                    if v2 ~= u13 then
                        u13 = v2
                        p2.signals.goal:Fire(v2)
                    end
                    onGearGoalStepped(v2, p1)
                    p2.signals.stepped:Fire(v2)
                    return
                elseif u3 then
                    u3:Disconnect()
                    u3 = nil
                    onGearGrapplesReleased()
                    return
                end
            elseif not active_2 and u3 then
                u3:Disconnect()
                u3 = nil
                onGearGrapplesReleased()
                return
            end
        end
        trove:Add(UserInputService.InputEnded:Connect(function(p1) -- Line: 1766 -- upvalues: Character (upval), trove (val), Gear_5 (upval), Particles (upval), u16 (ref), p2 (val)
            if p1.KeyCode ~= Enum.KeyCode.Space then
                return
            end
            local v1 = Character.getCharacter()
            if not v1 or trove._cleaning then
                Gear_5.warn("No character found while on input ended for gas boosting particles")
                return
            end
            local EjectorParticle = v1
            if EjectorParticle then
                EjectorParticle = v1:FindFirstChild("EjectorParticle", true)
            end
            if not EjectorParticle then
                return
            end
            Particles.deepDisableParticles(EjectorParticle)
            u16 = false
            p2.boosting = false
            if u16 then
                p2.signals.boosting:Fire(false)
            elseif p2.boosting then
                p2.signals.boosting:Fire(false)
            end
        end))
        local function disconnectReelingKeybinds() -- Line: 1808 -- upvalues: u6 (ref), u7 (ref)
            if u6 then
                u6:Disconnect()
                u6 = nil
            end
            if u7 then
                u7:Disconnect()
                u7 = nil
            end
        end
        local function connectReelingKeybinds() -- Line: 1822 -- upvalues: disconnectReelingKeybinds (val), ClientSettingsHandler (upval), Character (upval), u701 (upval), u702 (upval), Sounds (upval), u6 (ref), p2 (val), Gear (upval), u7 (ref), trove (val)
            disconnectReelingKeybinds()
            local u5 = ClientSettingsHandler.getSettingFromName("Toggle Reeling")
            local u8 = Character.getCharacter()
            if not u8 then
                return
            end
            local function playReelingSound(p1, p2) -- Line: 1835 -- upvalues: u701 (upval), u702 (upval), Sounds (upval), u8 (val)
                local v1
                if u701 then
                    u701:Stop()
                    u701:Destroy()
                    u701 = nil
                end
                if u702 then
                    u702:Stop()
                    u702:Destroy()
                    u702 = nil
                end
                if p1 then
                    v1 = math.random(0, 15) / 100
                    u702 = Sounds.playRangedSoundEffect(p2, u8.HumanoidRootPart, 400, 4, v1, 1)
                    return
                end
                v1 = math.random(85, 105) / 100
                u701 = Sounds.playRangedSoundEffect(p2, u8.HumanoidRootPart, 400, 4, v1, 1)
            end
            u6 = ClientSettingsHandler.onKeybindPressed("Enable Reeling"):Connect(function() -- Line: 1871 -- upvalues: u5 (val), p2 (upval), playReelingSound (val), Gear (upval)
                if not u5 then
                    if not u5 then
                        if not u5 and not p2.reeling then
                            p2.reeling = true
                            playReelingSound(false, Gear.Reeling)
                        end
                        return
                    end
                    if p2.reeling then
                        p2.reeling = false
                        playReelingSound(true, Gear.ReelingEnd)
                        return
                    end
                    if not u5 and not p2.reeling then
                        p2.reeling = true
                        playReelingSound(false, Gear.Reeling)
                    end
                    return
                elseif not p2.reeling then
                    p2.reeling = true
                    playReelingSound(false, Gear.Reeling)
                    return
                end
            end)
            u7 = ClientSettingsHandler.onKeybindReleased("Enable Reeling"):Connect(function() -- Line: 1884 -- upvalues: u5 (val), playReelingSound (val), Gear (upval), p2 (upval)
                if u5 then
                    return
                end
                playReelingSound(true, Gear.ReelingEnd)
                p2.reeling = false
            end)
            trove:Add(u6)
            trove:Add(u7)
        end
        trove:Add(p2.signals.grapple:Connect(function(p1, a2, p3) -- Line: 1897 -- upvalues: Character (upval), trove (val), Gear_5 (upval), p2 (val), CharacterInjuryHandler (upval), onNotifyInjuriedUsage (val), ClientSettingsHandler (upval), ClientStateHandler (upval), States (upval), Water (upval), disconnectReelingKeybinds (val), u3 (ref), u8 (ref), useAnimatorObserver (upval), Gear_4 (upval), u15 (ref), u49 (ref), u680 (upval), u53 (val), u6 (ref), connectReelingKeybinds (val), RunService (upval), onGearStepped (val)
            local v1 = Character.getCharacter()
            if not v1 then
                Gear_5.warn("No character found while on grapple")
                return
            else
                local Left, Right, right, v2, v3
                if trove._cleaning then
                    Gear_5.warn("No character found while on grapple")
                    return
                end
                if a2 ~= "Left" then
                    right = p2.grapples.left
                else
                    right = p2.grapples.right
                end
                v2, v3 = CharacterInjuryHandler.getCanUseGrapples()
                if not v2 and a2 == "Left" and p3 then
                    onNotifyInjuriedUsage("Left")
                end
                if not v3 and a2 == "Right" and p3 then
                    onNotifyInjuriedUsage("Right")
                end
                if p1.active then
                    if u3 then
                        return
                    end
                    u8 = useAnimatorObserver.play(Gear_4.Forward, 0.25)
                    if p1 and p1.active and not right.active then
                        u15 = v1.HumanoidRootPart.AssemblyLinearVelocity.Unit * 10
                    end
                    if not u49 then
                        local v4 = TweenInfo.new(u680.FIELD_OF_VIEW_SPEED, Enum.EasingStyle.Back)
                        u49 = u53("gear", u680.BASE_FIELD_OF_VIEW, "add", 3, v4)
                    end
                    if not u6 then
                        connectReelingKeybinds()
                    end
                    u3 = RunService.RenderStepped:Connect(onGearStepped)
                    return
                elseif not right.active then
                    if not (ClientSettingsHandler.getSettingFromName("Toggle Reeling")) then
                        p2.reeling = false
                    end
                    p2.slacking = false
                    local Attribute = v1:GetAttribute("Ragdolled")
                    local v5 = ClientStateHandler.isStateBusy(States.SWIMMING)
                    if not v5 then
                        v5 = Water.isCharacterTouchingWater(v1)
                    end
                    if not Attribute and not v5 then
                        v1.Humanoid.PlatformStand = false
                    end
                    ClientStateHandler.updateState(States.GRAPPLING, false)
                    disconnectReelingKeybinds()
                    return
                end
            end
        end))
        trove:Add(ClientSettingsHandler.onKeybindPressed("Check Gas"):Connect(function() -- Line: 1961 -- upvalues: ClientStateHandler (upval), States (upval), Constants (upval), ClientAttributesHandler (upval), p2 (val), u700 (upval), useAnimatorObserver (upval), Proficiencies (upval), Effects (upval), u699 (upval), Signals (upval), Gear_4 (upval), trove (val), useWalkSpeed (upval), useJumpPower (upval), Number (upval), Character (upval), Players (upval), Gear_2 (upval)
            local BasePlayerWalkSpeed, v1, v2, v3
            if ClientStateHandler.isStateBusy(States.CHECKING_GAS) or ClientStateHandler.isStateBusy(States.BANDAGING) or ClientStateHandler.isStateBusy(States.TRANSFORMED) or game.PlaceId == Constants.Places.Exam then
                return
            end
            if ClientAttributesHandler.getAttribute("CanCheckGasWhileMoving") == 0 then
                p2.signals.ungrapple:Fire("Left")
                p2.signals.ungrapple:Fire("Right")
            end
            if p2.animation then
                p2.animation:Stop(0.25)
            end
            local u127 = nil
            local v4 = ClientAttributesHandler.getAttribute("HasMusician") == 1
            local v5 = ClientAttributesHandler.getAttribute("HasConductor") == 1
            local v6 = ClientAttributesHandler.getAttribute("HasMicCheck") == 1
            local u143 = false
            if not v6 then
                if v5 then
                    v1 = tick() - u699
                    if 300 < v1 then
                        if v5 then
                            u127 = useAnimatorObserver.play(Proficiencies.Conductor, 0.25)
                            Effects.sendReplicatedEffect("Conductor", p2.gas / p2.maxGas)
                            Signals.Buff:Fire({id = "Conductor Cooldown", length = 300})
                        elseif v4 then
                            u127 = useAnimatorObserver.play(Proficiencies.Musician, 0.25)
                            Effects.sendReplicatedEffect("Musician", p2.gas / p2.maxGas)
                            Signals.Buff:Fire({id = "Musician Cooldown", length = 300})
                        end
                        u143 = true
                        u699 = tick()
                    elseif not (ClientStateHandler.isStateBusy(States.WALL_HANGING)) then
                        u127 = useAnimatorObserver.play(Gear_4.CheckGas, 0.25)
                    else
                        u127 = useAnimatorObserver.play(Gear_4.CheckGasHanging, 0.25, Enum.AnimationPriority.Action4)
                    end
                elseif not v4 then
                end
            elseif v4 and not u700 then
                u700 = true
                u127 = useAnimatorObserver.play(Proficiencies.Musician, 0.25)
                Effects.sendReplicatedEffect("Musician", p2.gas / p2.maxGas)
            end
            if not u127 then
                return
            end
            u127:AdjustSpeed((ClientAttributesHandler.getAttribute("GasCheckSpeedMultiplier")))
            local u184 = u127.KeyframeReached:Connect(function(p1) -- Line: 2031 -- upvalues: Effects (upval), p2 (upval)
                Effects.sendReplicatedEffect("CheckGas", p2.gas / p2.maxGas)
            end)
            trove:Add(u184)
            _, v2 = useWalkSpeed()
            _, v3 = useJumpPower()
            if ClientAttributesHandler.getAttribute("GasCheckNoDebuff") ~= 1 then
                BasePlayerWalkSpeed = 5
            else
                BasePlayerWalkSpeed = ClientAttributesHandler.getAttribute("BasePlayerWalkSpeed")
                if not BasePlayerWalkSpeed then
                    BasePlayerWalkSpeed = 5
                end
            end
            local u213 = v2("check", BasePlayerWalkSpeed, "set", 500)
            local u221 = v3("check", 0, "set", 500)
            ClientStateHandler.updateState(States.CHECKING_GAS, true)
            local function restoreGasCheckState() -- Line: 2055 -- upvalues: u127 (ref), ClientStateHandler (upval), States (upval), u213 (val), u221 (val)
                if u127.IsPlaying then
                    u127:Stop(0.25)
                end
                ClientStateHandler.updateState(States.CHECKING_GAS, false)
                u213()
                u221()
            end
            local function getGasMessageAmount() -- Line: 2068 -- upvalues: ClientAttributesHandler (upval), Number (upval), p2 (upval)
                if ClientAttributesHandler.getAttribute("HasExactGasChecking") == 1 then
                    return "My gas is at " .. Number.NumberToText((math.floor(p2.gas / p2.maxGas * 100))) .. " percent."
                end
                local v1 = {
                    "I have completely full gas.",
                    "My gas is almost completely full.",
                    "My gas is around three quarters full.",
                    "My gas is around the halfway mark.",
                    "My gas is beginning to run out.",
                    "My gas is nearly empty.",
                    "My gas is empty.",
                }
                local v2 = p2.gas / p2.maxGas
                if 1 <= v2 then
                    return v1[1]
                end
                if v2 == 0 then
                    return v1[7]
                end
                if 0.85 <= v2 then
                    return v1[2]
                end
                if 0.65 <= v2 then
                    return v1[3]
                end
                if 0.4 <= v2 then
                    return v1[4]
                end
                if 0.25 <= v2 then
                    return v1[5]
                end
                return v1[6]
            end
            local function getGearHealthMessageAmount() -- Line: 2106 -- upvalues: p2 (upval)
                local v1 = {
                    "My gear is in perfect condition.",
                    "My gear is slightly damaged.",
                    "My gear is moderately damaged.",
                    "My gear is severely damaged.",
                    "My gear is critically damaged.",
                    "My gear is destroyed.",
                }
                local v2 = p2.health / 100
                if 1 <= v2 then
                    return v1[1]
                end
                if 0.8 <= v2 then
                    return v1[2]
                end
                if 0.6 <= v2 then
                    return v1[3]
                end
                if 0.4 <= v2 then
                    return v1[4]
                end
                if 0.2 <= v2 then
                    return v1[5]
                end
                return v1[6]
            end
            local function getGaspackMessageAmount() -- Line: 2135 -- upvalues: Character (upval), ClientAttributesHandler (upval), Signals (upval), Number (upval)
                local v1 = {
                    "My gaspack is almost completely full.",
                    "My gaspack is around three quarters full.",
                    "My gaspack is around the halfway mark.",
                    "My gaspack is beginning to run out.",
                    "My gaspack is nearly empty.",
                    "My gaspack is empty.",
                }
                local v2 = Character.getCharacter()
                if not v2 then
                    return
                end
                local attachment_Gaspack = v2:FindFirstChild("attachment_Gaspack", true)
                if not attachment_Gaspack then
                    return
                end
                local Interaction = attachment_Gaspack:FindFirstChild("Interaction", true)
                if not Interaction then
                    return
                end
                local Attribute = Interaction:GetAttribute("Amount")
                if not Attribute then
                    return
                end
                local Attribute_2 = Interaction:GetAttribute("MaxAmount")
                if not Attribute_2 then
                    return
                end
                local v3 = Attribute / Attribute_2
                if ClientAttributesHandler.getAttribute("HasExactGasChecking") == 1 then
                    Signals.Monologue:Fire("My gaspack is at " .. Number.NumberToText((math.floor(v3 * 100))) .. " percent.")
                    return
                end
                if 0.85 <= v3 then
                    return v1[1]
                end
                if 0.65 <= v3 then
                    return v1[2]
                end
                if 0.4 <= v3 then
                    return v1[3]
                end
                if 0.25 <= v3 then
                    return v1[4]
                end
                if 0.1 <= v3 then
                    return v1[5]
                end
                return v1[6]
            end
            local function getBladeDurabilityMessageAmount() -- Line: 2197 -- upvalues: Players (upval), Character (upval), Gear_2 (upval)
                local v1 = {
                    "My blades are in perfect condition.",
                    "My blades are slightly damaged.",
                    "My blades are moderately damaged.",
                    "My blades are severely damaged.",
                    "My blades are critically damaged.",
                }
                local PlayerFromCharacter = Players:GetPlayerFromCharacter(Character.getCharacter())
                local v2 = Gear_2.Gear.get(PlayerFromCharacter)
                if not v2 then
                    return
                end
                local durability = v2.durability
                if not durability then
                    return
                end
                if 5 <= durability then
                    return v1[1]
                end
                if 4 <= durability then
                    return v1[2]
                end
                if 3 <= durability then
                    return v1[3]
                end
                if 2 <= durability then
                    return v1[4]
                end
                return v1[5]
            end
            local function getBladeCountMessageAmount() -- Line: 2233 -- upvalues: Players (upval), Character (upval), Gear_2 (upval), Number (upval)
                local v1, v2
                local PlayerFromCharacter = Players:GetPlayerFromCharacter(Character.getCharacter())
                local v3 = Gear_2.Gear.get(PlayerFromCharacter)
                if not v3 then
                    return
                end
                local v4 = (v3.stock or 0) * 2
                local v5 = v3.blades == 1
                if not v5 then
                    v1 = 0
                else
                    v2 = v3.durability or 0
                    if 0 >= v2 then
                        v1 = 0
                    else
                        v1 = 2
                    end
                end
                v2 = v4 + v1
                if v2 == 0 then
                    return "I have no blades left."
                end
                local v6 = Number.NumberToText(v2)
                if v2 == 1 then
                    return "I have one blade left."
                end
                return "I have " .. v6 .. " blades left."
            end
            trove:Add(u127.Stopped:Once(function() -- Line: 2257 -- upvalues: restoreGasCheckState (val), u184 (val), u127 (ref), ClientAttributesHandler (upval), Gear_2 (upval), u143 (ref), Signals (upval), getGasMessageAmount (val), getBladeDurabilityMessageAmount (val), getBladeCountMessageAmount (val), getGaspackMessageAmount (val), getGearHealthMessageAmount (val)
                restoreGasCheckState()
                u184:Disconnect()
                if u127.TimePosition < 0.8 then
                    return
                end
                if ClientAttributesHandler.getAttribute("HasMelody") == 1 then
                    Gear_2.Check.post(u143)
                elseif ClientAttributesHandler.getAttribute("HasMusician") ~= 1 and ClientAttributesHandler.getAttribute("HasConductor") ~= 1 then
                end
                Signals.Monologue:Fire(getGasMessageAmount())
                if ClientAttributesHandler.getAttribute("HasArsenal") == 1 then
                    task.delay(0.03, function() -- Line: 2278 -- upvalues: Signals (upval), getBladeDurabilityMessageAmount (upval)
                        Signals.Monologue:Fire(getBladeDurabilityMessageAmount())
                    end)
                end
                if ClientAttributesHandler.getAttribute("HasKeepingTrack") == 1 then
                    task.delay(0.04, function() -- Line: 2284 -- upvalues: Signals (upval), getBladeCountMessageAmount (upval)
                        Signals.Monologue:Fire(getBladeCountMessageAmount())
                    end)
                end
                if ClientAttributesHandler.getAttribute("CanSeeGaspackAmount") == 1 then
                    task.delay(0.05, function() -- Line: 2290 -- upvalues: getGaspackMessageAmount (upval), Signals (upval)
                        local v1 = getGaspackMessageAmount()
                        if v1 then
                            Signals.Monologue:Fire(v1)
                        end
                    end)
                end
                task.delay(0.07, function() -- Line: 2299 -- upvalues: Signals (upval), getGearHealthMessageAmount (upval)
                    Signals.Monologue:Fire(getGearHealthMessageAmount())
                end)
            end))
            trove:Add(restoreGasCheckState)
        end))
        trove:Add(p2.signals.enabled:Connect(function(p1) -- Line: 2307 -- upvalues: u3 (ref), ClientAttributesHandler (upval), onGearGrapplesReleased (val)
            if not p1 and u3 then
                u3:Disconnect()
                u3 = nil
                if ClientAttributesHandler.getAttribute("CanCheckGasWhileMoving") == 0 then
                    onGearGrapplesReleased()
                end
            end
        end))
        trove:Add(p2.signals.clearVelocity:Connect(function() -- Line: 2318 -- upvalues: u5 (ref), onGearGrapplesReleased (val)
            if u5 then
                u5:Disconnect()
            end
            onGearGrapplesReleased()
        end))
        trove:Add(p2.signals.impulse:Connect(function(p1) -- Line: 2327 -- upvalues: Character (upval), trove (val), Gear_5 (upval), ClientAttributesHandler (upval), u19 (ref)
            if not (Character.getCharacter()) or trove._cleaning then
                Gear_5.warn("No character found while on impulse")
                return
            end
            if ClientAttributesHandler.getAttribute("ExtraVelocityOnImpulse") == 1 then
                u19 = u19 + p1
            end
            u19 = u19 + 5
        end))
        trove:Add(p2.signals.setMaxVelocityGain:Connect(function() -- Line: 2341 -- upvalues: u19 (ref), TOTAL_TIME_FOR_MAX_VELOCITY (ref)
            u19 = TOTAL_TIME_FOR_MAX_VELOCITY
        end))
        trove:Add(BodyVelocity)
        trove:Add(p2.signals.clearMomentum:Connect(function() -- Line: 2348 -- upvalues: u5 (ref)
            if u5 then
                u5:Disconnect()
            end
        end))
        trove:Add(p2.signals.beginSimulatedMomentum:Connect(onBeginSimulatedMomentum))
        trove:Add(Signals.GasReservesRefilled:Connect(function() -- Line: 2357 -- upvalues: ClientAttributesHandler (upval), u43 (ref)
            if ClientAttributesHandler.getAttribute("RefillsGasReserves") == 1 then
                u43 = false
            end
        end))
        trove:Add(function() -- Line: 2363 -- upvalues: u3 (ref), u49 (ref), u48 (ref), u50 (ref), u4 (ref), BodyForce (val), disconnectReelingKeybinds (val)
            if u3 then
                u3:Disconnect()
                u3 = nil
            end
            if u49 then
                u49(TweenInfo.new(0.5))
                u49 = nil
            end
            if u48 then
                u48(TweenInfo.new(0.5))
                u48 = nil
            end
            if u50 then
                u50(TweenInfo.new(0.5))
                u50 = nil
            end
            if u4 then
                u4:Disconnect()
                u4 = nil
            end
            if BodyForce then
                BodyForce:Destroy()
            end
            disconnectReelingKeybinds()
        end)
    end,
    Constants = {
        BASE_SPEED = u680.BASE_SPEED,
        BASE_GAS_BOOST = u680.BASE_GAS_BOOST,
        MAX_VELOCITY_BASE_SPEED_MULTIPLIER = u680.MAX_VELOCITY_BASE_SPEED_MULTIPLIER,
        BASE_SPEED_MULTIPLIER = u680.BASE_SPEED_MULTIPLIER,
        BASE_REEL_BOOST = u680.BASE_REEL_BOOST,
        MAX_VELOCITY_REEL_BOOST = u680.MAX_VELOCITY_REEL_BOOST,
        BASE_REEL_BOOST_GAS = u680.BASE_REEL_BOOST_GAS,
        MAX_VELOCITY_REEL_BOOST_GAS = u680.MAX_VELOCITY_REEL_BOOST_GAS,
        VELOCITY_GAIN_INCREASE_GAS_REEL = u680.VELOCITY_GAIN_INCREASE_GAS_REEL,
        TOTAL_TIME_FOR_MAX_GAS = u680.TOTAL_TIME_FOR_MAX_GAS,
        TOTAL_TIME_FOR_MAX_VELOCITY = u680.TOTAL_TIME_FOR_MAX_VELOCITY,
        MAXIMUM_VELOCITY_MULTIPLIER = u680.MAXIMUM_VELOCITY_MULTIPLIER,
        BASE_SPEED_INCREASE_PER_LEVEL = u680.BASE_SPEED_INCREASE_PER_LEVEL,
        GAS_SPEED_INCREASE_PER_LEVEL = u680.GAS_SPEED_INCREASE_PER_LEVEL,
        VELOCITY_GAIN_SPEED_INCREASE_PER_LEVEL = u680.VELOCITY_GAIN_SPEED_INCREASE_PER_LEVEL,
    },
}