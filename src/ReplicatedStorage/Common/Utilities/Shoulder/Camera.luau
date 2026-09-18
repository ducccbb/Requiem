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
--               File: ReplicatedStorage.Common.Utilities.Shoulder.Camera
--                               Dumped in 0.00163 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local v2 = {RIGHT = 1, LEFT = -1}
local u33 = NumberRange.new(-89, 89)
local Input = require(script.Parent:WaitForChild("Input"))
local Character = LocalPlayer.Character
if not Character then
    Character = LocalPlayer.CharacterAdded:Wait()
end
local Humanoid = Character:WaitForChild("Humanoid")
u12.CameraSettings = {
    Default = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 3,
        Mouse_Sensitivity_Y = 3,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(2.5, 40, 70),
    },
    Attack = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 3,
        Mouse_Sensitivity_Y = 3,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(2.5, 60, 100),
    },
    Armored = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 3,
        Mouse_Sensitivity_Y = 3,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(0, 70, 140),
    },
    Ice = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 3,
        Mouse_Sensitivity_Y = 3,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(0, 70, 140),
    },
    Nestor = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 0.1,
        Mouse_Sensitivity_Y = 0.1,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(2.5, 350, 250),
    },
    Female = {
        Field_Of_View = 70,
        Mouse_Sensitivity_X = 3,
        Mouse_Sensitivity_Y = 3,
        Touch_Sensitivity_X = 3,
        Touch_Sensitivity_Y = 3,
        Gamepad_Sensitivity_X = 10,
        Gamepad_Sensitivity_Y = 10,
        Lerp_Speed = 0.5,
        Character_Rotation_Speed = 0.0175,
        Align_Character = true,
        Lock_Mouse = true,
        Shoulder_Direction = 1,
        Offset = Vector3.new(0, 70, 140),
    },
}
local u89 = nil
local u90 = nil
local u91 = "Default"
u12.HorizontalAngle = 0
u12.VerticalAngle = 0
u12.ShoulderDirection = 1
u12.IsCharacterAligned = false
u12.IsMouseLocked = false
u12.IsEnabled = false
local u98 = nil
local function getHorizontalAngleFromLookVector(p1) -- Line: 145
    local v1
    local v2 = Vector3.new(p1.X, 0, p1.Z)
    if v2.Magnitude < 0.01 then
        return nil
    end
    _, v1 = CFrame.lookAt(Vector3.zero, v2.Unit):ToOrientation()
    return v1
end
local function Lerp(p1, p2, p3) -- Line: 155
    return p1 + (p2 - p1) * p3
end
local function saveDefaultCamera() -- Line: 161 -- upvalues: u89 (ref), u90 (ref), UserInputService (val)
    local CurrentCamera = workspace.CurrentCamera
    u89 = {FieldOfView = CurrentCamera.FieldOfView, CameraSubject = CurrentCamera.CameraSubject, CameraType = CurrentCamera.CameraType}
    u90 = UserInputService.MouseBehavior
end
local function loadDefaultCamera() -- Line: 173 -- upvalues: u89 (ref)
    for k, v in pairs(u89) do
        workspace.CurrentCamera[k] = v
    end
end
local function getDelta() -- Line: 181 -- upvalues: Input (val), UserInputService (val), u12 (val), u91 (ref)
    local Gamepad_Sensitivity_X, Gamepad_Sensitivity_Y
    local v1 = Input.GetDelta()
    if UserInputService.GamepadEnabled then
        Gamepad_Sensitivity_X = u12.CameraSettings[u91].Gamepad_Sensitivity_X
        Gamepad_Sensitivity_Y = u12.CameraSettings[u91].Gamepad_Sensitivity_Y
    elseif not UserInputService.TouchEnabled then
        Gamepad_Sensitivity_X = u12.CameraSettings[u91].Mouse_Sensitivity_X
        Gamepad_Sensitivity_Y = u12.CameraSettings[u91].Mouse_Sensitivity_Y
    else
        Gamepad_Sensitivity_X = u12.CameraSettings[u91].Touch_Sensitivity_X
        Gamepad_Sensitivity_Y = u12.CameraSettings[u91].Touch_Sensitivity_Y
    end
    return Vector2.new(v1.X * Gamepad_Sensitivity_X, v1.Y * Gamepad_Sensitivity_Y)
end
local function configureStateForEnabled() -- Line: 200 -- upvalues: saveDefaultCamera (val), u12 (val), u91 (ref)
    local v1, v2
    saveDefaultCamera()
    u12.setCharacterAlignment(u12.CameraSettings[u91].Align_Character)
    u12.lockMouse(u12.CameraSettings[u91].Lock_Mouse)
    u12.ShoulderDirection = u12.CameraSettings[u91].Shoulder_Direction
    v1, v2 = workspace.CurrentCamera.CFrame:ToOrientation()
    u12.HorizontalAngle = v2
    u12.VerticalAngle = v1
end
local function configureStateForDisabled() -- Line: 217 -- upvalues: u12 (val), loadDefaultCamera (val), UserInputService (val), u90 (ref)
    u12.clearLookAtOverride()
    u12.setCharacterAlignment(false)
    loadDefaultCamera()
    UserInputService.MouseBehavior = u90
    u12.HorizontalAngle = 0
    u12.VerticalAngle = 0
