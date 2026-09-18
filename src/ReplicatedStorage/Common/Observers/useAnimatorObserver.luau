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
--             File: ReplicatedStorage.Common.Observers.useAnimatorObserver
--                               Dumped in 0.00361 seconds
--                          Bytecode version 9  |  40 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Animations = v1.Parent.Parent:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ContentProvider = game:GetService("ContentProvider")
local RunService = game:GetService("RunService")
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
local Utilities_2 = v1.Parent.Parent:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local useCharacterObserver = require(v1.Parent:WaitForChild("useCharacterObserver"))
local Utilities_3 = v1.Parent.Parent:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local u77 = {}
local u78 = {}
local u79 = {}
local u80 = {}
local u81 = {}
local u82 = {}
local u83 = nil
local u84 = nil
local u85 = 0.25
local function waitForCharacterLoaded(p1) -- Line: 77 -- upvalues: u84 (ref)
    local v1
    if not u84 then
        v1 = {
            "Torso",
            "HumanoidRootPart",
            "Head",
            "Humanoid",
            "Left Arm",
            "Right Arm",
            "Left Leg",
            "Right Leg",
        }
    else
        v1 = {"UpperTorso", "LowerTorso"}
    end
    for i, v in ipairs(v1) do
        p1:WaitForChild(v)
    end
end
local function getAnimatorFromModel(p1) -- Line: 90
    local Animator
    local AnimationController = p1:FindFirstChildWhichIsA("AnimationController")
    if AnimationController then
        Animator = AnimationController:FindFirstChildWhichIsA("Animator")
        if Animator then
            return Animator
        end
        return (AnimationController:WaitForChild("Animator"))
    end
    local Animator_2 = p1:FindFirstChildWhichIsA("Animator")
    if Animator_2 then
        return Animator_2
    end
    local Humanoid = p1:FindFirstChildWhichIsA("Humanoid")
    if not Humanoid then
        return nil
    end
    local Animator_3 = Humanoid:FindFirstChildWhichIsA("Animator")
    if Animator_3 then
        return Animator_3
    end
    return (Humanoid:WaitForChild("Animator"))
end
local function loadAnimationOnRig(p1, p2) -- Line: 120 -- upvalues: getAnimatorFromModel (val)
    local v1 = getAnimatorFromModel(p1)
    if not v1 then
        error("getAnimatorFromModel: no Animator found on model")
    end
    local Animation = Instance.new("Animation")
    Animation.AnimationId = p2
    return (v1:LoadAnimation(Animation))
end
local function preload(p1) -- Line: 317 -- upvalues: ContentProvider (val)
    local preloadTable
    if typeof(p1) ~= "table" then
        return
    end
    local u4 = {}
    function preloadTable(p1) -- Line: 324 -- upvalues: u4 (val), preloadTable (val)
        local Animation
        for k, v in pairs(p1) do
            if typeof(v) == "string" then
                Animation = Instance.new("Animation")
                Animation.AnimationId = v
                table.insert(u4, Animation)
            elseif typeof(v) == "table" then
                preloadTable(v)
            end
        end
    end
    preloadTable(p1)
    task.spawn(function() -- Line: 341 -- upvalues: ContentProvider (upval), u4 (val)
        ContentProvider:PreloadAsync(u4)
        for i, v in ipairs(u4) do
            v:Destroy()
        end
    end)
end
local function onCleanupExpired(p1) -- Line: 354 -- upvalues: u77 (val), u85 (ref), u78 (val), u83 (ref)
    if not (u77[p1]) then
        return
    end
    local v1 = p1
    for i, v in ipairs(u77[p1]) do
        for k, i2 in pairs(v.animations) do
            i2:Stop(u85)
        end
    end
    u77[v1] = nil
    if u78[v1] then
        u78[v1]:Disconnect()
        u78[v1] = nil
    end
    u83 = nil
    u85 = 0.25
