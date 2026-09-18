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
--        File: ReplicatedStorage.Client.User.Editor.Universal.UserFreecamHandler
--                               Dumped in 0.00247 seconds
--                          Bytecode version 9  |  14 functions

local u169
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Miscellaneous = require(Namespaces:WaitForChild("Miscellaneous"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Signal = require(Utilities_2:WaitForChild("Signal"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Chunk = Common_4:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local State = v1.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local Builder = v1.Parent.Parent:WaitForChild("Builder")
local UserBuildingHandler = require(Builder:WaitForChild("UserBuildingHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
_, u169 = require(Statistics:WaitForChild("useWalkSpeed"))()
local u171 = trove.new()
local u173 = Signal.new()
local function getPlayerControlModule() -- Line: 59 -- upvalues: Players (val)
    local ControlModule = Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("ControlModule")
    return require(ControlModule)
end
local function onEnableFreecam() -- Line: 73 -- upvalues: Character (val), getPlayerControlModule (val), UserBuildingHandler (val), ClientStateHandler (val), States (val), UserInputService (val), RunService (val), Zone (val), u173 (val), u171 (val), u169 (val)
    local v1
    local CurrentCamera = workspace.CurrentCamera
    _, v1 = Character.getCharacterAsync():await()
    local HumanoidRootPart = v1.HumanoidRootPart
    local CFrame = CurrentCamera.CFrame
    local LookVector = CurrentCamera.CFrame.LookVector
    local u16 = math.atan2(LookVector.Z, LookVector.X)
    local v2 = LookVector.X ^ 2
    local u27 = math.atan2(LookVector.Y, (math.sqrt(v2 + LookVector.Z ^ 2)))
    local v3 = math.cos(u16)
    v2 = v3 * math.cos(u27)
    v3 = math.sin(u27)
    local v4 = math.sin(u16)
    local v5 = v4 * math.cos(u27)
    local u49 = Vector3.new(v2, v3, v5)
    local u51 = getPlayerControlModule()
    local u52 = 0
    local isSandboxMode = UserBuildingHandler.isSandboxMode
    if not isSandboxMode then
        isSandboxMode = ClientStateHandler.isStateBusy(States.STAFF_FREECAM)
    end
    local function getMovement() -- Line: 111 -- upvalues: u51 (val)
        return u51:GetMoveVector()
    end
    local function getSpeed() -- Line: 116 -- upvalues: UserInputService (upval), u52 (ref)
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            return 0.25
        end
        return math.clamp((u52 - 0.5) / 9.5, 0, 1) * 4.5 + 0.5
    end
    local function getTransformation() -- Line: 135 -- upvalues: CFrame (ref), u16 (ref), u27 (ref), u49 (ref)
        local Position = CFrame.Position
        local v1 = math.cos(u16)
        local v2 = v1 * math.cos(u27)
        v1 = math.sin(u27)
        local v3 = math.sin(u16)
        local v4 = v3 * math.cos(u27)
        u49 = Vector3.new(v2, v1, v4)
        return CFrame.new(Position, Position + Vector3.new(v2, v1, v4))
    end
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local v6 = RunService.RenderStepped:Connect(function(p1) -- Line: 150 -- upvalues: UserInputService (upval), getMovement (val), u52 (ref), getSpeed (val), getTransformation (val), UserBuildingHandler (upval), ClientStateHandler (upval), States (upval), Zone (upval), CFrame (ref), u49 (ref), CurrentCamera (val), isSandboxMode (val), HumanoidRootPart (val)
        local v1, v2
        if UserInputService:GetFocusedTextBox() then
            return
        end
        local v3 = getMovement()
        local v4 = UserInputService:IsKeyDown(Enum.KeyCode.E)
        local v5 = UserInputService:IsKeyDown(Enum.KeyCode.Q)
        local v6 = Vector3.new(0, 0, 0)
        if not v4 then
            v2 = 0
        else
            v2 = 1
        end
        if not v5 then
            v2 = 0
        else
            v2 = 1
        end
        v6 = v6 + Vector3.new(0, v2) - Vector3.new(0, v2)
        if (v3 + v6).Magnitude > 0 then
            u52 = u52 + p1
        else
            u52 = 0
        end
        local v7 = getTransformation() * CFrame.new((v3 + v6) * getSpeed())
        if UserBuildingHandler.isSandboxMode or ClientStateHandler.isStateBusy(States.STAFF_FREECAM) then
            CFrame = v7
            v1 = CFrame.new(CFrame.Position, CFrame.Position + u49)
            CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(v1, 0.4)
            if isSandboxMode then
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                HumanoidRootPart.CFrame = CurrentCamera.CFrame
            end
            return
        end
        v2 = UserBuildingHandler.getAccessibleZoneBoundary(v7)
        if not v2 then
            return warn("No zone found for freecam")
        end
        CFrame = Zone.clampCFrameToZone(v7, v2)
        v1 = CFrame.new(CFrame.Position, CFrame.Position + u49)
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(v1, 0.4)
        if isSandboxMode then
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            HumanoidRootPart.CFrame = CurrentCamera.CFrame
        end
    end)
    local v7 = UserInputService.InputChanged:Connect(function(p1, p2) -- Line: 206 -- upvalues: UserInputService (upval), u27 (ref), u16 (ref), CurrentCamera (val), CFrame (ref)
        local Position, v1, v2
        if p1.UserInputType == Enum.UserInputType.MouseMovement and not (UserInputService:IsKeyDown(Enum.KeyCode.Z)) then
            local v3 = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCurrentPosition
            if v3 then
                v1 = p1.Delta.X * 0.004
                v2 = math.clamp(u27 + -p1.Delta.Y * 0.004, -math.pi / 2 + 0.01, math.pi / 2 - 0.01)
                u16 = u16 + v1
                u27 = v2
            end
        end
        if p1.UserInputType ~= Enum.UserInputType.MouseWheel or UserInputService:GetFocusedTextBox() then
            return
        end
        local MouseLocation = UserInputService:GetMouseLocation()
        v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
        local v4 = RaycastParams.new()
        v4.FilterType = Enum.RaycastFilterType.Exclude
        v4.FilterDescendantsInstances = {CurrentCamera}
        v2 = workspace:Raycast(v1.Origin, v1.Direction * 1000, v4)
        if not v2 then
            Position = v1.Origin + v1.Direction * 1000
        else
            Position = v2.Position
            if not Position then
                Position = v1.Origin + v1.Direction * 1000
            end
        end
        CFrame = CFrame + (Position - CFrame.Position).Unit * (p1.Position.Z * 15)
    end)
    local v8 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 254 -- upvalues: UserInputService (upval)
        if p1.UserInputType == Enum.UserInputType.MouseButton2 then
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
        end
    end)
    local v9 = UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 261 -- upvalues: UserInputService (upval)
        if p1.UserInputType == Enum.UserInputType.MouseButton2 then
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    end)
    local v10 = u173:Connect(function(p1) -- Line: 267 -- upvalues: CFrame (ref), u16 (ref), u27 (ref), u49 (ref)
        CFrame = p1
        local LookVector = p1.LookVector
        u16 = math.atan2(LookVector.Z, LookVector.X)
        local v1 = LookVector.X ^ 2
        u27 = math.atan2(LookVector.Y, (math.sqrt(v1 + LookVector.Z ^ 2)))
        v1 = math.cos(u16)
        local v2 = v1 * math.cos(u27)
        v1 = math.sin(u27)
        local v3 = math.sin(u16)
        local v4 = v3 * math.cos(u27)
        u49 = Vector3.new(v2, v1, v4)
    end)
    u171:Add(v6)
    u171:Add(v7)
    u171:Add(v8)
    u171:Add(v9)
    u171:Add(u173)
    u171:Add(v10)
    local u137 = u169("freecam", 0, "set", 999)
    u171:Add(function() -- Line: 301 -- upvalues: UserBuildingHandler (upval), ClientStateHandler (upval), States (upval), Character (upval), CFrame (ref), UserInputService (upval), CurrentCamera (val), u137 (val)
        if UserBuildingHandler.isSandboxMode then
            local Unit, v1
            _, v1 = Character.getCharacterAsync():await()
            local HumanoidRootPart = v1.HumanoidRootPart
            local v2 = CFrame.Position + CFrame.LookVector * 5
            local LookVector = CFrame.LookVector
            local v3 = Vector3.new(LookVector.X, 0, LookVector.Z)
            if 0 >= v3.Magnitude then
                local LookVector_2 = HumanoidRootPart.CFrame.LookVector
                Unit = Vector3.new(LookVector_2.X, 0, LookVector_2.Z).Unit
            else
                Unit = v3.Unit
            end
            HumanoidRootPart.CFrame = CFrame.new(v2, v2 + Unit)
        elseif not (ClientStateHandler.isStateBusy(States.STAFF_FREECAM)) then
        end
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        CurrentCamera.CameraType = Enum.CameraType.Custom
        u137()
    end)
end
Miscellaneous.Freecam.listen(function(p1) -- Line: 358 -- upvalues: ClientStateHandler (val), States (val)
    local v1 = p1 == 1
    ClientStateHandler.updateState(States.FREECAM, v1)
    ClientStateHandler.updateState(States.STAFF_FREECAM, v1)
end)
ClientStateHandler.onStateChanged(States.FREECAM):Connect(function() -- Line: 337 -- upvalues: ClientStateHandler (val), States (val), u171 (val), onEnableFreecam (val)
    local v1 = ClientStateHandler.isStateBusy(States.FREECAM)
    u171:Clean()
    if not v1 then
        return
    end
    onEnableFreecam()
end)
return {onTeleportCamera = u173}