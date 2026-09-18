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
--                   File: ReplicatedStorage.Common.Utilities.Cutscene
--                              Dumped in 0.000464 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Assets = ReplicatedStorage:WaitForChild("Assets")
return {
    createCameraRig = function() -- Line: 25 -- upvalues: Assets (val)
        local v1 = Assets:WaitForChild("Objects"):WaitForChild("CameraRig"):Clone()
        v1.letterboxtop.Transparency = 1
        v1.letterboxbot.Transparency = 1
        v1.Parent = workspace
        return v1
    end,
    lockCameraToRig = function(p1, p2) -- Line: 37 -- upvalues: Workspace (val), RunService (val), TweenService (val)
        local u3 = tick()
        local CFrame = Workspace.CurrentCamera.CFrame
        local u7 = true
        local CurrentCamera = Workspace.CurrentCamera
        local u15 = RunService.RenderStepped:Connect(function() -- Line: 43 -- upvalues: u3 (val), p2 (val), CurrentCamera (val), CFrame (val), p1 (val), u7 (ref), TweenService (upval)
            local v1 = tick() - u3
            if v1 < p2 then
                local v2 = tick() - u3
                CurrentCamera.CFrame = CFrame:Lerp(p1.camera.CFrame, v2 / p2)
                return
            end
            if u7 then
                u7 = false
                local v3 = TweenInfo.new(0.3)
                TweenService:Create(p1.letterboxtop, v3, {Transparency = 0}):Play()
                v3 = TweenInfo.new(0.3)
                TweenService:Create(p1.letterboxbot, v3, {Transparency = 0}):Play()
            end
            CurrentCamera.CFrame = p1.camera.CFrame
        end)
        return function() -- Line: 59 -- upvalues: u15 (val), CurrentCamera (val), CFrame (val)
            u15:Disconnect()
            CurrentCamera.CFrame = CFrame
        end
    end,
    playAnimationOnRig = function(p1, p2) -- Line: 65
        local Animation = Instance.new("Animation")
        Animation.AnimationId = p2
        local v1 = p1.AnimationController.Animator:LoadAnimation(Animation)
        v1:Play(0.1)
        return v1
    end,
}