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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Firearms.ScopedKar98k
--                               Dumped in 0.00810 seconds
--                          Bytecode version 9  |  17 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Spring = require(Common_4:WaitForChild("Spring"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Effects_2 = Common_5:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_6:WaitForChild("Types")
local Projectiles = require(Types:WaitForChild("Projectiles"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Alive = require(Common_7:WaitForChild("Alive"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Types_2 = Common_8:WaitForChild("Types")
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_2 = Common_9:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local State = u0.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_10:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Statistics_2 = Common_11:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_13:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ClientInventoryHandler = require(u0.Parent.Parent:WaitForChild("ClientInventoryHandler"))
local State_2 = u0.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_14:WaitForChild("Common")
local Types_3 = Common_12:WaitForChild("Types")
local Firearms = require(Types_3:WaitForChild("Firearms"))
local States = ClientStateHandler.States
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_15:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_16:WaitForChild("Common")
local Utilities_3 = Common_13:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_17:WaitForChild("Common")
local Sounds_2 = Common_14:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Kar98k = require(Tools:WaitForChild("Kar98k"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_18:WaitForChild("Common")
local Animations = Common_15:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Kar98k_2 = require(Tools_2:WaitForChild("Kar98k"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_19:WaitForChild("Common")
local Observers = Common_16:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u428 = Config.define({
    AIM_FIRE_DELAY = 0.5,
    AIM_WALK_SPEED_DEFAULT = 4,
    AIM_WALK_SPEED_FAST = 8,
    BASE_INACCURACY_OFFSET = 2.5,
    EXAM_INACCURACY_OFFSET = 2,
    INACCURACY_DISTANCE_START = 200,
    INACCURACY_DISTANCE_RAMP = 500,
    MAX_SHOT_DISTANCE = 6000,
    BASE_RECOIL_IMPULSE = 2,
    SHOT_ID_MAX = 1000000,
    CHAMBER_DELAY = 1,
    FIRE_DELAY = 1,
    MAX_RANGED = 0.1,
    ZOOM_TWEEN_DURATION = 0.5,
    ZOOMED_FOV = 45,
    DEFAULT_FOV = 70,
    MIN_ZOOM_SCROLL_FOV = 1,
    MOUSE_WHEEL_FOV_STEP = 1,
    MOUSE_SENSITIVITY_STEP = 0.004,
    DEFAULT_MOUSE_SENSITIVITY = 1,
    ZOOMED_CAMERA_MIN_DISTANCE = 0,
    ZOOMED_CAMERA_MAX_DISTANCE = 0,
    DEFAULT_CAMERA_MIN_DISTANCE = 0.5,
    DEFAULT_CAMERA_MAX_DISTANCE = 128,
})
local u429 = {
    aiming = false,
    reloading = false,
    scoped = false,
    aimed = 0,
    chambering = false,
}
local u430 = nil
local u431 = {}
local u432 = {}
local u433 = {}
local u434 = 5
local u435 = nil
local u436 = nil
local u437 = nil
local u440 = table.clone(u429)
local u445 = Spring.fromFrequency(1, 30, 5)
local u450 = TweenInfo.new(u428.ZOOM_TWEEN_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local u451 = nil
return {
    equipped = function(p1, p2) -- Line: 164 -- upvalues: Workspace (val), useWalkSpeed (val), useJumpPower (val), Alive (val), ReplicatedStorage (val), u432 (ref), RunService (val), u445 (val), Character (val), u430 (ref), useAnimatorObserver (val), Kar98k_2 (val), Sounds (val), Kar98k (val), u0 (val), u451 (ref), u440 (ref), UserInputService (val), TweenService (val), u450 (val), u428 (val), u434 (ref), ClientStateHandler (val), States (val), u433 (ref), ClientAttributesHandler (val), u431 (val), u437 (ref), Firearms (val), ClientSettingsHandler (val), ClientEnchantmentsHandler (val), u436 (ref), u435 (ref), Effects (val), CollectionService (val), Projectiles (val), ClientInventoryHandler (val)
        local u6, u9
        local CurrentCamera = Workspace.CurrentCamera
        _, u6 = useWalkSpeed()
        _, u9 = useJumpPower()
        local u10 = nil
        local u11 = nil
        local LocalPlayer = Alive.LocalPlayer
        local u21 = ReplicatedStorage.Assets.Particles.UI.ScopedKar98k:Clone()
        u21.Parent = LocalPlayer.PlayerGui
        u432.recoil = RunService.PreRender:Connect(function(p1) -- Line: 177 -- upvalues: CurrentCamera (val), u445 (upval)
            local v1 = CurrentCamera
            v1.CFrame = v1.CFrame * CFrame.Angles(u445.Offset, 0, 0)
        end)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 181 -- upvalues: u430 (upval), useAnimatorObserver (upval), Kar98k_2 (upval)
            u430 = useAnimatorObserver.bind(p1.Humanoid.Animator, Kar98k_2, 4)
        end)
        local equip = Kar98k.equip
        local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        Sounds.playRangedSoundEffect(equip, HumanoidRootPart, 100, 1, 1)
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        local u57 = v1:FindFirstChild(u0.Name)
        if not u57 then
            return
        end
        function u451() -- Line: 203 -- upvalues: u440 (upval), UserInputService (upval), TweenService (upval), LocalPlayer (val), u450 (upval), u428 (upval), u21 (val)
            u440.scoped = false
            UserInputService.MouseIconEnabled = true
            TweenService:Create(LocalPlayer, u450, {CameraMaxZoomDistance = u428.DEFAULT_CAMERA_MAX_DISTANCE, CameraMinZoomDistance = u428.DEFAULT_CAMERA_MIN_DISTANCE}):Play()
            TweenService:Create(workspace.CurrentCamera, u450, {FieldOfView = u428.DEFAULT_FOV}):Play()
            local ImageLabel = u21:FindFirstChild("ImageLabel")
            TweenService:Create(ImageLabel, u450, {ImageTransparency = 1, Size = UDim2.new(4, 0, 4, 0)}):Play()
            local Scope = u21:FindFirstChild("Scope")
            Scope.Visible = false
            UserInputService.MouseDeltaSensitivity = u428.DEFAULT_MOUSE_SENSITIVITY
        end
        local function onReloadAttempt() -- Line: 221 -- upvalues: u434 (upval), u440 (upval), useAnimatorObserver (upval), Kar98k_2 (upval), u432 (upval), p1 (val), ClientStateHandler (upval), States (upval), u433 (upval), u451 (upval), ClientAttributesHandler (upval), u431 (upval), RunService (upval), LocalPlayer (val), u437 (upval)
            if 5 <= u434 or u440.reloading then
                return
            end
            if u440.aiming then
                useAnimatorObserver.stop(Kar98k_2.Aim, 0.3)
                if u432.aim_align then
                    u432.aim_align:Disconnect()
                    u432.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u440.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                for k, v in pairs(u433) do
                    v()
                end
                u433 = {}
                u451()
                useAnimatorObserver.stop(Kar98k_2.ScopedAim)
                useAnimatorObserver.play(Kar98k_2.Idle, 0.1)
            end
            if u440.scoped then
                u451()
                useAnimatorObserver.stop(Kar98k_2.ScopedAim)
                useAnimatorObserver.play(Kar98k_2.Idle, 0.1)
            end
            local u80 = useAnimatorObserver.play(Kar98k_2.Reload, 0.5)
            if not u80 then
                return
            end
            local u85 = ClientAttributesHandler.getAttribute("FirearmReloadMultiplier") or 0
            u80:AdjustSpeed(u85)
            u431.reload = u80
            u440.reloading = true
            if ClientAttributesHandler.getAttribute("ReloadsFasterWhileStill") == 1 then
                u432.reload_velocity = RunService.RenderStepped:Connect(function() -- Line: 280 -- upvalues: LocalPlayer (upval), u85 (val), u80 (val)
                    local Character = LocalPlayer.Character
                    if not Character then
                        return
                    end
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart then
                        return
                    end
                    local v1 = u85
                    if HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 then
                        v1 = v1 + 0.25
                    end
                    u80:AdjustSpeed(v1)
                end)
            end
            if not LocalPlayer.Character then
                return
            end
            u437 = u80.Speed
            p1({code = 4, sound = "reload", reloadSoundSpeed = u437})
            u432.reload = u80.Stopped:Once(function() -- Line: 315 -- upvalues: u434 (upval), u440 (upval), p1 (upval), u432 (upval)
                u434 = 5
                u440.reloading = false
                p1({code = 4, sound = "finish_reload"})
                if u432.reload_velocity then
                    u432.reload_velocity:Disconnect()
                end
            end)
        end
        u432.damage_reload_cancel = Firearms.connectDamageCancelReload({
            state = u440,
            tracks = u431,
            connections = u432,
            onCancel = function() end,
        })
        u432.aim = ClientSettingsHandler.onKeybindPressed("Musket Aim"):Connect(function() -- Line: 344 -- upvalues: u440 (upval), useAnimatorObserver (upval), Kar98k_2 (upval), u432 (upval), p1 (val), ClientStateHandler (upval), States (upval), u433 (upval), u451 (upval), u431 (upval), LocalPlayer (val), RunService (upval), Character (upval), ClientAttributesHandler (upval), u428 (upval), u6 (val), u0 (upval), ClientEnchantmentsHandler (upval), u9 (val)
            local AIM_WALK_SPEED_FAST
            if u440.aiming then
                useAnimatorObserver.stop(Kar98k_2.Aim, 0.3)
                if u432.aim_align then
                    u432.aim_align:Disconnect()
                    u432.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u440.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                for k, v in pairs(u433) do
                    v()
                end
                u433 = {}
                u451()
                useAnimatorObserver.stop(Kar98k_2.ScopedAim)
                useAnimatorObserver.play(Kar98k_2.Idle, 0.1)
                return
            end
            u431.aim = useAnimatorObserver.play(Kar98k_2.Aim, 0.5)
            local Mouse = LocalPlayer:GetMouse()
            local Character_2 = LocalPlayer.Character
            if Character_2 then
                Character_2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local Character_3 = LocalPlayer.Character
            if Character_3 then
                Character_3 = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            end
            u432.aim_align = RunService.RenderStepped:Connect(function() -- Line: 377 -- upvalues: Character_2 (val), u432 (upval), Character_3 (val), Character (upval), u440 (upval), Mouse (val)
                local Hit, v1
                if not Character_2 then
                    u432.aim_align:Disconnect()
                    return
                end
                if not Character_3 then
                    if Character.isRagdolled() or u440.reloading then
                        return
                    end
                    Hit = Mouse.Hit
                    v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                    Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                    return
                end
                if Character_3.Sit or Character.isRagdolled() or u440.reloading then
                    return
                end
                Hit = Mouse.Hit
                v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                Character_2.CFrame = CFrame.new(Character_2.Position, v1)
            end)
            p1({code = 3, aiming = true})
            u440.aiming = true
            ClientStateHandler.updateState(States.AIMING, true)
            if ClientAttributesHandler.getAttribute("FasterMusketWalkSpeed") ~= 1 then
                AIM_WALK_SPEED_FAST = u428.AIM_WALK_SPEED_DEFAULT
            else
                AIM_WALK_SPEED_FAST = u428.AIM_WALK_SPEED_FAST
                if not AIM_WALK_SPEED_FAST then
                    AIM_WALK_SPEED_FAST = u428.AIM_WALK_SPEED_DEFAULT
                end
            end
            table.insert(u433, u6(u0.Name, AIM_WALK_SPEED_FAST, "set", 20))
            if not (ClientEnchantmentsHandler.hasEnchantment("Windshot")) then
                table.insert(u433, u9(u0.Name, 0, "set", 20))
            end
            u440.aimed = tick()
        end)
        u432.reloading = ClientSettingsHandler.onKeybindPressed("Musket Reload"):Connect(onReloadAttempt)
        u432.scoped = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 425 -- upvalues: u440 (upval), UserInputService (upval), useAnimatorObserver (upval), Kar98k_2 (upval), TweenService (upval), LocalPlayer (val), u450 (upval), u428 (upval), CurrentCamera (val), u21 (val), u10 (ref), u11 (ref), u451 (upval)
            if p2 or p1.KeyCode ~= Enum.KeyCode.E then
                return
            end
            print("Can scope: ", u440.aiming)
            if not u440.aiming then
                return
            end
            if u440.scoped then
                useAnimatorObserver.stop(Kar98k_2.ScopedAim)
                useAnimatorObserver.play(Kar98k_2.Idle, 0.1)
                u451()
                return
            end
            u440.scoped = true
            UserInputService.MouseIconEnabled = false
            useAnimatorObserver.stop(Kar98k_2.Idle)
            useAnimatorObserver.play(Kar98k_2.ScopedAim, 0.1)
            TweenService:Create(LocalPlayer, u450, {CameraMaxZoomDistance = u428.ZOOMED_CAMERA_MAX_DISTANCE, CameraMinZoomDistance = u428.ZOOMED_CAMERA_MIN_DISTANCE}):Play()
            TweenService:Create(CurrentCamera, u450, {FieldOfView = u428.ZOOMED_FOV}):Play()
            TweenService:Create(u21.ImageLabel, u450, {ImageTransparency = 0, Size = UDim2.new(1, 0, 1.5, 0)}):Play()
            u21.Scope.Visible = true
            u21.Scope.Size = UDim2.new(1, 0, 1.5, 0)
            u10 = u21.Scope.Position.Y.Scale
            u11 = u21.ImageLabel.Position.Y.Scale
            useAnimatorObserver.play(Kar98k_2.ScopedAim, 0.5)
        end)
        u432.zoom = UserInputService.InputChanged:Connect(function(p1, p2) -- Line: 476 -- upvalues: u440 (upval), u428 (upval), UserInputService (upval)
            local CurrentCamera, CurrentCamera_2, v1
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseWheel or not u440.scoped then
                return
            end
            if 0 >= p1.Position.Z then
                if p1.Position.Z < 0 and workspace.CurrentCamera.FieldOfView <= u428.ZOOMED_FOV then
                    CurrentCamera_2 = workspace.CurrentCamera
                    CurrentCamera_2.FieldOfView = CurrentCamera_2.FieldOfView + u428.MOUSE_WHEEL_FOV_STEP
                    v1 = UserInputService
                    v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity + u428.MOUSE_SENSITIVITY_STEP
                end
                return
            end
            if u428.MIN_ZOOM_SCROLL_FOV <= workspace.CurrentCamera.FieldOfView then
                CurrentCamera = workspace.CurrentCamera
                CurrentCamera.FieldOfView = CurrentCamera.FieldOfView - u428.MOUSE_WHEEL_FOV_STEP
                v1 = UserInputService
                v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity - u428.MOUSE_SENSITIVITY_STEP
                return
            end
            if p1.Position.Z < 0 and workspace.CurrentCamera.FieldOfView <= u428.ZOOMED_FOV then
                CurrentCamera_2 = workspace.CurrentCamera
                CurrentCamera_2.FieldOfView = CurrentCamera_2.FieldOfView + u428.MOUSE_WHEEL_FOV_STEP
                v1 = UserInputService
                v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity + u428.MOUSE_SENSITIVITY_STEP
            end
        end)
        u432.range = UserInputService.InputBegan:Connect(function(p1) -- Line: 492 -- upvalues: u440 (upval), u21 (val), u10 (ref), u428 (upval), u11 (ref)
            if not u440.scoped then
                return
            end
            local Scope = u21.Scope
            local ImageLabel = u21.ImageLabel
            if not Scope or not ImageLabel then
                return
            end
            local Scale = Scope.Position.Y.Scale
            local Scale_2 = ImageLabel.Position.Y.Scale
            local v1 = Scale <= u10 - u428.MAX_RANGED
            local v2 = Scale_2 <= u11 - u428.MAX_RANGED
            local v3 = u10 + u428.MAX_RANGED <= Scale
            local v4 = u11 + u428.MAX_RANGED <= Scale_2
            if p1.KeyCode == Enum.KeyCode.Comma and not v3 and not v4 then
                Scope.Position = Scope.Position + UDim2.new(0, 0, 0.005, 0)
                ImageLabel.Size = ImageLabel.Size + UDim2.new(0, 0, 0.01, 0)
            end
            if p1.KeyCode == Enum.KeyCode.Period and not v1 and not v2 then
                Scope.Position = Scope.Position - UDim2.new(0, 0, 0.005, 0)
                ImageLabel.Size = ImageLabel.Size - UDim2.new(0, 0, 0.01, 0)
            end
        end)
        u432.click = UserInputService.InputBegan:Connect(function(a1) -- Line: 527 -- upvalues: u440 (upval), u428 (upval), u434 (upval), onReloadAttempt (val), u436 (upval), u435 (upval), useAnimatorObserver (upval), Kar98k_2 (upval), u57 (val), Effects (upval), p1 (val), LocalPlayer (val), u0 (upval), ClientAttributesHandler (upval), CollectionService (upval), u445 (upval), Projectiles (upval), ClientInventoryHandler (upval)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            else
                local v1 = tick() - u440.aimed
                if v1 < u428.AIM_FIRE_DELAY then
                    return
                else
                    if not u440.aiming then
                        return
                    end
                    if u434 <= 0 then
                        onReloadAttempt()
                        return
                    end
                    if not u436 then
                        if u440.chambering then
                            if not u435 then
                                v1 = useAnimatorObserver.play(Kar98k_2.ScopedChamber, 0.3)
                                if not v1 then
                                    return
                                end
                                v1.KeyframeReached:Once(function(p1) -- Line: 556 -- upvalues: u57 (upval), Effects (upval)
                                    if p1 ~= "CasingEject" then
                                        return
                                    end
                                    local v1 = u57:FindFirstChild("PUT BULLET HERE", true)
                                    if not v1 then
                                        return
                                    end
                                    if not (v1:GetAttribute("Ejector")) then
                                        local Parent = v1.Parent
                                        if Parent then
                                            Parent = v1.Parent:FindFirstChildWhichIsA("BasePart")
                                        end
                                        v1 = Parent
                                    end
                                    Effects.sendReplicatedEffect("BulletEject", {speed = 15, position = v1.Position, direction = v1.CFrame.LookVector})
                                end)
                                p1({code = 4, sound = "chamber"})
                                u440.chambering = false
                                u436 = tick()
                                return
                            end
                            v1 = tick() - u435
                            if v1 < u428.CHAMBER_DELAY then
                                return
                            end
                            v1 = useAnimatorObserver.play(Kar98k_2.ScopedChamber, 0.3)
                            if not v1 then
                                return
                            end
                            v1.KeyframeReached:Once(function(p1) -- Line: 556 -- upvalues: u57 (upval), Effects (upval)
                                if p1 ~= "CasingEject" then
                                    return
                                end
                                local v1 = u57:FindFirstChild("PUT BULLET HERE", true)
                                if not v1 then
                                    return
                                end
                                if not (v1:GetAttribute("Ejector")) then
                                    local Parent = v1.Parent
                                    if Parent then
                                        Parent = v1.Parent:FindFirstChildWhichIsA("BasePart")
                                    end
                                    v1 = Parent
                                end
                                Effects.sendReplicatedEffect("BulletEject", {speed = 15, position = v1.Position, direction = v1.CFrame.LookVector})
                            end)
                            p1({code = 4, sound = "chamber"})
                            u440.chambering = false
                            u436 = tick()
                            return
                        end
                        local Character = LocalPlayer.Character
                        local v2 = Character
                        if v2 then
                            v2 = Character:FindFirstChild(u0.Name)
                        end
                        local Exit = v2
                        if Exit then
                            Exit = v2:FindFirstChild("Exit", true)
                        end
                        local Mouse = LocalPlayer:GetMouse()
                        if not Exit then
                            return
                        end
                        local v3 = 1 - (ClientAttributesHandler.getAttribute("FirearmAccuracyMultiplier") or 0)
                        local v4 = ClientAttributesHandler.getAttribute("FirearmRecoilMultiplier") or 0
                        local BASE_INACCURACY_OFFSET = u428.BASE_INACCURACY_OFFSET
                        local v5 = math.max(0, ((Mouse.Hit.Position - Exit.WorldPosition).Magnitude - u428.INACCURACY_DISTANCE_START) / u428.INACCURACY_DISTANCE_RAMP) * BASE_INACCURACY_OFFSET
                        local v6 = math.clamp(v5, 0, BASE_INACCURACY_OFFSET)
                        local v7 = math.random(-v6, v6)
                        local v8 = math.random(-v6, v6)
                        v7 = Mouse.Hit.Position + Vector3.new(v7, v8, math.random(-v6, v6)) * v3
                        local Unit = (v7 - Exit.WorldPosition).Unit
                        local Tagged = CollectionService:GetTagged("Ungrappleable")
                        v8 = RaycastParams.new()
                        v8.FilterType = Enum.RaycastFilterType.Exclude
                        v8.FilterDescendantsInstances = {Character, v2, Tagged}
                        u434 = u434 - 1
                        u435 = tick()
                        u440.chambering = true
                        local v9 = workspace:Raycast(Exit.WorldPosition, Unit * u428.MAX_SHOT_DISTANCE, v8)
                        useAnimatorObserver.play(Kar98k_2.ScopedShoot)
                        local v10 = math.random(1, u428.SHOT_ID_MAX)
                        u445:AddVelocity(u428.BASE_RECOIL_IMPULSE * v4)
                        local v11 = Projectiles.getProjectilePhysics(LocalPlayer, "Kar98k")
                        Effects.clientEmitEffect("Bullet", {
                            isServerSent = false,
                            exit = Exit.WorldPosition,
                            direction = Unit,
                            speed = v11.speed,
                            dropoff = v11.dropoff,
                            gravity = v11.gravity,
                            id = v10,
                            owner = LocalPlayer.UserId,
                        })
                        p1({code = 1, direction = Unit, origin = Exit.WorldPosition, id = v10})
                        local v12 = ClientAttributesHandler.getAttribute("FirearmUnequipSpeed") or 2
                        ClientInventoryHandler.addItemEquipCooldown(v12)
                        if v9 then
                            if v9.Instance and v9.Instance:IsA("BasePart") and v9.Instance.Name == "Target" then
                                workspace:SetAttribute(u0.Name .. "s", (workspace:GetAttribute(u0.Name .. "s") or 0) + 1)
                            end
                            p1({code = 2, hit = v9.Instance, id = v10, origin = Exit.WorldPosition})
                        end
                        return
                    else
                        v1 = tick() - u436
                        if v1 < u428.FIRE_DELAY then
                            return
                        end
                    end
                end
            end
        end)
    end,
    unequipped = function() -- Line: 691 -- upvalues: Alive (val), u432 (ref), u433 (ref), u430 (ref), u431 (val), u451 (ref), Sounds (val), Kar98k (val), u440 (ref), u429 (val), ClientStateHandler (val), States (val)
        local LocalPlayer = Alive.LocalPlayer
        for k, v in pairs(u432) do
            v:Disconnect()
        end
        for k2, i in pairs(u433) do
            i()
        end
        if u430 then
            u430()
            u430 = nil
        end
        for k3, j in pairs(u431) do
            if j then
                j:Stop()
            end
        end
        if u451 then
            u451()
        end
        local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        Sounds.playRangedSoundEffect(Kar98k.unequip, HumanoidRootPart, 100, 1, 0.5, 1.5)
        LocalPlayer.PlayerGui:FindFirstChild("ScopedKar98k"):Destroy()
        u440 = table.clone(u429)
        u432 = {}
        u433 = {}
        ClientStateHandler.updateState(States.AIMING, false)
    end,
    data = {
        description = "A military grade kar98k, used for long range combat attached with a scope.",
        isBackItem = true,
        attributes = {"Identifier Associated"},
        category = require(Types_2:WaitForChild("Item")).CATEGORIES.Weapon,
        equip = Kar98k_2.Equipped,
        unequip = Kar98k_2.Unequipped,
    },
}