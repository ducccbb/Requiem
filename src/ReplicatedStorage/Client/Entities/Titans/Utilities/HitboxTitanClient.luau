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
--      File: ReplicatedStorage.Client.Entities.Titans.Utilities.HitboxTitanClient
--                               Dumped in 0.00558 seconds
--                          Bytecode version 9  |  22 functions

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
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client_2:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local User_3 = Client_4:WaitForChild("User")
local State = User_3:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_10:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local u234 = {House = true, Cannon = true}
local u235 = {
    Arm = {"LowerArm", "UpperArm", "Hand"},
}
local v2 = {"LowerLeg", "UpperLeg", "Foot"}
u235.Leg = v2
local u244 = {
    "Left Arm",
    "Torso",
    "Right Arm",
    "Left Leg",
    "Right Leg",
    "Head",
}
local function getJointPadding(p1, p2) -- Line: 111
    if typeof(p1) == "Vector3" then
        return p1
    end
    local v1 = p1[p2]
    if typeof(v1) == "Vector3" then
        return v1
    end
    return nil
end
local function getMouthToCharacterDistance(p1, p2, p3) -- Line: 174
    local v1
    local PrimaryPart = p2.PrimaryPart
    if not PrimaryPart then
        return math.huge
    end
    if not p3 then
        return (p1 - PrimaryPart.Position).Magnitude
    end
    local Magnitude = (p1 - PrimaryPart.Position).Magnitude
    local v2 = {"Head", "UpperTorso", "Torso"}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = p2:FindFirstChild(j)
        if v1 and v1:IsA("BasePart") then
            Magnitude = math.min(Magnitude, (p1 - v1.Position).Magnitude)
        end
    end
    return Magnitude
end
local function getClosestCharacterTargetPosition(p1, p2, p3) -- Line: 195
    local Magnitude_2, v1
    local PrimaryPart = p2.PrimaryPart
    if not PrimaryPart then
        return p1
    end
    if not p3 then
        return PrimaryPart.Position
    end
    local Position = PrimaryPart.Position
    local Magnitude = (p1 - Position).Magnitude
    local v2 = {"Head", "UpperTorso", "Torso"}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = p2:FindFirstChild(j)
        if v1 and v1:IsA("BasePart") then
            Magnitude_2 = (p1 - v1.Position).Magnitude
            if Magnitude_2 < Magnitude then
                Magnitude = Magnitude_2
                Position = v1.Position
            end
        end
    end
    return Position
end
local function flatXZUnit(p1) -- Line: 221
    local v1 = Vector3.new(p1.X, 0, p1.Z)
    if v1.Magnitude < 0.0001 then
        return nil
    end
    return v1.Unit
end
local function getDestructibleFilterInstances() -- Line: 764 -- upvalues: CollectionService (val), u234 (val)
    local Attribute
    local u0 = {}
    local u1 = {}
    local function addModel(p1) -- Line: 768 -- upvalues: u1 (val), u0 (val)
        if u1[p1] then
            return
        end
        u1[p1] = true
        table.insert(u0, p1)
    end
    for i, j in CollectionService:GetTagged("Destructible") do
        if j:IsA("Model") then
            addModel(j)
        end
    end
    for k, n in workspace:GetDescendants() do
        if n:IsA("Model") then
            Attribute = n:GetAttribute("Type")
            if typeof(Attribute) == "string" and u234[Attribute] then
                addModel(n)
            end
        end
    end
    return u0
end
local function getDestructibleRootFromPart(p1) -- Line: 802 -- upvalues: CollectionService (val), u234 (val)
    local Attribute
    local Parent = p1
    while Parent do
        if Parent:IsA("Model") then
            if CollectionService:HasTag(Parent, "Destructible") then
                return Parent
            end
            Attribute = Parent:GetAttribute("Type")
            if typeof(Attribute) == "string" and u234[Attribute] then
                return Parent
            end
        end
        Parent = Parent.Parent
    end
    return nil
