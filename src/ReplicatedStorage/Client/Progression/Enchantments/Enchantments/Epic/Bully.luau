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
--    File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.Bully
--                               Dumped in 0.00106 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Config = require(Common_5:WaitForChild("Config"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u160 = Config.define({MAX_DISTANCE = 8, SHOVE_HITBOX_SIZE = Vector3.new(7, 5, 8)})
local v2 = {description = "Shove the nearest person near you. The harder you push depends on your strength compared to theirs.", passive = false, upgradable = false}
local v3 = {
    enchantments = {},
    sacraments = {Strength = 2},
    proficiency = {tree = "Skills", node = "Tackle"},
}
v2.prerequisites = v3
local function getPlayerFromPart(p1) -- Line: 58 -- upvalues: Alive (val)
    local v1
    local Parent = p1
    while Parent do
        if Parent:IsA("Model") then
            if Parent:HasTag("Shifter") then
                return nil
            end
            v1 = Alive.getPlayerFromCharacter(Parent)
            if v1 then
                return v1
            end
        end
        Parent = Parent.Parent
    end
    return nil
end
local function findClosestTarget(p1) -- Line: 82 -- upvalues: u160 (val), Alive (val), Players (val)
    local HumanoidRootPart, Magnitude, v1
    local v2 = nil
    local MAX_DISTANCE = u160.MAX_DISTANCE
    for i, j in Alive.getPlayers() do
        if j ~= Players.LocalPlayer then
            v1 = Alive.getAliveCharacter(j)
            if v1 and not (v1:HasTag("Shifter")) then
                HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    Magnitude = (HumanoidRootPart.Position - p1).Magnitude
                    if u160.MAX_DISTANCE >= Magnitude and Magnitude < MAX_DISTANCE then
                        MAX_DISTANCE = Magnitude
                        v2 = j
                    end
                end
            end
        end
    end
    return v2
end
local function findTargetsInHitbox(p1, p2) -- Line: 121 -- upvalues: u160 (val), getPlayerFromPart (val), Players (val)
    local v1
    local v2 = OverlapParams.new()
    v2.FilterType = Enum.RaycastFilterType.Exclude
    v2.FilterDescendantsInstances = {p1}
    local SHOVE_HITBOX_SIZE = u160.SHOVE_HITBOX_SIZE
    local v3 = CFrame.new(0, 0, -SHOVE_HITBOX_SIZE.Z / 2)
    local PartBoundsInBox = workspace:GetPartBoundsInBox(p2.CFrame * v3, SHOVE_HITBOX_SIZE, v2)
    local v4 = {}
    local v5 = {}
    local v6 = PartBoundsInBox
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        if j:IsA("BasePart") then
            v1 = getPlayerFromPart(j)
            if v1 and v1 ~= Players.LocalPlayer and not (v5[v1]) then
                v5[v1] = true
                table.insert(v4, v1)
            end
        end
    end
    return v4
end
return {
    unlocked = function(p1, p2, p3, p4, p5) -- Line: 227 -- upvalues: useAnimatorObserver (val), Enchantments (val)
        useAnimatorObserver.preload({Enchantments.Bully})
    end,
    verify = function() -- Line: 151 -- upvalues: ClientStateHandler (val), States (val), Signals (val), Character (val), ClientAttributesHandler (val), findTargetsInHitbox (val), findClosestTarget (val)
        if ClientStateHandler.isStateBusy(States.TOOL) then
            Signals.Toast:Fire({message = "You cannot bully while holding a tool.", type = "error"})
            return false
        end
        local v1 = Character.getCharacter()
        if not v1 then
            return false
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return false
        end
        local v2 = ClientAttributesHandler.getAttribute("HasAntagonist") == 1
        if v2 then
            if #findTargetsInHitbox(v1, HumanoidRootPart) ~= 0 then
                return true
            end
            Signals.Toast:Fire({message = "There is no one in front of you to shove.", type = "error"})
            return false
        end
        if findClosestTarget(HumanoidRootPart.Position) then
            return true
        end
        Signals.Toast:Fire({message = "There is no one near you to shove.", type = "error"})
        return false
    end,
    activated = function(p1) -- Line: 196 -- upvalues: Character (val), useAnimatorObserver (val), Enchantments (val), ClientAttributesHandler (val), findTargetsInHitbox (val), findClosestTarget (val)
        local v1
        local v2 = Character.getCharacter()
        if not v2 then
            return
        end
        local HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        useAnimatorObserver.play(Enchantments.Bully, 0.1)
        local v3 = ClientAttributesHandler.getAttribute("HasAntagonist") == 1
        if v3 then
            v1 = findTargetsInHitbox(v2, HumanoidRootPart)
            if 0 < #v1 then
                p1(v1)
            end
            return
        end
        v1 = findClosestTarget(HumanoidRootPart.Position)
        if v1 then
            p1(v1)
        end
    end,
    settings = v2,
}