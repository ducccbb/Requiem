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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Exploration.Spyglass
--                               Dumped in 0.00135 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Spyglass = require(Tools:WaitForChild("Spyglass"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local LocalPlayer = Players.LocalPlayer
local Assets = ReplicatedStorage:FindFirstChild("Assets")
local u135 = Config.define({
    ZOOM_TWEEN_DURATION = 0.5,
    ZOOMED_FOV = 45,
    DEFAULT_FOV = 70,
    MIN_ZOOM_SCROLL_FOV = 1,
    MOUSE_WHEEL_FOV_STEP = 1,
    MOUSE_SENSITIVITY_STEP = 0.008,
    DEFAULT_MOUSE_SENSITIVITY = 1,
    ZOOMED_CAMERA_MIN_DISTANCE = 0,
    ZOOMED_CAMERA_MAX_DISTANCE = 0,
    DEFAULT_CAMERA_MIN_DISTANCE = 0.5,
    DEFAULT_CAMERA_MAX_DISTANCE = 128,
})
local u140 = TweenInfo.new(u135.ZOOM_TWEEN_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local u141 = false
local u142 = nil
local u143 = nil
local u144 = nil
local u145 = nil
return {
    equipped = function(p1) -- Line: 72 -- upvalues: Character (val), u145 (ref), useAnimatorObserver (val), Spyglass (val), Assets (val), LocalPlayer (val), u142 (ref), u143 (ref), UserInputService (val), u141 (ref), TweenService (val), u140 (val), u135 (val), u144 (ref)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 73 -- upvalues: u145 (upval), useAnimatorObserver (upval), Spyglass (upval)
            u145 = useAnimatorObserver.bind(p1.Humanoid.Animator, Spyglass, 4)
        end)
        useAnimatorObserver.play(Spyglass.Equip, 0.1)
        local v1 = Assets.Particles.UI.Telescope:Clone()
        v1.Parent = LocalPlayer.PlayerGui
        local Mouse = LocalPlayer:GetMouse()
        u142 = LocalPlayer:GetMouse().Icon
        useAnimatorObserver.play(Spyglass.Idle, 0.1)
        u143 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 87 -- upvalues: u141 (upval), useAnimatorObserver (upval), Spyglass (upval), Mouse (val), TweenService (upval), LocalPlayer (upval), u140 (upval), u135 (upval), u142 (upval), UserInputService (upval)
            if p2 then
                return
            end
            if p1.KeyCode == Enum.KeyCode.E then
                if u141 ~= false then
                    useAnimatorObserver.stop(Spyglass.Use, 0.5)
                    useAnimatorObserver.stop(Spyglass.UseIdle, 0.5)
                    Mouse.Icon = u142
                    TweenService:Create(LocalPlayer, u140, {CameraMaxZoomDistance = u135.DEFAULT_CAMERA_MAX_DISTANCE, CameraMinZoomDistance = u135.DEFAULT_CAMERA_MIN_DISTANCE}):Play()
                    TweenService:Create(workspace.CurrentCamera, u140, {FieldOfView = u135.DEFAULT_FOV}):Play()
                    TweenService:Create(LocalPlayer.PlayerGui:FindFirstChild("Telescope").ImageLabel, u140, {ImageTransparency = 1, Size = UDim2.new(4, 0, 4, 0)}):Play()
                    UserInputService.MouseDeltaSensitivity = u135.DEFAULT_MOUSE_SENSITIVITY
                    useAnimatorObserver.play(Spyglass.Idle)
                else
                    useAnimatorObserver.stop(Spyglass.Idle)
                    useAnimatorObserver.play(Spyglass.Use, 0.1)
                    Mouse.Icon = ""
                    TweenService:Create(LocalPlayer, u140, {CameraMaxZoomDistance = u135.ZOOMED_CAMERA_MAX_DISTANCE, CameraMinZoomDistance = u135.ZOOMED_CAMERA_MIN_DISTANCE}):Play()
                    TweenService:Create(workspace.CurrentCamera, u140, {FieldOfView = u135.ZOOMED_FOV}):Play()
                    TweenService:Create(LocalPlayer.PlayerGui:FindFirstChild("Telescope").ImageLabel, u140, {ImageTransparency = 0, Size = UDim2.new(1, 0, 1, 0)}):Play()
                    useAnimatorObserver.play(Spyglass.UseIdle, 0.5)
                end
                u141 = not u141
            end
        end)
        u144 = UserInputService.InputChanged:Connect(function(p1, p2) -- Line: 129 -- upvalues: u141 (upval), u135 (upval), UserInputService (upval)
            local CurrentCamera, CurrentCamera_2, v1
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseWheel or not u141 then
                return
            end
            if 0 >= p1.Position.Z then
                if p1.Position.Z < 0 and workspace.CurrentCamera.FieldOfView <= u135.ZOOMED_FOV then
                    CurrentCamera_2 = workspace.CurrentCamera
                    CurrentCamera_2.FieldOfView = CurrentCamera_2.FieldOfView + u135.MOUSE_WHEEL_FOV_STEP
                    v1 = UserInputService
                    v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity + u135.MOUSE_SENSITIVITY_STEP
                end
                return
            end
            if u135.MIN_ZOOM_SCROLL_FOV <= workspace.CurrentCamera.FieldOfView then
                CurrentCamera = workspace.CurrentCamera
                CurrentCamera.FieldOfView = CurrentCamera.FieldOfView - u135.MOUSE_WHEEL_FOV_STEP
                v1 = UserInputService
                v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity - u135.MOUSE_SENSITIVITY_STEP
                return
            end
            if p1.Position.Z < 0 and workspace.CurrentCamera.FieldOfView <= u135.ZOOMED_FOV then
                CurrentCamera_2 = workspace.CurrentCamera
                CurrentCamera_2.FieldOfView = CurrentCamera_2.FieldOfView + u135.MOUSE_WHEEL_FOV_STEP
                v1 = UserInputService
                v1.MouseDeltaSensitivity = v1.MouseDeltaSensitivity + u135.MOUSE_SENSITIVITY_STEP
            end
        end)
    end,
    unequipped = function(p1) -- Line: 149 -- upvalues: LocalPlayer (val), u145 (ref), u142 (ref), TweenService (val), u140 (val), u135 (val), UserInputService (val), u141 (ref), u143 (ref), u144 (ref)
        local Mouse = LocalPlayer:GetMouse()
        if u145 then
            u145()
            u145 = nil
        end
        Mouse.Icon = u142
        TweenService:Create(LocalPlayer, u140, {CameraMaxZoomDistance = u135.DEFAULT_CAMERA_MAX_DISTANCE, CameraMinZoomDistance = u135.DEFAULT_CAMERA_MIN_DISTANCE}):Play()
        TweenService:Create(workspace.CurrentCamera, u140, {FieldOfView = u135.DEFAULT_FOV}):Play()
        TweenService:Create(LocalPlayer.PlayerGui:FindFirstChild("Telescope").ImageLabel, u140, {ImageTransparency = 1, Size = UDim2.new(4, 0, 4, 0)}):Play()
        UserInputService.MouseDeltaSensitivity = u135.DEFAULT_MOUSE_SENSITIVITY
        u141 = false
        u143:Disconnect()
        u144:Disconnect()
        LocalPlayer.PlayerGui:FindFirstChild("Telescope"):Destroy()
    end,
    data = {description = "An item which can be used to view distant objects.", category = require(Types:WaitForChild("Item")).CATEGORIES.Exploration},
}