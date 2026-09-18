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
--           File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.Blunt
--                              Dumped in 0.000365 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Shake = require(Utilities:WaitForChild("Shake"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
return function() -- Line: 14 -- upvalues: Workspace (val), Shake (val), CharacterRagdollHandler (val), ClientStatusHandler (val)
    local CurrentCamera = Workspace.CurrentCamera
    local v1 = Shake.new()
    v1.FadeInTime = 0.3
    v1.FadeOutTime = 0.3
    v1.Frequency = 0.1
    v1.Amplitude = 3
    v1.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
    v1:Start()
    v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 26 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
    CharacterRagdollHandler.ragdoll(2)
    ClientStatusHandler.addPlayerStatus("Concussed", 2)
end