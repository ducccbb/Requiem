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
--        File: ReplicatedStorage.Client.User.Miscellaneous.ClientAimAssistRunner
--                              Dumped in 0.000821 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Progression = script.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u45 = {}
local u46 = {}
local u47 = {}
local Folder = Instance.new("Folder")
Folder.Name = "GrappleAimAssist"
Folder.Parent = Workspace
local function onUpdateAimAssistObject(p1) -- Line: 30 -- upvalues: Players (val), u47 (val), u46 (val), ClientAttributesHandler (val)
    local Character = Players.LocalPlayer.Character
    local PrimaryPart = Character
    if PrimaryPart then
        PrimaryPart = Character.PrimaryPart
    end
    if not PrimaryPart then
        return
    end
    local HumanoidRootPart = u47[p1]:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    if HumanoidRootPart == PrimaryPart then
        u46[p1] = true
        return
    end
    local Magnitude = (PrimaryPart.Position - HumanoidRootPart.Position).Magnitude
    if 2500 < Magnitude then
        u46[p1] = true
        return
    end
    local Magnitude_2 = HumanoidRootPart.AssemblyLinearVelocity.Magnitude
    if Magnitude_2 < 50 then
        p1.Size = Vector3.new(1, 1, 1)
        u46[p1] = true
        return
    end
    local v1 = math.clamp(Magnitude_2 / 200, 0, 1)
    local v2 = math.clamp(Magnitude / 300, 0.5, 1)
    local v3 = ClientAttributesHandler.getAttribute("GearGrappleAimAssistMultiplier") * 20 or 1
    p1.Size = Vector3.new(v3, v3, v3) * v1 * v2
    u46[p1] = false
end
local function onUpdateAimAssist() -- Line: 71 -- upvalues: u45 (val), Folder (val), onUpdateAimAssistObject (val)
    local v1
    local v2 = u45
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if i.Parent == Folder then
            v1 = tick() - j
            if 0.03 < v1 then
                u45[i] = tick()
                onUpdateAimAssistObject(i)
            end
        else
            u45[i] = nil
        end
    end
end
local function onGrappleAimAssistAdded(p1) -- Line: 121 -- upvalues: u47 (val), Folder (val), u45 (val)
    u47[p1] = p1.Parent
    p1.CanQuery = false
    p1.Parent = Folder
    u45[p1] = tick()
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("GrappleAimAssist")
InstanceAddedSignal:Connect(onGrappleAimAssistAdded)
for i, j in CollectionService:GetTagged("GrappleAimAssist") do
    onGrappleAimAssistAdded(j)
end
if _G.__PVP_DEBUGGING__ then
    RunService.RenderStepped:Connect(onUpdateAimAssist)
end
return {
    onUpdateAimAssistObject = onUpdateAimAssistObject,
    onGrappleAimAssistAdded = onGrappleAimAssistAdded,
    onValidateAimAssistRaycast = function(p1, p2, p3) -- Line: 86 -- upvalues: onUpdateAimAssist (val), u45 (val), u46 (val), Workspace (val), u47 (val)
        onUpdateAimAssist()
        local v1 = {}
        local v2 = u45
        local v3 = nil
        local v4 = nil
        for i in v2, v3, v4 do
            if not (u46[i]) then
                i.CanQuery = true
                v1[i] = true
            end
        end
        v2 = Workspace:Raycast(p1, p2, p3)
        v3 = v1
        v4 = nil
        local v5 = nil
        for j in v3, v4, v5 do
            j.CanQuery = false
        end
        if not v2 then
            return false, nil, nil
        end
        v3 = u47[v2.Instance]
        if not v3 then
            v4 = u45[v2.Instance] ~= nil
            return v4, v2.Instance, u47[v2.Instance]
        end
        if v3.PrimaryPart then
            v4 = u45[v2.Instance] ~= nil
            return v4, v3.PrimaryPart, v3
        end
        v4 = u45[v2.Instance] ~= nil
        return v4, v2.Instance, u47[v2.Instance]
    end,
}