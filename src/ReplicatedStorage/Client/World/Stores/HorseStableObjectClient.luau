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
--          File: ReplicatedStorage.Client.World.Stores.HorseStableObjectClient
--                              Dumped in 0.000298 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Characters = require(Animations:WaitForChild("Characters"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local function onHorseStableInitialized(p1) -- Line: 30 -- upvalues: ReplicatedStorage (val), useAnimatorObserver (val), Characters (val)
    local v1 = ReplicatedStorage.Assets.Characters.Stablemen:Clone()
    local Spawn = p1:WaitForChild("Spawn")
    v1.PrimaryPart.Anchored = true
    v1:PivotTo(Spawn.CFrame)
    v1.Parent = p1
    Spawn:AddTag("Interaction")
    Spawn:SetAttribute("Type", "Stablemen")
    useAnimatorObserver.playAnimationOnRig(v1, Characters.Stablemen)
end
for k, v in pairs(CollectionService:GetTagged("Stable")) do
    onHorseStableInitialized(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Stable")
InstanceAddedSignal:Connect(onHorseStableInitialized)
return {}