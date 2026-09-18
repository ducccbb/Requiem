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
--File: ReplicatedStorage.Client.Entities.Animals.Types.Wolf.Actions.Combat.CombatLungeAttack
--                              Dumped in 0.000657 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
require(Animals:WaitForChild("Actions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types_2 = Common_2:WaitForChild("Types")
local Animals_2 = Types_2:WaitForChild("Animals")
require(Animals_2:WaitForChild("Animal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
return {
    priority = 2,
    attempt = function(p1) -- Line: 92 -- upvalues: Character (val)
        local v1
        if not p1.__internal.lastLungeAttackTime then
            v1 = Character.getCharacter()
            if v1 then
                if Character.isRagdolled() or (p1.root.Position - v1:GetPivot().Position).Magnitude >= 30 then
                    return false
                end
                p1.__internal.lastLungeAttackTime = tick()
                return true
            end
            return false
        end
        v1 = tick() - p1.__internal.lastLungeAttackTime
        if v1 < 3 then
            return false
        end
        v1 = Character.getCharacter()
        if not v1 or Character.isRagdolled() or (p1.root.Position - v1:GetPivot().Position).Magnitude >= 30 then
            return false
        end
        p1.__internal.lastLungeAttackTime = tick()
        return true
    end,
    execute = function(p1, p2, p3, p4) -- Line: 30 -- upvalues: Character (val), RunService (val)
        if p1.throttle then
            p1.throttle(0.5)
        end
        local __internal = p1.__internal
        __internal.lastLungeAttackTime = tick()
        local v1 = Character.getCharacter()
        local HumanoidRootPart = v1
        if HumanoidRootPart then
            HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        local Magnitude = (p1.root.Position - HumanoidRootPart.Position).Magnitude
        if 50 < Magnitude then
            return
        end
        local u28 = nil
        local u29 = 0
        u28 = RunService.RenderStepped:Connect(function(a1) -- Line: 55 -- upvalues: u29 (ref), p1 (val), Magnitude (ref), HumanoidRootPart (val), p3 (val), u28 (ref)
            u29 = u29 + a1
            if u29 < 0.1 then
                return
            end
            Magnitude = ((p1.root.CFrame * CFrame.new(0, 0, -5)).Position - HumanoidRootPart.Position).Magnitude
            if Magnitude < 14 then
                p3()
                u28:Disconnect()
                return
            end
            if 0.3 >= u29 then
                return
            end
            u28:Disconnect()
        end)
        p2:Add(function() -- Line: 82 -- upvalues: u28 (ref)
            u28:Disconnect()
        end)
    end,
}