end
local function updateCamera() -- Line: 228 -- upvalues: u12 (val), u91 (ref), getDelta (val), u33 (val), Character (ref), Lerp (val), u98 (ref), getHorizontalAngleFromLookVector (val)
    local HumanoidRootPart, v1
    local CurrentCamera = workspace.CurrentCamera
    local v2 = u12.CameraSettings[u91]
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local v3 = getDelta()
    local v4 = u12
    v4.HorizontalAngle = v4.HorizontalAngle - v3.X / CurrentCamera.ViewportSize.X
    v4 = u12
    v4.VerticalAngle = v4.VerticalAngle - v3.Y / CurrentCamera.ViewportSize.Y
    local v5 = math.deg(u12.VerticalAngle)
    u12.VerticalAngle = math.rad((math.clamp(v5, u33.Min, u33.Max)))
    HumanoidRootPart = if Character ~= nil then Character:FindFirstChild("HumanoidRootPart") else false
    if HumanoidRootPart == nil then
        u12.disable()
        return
    end
    CurrentCamera.FieldOfView = Lerp(CurrentCamera.FieldOfView, v2.Field_Of_View, v2.Lerp_Speed)
    local Offset = v2.Offset
    v5 = Offset.X * u12.ShoulderDirection
    local v6 = CFrame.new(HumanoidRootPart.Position)
    local v7 = v6 * CFrame.Angles(0, u12.HorizontalAngle, 0)
    v5 = v7 * CFrame.Angles(u12.VerticalAngle, 0, 0)
    local v8 = v5 * CFrame.new((Vector3.new(v5, Offset.Y, Offset.Z)))
    v8 = CurrentCamera.CFrame:Lerp(v8, v2.Lerp_Speed)
    v5 = RaycastParams.new()
    v5.FilterDescendantsInstances = {Character}
    v5.FilterType = Enum.RaycastFilterType.Exclude
    local v9 = v8.Position - HumanoidRootPart.Position
    v7 = workspace:Raycast(HumanoidRootPart.Position, v9, v5)
    if v7 ~= nil then
        local Components, Components_10, Components_11, Components_12, Components_2, Components_3, Components_4, Components_5, Components_6
        v6 = v7.Position - HumanoidRootPart.Position
        v1 = HumanoidRootPart.Position + v6.Unit * (v6.Magnitude - 0.1)
        _, _, _, Components_10, Components_11, Components_12, Components, Components_2, Components_3, Components_4, Components_5, Components_6 = v8:GetComponents()
        v8 = CFrame.new(v1.x, v1.y, v1.z, Components_10, Components_11, Components_12, Components, Components_2, Components_3, Components_4, Components_5, Components_6)
    end
    if v2.Align_Character == true and u12.IsCharacterAligned then
        local HorizontalAngle = u12.HorizontalAngle
        if u98 then
            v1 = u98()
            if v1 then
                v9 = getHorizontalAngleFromLookVector(v1)
                if v9 then
                    HorizontalAngle = v9
                end
            end
        end
        v9 = CFrame.new(HumanoidRootPart.Position)
        v1 = v9 * CFrame.Angles(0, HorizontalAngle, 0)
        local v10 = (HumanoidRootPart.CFrame - HumanoidRootPart.CFrame.Position):Lerp(v1 - v1.Position, v2.Character_Rotation_Speed)
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * v10
    end
    CurrentCamera.CFrame = v8
end
function u12.setCharacterAlignment(p1) -- Line: 328 -- upvalues: Humanoid (ref), u12 (val)
    Humanoid.AutoRotate = not p1
    u12.IsCharacterAligned = p1
end
function u12.setLookAtOverride(p1) -- Line: 334 -- upvalues: u98 (ref)
    u98 = p1
end
function u12.clearLookAtOverride() -- Line: 338 -- upvalues: u98 (ref)
    u98 = nil
end
function u12.setLookAtDirection(p1) -- Line: 342 -- upvalues: u12 (val)
    if p1 then
        u12.setLookAtOverride(function() -- Line: 345 -- upvalues: p1 (val)
            return p1
        end)
        return
    end
    u12.clearLookAtOverride()
end
function u12.setCameraMode(p1) -- Line: 353 -- upvalues: u12 (val), u91 (ref)
    if not (u12.CameraSettings[p1]) then
        u91 = "Default"
        return
    end
    u91 = p1
end
function u12.lockMouse(p1) -- Line: 362 -- upvalues: u12 (val), UserInputService (val)
    u12.IsMouseLocked = p1
    if p1 == true then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        return
    end
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end
function u12.enable() -- Line: 371 -- upvalues: u12 (val), configureStateForEnabled (val), RunService (val), updateCamera (val)
    u12.IsEnabled = true
    configureStateForEnabled()
    RunService:BindToRenderStep("OTS_CAMERA", Enum.RenderPriority.Camera.Value - 10, function() -- Line: 375 -- upvalues: u12 (upval), updateCamera (upval)
        if u12.IsEnabled == true then
            updateCamera()
        end
    end)
end
function u12.disable() -- Line: 382 -- upvalues: configureStateForDisabled (val), u12 (val), RunService (val)
    configureStateForDisabled()
    u12.IsEnabled = false
    RunService:UnbindFromRenderStep("OTS_CAMERA")
end
LocalPlayer.CharacterAdded:Connect(function(p1) -- Line: 388 -- upvalues: Character (ref), Humanoid (ref)
    Character = p1
    Humanoid = p1:WaitForChild("Humanoid")
end)
return u12