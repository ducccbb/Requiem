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
--    File: ReplicatedStorage.Client.Entities.Animals.Utilities.AnimationAnimalClient
--                               Dumped in 0.00143 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations_2 = Common:WaitForChild("Animations")
local Animals = require(Animations_2:WaitForChild("Animals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Animals_2 = Types:WaitForChild("Animals")
require(Animals_2:WaitForChild("Animal"))
local u59 = {}
local u60 = false
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = require(Common_3:WaitForChild("Logger"))("Animations")
local function getAnimationObject(p1) -- Line: 32 -- upvalues: u59 (val)
    if u59[p1] then
        return u59[p1]
    end
    local Animation = Instance.new("Animation")
    Animation.AnimationId = p1
    u59[p1] = Animation
    return Animation
end
local function getAnimationFromName(p1, p2) -- Line: 50
    local animations = p1.animations
    local v1 = nil
    local v2 = nil
    for i, j in animations, v1, v2 do
        if j.name == p2 and j.track.IsPlaying then
            return j
        end
    end
    return nil
end
local function getAnimationLength(p1, p2) -- Line: 69 -- upvalues: getAnimationFromName (val)
    local v1 = getAnimationFromName(p1, p2)
    if not v1 then
        return 0
    end
    local v2 = os.clock()
    local Length = v1.track.Length
    if v1.track and Length == 0 then
        while true do
            task.wait()
            if 0 < v1.track.Length then
                break
            end
        end
        local v3 = os.clock() - v2
        Length = v1.track.Length - v3
    end
    return Length
end
local function onStopAnimation(p1, p2) -- Line: 94
    local outTime
    local animations = p1.animations
    local v1 = animations[p2.key]
    if not v1 then
        return
    end
    local track = v1.track
    if not p2.easing then
        outTime = 0.3
    else
        outTime = p2.easing.outTime
        if not outTime then
            outTime = 0.3
        end
    end
    track:Stop(outTime)
    animations[p2.key] = nil
end
local function onPlayAnimation(p1, p2) -- Line: 111 -- upvalues: getAnimationObject (val), onStopAnimation (val), getAnimationLength (val)
    local inTime, speed
    local v1 = workspace:GetServerTimeNow() - p2.server
    if p2.delay then
        if p2.delay < 0 and p2.hold then
            p2.hold = p2.hold + p2.delay
        end
        task.wait(p2.delay)
    end
    if p2.hold then
        task.wait(p2.hold)
    end
    local u35 = p1.animator:LoadAnimation((getAnimationObject(p2.id)))
    if not p2.easing then
        inTime = 0
    else
        inTime = p2.easing.inTime
    end
    u35:Play(inTime)
    if p2.speed then
        u35:AdjustSpeed(p2.speed)
    end
    if not p2.core then
        local animations = p1.animations
        local v2 = nil
        local v3 = nil
        for i, j in animations, v2, v3 do
            if j.priority and j.priority <= p2.priority and not j.core then
                onStopAnimation(p1, j)
            end
        end
    end
    u35.TimePosition = v1 + (p2.hold or 0)
    p1.animations[p2.key] = {
        track = u35,
        priority = p2.priority,
        name = p2.name,
        core = p2.core,
        id = p2.id,
        server = p2.server,
        key = p2.key,
        action = p2.action,
        easing = p2.easing,
        speed = p2.speed,
        hold = p2.hold,
        delay = p2.delay,
        pause = p2.pause,
    }
    task.spawn(function() -- Line: 171 -- upvalues: u35 (val), p2 (val), getAnimationLength (upval), p1 (val), onStopAnimation (upval)
        local v1 = os.clock()
        if u35.Length == 0 then
            while true do
                task.wait()
                if 0 < u35.Length then
                    break
                end
            end
        end
        local v2 = os.clock() - v1
        if p2.pause then
            task.delay(u35.Length - v2 - 1, function() -- Line: 181 -- upvalues: u35 (upval)
                u35:AdjustSpeed(0)
            end)
            return
        end
        if not u35.Looped and p2.name then
            local v3 = getAnimationLength(p1, p2.name)
            task.delay(v3, function() -- Line: 187 -- upvalues: onStopAnimation (upval), p1 (upval), p2 (upval)
                onStopAnimation(p1, p2)
            end)
        end
    end)
end
local function onPreloadAnimalAnimations() -- Line: 199 -- upvalues: u60 (ref), Animals (val), ContentProvider (val), Animations (val)
    local preloadTable
    u60 = true
    local u1 = {}
    function preloadTable(p1) -- Line: 207 -- upvalues: u1 (val), preloadTable (val)
        local Animation
        local v1 = p1
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if typeof(j) == "string" then
                Animation = Instance.new("Animation")
                Animation.AnimationId = j
                table.insert(u1, Animation)
            elseif typeof(j) == "table" then
                preloadTable(j)
            end
        end
    end
    preloadTable(Animals)
    task.spawn(function() -- Line: 223 -- upvalues: ContentProvider (upval), u1 (val), Animations (upval)
        ContentProvider:PreloadAsync(u1)
        local v1 = u1
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Destroy()
        end
        Animations.info((("Preloaded all animal animations [%*]"):format(#u1))).color("green")
    end)
end
return {
    onAnimationReceived = function(p1, p2) -- Line: 239 -- upvalues: u60 (ref), onPreloadAnimalAnimations (val), onPlayAnimation (val), onStopAnimation (val)
        if not u60 then
            onPreloadAnimalAnimations()
        end
        if p2.action == "play" then
            onPlayAnimation(p1, p2)
            return
        end
        onStopAnimation(p1, p2)
    end,
    onPlayAnimation = onPlayAnimation,
    onStopAnimation = onStopAnimation,
    getAnimationFromName = getAnimationFromName,
    getAnimationLength = getAnimationLength,
}