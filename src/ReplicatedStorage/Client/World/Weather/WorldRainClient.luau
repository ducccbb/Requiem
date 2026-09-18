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
--             File: ReplicatedStorage.Client.World.Weather.WorldRainClient
--                               Dumped in 0.00229 seconds
--                          Bytecode version 9  |  15 functions

local u130, u131
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Pool = require(Common:WaitForChild("Pool"))
local User = v1.Parent.Parent.Parent:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local WorldRainBlurClient = require(v1.Parent:WaitForChild("WorldRainBlurClient"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
u130, u131 = require(Utilities_2:WaitForChild("useNumberEasing"))(0)
local u135 = NumberRange.new(0.8, 1.2)
local u136 = {}
local v3 = Vector2.new(-5, 5)
local v4 = Vector2.new(-5, -5)
local v5 = Vector2.new(5, 5)
u136[1] = v3
u136[2] = v4
u136[3] = v5
u136[4] = Vector2.new(5, -5)
workspace.GlobalWind = Vector3.new(0.01, 0, 0.01)
local u159 = nil
local u160 = {}
local u161 = nil
local Folder = Instance.new("Folder")
Folder.Name = "Rain"
Folder.Parent = workspace
local u167 = 0
local u168 = false
local u169 = {}
local u170 = 0
local u172 = RaycastParams.new()
u172.FilterType = Enum.RaycastFilterType.Exclude
local u174 = nil
local function getRainDropletPart() -- Line: 110 -- upvalues: u159 (ref), Folder (val), Pool (val)
    if not u159 then
        local Part = Instance.new("Part")
        Part.Name = "Droplet"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CastShadow = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Massless = true
        Part.Transparency = 0.9
        Part.Size = Vector3.new(0.1, 4, 0.1)
        Part.Material = Enum.Material.Neon
        Part.Color = Color3.fromRGB(172, 176, 202)
        Part.Parent = Folder
        u159 = Pool.create(Part, 450)
        Part:Destroy()
    end
    return (Pool.get(u159))
end
local function onCancelThreads() -- Line: 153 -- upvalues: u169 (ref)
    local v1 = u169
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        task.cancel(j)
    end
    u169 = {}
end
local function onDestroyRainDroplet(p1) -- Line: 166 -- upvalues: u160 (ref), Pool (val), u159 (ref)
    p1.alive = false
    table.remove(u160, table.find(u160, p1))
    Pool.returnObject(u159, p1.part)
end
local function _getPointFromRadius(p1, p2) -- Line: 190
    local v1 = math.random() * math.pi * 2
    local v2 = math.random(p1 * 100, p2 * 100) / 100
    local v3 = math.cos(v1) * v2
    return v3, math.sin(v1) * v2
end
local function onCreateRaindropSplash(p1) -- Line: 202 -- upvalues: u136 (val), getRainDropletPart (val), Folder (val), u167 (ref), Pool (val), u159 (ref)
    local v1, v2, v3, v4
    local v5 = math.rad((math.random(-180, 180)))
    local v6 = CFrame.Angles(0, v5, 0)
    local u11 = {}
    v5 = 4
    local v7 = 1
    for i = 1, v5, v7 do
        v3 = u136[i]
        v4 = getRainDropletPart()
        v4.Size = Vector3.new(0.15, 0.15, 0.15)
        v4.CFrame = CFrame.new(p1.origin.X, p1.ground, p1.origin.Z) * v6
        v4.AssemblyLinearVelocity = v6:VectorToWorldSpace((Vector3.new(v3.X, 20, v3.Y)))
        v1 = math.random(-50, 50)
        v2 = math.random(-50, 50)
        v4.AssemblyAngularVelocity = Vector3.new(v1, v2, math.random(-50, 50))
        v4.Anchored = false
        v4.Parent = Folder
        u167 = u167 + 1
        table.insert(u11, v4)
    end
    task.delay(0.5, function() -- Line: 232 -- upvalues: u11 (val), Pool (upval), u159 (upval), u167 (upval)
        local v1 = u11
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j.Anchored = true
            Pool.returnObject(u159, j)
            u167 = u167 - 1
        end
    end)
end
local function onUpdateRainDroplet(p1, p2, p3) -- Line: 252 -- upvalues: onDestroyRainDroplet (val), ClientSettingsHandler (val), u167 (ref), onCreateRaindropSplash (val)
    p1.elapsed = p1.elapsed + p2
    local v1 = CFrame.new(p1.origin, p1.origin + p1.direction)
    local v2 = math.rad(90)
    local v3 = v1 * CFrame.Angles(v2, 0, 0)
    v3 = v3 * CFrame.new(0, -p1.elapsed * 150 * p1.speed, 0)
    v1 = math.clamp(1 - (p1.ground - v3.Position.Y) / (p1.ground - p1.origin.Y), 0, 1)
    local Magnitude = (v3.Position - p3.Position).Magnitude
    local v4 = false
    local v5 = (v3.Position - p3.Position):Dot(p3.LookVector)
    if 0 < v5 then
        v4 = 15 < Magnitude
    end
    p1.part.CFrame = v3
    if not v4 then
        return onDestroyRainDroplet(p1)
    end
    if v1 <= 0.2 then
        v5 = 1 - v1 / 0.2 * 0.09999999999999998
    elseif 0.8 > v1 then
        v5 = 0.9
    else
        v5 = (v1 - 0.8) / 0.2 * 0.09999999999999998 + 0.9
    end
    p1.part.Transparency = v5
    if v3.Position.Y < p1.ground then
        local v6 = math.floor((ClientSettingsHandler.getSettingFromName("Rain Detail")))
        if Magnitude < 300 and v4 and math.random() < 0.25 and u167 < math.clamp(v6, 0, 100) / 100 * 100 and 0.99 <= v1 and p1.isSplashable then
            onCreateRaindropSplash(p1)
        end
        onDestroyRainDroplet(p1)
    elseif 1 > v1 and 300 >= Magnitude and Magnitude >= 5 and p1.dead then
        local v7 = os.time() - p1.dead
        if 3 >= v7 then end
    end
end
local function onCreateRainDroplet(p1) -- Line: 330 -- upvalues: getRainDropletPart (val), Folder (val), u172 (val), CollectionService (val), Workspace (val), u135 (val), u160 (ref)
    local Y, v1
    local v2 = getRainDropletPart()
    local v3 = 0.1 * math.random(60, 100) / 100
    local v4 = 4 * math.random(80, 130) / 100
    v2.Size = Vector3.new(v3, v4, 0.1 * math.random(60, 100) / 100)
    v2.Anchored = true
    v2.Parent = Folder
    local v5 = math.random(5, 70)
    local v6 = math.random(-70, 70)
    local v7 = p1.Position + p1.LookVector * v5
    local v8 = v7 + p1.RightVector * v6
    local v9 = v8 + p1.UpVector * math.random(-10, 10)
    local v10 = v9 + Vector3.new(0, 100, 0)
    v9 = workspace.GlobalWind.Unit * workspace.GlobalWind.Magnitude * 0.3
    if v9.X ~= v9.X then
        v8 = 1
    else
        v8 = math.clamp(v9.X, -1, 1)
    end
    if v9.Z ~= v9.Z then
        v7 = 1
    else
        v7 = math.clamp(v9.Z, -1, 1)
    end
    local v11 = Vector3.new(v8, -1, v7)
    u172.FilterDescendantsInstances = {Folder, CollectionService:GetTagged("Alive")}
    local v12 = Workspace:Raycast(v10, v11 * 200, u172)
    local v13 = math.random(u135.Min * 100, u135.Max * 100) / 100
    local v14 = {
        alive = true,
        elapsed = 0,
        origin = v10,
        direction = v11,
        part = v2,
    }
    if not v12 then
        Y = -200
    else
        Y = v12.Position.Y
    end
    v14.ground = Y
    if not v12 then
        v1 = false
    else
        v1 = not (not v12.Position)
    end
    v14.isSplashable = v1
    v14.speed = v13
    v14.updateFrame = math.random(0, 1)
    table.insert(u160, v14)
end
local function onDestroyRain() -- Line: 407 -- upvalues: u161 (ref), u160 (ref), onDestroyRainDroplet (val), u167 (ref)
    if u161 then
        u161:Disconnect()
        u161 = nil
    end
    local v1 = #u160
    if 0 < v1 then
        v1 = u160
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            onDestroyRainDroplet(j)
        end
        u160 = {}
    end
    u167 = 0
end
return {
    begin = function() -- Line: 440 -- upvalues: Workspace (val), u168 (ref), onCancelThreads (val), u160 (ref), Pool (val), u159 (ref), onDestroyRain (val), u131 (val), WorldRainBlurClient (val), u174 (ref), Sounds (val), Universal (val), ClientSettingsHandler (val), u130 (val), onCreateRainDroplet (val), u161 (ref), RunService (val), u170 (ref), onUpdateRainDroplet (val)
        local CurrentCamera = Workspace.CurrentCamera
        u168 = true
        onCancelThreads()
        local v1 = u160
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            Pool.returnObject(u159, j.part)
        end
        u160 = {}
        onDestroyRain()
        u131(1, TweenInfo.new(10, Enum.EasingStyle.Linear))
        WorldRainBlurClient.begin()
        u174 = Sounds.playGlobalSoundEffect(Universal.Rain, 10, 0.4)
        u174.Looped = true
        local function onSpawnRainDroplets(p1) -- Line: 471 -- upvalues: ClientSettingsHandler (upval), u130 (upval), u160 (upval), onCreateRainDroplet (upval)
            local v1 = math.floor((ClientSettingsHandler.getSettingFromName("Rain Detail")))
            local v2 = math.clamp(v1, 0, 100) / 100 * 300 * u130()
            local v3 = math.min(v2 - #u160, v2)
            local v4 = 1
            for i = 1, v3, v4 do
                onCreateRainDroplet(p1)
            end
        end
        u161 = RunService.Heartbeat:Connect(function(p1) -- Line: 492 -- upvalues: CurrentCamera (val), u168 (upval), onSpawnRainDroplets (val), u170 (upval), u160 (upval), onUpdateRainDroplet (upval)
            local CFrame = CurrentCamera.CFrame
            if u168 then
                onSpawnRainDroplets(CFrame)
            end
            u170 = (u170 + 1) % 2
            local v1 = u160
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.updateFrame == u170 then
                    onUpdateRainDroplet(j, p1 * 2, CFrame)
                end
            end
        end)
    end,
    stop = function() -- Line: 538 -- upvalues: u168 (ref), u131 (val), WorldRainBlurClient (val), onCancelThreads (val), u169 (ref), onDestroyRain (val), u160 (ref), u174 (ref), TweenService (val)
        u168 = false
        u131(1, TweenInfo.new(10, Enum.EasingStyle.Linear))
        WorldRainBlurClient.stop()
        onCancelThreads()
        table.insert(u169, task.delay(3, onDestroyRain))
        local v1 = u160
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j.dead = os.time()
        end
        if u174 then
            local v4 = TweenInfo.new(10, Enum.EasingStyle.Linear)
            TweenService:Create(u174, v4, {Volume = 0}):Play()
            table.insert(u169, task.delay(10, function() -- Line: 567 -- upvalues: u174 (upval)
                u174:Stop()
                u174:Destroy()
            end))
        end
    end,
}