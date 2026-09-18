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
--                    File: ReplicatedStorage.Common.Utilities.Sounds
--                               Dumped in 0.00132 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local u32 = {}
local u33 = {}
local assignSound = nil
if RunService:IsClient() then
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Client = ReplicatedStorage:WaitForChild("Client")
    local User = Client:WaitForChild("User")
    local Audio = User:WaitForChild("Audio")
    assignSound = require(Audio:WaitForChild("ClientMasterSoundGroup")).assignSound
end
local function routeSound(p1) -- Line: 21 -- upvalues: assignSound (ref)
    if assignSound then
        assignSound(p1)
    end
end
return {
    createSoundFromId = function(p1) -- Line: 27 -- upvalues: Workspace (val), routeSound (val)
        local Sound = Instance.new("Sound")
        Sound:AddTag("Custom")
        Sound.SoundId = p1
        Sound.Parent = Workspace
        routeSound(Sound)
        return Sound
    end,
    playGlobalSoundEffect = function(p1, p2, p3, p4, p5, p6) -- Line: 191 -- upvalues: Workspace (val), routeSound (val), u33 (val), TweenService (val), u32 (val)
        local Sound = Instance.new("Sound")
        Sound:AddTag("Custom")
        Sound.SoundId = p1
        Sound.Parent = Workspace
        routeSound(Sound)
        if p5 then
            Sound.PlaybackSpeed = math.random(p5.Min * 100, p5.Max * 100) / 100
        end
        if p2 then
            if not (u33[p1]) then
                local Volume = p3
                if not Volume then
                    Volume = Sound.Volume
                end
                u33[p1] = Volume
            end
            Sound.Volume = 0
            local v1 = TweenInfo.new(p2)
            local v2 = {}
            local v3 = p3
            if not v3 then
                v3 = u33[p1]
            end
            v2.Volume = v3
            TweenService:Create(Sound, v1, v2):Play()
        end
        Sound:Play()
        u32[p1] = Sound
        local function onMonitorDestroy() -- Line: 224 -- upvalues: p4 (val), p6 (val), TweenService (upval), Sound (val)
            task.delay(p4 or 20, function() -- Line: 225 -- upvalues: p6 (upval), TweenService (upval), Sound (upval)
                if p6 then
                    local v1 = TweenInfo.new(p6)
                    TweenService:Create(Sound, v1, {Volume = 0}):Play()
                    task.wait(p6)
                end
                Sound:Stop()
                Sound:Destroy()
            end)
        end
        if p4 == nil then
            task.delay(1.5, function() -- Line: 241 -- upvalues: Sound (val), onMonitorDestroy (val)
                if not Sound.Looped then
                    onMonitorDestroy()
                end
            end)
        end
        if p4 then
            onMonitorDestroy()
        end
        return Sound
    end,
    stopGlobalSoundEffect = function(p1, p2) -- Line: 256 -- upvalues: u32 (val), TweenService (val)
        local u3 = u32[p1]
        if not u3 then
            return
        end
        u32[p1] = nil
        if not p2 then
            u3:Stop()
            u3:Destroy()
            return
        end
        local v1 = TweenInfo.new(p2)
        TweenService:Create(u3, v1, {Volume = 0}):Play()
        task.delay(p2, function() -- Line: 269 -- upvalues: u3 (val)
            u3:Stop()
            u3:Destroy()
        end)
    end,
    playRangedSoundEffect = function(p1, p2, p3, p4, p5, p6) -- Line: 37 -- upvalues: Workspace (val), routeSound (val)
        local Part, v1
        if typeof(p1) ~= "table" then
            v1 = p1
        else
            v1 = p1[math.random(1, #p1)]
        end
        local Sound = Instance.new("Sound")
        Sound:AddTag("Custom")
        Sound.SoundId = v1
        Sound.Volume = p4
        Sound.RollOffMinDistance = 5
        Sound.RollOffMaxDistance = p3
        if p5 then
            local v2
            if typeof(p5) ~= "table" then
                v2 = p5
            else
                v2 = math.random(p5.min * 100, p5.max * 100) / 100
            end
            Sound.Pitch = v2
        end
        if p6 then
            Sound.PlaybackSpeed = p6
        end
        local u77 = nil
        if not p2 then
            if p2 and typeof(p2) == "Vector3" then
                Part = Instance.new("Part")
                Part.CanCollide = false
                Part.CanQuery = false
                Part.CanTouch = false
                Part.Anchored = true
                Part.Size = Vector3.new(1, 1, 1)
                Part.Position = p2
                Part.Transparency = 1
                Part.Parent = Workspace
                Sound.Parent = Part
                u77 = Part
            end
        elseif typeof(p2) == "Instance" then
            Sound.Parent = p2
        elseif p2 and typeof(p2) == "Vector3" then
            Part = Instance.new("Part")
            Part.CanCollide = false
            Part.CanQuery = false
            Part.CanTouch = false
            Part.Anchored = true
            Part.Size = Vector3.new(1, 1, 1)
            Part.Position = p2
            Part.Transparency = 1
            Part.Parent = Workspace
            Sound.Parent = Part
            u77 = Part
        end
        routeSound(Sound)
        Sound:Play()
        task.delay(10, function() -- Line: 89 -- upvalues: Sound (val), u77 (ref)
            if Sound.IsPlaying then
                task.wait(Sound.TimeLength)
            end
            Sound:Destroy()
            if u77 then
                u77:Destroy()
            end
        end)
        return Sound
    end,
    playFalloffSoundEffect = function(p1, p2, p3, p4, p5, p6, p7) -- Line: 104 -- upvalues: Players (val), Workspace (val), TweenService (val), routeSound (val)
        local Character = Players.LocalPlayer.Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        if typeof(p2) ~= "Instance" then
            local v1, v2
            if typeof(p2) ~= "Vector3" then
                v1 = p2
            else
                local Part = Instance.new("Part")
                Part.CanCollide = false
                Part.CanQuery = false
                Part.CanTouch = false
                Part.Anchored = true
                Part.Size = Vector3.new(1, 1, 1)
                Part.Transparency = 1
                Part.Position = p2
                Part.Parent = Workspace
                v1 = Part
            end
            local v3 = v1
            local v4 = math.clamp(1 - (HumanoidRootPart.Position - v3.Position).Magnitude / p3, 0, 1) * p4
            if typeof(p1) ~= "table" then
                v2 = p1
            else
                v2 = p1[math.random(1, #p1)]
            end
            local Sound = Instance.new("Sound")
            Sound:AddTag("Custom")
            Sound.SoundId = v2
            if not p7 then
                Sound.Volume = v4
            else
                Sound.Volume = 0
                local v5 = TweenInfo.new(p7, Enum.EasingStyle.Linear)
                TweenService:Create(Sound, v5, {Volume = v4}):Play()
            end
            Sound.RollOffMinDistance = p3 * 2
            Sound.RollOffMaxDistance = p3 * 2
            if p5 then
                local v6
                if typeof(p5) ~= "table" then
                    v6 = p5
                else
                    v6 = math.random(p5.min * 100, p5.max * 100) / 100
                end
                Sound.Pitch = v6
            end
            if p6 then
                Sound.PlaybackSpeed = p6
            end
            Sound.Parent = v3
            routeSound(Sound)
            Sound:Play()
            task.delay(10, function() -- Line: 180 -- upvalues: Sound (val)
                if Sound.IsPlaying then
                    task.wait(Sound.TimeLength)
                end
                Sound:Destroy()
            end)
            return Sound
        elseif not (p2:IsA("BasePart")) then
            warn("Parent is not a BasePart in playFalloffSoundEffect")
            return
        end
    end,
}