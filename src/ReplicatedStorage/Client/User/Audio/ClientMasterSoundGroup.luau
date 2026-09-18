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
--           File: ReplicatedStorage.Client.User.Audio.ClientMasterSoundGroup
--                              Dumped in 0.000719 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local SoundGroup = Instance.new("SoundGroup")
SoundGroup.Name = "MasterSoundGroup"
SoundGroup.Parent = SoundService
local function assignSound(p1) -- Line: 20 -- upvalues: SoundGroup (val)
    if p1:HasTag("BypassMasterSoundGroup") or p1.SoundGroup ~= nil then
        return
    end
    p1.SoundGroup = SoundGroup
end
local function assignSoundsInRoot(p1) -- Line: 28 -- upvalues: assignSound (val)
    for i, j in p1:GetDescendants() do
        if j:IsA("Sound") then
            assignSound(j)
        end
    end
end
local function onCharacterAdded(p1) -- Line: 36 -- upvalues: assignSoundsInRoot (val), assignSound (val)
    assignSoundsInRoot(p1)
    p1.DescendantAdded:Connect(function(p1) -- Line: 39 -- upvalues: assignSound (upval)
        if p1:IsA("Sound") then
            assignSound(p1)
        end
    end)
end
local function onPlayerAdded(p1) -- Line: 46 -- upvalues: onCharacterAdded (val)
    p1.CharacterAdded:Connect(onCharacterAdded)
    if p1.Character then
        onCharacterAdded(p1.Character)
    end
end
assignSoundsInRoot(Workspace)
Workspace.DescendantAdded:Connect(function(p1) -- Line: 56 -- upvalues: assignSound (val)
    if p1:IsA("Sound") then
        assignSound(p1)
    end
end)
for i, j in Players:GetPlayers() do
    onPlayerAdded(j)
end
Players.PlayerAdded:Connect(onPlayerAdded)
return {
    assignSound = assignSound,
    getMasterSoundGroup = function() -- Line: 68 -- upvalues: SoundGroup (val)
        return SoundGroup
    end,
    getOrCreateEffect = function(p1, p2) -- Line: 72 -- upvalues: SoundGroup (val)
        local v1 = SoundGroup:FindFirstChild(p1)
        if v1 then
            return v1
        end
        local v2 = Instance.new(p2)
        v2.Name = p1
        v2.Parent = SoundGroup
        return v2
    end,
}