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
--File: ReplicatedStorage.Client.Entities.Animals.Types.Bear.Actions.Universal.DefaultMaulAttack
--                              Dumped in 0.000720 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
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
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character_2 = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
return {
    priority = 2,
    attempt = function(p1) -- Line: 80 -- upvalues: Character (val)
        if p1.__internal.dead or p1.inactive then
            return false
        end
        local v1 = p1.root.CFrame * CFrame.new(0, 0, -8)
        local v2 = Character.getDistance(v1.Position)
        if 40 < v2 then
            return false
        end
        local v3 = Character.getCharacter()
        if not v3 then
            return false
        end
        local HumanoidRootPart = v3:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return false
        end
        local v4 = HumanoidRootPart.Position + HumanoidRootPart.AssemblyLinearVelocity / 2
        if (v4 - v1.Position).Magnitude < 15 or v2 < 8 then
            return true
        end
        return false
    end,
    execute = function(p1, p2, p3, p4) -- Line: 34 -- upvalues: Character (val), CharacterRagdollHandler (val), ClientStatusHandler (val)
        if p1.throttle then
            p1.throttle(2)
        end
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        task.delay(0.6, function() -- Line: 51 -- upvalues: p1 (val), HumanoidRootPart (val), CharacterRagdollHandler (upval), ClientStatusHandler (upval), p3 (val)
            if p1.__internal.dead or p1.inactive then
                return
            end
            local v1 = p1.root.CFrame * CFrame.new(0, 0, -8)
            if (HumanoidRootPart.Position - v1.Position).Magnitude >= 12 then
                return
            end
            CharacterRagdollHandler.ragdoll(1.8)
            ClientStatusHandler.addPlayerStatus("Concussed", 1)
            local v2 = (HumanoidRootPart.Position - p1.root.Position).Unit * Vector3.new(1, 0, 1)
            HumanoidRootPart.AssemblyLinearVelocity = (v2 + Vector3.new(0, 0.3, 0)) * 70
            p3()
        end)
    end,
}