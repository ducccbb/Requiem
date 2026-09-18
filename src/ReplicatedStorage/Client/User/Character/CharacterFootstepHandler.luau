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
--        File: ReplicatedStorage.Client.User.Character.CharacterFootstepHandler
--                               Dumped in 0.00296 seconds
--                          Bytecode version 9  |  38 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local RunService = game:GetService("RunService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Atomic = require(Utilities:WaitForChild("Atomic"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds = Common_3:WaitForChild("Sounds")
local Footsteps = require(Sounds:WaitForChild("Footsteps"))
local u82 = 1
local u83 = {}
local function applySound(p1, p2, p3) -- Line: 32 -- upvalues: Footsteps (val), u82 (ref)
    local v1 = Footsteps[p2]
    local SmoothPlastic = v1[p3.Name]
    if not SmoothPlastic then
        SmoothPlastic = v1.SmoothPlastic
    end
    local v2 = p1
    for k, v in pairs(SmoothPlastic) do
        if k ~= "SoundId" then
            if k ~= "Volume" then
                v2[k] = v
            else
                v2:SetAttribute("BaseVolume", v)
                v2[k] = v * u82
            end
        elseif type(v) == "table" then
            v2[k] = v[math.random(1, #v)]
        end
    end
end
local function updateFootstepVolumes() -- Line: 53 -- upvalues: u83 (val), u82 (ref)
    local Attribute
    for k in pairs(u83) do
        Attribute = k:GetAttribute("BaseVolume")
        if Attribute and typeof(Attribute) == "number" then
            k.Volume = Attribute * u82
        end
    end
end
local UserSoundsUseRelativeVelocity2 = (function(p1) -- Line: 63
    local v1, v2
    v1, v2 = pcall(function() -- Line: 64 -- upvalues: p1 (val)
        return UserSettings():IsUserFeatureEnabled(p1)
    end)
    return v1 and v2
end)("UserSoundsUseRelativeVelocity2")
local u90 = {
    Climbing = {SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looped = true},
    Died = {SoundId = "rbxasset://sounds/uuhhh.mp3"},
    FreeFalling = {SoundId = "rbxasset://sounds/action_falling.mp3", Looped = true},
    GettingUp = {SoundId = "rbxasset://sounds/action_get_up.mp3"},
    Jumping = {SoundId = "rbxasset://sounds/action_jump.mp3"},
    Landing = {SoundId = "rbxasset://sounds/action_jump_land.mp3"},
    Running = {SoundId = "rbxasset://sounds/action_footsteps_plastic.mp3", Looped = true, Volume = 0.5},
    Splash = {SoundId = "rbxasset://sounds/impact_water.mp3"},
    Swimming = {SoundId = "rbxasset://sounds/action_swim.mp3", Looped = true, Pitch = 1.6},
}
local function map(p1, p2, p3, p4, p5) -- Line: 109
    return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
end
local function getRelativeVelocity(p1, p2) -- Line: 113
    if not p1 then
        return p2
    end
    local ActiveController = p1.ActiveController
    if ActiveController then
        if not (p1.ActiveController:IsA("GroundController")) then
            ActiveController = p1.ActiveController:IsA("ClimbController")
            if ActiveController then
                ActiveController = p1.ClimbSensor
            end
        else
            ActiveController = p1.GroundSensor
        end
    end
    if not ActiveController then
        return p2
    end
    if ActiveController.SensedPart then
        return p2 - ActiveController.SensedPart:GetVelocityAtPosition(p1.RootPart.Position)
    end
    return p2
end
local function playSound(p1) -- Line: 131
    p1.TimePosition = 0
    p1.Playing = true
end
local function shallowCopy(p1) -- Line: 136
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
local u108 = Atomic.new({humanoid = "Humanoid", rootPart = "HumanoidRootPart"}, function(p1) -- Line: 144 -- upvalues: UserSoundsUseRelativeVelocity2 (val), u90 (val), shallowCopy (val), playSound (val), map (val), getRelativeVelocity (val), applySound (val), u83 (val), RunService (val)
    local Sound
    local humanoid = p1.humanoid
    local rootPart = p1.rootPart
    local u10 = if UserSoundsUseRelativeVelocity2 then humanoid.Parent:FindFirstChild("ControllerManager") else nil
    local u168 = {}
    for k, v in pairs(u90) do
        Sound = Instance.new("Sound")
        Sound.Name = k
        Sound.Archivable = false
        Sound.RollOffMinDistance = 5
        Sound.RollOffMaxDistance = 150
        Sound.Volume = 0.65
        Sound:AddTag("Custom")
        for k2, i in pairs(v) do
            Sound[k2] = i
        end
        Sound.Parent = rootPart
        u168[k] = Sound
    end
    for k3, j in pairs(rootPart:GetChildren()) do
        if not (j:HasTag("Custom")) and j:IsA("Sound") then
            j.Playing = false
            j.Volume = 0
        end
    end
    local u44 = rootPart.ChildAdded:Connect(function(p1) -- Line: 185
        if not (p1:HasTag("Custom")) and p1:IsA("Sound") then
            p1.Playing = false
            p1.Volume = 0
        end
    end)
    local u45 = {}
    local function stopPlayingLoopedSounds(p1) -- Line: 194 -- upvalues: shallowCopy (upval), u45 (val)
        for k in pairs(shallowCopy(u45)) do
            if k ~= p1 then
                k.Playing = false
                u45[k] = nil
            end
        end
    end
    local u47 = {}
    u47[Enum.HumanoidStateType.FallingDown] = function() -- Line: 205 -- upvalues: stopPlayingLoopedSounds (val)
        stopPlayingLoopedSounds()
    end
    u47[Enum.HumanoidStateType.GettingUp] = function() -- Line: 209 -- upvalues: stopPlayingLoopedSounds (val), playSound (upval), u168 (val)
        stopPlayingLoopedSounds()
        playSound(u168.GettingUp)
    end
    u47[Enum.HumanoidStateType.Jumping] = function() -- Line: 214 -- upvalues: stopPlayingLoopedSounds (val), playSound (upval), u168 (val)
        stopPlayingLoopedSounds()
        playSound(u168.Jumping)
    end
    u47[Enum.HumanoidStateType.Swimming] = function() -- Line: 219 -- upvalues: rootPart (val), u168 (val), map (upval), playSound (upval), stopPlayingLoopedSounds (val), u45 (val)
        local v1 = math.abs(rootPart.AssemblyLinearVelocity.Y)
        if 0.1 < v1 then
            local v2 = map(v1, 100, 350, 0.28, 1)
            u168.Splash.Volume = math.clamp(v2, 0, 1)
            playSound(u168.Splash)
        end
        stopPlayingLoopedSounds(u168.Swimming)
        u168.Swimming.Playing = true
        u45[u168.Swimming] = true
    end
    u47[Enum.HumanoidStateType.Freefall] = function() -- Line: 230 -- upvalues: u168 (val), stopPlayingLoopedSounds (val), u45 (val)
        u168.FreeFalling.Volume = 0
        stopPlayingLoopedSounds(u168.FreeFalling)
        u45[u168.FreeFalling] = true
    end
    u47[Enum.HumanoidStateType.Landed] = function() -- Line: 236 -- upvalues: stopPlayingLoopedSounds (val), rootPart (val), u168 (val), map (upval), playSound (upval)
        stopPlayingLoopedSounds()
        local v1 = math.abs(rootPart.AssemblyLinearVelocity.Y)
        if 75 < v1 then
            local v2 = map(v1, 50, 100, 0, 1)
            u168.Landing.Volume = math.clamp(v2, 0, 1)
            playSound(u168.Landing)
        end
    end
    u47[Enum.HumanoidStateType.Running] = function() -- Line: 245 -- upvalues: stopPlayingLoopedSounds (val), u168 (val), u45 (val)
        stopPlayingLoopedSounds(u168.Running)
        u168.Running.Playing = true
        u45[u168.Running] = true
    end
    u47[Enum.HumanoidStateType.Climbing] = function() -- Line: 251 -- upvalues: u168 (val), rootPart (val), UserSoundsUseRelativeVelocity2 (upval), getRelativeVelocity (upval), u10 (ref), stopPlayingLoopedSounds (val), u45 (val)
        local v1
        local Climbing = u168.Climbing
        local AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity
        if not UserSoundsUseRelativeVelocity2 then
            v1 = AssemblyLinearVelocity
        else
            v1 = getRelativeVelocity(u10, AssemblyLinearVelocity)
        end
        local v2 = math.abs(v1.Y)
        if 0.1 >= v2 then
            stopPlayingLoopedSounds()
        else
            Climbing.Playing = true
            stopPlayingLoopedSounds(Climbing)
        end
        u45[Climbing] = true
    end
    u47[Enum.HumanoidStateType.Seated] = function() -- Line: 266 -- upvalues: stopPlayingLoopedSounds (val)
        stopPlayingLoopedSounds()
    end
    u47[Enum.HumanoidStateType.Dead] = function() -- Line: 270 -- upvalues: stopPlayingLoopedSounds (val), playSound (upval), u168 (val)
        stopPlayingLoopedSounds()
        playSound(u168.Died)
    end
    local u70 = {}
    u70[u168.Climbing] = function(p1, p2, p3) -- Line: 278 -- upvalues: UserSoundsUseRelativeVelocity2 (upval), getRelativeVelocity (upval), u10 (ref)
        local v1
        if not UserSoundsUseRelativeVelocity2 then
            v1 = p3
        else
            v1 = getRelativeVelocity(u10, p3)
        end
        local v2 = 0.1 < v1.Magnitude
        p2.Playing = v2
    end
    u70[u168.FreeFalling] = function(p1, p2, p3) -- Line: 283
        if 75 < p3.Magnitude then
            p2.Volume = math.clamp(p2.Volume + p1 * 0.9, 0, 1)
            return
        end
        p2.Volume = 0
    end
    u70[u168.Running] = function(p1, p2, p3) -- Line: 291 -- upvalues: humanoid (val), map (upval)
        local v1 = if 0.5 < p3.Magnitude then 0.5 < humanoid.MoveDirection.Magnitude else false
        p2.Playing = v1
        if v1 then
            local v2 = map(p3.Magnitude, 14, 30, 0.9, 1.5)
            p2.PlaybackSpeed = math.clamp(v2, 0.9, 1.5)
        end
    end
    local u78 = {}
    u78[Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    local State = u78[humanoid:GetState()]
    if not State then
        State = humanoid:GetState()
    end
    local function transitionTo(p1) -- Line: 316 -- upvalues: u47 (val), State (ref)
        local v1 = u47[p1]
        if v1 then
            v1()
        end
        State = p1
    end
    transitionTo(State)
    local PropertyChangedSignal = humanoid:GetPropertyChangedSignal("FloorMaterial")
    local u103 = PropertyChangedSignal:Connect(function() -- Line: 329 -- upvalues: applySound (upval), u168 (val), humanoid (val)
        applySound(u168.Running, "Running", humanoid.FloorMaterial)
    end)
    task.spawn(applySound, u168.Running, "Running", humanoid.FloorMaterial)
    u83[u168.Running] = true
    local u118 = humanoid.StateChanged:Connect(function(p1, p2) -- Line: 339 -- upvalues: u78 (val), State (ref), transitionTo (val)
        local v1 = u78[p2] or p2
        if v1 ~= State then
            transitionTo(v1)
        end
    end)
    local u127 = RunService.Stepped:Connect(function(p1, p2) -- Line: 347 -- upvalues: u45 (val), u70 (val), rootPart (val)
        local v1
        for k in pairs(u45) do
            v1 = u70[k]
            if v1 then
                v1(p2, k, rootPart.AssemblyLinearVelocity)
            end
        end
    end)
    return function() -- Line: 358 -- upvalues: u103 (val), u83 (upval), u168 (val), u118 (val), u127 (val), u44 (val)
        u103:Disconnect()
        u83[u168.Running] = nil
        u118:Disconnect()
        u127:Disconnect()
        u44:Disconnect()
        for k, v in pairs(u168) do
            v:Destroy()
        end
        table.clear(u168)
    end
end)
local u109 = {}
local function characterAdded(p1) -- Line: 390 -- upvalues: u108 (val)
    u108:bindRoot(p1)
end
local function characterRemoving(p1) -- Line: 394 -- upvalues: u108 (val)
    u108:unbindRoot(p1)
end
local function playerAdded(p1) -- Line: 398 -- upvalues: u109 (val), characterAdded (val), characterRemoving (val)
    local v1 = u109[p1]
    if not v1 then
        u109[p1] = {}
    end
    if p1.Character then
        characterAdded(p1.Character)
    end
    table.insert(v1, p1.CharacterAdded:Connect(characterAdded))
    table.insert(v1, p1.CharacterRemoving:Connect(characterRemoving))
end
for i, v in ipairs(Alive.getPlayers()) do
    task.spawn(playerAdded, v)
end
Alive.PlayerAdded:Connect(playerAdded)
Alive.PlayerRemoving:Connect(function(p1) -- Line: 412 -- upvalues: u109 (val), characterRemoving (val)
    local v1 = u109[p1]
    if v1 then
        for i, v in ipairs(v1) do
            v:Disconnect()
        end
        u109[p1] = nil
    end
    if p1.Character then
        characterRemoving(p1.Character)
    end
end)
;(function() -- Line: 430 -- upvalues: Alive (val)
    local PlayerScripts = Alive.LocalPlayer:WaitForChild("PlayerScripts")
    local RbxCharacterSounds = PlayerScripts:WaitForChild("RbxCharacterSounds")
    if RbxCharacterSounds then
        RbxCharacterSounds:Destroy()
    end
    PlayerScripts.ChildAdded:Connect(function(p1) -- Line: 438
        if p1.Name == "RbxCharacterSounds" then
            p1:Destroy()
        end
    end)
end)()
ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 455 -- upvalues: u82 (ref), updateFootstepVolumes (val)
    if p1 == "Footstep Volume" and typeof(p2) == "number" then
        u82 = p2
        updateFootstepVolumes()
    end
end)
task.spawn(function() -- Line: 463 -- upvalues: ClientSettingsHandler (val), u82 (ref), updateFootstepVolumes (val)
    while not (ClientSettingsHandler.isSettingsLoaded()) do
        task.wait(0.1)
    end
    local v1 = ClientSettingsHandler.getSettingFromName("Footstep Volume")
    if v1 and typeof(v1) == "number" then
        u82 = v1
        updateFootstepVolumes()
    end
end)
return {}