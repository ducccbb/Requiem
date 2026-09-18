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
--      File: ReplicatedStorage.Client.User.Equipment.Tools.Firearms.TrenchShotgun
--                               Dumped in 0.00348 seconds
--                          Bytecode version 9  |  13 functions

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
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Spring = require(Common_4:WaitForChild("Spring"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Effects_2 = Common_5:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Types = Common_6:WaitForChild("Types")
local Projectiles = require(Types:WaitForChild("Projectiles"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Types_2 = Common_7:WaitForChild("Types")
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_8:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics_2 = Common_10:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_11:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ClientInventoryHandler = require(v1.Parent.Parent:WaitForChild("ClientInventoryHandler"))
local State_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Types_3 = Common_11:WaitForChild("Types")
local Firearms = require(Types_3:WaitForChild("Firearms"))
local States = ClientStateHandler.States
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_13:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_14:WaitForChild("Common")
local Utilities_3 = Common_12:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_15:WaitForChild("Common")
local Sounds_2 = Common_13:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Shotgun = require(Tools:WaitForChild("Shotgun"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_16:WaitForChild("Common")
local Animations = Common_14:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local TrenchShotgun = require(Tools_2:WaitForChild("TrenchShotgun"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_17:WaitForChild("Common")
local Observers = Common_15:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u408 = Config.define({
    AIM_FIRE_DELAY = 0.5,
    AIM_WALK_SPEED_DEFAULT = 4,
    AIM_WALK_SPEED_FAST = 8,
    BASE_INACCURACY_OFFSET = 8.5,
    EXAM_INACCURACY_OFFSET = 2,
    INACCURACY_DISTANCE_START = 45,
    INACCURACY_DISTANCE_RAMP = 200,
    MAX_SHOT_DISTANCE = 2000,
    BASE_RECOIL_IMPULSE = 4,
    SHOT_ID_MAX = 1000000,
    CHAMBER_DELAY = 1,
    FIRE_DELAY = 1,
    PELLET_COUNT = 9,
    SPREAD_REFERENCE_DISTANCE = 60,
    PELLET_SPREAD_OFFSET = 3,
})
local u409 = {aiming = false, reloading = false, aimed = 0, chambering = false}
local u410 = nil
local u411 = {}
local u412 = {}
local u413 = {}
local u414 = 5
local u415 = nil
local u416 = nil
local u417 = nil
local u420 = table.clone(u409)
local u425 = Spring.fromFrequency(1, 30, 5)
local v3 = {
    description = "A military grade trench shotgun, used for close range combat.",
    isBackItem = true,
    attributes = {"Identifier Associated"},
    category = require(Types_2:WaitForChild("Item")).CATEGORIES.Weapon,
    equip = TrenchShotgun.Equipped,
    unequip = TrenchShotgun.Unequipped,
}
local function getPelletSpreadOffset(p1, p2, p3) -- Line: 147 -- upvalues: u408 (val)
    local xAxis
    local v1 = p3:Cross(Vector3.yAxis)
    if v1.Magnitude >= 0.0001 then
        xAxis = v1.Unit
    else
        xAxis = Vector3.xAxis
    end
    if p1 == 1 then
        return Vector3.zero
    end
    local v2 = (p1 - 2) * (2 * math.pi / (u408.PELLET_COUNT - 1))
    local v3 = xAxis * (math.cos(v2) * p2)
    return v3 + xAxis:Cross(p3).Unit * (math.sin(v2) * p2)
end
return {
    equipped = function(p1, p2) -- Line: 169 -- upvalues: Workspace (val), useWalkSpeed (val), useJumpPower (val), u412 (ref), RunService (val), u425 (val), Character (val), u410 (ref), useAnimatorObserver (val), TrenchShotgun (val), Sounds (val), Shotgun (val), Players (val), u414 (ref), u420 (ref), ClientStateHandler (val), States (val), u413 (ref), ClientAttributesHandler (val), u411 (val), u417 (ref), Firearms (val), ClientSettingsHandler (val), u408 (val), ClientEnchantmentsHandler (val), UserInputService (val), u416 (ref), u415 (ref), CollectionService (val), Projectiles (val), getPelletSpreadOffset (val), Effects (val), ClientInventoryHandler (val)
        local u6, u9
        local CurrentCamera = Workspace.CurrentCamera
        _, u6 = useWalkSpeed()
        _, u9 = useJumpPower()
        u412.recoil = RunService.PreRender:Connect(function(p1) -- Line: 174 -- upvalues: CurrentCamera (val), u425 (upval)
            local v1 = CurrentCamera
            v1.CFrame = v1.CFrame * CFrame.Angles(u425.Offset, 0, 0)
        end)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 178 -- upvalues: u410 (upval), useAnimatorObserver (upval), TrenchShotgun (upval)
            u410 = useAnimatorObserver.bind(p1.Humanoid.Animator, TrenchShotgun, 4)
        end)
        local HumanoidRootPart = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        Sounds.playRangedSoundEffect(Shotgun.Equip, HumanoidRootPart, 100, 1, 1)
        local v1 = Character.getCharacter()
        if not v1 or not (v1:FindFirstChild("TrenchShotgun")) then
            return
        end
        local function onReloadAttempt() -- Line: 200 -- upvalues: u414 (upval), u420 (upval), useAnimatorObserver (upval), TrenchShotgun (upval), u412 (upval), p1 (val), ClientStateHandler (upval), States (upval), u413 (upval), ClientAttributesHandler (upval), u411 (upval), RunService (upval), Players (upval), u417 (upval)
            if 6 <= u414 or u420.reloading then
                return
            end
            if u420.aiming then
                useAnimatorObserver.stop(TrenchShotgun.Aim, 0.3)
                if u412.aim_align then
                    u412.aim_align:Disconnect()
                    u412.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u420.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                for k, v in pairs(u413) do
                    v()
                end
                u413 = {}
            end
            local u52 = useAnimatorObserver.play(TrenchShotgun.Reload, 0.5)
            if not u52 then
                return
            end
            local u57 = ClientAttributesHandler.getAttribute("FirearmReloadMultiplier") or 0
            u52:AdjustSpeed(u57)
            u411.reload = u52
            u420.reloading = true
            if ClientAttributesHandler.getAttribute("ReloadsFasterWhileStill") == 1 then
                u412.reload_velocity = RunService.RenderStepped:Connect(function() -- Line: 250 -- upvalues: Players (upval), u57 (val), u52 (val)
                    local Character = Players.LocalPlayer.Character
                    if not Character then
                        return
                    end
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart then
                        return
                    end
                    local v1 = u57
                    if HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 then
                        v1 = v1 + 0.25
                    end
                    u52:AdjustSpeed(v1)
                end)
            end
            if not Players.LocalPlayer.Character then
                return
            end
            u417 = u52.Speed
            p1({code = 4, sound = "reload", reloadSoundSpeed = u417})
            u412.reload = u52.Stopped:Once(function() -- Line: 285 -- upvalues: u414 (upval), u420 (upval), p1 (upval), u412 (upval)
                u414 = u414 + 1
                u420.reloading = false
                p1({code = 4, sound = "finish_reload"})
                if u412.reload_velocity then
                    u412.reload_velocity:Disconnect()
                end
            end)
        end
        u412.damage_reload_cancel = Firearms.connectDamageCancelReload({
            state = u420,
            tracks = u411,
            connections = u412,
            onCancel = function() end,
        })
        u412.aim = ClientSettingsHandler.onKeybindPressed("Musket Aim"):Connect(function() -- Line: 314 -- upvalues: u420 (upval), useAnimatorObserver (upval), TrenchShotgun (upval), u412 (upval), p1 (val), ClientStateHandler (upval), States (upval), u413 (upval), u411 (upval), Players (upval), RunService (upval), Character (upval), ClientAttributesHandler (upval), u408 (upval), u6 (val), ClientEnchantmentsHandler (upval), u9 (val)
            local AIM_WALK_SPEED_FAST
            if u420.aiming then
                useAnimatorObserver.stop(TrenchShotgun.Aim, 0.3)
                if u412.aim_align then
                    u412.aim_align:Disconnect()
                    u412.aim_align = nil
                    p1({code = 3, aiming = false})
                end
                u420.aiming = false
                ClientStateHandler.updateState(States.AIMING, false)
                for k, v in pairs(u413) do
                    v()
                end
                u413 = {}
                return
            end
            u411.aim = useAnimatorObserver.play(TrenchShotgun.Aim, 0.5)
            local Mouse = Players.LocalPlayer:GetMouse()
            local Character_2 = Players.LocalPlayer.Character
            if Character_2 then
                Character_2 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local Character_3 = Players.LocalPlayer.Character
            if Character_3 then
                Character_3 = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            end
            u412.aim_align = RunService.RenderStepped:Connect(function() -- Line: 345 -- upvalues: Character_2 (val), u412 (upval), Character_3 (val), Character (upval), u420 (upval), Mouse (val)
                local Hit, v1
                if not Character_2 then
                    u412.aim_align:Disconnect()
                    return
                end
                if not Character_3 then
                    if Character.isRagdolled() or u420.reloading then
                        return
                    end
                    Hit = Mouse.Hit
                    v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                    Character_2.CFrame = CFrame.new(Character_2.Position, v1)
                    return
                end
                if Character_3.Sit or Character.isRagdolled() or u420.reloading then
                    return
                end
                Hit = Mouse.Hit
                v1 = Vector3.new(Hit.X, Character_2.Position.Y, Hit.Z)
                Character_2.CFrame = CFrame.new(Character_2.Position, v1)
            end)
            p1({code = 3, aiming = true})
            u420.aiming = true
            ClientStateHandler.updateState(States.AIMING, true)
            if ClientAttributesHandler.getAttribute("FasterMusketWalkSpeed") ~= 1 then
                AIM_WALK_SPEED_FAST = u408.AIM_WALK_SPEED_DEFAULT
            else
                AIM_WALK_SPEED_FAST = u408.AIM_WALK_SPEED_FAST
                if not AIM_WALK_SPEED_FAST then
                    AIM_WALK_SPEED_FAST = u408.AIM_WALK_SPEED_DEFAULT
                end
            end
            table.insert(u413, u6("trenchshotgun", AIM_WALK_SPEED_FAST, "set", 20))
            if not (ClientEnchantmentsHandler.hasEnchantment("Windshot")) then
                table.insert(u413, u9("trenchshotgun", 0, "set", 20))
            end
            u420.aimed = tick()
        end)
        u412.reloading = ClientSettingsHandler.onKeybindPressed("Musket Reload"):Connect(onReloadAttempt)
        u412.click = UserInputService.InputBegan:Connect(function(a1) -- Line: 394 -- upvalues: u420 (upval), u408 (upval), u414 (upval), onReloadAttempt (val), u416 (upval), u415 (upval), useAnimatorObserver (upval), TrenchShotgun (upval), p1 (val), Players (upval), ClientAttributesHandler (upval), CollectionService (upval), u425 (upval), Projectiles (upval), getPelletSpreadOffset (upval), Effects (upval), ClientInventoryHandler (upval)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            else
                local v1 = tick() - u420.aimed
                if v1 < u408.AIM_FIRE_DELAY then
                    return
                else
                    if not u420.aiming then
                        return
                    end
                    if u414 <= 0 then
                        while true do
                            task.wait(1)
                            onReloadAttempt()
                            if 6 <= u414 then
                                break
                            end
                        end
                        return
                    end
                    if not u416 then
                        local Unit_2, v2, v3, v4
                        if u420.chambering then
                            if not u415 then
                                if not (useAnimatorObserver.play(TrenchShotgun.Chamber, 0.3)) then
                                    return
                                end
                                p1({code = 4, sound = "chamber"})
                                u420.chambering = false
                                u416 = tick()
                                return
                            end
                            v1 = tick() - u415
                            if v1 < u408.CHAMBER_DELAY or not (useAnimatorObserver.play(TrenchShotgun.Chamber, 0.3)) then
                                return
                            end
                            p1({code = 4, sound = "chamber"})
                            u420.chambering = false
                            u416 = tick()
                            return
                        end
                        local LocalPlayer = Players.LocalPlayer
                        local Character = LocalPlayer.Character
                        local TrenchShotgun_2 = Character
                        if TrenchShotgun_2 then
                            TrenchShotgun_2 = Character:FindFirstChild("TrenchShotgun")
                        end
                        local Exit = TrenchShotgun_2
                        if Exit then
                            Exit = TrenchShotgun_2:FindFirstChild("Exit", true)
                        end
                        local Mouse = LocalPlayer:GetMouse()
                        if not Exit then
                            return
                        end
                        local v5 = 1 - (ClientAttributesHandler.getAttribute("FirearmAccuracyMultiplier") or 0)
                        local v6 = ClientAttributesHandler.getAttribute("FirearmRecoilMultiplier") or 0
                        local BASE_INACCURACY_OFFSET = u408.BASE_INACCURACY_OFFSET
                        local v7 = math.max(0, ((Mouse.Hit.Position - Exit.WorldPosition).Magnitude - u408.INACCURACY_DISTANCE_START) / u408.INACCURACY_DISTANCE_RAMP) * BASE_INACCURACY_OFFSET
                        local v8 = math.clamp(v7, 0, BASE_INACCURACY_OFFSET)
                        local v9 = math.random(-v8, v8)
                        local v10 = math.random(-v8, v8)
                        local v11 = Mouse.Hit.Position + Vector3.new(v9, v10, math.random(-v8, v8)) * v5
                        local Tagged = CollectionService:GetTagged("Ungrappleable")
                        v10 = RaycastParams.new()
                        v10.FilterType = Enum.RaycastFilterType.Exclude
                        v10.FilterDescendantsInstances = {Character, TrenchShotgun_2, Tagged}
                        u414 = u414 - 1
                        u415 = tick()
                        u420.chambering = true
                        useAnimatorObserver.play(TrenchShotgun.Shoot)
                        u425:AddVelocity(u408.BASE_RECOIL_IMPULSE * v6)
                        local v12 = Projectiles.getProjectilePhysics(Players.LocalPlayer, "Shotgun")
                        local v13 = u408.PELLET_SPREAD_OFFSET * math.max(0.7, v5)
                        local Unit = (v11 - Exit.WorldPosition).Unit
                        local v14 = false
                        local PELLET_COUNT = u408.PELLET_COUNT
                        local v15 = 1
                        for i = 1, PELLET_COUNT, v15 do
                            v2 = getPelletSpreadOffset(i, v13, Unit)
                            Unit_2 = (Unit * u408.SPREAD_REFERENCE_DISTANCE + v2).Unit
                            v3 = math.random(1, u408.SHOT_ID_MAX)
                            Effects.clientEmitEffect("Bullet", {
                                isServerSent = false,
                                exit = Exit.WorldPosition,
                                direction = Unit_2,
                                speed = v12.speed,
                                dropoff = v12.dropoff,
                                gravity = v12.gravity,
                                id = v3,
                                owner = Players.LocalPlayer.UserId,
                            })
                            p1({code = 1, direction = Unit_2, origin = Exit.WorldPosition, id = v3})
                            v4 = workspace:Raycast(Exit.WorldPosition, Unit_2 * u408.MAX_SHOT_DISTANCE, v10)
                            if v4 then
                                if v4.Instance and v4.Instance:IsA("BasePart") and v4.Instance.Name == "Target" then
                                    v14 = true
                                end
                                p1({code = 2, hit = v4.Instance, id = v3, origin = Exit.WorldPosition})
                            end
                        end
                        local v16 = ClientAttributesHandler.getAttribute("FirearmUnequipSpeed") or 2
                        ClientInventoryHandler.addItemEquipCooldown(v16)
                        if v14 then
                            workspace:SetAttribute("TrenchShotguns", (workspace:GetAttribute("TrenchShotguns") or 0) + 1)
                        end
                        return
                    else
                        v1 = tick() - u416
                        if v1 < u408.FIRE_DELAY then
                            return
                        end
                    end
                end
            end
        end)
    end,
    unequipped = function() -- Line: 554 -- upvalues: u412 (ref), u413 (ref), u410 (ref), u411 (val), Sounds (val), Shotgun (val), Players (val), u420 (ref), u409 (val), ClientStateHandler (val), States (val)
        for k, v in pairs(u412) do
            v:Disconnect()
        end
        for k2, i in pairs(u413) do
            i()
        end
        if u410 then
            u410()
            u410 = nil
        end
        for k3, j in pairs(u411) do
            if j then
                j:Stop()
            end
        end
        local HumanoidRootPart = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        Sounds.playRangedSoundEffect(Shotgun.Unequip, HumanoidRootPart, 100, 1, 0.5, 1.5)
        u420 = table.clone(u409)
        u412 = {}
        u413 = {}
        ClientStateHandler.updateState(States.AIMING, false)
    end,
    data = v3,
}