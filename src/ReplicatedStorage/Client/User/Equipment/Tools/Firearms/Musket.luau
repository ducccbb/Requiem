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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Firearms.Musket
--                               Dumped in 0.00963 seconds
--                          Bytecode version 9  |  20 functions

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
local Utilities = Common_4:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Spring = require(Common_5:WaitForChild("Spring"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Effects_2 = Common_6:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_7:WaitForChild("Types")
local Projectiles = require(Types:WaitForChild("Projectiles"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Types_2 = Common_8:WaitForChild("Types")
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_2 = Common_9:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_3 = Common_10:WaitForChild("Utilities")
local Draw = require(Utilities_3:WaitForChild("Draw"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_11:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_12:WaitForChild("Common")
local Statistics_2 = Common_12:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_13:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ClientInventoryHandler = require(v1.Parent.Parent:WaitForChild("ClientInventoryHandler"))
local State_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_14:WaitForChild("Common")
local Types_3 = Common_13:WaitForChild("Types")
local Firearms = require(Types_3:WaitForChild("Firearms"))
local States = ClientStateHandler.States
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_15:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_16:WaitForChild("Common")
local Utilities_4 = Common_14:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_17:WaitForChild("Common")
local Sounds_2 = Common_15:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Musket = require(Tools:WaitForChild("Musket"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_18:WaitForChild("Common")
local Animations = Common_16:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Musket_2 = require(Tools_2:WaitForChild("Musket"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_17 = ReplicatedStorage_19:WaitForChild("Common")
local Observers = Common_17:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u442 = Config.define({
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
    TRAJECTORY_MAX_TIME = 8,
    TRAJECTORY_SPHERECAST_RADIUS = 0.15,
    TRAJECTORY_MAX_SEGMENTS = 48,
    TRAJECTORY_IMPACT_SPHERE_DIAMETER = 1.5,
})
local u443 = {
    aiming = false,
    reloading = false,
    make_ready = 0,
    aimed = 0,
    readied = 0,
}
local u444 = nil
local u445 = {}
local u446 = {}
local u447 = {}
local u448 = 1
local u449 = nil
local u452 = table.clone(u443)
local u457 = Spring.fromFrequency(1, 30, 5)
local u458 = nil
local u459 = {}
local u460 = nil
local function resamplePathForDisplay(p1, p2) -- Line: 130
    local v1
    if #p1 <= p2 + 1 then
        return p1
    end
    local v2 = {p1[1]}
    local v3 = p2 - 1
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = math.round(i / p2 * (#p1 - 1) + 1)
        table.insert(v2, p1[math.clamp(v1, 1, #p1)])
    end
    table.insert(v2, p1[#p1])
    return v2
end
local function destroyTrajectoryPreview() -- Line: 145 -- upvalues: u460 (ref), u458 (ref), u459 (val)
    if u460 then
        u460:Destroy()
        u460 = nil
    end
    if u458 then
        u458:Destroy()
        u458 = nil
    end
    table.clear(u459)
end
local function ensureTrajectoryPreview() -- Line: 159 -- upvalues: u458 (ref), Workspace (val), u442 (val), u459 (val), Draw (val)
    if u458 then
        return
    end
    local Folder = Instance.new("Folder")
    Folder.Name = "MusketTrajectoryPreview"
    Folder.Parent = Workspace
    u458 = Folder
    local TRAJECTORY_MAX_SEGMENTS = u442.TRAJECTORY_MAX_SEGMENTS
    local v1 = 1
    for i = 1, TRAJECTORY_MAX_SEGMENTS, v1 do
        table.insert(u459, Draw.segmentBeam({
            width = 0.2,
            transparency = 0.25,
            parent = Folder,
            name = "Segment" .. i,
            color = Color3.fromRGB(255, 220, 120),
        }))
    end
end
local function updateTrajectoryPreview(p1) -- Line: 183 -- upvalues: u442 (val), destroyTrajectoryPreview (val), ensureTrajectoryPreview (val), u459 (val)
    local v1 = #p1 - 1
    local v2 = math.min(v1, u442.TRAJECTORY_MAX_SEGMENTS)
    if v2 < 1 then
        destroyTrajectoryPreview()
        return
    end
    ensureTrajectoryPreview()
    v1 = v2
    local v3 = 1
    for i = 1, v1, v3 do
        u459[i].setEndpoints(p1[i], p1[i + 1])
    end
    v1 = #u459
    v3 = 1
    for j = v2 + 1, v1, v3 do
        u459[j].setEndpoints(p1[v2], p1[v2])
    end
end
local function updateTrajectoryImpactMarker(p1) -- Line: 201 -- upvalues: u460 (ref), Draw (val), Workspace (val), u442 (val)
    if not p1 then
        if u460 then
            u460:Destroy()
            u460 = nil
        end
        return
    end
    if not u460 then
        u460 = Draw.sphere({
            name = "MusketTrajectoryImpact",
            transparency = 0.35,
            parent = Workspace,
            diameter = u442.TRAJECTORY_IMPACT_SPHERE_DIAMETER,
            color = Color3.fromRGB(255, 220, 120),
        })
    end
    u460.CFrame = CFrame.new(p1)
end
local function startTrajectoryPreview() -- Line: 224 -- upvalues: ClientAttributesHandler (val), u446 (ref), RunService (val), u452 (ref), destroyTrajectoryPreview (val), Players (val), Projectiles (val), CollectionService (val), u458 (ref), u460 (ref), u442 (val), resamplePathForDisplay (val), updateTrajectoryPreview (val), updateTrajectoryImpactMarker (val)
    if ClientAttributesHandler.getAttribute("CanSeeMusketTrajectory") ~= 1 or u446.trajectory_preview then
        return
    end
    u446.trajectory_preview = RunService.RenderStepped:Connect(function(p1) -- Line: 233 -- upvalues: u452 (upval), destroyTrajectoryPreview (upval), Players (upval), Projectiles (upval), CollectionService (upval), u458 (upval), u460 (upval), u442 (upval), resamplePathForDisplay (upval), updateTrajectoryPreview (upval), updateTrajectoryImpactMarker (upval)
        if not u452.aiming or u452.reloading then
            destroyTrajectoryPreview()
            return
        end
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character
        local Musket = Character
        if Musket then
            Musket = Character:FindFirstChild("Musket")
        end
        local Exit = Musket
        if Exit then
            Exit = Musket:FindFirstChild("Exit", true)
        end
        if not Exit then
            destroyTrajectoryPreview()
            return
        end
        local v1 = Projectiles.getProjectilePhysics(LocalPlayer, "Musket")
        local Tagged = CollectionService:GetTagged("Ungrappleable")
        local v2 = {Tagged}
        if Character then
            table.insert(v2, Character)
        end
        if Musket then
            table.insert(v2, Musket)
        end
        if u458 then
            table.insert(v2, u458)
        end
        if u460 then
            table.insert(v2, u460)
        end
        local v3 = Projectiles.simulateFirearmTrajectory(Exit.WorldPosition, (LocalPlayer:GetMouse().Hit.Position - Exit.WorldPosition).Unit, v1, {timeStep = math.min(p1, 0.016666666666666666), maxTime = u442.TRAJECTORY_MAX_TIME, sphereRadius = u442.TRAJECTORY_SPHERECAST_RADIUS, filterInstances = v2})
        local v4 = resamplePathForDisplay(v3.points, u442.TRAJECTORY_MAX_SEGMENTS)
        updateTrajectoryPreview(v4)
        updateTrajectoryImpactMarker(v3.impact)
    end)
end
local function stopTrajectoryPreview() -- Line: 280 -- upvalues: u446 (ref), destroyTrajectoryPreview (val)
    if u446.trajectory_preview then
        u446.trajectory_preview:Disconnect()
        u446.trajectory_preview = nil
    end
    destroyTrajectoryPreview()
end
return {
    equipped = function(p1, p2) -- Line: 309 -- upvalues: Workspace (val), useWalkSpeed (val), useJumpPower (val), u446 (ref), RunService (val), u457 (val), Character (val), u444 (ref), useAnimatorObserver (val), Musket_2 (val), Sounds (val), Musket (val), Players (val), u448 (ref), u452 (ref), ClientStateHandler (val), States (val), stopTrajectoryPreview (val), u447 (ref), ClientAttributesHandler (val), u445 (val), u449 (ref), Firearms (val), ClientSettingsHandler (val), u442 (val), ClientEnchantmentsHandler (val), startTrajectoryPreview (val), UserInputService (val), Constants (val), CollectionService (val), Projectiles (val), Effects (val), ClientInventoryHandler (val)
        local u6, u9
        local CurrentCamera = Workspace.CurrentCamera
        _, u6 = useWalkSpeed()
        _, u9 = useJumpPower()
        u446.recoil = RunService.PreRender:Connect(function(p1) -- Line: 314 -- upvalues: CurrentCamera (val), u457 (upval)
            local v1 = CurrentCamera
            v1.CFrame = v1.CFrame * CFrame.Angles(u457.Offset, 0, 0)
        end)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 318 -- upvalues: u444 (upval), useAnimatorObserver (upval), Musket_2 (upval)
            u444 = useAnimatorObserver.bind(p1.Humanoid.Animator, Musket_2, 4)
        end)
        local playRangedSoundEffect = Sounds.playRangedSoundEffect
        local HumanoidRootPart = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        playRangedSoundEffect(Musket.equip, HumanoidRootPart, 100, 1, 1)
        local function onReloadAttempt() -- Line: 330 -- upvalues: u448 (upval), u452 (upval), useAnimatorObserver (upval), Musket_2 (upval), u446 (upval), p1 (val), ClientStateHandler (upval), States (upval), stopTrajectoryPreview (upval), u447 (upval), ClientAttributesHandler (upval), u445 (upval), RunService (upval), Players (upval), u449 (upval)
            if u448 == 1 or u452.reloading then
                return
            end
            if u452.aiming then
                useAnimatorObserver.stop(Musket_2.Aim, 0.3)
                if u446.aim_align then
                    u446.aim_align:Disconnect()
                    u446.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u452.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                stopTrajectoryPreview()
                u452.make_ready = math.max(u452.make_ready - 1, 0)
                for k, v in pairs(u447) do
                    v()
                end
                u447 = {}
            end
            local u60 = useAnimatorObserver.play(Musket_2.Reload, 0.5)
            if not u60 then
                return
            end
            local u65 = ClientAttributesHandler.getAttribute("FirearmReloadMultiplier") or 0
            u60:AdjustSpeed(u65)
            u445.reload = u60
            u452.reloading = true
            if ClientAttributesHandler.getAttribute("ReloadsFasterWhileStill") == 1 then
                u446.reload_velocity = RunService.RenderStepped:Connect(function() -- Line: 382 -- upvalues: Players (upval), u65 (val), u60 (val)
                    local Character = Players.LocalPlayer.Character
                    if Character then
                        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                        if HumanoidRootPart then
                            local v1 = u65
                            if HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 then
                                v1 = v1 + 0.25
                            end
                            u60:AdjustSpeed(v1)
                        end
                    end
                end)
            end
            if not Players.LocalPlayer.Character then
                return
            end
            u449 = u60.Speed - 0.06
            p1({code = 4, sound = "reload", reloadSoundSpeed = u449})
            u446.reload = u60.Stopped:Once(function() -- Line: 413 -- upvalues: u448 (upval), u452 (upval), p1 (upval), u446 (upval)
                u448 = 1
                u452.reloading = false
                p1({code = 4, sound = "finish_reload"})
                if u446.reload_velocity then
                    u446.reload_velocity:Disconnect()
                end
            end)
        end
        u446.damage_reload_cancel = Firearms.connectDamageCancelReload({
            state = u452,
            tracks = u445,
            connections = u446,
            onCancel = function() end,
        })
        u446.aim = ClientSettingsHandler.onKeybindPressed("Musket Aim"):Connect(function() -- Line: 441 -- upvalues: u452 (upval), useAnimatorObserver (upval), Musket_2 (upval), u445 (upval), u446 (upval), p1 (val), ClientStateHandler (upval), States (upval), stopTrajectoryPreview (upval), u447 (upval), u442 (upval), Players (upval), RunService (upval), Character (upval), ClientAttributesHandler (upval), u6 (val), ClientEnchantmentsHandler (upval), u9 (val), startTrajectoryPreview (upval)
            if u452.make_ready ~= 2 then
                local AIM_WALK_SPEED_FAST
                if u452.make_ready ~= 1 or tick() < u452.readied then
                    return
                end
                useAnimatorObserver.stop(Musket_2.Ready.One, 0.2)
                u445.aim = useAnimatorObserver.play(Musket_2.Aim, 0.5)
                local Mouse = Players.LocalPlayer:GetMouse()
                local Character_2 = Players.LocalPlayer.Character
                if Character_2 then
                    Character_2 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                end
                local Character_3 = Players.LocalPlayer.Character
                if Character_3 then
                    Character_3 = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                end
                u446.aim_align = RunService.RenderStepped:Connect(function() -- Line: 480 -- upvalues: Character_2 (val), u446 (upval), Character_3 (val), Character (upval), u452 (upval), Mouse (val)
                    local Hit, v1
                    if not Character_2 then
                        u446.aim_align:Disconnect()
                        return
                    end
                    if not Character_3 then
                        if Character.isRagdolled() or u452.reloading then
                            return
                        end
                        Hit = Mouse.Hit
                        v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                        Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                        return
                    end
                    if Character_3.Sit or Character.isRagdolled() or u452.reloading then
                        return
                    end
                    Hit = Mouse.Hit
                    v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                    Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                end)
                p1({code = 3, aiming = true})
                u452.aiming = true
                ClientStateHandler.updateState(States.AIMING, true)
                if ClientAttributesHandler.getAttribute("FasterMusketWalkSpeed") ~= 1 then
                    AIM_WALK_SPEED_FAST = u442.AIM_WALK_SPEED_DEFAULT
                else
                    AIM_WALK_SPEED_FAST = u442.AIM_WALK_SPEED_FAST
                    if not AIM_WALK_SPEED_FAST then
                        AIM_WALK_SPEED_FAST = u442.AIM_WALK_SPEED_DEFAULT
                    end
                end
                table.insert(u447, u6("musket", AIM_WALK_SPEED_FAST, "set", 20))
                if not (ClientEnchantmentsHandler.hasEnchantment("Windshot")) then
                    table.insert(u447, u9("musket", 0, "set", 20))
                end
                u452.readied = tick() + u442.READY_STATE_TRANSITION_TIME
                u452.aimed = tick()
                startTrajectoryPreview()
                local v1 = u452
                v1.make_ready = v1.make_ready + 1
                return
            elseif u452.aiming then
                local v2 = u452
                v2.make_ready = v2.make_ready - 1
                useAnimatorObserver.stop(Musket_2.Aim, 0.3)
                u445.ready = useAnimatorObserver.play(Musket_2.Ready.One, 0.3)
                if u446.aim_align then
                    u446.aim_align:Disconnect()
                    p1({code = 3, aiming = false})
                end
                u452.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                stopTrajectoryPreview()
                for k, v in pairs(u447) do
                    v()
                end
                u452.readied = tick() + u442.READY_STATE_TRANSITION_TIME
                return
            end
        end)
        u446.reloading = ClientSettingsHandler.onKeybindPressed("Musket Reload"):Connect(onReloadAttempt)
        u446.click = UserInputService.InputBegan:Connect(function(a1) -- Line: 534 -- upvalues: u452 (upval), u442 (upval), u445 (upval), useAnimatorObserver (upval), Musket_2 (upval), p1 (val), u448 (upval), onReloadAttempt (val), Players (upval), ClientAttributesHandler (upval), Constants (upval), CollectionService (upval), u457 (upval), Projectiles (upval), Effects (upval), ClientInventoryHandler (upval)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            else
                local v1 = tick() - u452.aimed
                if v1 < u442.AIM_FIRE_DELAY then
                    return
                else
                    if tick() < u452.readied then
                        return
                    end
                    if u452.make_ready ~= 0 then
                        if u452.make_ready ~= 1 then
                            local BASE_INACCURACY_OFFSET
                            if u452.make_ready < 2 then
                                return
                            end
                            if u448 <= 0 then
                                onReloadAttempt()
                                return
                            end
                            local LocalPlayer = Players.LocalPlayer
                            local Character = LocalPlayer.Character
                            local Musket = Character
                            if Musket then
                                Musket = Character:FindFirstChild("Musket")
                            end
                            local Exit = Musket
                            if Exit then
                                Exit = Musket:FindFirstChild("Exit", true)
                            end
                            local Mouse = LocalPlayer:GetMouse()
                            if not Exit then
                                return
                            end
                            BASE_INACCURACY_OFFSET = if game.PlaceId == Constants.Places.Exam then u442.EXAM_INACCURACY_OFFSET else u442.BASE_INACCURACY_OFFSET
                            local v2 = math.max(0, ((Mouse.Hit.Position - Exit.WorldPosition).Magnitude - u442.INACCURACY_DISTANCE_START) / u442.INACCURACY_DISTANCE_RAMP) * BASE_INACCURACY_OFFSET
                            local v3 = math.clamp(v2, 0, BASE_INACCURACY_OFFSET)
                            local v4 = math.random(-v3, v3)
                            local v5 = math.random(-v3, v3)
                            v4 = Mouse.Hit.Position + Vector3.new(v4, v5, math.random(-v3, v3)) * (1 - (ClientAttributesHandler.getAttribute("FirearmAccuracyMultiplier") or 0))
                            local Unit = (v4 - Exit.WorldPosition).Unit
                            local Tagged = CollectionService:GetTagged("Ungrappleable")
                            v5 = RaycastParams.new()
                            v5.FilterType = Enum.RaycastFilterType.Exclude
                            v5.FilterDescendantsInstances = {Character, Musket, Tagged}
                            local v6 = workspace:Raycast(Exit.WorldPosition, Unit * u442.MAX_SHOT_DISTANCE, v5)
                            u448 = u448 - 1
                            useAnimatorObserver.play(Musket_2.Fire)
                            local v7 = math.random(1, u442.SHOT_ID_MAX)
                            u457:AddVelocity(u442.BASE_RECOIL_IMPULSE * (ClientAttributesHandler.getAttribute("FirearmRecoilMultiplier") or 0))
                            local v8 = ClientAttributesHandler.getAttribute("FirearmNoiseVolumeMultiplier") or 1
                            local v9 = ClientAttributesHandler.getAttribute("FirearmSmokeLengthMultiplier") or 1
                            local v10 = Projectiles.getProjectilePhysics(Players.LocalPlayer, "Musket")
                            Effects.clientEmitEffect("Bullet", {
                                isServerSent = false,
                                exit = Exit.WorldPosition,
                                direction = Unit,
                                speed = v10.speed,
                                dropoff = v10.dropoff,
                                gravity = v10.gravity,
                                id = v7,
                                owner = Players.LocalPlayer.UserId,
                            })
                            Effects.clientEmitEffect("Musket", Character, v8, v9)
                            p1({code = 1, direction = Unit, origin = Exit.WorldPosition, id = v7})
                            local v11 = ClientAttributesHandler.getAttribute("FirearmUnequipSpeed") or 2
                            ClientInventoryHandler.addItemEquipCooldown(v11)
                            if v6 then
                                if v6.Instance and v6.Instance:IsA("BasePart") and v6.Instance.Name == "Target" then
                                    workspace:SetAttribute("Muskets", (workspace:GetAttribute("Muskets") or 0) + 1)
                                end
                                p1({code = 2, hit = v6.Instance, id = v7, origin = Exit.WorldPosition})
                            end
                            return
                        elseif not u452.aiming and not u452.reloading then
                            useAnimatorObserver.stop(Musket_2.Ready.One, 0.2)
                            u452.readied = tick() + u442.READY_STATE_TRANSITION_TIME
                            p1({code = 4, sound = "ready"})
                            v1 = u452
                            v1.make_ready = v1.make_ready - 1
                            return
                        end
                    elseif not u452.reloading then
                        v1 = u452
                        v1.make_ready = v1.make_ready + 1
                        u445.ready_one = useAnimatorObserver.play(Musket_2.Ready.One, 0.2)
                        p1({code = 4, sound = "ready"})
                        u452.readied = tick() + u442.READY_STATE_TRANSITION_TIME
                        return
                    end
                end
            end
        end)
    end,
    unequipped = function() -- Line: 692 -- upvalues: u446 (ref), u447 (ref), u444 (ref), u445 (val), Sounds (val), Musket (val), Players (val), u452 (ref), u443 (val), stopTrajectoryPreview (val), ClientStateHandler (val), States (val)
        for k, v in pairs(u446) do
            v:Disconnect()
        end
        for k2, i in pairs(u447) do
            i()
        end
        if u444 then
            u444()
            u444 = nil
        end
        for k3, j in pairs(u445) do
            if j then
                j:Stop()
            end
        end
        local HumanoidRootPart = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        Sounds.playRangedSoundEffect(Musket.unequip, HumanoidRootPart, 100, 1, 0.5, 1.5)
        u452 = table.clone(u443)
        u446 = {}
        u447 = {}
        stopTrajectoryPreview()
        ClientStateHandler.updateState(States.AIMING, false)
    end,
    data = {
        description = "A military grade musket, used for long range combat.",
        isBackItem = true,
        attributes = {"Identifier Associated"},
        category = require(Types_2:WaitForChild("Item")).CATEGORIES.Weapon,
        equip = Musket_2.Equipped,
        unequip = Musket_2.Unequipped,
    },
}