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
--  File: ReplicatedStorage.Client.World.Vehicles.Blimps.WorldVehicleBlimpRotorsClient
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local v2 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local World = Common:WaitForChild("World")
local Vehicles = World:WaitForChild("Vehicles")
local BlimpRotors = require(Vehicles:WaitForChild("BlimpRotors"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u80 = v2.new()
local u81 = {}
local u82 = {}
local u83 = {}
local u84 = nil
local function isWorldBlimp(p1) -- Line: 42
    return p1:IsDescendantOf(workspace)
end
local function updateBlimpOctreeNode(p1) -- Line: 51 -- upvalues: u82 (val), u80 (val)
    local v1 = u82[p1.blimp]
    if not v1 then
        return
    end
    local Root = p1.blimp:FindFirstChild("Root")
    if Root then
        u80:ChangeNodePosition(v1, Root.Position)
    end
end
local function onClientRenderStep() -- Line: 67 -- upvalues: Character (val), u80 (val), updateBlimpOctreeNode (val), BlimpRotors (val)
    local Object
    local v1 = Character.getCharacter()
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = u80:SearchRadius(HumanoidRootPart.Position, 8000)
    if #v2 == 0 then
        return
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v3 = v2
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        Object = j.Object
        if Object.blimp.Parent then
            updateBlimpOctreeNode(Object)
            BlimpRotors.applySpin(Object.state, ServerTimeNow)
        end
    end
end
local function stopWatchingBlimp(p1) -- Line: 102 -- upvalues: u83 (val)
    local v1 = u83[p1]
    if v1 then
        v1:Disconnect()
        u83[p1] = nil
    end
end
local function isRelevantRotorDescendant(p1, p2) -- Line: 116
    local Rotors, v1
    if p2.Name ~= "Rotors" then
        Rotors = p1:FindFirstChild("Rotors")
        v1 = if Rotors ~= nil then p2:IsDescendantOf(Rotors) else false
        return v1
    end
    if p2.Parent == p1 then
        return true
    end
    Rotors = p1:FindFirstChild("Rotors")
    v1 = if Rotors ~= nil then p2:IsDescendantOf(Rotors) else false
    return v1
end
local function completeBlimpRotorRegistration(p1, p2) -- Line: 131 -- upvalues: u82 (val), u80 (val), u81 (val), u84 (ref), RunService (val), onClientRenderStep (val)
    local Position
    local v1 = {blimp = p1, state = p2}
    local Root = p1:FindFirstChild("Root")
    if not Root then
        Position = p1:GetPivot().Position
    else
        Position = Root.Position
    end
    u82[p1] = u80:CreateNode(Position, v1)
    u81[p1] = v1
    if not u84 then
        u84 = RunService.RenderStepped:Connect(onClientRenderStep)
    end
end
local function refreshBlimpRotors(p1) -- Line: 152 -- upvalues: isWorldBlimp (val), u81 (val), BlimpRotors (val), completeBlimpRotorRegistration (val)
    if not (isWorldBlimp(p1)) then
        return
    end
    local v1 = u81[p1]
    if v1 then
        BlimpRotors.refreshSpinState(v1.state)
        return
    end
    local v2 = BlimpRotors.createSpinState(p1)
    if not v2 then
        return
    end
    completeBlimpRotorRegistration(p1, v2)
end
local function startWatchingBlimp(p1) -- Line: 176 -- upvalues: u83 (val), stopWatchingBlimp (val), isRelevantRotorDescendant (val), refreshBlimpRotors (val)
    if u83[p1] then
        return
    end
    u83[p1] = p1.DescendantAdded:Connect(function(a1) -- Line: 181 -- upvalues: p1 (val), stopWatchingBlimp (upval), isRelevantRotorDescendant (upval), refreshBlimpRotors (upval)
        if not p1.Parent then
            stopWatchingBlimp(p1)
            return
        end
        if not (isRelevantRotorDescendant(p1, a1)) then
            return
        end
        refreshBlimpRotors(p1)
    end)
end
local function onRegisterBlimpRotors(p1) -- Line: 224 -- upvalues: isWorldBlimp (val), startWatchingBlimp (val), refreshBlimpRotors (val)
    if not (isWorldBlimp(p1)) then
        return
    end
    startWatchingBlimp(p1)
    refreshBlimpRotors(p1)
    task.defer(function() -- Line: 232 -- upvalues: p1 (val), refreshBlimpRotors (upval)
        if p1.Parent then
            refreshBlimpRotors(p1)
        end
    end)
end
for i, j in CollectionService:GetTagged("Blimp") do
    if isWorldBlimp(j) then
        onRegisterBlimpRotors(j)
    end
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Blimp")
InstanceAddedSignal:Connect(onRegisterBlimpRotors)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Blimp")
InstanceRemovedSignal:Connect(function(p1) -- Line: 200 -- upvalues: stopWatchingBlimp (val), u81 (val), BlimpRotors (val), u82 (val), u80 (val)
    stopWatchingBlimp(p1)
    local v1 = u81[p1]
    if not v1 then
        return
    end
    BlimpRotors.resetMotors(v1.state)
    local v2 = u82[p1]
    if v2 then
        u80:RemoveNode(v2)
        u82[p1] = nil
    end
    u81[p1] = nil
end)
return {}