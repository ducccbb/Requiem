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
--    File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Grapples.Default
--                               Dumped in 0.00668 seconds
--                          Bytecode version 9  |  31 functions

local oxygen, oxygen_2
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
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
local Effects_2 = Common_3:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Constants = require(Common_4:WaitForChild("Constants"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Gear = require(Namespaces_2:WaitForChild("Gear"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Network_3 = Common_6:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Server = require(Namespaces_3:WaitForChild("Server"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_7:WaitForChild("Signals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Network_4 = Common_8:WaitForChild("Network")
local Namespaces_4 = Network_4:WaitForChild("Namespaces")
local Vitality = require(Namespaces_4:WaitForChild("Vitality"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities = Common_9:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_10:WaitForChild("Common")
local Sounds_3 = Common_10:WaitForChild("Sounds")
local Titans = require(Sounds_3:WaitForChild("Titans"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_11:WaitForChild("Common")
local Utilities_2 = Common_11:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_12:WaitForChild("Common")
local Utilities_3 = Common_12:WaitForChild("Utilities")
local Draw = require(Utilities_3:WaitForChild("Draw"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_13:WaitForChild("Common")
local Types = Common_13:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_14:WaitForChild("Common")
local Observers = Common_14:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_15:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_16:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State_3 = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State_3:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_17:WaitForChild("Common")
local Utilities_4 = Common_15:WaitForChild("Utilities")
require(Utilities_4:WaitForChild("Signal"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_18:WaitForChild("Common")
local Utilities_5 = Common_16:WaitForChild("Utilities")
local Tinkers = require(Utilities_5:WaitForChild("Tinkers"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Common_17 = ReplicatedStorage_19:WaitForChild("Common")
local Utilities_6 = Common_17:WaitForChild("Utilities")
local Gear_2 = require(Utilities_6:WaitForChild("Gear"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Common_18 = ReplicatedStorage_20:WaitForChild("Common")
local Utilities_7 = Common_18:WaitForChild("Utilities")
local Sounds_2 = require(Utilities_7:WaitForChild("Sounds"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Common_19 = ReplicatedStorage_21:WaitForChild("Common")
local Sounds_4 = Common_19:WaitForChild("Sounds")
local Gear_3 = require(Sounds_4:WaitForChild("Gear"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_22:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local Miscellaneous = User_3:WaitForChild("Miscellaneous")
local ClientAimAssistRunner = require(Miscellaneous:WaitForChild("ClientAimAssistRunner"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_23:WaitForChild("Client")
local Progression = Client_4:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_24:WaitForChild("Client")
local User_4 = Client_5:WaitForChild("User")
local State_4 = User_4:WaitForChild("State")
local ClientStatusHandler = require(State_4:WaitForChild("ClientStatusHandler"))
local u509 = nil
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Common_20 = ReplicatedStorage_25:WaitForChild("Common")
local Utilities_8 = Common_20:WaitForChild("Utilities")
local State = require(Utilities_8:WaitForChild("State"))
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local Common_21 = ReplicatedStorage_26:WaitForChild("Common")
local Gear_4 = require(Common_21:WaitForChild("Logger"))("Gear")
_, _, oxygen, oxygen_2 = State("oxygen")
local v2 = {
    ANIMATION_EASING = 0.2,
    HARD_TURN_THRESHOLD = 0.7,
    BEHIND_DOT_THRESHOLD = -0.6,
    UPWARD_GRAPPLE_HEIGHT_THRESHOLD = 30,
    UPWARD_LOOK_Y_THRESHOLD = 0.5,
    MAX_INACCURACY_OFFSET = 5,
    EXTRA_GRAPPLE_RANGE = 0,
    DISCONNECT_RELEASE_DELAY = 0.75,
    DISCONNECT_GRAPPLE_WINDOW = 6,
    DISCONNECT_GRAPPLE_MAX = 3,
}
local u555 = Config.define(v2)
local function isInteractionOccuring() -- Line: 100 -- upvalues: ClientSettingsHandler (val), u509 (ref)
    local Interact = ClientSettingsHandler.getSettingFromName("Interact")
    if not Interact then
        return false
    end
    local v1 = ClientSettingsHandler.getSettingFromName("Shoot Left Grapple")
    local v2 = ClientSettingsHandler.getSettingFromName("Shoot Right Grapple")
    if not v1 then
        return false
    else
        if not v2 then
            return false
        end
        if Interact.Value == v1.Value then
            local Interaction = u509
            if not Interaction then
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local Client = ReplicatedStorage:WaitForChild("Client")
                local Interfaces = Client:WaitForChild("Interfaces")
                local Routes = Interfaces:WaitForChild("Routes")
                local Interactions = Routes:WaitForChild("Interactions")
                Interaction = require(Interactions:WaitForChild("Interaction"))
            end
            u509 = Interaction
            if u509.getCurrentInteraction() then
                return true
            end
            return false
        elseif Interact.Value ~= v2.Value then
            return false
        end
    end
end
local v3 = {}
function v3.initialized(p1, p2) -- Line: 129 -- upvalues: CollectionService (val), Character (val), ClientStateHandler (val), States (val), u555 (val), Workspace (val), useAnimatorObserver (val), Effects (val), Draw (val), RunService (val), Sounds (val), Titans (val), ClientStatusHandler (val), Signals (val), Gear (val), Gear_4 (val), oxygen_2 (val), ClientAttributesHandler (val), Companions (val), Vitality (val), Players (val), isInteractionOccuring (val), ClientSettingsHandler (val), Server (val), Constants (val), Tinkers (val), Gear_2 (val), ClientAimAssistRunner (val), State (val), Sounds_2 (val), Gear_3 (val), oxygen (val)
    local onGrappleAttempt
    local trove = p2.trove
    local u3 = nil
    local u4 = nil
    local u5 = nil
    local u6 = nil
    local Attachment = Instance.new("Attachment")
    local Attachment_2 = Instance.new("Attachment")
    local Attachment_3 = Instance.new("Attachment")
    local Attachment_4 = Instance.new("Attachment")
    local Attachment_5 = Instance.new("Attachment")
    local Attachment_6 = Instance.new("Attachment")
    local u27 = tick() - 10
    local u28 = 0
    local u31 = tick() - 10
    local u32 = 0
    local u33 = {}
    local u34 = {}
    local u35 = false
    local u36 = nil
    local function cancelDisconnectThread(p1) -- Line: 160 -- upvalues: u34 (val)
        local v1 = u34[p1]
        if not v1 then
            return
        end
        pcall(task.cancel, v1)
        u34[p1] = nil
    end
    local function hasDisconnectTag(p1) -- Line: 170 -- upvalues: CollectionService (upval)
        local Parent = p1
        while Parent do
            if CollectionService:HasTag(Parent, "Disconnect") then
                return true
            end
            Parent = Parent.Parent
        end
        return false
    end
    local function onGrappleAnimationAttempt(p1, a2) -- Line: 181 -- upvalues: Character (upval), p2 (val), ClientStateHandler (upval), States (upval), u555 (upval), Workspace (upval), u35 (ref), useAnimatorObserver (upval), u36 (ref)
        if not (Character.isActive()) then
            return
        end
        local v1 = Character.isGrounded(a2)
        local v2 = p2.grapples[string.lower(p1)]
        if ClientStateHandler.isStateBusy(States.LOCKED) then
            return
        elseif ClientStateHandler.isStateBusy(States.PARRYING) then
            return
        elseif ClientStateHandler.isStateBusy(States.GEAR_SWING) then
            return
        else
            local v3, v4, v5
            if ClientStateHandler.isStateBusy(States.SLIDING) then
                return
            end
            if p1 ~= "Left" then
                v5 = "Left"
            else
                v5 = "Right"
            end
            local v6 = p2.grapples[string.lower(v5)]
            local v7 = nil
            local v8 = p2.getAnimations()
            local HumanoidRootPart = a2:WaitForChild("HumanoidRootPart")
            local Unit = (v2.attachment.WorldPosition - HumanoidRootPart.Position).Unit
            local v9 = HumanoidRootPart.CFrame.LookVector:Dot(Unit)
            local v10 = v9 < u555.BEHIND_DOT_THRESHOLD
            local v11 = HumanoidRootPart.CFrame.RightVector:Dot(Unit)
            local v12 = u555.HARD_TURN_THRESHOLD < v11
            local v13 = v11 < -u555.HARD_TURN_THRESHOLD
            local v14 = v2.attachment.WorldPosition.Y - HumanoidRootPart.Position.Y
            local v15 = u555.UPWARD_GRAPPLE_HEIGHT_THRESHOLD < v14
            local v16 = u555.UPWARD_LOOK_Y_THRESHOLD < Workspace.CurrentCamera.CFrame.LookVector.Y
            local v17 = v15 and v16
            if v2.active == false then
                if ClientStateHandler.isStateBusy(States.SLIDING) or u35 or ClientStateHandler.isStateBusy(States.TURBINE) or p2.no_physics then
                    return
                end
                if p2.animation then
                    p2.animation:Stop(u555.ANIMATION_EASING)
                end
                v3 = v8.Grapples.Releases[p1]
                v4 = v3[math.random(1, #v3)]
                v7 = useAnimatorObserver.play(v4, u555.ANIMATION_EASING)
                p2.animation = v7
                return
            end
            if not v6.grappled then
                if u35 then
                    return
                end
                if v1 then
                    v7 = useAnimatorObserver.play(v8.Grapples.Ground[p1], u555.ANIMATION_EASING)
                elseif not v1 then
                    if v10 then
                        v3 = v8.Grapples.Air.Behind[p1]
                    elseif v12 then
                        if not v13 then
                            v4 = "Right"
                        else
                            v4 = "Left"
                        end
                        v3 = v8.Grapples.Air.Directional[v4]
                        if not v3 then
                            if not v17 then
                                v3 = v8.Grapples.Air[p1]
                            else
                                v3 = v8.Grapples.Air.Upward[p1]
                            end
                        end
                    elseif not v13 then
                    end
                    v7 = useAnimatorObserver.play(v3, u555.ANIMATION_EASING)
                end
                if u36 then
                    u36:Disconnect()
                    u36 = nil
                end
                if v7 then
                    u35 = true
                    u36 = v7.Stopped:Once(function() -- Line: 293 -- upvalues: u35 (upval), u36 (upval)
                        u35 = false
                        if u36 then
                            u36:Disconnect()
                            u36 = nil
                        end
                    end)
                end
                p2.animation = v7
                return
            else
                v3 = tick() - v6.grappled
                if v3 < 0.15 then
                    if p2.animation then
                        p2.animation:Stop(u555.ANIMATION_EASING)
                    end
                    v3 = v8.Grapples.Double[math.random(1, #v8.Grapples.Double)]
                    v7 = useAnimatorObserver.play(v3, 0.1)
                end
            end
        end
    end
    local function onGrappleRelease(p1, a2, p3) -- Line: 307 -- upvalues: cancelDisconnectThread (val), Character (upval), trove (val), p2 (val), ClientStateHandler (upval), States (upval), Effects (upval), Attachment_3 (ref), Attachment_4 (ref), Attachment (ref), Attachment_2 (ref), Workspace (upval), Draw (upval), RunService (upval), onGrappleAnimationAttempt (val), Sounds (upval), Titans (upval), ClientStatusHandler (upval), Signals (upval), Gear (upval), u33 (val)
        local u50, v1, v2
        cancelDisconnectThread(p1)
        local v3 = Character.getCharacter()
        if not v3 or trove._cleaning or not (Character.isActive()) then
            return
        end
        local u19 = p2.grapples[string.lower(p1)]
        if not u19 or not u19.active then
            return
        end
        if p1 ~= "Left" then
            v1 = "Left"
        else
            v1 = "Right"
        end
        if not (p2.grapples[string.lower(v1)].active) then
            ClientStateHandler.updateState(States.GRAPPLING, false)
        end
        Effects.emitClientEffect("Retract")
        if p1 ~= "Left" then
            v2 = Attachment_4
        else
            v2 = Attachment_3
        end
        local WorldPosition = v2.WorldPosition
        if p1 ~= "Left" then
            u50 = Attachment_2
        else
            u50 = Attachment
        end
        local Attachment_5 = Instance.new("Attachment")
        Attachment_5.Parent = Workspace.Terrain
        Attachment_5.WorldPosition = WorldPosition
        u19.line:Destroy()
        local u78 = Draw.line(Attachment_5, u50, Color3.fromRGB(0, 0, 0))
        local Magnitude = (Attachment_5.WorldPosition - u50.WorldPosition).Magnitude
        local u83 = Magnitude / 700
        local u84 = 0
        local u85 = nil
        u85 = RunService.RenderStepped:Connect(function(a1) -- Line: 352 -- upvalues: u84 (ref), u83 (val), Attachment_5 (val), u50 (val), u85 (ref), u78 (val), u19 (val), p2 (upval), p1 (val), Magnitude (val)
            local v1
            u84 = u84 + a1
            local v2 = math.min(u84 / u83, 1)
            Attachment_5.Position = Attachment_5.Position:Lerp(u50.WorldPosition, v2)
            local Magnitude_2 = (Attachment_5.Position - u50.WorldPosition).Magnitude
            if 1 <= v2 or Magnitude_2 < 8 then
                u85:Disconnect()
                Attachment_5:Destroy()
                u78:Destroy()
                if u19.hitbox then
                    u19.hitbox:Destroy()
                end
                v1 = p2.grapples[string.lower(p1)]
                v1.busy = false
                return
            end
            if 0.3 <= v2 then
                if p2.grapples[string.lower(p1)].busy then
                    v1 = p2.grapples[string.lower(p1)]
                    v1.busy = false
                end
            elseif Magnitude_2 < Magnitude * 0.7 and p2.grapples[string.lower(p1)].busy then
                v1 = p2.grapples[string.lower(p1)]
                v1.busy = false
            end
        end)
        local v4 = p2.grapples[string.lower(p1)]
        v4.active = false
        v4 = p2.grapples[string.lower(p1)]
        v4.busy = false
        onGrappleAnimationAttempt(p1, v3)
        if p3 then
            Sounds.playGlobalSoundEffect(Titans.GrappleHasBeenShaken, 0.3, 0.5, 2, NumberRange.new(0.8, 1))
            local v5 = NumberRange.new(0.8, 1)
            Sounds.playGlobalSoundEffect(Titans.MetalHitReverb, 0.3, 0.1, 2, v5, 0.5)
            ClientStatusHandler.addPlayerStatus("Concussed", 1)
            Signals.Monologue:Fire("They've cut my wire, damn it.")
        end
        Gear.Grapple.unreliablePost({enabled = false, side = p1})
        if u33[p1] then
            u33[p1]:Disconnect()
        end
        local v6 = p2.grapples[string.lower(p1)]
        p2.signals.grapple:Fire(v6, p1)
        if not a2 then
            trove:Add(u85)
        end
    end
    local function onGrappleToPosition(p1, a2, p3) -- Line: 409 -- upvalues: Character (upval), trove (val), Gear_4 (upval), Effects (upval), Attachment (ref), Attachment_2 (ref), Attachment_3 (ref), Attachment_4 (ref), Workspace (upval), Attachment_5 (ref), Attachment_6 (ref), p2 (val), cancelDisconnectThread (val), u33 (val), onGrappleRelease (val), Draw (upval), RunService (upval), Gear (upval), hasDisconnectTag (val), u34 (val), u555 (upval), Signals (upval)
        local grapples, line, u41, u83, v1, v2, v3
        local v4 = Character.getCharacter()
        if not v4 or trove._cleaning or not (Character.isActive()) then
            Gear_4.warn("No character found while on grapple to position")
            return
        end
        local PrimaryPart = v4
        if PrimaryPart then
            PrimaryPart = v4.PrimaryPart
        end
        if not PrimaryPart then
            return
        end
        Effects.sendReplicatedEffect("Hook")
        if p1 ~= "Left" then
            v3 = 1.06
        else
            v3 = -1.06
        end
        local v5 = CFrame.new(v3, -0.8, -0.45)
        if p1 ~= "Left" then
            v3 = Attachment_2
        else
            v3 = Attachment
        end
        v3.Parent = v4.Torso
        v3.CFrame = v5
        if p1 ~= "Left" then
            u41 = Attachment_4
        else
            u41 = Attachment_3
        end
        u41.Parent = Workspace.Terrain
        local Part = Instance.new("Part")
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CFrame = CFrame.new(a2)
        Part.Size = Vector3.new(5, 5, 5)
        Part.Color = Color3.fromRGB(255, 0, 0)
        Part.Transparency = 1
        Part.Parent = Workspace
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Parent = Part
        WeldConstraint.Part0 = Part
        WeldConstraint.Part1 = p3
        WeldConstraint.Parent = Part
        if p1 ~= "Left" then
            u83 = Attachment_6
        else
            u83 = Attachment_5
        end
        u83.Parent = Part
        local v6 = p2.grapples[string.lower(p1)]
        if v6.busy then
            return
        end
        cancelDisconnectThread(p1)
        if v6 and v6.line then
            v6.line:Destroy()
        end
        if v6 and v6.animation then
            v6.animation:Disconnect()
        end
        if p3 and p3.Parent then
            local AttributeChangedSignal = p3.Parent:GetAttributeChangedSignal("Shaking")
            u33[p1] = AttributeChangedSignal:Connect(function() -- Line: 476 -- upvalues: p3 (val), onGrappleRelease (upval), p1 (val)
                local Attribute = p3.Parent:GetAttribute("ShakeData")
                if p3.Parent:GetAttribute("Shaking") then
                    local v1
                    if not Attribute then
                        v1 = false
                    else
                        v1 = not (Attribute ~= 3)
                    end
                    onGrappleRelease(p1, nil, v1)
                end
            end)
        end
        local u142 = (a2 - v3.WorldPosition).Magnitude / 300
        local u157 = Draw.line(v3, u41, Color3.fromRGB(0, 0, 0))
        u41.Parent = Part
        u41.WorldPosition = v3.WorldPosition
        local u162 = 0
        local u163 = nil
        u163 = RunService.RenderStepped:Connect(function(a1) -- Line: 499 -- upvalues: u162 (ref), u142 (val), u41 (val), u83 (val), u157 (val), p2 (upval), p1 (val), u163 (ref)
            u162 = u162 + a1
            local v1 = math.min(u162 / u142, 1)
            u41.WorldPosition = u41.WorldPosition:Lerp(u83.WorldPosition, v1)
            local v2 = math.sin(u162 * 50) * 5
            u157.CurveSize0 = (1 - v1) * (v2 * math.exp(-u162 / 0.15))
            if (u41.WorldPosition - u83.WorldPosition).Magnitude < 6 and p2.grapples[string.lower(p1)].busy then
                local v3 = p2.grapples[string.lower(p1)]
                v3.busy = false
            end
            if 1 <= v1 then
                u163:Disconnect()
            end
        end)
        trove:Add(u163)
        trove:Add(function() -- Line: 521 -- upvalues: Part (val)
            Part:Destroy()
        end)
        local unreliablePost = Gear.Grapple.unreliablePost
        local v7 = {enabled = true, goal = a2}
        if not p3 then
            v1 = CFrame.new()
        else
            v1 = p3.CFrame:ToObjectSpace(CFrame.new(a2))
        end
        v7.relative = v1
        v7.side = p1
        v7.hit = p3
        unreliablePost(v7)
        if p2.grapples[string.lower(p1)] and p2.grapples[string.lower(p1)].hitbox then
            p2.grapples[string.lower(p1)].hitbox:Destroy()
        end
        grapples = p2.grapples
        v7 = string.lower(p1)
        v1 = {
            busy = false,
            active = true,
            hitbox = Part,
            goal = a2,
            attachment = u83,
        }
        if not p3 then
            v2 = CFrame.new()
        else
            v2 = p3.CFrame:ToObjectSpace(CFrame.new(a2))
            if not v2 then
                v2 = CFrame.new()
            end
        end
        v1.relative = v2
        v1.line = u157
        v1.grappled = tick()
        v1.animation = u163
        v1.hit = p3
        grapples[v7] = v1
        v1 = p2.grapples[string.lower(p1)]
        p2.signals.grapple:Fire(v1, p1, true)
        if hasDisconnectTag(p3) then
            u34[p1] = task.delay(u555.DISCONNECT_RELEASE_DELAY, function() -- Line: 564 -- upvalues: u34 (upval), p1 (val), trove (upval), Character (upval), p2 (upval), p3 (val), Signals (upval), onGrappleRelease (upval)
                u34[p1] = nil
                if trove._cleaning or not (Character.isActive()) then
                    return
                end
                local v1 = p2.grapples[string.lower(p1)]
                if v1 and v1.active and v1.hit == p3 then
                    Signals.Monologue:Fire("Damn, my grapple couldn't hold onto that surface.")
                    onGrappleRelease(p1)
                end
            end)
        end
    end
    local function recreateAttachments() -- Line: 580 -- upvalues: Attachment (ref), Attachment_2 (ref), Attachment_3 (ref), Attachment_4 (ref), Attachment_5 (ref), Attachment_6 (ref)
        if not Attachment.Parent then
            Attachment = Instance.new("Attachment")
        end
        if not Attachment_2.Parent then
            Attachment_2 = Instance.new("Attachment")
        end
        if not Attachment_3.Parent then
            Attachment_3 = Instance.new("Attachment")
        end
        if not Attachment_4.Parent then
            Attachment_4 = Instance.new("Attachment")
        end
        if not Attachment_5.Parent then
            Attachment_5 = Instance.new("Attachment")
        end
        if not Attachment_6.Parent then
            Attachment_6 = Instance.new("Attachment")
        end
    end
    function onGrappleAttempt(p1, a2) -- Line: 608 -- upvalues: Character (upval), Gear_4 (upval), oxygen_2 (upval), ClientAttributesHandler (upval), Companions (upval), Vitality (upval), Players (upval), isInteractionOccuring (upval), p2 (val), Signals (upval), ClientSettingsHandler (upval), onGrappleAttempt (val), ClientStateHandler (upval), States (upval), Server (upval), Constants (upval), u27 (ref), u28 (ref), recreateAttachments (val), CollectionService (upval), Tinkers (upval), Gear_2 (upval), u555 (upval), Workspace (upval), ClientAimAssistRunner (upval), State (upval), hasDisconnectTag (val), u31 (ref), u32 (ref), onGrappleToPosition (val), onGrappleAnimationAttempt (val)
        local v1 = Character.getCharacter()
        if not v1 then
            Gear_4.warn("No character found while on grapple attempt")
            return
        end
        local v2 = oxygen_2()
        if not v2 then
            local Attribute = v1:GetAttribute("Mounted")
            local v3 = ClientAttributesHandler.getAttribute("HasExpertRider") == 1
            if Attribute and v3 then
                Companions.Dismount.post()
            end
            local v4 = Vitality.Store.get(Players.LocalPlayer)
            if not v4 then
                return
            end
            local name = nil
            for k, v in pairs(v4.limbs) do
                if v.name == p1 .. " Arm" and v.missing.missing == 1 then
                    name = v.name
                    break
                end
            end
            if name then
                return
            end
            if Character.isRagdolled(v1) then
                return
            elseif not v1.Humanoid.Sit then
                if isInteractionOccuring() then
                    return
                end
                if p2.health >= 30 then
                    local function onAttemptRetryGrapple() -- Line: 666 -- upvalues: ClientAttributesHandler (upval), p1 (val), ClientSettingsHandler (upval), onGrappleAttempt (upval)
                        local v1
                        local v2 = ClientAttributesHandler.getAttribute("Autograpple") == 1
                        if not v2 then
                            return false
                        end
                        if p1 ~= "Left" then
                            v1 = "Shoot Right Grapple"
                        else
                            v1 = "Shoot Left Grapple"
                        end
                        if not (ClientSettingsHandler.isKeyPressed(v1)) then
                            return false
                        end
                        task.wait(0.1)
                        if ClientSettingsHandler.isKeyPressed(v1) then
                            return onGrappleAttempt(p1, true)
                        end
                    end
                    if p2.busy() then
                        return
                    end
                    if p2.blocking then
                        return
                    else
                        local v5
                        if not p2.enabled then
                            return
                        end
                        if ClientAttributesHandler.getAttribute("CanCheckGasWhileMoving") == 1 then
                            v5 = {States.CHECKING_GAS}
                            if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_GRAPPLING, v5) then
                                return
                            end
                        elseif ClientAttributesHandler.getAttribute("CanCheckGasWhileMoving") ~= 0 then
                            if Character.isRagdolled() then
                                return
                            end
                            if p2.gas > 0 then
                                local CFrame, v6, v7, v8, v9
                                local v10 = tick() - u27
                                if 2 < v10 then
                                    u28 = 0
                                    u27 = tick()
                                end
                                if 5 < u28 then
                                    return
                                end
                                local PrimaryPart = v1
                                if PrimaryPart then
                                    PrimaryPart = v1.PrimaryPart
                                end
                                if not PrimaryPart then
                                    return
                                end
                                ClientStateHandler.updateState(States.GRAPPLING, true)
                                recreateAttachments()
                                local Mouse = Players.LocalPlayer:GetMouse()
                                v5 = CollectionService:GetTagged("Focused")[1]
                                if not v5 then
                                    CFrame = Mouse.Hit
                                elseif not v5.PrimaryPart then
                                    CFrame = v5:GetPivot()
                                else
                                    CFrame = v5.PrimaryPart.CFrame
                                end
                                if ClientAttributesHandler.getAttribute("GrappleLengthScaleVelocity") ~= 1 then
                                    v6 = 0
                                else
                                    v6 = math.clamp(PrimaryPart.AssemblyLinearVelocity.Magnitude / 2 / 400, 0, 1)
                                end
                                local v11 = Tinkers.getModifierConfig("Grapple Range")
                                local v12 = Gear_2.getTinkerModifierMultiplier(p2, "Grapple Range", v11)
                                local GearGrappleRangeMultiplier = ClientAttributesHandler.getAttribute("GearGrappleRangeMultiplier")
                                local v13 = (ClientAttributesHandler.getAttribute("GearAdditionalGrappleRange") + 400 + u555.EXTRA_GRAPPLE_RANGE) * v12 * (1 + v6) * GearGrappleRangeMultiplier
                                local v14 = 1 - (ClientAttributesHandler.getAttribute("GearGrappleAccuracyMultiplier") or 0)
                                local v15 = math.clamp(((CFrame.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude - 50) / (v13 - 50) * u555.MAX_INACCURACY_OFFSET, 0, u555.MAX_INACCURACY_OFFSET)
                                local v16 = math.random(-v15, v15)
                                local v17 = math.random(-v15, v15)
                                v16 = CFrame.Position + Vector3.new(v16, v17, math.random(-v15, v15)) * v14
                                local unit = (v16 - Workspace.CurrentCamera.CFrame.Position).unit
                                local Tagged = CollectionService:GetTagged("Corpse")
                                local Tagged_2 = CollectionService:GetTagged("Collider")
                                local Tagged_3 = CollectionService:GetTagged("Carry")
                                local Tagged_4 = CollectionService:GetTagged("Ungrappleable")
                                local Tagged_5 = CollectionService:GetTagged("Character")
                                local Tagged_6 = CollectionService:GetTagged("Water")
                                local v18 = RaycastParams.new()
                                v18.FilterType = Enum.RaycastFilterType.Exclude
                                v18.CollisionGroup = "Blades"
                                local v19 = {}
                                local v20 = Tagged_4
                                if not a2 then
                                    v9 = {}
                                else
                                    v9 = Tagged_5
                                end
                                v19[1] = v1
                                v19[2] = Tagged
                                v19[3] = Tagged_2
                                v19[4] = Tagged_3
                                v19[5] = v20
                                v19[6] = Tagged_6
                                v19[7] = v9
                                v18.FilterDescendantsInstances = v19
                                v19 = Workspace:Raycast(Workspace.CurrentCamera.CFrame.Position, unit * v13, v18)
                                local Position = v19
                                if Position then
                                    Position = v19.Position
                                end
                                local Instance = v19
                                if Instance then
                                    Instance = v19.Instance
                                end
                                v7, v8 = ClientAimAssistRunner.onValidateAimAssistRaycast(Workspace.CurrentCamera.CFrame.Position, unit * v13, v18)
                                if v7 and v8 then
                                    Position = v8.Position
                                    Instance = v8
                                end
                                if v7 then
                                    if v5 then
                                        State("Focusing")(false)
                                    end
                                elseif not v8 then
                                end
                                if v19 then
                                    if not Instance or not (hasDisconnectTag(Instance)) then
                                        u28 = u28 + 1
                                        onGrappleToPosition(p1, Position, Instance)
                                        onGrappleAnimationAttempt(p1, v1)
                                        return true
                                    end
                                    v20 = tick() - u31
                                    if u555.DISCONNECT_GRAPPLE_WINDOW < v20 then
                                        u32 = 0
                                        u31 = tick()
                                    end
                                    if u555.DISCONNECT_GRAPPLE_MAX <= u32 then
                                        ClientStateHandler.updateState(States.GRAPPLING, false)
                                        return
                                    end
                                    u32 = u32 + 1
                                    u28 = u28 + 1
                                    onGrappleToPosition(p1, Position, Instance)
                                    onGrappleAnimationAttempt(p1, v1)
                                    return true
                                elseif not v7 then
                                    ClientStateHandler.updateState(States.GRAPPLING, false)
                                    onAttemptRetryGrapple()
                                    return
                                end
                            elseif Server.Store.client().event ~= 0 then
                                return
                            elseif Constants.IsSupporterPlace then
                                return
                            end
                        elseif ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_GRAPPLING) then
                            return
                        end
                    end
                elseif math.random() < 0.2 then
                    Signals.Monologue:Fire("My grapple malfunctioned, my gear is in no shape to be used like this.")
                    return
                end
            elseif not Attribute then
                return
            elseif not v3 then
                return
            end
        elseif v2.inWater then
            return
        end
    end
    local function onHandlesUnholstered() -- Line: 870 -- upvalues: trove (val), u3 (ref), ClientSettingsHandler (upval), onGrappleAttempt (val), u4 (ref), u5 (ref), onGrappleRelease (val), u6 (ref), Character (upval), Sounds_2 (upval), Gear_3 (upval)
        if trove._cleaning then
            return
        end
        u3 = ClientSettingsHandler.onKeybindPressed("Shoot Left Grapple"):Connect(function() -- Line: 876 -- upvalues: onGrappleAttempt (upval)
            onGrappleAttempt("Left")
        end)
        u4 = ClientSettingsHandler.onKeybindPressed("Shoot Right Grapple"):Connect(function() -- Line: 880 -- upvalues: onGrappleAttempt (upval)
            onGrappleAttempt("Right")
        end)
        u5 = ClientSettingsHandler.onKeybindReleased("Shoot Left Grapple"):Connect(function() -- Line: 884 -- upvalues: onGrappleRelease (upval)
            onGrappleRelease("Left")
        end)
        u6 = ClientSettingsHandler.onKeybindReleased("Shoot Right Grapple"):Connect(function() -- Line: 888 -- upvalues: onGrappleRelease (upval)
            onGrappleRelease("Right")
        end)
        trove:Add(u3)
        trove:Add(u4)
        trove:Add(u5)
        trove:Add(u6)
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        Sounds_2.playRangedSoundEffect(Gear_3.HandleEquipped, v1.HumanoidRootPart, 40, 1, math.random(95, 105) / 100)
    end
    trove:Add(p2.signals.ungrapple:Connect(function(p1) -- Line: 912 -- upvalues: onGrappleRelease (val)
        onGrappleRelease(p1)
    end))
    trove:Add(p2.signals.enabled:Connect(function(p1) -- Line: 916 -- upvalues: onGrappleRelease (val)
        if not p1 then
            onGrappleRelease("Left")
            onGrappleRelease("Right")
        end
    end))
    trove:Add(p2.signals.force_grapple:Connect(function(p1, p2, p3) -- Line: 923 -- upvalues: onGrappleToPosition (val)
        onGrappleToPosition(p1, p2, p3)
    end))
    local u72 = false
    trove:Add(oxygen(function(p1) -- Line: 931 -- upvalues: u72 (ref), onGrappleRelease (val)
        local inWater = p1
        if inWater then
            inWater = p1.inWater
        end
        local v1 = inWater == true
        if v1 and not u72 then
            onGrappleRelease("Left")
            onGrappleRelease("Right")
        end
        u72 = v1
    end))
    trove:Add(ClientStatusHandler.getStatusAddedSignal("Concussed"):Connect(function() -- Line: 941 -- upvalues: onGrappleRelease (val)
        onGrappleRelease("Left")
        onGrappleRelease("Right")
    end))
    local function onHandlesHolstered() -- Line: 948 -- upvalues: u3 (ref), u4 (ref), u5 (ref), u6 (ref), Character (upval), Sounds_2 (upval), Gear_3 (upval)
        u3:Disconnect()
        u4:Disconnect()
        u5:Disconnect()
        u6:Disconnect()
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        Sounds_2.playRangedSoundEffect(Gear_3.HandleEquipped, v1.HumanoidRootPart, 40, 1, math.random(75, 85) / 100)
    end
    trove:Add(function() -- Line: 969 -- upvalues: onGrappleRelease (val)
        onGrappleRelease("Left", true)
        onGrappleRelease("Right", true)
    end)
    trove:Add(function() -- Line: 974 -- upvalues: u33 (val), cancelDisconnectThread (val)
        for k, v in pairs(u33) do
            v:Disconnect()
        end
        cancelDisconnectThread("Left")
        cancelDisconnectThread("Right")
    end)
    trove:Add(p2.signals.handles:Connect(function(p1) -- Line: 984 -- upvalues: onHandlesUnholstered (val), onHandlesHolstered (val)
        if p1 then
            onHandlesUnholstered()
            return
        end
        onHandlesHolstered()
    end))
end
return v3