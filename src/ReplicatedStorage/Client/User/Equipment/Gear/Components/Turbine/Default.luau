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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Turbine.Default
--                               Dumped in 0.00199 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Effects_2 = Common_4:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Observers = Common_6:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics_2 = Common_8:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Gear_2 = require(Common_9:WaitForChild("Logger"))("Gear")
local u238 = Config.define({
    TURBINE_ABILITY_GAS_COST = 20,
    TURBINE_ABILITY_GLOBAL_COOLDOWN = 0.75,
    TURBINE_DOUBLE_TAP_WINDOW = 0.2,
    TURBINE_ABILITY_TIMEOUT = 0.6,
    TURBINE_ANIMATION_BLEND_TIME = 0.1,
    TURBINE_AERO_BASE_FORWARD_SPEED = 40,
    TURBINE_AERO_BASE_UPWARD_SPEED = 40,
    TURBINE_DOWNSHIFT_BASE_FORWARD_SPEED = 10,
    TURBINE_DOWNSHIFT_BASE_UPWARD_SPEED = -30,
    TURBINE_MIN_AIRBORNE_DISTANCE = 30,
    TURBINE_FAKE_GRAPPLE_LEFT_OFFSET = -1,
    TURBINE_FAKE_GRAPPLE_RIGHT_OFFSET = 1,
    TURBINE_GRAPPLE_RELEASE_DELAY = 0.1,
    TURBINE_MIN_SPEED_MULTIPLIER = 2,
    TURBINE_SPEED_MULTIPLIER_DIVISOR = 50,
    TURBINE_FOV_ADD_AMOUNT = 30,
    TURBINE_FOV_PRIORITY = 4,
    TURBINE_FOV_IN_DURATION = 0.3,
    TURBINE_FOV_OUT_DURATION = 0.6,
    TURBINE_GROUNDED_STOP_DISTANCE = 6,
    TURBINE_LANDING_WALK_SPEED = 5,
    TURBINE_LANDING_WALK_SPEED_PRIORITY = 5,
    TURBINE_LANDING_WALK_SPEED_DURATION = 0.6,
})
return {
    initialized = function(p1, p2) -- Line: 88 -- upvalues: useFieldOfView (val), useWalkSpeed (val), Gear (val), u238 (val), UserInputService (val), Character (val), ClientStateHandler (val), States (val), ClientAttributesHandler (val), useAnimatorObserver (val), Gear_2 (val), Workspace (val), Effects (val), RunService (val)
        local u5, u8
        local trove = p2.trove
        _, u5 = useFieldOfView()
        _, u8 = useWalkSpeed()
        local u9 = 0
        local u10 = {}
        u10[Enum.KeyCode.Space] = {attribute = "GearCanDoubleJump", animation = Gear.Aero, forwardSpeed = u238.TURBINE_AERO_BASE_FORWARD_SPEED, upwardSpeed = u238.TURBINE_AERO_BASE_UPWARD_SPEED}
        u10[Enum.KeyCode.LeftShift] = {
            keyframe = "Grapple",
            attribute = "GearCanUseDownshift",
            animation = Gear.Downshift,
            forwardSpeed = u238.TURBINE_DOWNSHIFT_BASE_FORWARD_SPEED,
            upwardSpeed = u238.TURBINE_DOWNSHIFT_BASE_UPWARD_SPEED,
        }
        trove:Add(UserInputService.InputBegan:Connect(function(p1, a2) -- Line: 117 -- upvalues: trove (val), Character (upval), u10 (val), ClientStateHandler (upval), States (upval), u238 (upval), p2 (val), ClientAttributesHandler (upval), u9 (ref), useAnimatorObserver (upval), Gear_2 (upval), Workspace (upval), Effects (upval), u5 (val), RunService (upval), u8 (val)
            if a2 then
                return
            elseif trove._cleaning then
                return
            else
                local v1
                if not (Character.isActive()) or not (u10[p1.KeyCode]) or ClientStateHandler.isStateBusy(States.SWIMMING) then
                    return
                end
                _, v1 = Character.isGrounded()
                if not v1 then
                    if Character.isSeated() then
                        return
                    end
                    local v2 = p2.busy()
                    if not v2 then
                        v2 = ClientStateHandler.isStateBusy(States.SLIDING)
                        if not v2 then
                            v2 = ClientStateHandler.isStateBusy(States.GRAPPLING)
                            if not v2 then
                                v2 = ClientStateHandler.isStateBusy(States.WALL_SLIDING)
                                if not v2 then
                                    v2 = ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)
                                    if not v2 then
                                        v2 = not ClientStateHandler.isStateBusy(States.HANDLES)
                                    end
                                end
                            end
                        end
                    end
                    if v2 then
                        return
                    end
                    local u59 = u10[p1.KeyCode]
                    if not u59.attribute then
                        if not u59.attribute then
                            local v3 = tick() - u9
                            if v3 < u238.TURBINE_ABILITY_GLOBAL_COOLDOWN or not (p2.useGas(u238.TURBINE_ABILITY_GAS_COST)) then
                                return
                            end
                            local v4 = tick() - (u59.lastPressed or 0)
                            if u238.TURBINE_DOUBLE_TAP_WINDOW < v4 then
                                u59.lastPressed = tick()
                                return
                            end
                            ClientStateHandler.updateState(States.TURBINE, true)
                            u59.lastPressed = tick()
                            p2.addTimeout(u238.TURBINE_ABILITY_TIMEOUT)
                            if p2.animation then
                                p2.animation:Stop(u238.TURBINE_ANIMATION_BLEND_TIME)
                            end
                            p2.animation = useAnimatorObserver.play(u59.animation, u238.TURBINE_ANIMATION_BLEND_TIME)
                            u9 = tick()
                            local function onPerformGrapple() -- Line: 197 -- upvalues: Character (upval), Gear_2 (upval), p2 (upval), u238 (upval)
                                local v1
                                _, _, v1 = Character.isGrounded()
                                if not v1 then
                                    return
                                end
                                local v2 = Character.getCharacter()
                                if not v2 then
                                    Gear_2.warn("No character found while on perform grapple")
                                    return
                                end
                                local HumanoidRootPart = v2.HumanoidRootPart
                                p2.no_physics = true
                                p2.signals.force_grapple:Fire("Left", v1.Position + HumanoidRootPart.CFrame.RightVector * u238.TURBINE_FAKE_GRAPPLE_LEFT_OFFSET, v1.Instance)
                                p2.signals.force_grapple:Fire("Right", v1.Position + HumanoidRootPart.CFrame.RightVector * u238.TURBINE_FAKE_GRAPPLE_RIGHT_OFFSET, v1.Instance)
                                task.delay(u238.TURBINE_GRAPPLE_RELEASE_DELAY, function() -- Line: 224 -- upvalues: p2 (upval)
                                    p2.signals.ungrapple:Fire("Left")
                                    p2.signals.ungrapple:Fire("Right")
                                    task.defer(function() -- Line: 228 -- upvalues: p2 (upval)
                                        p2.no_physics = false
                                    end)
                                end)
                            end
                            local function onPerformPhysics() -- Line: 234 -- upvalues: Character (upval), Gear_2 (upval), Workspace (upval), u59 (val), u238 (upval), p2 (upval), Effects (upval), u5 (upval), RunService (upval), u8 (upval), trove (upval), ClientStateHandler (upval), States (upval)
                                local v1 = Character.getCharacter()
                                if not v1 then
                                    Gear_2.warn("No character found while on perform physics")
                                    return
                                end
                                local HumanoidRootPart = v1.HumanoidRootPart
                                local Unit = v1.HumanoidRootPart.AssemblyLinearVelocity.Unit
                                local v2 = math.max(u238.TURBINE_MIN_SPEED_MULTIPLIER, HumanoidRootPart.AssemblyLinearVelocity.Magnitude / u238.TURBINE_SPEED_MULTIPLIER_DIVISOR)
                                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(Unit.X, 0, Unit.Z).Unit * (u59.forwardSpeed * v2) + Vector3.new(0, u59.upwardSpeed * v2, 0)
                                task.defer(function() -- Line: 267 -- upvalues: p2 (upval)
                                    p2.signals.beginSimulatedMomentum:Fire()
                                end)
                                Effects.sendReplicatedEffect("Dash")
                                local u60 = u5("Aero", u238.TURBINE_FOV_ADD_AMOUNT, "add", u238.TURBINE_FOV_PRIORITY, TweenInfo.new(u238.TURBINE_FOV_IN_DURATION, Enum.EasingStyle.Back))
                                task.delay(u238.TURBINE_FOV_IN_DURATION, function() -- Line: 281 -- upvalues: u60 (val), u238 (upval)
                                    u60(TweenInfo.new(u238.TURBINE_FOV_OUT_DURATION))
                                end)
                                local u66 = nil
                                u66 = RunService.RenderStepped:Connect(function() -- Line: 287 -- upvalues: Character (upval), u238 (upval), u59 (upval), u66 (ref), HumanoidRootPart (val), u8 (upval)
                                    local v1
                                    _, v1 = Character.isGrounded()
                                    if v1 and v1 < u238.TURBINE_GROUNDED_STOP_DISTANCE and u59.upwardSpeed < 0 then
                                        u66:Disconnect()
                                        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                        local v2 = u8("turbine", u238.TURBINE_LANDING_WALK_SPEED, "set", u238.TURBINE_LANDING_WALK_SPEED_PRIORITY)
                                        task.delay(u238.TURBINE_LANDING_WALK_SPEED_DURATION, v2)
                                    end
                                end)
                                trove:Add(u66)
                                task.delay(u238.TURBINE_ABILITY_TIMEOUT, function() -- Line: 306 -- upvalues: ClientStateHandler (upval), States (upval), u66 (ref)
                                    ClientStateHandler.updateState(States.TURBINE, false)
                                    u66:Disconnect()
                                end)
                            end
                            if not u59.keyframe then
                                return onPerformPhysics()
                            end
                            if u59.keyframe and p2.animation then
                                trove:Add(p2.animation.KeyframeReached:Once(function(p1) -- Line: 315 -- upvalues: u59 (val), onPerformPhysics (val), onPerformGrapple (val)
                                    if p1 == u59.keyframe then
                                        onPerformPhysics()
                                        if p1 == "Grapple" then
                                            onPerformGrapple()
                                        end
                                    end
                                end))
                            end
                            return
                        elseif not (ClientAttributesHandler.getAttribute(u59.attribute)) then
                            return
                        end
                    elseif ClientAttributesHandler.getAttribute(u59.attribute) == 0 then
                        return
                    end
                elseif v1 < u238.TURBINE_MIN_AIRBORNE_DISTANCE then
                    return
                end
            end
        end))
    end,
}