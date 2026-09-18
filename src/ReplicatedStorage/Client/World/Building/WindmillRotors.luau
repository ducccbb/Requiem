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
--             File: ReplicatedStorage.Client.World.Building.WindmillRotors
--                              Dumped in 0.000711 seconds
--                          Bytecode version 9  |  5 functions

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
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u57 = v2.new()
local u58 = {}
local u59 = nil
local function onClientRenderStep(p1) -- Line: 55 -- upvalues: Character (val), u57 (val)
    local rotor
    local v1 = Character.getCharacter()
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = u57:SearchRadius(HumanoidRootPart.Position, 5000)
    if #v2 == 0 then
        return
    end
    local v3 = math.rad(p1 * -5)
    local v4 = CFrame.Angles(v3, 0, 0)
    v3 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v3, v5, v6 do
        rotor = j.Object.rotor
        if rotor.Parent then
            rotor:PivotTo(rotor:GetPivot() * v4)
        end
    end
end
local function isBlimpRotor(p1) -- Line: 88 -- upvalues: CollectionService (val)
    local Parent = p1.Parent
    while Parent do
        if Parent:IsA("Model") and CollectionService:HasTag(Parent, "Blimp") then
            return true
        end
        Parent = Parent.Parent
    end
    return false
end
local function onRegisterWindmillRotor(p1) -- Line: 107 -- upvalues: isBlimpRotor (val), u58 (val), u57 (val), u59 (ref), RunService (val), onClientRenderStep (val)
    if isBlimpRotor(p1) or u58[p1] then
        return
    end
    u58[p1] = u57:CreateNode(p1:GetPivot().Position, {rotor = p1})
    if not u59 then
        u59 = RunService.RenderStepped:Connect(onClientRenderStep)
    end
end
for i, j in CollectionService:GetTagged("Rotor") do
    onRegisterWindmillRotor(j)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Rotor")
InstanceAddedSignal:Connect(onRegisterWindmillRotor)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Rotor")
InstanceRemovedSignal:Connect(function(p1) -- Line: 131 -- upvalues: u58 (val), u57 (val)
    local v1 = u58[p1]
    if not v1 then
        return
    end
    u57:RemoveNode(v1)
    u58[p1] = nil
end)
return {}