end
return {
    createLimbHitbox = function(p1, p2) -- Line: 419 -- upvalues: Signal (val), u235 (val), getJointPadding (val), Players (val), u244 (val), ClientGearHandler (val), RunService (val), Workspace (val), ClientAttributesHandler (val), Signals (val), ClientStatusHandler (val), Sounds (val), Titans (val), CharacterRagdollHandler (val), Shake (val)
        local Character, Part, WeldConstraint, client, collisionGroup, destroy, u190, u217, v1, v2, v3, v4, v5, v6, v7, v8
        debug.profilebegin("HitboxTitanClient.createLimbHitbox")
        local u206 = Signal.new()
        local u213 = {}
        local u219 = {}
        local u10 = 0
        if p2.side ~= "Both" then
            v8 = {p2.side}
        else
            v8 = {"Left", "Right"}
        end
        local u193 = os.clock()
        local v9 = v8
        local v10 = nil
        local v11 = nil
        u190, u217 = p2, p1
        for i, j in v9, v10, v11 do
            v2 = u235[u190.limb]
            v3 = nil
            v4 = nil
            for k, n in v2, v3, v4 do
                client = u217.model.client
                v5 = client:FindFirstChild(j .. n)
                if v5 then
                    local priority = u190.priority
                    if priority then
                        priority = string.find(v5.Name, u190.priority)
                    end
                    v6 = v5
                    if not u190.padding then
                        v7 = nil
                    else
                        v7 = getJointPadding(u190.padding, n)
                    end
                    if v7 then
                        Part = Instance.new("Part")
                        Part.Name = ("%*%*Hitbox"):format(j, n)
                        Part.Size = v5.Size + v7
                        Part.CFrame = v5.CFrame
                        Part.Transparency = 1
                        Part.Color = Color3.fromRGB(255, 0, 0)
                        Part.CanCollide = true
                        Part.CanQuery = false
                        Part.CanTouch = true
                        Part.Massless = true
                        Part.Anchored = false
                        collisionGroup = u190.collisionGroup
                        if not collisionGroup then
                            collisionGroup = v5.CollisionGroup
                        end
                        Part.CollisionGroup = collisionGroup
                        Part.Parent = client
                        WeldConstraint = Instance.new("WeldConstraint")
                        WeldConstraint.Part0 = Part
                        WeldConstraint.Part1 = v5
                        WeldConstraint.Parent = Part
                        table.insert(u219, Part)
                        v6 = Part
                    end
                    u213[j .. n] = v6.Touched:Connect(function(p1) -- Line: 474 -- upvalues: Players (upval), u244 (upval), u190 (val), u193 (val), u10 (ref), priority (val), u206 (ref), n (val), j (val)
                        local v1
                        if p1.Parent ~= Players.LocalPlayer.Character or not (table.find(u244, p1.Name)) then
                            return
                        end
                        if not u190.delayed then
                            if u190.debounce then
                                v1 = os.clock() - u10
                                if v1 >= u190.debounce then
                                    u10 = os.clock()
                                    u206:Fire(n, j)
                                    return
                                end
                                if not priority then
                                    return
                                end
                                u10 = os.clock()
                                u206:Fire(n, j)
                                return
                            end
                            u10 = os.clock()
                            u206:Fire(n, j)
                            return
                        end
                        v1 = os.clock() - u193
                        if v1 < u190.delayed then
                            return
                        end
                        if not u190.debounce then
                            u10 = os.clock()
                            u206:Fire(n, j)
                            return
                        end
                        v1 = os.clock() - u10
                        if v1 >= u190.debounce then
                            u10 = os.clock()
                            u206:Fire(n, j)
                            return
                        end
                        if not priority then
                            return
                        end
                        u10 = os.clock()
                        u206:Fire(n, j)
                    end)
                end
            end
        end
        Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        local u37 = ClientGearHandler.getGearState()
        if u190.wires and u37 and PrimaryPart then
            local u43 = RaycastParams.new()
            u43.FilterType = Enum.RaycastFilterType.Include
            u43.FilterDescendantsInstances = {u217.model.client}
            u43.CollisionGroup = u190.collisionGroup or "Titans"
            destroy = 0
            local u53 = nil
            u53 = RunService.RenderStepped:Connect(function() -- Line: 512 -- upvalues: u190 (val), u193 (val), u37 (val), u217 (val), PrimaryPart (val), Workspace (upval), u43 (val), ClientAttributesHandler (upval), destroy (ref), Signals (upval), u53 (ref), ClientStatusHandler (upval), Sounds (upval), Titans (upval), CharacterRagdollHandler (upval), Shake (upval)
                if not u190.delayed then
                    local GearGrappleSwatResistanceMultiplier, Instance, attachment, playGlobalSoundEffect_2, v1, v2, v3, v4, v5, v6, v7, v8
                    for k, v in pairs(u37.grapples) do
                        if v.hit and v.hit:IsDescendantOf(u217.model.client) and v.active then
                            attachment = v.attachment
                            v2 = (attachment.WorldPosition - PrimaryPart.Position).Unit * (attachment.WorldPosition - PrimaryPart.Position).Magnitude * 2
                            v8 = Workspace:Raycast(PrimaryPart.Position, v2, u43)
                            if not v8 then
                                return
                            end
                            Instance = v8.Instance
                            if not Instance then
                                v1 = string.match(Instance.Name, "Arm")
                            else
                                v1 = string.match(Instance.Name, "Hand")
                            end
                            if not v1 then
                                return
                            end
                            if u190.side ~= "Both" then
                                v2 = Instance
                                if v2 then
                                    v2 = string.find(Instance.Name, u190.side)
                                end
                            else
                                v2 = Instance
                                if v2 then
                                    v2 = string.find(Instance.Name, "Left")
                                    if not v2 then
                                        v2 = string.find(Instance.Name, "Right")
                                    end
                                end
                            end
                            if not v2 then
                                return
                            end
                            GearGrappleSwatResistanceMultiplier = ClientAttributesHandler.getAttribute("GearGrappleSwatResistanceMultiplier")
                            v3 = math.max(GearGrappleSwatResistanceMultiplier, 0.001)
                            destroy = destroy + 1
                            if destroy < (u190.wires.threshold or 20) * GearGrappleSwatResistanceMultiplier or 0.05 / v3 <= math.random() then
                                return
                            end
                            v4 = math.max(GearGrappleSwatResistanceMultiplier - 1, 0)
                            if 0 < v4 and math.random() < v4 then
                                return
                            end
                            v5 = ClientAttributesHandler.getAttribute("HasDeepHooks") == 1
                            if v5 and math.random() <= 0.1 then
                                Signals.Monologue:Fire("Whew, that was close.")
                                u53:Disconnect()
                                return
                            end
                            PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, -1, 0) * 200
                            u53:Disconnect()
                            if u190.wires.concuss then
                                ClientStatusHandler.addPlayerStatus("Concussed", (1 - (GearGrappleSwatResistanceMultiplier - 1)) * 1)
                            end
                            Sounds.playGlobalSoundEffect(Titans.GrappleHasBeenShaken, 0.3, 0.5, 2, NumberRange.new(0.8, 1))
                            playGlobalSoundEffect_2 = Sounds.playGlobalSoundEffect
                            v7 = NumberRange.new(0.8, 1)
                            playGlobalSoundEffect_2(Titans.MetalHitReverb, 0.3, 0.1, 2, v7, 0.5)
                            v6 = {"My grapple has been hit, damn.", "My grapples were shaken, damn it."}
                            Signals.Monologue:Fire(v6)
                            if u190.wires.ungrapple then
                                u37.signals.ungrapple:Fire("Left")
                                u37.signals.ungrapple:Fire("Right")
                            end
                            if u190.wires.ragdoll then
                                CharacterRagdollHandler.ragdoll(1, "titan")
                            end
                            local CurrentCamera = Workspace.CurrentCamera
                            if u190.wires.shake then
                                v6 = Shake.new()
                                v6.FadeInTime = 0.3
                                v6.FadeOutTime = 0.3
                                v6.Frequency = 0.1
                                v6.Amplitude = 3
                                v6.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
                                v6:Start()
                                v6:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 627 -- upvalues: CurrentCamera (val)
                                    local v1 = CurrentCamera
                                    local v2 = CFrame.new(p1)
                                    v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
                                end)
                            end
                            u53:Disconnect()
                        end
                    end
                    return
                else
                    local v9 = os.clock() - u193
                    if v9 < u190.delayed then
                        return
                    end
                end
            end)
            table.insert(u213, u53)
        end
        v1 = {touched = u206}
        function destroy() -- Line: 641 -- upvalues: u206 (ref), u213 (ref), u219 (val)
            if not u206 then
                if u206 then
                    u206:DisconnectAll()
                end
            elseif u206.Destroy then
                u206:Destroy()
            end
            u206 = nil
            local v1 = u213
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j:Disconnect()
            end
            u213 = {}
            v1 = u219
            v2 = nil
            v3 = nil
            for k, n in v1, v2, v3 do
                n:Destroy()
            end
            table.clear(u219)
        end
        v1.destroy = destroy
        debug.profileend()
        return v1
    end,
    onKnockbackFromLimb = function(p1, p2, p3, p4, p5) -- Line: 132 -- upvalues: Players (val), CharacterRagdollHandler (val), ClientGearHandler (val)
        debug.profilebegin("HitboxTitanClient.onKnockbackFromLimb")
        local v1 = p1.model.client:FindFirstChild(p3 .. p2)
        if not v1 then
            debug.profileend()
            return
        end
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        if not PrimaryPart then
            debug.profileend()
            return
        end
        CharacterRagdollHandler.ragdoll(1 * (p4 or 1), "titan")
        local v2 = ClientGearHandler.getGearState()
        if v2 then
            v2.signals.ungrapple:Fire("Left")
            v2.signals.ungrapple:Fire("Right")
        end
        if not p5 then
            PrimaryPart.AssemblyLinearVelocity = (v1.Position - PrimaryPart.Position).Unit * Vector3.new(0.8, 0, 0.8) * 500 + Vector3.new(0, -500, 0)
        else
            p5(PrimaryPart, v1)
        end
        debug.profileend()
    end,
    createMouthHitbox = function(p1, p2) -- Line: 235 -- upvalues: Signal (val), RunService (val), Players (val), getMouthToCharacterDistance (val), getClosestCharacterTargetPosition (val), flatXZUnit (val), CharacterRagdollHandler (val), Signals (val), ClientGearHandler (val), ClientStatusHandler (val)
        local Position, v1, v2
        debug.profilebegin("HitboxTitanClient.createMouthHitbox")
        local u7 = Signal.new()
        local u8 = {}
        local client = p1.model.client
        local Mouth = client:FindFirstChild("Mouth")
        local u16 = p2.debugLabel or "MouthHitbox"
        local u19 = p2.debug == true
        local historyRecorder = p2.historyRecorder
        local u22 = 0
        local function mouthDebugPrint(p1) -- Line: 247 -- upvalues: historyRecorder (val), u19 (val), u16 (val)
            if historyRecorder then
                historyRecorder(p1)
                return
            end
            if not u19 then
                return
            end
            print((("[Mouth] [%*] %*"):format(u16, p1)))
        end
        if u19 and not historyRecorder then
            if not Mouth then
                local id_2 = p1.id
                mouthDebugPrint((("created but Mouth part missing on titanId=%*"):format(id_2)))
            else
                local id = p1.id
                local scale = p1.scale
                v2 = p2.distance or 1
                local v3 = p2.delayed or 0
                local v4 = p2.debounce or 0
                Position = Mouth.Position
                mouthDebugPrint((("created titanId=%* scale=%* distance=%* delayed=%* debounce=%* mouthPos=%*"):format(id, scale, v2, v3, v4, Position)))
            end
        end
        local u50 = 0
        local u51 = nil
        local u52 = 0
        u51 = RunService.RenderStepped:Connect(function(a1) -- Line: 273 -- upvalues: u52 (ref), p2 (val), u19 (val), historyRecorder (val), u22 (ref), mouthDebugPrint (val), Players (upval), Mouth (val), p1 (val), getMouthToCharacterDistance (upval), client (val), getClosestCharacterTargetPosition (upval), flatXZUnit (upval), u50 (ref), u7 (ref), u51 (ref), CharacterRagdollHandler (upval), Signals (upval), ClientGearHandler (upval), ClientStatusHandler (upval)
            local v1
            u52 = u52 + a1
            if not p2.delayed then
                local Character = Players.LocalPlayer.Character
                local PrimaryPart = Character
                if PrimaryPart then
                    PrimaryPart = Character.PrimaryPart
                end
                if not PrimaryPart then
                    return
                else
                    local v2, v3, v4
                    if not Mouth then
                        return
                    end
                    local v5 = (p2.distance or 1) * p1.scale
                    v1 = getMouthToCharacterDistance(Mouth.Position, Character, p2.useClosestBodyPart)
                    local v6 = v1 < v5
                    local v7 = nil
                    if v6 and p2.requireFacingDot then
                        local Head
                        v3 = Mouth
                        if p2.facingFrom == "Head" then
                            Head = client:FindFirstChild("Head")
                            if Head and Head:IsA("BasePart") then
                                v3 = Head
                            end
                        end
                        v4 = getClosestCharacterTargetPosition(Mouth.Position, Character, p2.useClosestBodyPart)
                        local v8 = v4 - v3.Position
                        local Magnitude = v8.Magnitude
                        if 0.5 < Magnitude then
                            if p2.facingPlane ~= "horizontal" then
                                v7 = v3.CFrame.LookVector:Dot(v8 / Magnitude)
                            else
                                v2 = flatXZUnit(v3.CFrame.LookVector)
                                local v9 = flatXZUnit(v8)
                                if v2 and v9 then
                                    v7 = v2:Dot(v9)
                                end
                            end
                            if v7 then
                                v6 = p2.requireFacingDot <= v7
                            end
                        end
                    end
                    if u19 then
                        if not historyRecorder then
                            v4 = 0.15
                        else
                            v4 = 0.08
                        end
                        if v4 <= os.clock() - u22 then
                            u22 = os.clock()
                            if not v7 then
                                v3 = ""
                            else
                                v3 = string.format(" facingDot=%.2f", v7)
                            end
                            v2 = string.format("%.3f", u52)
                            local v10 = string.format("%.2f", v1)
                            local v11 = string.format("%.2f", v5)
                            local v12 = tostring(v6)
                            mouthDebugPrint((("probe elapsed=%* mouth=%* hrp=%* distance=%* threshold=%* inRange=%*%*"):format(v2, Mouth.Position, PrimaryPart.Position, v10, v11, v12, v3)))
                        end
                    elseif not historyRecorder then
                    end
                    if not v6 then
                        return
                    elseif not p2.debounce then
                        u50 = os.clock()
                        local v13 = string.format("%.2f", v1)
                        v2 = string.format("%.2f", v5)
                        mouthDebugPrint((("HIT distance=%* threshold=%* elapsed=%*"):format(v13, v2, (string.format("%.3f", u52)))))
                        u7:Fire("Mouth")
                        u51:Disconnect()
                        if p2.ragdoll then
                            CharacterRagdollHandler.ragdoll(1, "titan")
                        end
                        if p2.monologue then
                            Signals.Monologue:Fire({
                                "That was way too close...",
                                "Instinct saved me. Not skill, not luck — just the fear of dying.",
                                "The air still reeks of its breath... I can't afford to freeze again.",
                                "If I hesitated, I'd be dead.",
                                "Can't afford to let that happen again.",
                                "One more like that and I'm done for.",
                                "If I hesitate like that again, I'm dead. Simple as that.",
                            })
                        end
                        if p2.indicate then
                            v3 = ClientGearHandler.getGearState()
                            if v3 then
                                v3.signals.ungrapple:Fire("Left")
                                v3.signals.ungrapple:Fire("Right")
                            end
                            PrimaryPart.AssemblyLinearVelocity = (Mouth.Position - PrimaryPart.Position).Unit * 500 + Vector3.new(0, -300, 0)
                            ClientStatusHandler.addPlayerStatus("Concussed", 1)
                        end
                        return
                    else
                        v3 = os.clock() - u50
                        if v3 < p2.debounce then
                            return
                        end
                    end
                end
            elseif u52 < p2.delayed then
                if u19 then
                    local v14
                    if not historyRecorder then
                        v14 = 0.15
                    else
                        v14 = 0.08
                    end
                    if v14 <= os.clock() - u22 then
                        u22 = os.clock()
                        v1 = string.format("%.3f", u52)
                        mouthDebugPrint((("waiting for delay elapsed=%*/%*"):format(v1, p2.delayed)))
                    end
                elseif not historyRecorder then
                end
                return
            end
        end)
        table.insert(u8, u51)
        v1 = {
            touched = u7,
            destroy = function() -- Line: 388 -- upvalues: mouthDebugPrint (val), u52 (ref), u7 (ref), u8 (ref)
                mouthDebugPrint((("destroyed elapsed=%*"):format((string.format("%.3f", u52)))))
                if not u7 then
                    if u7 then
                        u7:DisconnectAll()
                    end
                elseif u7.Destroy then
                    u7:Destroy()
                end
                u7 = nil
                local v1 = u8
                local v2 = nil
                local v3 = nil
                for i, j in v1, v2, v3 do
                    j:Disconnect()
                end
                u8 = {}
            end,
        }
        debug.profileend()
        return v1
    end,
    onCreateTitanVersusTitanHitox = function(p1, p2) -- Line: 673 -- upvalues: Signal (val), CollectionService (val), Players (val), RunService (val)
        local size
        debug.profilebegin("HitboxTitanClient.onCreateTitanVersusTitanHitox")
        local u7 = Signal.new()
        local u9 = OverlapParams.new()
        u9.FilterType = Enum.RaycastFilterType.Include
        u9.FilterDescendantsInstances = {CollectionService:GetTagged("ServerTitan")}
        if not p2 then
            size = Vector3.new(15, 15, 22.5)
        else
            size = p2.size
            if not size then
                size = Vector3.new(15, 15, 22.5)
            end
        end
        local u23 = nil
        local u24 = {}
        local u40 = RunService.RenderStepped:Connect(function() -- Line: 704 -- upvalues: p1 (val), p2 (val), size (val), u9 (val), u23 (ref), Players (upval), u24 (val), u7 (ref)
            local Parent, offset
            local CFrame = p1.CFrame
            if not p2 then
                offset = CFrame.new(0, 0, -size.Z / 2)
            else
                offset = p2.offset
            end
            local PartBoundsInBox = workspace:GetPartBoundsInBox(CFrame * offset, size, u9)
            if u23 then
                u23.CFrame = CFrame * offset
            end
            local v1 = PartBoundsInBox
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                Parent = j.Parent
                if Parent and Parent ~= Players.LocalPlayer.Character then
                    if not Parent then
                        table.insert(u24, Parent)
                        u7:Fire(Parent)
                    elseif table.find(u24, Parent) then
                    end
                end
            end
        end)
        local v1 = {
            touched = u7,
            destroy = function() -- Line: 749 -- upvalues: u40 (val), u7 (ref)
                u40:Disconnect()
                u7:DisconnectAll()
                u7 = nil
            end,
        }
        debug.profileend()
        return v1
    end,
    onCreateEnvironmentalHitbox = function(p1, p2) -- Line: 828 -- upvalues: getDestructibleFilterInstances (val), getDestructibleRootFromPart (val)
        debug.profilebegin("HitboxTitanClient.onCreateEnvironmentalHitbox")
        local v1 = RaycastParams.new()
        v1.FilterType = Enum.RaycastFilterType.Include
        v1.FilterDescendantsInstances = getDestructibleFilterInstances()
        local Parent = p1.Parent
        if Parent then
            Parent = p1.Parent:FindFirstChild("UpperTorso")
        end
        if not Parent then
            debug.profileend()
            return false
        end
        local v2 = p2
        if not v2 then
            v2 = Parent.CFrame.LookVector * 100
        end
        local v3 = workspace:Spherecast(Parent.Position, 40, v2, v1)
        if not v3 or not v3.Instance or not (v3.Instance:IsA("BasePart")) then
            debug.profileend()
            return false
        end
        local v4 = getDestructibleRootFromPart(v3.Instance)
        if not v4 then
            debug.profileend()
            return false
        end
        debug.profileend()
        return true, v4, v3.Position
    end,
}