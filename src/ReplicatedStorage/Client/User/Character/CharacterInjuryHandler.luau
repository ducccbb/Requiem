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
--         File: ReplicatedStorage.Client.User.Character.CharacterInjuryHandler
--                               Dumped in 0.00400 seconds
--                          Bytecode version 9  |  39 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Gore = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Gore")
local Ground = Gore:WaitForChild("Ground")
local Droplet = Gore:WaitForChild("Blood"):WaitForChild("Droplet")
local Folder = Instance.new("Folder")
Folder.Name = "BloodParticles"
Folder.Parent = workspace
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Injured = require(Animations:WaitForChild("Injured"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Injuries = require(Types:WaitForChild("Injuries"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network = require(Common_4:WaitForChild("Network"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_8:WaitForChild("Packages")
local v3 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Observers = Common_7:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local useAnimatorObserver_2 = useAnimatorObserver.useAnimatorObserver
local State = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local State_2 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_8:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics_2 = Common_9:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local u273 = nil
local u274 = nil
local u275 = nil
local u276 = nil
local u277 = nil
local u278 = nil
local u279 = nil
local u280 = nil
local u281 = nil
local LIMPING_THRESHOLD = Injuries.LIMPING_THRESHOLD
local u287 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u292 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local u297 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u302 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local u307 = Vector3.new(0.01, 0.01, 0.01)
local u308 = {}
local u309 = {}
local u311 = v3.new()
local u312 = true
local function alignToSurface(p1, p2, p3) -- Line: 232
    local v1
    local yAxis = Vector3.yAxis
    local Unit = p2.Unit
    local v2 = yAxis:Cross(Unit)
    if v2.Magnitude >= 0.0001 then
        local v3 = yAxis:Dot(Unit)
        local v4 = math.acos((math.clamp(v3, -1, 1)))
        v1 = CFrame.fromAxisAngle(v2.Unit, v4)
    elseif Unit.Y >= 0 then
        v1 = CFrame.new()
    else
        v1 = CFrame.Angles(math.pi, 0, 0)
    end
    local v5 = CFrame.new(p1) * v1
    return v5 * CFrame.Angles(0, p3, 0)
end
local function isOnFlatSurface(p1, p2, p3, p4) -- Line: 272 -- upvalues: alignToSurface (val)
    local v1, v2, v3
    local v4 = RaycastParams.new()
    v4.FilterType = Enum.RaycastFilterType.Exclude
    local v5 = p4
    if not v5 then
        v5 = {}
    end
    v4.FilterDescendantsInstances = v5
    v4.IgnoreWater = true
    v5 = p1 + Vector3.yAxis * 2
    local v6 = Vector3.new(0, -8, 0)
    local v7 = workspace:Raycast(v5, v6, v4)
    if not v7 then
        return false, nil, nil
    end
    local Normal = v7.Normal
    local v8 = alignToSurface(v7.Position, Normal, p3)
    local v9 = p2.X / 2
    local v10 = p2.Z / 2
    local v11 = {}
    local v12 = v8 * Vector3.new(-v9, 0, -v10)
    local v13 = v8 * Vector3.new(v9, 0, -v10)
    local v14 = v8 * Vector3.new(v9, 0, v10)
    v11[1] = v12
    v11[2] = v13
    v11[3] = v14
    v11[4] = v8 * Vector3.new(-v9, 0, v10)
    local zero = Vector3.zero
    local v15 = v11
    local v16 = nil
    local v17 = nil
    for i, j in v15, v16, v17 do
        v1 = workspace:Raycast(j + Normal * 2, -Normal * 8, v4)
        if not v1 or 0.05 < (v1.Normal - Normal).Magnitude then
            return false, nil, nil
        end
        v3 = v1.Position - v7.Position
        v2 = math.abs((v3:Dot(Normal.Unit)))
        if 0.4 < v2 then
            return false, nil, nil
        end
        zero = zero + v1.Position
    end
    return true, zero / #v11, Normal
end
local function cancelBloodTween(p1) -- Line: 361
    local tween = p1.tween
    if not tween then
        return
    end
    p1.tween = nil
    tween:Cancel()
end
local function cancelDropletTweens(p1) -- Line: 383
    local dropletTweens = p1.dropletTweens
    if not dropletTweens then
        return
    end
    p1.dropletTweens = nil
    local v1 = dropletTweens
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        j:Cancel()
    end
end
local function renderBloodDroplets(p1) -- Line: 407 -- upvalues: cancelDropletTweens (val), Droplet (val), u307 (val), Folder (val), TweenService (val), u297 (val)
    local v1, v2, v3, v4
    local droplets = p1.droplets
    if not droplets or #droplets == 0 then
        return
    end
    cancelDropletTweens(p1)
    local dropletInstances = p1.dropletInstances
    if not dropletInstances then
        dropletInstances = {}
    end
    if not p1.dropletInstances then
        local v5
        v1 = droplets
        v2 = nil
        v3 = nil
        for i, j in v1, v2, v3 do
            v5 = Droplet:Clone()
            v5.Size = u307
            v5:PivotTo(j.cframe)
            v5.Parent = Folder
            table.insert(dropletInstances, v5)
        end
        p1.dropletInstances = dropletInstances
    end
    v1 = {}
    v2 = dropletInstances
    v3 = nil
    local v6 = nil
    for k, n in v2, v3, v6 do
        v4 = droplets[k]
        if v4 then
            local u61 = TweenService:Create(n, u297, {Size = v4.size})
            u61.Completed:Once(function() -- Line: 446 -- upvalues: u61 (val)
                u61:Destroy()
            end)
            u61:Play()
            table.insert(v1, u61)
        end
    end
    p1.dropletTweens = v1
end
local function despawnBloodDroplets(p1) -- Line: 467 -- upvalues: cancelDropletTweens (val), TweenService (val), u302 (val)
    cancelDropletTweens(p1)
    local dropletInstances = p1.dropletInstances
    if not dropletInstances or #dropletInstances == 0 then
        return
    end
    local u6 = #dropletInstances
    local u7 = 0
    local v1 = {}
    local v2 = dropletInstances
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        local u28 = TweenService:Create(j, u302, {Size = Vector3.zero})
        u28.Completed:Once(function(a1) -- Line: 486 -- upvalues: j (val), u7 (ref), u6 (val), p1 (val), dropletInstances (val), u28 (val)
            if a1 == Enum.PlaybackState.Completed then
                j:Destroy()
                u7 = u7 + 1
                if u7 == u6 and p1.dropletInstances == dropletInstances then
                    p1.dropletInstances = nil
                end
            end
            u28:Destroy()
        end)
        u28:Play()
        table.insert(v1, u28)
    end
    p1.dropletTweens = v1
end
local function onRenderBloodParticle(p1) -- Line: 519 -- upvalues: cancelBloodTween (val), Ground (val), Folder (val), TweenService (val), u287 (val), renderBloodDroplets (val)
    local Decal_2, u42
    local Object = p1.Object
    local client = Object.client
    if not client then
        return
    end
    cancelBloodTween(Object)
    local instance = Object.instance
    if instance then
        Decal_2 = instance:FindFirstChildWhichIsA("Decal")
        if not Decal_2 then
            return
        end
        u42 = TweenService:Create(Decal_2, u287, {Transparency = 0})
        Object.tween = u42
        u42.Completed:Once(function() -- Line: 575 -- upvalues: Object (val), u42 (val)
            if Object.tween == u42 then
                Object.tween = nil
            end
            u42:Destroy()
        end)
        u42:Play()
        renderBloodDroplets(Object)
        return
    end
    local v1 = Ground:FindFirstChild((tostring(client.variant)))
    if not v1 then
        return
    end
    local v2 = v1:Clone()
    v2.Size = client.size
    v2:PivotTo(client.cframe)
    v2.Parent = Folder
    Object.instance = v2
    local Decal = v2:FindFirstChildWhichIsA("Decal")
    if Decal then
        Decal.Transparency = 1
    end
    Decal_2 = v2:FindFirstChildWhichIsA("Decal")
    if not Decal_2 then
        return
    end
    u42 = TweenService:Create(Decal_2, u287, {Transparency = 0})
    Object.tween = u42
    u42.Completed:Once(function() -- Line: 575 -- upvalues: Object (val), u42 (val)
        if Object.tween == u42 then
            Object.tween = nil
        end
        u42:Destroy()
    end)
    u42:Play()
    renderBloodDroplets(Object)
end
local function onDeleteBloodParticle(p1) -- Line: 597 -- upvalues: cancelBloodTween (val), despawnBloodDroplets (val), TweenService (val), u292 (val)
    local Object = p1.Object
    cancelBloodTween(Object)
    despawnBloodDroplets(Object)
    local instance = Object.instance
    if not instance then
        return
    end
    local Decal = instance:FindFirstChildWhichIsA("Decal")
    if not Decal then
        instance:Destroy()
        Object.instance = nil
        return
    end
    local u23 = TweenService:Create(Decal, u292, {Transparency = 1})
    Object.tween = u23
    u23.Completed:Once(function(p1) -- Line: 629 -- upvalues: Object (val), instance (val), u23 (val)
        if p1 == Enum.PlaybackState.Completed and Object.instance == instance then
            instance:Destroy()
            Object.instance = nil
        end
        if Object.tween == u23 then
            Object.tween = nil
        end
        u23:Destroy()
    end)
    u23:Play()
end
local function removeBloodNode(p1) -- Line: 657 -- upvalues: u309 (val), u308 (ref), onDeleteBloodParticle (val), u311 (val)
    if not (u309[p1]) then
        return
    end
    u309[p1] = nil
    if u308[p1] then
        onDeleteBloodParticle(p1)
        u308[p1] = nil
    end
    u311:RemoveNode(p1)
end
local function clearAllBloodParticles() -- Line: 679 -- upvalues: u309 (val), removeBloodNode (val)
    local v1 = u309
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        removeBloodNode(i)
    end
end
local function onLoadBloodParticle(p1) -- Line: 690 -- upvalues: Ground (val), Folder (val), CollectionService (val), Character (val), isOnFlatSurface (val), alignToSurface (val), Droplet (val), u311 (val), u309 (val), removeBloodNode (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v13 = ServerTimeNow - p1.time
    if 120 <= v13 then
        return
    end
    local v14 = Random.new(p1.seed)
    local v15 = v14:NextInteger(1, 2)
    local v16 = v14:NextNumber(-180, 180)
    local v17 = v14:NextNumber(-180, 180)
    local v18 = Vector3.new(v16, v17, v14:NextNumber(-180, 180))
    v16 = Ground:FindFirstChild((tostring(v15)))
    if not v16 then
        return
    end
    v17 = p1.scale or 1
    local v19 = v14:NextNumber(1.5, 2.5) * v17
    local v20 = Vector3.new(v16.Size.X * v19, v16.Size.Y, v16.Size.Z * v19)
    local v21 = math.rad(v18.Y)
    local v22 = {Folder, CollectionService:GetTagged("Alive")}
    local v23 = Character.getCharacter()
    if v23 then
        table.insert(v22, v23)
    end
    v2, v3, v4 = isOnFlatSurface(p1.position, v20, v21, v22)
    if not v2 or not v3 or not v4 then
        return
    end
    local v24 = alignToSurface(v3, v4, v21)
    local v25 = math.max(1, (math.round(4 * v17)))
    local v26 = v14:NextInteger(v25, (math.max(v25, (math.round(8 * v17)))))
    local v27 = 2 * math.pi / v26
    local v28 = v14:NextNumber(0, 2 * math.pi)
    local v29 = v27 * 0.25
    local v30 = 0.5 * v17
    local v31 = 1.75 * v17
    local RightVector = v24.RightVector
    local LookVector = v24.LookVector
    local v32 = RaycastParams.new()
    v32.FilterType = Enum.RaycastFilterType.Exclude
    v32.FilterDescendantsInstances = v22
    v32.IgnoreWater = true
    local v33 = {}
    local v34 = v26
    local v35 = 1
    for i = 1, v34, v35 do
        v5 = v28 + (i - 1) * v27 + v14:NextNumber(-v29, v29)
        v6 = v14:NextNumber(v30, v31)
        v7 = v14:NextNumber(0.7, 2.75)
        v8 = v14:NextNumber(0, 2 * math.pi)
        v10 = v3 + RightVector * (math.cos(v5) * v6)
        v9 = v10 + LookVector * (math.sin(v5) * v6)
        v10 = v9 + Vector3.yAxis * 4
        v11 = Vector3.new(0, -12, 0)
        v12 = workspace:Raycast(v10, v11, v32)
        if v12 then
            table.insert(v33, {cframe = alignToSurface(v12.Position, v12.Normal, v8), size = Droplet.Size * v7 * v17})
        end
    end
    local u259 = u311:CreateNode(v24.Position, {
        server = v1,
        client = {cframe = v24, size = v20, variant = v15},
        droplets = v33,
    })
    u309[u259] = true
    task.delay(120 - v13, function() -- Line: 824 -- upvalues: removeBloodNode (upval), u259 (val)
        removeBloodNode(u259)
    end)
end
local function clearActiveBloodNodes() -- Line: 836 -- upvalues: u308 (ref), onDeleteBloodParticle (val)
    if not (next(u308)) then
        return
    end
    local v1 = u308
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        onDeleteBloodParticle(i)
    end
    table.clear(u308)
end
local function onBloodRecieved(p1) -- Line: 903 -- upvalues: onLoadBloodParticle (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        onLoadBloodParticle(j)
    end
end
local function updateLimpingState(p1) -- Line: 916 -- upvalues: u273 (ref), u278 (ref), Table (val), u279 (ref), u280 (ref), u281 (ref), ClientStateHandler (val), LIMPING_THRESHOLD (val), useAnimatorObserver_2 (val), u274 (ref), useWalkSpeed (val), useJumpPower (val), u275 (ref), u276 (ref), useAnimatorObserver (val), Injured (val)
    local limbs, v1, v2
    if u273 then
        u273()
    end
    u278 = p1
    v1 = Table.find(p1.limbs, function(p1) -- Line: 925
        local v1 = p1.name == "Left Arm"
        return v1
    end)
    local v3 = Table.find(p1.limbs, function(p1) -- Line: 930
        local v1 = p1.name == "Right Arm"
        return v1
    end)
    local v4 = Table.find(p1.limbs, function(p1) -- Line: 935
        local v1 = p1.name == "Left Leg"
        return v1
    end)
    local v5 = Table.find(p1.limbs, function(p1) -- Line: 940
        local v1 = p1.name == "Right Leg"
        return v1
    end)
    if v3 and v1 then
        v2 = 50 < p1.limbs[v1].health
        u279 = v2
        v2 = 50 < p1.limbs[v3].health
        u280 = v2
    end
    if v4 and v5 then
        v2 = if 50 < p1.limbs[v4].health then 50 < p1.limbs[v5].health else false
        u281 = v2
    end
    v2 = 0
    limbs = p1.limbs
    local v6 = nil
    local v7 = nil
    for i, j in limbs, v6, v7 do
        v2 = v2 + j.health
    end
    local v8 = ClientStateHandler.isStateBusy(ClientStateHandler.States.LIMPING)
    local v9 = v2 < LIMPING_THRESHOLD
    ClientStateHandler.updateState(ClientStateHandler.States.LIMPING, v9)
    if v8 == ClientStateHandler.isStateBusy(ClientStateHandler.States.LIMPING) then
        return
    end
    if v2 < LIMPING_THRESHOLD then
        u273 = useAnimatorObserver_2(function(p1, p2) -- Line: 968 -- upvalues: u274 (upval), useWalkSpeed (upval), useJumpPower (upval), u275 (upval), u276 (upval), useAnimatorObserver (upval), Injured (upval)
            local v1, v2
            if u274 then
                u274()
            end
            _, v1 = useWalkSpeed()
            _, v2 = useJumpPower()
            if not p1 or not p2 or not (p2:WaitForChild("Humanoid")) then
                return
            end
            u275 = v1("injured", 8, "set", 50, TweenInfo.new(0.2))
            u276 = v2("injured", 0, "set", 50, TweenInfo.new(0.2))
            u274 = useAnimatorObserver.bind(p1, Injured, 4)
            return function() end
        end)
        return
    end
    if u273 then
        u273()
    end
    if u274 then
        u274()
    end
    if u275 then
        u275()
    end
    if u276 then
        u276()
    end
end
local function observeClientInjuriesChanged(p1) -- Line: 1016 -- upvalues: updateLimpingState (val)
    updateLimpingState(p1)
end
local function loadClientInjuries(p1) -- Line: 1025 -- upvalues: updateLimpingState (val)
    updateLimpingState(p1)
end
local function setBloodEnabled(p1) -- Line: 1037 -- upvalues: u312 (ref), clearActiveBloodNodes (val)
    if p1 == u312 then
        return
    end
    u312 = p1
    if not p1 then
        clearActiveBloodNodes()
    end
end
Network.loaded:andThen(function() -- Line: 1085 -- upvalues: Vitality (val), Players (val), loadClientInjuries (val), observeClientInjuriesChanged (val), ClientSettingsHandler (val), setBloodEnabled (val)
    local u5 = Vitality.Store.get(Players.LocalPlayer)
    if u5 then
        loadClientInjuries(u5)
    end
    Vitality.Store.observe(Players.LocalPlayer, function() -- Line: 1095 -- upvalues: u5 (ref), Vitality (upval), Players (upval), observeClientInjuriesChanged (upval)
        u5 = Vitality.Store.get(Players.LocalPlayer)
        observeClientInjuriesChanged(u5)
    end)
    local v1 = ClientSettingsHandler.getSettingFromName("Blood Enabled")
    if typeof(v1) == "boolean" then
        setBloodEnabled(v1)
    end
    ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 1110 -- upvalues: setBloodEnabled (upval)
        if p1 ~= "Blood Enabled" then
            return
        end
        local v1 = p2 == true
        setBloodEnabled(v1)
    end)
    Vitality.Blood.post()
end)
Vitality.Blood.listen(function(p1, p2) -- Line: 1123 -- upvalues: onBloodRecieved (val), onLoadBloodParticle (val), clearAllBloodParticles (val)
    if p1 == 1 then
        onBloodRecieved(p2)
        return
    end
    if p1 == 2 then
        onLoadBloodParticle(p2)
        return
    end
    if p1 == 3 then
        clearAllBloodParticles()
    end
end)
ClientStateHandler.onServerStateChanged(ClientStateHandler.Server.RESURRECTING):Connect(function(p1) -- Line: 1054 -- upvalues: ClientStateHandler (val), u277 (ref), useWalkSpeed (val), useJumpPower (val)
    local v1, v2
    ClientStateHandler.updateState(ClientStateHandler.States.RESURRECTING, p1)
    if u277 then
        u277()
        u277 = nil
    end
    if not p1 then
        return
    end
    _, v1 = useWalkSpeed()
    _, v2 = useJumpPower()
    local u24 = v1("resurrecting", 0, "set", 500)
    local u30 = v2("resurrecting", 0, "set", 500)
    function u277() -- Line: 1077 -- upvalues: u24 (val), u30 (val)
        u24()
        u30()
    end
end)
RunService.RenderStepped:Connect(function() -- Line: 851 -- upvalues: u312 (ref), clearActiveBloodNodes (val), Character (val), u311 (val), u308 (ref), onRenderBloodParticle (val), onDeleteBloodParticle (val)
    if not u312 then
        clearActiveBloodNodes()
        return
    end
    local v1 = Character.getCharacter()
    if not v1 then
        clearActiveBloodNodes()
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = u311:SearchRadius(HumanoidRootPart.Position, 125)
    local v3 = {}
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j] = true
        if not (u308[j]) then
            onRenderBloodParticle(j)
        end
    end
    v4 = u308
    v5 = nil
    v6 = nil
    for k in v4, v5, v6 do
        if not (v3[k]) then
            onDeleteBloodParticle(k)
        end
    end
    u308 = v3
end)
return {
    getInjuries = function() -- Line: 1142 -- upvalues: u278 (ref)
        return u278
    end,
    getCanUseGrapples = function() -- Line: 1146 -- upvalues: u279 (ref), u280 (ref)
        return u279, u280
    end,
    getCanSafelyMount = function() -- Line: 1150 -- upvalues: u281 (ref)
        return u281
    end,
}