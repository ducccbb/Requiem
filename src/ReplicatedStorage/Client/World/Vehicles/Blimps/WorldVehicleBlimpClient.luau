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
--     File: ReplicatedStorage.Client.World.Vehicles.Blimps.WorldVehicleBlimpClient
--                               Dumped in 0.00349 seconds
--                          Bytecode version 9  |  33 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local World = Common:WaitForChild("World")
local Vehicles = World:WaitForChild("Vehicles")
local BlimpCrash = require(Vehicles:WaitForChild("BlimpCrash"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local World_2 = Common_2:WaitForChild("World")
local Vehicles_2 = World_2:WaitForChild("Vehicles")
local BlimpEngineAudio = require(Vehicles_2:WaitForChild("BlimpEngineAudio"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local World_3 = Common_3:WaitForChild("World")
local Vehicles_3 = World_3:WaitForChild("Vehicles")
local BlimpPhysics = require(Vehicles_3:WaitForChild("BlimpPhysics"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_4:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Blimps = require(Namespaces:WaitForChild("Blimps"))
require(script.Parent:WaitForChild("WorldVehicleBlimpCrashClient"))
local LocalPlayer = Players.LocalPlayer
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local Controls = require(PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local ENGINE_STARTUP_SECONDS = BlimpEngineAudio.ENGINE_STARTUP_SECONDS
local CRASHING_ATTRIBUTE = BlimpCrash.CRASHING_ATTRIBUTE
local u142 = nil
local u143 = 0
local function isTyping() -- Line: 85 -- upvalues: UserInputService (val)
    local v1 = UserInputService:GetFocusedTextBox() ~= nil
    return v1
end
local function isBlimpCrashing(p1) -- Line: 94 -- upvalues: CRASHING_ATTRIBUTE (val)
    local v1 = p1:GetAttribute(CRASHING_ATTRIBUTE) == true
    return v1
end
local function getAxisInput() -- Line: 102 -- upvalues: isTyping (val), UserInputService (val)
    if isTyping() then
        return 0, 0, 0
    end
    local v1 = 0
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        v1 = v1 + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        v1 = v1 - 1
    end
    local v2 = 0
    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
        v2 = v2 + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.E) then
        v2 = v2 - 1
    end
    local v3 = 0
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        v3 = v3 + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        v3 = v3 - 1
    end
    return v1, v2, v3
end
local function applyCharacterExitVelocity(p1, p2, p3) -- Line: 141 -- upvalues: RunService (val)
    local u3 = nil
    local function cleanupExitMover() -- Line: 144 -- upvalues: u3 (ref), p2 (val)
        if u3 then
            u3:Disconnect()
            u3 = nil
        end
        local BlimpExitLinearVelocity = p2:FindFirstChild("BlimpExitLinearVelocity")
        if BlimpExitLinearVelocity then
            BlimpExitLinearVelocity:Destroy()
        end
        local BlimpExitAttachment = p2:FindFirstChild("BlimpExitAttachment")
        if BlimpExitAttachment then
            BlimpExitAttachment:Destroy()
        end
    end
    local function beginExitVelocityHold() -- Line: 161 -- upvalues: cleanupExitMover (val), p2 (val), p3 (val), u3 (ref), RunService (upval)
        cleanupExitMover()
        local Attachment = Instance.new("Attachment")
        Attachment.Name = "BlimpExitAttachment"
        Attachment.Parent = p2
        local LinearVelocity = Instance.new("LinearVelocity")
        LinearVelocity.Name = "BlimpExitLinearVelocity"
        LinearVelocity.Attachment0 = Attachment
        LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        LinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
        LinearVelocity.VectorVelocity = p3
        LinearVelocity.MaxForce = 1000000
        LinearVelocity.Parent = p2
        p2.AssemblyLinearVelocity = p3
        p2.AssemblyAngularVelocity = Vector3.zero
        local u20 = 0
        u3 = RunService.PostSimulation:Connect(function(p1) -- Line: 181 -- upvalues: p2 (upval), cleanupExitMover (upval), u20 (ref), LinearVelocity (val), p3 (upval)
            if not p2.Parent then
                cleanupExitMover()
                return
            end
            u20 = u20 + p1
            LinearVelocity.VectorVelocity = p3
            p2.AssemblyLinearVelocity = p3
            p2.AssemblyAngularVelocity = Vector3.zero
            if 0.25 <= u20 then
                cleanupExitMover()
            end
        end)
    end
    local function whenSeatReleased() -- Line: 198 -- upvalues: beginExitVelocityHold (val)
        task.defer(beginExitVelocityHold)
    end
    if not p1.SeatPart then
        whenSeatReleased()
    else
        local u8 = nil
        local PropertyChangedSignal = p1:GetPropertyChangedSignal("SeatPart")
    end
end
local function destroyBlimpConstraints(p1) -- Line: 226
    for i, j in p1:GetChildren() do
        if not (j:IsA("Attachment")) then
            if not (j:IsA("LinearVelocity")) then
                if not (j:IsA("AngularVelocity")) then
                    if j:IsA("AlignOrientation") and j.Name == "BlimpRollAlignOrientation" then
                        j:Destroy()
                    end
                elseif j.Name == "BlimpAngularVelocity" then
                end
            elseif j.Name == "BlimpLinearVelocity" then
            end
        elseif j.Name == "BlimpAttachment" then
        end
    end
end
local function createBlimpConstraints(p1) -- Line: 244 -- upvalues: destroyBlimpConstraints (val), BlimpPhysics (val)
    destroyBlimpConstraints(p1)
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "BlimpAttachment"
    Attachment.Parent = p1
    local LinearVelocity = Instance.new("LinearVelocity")
    LinearVelocity.Name = "BlimpLinearVelocity"
    LinearVelocity.Attachment0 = Attachment
    LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    LinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
    LinearVelocity.ForceLimitMode = Enum.ForceLimitMode.PerAxis
    LinearVelocity.MaxAxesForce = BlimpPhysics.LINEAR_MAX_AXES_FORCE
    LinearVelocity.MaxForce = BlimpPhysics.LINEAR_MAX_AXES_FORCE.X
    LinearVelocity.VectorVelocity = Vector3.zero
    LinearVelocity.Parent = p1
    local AngularVelocity = Instance.new("AngularVelocity")
    AngularVelocity.Name = "BlimpAngularVelocity"
    AngularVelocity.Attachment0 = Attachment
    AngularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
    AngularVelocity.MaxTorque = BlimpPhysics.ANGULAR_MAX_TORQUE
    AngularVelocity.AngularVelocity = Vector3.zero
    AngularVelocity.Parent = p1
    return Attachment, LinearVelocity, AngularVelocity, (BlimpPhysics.createRollAlign(Attachment))
end
local function requestEngineToggle(p1, p2) -- Line: 281 -- upvalues: Blimps (val)
    p1.model:SetAttribute("EngineEnabled", p2)
    Blimps.EngineToggle.post(p1.model, p2)
end
local function requestBlimpHorn(p1) -- Line: 291 -- upvalues: Blimps (val)
    Blimps.Horn.post(p1.model)
end
local function requestBlimpLightsToggle(p1) -- Line: 300 -- upvalues: Blimps (val)
    Blimps.LightsToggle.post(p1.model)
end
local function shutdownBlimpEngine(p1) -- Line: 309 -- upvalues: requestEngineToggle (val)
    p1.engineStartupId = p1.engineStartupId + 1
    p1.engineStarting = false
    p1.engineReady = false
    requestEngineToggle(p1, false)
end
local function beginBlimpEngineStartup(p1) -- Line: 321 -- upvalues: requestEngineToggle (val), ENGINE_STARTUP_SECONDS (val)
    p1.engineStartupId = p1.engineStartupId + 1
    local engineStartupId = p1.engineStartupId
    p1.engineStarting = true
    p1.engineReady = false
    requestEngineToggle(p1, true)
    task.delay(ENGINE_STARTUP_SECONDS, function() -- Line: 329 -- upvalues: p1 (val), engineStartupId (val)
        if p1.engineStartupId ~= engineStartupId then
            return
        end
        p1.engineStarting = false
        p1.engineReady = true
    end)
end
local function isEngineRunningOnServer(p1) -- Line: 344
    if p1:GetAttribute("EngineEnabled") ~= true then
        return false
    end
    local v1 = typeof(p1:GetAttribute("EngineStartupAt")) == "number"
    return v1
end
local function toggleBlimpEngine() -- Line: 356 -- upvalues: u142 (ref), isTyping (val), isBlimpCrashing (val), isEngineRunningOnServer (val), shutdownBlimpEngine (val), beginBlimpEngineStartup (val)
    local v1 = u142
    if not v1 or v1.dismounting or isTyping() or isBlimpCrashing(v1.model) then
        return
    end
    if v1.engineStarting or v1.engineReady or isEngineRunningOnServer(v1.model) then
        shutdownBlimpEngine(v1)
        return
    end
    beginBlimpEngineStartup(v1)
end
local function endBlimpSession() -- Line: 373 -- upvalues: u142 (ref), destroyBlimpConstraints (val), Controls (val)
    local v1 = u142
    if not v1 then
        return
    end
    u142 = nil
    v1.engineStartupId = v1.engineStartupId + 1
    local connections = v1.connections
    local v2 = nil
    local v3 = nil
    for i, j in connections, v2, v3 do
        j:Disconnect()
    end
    destroyBlimpConstraints(v1.root)
    if v1.controlsDisabled then
        Controls:Enable()
    end
end
local function onUpdateBlimpControl(p1, p2) -- Line: 400 -- upvalues: isBlimpCrashing (val), endBlimpSession (val), isTyping (val), getAxisInput (val), UserInputService (val), BlimpPhysics (val)
    local v1, v2, v3
    local root = p1.root
    if not root.Parent or isBlimpCrashing(p1.model) then
        endBlimpSession()
        return
    end
    local v4 = 0
    local v5 = 0
    local v6 = false
    local v7 = false
    if p1.engineReady and not p1.dismounting and not (isTyping()) then
        _, v2, v3 = getAxisInput()
        v4 = v2
        v5 = v3
        local v8 = UserInputService:IsKeyDown(Enum.KeyCode.W)
        local v9 = UserInputService:IsKeyDown(Enum.KeyCode.S)
        local v10 = v8
        if v10 then
            v10 = not v9
        end
        v6 = v10
        v7 = v9
    end
    if not p1.dismounting then
        v1 = {holdingForward = v6, holdingBrake = v7, verticalInput = v4, yawInput = v5}
    else
        v1 = BlimpPhysics.getCoastInput()
    end
    v2 = {forwardSpeed = p1.forwardSpeed, verticalSpeed = p1.verticalSpeed, yawSpeed = p1.yawSpeed, roll = p1.roll}
    if p1.dismounting then
        v3 = select(1, BlimpPhysics.stepRetainedMotion(v2, root, p2))
    elseif p1.engineReady then
        v3 = select(1, BlimpPhysics.stepMotion(v2, root, v1, p2))
        p1.forwardSpeed = v2.forwardSpeed
        p1.verticalSpeed = v2.verticalSpeed
        p1.yawSpeed = v2.yawSpeed
    else
        v3 = select(1, BlimpPhysics.stepEngineOff(v2, root, p2))
        p1.forwardSpeed = v2.forwardSpeed
        p1.verticalSpeed = v2.verticalSpeed
        p1.yawSpeed = v2.yawSpeed
    end
    p1.roll = v2.roll
    p1.yaw = p1.yaw + p1.yawSpeed * p2
    p1.linearVelocity.VectorVelocity = v3
    p1.angularVelocity.AngularVelocity = Vector3.zero
    root.AssemblyLinearVelocity = v3
    root.AssemblyAngularVelocity = Vector3.zero
    BlimpPhysics.updateRollAlign(p1.rollAlign, root, p1.yaw, p1.roll)
end
local function waitForBlimpControlReady(p1, p2) -- Line: 473 -- upvalues: isBlimpCrashing (val), LocalPlayer (val), RunService (val)
    local Attribute, v1, v2
    local v3 = os.clock() + 3
    v1, v2 = p1, p2
    while os.clock() < v3 do
        if isBlimpCrashing(v1) then
            return false
        end
        Attribute = v1:GetAttribute("Driver")
        if Attribute == LocalPlayer.UserId and not v2.Anchored then
            return true
        end
        RunService.Heartbeat:Wait()
    end
    local v4 = not isBlimpCrashing(v1)
    if v4 then
        v4 = false
        local Attribute_2 = v1:GetAttribute("Driver")
        if Attribute_2 == LocalPlayer.UserId then
            v4 = not v2.Anchored
        end
    end
    return v4
end
local function attemptBlimpDismount() -- Line: 495 -- upvalues: u142 (ref), isTyping (val), u143 (ref), LocalPlayer (val), Blimps (val), applyCharacterExitVelocity (val)
    local v1 = u142
    if not v1 or isTyping() then
        return
    end
    local v2 = os.clock()
    local v3 = v2 - u143
    if v3 < 0.5 then
        return
    end
    local Character = LocalPlayer.Character
    if not Character then
        return
    end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid or Humanoid.SeatPart ~= v1.seat then
        return
    end
    u143 = v2
    local root = v1.root
    local AssemblyLinearVelocity = root.AssemblyLinearVelocity
    root.AssemblyLinearVelocity = AssemblyLinearVelocity
    root.AssemblyAngularVelocity = Vector3.zero
    Blimps.Dismount.post(v1.model, root.Position, v1.yaw, v1.forwardSpeed, v1.verticalSpeed, {yawSpeed = v1.yawSpeed, roll = v1.roll})
    v1.dismounting = true
    Humanoid.Sit = false
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        applyCharacterExitVelocity(Humanoid, HumanoidRootPart, AssemblyLinearVelocity)
    end
end
local function onBlimpDrivingInputBegan(p1, p2) -- Line: 557 -- upvalues: isTyping (val), u142 (ref), isBlimpCrashing (val), attemptBlimpDismount (val), toggleBlimpEngine (val), requestBlimpHorn (val), requestBlimpLightsToggle (val)
    if isTyping() then
        return
    end
    local v1 = u142
    if not v1 or v1.dismounting or isBlimpCrashing(v1.model) then
        return
    end
    if p1.KeyCode == Enum.KeyCode.Space then
        attemptBlimpDismount()
        return
    end
    if p1.KeyCode == Enum.KeyCode.X then
        toggleBlimpEngine()
        return
    end
    if p1.KeyCode == Enum.KeyCode.H then
        requestBlimpHorn(v1)
        return
    end
    if p1.KeyCode == Enum.KeyCode.F then
        requestBlimpLightsToggle(v1)
    end
end
local function beginBlimpSession(p1, p2) -- Line: 584 -- upvalues: isBlimpCrashing (val), u142 (ref), endBlimpSession (val), BlimpPhysics (val), waitForBlimpControlReady (val), createBlimpConstraints (val), Controls (val), isEngineRunningOnServer (val), RunService (val), onUpdateBlimpControl (val), LocalPlayer (val), UserInputService (val), attemptBlimpDismount (val), CRASHING_ATTRIBUTE (val), onBlimpDrivingInputBegan (val)
    if isBlimpCrashing(p1) then
        return
    end
    if not u142 then
        local v1, v2, v3, v4
        endBlimpSession()
        local Root = p1:FindFirstChild("Root")
        local Seat = p1:FindFirstChild("Seat")
        if not Root or not (Root:IsA("BasePart")) or not Seat or not (Seat:IsA("Seat")) then
            return
        end
        local forwardSpeed = 0
        local verticalSpeed = 0
        local yawSpeed = 0
        local yaw = BlimpPhysics.getHorizontalYaw(Root)
        if p2 then
            v2 = CFrame.new(p2.position)
            p1:PivotTo(v2 * CFrame.Angles(0, p2.yaw, 0))
            forwardSpeed = p2.forwardSpeed
            verticalSpeed = p2.verticalSpeed
            yawSpeed = p2.yawSpeed
            yaw = p2.yaw
        end
        if not (waitForBlimpControlReady(p1, Root)) then
            return
        end
        v3, v4, v1, v2 = createBlimpConstraints(Root)
        Controls:Disable()
        local v5 = isEngineRunningOnServer(p1)
        local u70 = {
            engineStartupId = 0,
            controlsDisabled = true,
            dismounting = false,
            engineStarting = false,
            roll = 0,
            model = p1,
            root = Root,
            seat = Seat,
            attachment = v3,
            linearVelocity = v4,
            angularVelocity = v1,
            rollAlign = v2,
            connections = {},
            engineReady = v5,
            forwardSpeed = forwardSpeed,
            verticalSpeed = verticalSpeed,
            yawSpeed = yawSpeed,
            yaw = yaw,
        }
        u142 = u70
        local v6 = {forwardSpeed = u70.forwardSpeed, verticalSpeed = u70.verticalSpeed, yawSpeed = u70.yawSpeed, roll = u70.roll}
        local v7 = BlimpPhysics.stepRetainedMotion(v6, Root, 0)
        u70.roll = v6.roll
        u70.linearVelocity.VectorVelocity = v7
        u70.angularVelocity.AngularVelocity = Vector3.zero
        Root.AssemblyLinearVelocity = v7
        Root.AssemblyAngularVelocity = Vector3.zero
        BlimpPhysics.updateRollAlign(v2, Root, u70.yaw, u70.roll)
        table.insert(u70.connections, RunService.Heartbeat:Connect(function(p1) -- Line: 664 -- upvalues: onUpdateBlimpControl (upval), u70 (val)
            onUpdateBlimpControl(u70, p1)
        end))
        local connections_2 = u70.connections
        local PropertyChangedSignal = Seat:GetPropertyChangedSignal("Occupant")
        table.insert(connections_2, PropertyChangedSignal:Connect(function() -- Line: 671 -- upvalues: Seat (val), u70 (val), endBlimpSession (upval), LocalPlayer (upval)
            local Occupant = Seat.Occupant
            if Occupant then
                if Occupant.Parent ~= LocalPlayer.Character then
                    endBlimpSession()
                end
                return
            end
            if u70.dismounting then
                return
            end
            endBlimpSession()
        end))
        table.insert(u70.connections, p1.AncestryChanged:Connect(function(p1, p2) -- Line: 691 -- upvalues: endBlimpSession (upval)
            if p2 == nil then
                endBlimpSession()
            end
        end))
        table.insert(u70.connections, UserInputService.JumpRequest:Connect(function() -- Line: 700 -- upvalues: attemptBlimpDismount (upval)
            attemptBlimpDismount()
        end))
        local connections_5 = u70.connections
        local AttributeChangedSignal = p1:GetAttributeChangedSignal(CRASHING_ATTRIBUTE)
        table.insert(connections_5, AttributeChangedSignal:Connect(function() -- Line: 707 -- upvalues: isBlimpCrashing (upval), p1 (val), endBlimpSession (upval)
            if isBlimpCrashing(p1) then
                endBlimpSession()
            end
        end))
        table.insert(u70.connections, UserInputService.InputBegan:Connect(onBlimpDrivingInputBegan))
        return
    elseif u142.model == p1 then
        return
    end
end
Blimps.Mounted.listen(function(p1, p2) -- Line: 719 -- upvalues: isBlimpCrashing (val), beginBlimpSession (val)
    if typeof(p1) ~= "Instance" or not (p1:IsA("Model")) or isBlimpCrashing(p1) then
        return
    end
    beginBlimpSession(p1, p2)
end)
Blimps.Dismounted.listen(function(p1) -- Line: 731 -- upvalues: u142 (ref), endBlimpSession (val)
    if u142 then
        endBlimpSession()
    end
end)
return {}