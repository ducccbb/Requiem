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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Firearms.Flintlock
--                               Dumped in 0.00840 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Projectiles = require(Types:WaitForChild("Projectiles"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Spring = require(Common_6:WaitForChild("Spring"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Effects_2 = Common_7:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Types_2 = Common_8:WaitForChild("Types")
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_2 = Common_9:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_10:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics_2 = Common_11:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_12:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ClientInventoryHandler = require(v1.Parent.Parent:WaitForChild("ClientInventoryHandler"))
local State_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_13:WaitForChild("Common")
local Types_3 = Common_12:WaitForChild("Types")
local Firearms = require(Types_3:WaitForChild("Firearms"))
local States = ClientStateHandler.States
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_14:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_15:WaitForChild("Common")
local Utilities_3 = Common_13:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_16:WaitForChild("Common")
local Sounds_2 = Common_14:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Musket = require(Tools:WaitForChild("Musket"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_17:WaitForChild("Common")
local Animations = Common_15:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Flintlock = require(Tools_2:WaitForChild("Flintlock"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_18:WaitForChild("Common")
local Observers = Common_16:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u423 = Config.define({
    AIM_FIRE_DELAY = 0.5,
    READY_STATE_TRANSITION_TIME = 0.3,
    AIM_WALK_SPEED_DEFAULT = 4,
    AIM_WALK_SPEED_FAST = 8,
    BASE_INACCURACY_OFFSET = 7.5,
    EXAM_INACCURACY_OFFSET = 2,
    INACCURACY_DISTANCE_START = 25,
    INACCURACY_DISTANCE_RAMP = 100,
    MAX_SHOT_DISTANCE = 3000,
    BASE_RECOIL_IMPULSE = 2,
    SHOT_ID_MAX = 1000000,
})
local u424 = {
    aiming = false,
    reloading = false,
    make_ready = 0,
    aimed = 0,
    readied = 0,
}
local u425 = nil
local u426 = {}
local u427 = {}
local u428 = {}
local u429 = 1
local u430 = nil
local u433 = table.clone(u424)
local u438 = Spring.fromFrequency(1, 30, 5)
return {
    equipped = function(p1, p2) -- Line: 132 -- upvalues: Workspace (val), useWalkSpeed (val), useJumpPower (val), u433 (ref), useAnimatorObserver (val), Flintlock (val), u426 (val), u427 (ref), ClientStateHandler (val), States (val), u428 (ref), u423 (val), Players (val), RunService (val), Character (val), ClientAttributesHandler (val), ClientEnchantmentsHandler (val), u438 (val), u425 (ref), u429 (ref), u430 (ref), Sounds (val), Musket (val), Firearms (val), ClientSettingsHandler (val), UserInputService (val), Constants (val), CollectionService (val), Projectiles (val), Effects (val), ClientInventoryHandler (val)
        local onReloadAttempt, u6, u9
        local CurrentCamera = Workspace.CurrentCamera
        _, u6 = useWalkSpeed()
        _, u9 = useJumpPower()
        local function aimFlintlock(a1) -- Line: 137 -- upvalues: u433 (upval), useAnimatorObserver (upval), Flintlock (upval), u426 (upval), u427 (upval), p1 (val), ClientStateHandler (upval), States (upval), u428 (upval), u423 (upval), Players (upval), RunService (upval), Character (upval), ClientAttributesHandler (upval), u6 (val), ClientEnchantmentsHandler (upval), u9 (val)
            local v1
            if u433.make_ready ~= 2 then
                local AIM_WALK_SPEED_FAST, v2, v3
                if u433.make_ready ~= 1 or tick() < u433.readied then
                    return
                end
                if not a1 then
                    v2 = 0.2
                else
                    v2 = 0
                end
                useAnimatorObserver.stop(Flintlock.Ready.One, v2)
                if not a1 then
                    v3 = 0.5
                else
                    v3 = 0
                end
                u426.aim = useAnimatorObserver.play(Flintlock.Aim, v3)
                local Mouse = Players.LocalPlayer:GetMouse()
                local Character_2 = Players.LocalPlayer.Character
                if Character_2 then
                    Character_2 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                end
                local Character_3 = Players.LocalPlayer.Character
                if Character_3 then
                    Character_3 = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                end
                u427.aim_align = RunService.RenderStepped:Connect(function() -- Line: 175 -- upvalues: Character_2 (val), u427 (upval), Character_3 (val), Character (upval), u433 (upval), Mouse (val)
                    local Hit, v1
                    if not Character_2 then
                        u427.aim_align:Disconnect()
                        return
                    end
                    if not Character_3 then
                        if Character.isRagdolled() or u433.reloading then
                            return
                        end
                        Hit = Mouse.Hit
                        v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                        Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                        return
                    end
                    if Character_3.Sit or Character.isRagdolled() or u433.reloading then
                        return
                    end
                    Hit = Mouse.Hit
                    v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                    Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                end)
                p1({code = 3, aiming = true})
                u433.aiming = true
                ClientStateHandler.updateState(States.AIMING, true)
                if ClientAttributesHandler.getAttribute("FasterMusketWalkSpeed") ~= 1 then
                    AIM_WALK_SPEED_FAST = u423.AIM_WALK_SPEED_DEFAULT
                else
                    AIM_WALK_SPEED_FAST = u423.AIM_WALK_SPEED_FAST
                    if not AIM_WALK_SPEED_FAST then
                        AIM_WALK_SPEED_FAST = u423.AIM_WALK_SPEED_DEFAULT
                    end
                end
                table.insert(u428, u6("musket", AIM_WALK_SPEED_FAST, "set", 20))
                if not (ClientEnchantmentsHandler.hasEnchantment("Windshot")) then
                    table.insert(u428, u9("musket", 0, "set", 20))
                end
                u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                u433.aimed = tick()
                local v4 = u433
                v4.make_ready = v4.make_ready + 1
                return
            elseif u433.aiming then
                v1 = u433
                v1.make_ready = v1.make_ready - 1
                useAnimatorObserver.stop(Flintlock.Aim, 0.3)
                u426.ready = useAnimatorObserver.play(Flintlock.Ready.One, 0.3)
                if u427.aim_align then
                    u427.aim_align:Disconnect()
                    p1({code = 3, aiming = false})
                end
                u433.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                for k, v in pairs(u428) do
                    v()
                end
                u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                return
            end
        end
        u427.recoil = RunService.PreRender:Connect(function(p1) -- Line: 224 -- upvalues: CurrentCamera (val), u438 (upval)
            local v1 = CurrentCamera
            v1.CFrame = v1.CFrame * CFrame.Angles(u438.Offset, 0, 0)
        end)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 228 -- upvalues: u425 (upval), useAnimatorObserver (upval), Flintlock (upval)
            u425 = useAnimatorObserver.bind(p1.Humanoid.Animator, Flintlock, 4)
        end)
        if ClientAttributesHandler.getAttribute("HasQuickDrawFlintlock") ~= 1 then
            function onReloadAttempt() -- Line: 250 -- upvalues: u429 (upval), u433 (upval), useAnimatorObserver (upval), Flintlock (upval), u427 (upval), p1 (val), ClientStateHandler (upval), States (upval), u428 (upval), ClientAttributesHandler (upval), u426 (upval), RunService (upval), Players (upval), u430 (upval), Sounds (upval), Musket (upval)
                local Character, HumanoidRootPart
                if u429 == 1 or u433.reloading then
                    return
                end
                if u433.aiming then
                    useAnimatorObserver.stop(Flintlock.Aim, 0.3)
                    if u427.aim_align then
                        u427.aim_align:Disconnect()
                        u427.aim_align = nil
                        p1({code = 3, aiming = false})
                    end
                    u433.aiming = false
                    ClientStateHandler.updateState(States.AIMING, false)
                    u433.make_ready = math.max(u433.make_ready - 1, 0)
                    for k, v in pairs(u428) do
                        v()
                    end
                    u428 = {}
                end
                local u58 = useAnimatorObserver.play(Flintlock.Reload, 0.5)
                if not u58 then
                    return
                end
                local u63 = ClientAttributesHandler.getAttribute("FirearmReloadMultiplier") or 0
                u58:AdjustSpeed(0.35 * u63)
                u426.reload = u58
                u433.reloading = true
                local v1 = {code = 4, sound = "reload"}
                p1(v1)
                if ClientAttributesHandler.getAttribute("ReloadsFasterWhileStill") == 1 then
                    u427.reload_velocity = RunService.RenderStepped:Connect(function() -- Line: 305 -- upvalues: Players (upval), u63 (val), u58 (val)
                        local Character = Players.LocalPlayer.Character
                        if Character then
                            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                            if HumanoidRootPart then
                                local v1 = u63
                                if HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 then
                                    v1 = v1 + 0.25
                                end
                                u58:AdjustSpeed(v1)
                            end
                        end
                    end)
                end
                Character = Players.LocalPlayer.Character
                if not Character then
                    return
                end
                local Speed = u58.Speed
                HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                u430 = Sounds.playRangedSoundEffect(Musket.Reload, HumanoidRootPart, 400, 1, 1.3, Speed)
                u427.reload = u58.Stopped:Once(function() -- Line: 339 -- upvalues: u429 (upval), u433 (upval), p1 (upval), u430 (upval), u427 (upval)
                    u429 = 1
                    u433.reloading = false
                    p1({code = 4, sound = "finish_reload"})
                    u430:Stop()
                    u430:Destroy()
                    if u427.reload_velocity then
                        u427.reload_velocity:Disconnect()
                    end
                end)
            end
            u427.damage_reload_cancel = Firearms.connectDamageCancelReload({
                state = u433,
                tracks = u426,
                connections = u427,
                onCancel = function() end,
            })
            u427.aim = ClientSettingsHandler.onKeybindPressed("Musket Aim"):Connect(function() -- Line: 376 -- upvalues: aimFlintlock (val)
                aimFlintlock()
            end)
            u427.reloading = ClientSettingsHandler.onKeybindPressed("Musket Reload"):Connect(onReloadAttempt)
            u427.click = UserInputService.InputBegan:Connect(function(a1) -- Line: 382 -- upvalues: u433 (upval), u423 (upval), u426 (upval), useAnimatorObserver (upval), Flintlock (upval), Sounds (upval), Musket (upval), u429 (upval), onReloadAttempt (val), Players (upval), ClientAttributesHandler (upval), Constants (upval), CollectionService (upval), u438 (upval), Projectiles (upval), Effects (upval), p1 (val), ClientInventoryHandler (upval)
                if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                else
                    local v1 = tick() - u433.aimed
                    if v1 < u423.AIM_FIRE_DELAY then
                        return
                    elseif tick() < u433.readied then
                        return
                    elseif not u426.quick_draw then
                        if u433.make_ready == 0 then
                            v1 = u433
                            v1.make_ready = v1.make_ready + 1
                            u426.ready_one = useAnimatorObserver.play(Flintlock.Ready.One, 0.2)
                            Sounds.playGlobalSoundEffect(Musket.ready, 0.1)
                            u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                            return
                        end
                        if u433.make_ready ~= 1 then
                            local BASE_INACCURACY_OFFSET
                            if u433.make_ready < 2 then
                                return
                            end
                            if u429 <= 0 then
                                onReloadAttempt()
                                return
                            end
                            local LocalPlayer = Players.LocalPlayer
                            local Character = LocalPlayer.Character
                            local Flintlock_2 = Character
                            if Flintlock_2 then
                                Flintlock_2 = Character:FindFirstChild("Flintlock")
                            end
                            local Exit = Flintlock_2
                            if Exit then
                                Exit = Flintlock_2:FindFirstChild("Exit", true)
                            end
                            local Mouse = LocalPlayer:GetMouse()
                            if not Exit then
                                return
                            end
                            BASE_INACCURACY_OFFSET = if game.PlaceId == Constants.Places.Exam then u423.EXAM_INACCURACY_OFFSET else u423.BASE_INACCURACY_OFFSET
                            local v2 = math.max(0, ((Mouse.Hit.Position - Exit.WorldPosition).Magnitude - u423.INACCURACY_DISTANCE_START) / u423.INACCURACY_DISTANCE_RAMP) * BASE_INACCURACY_OFFSET
                            local v3 = math.clamp(v2, 0, BASE_INACCURACY_OFFSET)
                            local v4 = math.random(-v3, v3)
                            local v5 = math.random(-v3, v3)
                            v4 = Mouse.Hit.Position + Vector3.new(v4, v5, math.random(-v3, v3)) * (1 - (ClientAttributesHandler.getAttribute("FirearmAccuracyMultiplier") or 0))
                            local Unit = (v4 - Exit.WorldPosition).Unit
                            local Tagged = CollectionService:GetTagged("Ungrappleable")
                            v5 = RaycastParams.new()
                            v5.FilterType = Enum.RaycastFilterType.Exclude
                            v5.FilterDescendantsInstances = {Character, Flintlock_2, Tagged}
                            local v6 = workspace:Raycast(Exit.WorldPosition, Unit * u423.MAX_SHOT_DISTANCE, v5)
                            u429 = u429 - 1
                            useAnimatorObserver.play(Flintlock.Fire)
                            local v7 = math.random(1, u423.SHOT_ID_MAX)
                            u438:AddVelocity(u423.BASE_RECOIL_IMPULSE * (ClientAttributesHandler.getAttribute("FirearmRecoilMultiplier") or 0))
                            local v8 = Projectiles.getProjectilePhysics(Players.LocalPlayer, "Flintlock")
                            Effects.clientEmitEffect("Bullet", {
                                isServerSent = false,
                                exit = Exit.WorldPosition,
                                direction = Unit,
                                speed = v8.speed,
                                dropoff = v8.dropoff,
                                gravity = v8.gravity,
                                id = v7,
                                owner = Players.LocalPlayer.UserId,
                            })
                            p1({code = 1, direction = Unit, origin = Exit.WorldPosition, id = v7})
                            local v9 = ClientAttributesHandler.getAttribute("FirearmUnequipSpeed") or 2
                            ClientInventoryHandler.addItemEquipCooldown(v9)
                            if v6 then
                                if v6.Instance and v6.Instance:IsA("BasePart") and v6.Instance.Name == "Target" then
                                    workspace:SetAttribute("Muskets", (workspace:GetAttribute("Muskets") or 0) + 1)
                                end
                                p1({code = 2, hit = v6.Instance, id = v7, origin = Exit.WorldPosition})
                            end
                            return
                        elseif not u433.aiming then
                            useAnimatorObserver.stop(Flintlock.Ready.One, 0.2)
                            u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                            Sounds.playGlobalSoundEffect(Musket.ready, 0.1)
                            v1 = u433
                            v1.make_ready = v1.make_ready - 1
                            return
                        end
                    elseif u426.quick_draw.IsPlaying then
                        return
                    end
                end
            end)
            return
        end
        u426.quick_draw = useAnimatorObserver.play(Flintlock.QuickDraw, 0.5)
        if not u426.quick_draw then
            return
        end
        u427.quick_draw = u426.quick_draw.Stopped:Once(function() -- Line: 239 -- upvalues: u433 (upval), aimFlintlock (val), u423 (upval)
            u433.make_ready = 1
            aimFlintlock(true)
            u433.aimed = tick() - u423.AIM_FIRE_DELAY
            u433.readied = tick() - u423.AIM_FIRE_DELAY
        end)
        function onReloadAttempt() -- Line: 250 -- upvalues: u429 (upval), u433 (upval), useAnimatorObserver (upval), Flintlock (upval), u427 (upval), p1 (val), ClientStateHandler (upval), States (upval), u428 (upval), ClientAttributesHandler (upval), u426 (upval), RunService (upval), Players (upval), u430 (upval), Sounds (upval), Musket (upval)
            local Character, HumanoidRootPart
            if u429 == 1 or u433.reloading then
                return
            end
            if u433.aiming then
                useAnimatorObserver.stop(Flintlock.Aim, 0.3)
                if u427.aim_align then
                    u427.aim_align:Disconnect()
                    u427.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u433.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                u433.make_ready = math.max(u433.make_ready - 1, 0)
                for k, v in pairs(u428) do
                    v()
                end
                u428 = {}
            end
            local u58 = useAnimatorObserver.play(Flintlock.Reload, 0.5)
            if not u58 then
                return
            end
            local u63 = ClientAttributesHandler.getAttribute("FirearmReloadMultiplier") or 0
            u58:AdjustSpeed(0.35 * u63)
            u426.reload = u58
            u433.reloading = true
            local v1 = {code = 4, sound = "reload"}
            p1(v1)
            if ClientAttributesHandler.getAttribute("ReloadsFasterWhileStill") == 1 then
                u427.reload_velocity = RunService.RenderStepped:Connect(function() -- Line: 305 -- upvalues: Players (upval), u63 (val), u58 (val)
                    local Character = Players.LocalPlayer.Character
                    if Character then
                        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                        if HumanoidRootPart then
                            local v1 = u63
                            if HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 then
                                v1 = v1 + 0.25
                            end
                            u58:AdjustSpeed(v1)
                        end
                    end
                end)
            end
            Character = Players.LocalPlayer.Character
            if not Character then
                return
            end
            local Speed = u58.Speed
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            u430 = Sounds.playRangedSoundEffect(Musket.Reload, HumanoidRootPart, 400, 1, 1.3, Speed)
            u427.reload = u58.Stopped:Once(function() -- Line: 339 -- upvalues: u429 (upval), u433 (upval), p1 (upval), u430 (upval), u427 (upval)
                u429 = 1
                u433.reloading = false
                p1({code = 4, sound = "finish_reload"})
                u430:Stop()
                u430:Destroy()
                if u427.reload_velocity then
                    u427.reload_velocity:Disconnect()
                end
            end)
        end
        u427.damage_reload_cancel = Firearms.connectDamageCancelReload({
            state = u433,
            tracks = u426,
            connections = u427,
            onCancel = function() end,
        })
        u427.aim = ClientSettingsHandler.onKeybindPressed("Musket Aim"):Connect(function() -- Line: 376 -- upvalues: aimFlintlock (val)
            aimFlintlock()
        end)
        u427.reloading = ClientSettingsHandler.onKeybindPressed("Musket Reload"):Connect(onReloadAttempt)
        u427.click = UserInputService.InputBegan:Connect(function(a1) -- Line: 382 -- upvalues: u433 (upval), u423 (upval), u426 (upval), useAnimatorObserver (upval), Flintlock (upval), Sounds (upval), Musket (upval), u429 (upval), onReloadAttempt (val), Players (upval), ClientAttributesHandler (upval), Constants (upval), CollectionService (upval), u438 (upval), Projectiles (upval), Effects (upval), p1 (val), ClientInventoryHandler (upval)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            else
                local v1 = tick() - u433.aimed
                if v1 < u423.AIM_FIRE_DELAY then
                    return
                elseif tick() < u433.readied then
                    return
                elseif not u426.quick_draw then
                    if u433.make_ready == 0 then
                        v1 = u433
                        v1.make_ready = v1.make_ready + 1
                        u426.ready_one = useAnimatorObserver.play(Flintlock.Ready.One, 0.2)
                        Sounds.playGlobalSoundEffect(Musket.ready, 0.1)
                        u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                        return
                    end
                    if u433.make_ready ~= 1 then
                        local BASE_INACCURACY_OFFSET
                        if u433.make_ready < 2 then
                            return
                        end
                        if u429 <= 0 then
                            onReloadAttempt()
                            return
                        end
                        local LocalPlayer = Players.LocalPlayer
                        local Character = LocalPlayer.Character
                        local Flintlock_2 = Character
                        if Flintlock_2 then
                            Flintlock_2 = Character:FindFirstChild("Flintlock")
                        end
                        local Exit = Flintlock_2
                        if Exit then
                            Exit = Flintlock_2:FindFirstChild("Exit", true)
                        end
                        local Mouse = LocalPlayer:GetMouse()
                        if not Exit then
                            return
                        end
                        BASE_INACCURACY_OFFSET = if game.PlaceId == Constants.Places.Exam then u423.EXAM_INACCURACY_OFFSET else u423.BASE_INACCURACY_OFFSET
                        local v2 = math.max(0, ((Mouse.Hit.Position - Exit.WorldPosition).Magnitude - u423.INACCURACY_DISTANCE_START) / u423.INACCURACY_DISTANCE_RAMP) * BASE_INACCURACY_OFFSET
                        local v3 = math.clamp(v2, 0, BASE_INACCURACY_OFFSET)
                        local v4 = math.random(-v3, v3)
                        local v5 = math.random(-v3, v3)
                        v4 = Mouse.Hit.Position + Vector3.new(v4, v5, math.random(-v3, v3)) * (1 - (ClientAttributesHandler.getAttribute("FirearmAccuracyMultiplier") or 0))
                        local Unit = (v4 - Exit.WorldPosition).Unit
                        local Tagged = CollectionService:GetTagged("Ungrappleable")
                        v5 = RaycastParams.new()
                        v5.FilterType = Enum.RaycastFilterType.Exclude
                        v5.FilterDescendantsInstances = {Character, Flintlock_2, Tagged}
                        local v6 = workspace:Raycast(Exit.WorldPosition, Unit * u423.MAX_SHOT_DISTANCE, v5)
                        u429 = u429 - 1
                        useAnimatorObserver.play(Flintlock.Fire)
                        local v7 = math.random(1, u423.SHOT_ID_MAX)
                        u438:AddVelocity(u423.BASE_RECOIL_IMPULSE * (ClientAttributesHandler.getAttribute("FirearmRecoilMultiplier") or 0))
                        local v8 = Projectiles.getProjectilePhysics(Players.LocalPlayer, "Flintlock")
                        Effects.clientEmitEffect("Bullet", {
                            isServerSent = false,
                            exit = Exit.WorldPosition,
                            direction = Unit,
                            speed = v8.speed,
                            dropoff = v8.dropoff,
                            gravity = v8.gravity,
                            id = v7,
                            owner = Players.LocalPlayer.UserId,
                        })
                        p1({code = 1, direction = Unit, origin = Exit.WorldPosition, id = v7})
                        local v9 = ClientAttributesHandler.getAttribute("FirearmUnequipSpeed") or 2
                        ClientInventoryHandler.addItemEquipCooldown(v9)
                        if v6 then
                            if v6.Instance and v6.Instance:IsA("BasePart") and v6.Instance.Name == "Target" then
                                workspace:SetAttribute("Muskets", (workspace:GetAttribute("Muskets") or 0) + 1)
                            end
                            p1({code = 2, hit = v6.Instance, id = v7, origin = Exit.WorldPosition})
                        end
                        return
                    elseif not u433.aiming then
                        useAnimatorObserver.stop(Flintlock.Ready.One, 0.2)
                        u433.readied = tick() + u423.READY_STATE_TRANSITION_TIME
                        Sounds.playGlobalSoundEffect(Musket.ready, 0.1)
                        v1 = u433
                        v1.make_ready = v1.make_ready - 1
                        return
                    end
                elseif u426.quick_draw.IsPlaying then
                    return
                end
            end
        end)
    end,
    unequipped = function() -- Line: 521 -- upvalues: u427 (ref), u428 (ref), u425 (ref), u426 (val), u430 (ref), u433 (ref), u424 (val), ClientStateHandler (val), States (val)
        for k, v in pairs(u427) do
            v:Disconnect()
        end
        for k2, i in pairs(u428) do
            i()
        end
        if u425 then
            u425()
            u425 = nil
        end
        for k3, j in pairs(u426) do
            if j then
                j:Stop()
            end
        end
        if u430 then
            u430:Stop()
            u430:Destroy()
        end
        u433 = table.clone(u424)
        u427 = {}
        u428 = {}
        ClientStateHandler.updateState(States.AIMING, false)
    end,
    data = {
        description = "A military grade musket, used for long range combat.",
        attributes = {"Identifier Associated"},
        category = require(Types_2:WaitForChild("Item")).CATEGORIES.Weapon,
    },
}