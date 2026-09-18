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
--   File: ReplicatedStorage.Client.Progression.Shifter.Types.Helldiver Abnormal.Roar
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local Debris = require(Universal:WaitForChild("ClientShifterEffectHandler")).Debris
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Titans = require(Sounds_2:WaitForChild("Titans"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Effects = Common_7:WaitForChild("Effects")
local Types_2 = Effects:WaitForChild("Types")
local Titans_2 = Types_2:WaitForChild("Titans")
local Roar = require(Titans_2:WaitForChild("Roar"))
local u227 = false
local function onAbilityReplicated(p1) -- Line: 45 -- upvalues: Sounds (val), Titans (val), Roar (val), Players (val), Character (val), ClientGearHandler (val), CharacterRagdollHandler (val), Workspace (val), Shake (val)
    Sounds.playFalloffSoundEffect(Titans.HelldiverRoar, p1.root, 3000, 10, {min = 0.8, max = 1.2})
    task.delay(0.4, function() -- Line: 50 -- upvalues: Roar (upval), p1 (val)
        Roar(p1.model)
    end)
    if p1.owner == Players.LocalPlayer.UserId then
        return false
    end
    local model = p1.model
    if model then
        model = p1.model:FindFirstChild("HumanoidRootPart")
    end
    if not model then
        return false
    end
    local Character_2 = Players.LocalPlayer.Character
    local HumanoidRootPart = Character_2
    if HumanoidRootPart then
        HumanoidRootPart = Character_2:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return false
    end
    local v1 = Character.getDistance(model.Position)
    if not v1 or 800 < v1 then
        return false
    end
    local v2 = ClientGearHandler.getGearState()
    if v2 then
        v2.signals.ungrapple:Fire("Left")
        v2.signals.ungrapple:Fire("Right")
    end
    CharacterRagdollHandler.ragdoll(1)
    HumanoidRootPart.AssemblyLinearVelocity = (HumanoidRootPart.CFrame.Position - model.Position).Unit * 500 + Vector3.new(0, 300, 0)
    local CurrentCamera = Workspace.CurrentCamera
    local v3 = Shake.new()
    v3.FadeInTime = 0.3
    v3.FadeOutTime = 0.3
    v3.Frequency = 0.1
    v3.Amplitude = 3
    v3.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
    v3:Start()
    v3:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 107 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    return false
end
return {
    onAbilityRequested = function(p1, ...) -- Line: 119 -- upvalues: useWalkSpeed (val), Debris (val), u227 (ref), onAbilityReplicated (val)
        local v1
        _, v1 = useWalkSpeed()
        local u12 = v1("Roar", 0, "set", 20, TweenInfo.new(0.3))
        task.delay(1, function() -- Line: 123 -- upvalues: p1 (val), Debris (upval)
            local model = p1.model
            if model then
                model = p1.model:FindFirstChild("HumanoidRootPart")
            end
            if not model then
                return
            end
            Debris.circle(model.Position, 20, 5, 30, 0.3, {p1.model}, true)
        end)
        local u31 = nil
        if not u227 then
            local v2
            _, v2 = useWalkSpeed()
            u31 = v2("Roar", 0, "add", 35, TweenInfo.new(0.3))
            u227 = true
        end
        if u31 then
            task.delay(300, function() -- Line: 142 -- upvalues: u31 (ref), u227 (upval)
                u31(TweenInfo.new(1))
                u227 = false
            end)
        end
        onAbilityReplicated(p1)
        task.delay(2.16, function() -- Line: 150 -- upvalues: u12 (val)
            u12(TweenInfo.new(1))
        end)
    end,
    onAbilityReplicated = onAbilityReplicated,
}