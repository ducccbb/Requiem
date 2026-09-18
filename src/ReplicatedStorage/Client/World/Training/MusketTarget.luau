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
--              File: ReplicatedStorage.Client.World.Training.MusketTarget
--                              Dumped in 0.000250 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local function onTargetInitialized(p1) -- Line: 24 -- upvalues: TweenService (val)
    local CFrame = p1.End.CFrame
    p1.Target.CFrame = p1.Start.CFrame
    local v1 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    TweenService:Create(p1.Target, v1, {CFrame = CFrame}):Play()
end
for k, v in pairs(CollectionService:GetTagged("Target")) do
    onTargetInitialized(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Target")
InstanceAddedSignal:Connect(onTargetInitialized)
return {}