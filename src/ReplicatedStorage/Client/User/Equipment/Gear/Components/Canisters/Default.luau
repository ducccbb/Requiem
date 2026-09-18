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
--    File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Canisters.Default
--                               Dumped in 0.00171 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Companions = require(Namespaces:WaitForChild("Companions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Gear = require(Namespaces_2:WaitForChild("Gear"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Constants = require(Common_6:WaitForChild("Constants"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_7:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Effects_2 = Common_8:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Animations = Common_10:WaitForChild("Animations")
local Gear_2 = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Observers = Common_11:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_12:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_13:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u272 = Config.define({
    DASH_BASE_GAS_COST = 50,
    DOUBLE_DASH_CHAIN_COOLDOWN_SECONDS = 0.5,
    DASH_COOLDOWN_SECONDS = 3,
    DOUBLE_TAP_INPUT_WINDOW_SECONDS = 0.19,
    DASH_VELOCITY_WITH_BODY_VELOCITY = 300,
    DASH_FALLBACK_MIN_SPEED = 150,
    DASH_FALLBACK_MAX_SPEED = 300,
    DASH_FALLBACK_SPEED_MULTIPLIER = 1.075,
    DASH_FALLBACK_DIRECTION_MULTIPLIER = 1.15,
    DASH_FOV_ADD = 20,
    DASH_FOV_DECAY = 4,
    DASH_FOV_IN_TWEEN_SECONDS = 0.3,
    DASH_FOV_RESTORE_DELAY_SECONDS = 0.3,
    DASH_FOV_OUT_TWEEN_SECONDS = 0.6,
    DASH_MOMENTUM_RESUME_DELAY_SECONDS = 0.15,
})
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_14:WaitForChild("Common")
local Gear_3 = require(Common_12:WaitForChild("Logger"))("Gear")
local u291 = 0
return {
    initialized = function(p1, p2) -- Line: 96 -- upvalues: useFieldOfView (val), Character (val), Gear_3 (val), ClientAttributesHandler (val), ClientStateHandler (val), States (val), Companions (val), u291 (ref), u272 (val), Workspace (val), useAnimatorObserver (val), Gear_2 (val), Effects (val), Signals (val), Gear (val), UserInputService (val), Constants (val)
        local u5
        local trove = p2.trove
        _, u5 = useFieldOfView()
        local u6 = nil
        local u7 = {}
        local u8 = 0
        local u9 = {}
        u9[Enum.KeyCode.W] = Vector3.new(0, 0, -1)
        u9[Enum.KeyCode.A] = Vector3.new(-1, 0, 0)
        u9[Enum.KeyCode.S] = Vector3.new(0, 0, 1)
        u9[Enum.KeyCode.D] = Vector3.new(1, 0, 0)
        local function onDoubleDashAttempt(p1, a2) -- Line: 112 -- upvalues: Character (upval), Gear_3 (upval), ClientAttributesHandler (upval), ClientStateHandler (upval), States (upval), Companions (upval), u291 (upval), u8 (ref), u272 (upval), p2 (val), Workspace (upval), useAnimatorObserver (upval), Gear_2 (upval), Effects (upval), u6 (ref), u5 (val), Signals (upval)
            local v1
            local v2 = Character.getCharacter()
            if not v2 then
                Gear_3.warn("No character found while on double dash attempt")
                return
            end
            local HumanoidRootPart = v2.HumanoidRootPart
            local BodyVelocity = HumanoidRootPart:FindFirstChildWhichIsA("BodyVelocity")
            local v3 = Character.isGrounded(v2)
            local v4 = Character.isSeated(v2)
            local Attribute = v2:GetAttribute("Mounted")
            local v5 = ClientAttributesHandler.getAttribute("HasExpertRider") == 1
            if a2 == Enum.KeyCode.W then
                v1 = "Forward"
            elseif a2 == Enum.KeyCode.S then
                v1 = "Backward"
            elseif a2 ~= Enum.KeyCode.A then
                v1 = if a2 == Enum.KeyCode.D then "Right" else false
            else
                v1 = "Left"
            end
            if not v4 then
                if ClientStateHandler.isStateBusy(States.SWIMMING) then
                    return
                end
                if ClientAttributesHandler.getAttribute("GearCanDash") == 0 then
                    return
                elseif not Attribute then
                    if not (ClientStateHandler.isStateBusy(States.HANDLES)) then
                        return
                    end
                    if not v3 then
                        local v6
                        local v7 = {States.GEAR_SWING}
                        if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE, v7) or ClientStateHandler.isStateBusy(States.WALL_HANGING) then
                            return
                        end
                        if Attribute then
                            Companions.Dismount.post()
                            task.wait(0.1)
                        end
                        local v8 = ClientAttributesHandler.getAttribute("GearCanDoubleDash") == 1
                        if not v8 then
                            v7 = 1
                        else
                            v7 = 2
                        end
                        if v7 <= u291 then
                            v6 = tick() - u8
                            if v6 < u272.DASH_COOLDOWN_SECONDS then
                                return
                            end
                            u291 = 0
                        elseif 0 >= u291 then
                            u291 = u291 + 1
                            local GearDashGasMultiplier = ClientAttributesHandler.getAttribute("GearDashGasMultiplier")
                            if 0 >= GearDashGasMultiplier then
                                u8 = tick()
                                local v9 = Workspace.CurrentCamera.CFrame:VectorToWorldSpace(p1)
                                if p2.animation then
                                    p2.animation:Stop(0.2)
                                end
                                local v10 = Gear_2.Dashes[v1]
                                useAnimatorObserver.play(v10, 0.2)
                                Effects.sendReplicatedEffect("Dash")
                                u6 = u5("Dash", u272.DASH_FOV_ADD, "add", u272.DASH_FOV_DECAY, TweenInfo.new(u272.DASH_FOV_IN_TWEEN_SECONDS, Enum.EasingStyle.Back))
                                task.delay(u272.DASH_FOV_RESTORE_DELAY_SECONDS, function() -- Line: 223 -- upvalues: u6 (upval), u272 (upval)
                                    u6(TweenInfo.new(u272.DASH_FOV_OUT_TWEEN_SECONDS))
                                end)
                                Signals.PlayerDashBoosted:Fire()
                                p2.signals.clearMomentum:Fire()
                                if not BodyVelocity then
                                    v10 = math.clamp(HumanoidRootPart.AssemblyLinearVelocity.Magnitude, u272.DASH_FALLBACK_MIN_SPEED, u272.DASH_FALLBACK_MAX_SPEED)
                                    HumanoidRootPart.AssemblyLinearVelocity = v9 * (v10 * u272.DASH_FALLBACK_SPEED_MULTIPLIER) * u272.DASH_FALLBACK_DIRECTION_MULTIPLIER
                                else
                                    HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity + v9 * u272.DASH_VELOCITY_WITH_BODY_VELOCITY
                                    BodyVelocity.Velocity = BodyVelocity.Velocity + v9 * u272.DASH_VELOCITY_WITH_BODY_VELOCITY
                                end
                                task.delay(u272.DASH_MOMENTUM_RESUME_DELAY_SECONDS, function() -- Line: 245 -- upvalues: ClientStateHandler (upval), States (upval), p2 (upval)
                                    if not (ClientStateHandler.isStateBusy(States.GRAPPLING)) then
                                        p2.signals.beginSimulatedMomentum:Fire()
                                    end
                                end)
                                p2.signals.impulse:Fire(3)
                                return
                            elseif not (p2.useGas(u272.DASH_BASE_GAS_COST * GearDashGasMultiplier)) then
                                return
                            end
                        else
                            v6 = tick() - u8
                            if v6 < u272.DOUBLE_DASH_CHAIN_COOLDOWN_SECONDS then
                                return
                            end
                        end
                    elseif ClientAttributesHandler.getAttribute("GearCanGroundDash") == 0 and Attribute then
                        return
                    end
                elseif not v5 then
                    return
                end
            elseif not Attribute then
                return
            end
        end
        trove:Add(p2.signals.boosting:Connect(function(p1) -- Line: 255 -- upvalues: Gear (upval)
            local v1
            if not p1 then
                v1 = 0
            else
                v1 = 1
            end
            Gear.Gas.post(v1)
        end))
        trove:Add(UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 259 -- upvalues: u9 (val), u7 (val), u272 (upval), Constants (upval), onDoubleDashAttempt (val)
            if p2 then
                return
            end
            local KeyCode = p1.KeyCode
            local v1 = u9[KeyCode]
            if not v1 then
                return
            end
            if not (u7[KeyCode]) then
                u7[KeyCode] = tick()
                return
            end
            local v2 = tick() - u7[KeyCode]
            if v2 >= u272.DOUBLE_TAP_INPUT_WINDOW_SECONDS then
                u7[KeyCode] = tick()
                return
            end
            if game.PlaceId == Constants.Places.Exam then
                return
            end
            onDoubleDashAttempt(v1, KeyCode)
            u7[KeyCode] = tick()
        end))
    end,
}