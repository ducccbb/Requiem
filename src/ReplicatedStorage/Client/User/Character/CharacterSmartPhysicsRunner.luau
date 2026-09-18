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
--       File: ReplicatedStorage.Client.User.Character.CharacterSmartPhysicsRunner
--                              Dumped in 0.000571 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local u50 = require(Packages:WaitForChild("smartbone-2")).Start()
local function isSmartBonesEnabled() -- Line: 28 -- upvalues: ClientSettingsHandler (val)
    local v1 = ClientSettingsHandler.getSettingFromName("Smart Bones")
    if typeof(v1) == "boolean" then
        return v1
    end
    return true
end
local function getLocalCharacter() -- Line: 42 -- upvalues: Players (val)
    return Players.LocalPlayer.Character
end
local function setSmartBoneTag(p1, p2) -- Line: 52 -- upvalues: CollectionService (val)
    if p2 then
        CollectionService:AddTag(p1, "SmartBone")
        return
    end
    CollectionService:RemoveTag(p1, "SmartBone")
end
local function syncCharacterSmartBoneTags(p1) -- Line: 65 -- upvalues: getLocalCharacter (val), CollectionService (val), setSmartBoneTag (val)
    local v1 = getLocalCharacter()
    if not v1 then
        return
    end
    for i, j in CollectionService:GetTagged("ClientSmartPhysics") do
        if j:IsDescendantOf(v1) then
            setSmartBoneTag(j, p1)
        end
    end
end
local function applySmartBonesState(p1) -- Line: 83 -- upvalues: syncCharacterSmartBoneTags (val), u50 (val)
    if p1 then
        syncCharacterSmartBoneTags(true)
        return
    end
    u50.Stop()
    syncCharacterSmartBoneTags(false)
end
local function onClientSmartPhysicsObjectAdded(p1) -- Line: 98 -- upvalues: ClientSettingsHandler (val), isSmartBonesEnabled (val), getLocalCharacter (val), setSmartBoneTag (val)
    if not (ClientSettingsHandler.isSettingsLoaded()) or not (isSmartBonesEnabled()) then
        return
    end
    local v1 = getLocalCharacter()
    if not v1 or not (p1:IsDescendantOf(v1)) then
        return
    end
    setSmartBoneTag(p1, true)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("ClientSmartPhysics")
InstanceAddedSignal:Connect(function(p1) -- Line: 111 -- upvalues: onClientSmartPhysicsObjectAdded (val)
    onClientSmartPhysicsObjectAdded(p1)
end)
ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 115 -- upvalues: applySmartBonesState (val), isSmartBonesEnabled (val)
    if p1 ~= "Smart Bones" then
        return
    end
    applySmartBonesState(isSmartBonesEnabled())
end)
task.spawn(function() -- Line: 123 -- upvalues: ClientSettingsHandler (val), applySmartBonesState (val), isSmartBonesEnabled (val)
    while not (ClientSettingsHandler.isSettingsLoaded()) do
        task.wait()
    end
    applySmartBonesState(isSmartBonesEnabled())
end)
return {}