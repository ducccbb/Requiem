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
--            File: ReplicatedStorage.Common.Effects.Types.Gear.GearExplosion
--                              Dumped in 0.000732 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local GearExplosion = Objects:WaitForChild("GearExplosion")
return function() -- Line: 28 -- upvalues: Character (val), GearExplosion (val), Signals (val)
    local v1, v2, v3, v4
    local v5 = Character.getCharacter()
    if not v5 then
        return
    end
    local u6 = GearExplosion:Clone()
    u6.Parent = v5
    for i, j in u6.Explosions:GetChildren() do
        v3 = math.random(-100, 100)
        v4 = math.random(80, 120)
        j.AssemblyLinearVelocity = Vector3.new(v3, v4, math.random(-100, 100)).Unit * math.random(7, 12)
        v1 = math.random(-100, 100)
        v2 = math.random(-100, 100)
        j.AssemblyAngularVelocity = Vector3.new(v1, v2, math.random(-100, 100))
    end
    Signals.Monologue:Fire("That's the last of my gear, it's gone... I'm done for.")
    task.delay(5, function() -- Line: 48 -- upvalues: u6 (val)
        for i, j in u6:GetDescendants() do
            if j:IsA("BasePart") then
                j.Anchored = true
            end
        end
    end)
    task.delay(20, function() -- Line: 58 -- upvalues: u6 (val)
        u6:Destroy()
    end)
    u6:PivotTo(v5.HumanoidRootPart.CFrame)
end