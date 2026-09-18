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
--     File: ReplicatedStorage.Common.Effects.Types.Tools.MarleyWeaponry.BulletEject
--                              Dumped in 0.000360 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Bullet = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Bullet")
return function(p1, p2) -- Line: 34 -- upvalues: Bullet (val), Workspace (val)
    local u5 = Bullet:Clone()
    u5.Parent = Workspace
    u5:FindFirstChild("Bullet Tip"):Destroy()
    local Boolet = u5:FindFirstChild("Boolet")
    Boolet.CFrame = CFrame.new(p2.position)
    Boolet.Anchored = false
    Boolet.AssemblyLinearVelocity = -(p2.direction.Unit + Vector3.new(0, -3, 0)) * p2.speed
    task.delay(1.5, function() -- Line: 50 -- upvalues: u5 (val)
        u5:Destroy()
    end)
end