end
local function refreshBindings(p1, p2) -- Line: 378 -- upvalues: u77 (val), u80 (val), Table (val), u85 (ref), u78 (val), onCleanupExpired (val), RunService (val), Statistics (val)
    local Idle, u111, u134, v1
    if not (u77[p1]) then
        return function() end
    end
    table.sort(u77[p1], function(p1, p2) -- Line: 386
        local v1 = p2.priority < p1.priority
        return v1
    end)
    local u116 = {}
    u111, u134 = p1, p2
    for i, v in ipairs(u77[p1]) do
        for k, i2 in pairs(v.animations) do
            if not (u116[k]) then
                u116[k] = i2
            end
        end
    end
    local v2 = u80[u111]
    local u27 = {}
    if not v2 then
        v1 = {}
    else
        v1 = Table.filter(v2, function(p1, p2) -- Line: 406 -- upvalues: u116 (val), u27 (val)
            local v1 = u116[p2] ~= p1
            if v1 then
                u27[p2] = u116[p2]
            end
            return v1
        end)
    end
    for k2, j in pairs(v1) do
        j:Stop(u85)
        if j.IsPlaying then
            u27[k2]:Play(u85)
        end
    end
    u80[u111] = u116
    if not v2 then
        if u116.Idle then
            u116.Idle:Play(0.1)
        end
    elseif not u27.Idle then
    end
    if u78[u111] then
        u78[u111]:Disconnect()
    end
    Idle = u116.Idle
    local Walk = u116.Walk
    local Sprint = u116.Sprint
    local Fall = u116.Fall
    if not u134.Parent then
        onCleanupExpired(u111)
        return function() end
    end
    local Humanoid = u134:WaitForChild("Humanoid")
    local u90 = nil
    u90 = RunService.RenderStepped:Connect(function() -- Line: 453 -- upvalues: u134 (val), u90 (ref), u78 (upval), u111 (val), Statistics (upval), Humanoid (val), Sprint (val), u85 (upval), Walk (val), Fall (val), Idle (val)
        local v1
        if not (u134:FindFirstChild("HumanoidRootPart")) then
            u90:Disconnect()
            u78[u111] = nil
            return
        end
        local Magnitude = u134.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
        local v2 = 0.2 < Magnitude
        if Statistics.Contains("walkspeed", "sprint") then
            v1 = 16 < Magnitude
        elseif not (Statistics.Contains("walkspeed", "quick_feet")) then
            v1 = Statistics.Contains("walkspeed", "super_sprint")
            if not v1 then end
        end
        local State = Humanoid:GetState()
        if State == Enum.HumanoidStateType.Freefall then
            if Sprint and Sprint.IsPlaying then
                Sprint:Stop(u85)
            end
            if Walk and Walk.IsPlaying then
                Walk:Stop(0.25)
            end
            if Fall and not Fall.IsPlaying then
                Fall:Play(0.25)
                Fall:AdjustSpeed(0.15)
            end
            return
        end
        if Fall and Fall.IsPlaying then
            Fall:Stop(0.25)
        end
        if not v2 then
            if not v2 then
                if not Walk then
                    if not v1 then
                        if not v1 and Sprint and Sprint.IsPlaying then
                            Sprint:Stop(u85)
                        end
                    elseif Sprint and not Sprint.IsPlaying then
                        Sprint:Play(u85)
                    end
                elseif Walk.IsPlaying then
                    Walk:Stop(u85)
                end
            elseif not v1 then
            end
        elseif Walk and not Walk.IsPlaying and not v1 then
            Walk:Play(u85)
        end
        if Idle and not Idle.IsPlaying then
            Idle:Play(u85)
        end
    end)
    u78[u111] = u90
    return function() -- Line: 508 -- upvalues: u78 (upval), u111 (val), u90 (ref)
        if u78[u111] then
            u78[u111]:Disconnect()
            u78[u111] = nil
        end
        if u90 then
            u90:Disconnect()
        end
    end
