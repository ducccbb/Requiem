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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterAnimationHandler
--                              Dumped in 0.000685 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local useAnimatorObserver_2 = useAnimatorObserver.useAnimatorObserver
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Effects_2 = Common_3:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local u70 = nil
return {
    onLoadMovementAnimations = function(p1, p2) -- Line: 61 -- upvalues: useAnimatorObserver (val), u70 (ref), Effects (val), useAnimatorObserver_2 (val)
        useAnimatorObserver.clearAll()
        local function onClearBindings() -- Line: 67 -- upvalues: u70 (upval)
            if u70 then
                u70()
            end
        end
        local function bindStepSounds(a1) -- Line: 73 -- upvalues: useAnimatorObserver (upval), p1 (val), Effects (upval)
            if typeof(a1) ~= "string" then
                return
            end
            local v1 = useAnimatorObserver.getLoadedAnimationOnRig(p1.model, a1)
            if not v1 then
                return
            end
            local v2 = v1.KeyframeReached:Connect(function(p1) -- Line: 83 -- upvalues: Effects (upval)
                if p1 ~= "Step" then
                    return
                end
                Effects.sendReplicatedEffect("ShifterStep")
            end)
            p1.trove:Add(v2)
        end
        local v1 = useAnimatorObserver_2(function(a1, a2) -- Line: 95 -- upvalues: onClearBindings (val), u70 (upval), useAnimatorObserver (upval), p2 (val), p1 (val), bindStepSounds (val)
            local Sprint, Walk
            onClearBindings()
            local animations = p2
            if not animations then
                animations = p1.animations
            end
            u70 = useAnimatorObserver.bind(a1, animations, 1, p1.easing or 0.75, true)
            if not p2 then
                Walk = p1.animations.Walk
            else
                Walk = p2.Walk
            end
            bindStepSounds(Walk)
            if not p2 then
                Sprint = p1.animations.Sprint
            else
                Sprint = p2.Sprint
                if not Sprint then
                    Sprint = p1.animations.Sprint
                end
            end
            bindStepSounds(Sprint)
            return onClearBindings
        end, true)
        p1.trove:Add(onClearBindings)
        p1.trove:Add(v1)
        p1.trove:Add(function() -- Line: 112 -- upvalues: useAnimatorObserver (upval)
            useAnimatorObserver.onDisallowR15()
            useAnimatorObserver.onResetEasingSpeed()
            useAnimatorObserver.clearAll()
        end)
    end,
    getTrackFromAnimation = function(p1, p2) -- Line: 31
        local v1
        if typeof(p2) ~= "table" then
            v1 = p2
        else
            v1 = p2[math.random(1, #p2)]
        end
        if not p1.model then
            return nil
        end
        local Humanoid = p1.model:FindFirstChildWhichIsA("Humanoid")
        local Animator = Humanoid
        if Animator then
            Animator = Humanoid:FindFirstChildWhichIsA("Animator")
        end
        if not Animator then
            return nil
        end
        for i, j in Animator:GetPlayingAnimationTracks() do
            if j.Animation.AnimationId == v1 then
                return j
            end
        end
        return nil
    end,
}