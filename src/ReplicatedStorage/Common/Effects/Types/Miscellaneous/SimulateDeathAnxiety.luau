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
--    File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.SimulateDeathAnxiety
--                              Dumped in 0.000506 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local Anxiety = Miscellaneous:WaitForChild("Anxiety")
local ClientAnxietyHandler = require(Anxiety:WaitForChild("ClientAnxietyHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
return function(p1) -- Line: 22 -- upvalues: ClientAnxietyHandler (val), Players (val), RunService (val), Signals (val)
    local u4 = ClientAnxietyHandler.addClientAdjustment({amount = 30, impact = 95, maximum = 95, key = "nearby_death"})
    task.delay(4, function() -- Line: 33 -- upvalues: ClientAnxietyHandler (upval), u4 (val)
        ClientAnxietyHandler.removeClientAdjustment(u4)
    end)
    local CurrentCamera = workspace.CurrentCamera
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    local Position = p1
    if not Position then
        if not HumanoidRootPart then
            Position = Vector3.zero
        else
            Position = HumanoidRootPart.Position
            if not Position then
                Position = Vector3.zero
            end
        end
    end
    local u33 = RunService.RenderStepped:Connect(function(p1) -- Line: 42 -- upvalues: CurrentCamera (val), Position (val)
        if CurrentCamera then
            local v1 = CFrame.new(CurrentCamera.CFrame.Position, Position)
            CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(v1, p1 * 2)
        end
    end)
    task.delay(0.7, function() -- Line: 47 -- upvalues: u33 (val)
        u33:Disconnect()
    end)
    Signals.Monologue:Fire({"He's gone, I've seen my first death...", "He's dead, right in front of me..."}, "Shake")
    task.delay(2, function() -- Line: 52 -- upvalues: Signals (upval)
        Signals.Monologue:Fire({"I'm going to be sick..."}, "Wobble")
        task.wait(2)
        Signals.Monologue:Fire({"Why? What went wrong to where it became this... unbearable?", "I can't handle this..."}, "Shake")
        task.wait(2)
        Signals.Monologue:Fire({"I'm not sure what to do...", "I need to get out of here..."}, "Wobble")
    end)
end