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
--       File: ReplicatedStorage.Client.Entities.Titans.Utilities.GrabTitanClient
--                              Dumped in 0.000718 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local LocalPlayer = Players.LocalPlayer
local u83 = {}
return {
    onClientGrabbed = function(p1) -- Line: 59 -- upvalues: LocalPlayer (val), u83 (val), ClientGearHandler (val)
        debug.profilebegin("GrabTitanClient.onClientGrabbed")
        local Character = LocalPlayer.Character
        if not Character then
            debug.profileend()
            return
        end
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not Humanoid then
            debug.profileend()
            return
        end
        for i, j in p1.model.client:GetDescendants() do
            if j:IsA("BasePart") then
                if not (u83[j]) then
                    u83[j] = j.CanCollide
                end
                j.CanCollide = false
            end
        end
        local v1 = ClientGearHandler.getGearState()
        if v1 and v1.enabled then
            v1.signals.ungrapple:Fire("Left")
            v1.signals.ungrapple:Fire("Right")
            v1.signals.clearVelocity:Fire()
            v1.addTimeout(0.1)
            v1.signals.clearMomentum:Fire()
        end
        Humanoid.PlatformStand = true
        Humanoid.AutoRotate = false
        debug.profileend()
    end,
    onClientUngrabbed = function(p1) -- Line: 108 -- upvalues: LocalPlayer (val), u83 (val), Character (val)
        debug.profilebegin("GrabTitanClient.onClientUngrabbed")
        local Character_2 = LocalPlayer.Character
        if not Character_2 then
            return
        end
        local Humanoid = Character_2:FindFirstChildOfClass("Humanoid")
        if not Humanoid then
            debug.profileend()
            return
        end
        for i, j in p1.model.client:GetDescendants() do
            if j:IsA("BasePart") and u83[j] then
                j.CanCollide = u83[j]
            end
        end
        if not (Character.isRagdolled()) then
            Humanoid.PlatformStand = false
            Humanoid.AutoRotate = true
        end
        debug.profileend()
    end,
    setTitanCollidable = function(p1, p2) -- Line: 32 -- upvalues: u83 (val)
        debug.profilebegin("GrabTitanClient.setTitanCollidable")
        local v1 = p2
        for i, j in p1.model.client:GetDescendants() do
            if j:IsA("BasePart") then
                if not v1 then
                    if not (u83[j]) then
                        u83[j] = j.CanCollide
                    end
                    j.CanCollide = false
                elseif u83[j] ~= nil then
                    j.CanCollide = u83[j]
                end
            end
        end
        debug.profileend()
    end,
}