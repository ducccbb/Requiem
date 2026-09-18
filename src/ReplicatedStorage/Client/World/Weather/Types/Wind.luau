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
--                File: ReplicatedStorage.Client.World.Weather.Types.Wind
--                              Dumped in 0.000591 seconds
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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local Wind = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Wind")
local u61 = (function(p1) -- Line: 29
    local Components_10, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9
    _, _, _, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10 = p1:GetComponents()
    return CFrame.new(0, 0, 0, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10)
end)(Wind.CFrame)
local u62 = nil
local u63 = nil
local u64 = nil
return {
    begin = function() -- Line: 47 -- upvalues: u62 (ref), Wind (val), Sounds (val), u63 (ref), RunService (val), u61 (val)
        if u62 then
            return
        end
        Wind.Parent = workspace
        local v1 = Sounds.playGlobalSoundEffect("rbxassetid://91608163329980", 10, 0.4)
        v1.Looped = true
        u63 = v1
        u62 = RunService.RenderStepped:Connect(function() -- Line: 58 -- upvalues: Wind (upval), u61 (upval)
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            Wind.CFrame = u61 + (CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 12)
        end)
    end,
    stop = function() -- Line: 72 -- upvalues: u62 (ref), u64 (ref), u63 (ref), TweenService (val), Wind (val)
        if u62 then
            u62:Disconnect()
            u62 = nil
        end
        if u64 then
            task.cancel(u64)
            u64 = nil
        end
        if u63 then
            local u12 = u63
            u63 = nil
            local v1 = TweenInfo.new(10, Enum.EasingStyle.Linear)
            TweenService:Create(u12, v1, {Volume = 0}):Play()
            u64 = task.delay(10, function() -- Line: 91 -- upvalues: u64 (upval), u12 (val)
                u64 = nil
                u12:Stop()
                u12:Destroy()
            end)
        end
        Wind.Parent = nil
    end,
}