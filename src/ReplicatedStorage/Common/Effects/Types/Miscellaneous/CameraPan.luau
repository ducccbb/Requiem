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
--         File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.CameraPan
--                               Dumped in 0.00254 seconds
--                          Bytecode version 9  |  30 functions

local u97
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
_, u97 = useFieldOfView()
local u103 = Config.define({
    FADE_TIME = 0.5,
    BARS_TWEEN_TIME = 0.15,
    DEFAULT_DISTANCE = 10,
    DEFAULT_DURATION = 5,
    DEFAULT_LERP_SPEED = 1,
    DEFAULT_DOLLY_END_RATIO = 0.5,
    DEFAULT_IMPACT_INTENSITY = 0.35,
    DEFAULT_DRIFT_MAGNITUDE = 0.15,
    DEFAULT_ARC_SWEEP = math.rad(180),
})
local u104 = {
    static = true,
    follow = true,
    orbit = true,
    sky = true,
    ots = true,
    dolly = true,
    lead = true,
    profile = true,
    focus = true,
    hero = true,
    impact = true,
    arc = true,
    topdown = true,
    drift = true,
    mirror = true,
    world = true,
    between = true,
}
local function getFocusPosition(p1) -- Line: 69
    return p1.Position + Vector3.new(0, 1.5, 0)
end
local function getGoalCFrame(p1, p2) -- Line: 73 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    local v2 = p1.Position + p1.CFrame.LookVector * p2 + Vector3.new(0, 1.5, 0)
    return CFrame.lookAt(v2, v1)
end
local function getSkyCFrame(p1, p2) -- Line: 79 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 + p1.CFrame.LookVector * p2 + p1.CFrame.RightVector * p2 + Vector3.yAxis * p2, v1)
end
local function getOrbitCFrame(p1, p2, p3) -- Line: 89 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    local v2 = math.sin(p3) * p2
    local v3 = Vector3.new(v2, 0, math.cos(p3) * p2)
    return CFrame.lookAt(v1 + v3, v1)
end
local function getSideSign(p1) -- Line: 96
    if not p1 then
        return 1
    end
    if p1 < 0 then
        return -1
    end
    return 1
end
local function getOtsCFrame(p1, p2, p3) -- Line: 104 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 - p1.CFrame.LookVector * p2 * 0.75 + p1.CFrame.RightVector * p2 * 0.75 * p3, v1)
end
local function getProfileCFrame(p1, p2, p3) -- Line: 113 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 + p1.CFrame.RightVector * p2 * p3, v1)
end
local function getLeadCFrame(p1, p2) -- Line: 120 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 + p1.CFrame.LookVector * p2 + Vector3.yAxis * (p2 * 0.15), v1)
end
local function getHeroCFrame(p1, p2) -- Line: 127 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    local v2 = v1 + p1.CFrame.LookVector * p2 - Vector3.yAxis * math.min(p2 * 0.3, 3)
    return CFrame.lookAt(v2, v1)
end
local function getMirrorCFrame(p1, p2) -- Line: 136 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 - p1.CFrame.LookVector * p2, v1)
end
local function getTopdownCFrame(p1, p2) -- Line: 143 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    return CFrame.lookAt(v1 + Vector3.yAxis * p2, v1)
end
local function getBetweenCFrame(p1, p2, p3) -- Line: 149 -- upvalues: getFocusPosition (val)
    local v1 = getFocusPosition(p1)
    local v2 = getFocusPosition(p2)
    local Unit = (v2 - v1).Unit
    local v3 = (v1 + v2) / 2 + Unit * p3 + Unit:Cross(Vector3.yAxis).Unit * p3
    return CFrame.lookAt(v3 + Vector3.yAxis * (p3 * 0.35), v2)
end
local function getInitialOrbitAngle(p1) -- Line: 160
    local LookVector = p1.CFrame.LookVector
    return (math.atan2(LookVector.X, LookVector.Z))
end
local function getTargetRoot(p1) -- Line: 166
    local Character = p1.Character
    if not Character then
        return nil
    end
    return (Character:FindFirstChild("HumanoidRootPart"))
end
local function applyShakeOffset(p1, p2, p3) -- Line: 175
    local v1 = math.noise(p2 * 12, 0, 0) * p3
    local v2 = math.noise(0, p2 * 12, 0) * p3 * 0.6
    return p1 + Vector3.new(v1, v2, math.noise(p2 * 12, p2 * 12, 0) * p3)
end
local function applyDriftOffset(p1, p2, p3) -- Line: 185
    local v1 = math.sin(p2 * 1.7) * p3
    local v2 = math.sin(p2 * 2.3) * p3 * 0.5
    return p1 + Vector3.new(v1, v2, math.cos(p2 * 1.9) * p3)
end
local function createGoalPart() -- Line: 195 -- upvalues: Workspace (val)
    local Part = Instance.new("Part")
    Part.Name = "CameraPanGoal"
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Transparency = 1
    Part.Size = Vector3.new(0.1, 0.1, 0.1)
    Part.Parent = Workspace
    return Part
