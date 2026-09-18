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
--                File: ReplicatedStorage.Client.World.Development.Fling
--                              Dumped in 0.000262 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local function onFlingObjectAdded(p1) -- Line: 11 -- upvalues: Players (val)
    p1.Touched:Connect(function(p1) -- Line: 12 -- upvalues: Players (upval)
        if not (p1:IsDescendantOf(Players.LocalPlayer.Character)) then
            return
        end
        p1.AssemblyLinearVelocity = Vector3.new(0, 15000, 15000)
    end)
end
local Tagged = CollectionService:GetTagged("Fling")
for i, v in ipairs(Tagged) do
    onFlingObjectAdded(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Fling")
InstanceAddedSignal:Connect(function(...) -- Line: 26 -- upvalues: onFlingObjectAdded (val)
    onFlingObjectAdded(...)
end)
return {}