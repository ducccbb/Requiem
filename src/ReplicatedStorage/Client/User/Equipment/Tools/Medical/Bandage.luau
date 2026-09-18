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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Medical.Bandage
--                               Dumped in 0.00237 seconds
--                          Bytecode version 9  |  12 functions

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
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local State = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local State_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Bandage = require(Tools:WaitForChild("Bandage"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Types = Common_9:WaitForChild("Types")
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_10:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Animations = Common_11:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Bandages = require(Tools_2:WaitForChild("Bandages"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_12:WaitForChild("Common")
local Observers = Common_12:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_3 = Common_13:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_14:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u338 = Config.define({HEAL_DURATION = 2, HEAL_WALK_SPEED = 5, TARGET_RAYCAST_DISTANCE = 20, SELF_HEAL_ANIMATION_END_EARLY = 0.3})
local u339 = nil
local u340 = nil
local u341 = nil
local u342 = nil
local u344 = tick()
local u345 = nil
local u346 = nil
local u347 = nil
local u348 = nil
local u349 = nil
local v3 = {
    description = "A medical bandage, which can be used to heal wounds.",
    attributes = {"Medical"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Medical,
}
local function removeTargetRoot() -- Line: 98 -- upvalues: u349 (ref)
    if u349 then
        u349:SetAttribute("Type", nil)
        u349:RemoveTag("Interaction")
        u349 = nil
    end
end
local function getSelfHealDuration() -- Line: 110 -- upvalues: ClientAttributesHandler (val), u338 (val)
    return u338.HEAL_DURATION * ClientAttributesHandler.getAttribute("BandageSelfHealTimeMultiplier")
end
local function playSelfHealAnimation() -- Line: 118 -- upvalues: ClientAttributesHandler (val), useAnimatorObserver (val), Bandages (val)
    local BandageSelfHealTimeMultiplier = ClientAttributesHandler.getAttribute("BandageSelfHealTimeMultiplier")
    local v1 = useAnimatorObserver.play(Bandages.Self, 0.2)
    v1:AdjustSpeed(1 - BandageSelfHealTimeMultiplier + 1)
    return v1
end
return {
    equipped = function(p1) -- Line: 128 -- upvalues: useWalkSpeed (val), u346 (ref), removeTargetRoot (val), u344 (ref), Vitality (val), Signals (val), u338 (val), getSelfHealDuration (val), u345 (ref), Character (val), u348 (ref), CollectionService (val), u340 (ref), RunService (val), Workspace (val), UserInputService (val), ClientStateHandler (val), u342 (ref), Alive (val), Players (val), Server (val), Config (val), u341 (ref), u347 (ref), playSelfHealAnimation (val), Sounds (val), Bandage (val), u339 (ref), ClientSettingsHandler (val)
        local u3
        _, u3 = useWalkSpeed()
        if u346 then
            u346()
            u346 = nil
        end
        removeTargetRoot()
        local function onHealUser(a1) -- Line: 137 -- upvalues: u344 (upval), Vitality (upval), Signals (upval), u338 (upval), getSelfHealDuration (upval), u346 (upval), u3 (val), u345 (upval), p1 (val)
            local HEAL_DURATION
            if tick() < u344 then
                return false
            end
            local v1 = Vitality.Store.client()
            if a1 then
                if not a1 then
                    HEAL_DURATION = getSelfHealDuration()
                else
                    HEAL_DURATION = u338.HEAL_DURATION
                end
                u346 = u3("healing", u338.HEAL_WALK_SPEED, "set", 20)
                u345 = task.delay(HEAL_DURATION, function() -- Line: 152 -- upvalues: u346 (upval), a1 (val), p1 (upval)
                    if not u346 then
                        return
                    end
                    if not a1 then
                        p1()
                    end
                    u346()
                end)
                u344 = tick() + HEAL_DURATION
                return true
            end
            if v1.health == v1.maxHealth then
                Signals.Monologue:Fire("I'm already at full health.")
                return false
            end
            if not a1 then
                HEAL_DURATION = getSelfHealDuration()
            else
                HEAL_DURATION = u338.HEAL_DURATION
            end
            u346 = u3("healing", u338.HEAL_WALK_SPEED, "set", 20)
            u345 = task.delay(HEAL_DURATION, function() -- Line: 152 -- upvalues: u346 (upval), a1 (val), p1 (upval)
                if not u346 then
                    return
                end
                if not a1 then
                    p1()
                end
                u346()
            end)
            u344 = tick() + HEAL_DURATION
            return true
        end
        local v1 = Character.getCharacterAsync():await()
        if not v1 then
            return
        end
        u348 = Instance.new("Highlight")
        u348.FillTransparency = 1
        u348.OutlineTransparency = 0.5
        local u28 = RaycastParams.new()
        u28.FilterDescendantsInstances = {CollectionService:GetTagged("Character")}
        u28.FilterType = Enum.RaycastFilterType.Include
        u340 = RunService.RenderStepped:Connect(function() -- Line: 184 -- upvalues: Workspace (upval), UserInputService (upval), u338 (upval), u28 (val), ClientStateHandler (upval), u348 (upval), u342 (upval), removeTargetRoot (upval), Alive (upval), Players (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
            local v2 = Workspace:Raycast(v1.Origin, v1.Direction * u338.TARGET_RAYCAST_DISTANCE, u28)
            if not v2 or ClientStateHandler.isStateBusy(ClientStateHandler.States.BANDAGING) then
                u348.Adornee = nil
                u348.Parent = nil
                u342 = nil
                removeTargetRoot()
                return
            end
            if not v2.Instance or not (v2.Instance.Parent:IsA("Model")) or not (v2.Instance.Parent:FindFirstChildWhichIsA("Humanoid")) then
                u348.Adornee = nil
                u348.Parent = nil
                removeTargetRoot()
                return
            end
            u342 = Alive.getPlayerFromCharacter(v2.Instance.Parent)
            if u342 == Players.LocalPlayer then
                u348.Adornee = nil
                u348.Parent = nil
                u342 = nil
                return
            end
            if not u342 then
                if u348.Adornee ~= v2.Instance.Parent then
                    u348.Adornee = v2.Instance.Parent
                    u348.Parent = v2.Instance.Parent
                    return
                end
                return
            end
            local v3 = math.floor(u342:GetAttribute("Health") or 0)
            if v3 == math.floor(u342:GetAttribute("MaxHealth") or 100) then
                u348.Adornee = nil
                u348.Parent = nil
                u342 = nil
                removeTargetRoot()
                return
            end
            if u348.Adornee == v2.Instance.Parent then
                return
            end
            u348.Adornee = v2.Instance.Parent
            u348.Parent = v2.Instance.Parent
        end)
        local function canUseBandages() -- Line: 251 -- upvalues: ClientStateHandler (upval), Signals (upval), Server (upval), Config (upval)
            if ClientStateHandler.isStateBusy(ClientStateHandler.States.BANDAGING) then
                Signals.Toast:Fire({message = "You are already bandaging someone.", type = "error"})
                return false
            end
            if Server.Store.client().event ~= 0 or Config.Constants.IsDebuggingPlace then
                return true
            end
            Signals.Toast:Fire({message = "You cannot do this unless an event is active.", type = "error"})
            return false
        end
        u341 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 274 -- upvalues: u342 (upval), canUseBandages (val), u348 (upval), Alive (upval), p1 (val), removeTargetRoot (upval), onHealUser (val), getSelfHealDuration (upval), u347 (upval), playSelfHealAnimation (upval), Sounds (upval), Bandage (upval), u338 (upval)
            local HumanoidRootPart
            if p2 then
                return
            end
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                if a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u348.Parent or not (canUseBandages()) or not (onHealUser()) then
                    return
                end
                local v1 = Alive.getAliveCharacter(Alive.LocalPlayer)
                if not v1 then
                    return
                end
                HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then
                    return
                end
                u347 = playSelfHealAnimation()
                Sounds.playRangedSoundEffect(Bandage.Bandage, HumanoidRootPart, 60, 1)
                task.wait(getSelfHealDuration() - u338.SELF_HEAL_ANIMATION_END_EARLY)
                if not u347 then
                    return
                end
                u347:Stop(0.2)
                return
            elseif u342 and canUseBandages() and u348.Parent then
                local v2 = Alive.getAliveCharacter(u342)
                if not v2 or not (v2:FindFirstChild("HumanoidRootPart")) then
                    return
                end
                p1(u342)
                removeTargetRoot()
                return
            end
        end)
        u339 = ClientSettingsHandler.onKeybindPressed("Bandage Self Heal"):Connect(function() -- Line: 329 -- upvalues: canUseBandages (val), onHealUser (val), getSelfHealDuration (upval), u347 (upval), playSelfHealAnimation (upval), u338 (upval)
            if not (canUseBandages()) or not (onHealUser()) then
                return
            end
            u347 = playSelfHealAnimation()
            task.wait(getSelfHealDuration() - u338.SELF_HEAL_ANIMATION_END_EARLY)
            if not u347 then
                return
            end
            u347:Stop(0.2)
        end)
    end,
    unequipped = function() -- Line: 355 -- upvalues: u339 (ref), u340 (ref), u341 (ref), u346 (ref), u347 (ref), u348 (ref), u345 (ref), removeTargetRoot (val)
        if u339 then
            u339:Disconnect()
        end
        if u340 then
            u340:Disconnect()
        end
        if u341 then
            u341:Disconnect()
        end
        if u346 then
            u346()
            u346 = nil
        end
        if u347 then
            u347:Stop(0.2)
            u347 = nil
        end
        if u348 then
            u348:Destroy()
        end
        if u345 then
            task.cancel(u345)
        end
        removeTargetRoot()
    end,
    data = v3,
}