end
preload(Cinematics)
return {
    useAnimatorObserver = function(p1, p2) -- Line: 632 -- upvalues: u84 (ref), RunService (val), useCharacterObserver (val), getAnimatorFromModel (val), waitForCharacterLoaded (val)
        u84 = p2 or false
        if not (RunService:IsClient()) then
            return error("useAnimatorObserver must be used on the client")
        end
        local u10 = nil
        return useCharacterObserver(function(a1) -- Line: 647 -- upvalues: getAnimatorFromModel (upval), waitForCharacterLoaded (upval), p1 (val), u10 (ref)
            if not (a1:WaitForChild("Humanoid", 5)) then
                a1:WaitForChild("AnimationController")
            end
            local v1 = getAnimatorFromModel(a1)
            if not v1 then
                return function() end
            end
            waitForCharacterLoaded(a1)
            local v2 = p1(v1, a1)
            if typeof(v2) == "function" then
                u10 = v2
            end
            return function() -- Line: 663 -- upvalues: u10 (upval)
                if not u10 then
                    return
                end
                u10()
            end
        end)
    end,
    bind = function(p1, p2, p3, p4, p5) -- Line: 520 -- upvalues: u84 (ref), u85 (ref), u82 (val), preload (val), waitForCharacterLoaded (val), u77 (val), u79 (val), u81 (val), u83 (ref), refreshBindings (val), Table (val), u78 (val), u80 (val)
        local Animation, u100, u112, v1, v2
        u84 = p5 or false
        u85 = p4 or 0.25
        local Parent = p1.Parent
        if Parent then
            Parent = p1.Parent.Parent
        end
        if not Parent then
            return
        end
        local v3 = u82[p1]
        if not v3 then
            v3 = {}
        end
        u82[p1] = v3
        if u82[p1][p2] then
            return
        end
        preload(p2)
        waitForCharacterLoaded(Parent)
        local u106 = {}
        local v4 = u77[p1]
        if not v4 then
            v4 = {}
        end
        u77[p1] = v4
        u100, v2, u112 = p1, p3, p2
        for k, v in pairs(p2) do
            if typeof(v) == "string" then
                if not (u79[v]) then
                    Animation = Instance.new("Animation")
                    Animation.AnimationId = v
                    u79[v] = Animation
                end
                if not (u81[u100]) then
                    u81[u100] = {}
                end
                if not (u81[u100][v]) then
                    v1 = u81[u100]
                    v1[v] = u100:LoadAnimation(u79[v])
                end
                u106[k] = u81[u100][v]
            end
        end
        table.insert(u77[u100], {priority = v2 or 0, animations = u106})
        u83 = u100
        v3 = u82[u100]
        v3[u112] = true
        local u69 = refreshBindings(u100, Parent)
        return function() -- Line: 590 -- upvalues: u77 (upval), u100 (val), Table (upval), u106 (val), u85 (upval), u78 (upval), u82 (upval), u112 (val), u80 (upval), u69 (val), refreshBindings (upval), Parent (val)
            local v1
            if u77[u100] then
                u77[u100] = Table.filter(u77[u100], function(p1) -- Line: 593 -- upvalues: u106 (upval)
                    local v1 = p1.animations ~= u106
                    return v1
                end)
                table.sort(u77[u100], function(p1, p2) -- Line: 598
                    local v1 = p2.priority < p1.priority
                    return v1
                end)
            end
            for k, v in pairs(u106) do
                if v.IsPlaying then
                    v:Stop(u85)
                end
            end
            if u78[u100] then
                u78[u100]:Disconnect()
                u78[u100] = nil
            end
            if u82 and u82[u100] then
                v1 = u82[u100]
                if v1[u112] then
                    local v2 = u82[u100]
                    v2[u112] = nil
                end
            end
            u80[u100] = nil
            if u69 then
                u69()
            end
            refreshBindings(u100, Parent)
        end
    end,
    play = function(p1, p2, p3) -- Line: 256 -- upvalues: u83 (ref), u81 (val)
        local v1
        if not u83 then
            return
        end
        if typeof(p1) ~= "string" then
            v1 = p1[math.random(1, #p1)]
        else
            v1 = p1
        end
        local v2 = u83
        local v3 = u81[v2]
        if v3 then
            v3 = u81[v2][v1]
        end
        if not v3 then
            local Animation = Instance.new("Animation")
            Animation.AnimationId = v1
            v3 = v2:LoadAnimation(Animation)
            if p3 and v3 then
                v3.Priority = p3
            end
            local v4 = u81[v2]
            if not v4 then
                v4 = {}
            end
            u81[v2] = v4
            u81[v2][v1] = v3
            Animation:Destroy()
        end
        v3:Play(p2)
        return v3
    end,
    stop = function(p1, p2) -- Line: 287 -- upvalues: u83 (ref), u81 (val)
        if not u83 then
            return
        end
        local v1 = u81[u83]
        if v1 then
            v1 = u81[u83][p1]
        end
        if not v1 then
            return
        end
        v1:Stop(p2)
    end,
    preload = preload,
    getAnimationLength = function(p1) -- Line: 190
        if p1.Length ~= 0 then
            return p1.Length
        end
        while true do
            task.wait()
            if 0 < p1.Length then
                break
            end
        end
        return p1.Length
    end,
    playAnimationOnRig = function(p1, p2, p3, p4) -- Line: 145 -- upvalues: loadAnimationOnRig (val)
        local v1
        if typeof(p2) ~= "string" then
            v1 = p2[math.random(1, #p2)]
        else
            v1 = p2
        end
        local v2 = loadAnimationOnRig(p1, v1)
        if not (p1:GetAttribute("Ragdolled")) then
            if p4 and v2 then
                v2.Priority = p4
            end
            v2:Play(p3)
        end
        return v2
    end,
    loadAnimationOnRig = loadAnimationOnRig,
    onStopRigAnimations = function(p1, p2) -- Line: 133 -- upvalues: getAnimatorFromModel (val)
        local v1 = getAnimatorFromModel(p1)
        if not v1 then
            return
        end
        local PlayingAnimationTracks = v1:GetPlayingAnimationTracks()
        for i, v in ipairs(PlayingAnimationTracks) do
            v:Stop(p2 or 0.25)
        end
    end,
    onEaseEnding = function(p1, p2) -- Line: 166
        task.spawn(function() -- Line: 167 -- upvalues: p1 (val), p2 (val)
            local v1 = os.clock()
            if not p1.IsPlaying then
                while true do
                    task.wait()
                    if p1.IsPlaying and 0 < p1.Length then
                        break
                    end
                end
            elseif p1.Length ~= 0 then
            end
            local v2 = p1.Length - (os.clock() - v1) - 0.05
            task.wait(v2 - (p2 + 0.05))
            p1:Stop(p2)
        end)
    end,
    onKeyframeReachedSwitch = function(p1, p2) -- Line: 300
        local u6 = p1.KeyframeReached:Connect(function(p1) -- Line: 301 -- upvalues: p2 (val)
            local v1 = p2[p1]
            if v1 then
                v1()
            end
        end)
        p1.Stopped:Once(function() -- Line: 308 -- upvalues: u6 (val)
            u6:Disconnect()
        end)
        return u6
    end,
    getLoadedAnimationOnRig = function(p1, p2) -- Line: 236 -- upvalues: getAnimatorFromModel (val), u81 (val)
        local v1 = getAnimatorFromModel(p1)
        if not v1 then
            return nil
        end
        local v2 = u81[v1]
        if v2 then
            v2 = u81[v1][p2]
        end
        if v2 then
            return v2
        end
        for i, j in v1:GetPlayingAnimationTracks() do
            if j.Animation.AnimationId == p2 then
                return j
            end
        end
        return nil
    end,
    playSoundEffectsFromTrack = function(p1, p2, ...) -- Line: 209 -- upvalues: Sounds (val)
        local u2 = {...}
        local u5 = u2[#u2]
        if u5 and typeof(u5) == "function" then
            table.remove(u2, #u2)
        end
        local u23 = p1.KeyframeReached:Connect(function(p1) -- Line: 218 -- upvalues: p2 (val), u5 (val), Sounds (upval), u2 (val)
            if not (p2[p1]) then
                return
            end
            if not u5 or typeof(u5) ~= "function" then
                Sounds.playRangedSoundEffect(p2[p1], unpack(u2))
                return
            end
            if not (u5()) then
                return
            end
            Sounds.playRangedSoundEffect(p2[p1], unpack(u2))
        end)
        p1.Stopped:Once(function() -- Line: 231 -- upvalues: u23 (ref)
            u23:Disconnect()
        end)
    end,
    clearAll = function() -- Line: 679 -- upvalues: u81 (val), u78 (val), u77 (val), u79 (val), u80 (val), u82 (val), u83 (ref)
        for k, v in pairs(u81) do
            for k2, i in pairs(v) do
                if i.IsPlaying then
                    i:Stop(0)
                end
            end
        end
        for k3, j in pairs(u78) do
            if j and j.Connected then
                j:Disconnect()
            end
        end
        table.clear(u77)
        table.clear(u78)
        table.clear(u79)
        table.clear(u80)
        table.clear(u81)
        table.clear(u82)
        u83 = nil
    end,
    onDisallowR15 = function() -- Line: 708 -- upvalues: u84 (ref)
        u84 = false
    end,
    onResetEasingSpeed = function() -- Line: 712 -- upvalues: u85 (ref)
        u85 = 0.25
    end,
}