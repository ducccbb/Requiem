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
--            File: ReplicatedStorage.Common.World.Vehicles.BlimpEngineAudio
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local u22 = {}
local u23 = 0
local function getBlimpEngineSound(p1) -- Line: 40
    local Engine = p1:FindFirstChild("Engine")
    if not Engine or not (Engine:IsA("Sound")) then
        return nil
    end
    Engine.Looped = false
    return Engine
end
local function destroyEnginePlaybackSounds(p1) -- Line: 55
    for i, j in p1:GetChildren() do
        if j:IsA("Sound") and j.Name == "EnginePlayback" then
            j:Destroy()
        end
    end
end
local function createEnginePlaybackSound(p1) -- Line: 68
    local v1 = p1:Clone()
    v1.Name = "EnginePlayback"
    v1.Looped = false
    v1.Volume = 0
    v1.Parent = p1.Parent
    return v1
end
local function cancelEngineVolumeTween(p1) -- Line: 82
    local volumeTween = p1.volumeTween
    p1.volumeTween = nil
    if volumeTween then
        volumeTween:Cancel()
    end
    local fadeOutTween = p1.fadeOutTween
    p1.fadeOutTween = nil
    if fadeOutTween then
        fadeOutTween:Cancel()
    end
end
local function unbindEngineLoopMonitor(p1) -- Line: 103
    local loopConnection = p1.loopConnection
    p1.loopConnection = nil
    if loopConnection then
        loopConnection:Disconnect()
    end
end
local function continueEngineStartupTween(p1) -- Line: 117 -- upvalues: cancelEngineVolumeTween (val), TweenService (val)
    if not p1.engineStarting or not p1.startupBeginTime then
        return
    end
    local v1 = 10 - (os.clock() - p1.startupBeginTime)
    if v1 <= 0 then
        p1.activeSound.Volume = 1.35
        return
    end
    cancelEngineVolumeTween(p1)
    local v2 = TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local v3 = TweenService:Create(p1.activeSound, v2, {Volume = 1.35})
    p1.volumeTween = v3
    v3:Play()
end
local function performEngineCrossfade(p1, p2) -- Line: 146 -- upvalues: u22 (val), cancelEngineVolumeTween (val), createEnginePlaybackSound (val), TweenService (val), continueEngineStartupTween (val)
    if p2.crossfading or u22[p1] ~= p2 then
        return
    end
    local activeSound = p2.activeSound
    if not activeSound.Parent or not activeSound.IsPlaying then
        return
    end
    p2.crossfading = true
    cancelEngineVolumeTween(p2)
    local v1 = createEnginePlaybackSound(p2.template)
    v1:Play()
    local Volume = activeSound.Volume
    local v2 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local v3 = TweenService:Create(activeSound, v2, {Volume = 0})
    local v4 = TweenService:Create(v1, v2, {Volume = Volume})
    p2.activeSound = v1
    p2.fadeOutTween = v3
    p2.volumeTween = v4
    v3:Play()
    v4:Play()
    v3.Completed:Once(function(p1) -- Line: 176 -- upvalues: activeSound (val)
        if p1 == Enum.PlaybackState.Cancelled then
            return
        end
        activeSound:Stop()
        activeSound:Destroy()
    end)
    v4.Completed:Once(function(a1) -- Line: 185 -- upvalues: u22 (upval), p1 (val), p2 (val), continueEngineStartupTween (upval)
        local v1 = u22[p1]
        if v1 ~= p2 then
            return
        end
        if a1 == Enum.PlaybackState.Cancelled then
            p2.crossfading = false
            return
        end
        p2.crossfading = false
        p2.fadeOutTween = nil
        p2.volumeTween = nil
        continueEngineStartupTween(p2)
    end)
end
local function bindEngineLoopMonitor(p1, p2) -- Line: 208 -- upvalues: unbindEngineLoopMonitor (val), RunService (val), u22 (val), performEngineCrossfade (val)
    unbindEngineLoopMonitor(p2)
    p2.loopConnection = RunService.Heartbeat:Connect(function() -- Line: 211 -- upvalues: p2 (val), u22 (upval), p1 (val), performEngineCrossfade (upval)
        if p2.crossfading then
            return
        end
        local v1 = u22[p1]
        if v1 ~= p2 then
            return
        end
        local activeSound = p2.activeSound
        if not activeSound.Parent or not activeSound.IsPlaying then
            return
        end
        local TimeLength = activeSound.TimeLength
        if TimeLength <= 0 then
            return
        end
        local v2 = math.min(1, TimeLength * 0.5)
        if TimeLength - activeSound.TimePosition <= v2 then
            performEngineCrossfade(p1, p2)
        end
    end)
end
local function shutdown(p1) -- Line: 239 -- upvalues: u22 (val), cancelEngineVolumeTween (val), unbindEngineLoopMonitor (val), destroyEnginePlaybackSounds (val), getBlimpEngineSound (val)
    local v1 = u22[p1]
    if v1 then
        v1.startupId = v1.startupId + 1
        v1.engineStarting = false
        v1.crossfading = false
        cancelEngineVolumeTween(v1)
        unbindEngineLoopMonitor(v1)
        if v1.activeSound.Parent then
            v1.activeSound:Stop()
        end
        u22[p1] = nil
    end
    destroyEnginePlaybackSounds(p1)
    local v2 = getBlimpEngineSound(p1)
    if v2 then
        v2.Volume = 0
        v2:Stop()
    end
end
return {
    ENGINE_STARTUP_SECONDS = 10,
    beginStartup = function(p1) -- Line: 269 -- upvalues: getBlimpEngineSound (val), shutdown (val), u23 (ref), createEnginePlaybackSound (val), u22 (val), TweenService (val), bindEngineLoopMonitor (val)
        local v1 = getBlimpEngineSound(p1)
        if not v1 then
            return
        end
        shutdown(p1)
        u23 = u23 + 1
        local u9 = u23
        local v2 = createEnginePlaybackSound(v1)
        v2:Play()
        local u16 = {
            crossfading = false,
            engineStarting = true,
            template = v1,
            activeSound = v2,
            startupBeginTime = os.clock(),
            startupId = u9,
        }
        u22[p1] = u16
        local v3 = TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local v4 = TweenService:Create(v2, v3, {Volume = 1.35})
        u16.volumeTween = v4
        v4:Play()
        bindEngineLoopMonitor(p1, u16)
        task.delay(10, function() -- Line: 306 -- upvalues: u22 (upval), p1 (val), u16 (val), u9 (val)
            local v1 = u22[p1]
            if v1 ~= u16 or u16.startupId ~= u9 then
                return
            end
            u16.engineStarting = false
            u16.startupBeginTime = nil
            u16.volumeTween = nil
        end)
    end,
    shutdown = shutdown,
    prepareTemplate = function(p1) -- Line: 322 -- upvalues: getBlimpEngineSound (val)
        local v1 = getBlimpEngineSound(p1)
        if v1 then
            v1.Volume = 0
            v1:Stop()
        end
    end,
}