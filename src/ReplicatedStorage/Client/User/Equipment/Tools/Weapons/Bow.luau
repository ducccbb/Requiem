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
--            File: ReplicatedStorage.Client.User.Equipment.Tools.Weapons.Bow
--                               Dumped in 0.00304 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Effects_2 = Common_2:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Bow = require(Tools:WaitForChild("Bow"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_9:WaitForChild("Client")
local Progression_2 = Client_2:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_10:WaitForChild("Common")
local Types = Common_7:WaitForChild("Types")
local v2 = {description = "A standard bow, used for shooting arrows at enemies.", isBackItem = true}
local v3 = {"Ranged"}
v2.attributes = v3
v2.category = require(Types:WaitForChild("Item")).CATEGORIES.Weapon
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_8:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_12:WaitForChild("Common")
local Statistics_2 = Common_9:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local u270 = trove.new()
local u271 = false
local u272 = false
local function onGetBeamProjectile(p1, p2, p3, p4) -- Line: 67
    local v1 = p1 * 0.5 * p4 * p4 + p2 * p4 + p3
    local v2 = v1 - (p1 * p4 * p4 + p2 * p4) / 3
    local v3 = (p1 * 0.125 * p4 * p4 + p2 * 0.5 * p4 + p3 - (p3 + v1) * 0.125) / 0.375 - v2
    local Unit = (p3 - v1).Unit
    local Unit_2 = (v3 - p3).Unit
    local Unit_3 = Unit_2:Cross(Unit).Unit
    local Unit_4 = (v2 - v1).Unit
    local Unit_5 = Unit_4:Cross(Unit).Unit
    local Unit_6 = Unit_3:Cross(Unit_2).Unit
    local v4 = CFrame.new(p3.X, p3.Y, p3.Z, Unit_2.X, Unit_3.X, Unit_6.X, Unit_2.Y, Unit_3.Y, Unit_6.Y, Unit_2.Z, Unit_3.Z, Unit_6.Z)
    local v5 = CFrame.new(v1.X, v1.Y, v1.Z, Unit_4.X, Unit_5.X, Unit_6.X, Unit_4.Y, Unit_5.Y, Unit_6.Y, Unit_4.Z, Unit_5.Z, Unit_6.Z)
    return (v3 - p3).Magnitude, -(v2 - v1).Magnitude, v4, v5
end
local v4 = {}
function v4.equipped(p1, p2) -- Line: 96 -- upvalues: useWalkSpeed (val), u271 (ref), Character (val), useAnimatorObserver (val), Bow (val), Players (val), useFieldOfView (val), UserInputService (val), Effects (val), RunService (val), ClientAttributesHandler (val), Workspace (val), onGetBeamProjectile (val), ClientEnchantmentsHandler (val), u272 (ref), Signals (val), u270 (val)
    local v1
    _, v1 = useWalkSpeed()
    local u10 = v1("bow", 14, "set", 20)
    local u11 = nil
    local u12 = {}
    local u13 = {}
    u271 = false
    local u15 = nil
    local u21 = Instance.new("Attachment", game.Workspace.Terrain)
    local u27 = Instance.new("Attachment", game.Workspace.Terrain)
    local u33 = Instance.new("Beam", game.Workspace.Terrain)
    u33.Width0 = 0.05
    u33.Width1 = 0.05
    u33.Segments = 40
    u33.Brightness = 4
    local v2 = {}
    local v3 = NumberSequenceKeypoint.new(0, 1)
    local v4 = NumberSequenceKeypoint.new(0.05, 0.7)
    v2[1] = v3
    v2[2] = v4
    v2[3] = NumberSequenceKeypoint.new(1, 1)
    u33.Transparency = NumberSequence.new(v2)
    u33.Attachment0 = u21
    u33.Attachment1 = u27
    Character.getCharacterAsync():andThen(function(p1) -- Line: 132 -- upvalues: u11 (ref), useAnimatorObserver (upval), Bow (upval), u15 (ref)
        u11 = useAnimatorObserver.bind(p1.Humanoid.Animator, Bow, 4)
        u15 = p1:WaitForChild("Bow", 3)
    end)
    local function onBowHasArrow() -- Line: 139 -- upvalues: Character (upval), Players (upval), useFieldOfView (upval), UserInputService (upval), u271 (upval), useAnimatorObserver (upval), Bow (upval), p1 (val), u33 (val), Effects (upval), u13 (val), RunService (upval), ClientAttributesHandler (upval), Workspace (upval), onGetBeamProjectile (upval), u21 (val), u27 (val), ClientEnchantmentsHandler (upval)
        local u19
        local u2 = Character.getCharacter()
        local HumanoidRootPart = u2
        if HumanoidRootPart then
            HumanoidRootPart = u2:FindFirstChild("HumanoidRootPart")
        end
        local Mouse = Players.LocalPlayer:GetMouse()
        local u13 = 0
        local u14 = false
        local u15 = false
        local u16 = nil
        _, u19 = useFieldOfView()
        local u20 = nil
        local u21 = nil
        local u22 = nil
        local u23 = nil
        local u24 = nil
        local u25 = nil
        local v1 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 164 -- upvalues: Character (upval), u271 (upval), u14 (ref), u15 (ref), u16 (ref), useAnimatorObserver (upval), Bow (upval), p1 (upval)
            if p2 or Character.isRagdolled() or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or not u271 then
                return
            end
            u14 = true
            if not u15 then
                u15 = true
                u16 = useAnimatorObserver.play(Bow.Aim, 0.2)
                if u16 then
                    u16.Looped = true
                end
                p1({
                    key = 4,
                    data = {isStringPulling = true},
                })
            end
        end)
        local v2 = UserInputService.InputEnded:Connect(function(a1, p2) -- Line: 194 -- upvalues: u14 (ref), u15 (ref), u16 (ref), u20 (ref), u13 (ref), u271 (upval), u21 (ref), u22 (ref), u23 (ref), u24 (ref), u25 (ref), u33 (upval), Character (upval), Players (upval), useAnimatorObserver (upval), Bow (upval), Effects (upval), p1 (upval)
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            u14 = false
            if not u15 then
                return
            end
            u15 = false
            if u16 then
                u16:Stop(0.1)
                u16 = nil
            end
            if u20 then
                u20(TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out))
                u20 = nil
            end
            local v1 = false
            if 0 >= u13 or not u271 or not u21 or not u22 or not u23 or not u24 then
                if not v1 then
                    p1({
                        key = 4,
                        data = {isStringPulling = false},
                    })
                end
                return
            end
            u271 = false
            if u25 then
                u25:Disconnect()
                u25 = nil
            end
            u33.Transparency = NumberSequence.new(1)
            u13 = 0
            if Character.isRagdolled() then
                u13 = 0
                return
            end
            local v2 = {
                skip = true,
                startPos = u21,
                endPos = u22,
                velocity = u23,
                gravity = u24,
                userId = Players.LocalPlayer.UserId,
            }
            useAnimatorObserver.play(Bow.Fire, 0.1)
            Effects.emitClientEffect("Arrow", v2)
            v2.skip = false
            p1({key = 2, data = v2})
            v1 = true
            if not v1 then
                p1({
                    key = 4,
                    data = {isStringPulling = false},
                })
            end
        end)
        table.insert(u13, v1)
        table.insert(u13, v2)
        u25 = RunService.RenderStepped:Connect(function(p1) -- Line: 276 -- upvalues: HumanoidRootPart (val), Character (upval), Mouse (val), u2 (val), u14 (ref), ClientAttributesHandler (upval), u13 (ref), u20 (ref), u19 (val), u33 (upval), Workspace (upval), u21 (ref), u22 (ref), u23 (ref), u24 (ref), onGetBeamProjectile (upval), u21 (upval), u27 (upval), ClientEnchantmentsHandler (upval)
            local v1, v2, v3, v4, v5, v6, v7, v8
            if not HumanoidRootPart or Character.isRagdolled() then
                return
            end
            local Hit = Mouse.Hit
            local v9 = Vector3.new(Hit.X, HumanoidRootPart.Position.Y, Hit.Z)
            if not (Character.isSeated(u2)) then
                HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position, v9)
            end
            if not u14 then
                u13 = 0
            else
                u13 = math.min(ClientAttributesHandler.getAttribute("ArrowRangeMultiplier") * 1, u13 + p1 * 1.15)
                local v10 = if ClientAttributesHandler.getAttribute("IsAdeptHunter") == 1 then 0 else u13 * 15
                if u20 then
                    u20(0)
                end
                u20 = u19("bow_aim", v10, "add", 10, 0.1)
            end
            if u13 <= 0 then
                u33.Transparency = NumberSequence.new(1)
                return
            end
            local v11 = HumanoidRootPart.CFrame * Vector3.new(0, 2, -2)
            local v12 = u13 * 400
            local v13 = Vector3.new(0, -Workspace.Gravity * 0.3, 0)
            local v14 = (Mouse.Hit.p - v11).Unit * v12 * 0.7
            local v15 = v13 * 0.7
            local v16 = v11
            local v17 = v14
            local Position = v11
            local v18 = 3
            local v19 = 0.05
            for i = 0, v18, v19 do
                v16 = v16 + v17 * 0.05
                v17 = v17 + v15 * 0.05
                if v16.Y <= v11.Y - 100 then
                    break
                end
                v2 = Workspace:Raycast(Position, v16 - Position, RaycastParams.new())
                if v2 then
                    Position = v2.Position
                    break
                end
                Position = v16
            end
            local Magnitude = (Position - v11).Magnitude
            v19 = math.clamp(Magnitude / math.max(v12, 1), 0.1, 3)
            u21 = v11
            u22 = Position
            u23 = v14
            u24 = v15
            v1, v2, v3, v4 = onGetBeamProjectile(v15, v14, v11, v19)
            u33.CurveSize0 = v1
            u33.CurveSize1 = v2
            u21.CFrame = u21.Parent.CFrame:inverse() * v3
            u27.CFrame = u27.Parent.CFrame:inverse() * v4
            if ClientEnchantmentsHandler.hasEnchantment("True Sight") then
                u33.Enabled = true
            else
                u33.Enabled = false
            end
            if Magnitude <= 2 then
                u33.Transparency = NumberSequence.new(1)
                return
            end
            local v20 = 2 / Magnitude
            if 0.5 > v20 then
                v6 = {}
                v7 = NumberSequenceKeypoint.new(0, 1)
                v8 = NumberSequenceKeypoint.new(v20, 0.3)
                local v21 = NumberSequenceKeypoint.new(0.5, 0.3)
                v6[1] = v7
                v6[2] = v8
                v6[3] = v21
                v6[4] = NumberSequenceKeypoint.new(1, 1)
                v5 = v6
            else
                v6 = {}
                v7 = NumberSequenceKeypoint.new(0, 1)
                v8 = NumberSequenceKeypoint.new(0.5, 0.3)
                v6[1] = v7
                v6[2] = v8
                v6[3] = NumberSequenceKeypoint.new(1, 1)
                v5 = v6
            end
            u33.Transparency = NumberSequence.new(v5)
        end)
        if u25 then
            table.insert(u13, u25)
        end
    end
    local function onReloadAttempted() -- Line: 439 -- upvalues: ClientAttributesHandler (upval), useAnimatorObserver (upval), Bow (upval), u15 (ref), u272 (upval), u271 (upval), onBowHasArrow (val), p1 (val), u13 (val)
        local v1 = useAnimatorObserver.play(Bow.Reload, 0.5)
        if not v1 or not u15 then
            return
        end
        v1:AdjustSpeed(ClientAttributesHandler.getAttribute("BowReloadSpeedMultiplier") * 1)
        local v2 = v1.KeyframeReached:Once(function() -- Line: 450 -- upvalues: u272 (upval), u271 (upval), onBowHasArrow (upval), p1 (upval)
            u272 = false
            u271 = true
            onBowHasArrow()
            p1(1)
        end)
        table.insert(u13, v2)
    end
    local u67 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 463 -- upvalues: u271 (upval), u272 (upval), Character (upval), onReloadAttempted (val)
        if p2 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.R and not u271 and not u272 and not (Character.isRagdolled()) then
            onReloadAttempted()
        end
    end)
    local u73 = Signals.Arrow:Connect(function(a1) -- Line: 474 -- upvalues: p1 (val)
        print("Arrow hit signal received:", a1)
        p1({key = 3, hit = a1})
    end)
    u270:Add(function() -- Line: 484 -- upvalues: u11 (ref), u10 (val), u12 (val), u13 (val), u271 (upval), u272 (upval), u67 (ref), u21 (val), u27 (val), u33 (val), u73 (val)
        if u11 then
            u11()
        end
        if u10 then
            u10()
        end
        local v1 = u12
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Stop()
        end
        v1 = u13
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            n:Disconnect()
        end
        u271 = false
        u272 = false
        u67:Disconnect()
        u67 = nil
        u21:Destroy()
        u27:Destroy()
        u33:Destroy()
        task.delay(0.1, function() -- Line: 516 -- upvalues: u73 (upval)
            u73:Disconnect()
        end)
    end)
end
function v4.unequipped() -- Line: 525 -- upvalues: u270 (val)
    u270:Clean()
end
v4.data = v2
return v4