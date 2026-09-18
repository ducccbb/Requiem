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
--              File: ReplicatedStorage.Client.World.Training.RunningClient
--                              Dumped in 0.000629 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local u83 = false
local function onRunningTrackInitialized(p1) -- Line: 19 -- upvalues: u83 (ref), Players (val), Sounds (val), Universal (val), Player (val)
    local v1 = p1:WaitForChild("1")
    for i, j in p1:GetDescendants() do
        if j:IsA("Beam") then
            j.Enabled = false
        end
    end
    local u17 = nil
    local u22 = #p1:GetChildren()
    v1.Touched:Connect(function(a1) -- Line: 35 -- upvalues: u83 (upval), Players (upval), u22 (val), Sounds (upval), Universal (upval), u17 (ref), Player (upval), p1 (val)
        if u83 then
            return
        end
        local Character = Players.LocalPlayer.Character
        if not (a1:IsDescendantOf(Character)) then
            return
        end
        u83 = true
        local u12 = 1 / u22
        Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 2, 2, NumberRange.new(u12 / 2 + 0.4))
        local function onTrackCompleted() -- Line: 49 -- upvalues: u83 (upval), u17 (upval), Player (upval)
            u83 = false
            if u17 then
                u17.Enabled = false
            end
            Player.Track.post()
        end
        local function onTrackPartTouched(a1) -- Line: 62 -- upvalues: u12 (ref), u22 (upval), Sounds (upval), Universal (upval), p1 (upval), onTrackCompleted (val), u17 (upval), Players (upval), onTrackPartTouched (val)
            u12 = a1 / u22
            Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 2, 2, NumberRange.new(u12 / 2 + 0.4))
            local v1 = p1:FindFirstChild((tostring(a1)))
            if not v1 then
                onTrackCompleted()
                return
            end
            if u17 then
                u17.Enabled = false
            end
            u17 = v1:FindFirstChild("Beam")
            if u17 then
                u17.Enabled = true
            end
            local u36 = nil
        end
        onTrackPartTouched(1 + 1)
    end)
end
for k, v in pairs(CollectionService:GetTagged("Track")) do
    onRunningTrackInitialized(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Track")
InstanceAddedSignal:Connect(onRunningTrackInitialized)
return {}