end
local function fadeToBlack(p1) -- Line: 209 -- upvalues: u103 (val)
    p1({enabled = true, tween = TweenInfo.new(u103.FADE_TIME, Enum.EasingStyle.Linear)})
    task.wait(u103.FADE_TIME)
end
local function fadeFromBlack(p1) -- Line: 214 -- upvalues: u103 (val)
    p1({enabled = false, tween = TweenInfo.new(u103.FADE_TIME, Enum.EasingStyle.Linear)})
    task.wait(u103.FADE_TIME)
end
local function applyFadeTransition(p1, p2) -- Line: 219 -- upvalues: fadeToBlack (val), Signals (val), u103 (val), fadeFromBlack (val)
    fadeToBlack(p1)
    Signals.Bars:Fire(0.25, -2)
    task.wait(u103.BARS_TWEEN_TIME)
    p2()
    fadeFromBlack(p1)
end
local function applyFadeOutro(p1, p2) -- Line: 230 -- upvalues: fadeToBlack (val), Signals (val), u103 (val), fadeFromBlack (val)
    fadeToBlack(p1)
    Signals.Bars:Fire(0, -2)
    task.wait(u103.BARS_TWEEN_TIME)
    p2()
    fadeFromBlack(p1)
end
local function runCameraPan(p1, p2) -- Line: 241 -- upvalues: Workspace (val), u103 (val), State (val), createGoalPart (val), getInitialOrbitAngle (val), getGoalCFrame (val), getFocusPosition (val), getSideSign (val), getOrbitCFrame (val), getSkyCFrame (val), getOtsCFrame (val), getLeadCFrame (val), getProfileCFrame (val), getHeroCFrame (val), getMirrorCFrame (val), getTopdownCFrame (val), applyShakeOffset (val), applyDriftOffset (val), getTargetRoot (val), Players (val), getBetweenCFrame (val), RunService (val), applyFadeTransition (val), Signals (val), u97 (val), applyFadeOutro (val)
    local DEFAULT_ARC_SWEEP, Position, fov, speed, speed_2, speed_3, speed_4, u105, u118, u154, u75
    local goto = p1.goto
    if not goto.Parent then
        return
    end
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local distance = p1.distance
    if not distance then
        distance = u103.DEFAULT_DISTANCE
    end
    local u13 = math.max(p1.duration, 0)
    local v1 = string.lower(p1.transition or "snap")
    local black = State("black")
    local u22 = v1 == "lerp"
    if not u22 then
        speed_3 = u103.DEFAULT_LERP_SPEED
    else
        speed_3 = p1.speed
        if not speed_3 then
            speed_3 = u103.DEFAULT_LERP_SPEED
        end
    end
    local u35 = 1 / math.max(speed_3, 0.01)
    local u37 = createGoalPart()
    local u38 = 0
    local u44 = getInitialOrbitAngle(goto)
    local u45 = u44
    if p2 ~= "arc" then
        DEFAULT_ARC_SWEEP = 0
    elseif not u22 then
        DEFAULT_ARC_SWEEP = p1.speed
        if not DEFAULT_ARC_SWEEP then
            DEFAULT_ARC_SWEEP = u103.DEFAULT_ARC_SWEEP
        end
    else
        DEFAULT_ARC_SWEEP = u103.DEFAULT_ARC_SWEEP
    end
    local v2 = 2 * math.pi / math.max(u13, 0.01)
    if p2 ~= "orbit" then
        u75 = p1.speed or v2
    elseif u22 then
        u75 = v2
    end
    if p2 ~= "dolly" then
        speed = distance
    elseif not u22 then
        speed = p1.speed
        if not speed then
            speed = distance * u103.DEFAULT_DOLLY_END_RATIO
        end
    else
        speed = distance * u103.DEFAULT_DOLLY_END_RATIO
    end
    if p2 ~= "static" then
        u105 = nil
    else
        u105 = getGoalCFrame(goto, distance)
    end
    if p2 ~= "world" then
        u118 = nil
    else
        local Position_2 = getGoalCFrame(goto, distance).Position
        u118 = Position_2 - getFocusPosition(goto)
    end
    if p2 ~= "focus" then
        Position = nil
    else
        Position = CurrentCamera.CFrame.Position
    end
    if p2 == "ots" then
        speed_4 = p1.speed
    elseif p2 ~= "profile" then
        speed_4 = nil
    end
    local u144 = getSideSign(speed_4)
    if p2 ~= "impact" then
        u154 = 0
    else
        local speed_5 = p1.speed
        if not speed_5 then
            speed_5 = u103.DEFAULT_IMPACT_INTENSITY
        end
        u154 = math.abs(speed_5)
    end
    if p2 ~= "drift" then
        speed_2 = 0
    else
        speed_2 = p1.speed
        if not speed_2 then
            speed_2 = u103.DEFAULT_DRIFT_MAGNITUDE
        end
    end
    local function updateGoalPart(p1, a2) -- Line: 291 -- upvalues: u38 (ref), p2 (val), u44 (ref), u75 (val), getOrbitCFrame (upval), distance (val), u13 (val), u45 (val), DEFAULT_ARC_SWEEP (val), speed (val), getGoalCFrame (upval), getSkyCFrame (upval), getOtsCFrame (upval), u144 (val), getLeadCFrame (upval), getProfileCFrame (upval), getHeroCFrame (upval), getMirrorCFrame (upval), getTopdownCFrame (upval), applyShakeOffset (upval), u154 (val), applyDriftOffset (upval), speed_2 (val), getFocusPosition (upval), u118 (val), Position (val), getTargetRoot (upval), Players (upval), getBetweenCFrame (upval), u105 (val), u37 (val)
        local v1
        u38 = u38 + a2
        if p2 == "orbit" then
            u44 = u44 + u75 * a2
            v1 = getOrbitCFrame(p1, distance, u44)
        else
            local v2
            if p2 == "arc" then
                v2 = math.clamp(u38 / u13, 0, 1)
                v1 = getOrbitCFrame(p1, distance, u45 + DEFAULT_ARC_SWEEP * v2)
            elseif p2 == "dolly" then
                v2 = math.clamp(u38 / u13, 0, 1)
                v1 = getGoalCFrame(p1, distance + (speed - distance) * v2)
            elseif p2 == "follow" then
                v1 = getGoalCFrame(p1, distance)
            elseif p2 == "sky" then
                v1 = getSkyCFrame(p1, distance)
            elseif p2 == "ots" then
                v1 = getOtsCFrame(p1, distance, u144)
            elseif p2 == "lead" then
                v1 = getLeadCFrame(p1, distance)
            elseif p2 == "profile" then
                v1 = getProfileCFrame(p1, distance, u144)
            elseif p2 == "hero" then
                v1 = getHeroCFrame(p1, distance)
            elseif p2 == "mirror" then
                v1 = getMirrorCFrame(p1, distance)
            elseif p2 == "topdown" then
                v1 = getTopdownCFrame(p1, distance)
            else
                local v3
                if p2 == "impact" then
                    v3 = getGoalCFrame(p1, distance)
                    v1 = applyShakeOffset(v3, u38, u154)
                elseif p2 == "drift" then
                    v3 = getGoalCFrame(p1, distance)
                    v1 = applyDriftOffset(v3, u38, speed_2)
                elseif p2 == "world" then
                    local v4 = getFocusPosition(p1)
                    v1 = CFrame.lookAt(v4 + u118, getFocusPosition(p1))
                elseif p2 == "focus" then
                    v1 = CFrame.lookAt(Position, getFocusPosition(p1))
                elseif p2 == "between" then
                    v2 = getTargetRoot(Players.LocalPlayer)
                    if v2 then
                        v1 = getBetweenCFrame(p1, v2, distance)
                    else
                        v1 = getGoalCFrame(p1, distance)
                    end
                elseif p2 ~= "static" then
                    v1 = getGoalCFrame(p1, distance)
                else
                    v1 = u105
                end
            end
        end
        u37.CFrame = v1
    end
    local u289 = nil
    local function updateCamera(a1) -- Line: 351 -- upvalues: p1 (val), updateGoalPart (val), u22 (val), u35 (val), CurrentCamera (val), u37 (val)
        local v1
        local goto = p1.goto
        if not goto.Parent then
            return
        end
        updateGoalPart(goto, a1)
        if not u22 then
            v1 = 1
        else
            v1 = math.clamp(a1 * u35, 0, 1)
        end
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(u37.CFrame, v1)
    end
    local function startPanConnection() -- Line: 364 -- upvalues: u289 (ref), CurrentCamera (val), RunService (upval), updateCamera (val)
        if u289 then
            return
        end
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        u289 = RunService.RenderStepped:Connect(updateCamera)
    end
    if v1 ~= "fade" then
        Signals.Bars:Fire(0.25, -2)
        startPanConnection()
    else
        applyFadeTransition(black, function() -- Line: 381 -- upvalues: startPanConnection (val), updateCamera (val)
            startPanConnection()
            updateCamera(0)
        end)
    end
    local v3 = if p1.fov then u97("camerapan", p1.fov, "set", 100, TweenInfo.new(u13, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)) else nil
    task.wait(u13)
    ;(function() -- Line: 373 -- upvalues: u289 (ref)
        if u289 then
            u289:Disconnect()
            u289 = nil
        end
    end)()
    u37:Destroy()
    if v1 ~= "fade" then
        Signals.Bars:Fire(0, -2)
        CurrentCamera.CameraType = Enum.CameraType.Custom
    else
        applyFadeOutro(black, function() -- Line: 407 -- upvalues: CurrentCamera (val)
            CurrentCamera.CameraType = Enum.CameraType.Custom
        end)
    end
    if v3 then
        v3(TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
    end
end
return function(p1) -- Line: 422 -- upvalues: u104 (val), runCameraPan (val)
    local v1 = string.lower(p1.mode or "static")
    if u104[v1] then
        runCameraPan(p1, v1)
    end
end