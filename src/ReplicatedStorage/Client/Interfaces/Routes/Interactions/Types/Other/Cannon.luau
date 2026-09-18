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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Other.Cannon
--                               Dumped in 0.00944 seconds
--                          Bytecode version 9  |  51 functions

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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces_2:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_3 = Common_4:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Cannons = require(Namespaces_3:WaitForChild("Cannons"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Cannons_2 = require(Sounds_2:WaitForChild("Cannons"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Observers = Common_9:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_11:WaitForChild("Client")
local Progression = Client_2:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_12:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_13:WaitForChild("Common")
local Animations = Common_10:WaitForChild("Animations")
local Cannons_3 = require(Animations:WaitForChild("Cannons"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_14:WaitForChild("Common")
local Network_4 = Common_11:WaitForChild("Network")
local Namespaces_4 = Network_4:WaitForChild("Namespaces")
local Certifications = require(Namespaces_4:WaitForChild("Certifications"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_15:WaitForChild("Common")
local Utilities_4 = Common_12:WaitForChild("Utilities")
local Character = require(Utilities_4:WaitForChild("Character"))
local v2 = {header = "Cannon", body = "Press \"%s\" to get onto the cannon."}
local function clientHasCannonsCertificate() -- Line: 49 -- upvalues: Certifications (val)
    local v1, v2, v3
    v1, v2 = pcall(function() -- Line: 50 -- upvalues: Certifications (upval)
        return Certifications.Store.client()
    end)
    if not v1 or type(v2) ~= "table" then
        return false
    end
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        if type(j) == "table" and type(j.name) == "string" then
            v3 = string.lower(j.name)
            if v3 == string.lower("Cannons") then
                return true
            end
        end
    end
    return false
end
local function normalizeYaw(p1) -- Line: 73
    local pi = math.pi
    local v1 = p1
    while pi < v1 do
        v1 = v1 - 2 * pi
    end
    while v1 < -pi do
        v1 = v1 + 2 * pi
    end
    return v1
end
local u343 = math.rad(35)
local u346 = math.rad(-45)
local u347 = false
local u348 = nil
local u349 = 0
local u350 = nil
local u351 = 0
local u352 = 0
local u353 = 0
local u354 = false
local u355 = {}
local u356 = nil
local u357 = {}
local u358 = 0
local u359 = 0
local u360 = 0
local u361 = nil
local u362 = false
local u363 = nil
local u364 = nil
local u365 = 0
local u366 = 0
local u367 = false
local u368 = false
local u369 = ""
local u370 = true
local u371 = 0
local u372 = nil
local u373 = nil
local u374 = nil
local u375 = {}
local u376 = {}
local u377 = nil
local u378 = 0
local u379 = nil
local function destroyPathPreview() -- Line: 145 -- upvalues: u374 (ref), u372 (ref), u373 (ref), u377 (ref), u378 (ref), u379 (ref), u375 (val), u376 (val)
    if u374 then
        u374:Destroy()
        u374 = nil
    end
    if u372 then
        u372:Destroy()
        u372 = nil
        u373 = nil
        u377 = nil
        u378 = 0
        u379 = nil
        table.clear(u375)
        table.clear(u376)
    end
end
local u381 = false
local u382 = false
local function getCannonBasePositionAndYaw(p1) -- Line: 167 -- upvalues: normalizeYaw (val)
    local Position, v1, v2
    local Pivot = p1:GetPivot()
    local Base = p1:FindFirstChild("Base")
    if not Base then
        _, v2 = Pivot:ToOrientation()
        v1 = v2
    elseif Base:IsA("BasePart") then
        _, v2 = Base.CFrame:ToEulerAnglesXYZ()
        v1 = v2
    end
    if not Base then
        Position = Pivot.Position
    elseif not (Base:IsA("BasePart")) then
        Position = Pivot.Position
    else
        Position = Base.Position
        if not Position then
            Position = Pivot.Position
        end
    end
    return Position, normalizeYaw(v1)
end
local function anchorCannonModel(p1) -- Line: 182
    if not p1.Parent then
        return
    end
    p1:PivotTo(p1:GetPivot())
    local Base = p1:FindFirstChild("Base")
    if Base and Base:IsA("BasePart") then
        Base.Anchored = true
        Base.CanCollide = true
    end
end
local function clearLocalCannonWelds() -- Line: 194 -- upvalues: Character (val)
    local v1 = Character.getCharacter()
    local HumanoidRootPart = v1
    if HumanoidRootPart then
        HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return
    end
    for i, j in HumanoidRootPart:GetChildren() do
        if j:IsA("Weld") and j.Name == "CannonWeld" then
            j:Destroy()
        end
    end
end
local function resetCannonControlState() -- Line: 207 -- upvalues: u347 (ref), u349 (ref), u350 (ref), u352 (ref), u353 (ref), u362 (ref), u367 (ref), u368 (ref), u359 (ref), u360 (ref), u369 (ref), u370 (ref), ClientStateHandler (val), States (val)
    u347 = false
    u349 = 0
    u350 = nil
    u352 = 0
    u353 = 0
    u362 = false
    u367 = false
    u368 = false
    u359 = 0
    u360 = 0
    u369 = ""
    u370 = true
    ClientStateHandler.updateState(States.CANNON_MOUNTED, false)
end
local function stopCannonPresentation() -- Line: 223 -- upvalues: u354 (ref), Cannons_2 (val), Sounds (val), u361 (ref), u356 (ref)
    if u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
        Sounds.stopGlobalSoundEffect(Cannons_2.Rotate, 0.3)
        u354 = false
    end
    if u361 then
        u361:Cancel()
        u361 = nil
    end
    if u356 then
        u356()
        u356 = nil
    end
end
local function disconnectCannonBindings() -- Line: 238 -- upvalues: u355 (val), u357 (ref), u358 (ref), destroyPathPreview (val)
    local v1 = u355
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j then
            j:Disconnect()
        end
    end
    table.clear(u355)
    table.clear(u357)
    u358 = 0
    destroyPathPreview()
end
local function isWeldedToCannon(p1, p2) -- Line: 250
    local CharacterPlacement = p1:FindFirstChild("CharacterPlacement")
    local HumanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
    if not CharacterPlacement or not HumanoidRootPart then
        return false
    end
    for i, j in HumanoidRootPart:GetChildren() do
        if j:IsA("Weld") and j.Part0 == CharacterPlacement then
            return true
        end
    end
    return false
end
local function completeCannonDismount() -- Line: 265 -- upvalues: clearLocalCannonWelds (val), u348 (ref), anchorCannonModel (val), u381 (ref)
    clearLocalCannonWelds()
    local v1 = u348
    if v1 and v1.Parent then
        anchorCannonModel(v1)
    end
    u348 = nil
    u381 = false
end
local function requestCannonDismount(p1) -- Line: 278 -- upvalues: u381 (ref), resetCannonControlState (val), stopCannonPresentation (val), disconnectCannonBindings (val), u348 (ref), completeCannonDismount (val), anchorCannonModel (val), getCannonBasePositionAndYaw (val), Cannons (val)
    local v1, v2
    if u381 then
        return
    end
    u381 = true
    resetCannonControlState()
    stopCannonPresentation()
    disconnectCannonBindings()
    local v3 = p1
    if not v3 then
        v3 = u348
    end
    if not v3 or not v3.Parent then
        completeCannonDismount()
        return
    end
    anchorCannonModel(v3)
    v1, v2 = getCannonBasePositionAndYaw(v3)
    Cannons.Event.post(v3, "Dismounted", v1, v2, nil)
    completeCannonDismount()
end
local function getBarrelPositionAndDirection(p1) -- Line: 301
    local v1
    local Base1 = p1:FindFirstChild("Base1")
    if not Base1 then
        return nil, nil
    end
    local Hull = Base1:FindFirstChild("Hull")
    if not Hull then
        return nil, nil
    end
    local Barrel = Hull:FindFirstChild("Barrel")
    if not Barrel then
        v1 = Base1.CFrame * Hull.C0
    else
        v1 = Base1.CFrame * Hull.C0 * Barrel.C0
        if not v1 then
            v1 = Base1.CFrame * Hull.C0
        end
    end
    return v1.Position, -v1.LookVector
end
local function simulateTrajectoryStep(p1, p2, p3, p4) -- Line: 320
    return p1 + p2 * p4, p2 + p3 * p4
end
local function computeCannonPath(p1, p2, p3) -- Line: 332 -- upvalues: Workspace (val), ClientAttributesHandler (val), Character (val), simulateTrajectoryStep (val)
    local v1, v2, v3
    local v4 = {}
    local v5 = Vector3.new(0, -Workspace.Gravity * 1, 0)
    local v6 = p2 * (450 * (ClientAttributesHandler.getAttribute("CannonVelocityMultiplier") or 1))
    local v7 = p1 + p2 * 1
    local v8 = v6
    local v9 = 0
    local v10 = RaycastParams.new()
    v10.FilterType = Enum.RaycastFilterType.Exclude
    local v11 = {}
    if p3 then
        table.insert(v11, p3)
    end
    local v12 = Character.getCharacter()
    if v12 then
        table.insert(v11, v12)
    end
    v10.FilterDescendantsInstances = v11
    table.insert(v4, v7)
    while v9 < 25 do
        v1 = v7
        v2, v3 = simulateTrajectoryStep(v7, v8, v5, 0.03)
        v7 = v2
        v8 = v3
        v9 = v9 + 0.03
        table.insert(v4, v7)
        v2 = v7 - v1
        if 0 < v2.Magnitude then
            v3 = Workspace:Spherecast(v1, 0.5, v2, v10)
            if v3 then
                table.insert(v4, v3.Position)
                return v4
            end
        end
    end
    return v4
end
local function playLocalCannonFireEffects(p1, p2, p3) -- Line: 381 -- upvalues: computeCannonPath (val), u378 (ref), u379 (ref), useAnimatorObserver (val), Cannons_3 (val), Particles (val), Shake (val), TweenService (val)
    local Part0
    if p2 and p3 then
        local v1 = computeCannonPath(p2, p3, p1)
        if 2 <= #v1 then
            u378 = os.clock() + 4
            u379 = v1[#v1]
        end
    end
    useAnimatorObserver.play(Cannons_3.Fire, 0.1)
    local Barrel = p1:FindFirstChild("Barrel")
    if not Barrel then
        return
    end
    local Attachment = Barrel:FindFirstChild("Attachment")
    if Attachment then
        Particles.deepEmitParticles(Attachment)
    end
    local CurrentCamera = workspace.CurrentCamera
    local v2 = Shake.new()
    v2.FadeInTime = 0.03
    v2.SustainTime = 0.4
    v2.FadeOutTime = 0.8
    v2.Frequency = 0.14
    v2.Amplitude = 3
    v2.RotationInfluence = Vector3.new(0.15, 0.15, 0.15)
    v2:Start()
    v2:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 415 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera.CFrame * CFrame.new(p1)
        CurrentCamera.CFrame = v1 * CFrame.Angles(p2.X, p2.Y, p2.Z)
    end)
    local Hull = p1
    if Hull then
        Hull = p1:FindFirstChild("Hull")
    end
    local Barrel_2 = Hull
    if Barrel_2 then
        Barrel_2 = Hull:FindFirstChild("Barrel")
    end
    if Barrel_2 and Barrel_2.Part0 then
        Part0 = Barrel_2.Part0
        local C0 = Barrel_2.C0
        local v3 = Part0.CFrame * C0
        local v4 = CFrame.new(v3.Position + v3.LookVector * 2)
        v4 = Part0.CFrame:Inverse() * (v4 * (v3 - v3.Position))
        local v5 = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local v6 = TweenService:Create(Barrel_2, v5, {C0 = v4})
        local v7 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local u115 = TweenService:Create(Barrel_2, v7, {C0 = C0})
        v6.Completed:Connect(function() -- Line: 439 -- upvalues: u115 (val)
            u115:Play()
        end)
        v6:Play()
    end
end
local function ensurePathPreviewModel() -- Line: 448 -- upvalues: u372 (ref), u375 (val), u376 (val), Workspace (val), u373 (ref), u374 (ref)
    if not u372 then
        local Attachment, Beam
        table.clear(u375)
        table.clear(u376)
        local Model = Instance.new("Model")
        Model.Name = "CannonPathAimPreview"
        local Part = Instance.new("Part")
        Part.Name = "Root"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Transparency = 1
        Part.Size = Vector3.new(0.1, 0.1, 0.1)
        Part.Parent = Model
        local v1 = 400
        local v2 = 1
        for i = 1, v1, v2 do
            Attachment = Instance.new("Attachment")
            Attachment.Position = Vector3.zero
            Attachment.Parent = Part
            u375[i] = Attachment
        end
        v1 = 399
        v2 = 1
        for j = 1, v1, v2 do
            Beam = Instance.new("Beam")
            Beam.Attachment0 = u375[j]
            Beam.Attachment1 = u375[j + 1]
            Beam.Color = ColorSequence.new(Color3.fromRGB(255, 200, 100))
            Beam.Width0 = 0.25
            Beam.Width1 = 0.25
            Beam.Brightness = 1
            Beam.LightEmission = 0.3
            Beam.LightInfluence = 0.5
            Beam.Parent = Part
            u376[j] = Beam
        end
        local Part_2 = Instance.new("Part")
        Part_2.Name = "BlastRadius"
        Part_2.Shape = Enum.PartType.Ball
        Part_2.Size = Vector3.new(60, 60, 60)
        Part_2.Anchored = true
        Part_2.CanCollide = false
        Part_2.CanQuery = false
        Part_2.CanTouch = false
        Part_2.Material = Enum.Material.Neon
        Part_2.Color = Color3.fromRGB(255, 150, 50)
        Part_2.Transparency = 0.85
        Part_2.Parent = Workspace
        Part_2.Name = "CannonPathBlastRadius"
        u372 = Model
        u373 = Part
        u374 = Part_2
        Model.Parent = Workspace
        return true
    elseif u372.Parent then
        return true
    end
end
local function updatePathPreview(p1) -- Line: 514 -- upvalues: u373 (ref), u375 (val), u376 (val), u374 (ref), u379 (ref), u378 (ref), u377 (ref), ClientAttributesHandler (val)
    local v1
    local v2 = math.min(#p1, 400)
    if v2 < 2 or not u373 then
        return
    end
    local v3 = p1[1]
    u373.CFrame = CFrame.new(v3)
    local v4 = v2
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = u375[i]
        v1.Position = p1[i] - v3
    end
    v4 = v2 - 1
    v5 = 1
    for j = 1, v4, v5 do
        v1 = u376[j]
        v1.FaceCamera = true
        v1 = u376[j]
        v1.Width0 = 0.4
        v1 = u376[j]
        v1.Width1 = 0.15
    end
    v4 = 399
    v5 = 1
    for k = v2, v4, v5 do
        v1 = u376[k]
        v1.FaceCamera = true
        v1 = u376[k]
        v1.Width0 = 0
        v1 = u376[k]
        v1.Width1 = 0
    end
    if u374 then
        local v6
        if not u379 then
            v4 = p1[v2]
            if u378 <= os.clock() then
                u379 = nil
            end
        elseif os.clock() < u378 then
            v4 = u379
        end
        v5 = not u377
        if not v5 then
            v5 = 5 < (v4 - u377).Magnitude
        end
        if v5 then
            u377 = v4
            u374.CFrame = CFrame.new(v4)
        end
        local v7 = ClientAttributesHandler.getAttribute("CannonCanVisualizeExplosion") == 1
        if not v7 then
            v6 = 1
        else
            v6 = 0.85
        end
        u374.Transparency = v6
        v6 = 30 * (ClientAttributesHandler.getAttribute("CannonExplosionRadiusMultiplier") or 1)
        u374.Size = Vector3.new(v6 * 2, v6 * 2, v6 * 2)
    end
end
Cannons.MountedCannonPivot.listen(function(p1, p2) -- Line: 567 -- upvalues: u350 (ref)
    u350 = {position = p1, yawRad = p2}
end)
ClientStateHandler.onServerStateChanged(ClientStateHandler.Server.RAGDOLLED):Connect(function(p1) -- Line: 571 -- upvalues: u347 (ref), requestCannonDismount (val)
    if p1 and u347 then
        requestCannonDismount()
    end
end)
local function loadCannonPoints() -- Line: 580 -- upvalues: Workspace (val)
    local v1, v2
    local v3 = {}
    local CannonPoints = Workspace:FindFirstChild("CannonPoints")
    if not CannonPoints then
        return v3
    end
    local v4 = {}
    for i, j in CannonPoints:GetChildren() do
        if j:IsA("BasePart") then
            table.insert(v4, j)
        elseif not (j:IsA("Model")) then
        end
    end
    table.sort(v4, function(p1, p2) -- Line: 596
        local v1
        local v2 = tonumber(p1.Name)
        local v3 = tonumber(p2.Name)
        if not v2 then
            v1 = p1.Name < p2.Name
            return v1
        end
        if v3 then
            v1 = v2 < v3
            return v1
        end
        v1 = p1.Name < p2.Name
        return v1
    end)
    v1 = v4
    v2 = nil
    local v5 = nil
    for k, n in v1, v2, v5 do
        if n:IsA("BasePart") then
            table.insert(v3, n.CFrame)
        elseif n:IsA("Model") then
            table.insert(v3, n:GetPivot())
        end
    end
    return v3
end
local function findClosestPointIndex(p1, p2) -- Line: 622
    local Magnitude_2, v1, v2
    if #p2 == 0 then
        return 0
    end
    local v3 = 1
    local Magnitude = (p2[1].Position - p1).Magnitude
    local v4 = #p2
    local v5 = 1
    v2, v1 = p2, p1
    for i = 2, v4, v5 do
        Magnitude_2 = (v2[i].Position - v1).Magnitude
        if Magnitude_2 < Magnitude then
            Magnitude = Magnitude_2
            v3 = i
        end
    end
    return v3
end
local function findNextPointInDirection(p1, p2, p3) -- Line: 647 -- upvalues: u357 (ref), u362 (ref), u370 (ref), u358 (ref)
    local v1, v2, v3, v4, v5
    if #u357 == 0 then
        return nil
    end
    local Base = p1:FindFirstChild("Base")
    if not Base then
        return nil
    end
    local RightVector = Base.CFrame.RightVector
    local Position = Base.Position
    if u362 then
        v5 = 0
    elseif not u370 then
        v5 = 0
    else
        v5 = u358
    end
    local v6 = {}
    local v7 = u357
    local v8 = nil
    local v9 = nil
    v1, v4 = p2, p3
    for i, j in v7, v8, v9 do
        if v5 == 0 then
            v2 = v4
            if v2 then
                v2 = i == v4
            end
        else
            v2 = true
            if i == v5 then end
        end
        if not v2 then
            v3 = j.Position - Position
            table.insert(v6, {index = i, dot = v3:Dot(RightVector), distance = v3.Magnitude})
        end
    end
    v7 = {}
    v8 = v6
    v9 = nil
    local v10 = nil
    for k, n in v8, v9, v10 do
        if v1 ~= "right" then
            if v1 == "left" and n.dot < 0 then
                table.insert(v7, n)
            end
        elseif 0 < n.dot then
            table.insert(v7, n)
        end
    end
    if #v7 == 0 then
        return nil
    end
    table.sort(v7, function(p1, p2) -- Line: 696
        local v1 = p1.distance < p2.distance
        return v1
    end)
    return v7[1].index
end
local function startCannonMovement(p1, p2, p3) -- Line: 709 -- upvalues: u362 (ref), u358 (ref), u360 (ref), u364 (ref), u363 (ref), u365 (ref), u359 (ref), u366 (ref), u370 (ref), u354 (ref), Cannons_2 (val), Sounds (val)
    local Base = p1:FindFirstChild("Base")
    if not Base then
        return
    end
    if not u362 and u358 ~= 0 then
        u360 = u358
    end
    local Position = Base.Position
    local Position_2 = p2.Position
    u364 = Position
    u363 = Position_2
    u365 = os.clock()
    u359 = p3
    u366 = (Position - Position_2).Magnitude / 10
    u362 = true
    u370 = false
    if not u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
        local v1 = Sounds.playGlobalSoundEffect(Cannons_2.Rotate, 0.3, 0.3, nil)
        if v1 then
            v1.Looped = true
            u354 = true
        end
    end
end
local function listenForInputs(p1) -- Line: 747 -- upvalues: u347 (ref), u381 (ref), u382 (ref), u348 (ref), u349 (ref), ClientStateHandler (val), States (val), Inventory (val), Character (val), u357 (ref), loadCannonPoints (val), u358 (ref), findClosestPointIndex (val), u356 (ref), useAnimatorObserver (val), Cannons_3 (val), u355 (val), RunService (val), ClientAttributesHandler (val), destroyPathPreview (val), getBarrelPositionAndDirection (val), computeCannonPath (val), ensurePathPreviewModel (val), updatePathPreview (val), ClientSettingsHandler (val), requestCannonDismount (val), u352 (ref), u354 (ref), Cannons_2 (val), Sounds (val), u353 (ref), u369 (ref), u360 (ref), u362 (ref), u367 (ref), u368 (ref), startCannonMovement (val), findNextPointInDirection (val), u351 (ref), Cannons (val), clientHasCannonsCertificate (val), playLocalCannonFireEffects (val), u350 (ref), u364 (ref), u363 (ref), u365 (ref), u366 (ref), Players (val), Workspace (val), u371 (ref), u359 (ref), u370 (ref), u346 (val), u343 (val), normalizeYaw (val), completeCannonDismount (val), Alive (val), isWeldedToCannon (val)
    local Base, Y, Y_2, v1
    if u347 then
        return
    end
    local Attribute = p1:GetAttribute("CannonId")
    if not Attribute then
        return
    end
    u347 = true
    u381 = false
    u382 = false
    u348 = p1
    u349 = tick()
    ClientStateHandler.updateState(States.CANNON_MOUNTED, true)
    local v2 = {hash = 0, offset = 0}
    Inventory.Equip.post(v2)
    local v3 = p1:HasTag("Mounted")
    local u28 = Character.getCharacter()
    if not u28 then
        u347 = false
        return
    end
    u357 = loadCannonPoints()
    local v4 = #u357
    if 0 < v4 then
        Base = p1:FindFirstChild("Base")
        if Base then
            u358 = findClosestPointIndex(Base.Position, u357)
        end
    end
    local Base_2 = p1:FindFirstChild("Base")
    if not Base_2 then
        Y = nil
    else
        Y = Base_2.Position.Y
    end
    local u53 = Y
    Character.getCharacterAsync():andThen(function(p1) -- Line: 791 -- upvalues: u356 (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        u356 = useAnimatorObserver.bind(p1.Humanoid.Animator, Cannons_3, 5)
        useAnimatorObserver.play(Cannons_3.Idle, 0.3)
    end)
    table.insert(u355, RunService.RenderStepped:Connect(function() -- Line: 800 -- upvalues: ClientAttributesHandler (upval), destroyPathPreview (upval), getBarrelPositionAndDirection (upval), p1 (val), computeCannonPath (upval), ensurePathPreviewModel (upval), updatePathPreview (upval)
        local v1, v2
        if ClientAttributesHandler.getAttribute("CannonCanVisualizePath") ~= 1 then
            destroyPathPreview()
            return
        end
        v1, v2 = getBarrelPositionAndDirection(p1)
        if not v1 or not v2 then
            return
        end
        local v3 = computeCannonPath(v1, v2, p1)
        if #v3 < 2 then
            return
        end
        if ensurePathPreviewModel() then
            updatePathPreview(v3)
        end
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Dismount"):Connect(function() -- Line: 821 -- upvalues: requestCannonDismount (upval), p1 (val)
        requestCannonDismount(p1)
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Rotate Left"):Connect(function() -- Line: 828 -- upvalues: u352 (upval), u354 (upval), Cannons_2 (upval), Sounds (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        if u352 == 0 and not u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
            local v1 = Sounds.playGlobalSoundEffect(Cannons_2.Rotate, 0.3, 0.3, nil)
            if v1 then
                v1.Looped = true
                u354 = true
            end
        end
        u352 = 1
        useAnimatorObserver.play(Cannons_3.CannonLeft, 0.2)
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Rotate Right"):Connect(function() -- Line: 848 -- upvalues: u352 (upval), u354 (upval), Cannons_2 (upval), Sounds (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        if u352 == 0 and not u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
            local v1 = Sounds.playGlobalSoundEffect(Cannons_2.Rotate, 0.3, 0.3, nil)
            if v1 then
                v1.Looped = true
                u354 = true
            end
        end
        u352 = -1
        useAnimatorObserver.play(Cannons_3.CannonRight, 0.2)
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Barrel Up"):Connect(function() -- Line: 868 -- upvalues: u353 (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        u353 = -1
        useAnimatorObserver.play(Cannons_3.CannonUp, 0.2)
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Barrel Down"):Connect(function() -- Line: 876 -- upvalues: u353 (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        u353 = 1
        useAnimatorObserver.play(Cannons_3.CannonDown, 0.2)
    end))
    if not v3 then
        table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Move Right"):Connect(function() -- Line: 886 -- upvalues: u357 (upval), u369 (upval), u360 (upval), u358 (upval), u362 (upval), u367 (upval), u368 (upval), startCannonMovement (upval), p1 (val), findNextPointInDirection (upval)
            if #u357 == 0 then
                return
            end
            local v1 = if u369 == "right" then if u360 ~= 0 then if u358 == u360 then u362 else true else false else false
            if v1 then
                u367 = true
                u368 = false
                u369 = "left"
                startCannonMovement(p1, u357[u360], u360)
                return
            end
            u367 = true
            u368 = false
            u369 = "left"
            local v2 = findNextPointInDirection(p1, "left")
            if v2 then
                startCannonMovement(p1, u357[v2], v2)
            end
        end))
        table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Move Left"):Connect(function() -- Line: 918 -- upvalues: u357 (upval), u369 (upval), u360 (upval), u358 (upval), u362 (upval), u368 (upval), u367 (upval), startCannonMovement (upval), p1 (val), findNextPointInDirection (upval)
            if #u357 == 0 then
                return
            end
            local v1 = if u369 == "left" then if u360 ~= 0 then if u358 == u360 then u362 else true else false else false
            if v1 then
                u368 = true
                u367 = false
                u369 = "right"
                startCannonMovement(p1, u357[u360], u360)
                return
            end
            u368 = true
            u367 = false
            u369 = "right"
            local v2 = findNextPointInDirection(p1, "right")
            if v2 then
                startCannonMovement(p1, u357[v2], v2)
            end
        end))
        table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Move Right"):Connect(function() -- Line: 949 -- upvalues: u367 (upval), u362 (upval)
            u367 = false
            u362 = false
        end))
        table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Move Left"):Connect(function() -- Line: 958 -- upvalues: u368 (upval), u362 (upval)
            u368 = false
            u362 = false
        end))
    end
    table.insert(u355, ClientSettingsHandler.onKeybindPressed("Cannon Fire"):Connect(function() -- Line: 967 -- upvalues: u347 (upval), u381 (upval), u351 (upval), Cannons (upval), Attribute (val), Sounds (upval), Cannons_2 (upval), p1 (val), getBarrelPositionAndDirection (upval), clientHasCannonsCertificate (upval), playLocalCannonFireEffects (upval)
        local v1, v2
        if not u347 or u381 then
            return
        end
        local v3 = os.clock() - u351
        if v3 < 5 then
            return
        end
        v3 = Cannons.CannonStates.client()[Attribute]
        if not v3 or v3.ammo < 1 then
            Sounds.playRangedSoundEffect(Cannons_2.EmptyFire, p1, 200, 2)
            return
        end
        u351 = os.clock()
        v1, v2 = getBarrelPositionAndDirection(p1)
        if not v1 then
            Cannons.Event.unreliablePost(p1, "Fire")
        elseif not v2 then
            Cannons.Event.unreliablePost(p1, "Fire")
        else
            Cannons.Event.unreliablePost(p1, "Fire", v1, v2)
        end
        if clientHasCannonsCertificate() then
            playLocalCannonFireEffects(p1, v1, v2)
        end
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Rotate Left"):Connect(function() -- Line: 1003 -- upvalues: u352 (upval), useAnimatorObserver (upval), Cannons_3 (upval), u354 (upval), Cannons_2 (upval), Sounds (upval)
        if u352 == 1 then
            u352 = 0
            useAnimatorObserver.stop(Cannons_3.CannonLeft, 0.2)
            if u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
                Sounds.stopGlobalSoundEffect(Cannons_2.Rotate, 0.3)
                u354 = false
            end
        end
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Rotate Right"):Connect(function() -- Line: 1017 -- upvalues: u352 (upval), useAnimatorObserver (upval), Cannons_3 (upval), u354 (upval), Cannons_2 (upval), Sounds (upval)
        if u352 == -1 then
            u352 = 0
            useAnimatorObserver.stop(Cannons_3.CannonRight, 0.2)
            if u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
                Sounds.stopGlobalSoundEffect(Cannons_2.Rotate, 0.3)
                u354 = false
            end
        end
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Barrel Up"):Connect(function() -- Line: 1031 -- upvalues: u353 (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        if u353 == -1 then
            u353 = 0
            useAnimatorObserver.stop(Cannons_3.CannonUp, 0.2)
        end
    end))
    table.insert(u355, ClientSettingsHandler.onKeybindReleased("Cannon Barrel Down"):Connect(function() -- Line: 1041 -- upvalues: u353 (upval), useAnimatorObserver (upval), Cannons_3 (upval)
        if u353 == 1 then
            u353 = 0
            useAnimatorObserver.stop(Cannons_3.CannonDown, 0.2)
        end
    end))
    local u274 = nil
    local u263 = 0
    local u264 = 0
    local u265 = 0
    local u238 = nil
    local u239 = 0
    local u240 = 0
    local u241 = nil
    local u242 = nil
    local u243 = 0
    local Base_3 = p1:FindFirstChild("Base")
    if Base_3 and Base_3:IsA("BasePart") then
        Y_2 = u53
        if not Y_2 then
            Y_2 = Base_3.Position.Y
        end
        _, v1 = Base_3.CFrame:ToEulerAnglesXYZ()
        u263 = v1
        u264 = v1
        u265 = v1
        u274 = CFrame.new(Base_3.Position.X, Y_2, Base_3.Position.Z)
    end
    table.insert(u355, RunService.RenderStepped:Connect(function() -- Line: 1080 -- upvalues: u347 (upval), u239 (ref), p1 (val), u352 (upval), u362 (upval), u354 (upval), Cannons_2 (upval), Sounds (upval), u274 (ref), u350 (upval), u53 (ref), u263 (ref), u264 (ref), u265 (ref), u364 (upval), u363 (upval), u365 (upval), u366 (upval), Players (upval), Workspace (upval), u238 (ref), u371 (upval), u358 (upval), u360 (upval), u359 (upval), u370 (upval), u357 (upval), u369 (upval), startCannonMovement (upval), u353 (upval), u346 (upval), u343 (upval), u240 (ref), normalizeYaw (upval), u241 (ref), u242 (ref), u243 (ref), Cannons (upval), Character (upval)
        local Position, Y, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        if not u347 then
            return
        end
        if 0 >= u239 then
            v1 = 0
        else
            v1 = os.clock() - u239
        end
        u239 = os.clock()
        local Base = p1:FindFirstChild("Base")
        local Base1 = p1:FindFirstChild("Base1")
        if not Base or not Base1 then
            return
        end
        if u347 then
            if u352 == 0 and not u362 and u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
                Sounds.stopGlobalSoundEffect(Cannons_2.Rotate, 0.3)
                u354 = false
            end
            if u362 and not u354 and Cannons_2.Rotate and Cannons_2.Rotate ~= "rbxassetid://0" then
                local v11 = Sounds.playGlobalSoundEffect(Cannons_2.Rotate, 0.3, 0.3, nil)
                if v11 then
                    v11.Looped = true
                    u354 = true
                end
            end
        end
        local Hull = Base1:FindFirstChild("Hull")
        if u274 ~= nil then
            if u350 then
                local Y_2
                u264 = u350.yawRad
                u265 = u350.yawRad
                u263 = u350.yawRad
                if u53 == nil then
                    Y_2 = u350.position.Y
                else
                    Y_2 = u53
                end
                u274 = CFrame.new(u350.position.X, Y_2, u350.position.Z)
                u350 = nil
            end
        elseif u350 then
            if u53 == nil then
                Y = u350.position.Y
            else
                Y = u53
            end
            u274 = CFrame.new(u350.position.X, Y, u350.position.Z)
            u263 = u350.yawRad
            u264 = u350.yawRad
            u265 = u350.yawRad
            u350 = nil
        end
        if not u347 then
            u371 = 0
            u238 = nil
        elseif u362 and u364 and u363 then
            v8 = (os.clock() - u365) / u366
            v7 = math.min(v8, 1)
            v8 = u364.X + (u363.X - u364.X) * v7
            v9 = u364.Z + (u363.Z - u364.Z) * v7
            local Y_3 = Base.Position.Y
            v10 = Vector3.new(v8, Y_3 + 30, v9)
            v2 = Vector3.new(0, -50, 0)
            v3 = RaycastParams.new()
            v3.FilterType = Enum.RaycastFilterType.Exclude
            v4 = {p1}
            for i, j in Players:GetPlayers() do
                if j.Character then
                    table.insert(v4, j.Character)
                end
            end
            local Cannons_3 = Workspace:FindFirstChild("Cannons")
            if Cannons_3 then
                for k, n in Cannons_3:GetChildren() do
                    if n:IsA("Model") and n ~= p1 then
                        table.insert(v4, n)
                    end
                end
            end
            v3.FilterDescendantsInstances = v4
            v5 = Workspace:Raycast(v10, v2, v3)
            local v12 = if v5 then v5.Position.Y + Base.Size.Y / 2 else Y_3
            if u238 == nil then
                u238 = Y_3
            end
            u238 = math.lerp(u238, v12, 1 - math.exp(math.max(v1, 1e-06) * -8))
            local v13 = Vector3.new(v8, u238, v9)
            u274 = CFrame.new(v13.X, v13.Y, v13.Z)
            if 1 <= v7 and u371 < 1 then
                local v14
                u360 = u358
                u358 = u359
                u370 = true
                if u274 then
                    v14 = CFrame.new(u274.Position)
                    Base.CFrame = v14 * CFrame.Angles(0, u263, 0)
                end
                local v15 = u360 < u358
                v14 = u358 < u360
                local v16 = nil
                if not v15 then
                    if not v14 then
                        if u358 == u360 then
                            if u369 ~= "right" then
                                if u369 == "left" and 1 < u358 then
                                    v16 = u358 - 1
                                end
                            elseif u358 < #u357 then
                                v16 = u358 + 1
                            end
                        end
                    elseif 1 < u358 then
                        v16 = u358 - 1
                        u369 = "left"
                    end
                elseif u358 < #u357 then
                    v16 = u358 + 1
                    u369 = "right"
                end
                if not v16 then
                    u362 = false
                    u364 = nil
                    u363 = nil
                else
                    u360 = u358
                    startCannonMovement(p1, u357[v16], v16)
                end
            end
            u371 = v7
        end
        if not u347 then
            if u347 then
                u265 = u264
            end
        elseif u352 ~= 0 then
            if u352 ~= 1 then
                v8 = -1
            else
                v8 = 1
            end
            v6 = v8 * 1.5 * math.max(v1, 1e-06)
            u265 = u265 + v6
        end
        if u347 then
            u264 = math.lerp(u264, u265, 1 - math.exp(math.max(v1, 1e-06) * -10))
            u263 = u264
        end
        if u347 and Hull and u353 ~= 0 then
            local v17
            if u353 ~= 1 then
                v7 = -1
            else
                v7 = 1
            end
            local C0 = Hull.C0
            v8, v9, v17 = C0:ToEulerAnglesXYZ()
            v10 = math.clamp(v8 + v7 / 100, u346, u343)
            v3 = CFrame.new(C0.Position)
            Hull.C0 = v3 * CFrame.Angles(v10, v9, v17)
        end
        if u274 then
            v7 = CFrame.new(u274.Position)
            Base.CFrame = v7 * CFrame.Angles(0, u263, 0)
            Base.AssemblyLinearVelocity = Vector3.zero
            Base.AssemblyAngularVelocity = Vector3.zero
        end
        v6 = os.clock()
        if u347 then
            v7 = v6 - u240
            if 0.3 <= v7 then
                u240 = v6
                local Pivot = p1:GetPivot()
                if not Base then
                    v10, v2, v3 = Pivot:ToOrientation()
                    v9 = v2
                elseif Base:IsA("BasePart") then
                    v10, v2, v3 = Base.CFrame:ToEulerAnglesXYZ()
                    v9 = v2
                end
                if typeof(v9) == "number" then
                    local v18
                    if not Base then
                        Position = Pivot.Position
                    elseif Base:IsA("BasePart") then
                        Position = Base.Position
                    end
                    v9 = normalizeYaw(v9)
                    if not Hull then
                        v2 = 0
                    else
                        v2 = Hull.C0:ToEulerAnglesXYZ()
                    end
                    v3 = true
                    if u241 ~= nil then
                        v4 = math.abs(v9 - u241)
                        v3 = 0.0001 < v4
                    end
                    v4 = true
                    if u242 ~= nil then
                        v18 = math.abs(v2 - u242)
                        v4 = 0.0001 < v18
                    end
                    v5 = v6 - u243
                    v18 = 1 <= v5
                    if v3 then
                        Cannons.Event.post(p1, "PivotUpdate", Position, v9, v2)
                        u241 = v9
                        u242 = v2
                        u243 = v6
                    elseif not v4 and not v18 then
                    end
                end
            end
        end
        v7 = Character.getCharacter()
        local HumanoidRootPart = v7
        if HumanoidRootPart then
            HumanoidRootPart = v7:FindFirstChild("HumanoidRootPart")
        end
        if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
        end
    end))
    local function onMountedCharacterEnded() -- Line: 1310 -- upvalues: requestCannonDismount (upval)
        requestCannonDismount()
    end
    local Humanoid = u28:FindFirstChild("Humanoid")
    if Humanoid then
        table.insert(u355, Humanoid.Died:Connect(onMountedCharacterEnded))
    end
    table.insert(u355, u28.Destroying:Connect(onMountedCharacterEnded))
    table.insert(u355, RunService.RenderStepped:Connect(function() -- Line: 1322 -- upvalues: u347 (upval), u348 (upval), completeCannonDismount (upval), Alive (upval), u28 (val), requestCannonDismount (upval), u349 (upval), isWeldedToCannon (upval), u382 (upval)
        if not u347 then
            return
        end
        local v1 = u348
        if not v1 or not v1.Parent then
            completeCannonDismount()
            return
        end
        local v2 = Alive.getAliveCharacter(Alive.LocalPlayer)
        if not v2 or v2 ~= u28 then
            requestCannonDismount()
            return
        end
        local v3 = tick() - u349
        if v3 < 1 then
            return
        end
        if isWeldedToCannon(v1, u28) then
            u382 = true
            return
        end
        if u382 then
            requestCannonDismount(v1)
        end
    end))
end
return {
    interacted = function(...) -- Line: 1356 -- upvalues: ClientStateHandler (val), States (val), listenForInputs (val), Interaction (val)
        if ClientStateHandler.isStateBusy(States.CARRYING) or ClientStateHandler.isStateBusy(States.BEING_CARRIED) or ClientStateHandler.isStateBusy(States.CANNON_MOUNTED) or ClientStateHandler.isStateBusy(States.CANNON_RELOADING) then
            return
        end
        local v1 = ...
        if not v1 or not (v1:IsA("BasePart")) then
            return
        end
        local Parent = v1.Parent
        if not Parent or not (Parent:IsA("Model")) or Parent:GetAttribute("Busy") then
            return
        end
        for i, j in Parent:GetDescendants() do
            if j:IsA("BasePart") then
                j.CanCollide = false
            end
        end
        listenForInputs(Parent)
        Interaction.Event.post(...)
    end,
    display = v2,
}